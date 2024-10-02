import { S3Client, GetObjectCommand } from '@aws-sdk/client-s3'
import { SQSEvent } from 'aws-lambda'
import { Readable } from 'stream'

const s3Client = new S3Client({})

const streamToString = (stream: Readable): Promise<string> =>
  new Promise((resolve, reject) => {
    const chunks: Buffer[] = []
    stream.on('data', (chunk) => chunks.push(Buffer.from(chunk)))
    stream.on('error', reject)
    stream.on('end', () => resolve(Buffer.concat(chunks).toString('utf-8')))
  })

export const handler = async (event: SQSEvent): Promise<void> => {
  if (Array.isArray(event.Records)) {
    const recordPromises = event.Records.map(async (record) => {
      const parsedBody = JSON.parse(record.body)

      if (Array.isArray(parsedBody?.Records)) {
        const s3Promises = parsedBody.Records.map(async (s3Record: any) => {
          const bucketName = s3Record?.s3?.bucket?.name
          const objectKey = s3Record?.s3?.object?.key

          if (bucketName && objectKey) {
            try {
              const s3Object = await s3Client.send(
                new GetObjectCommand({ Bucket: bucketName, Key: objectKey })
              )

              const fileContent = await streamToString(
                s3Object.Body as Readable
              )
              console.log('Content of the JSON file:', fileContent)
            } catch (error) {
              console.error('Error fetching object from S3:', error)
            }
          }
        })

        await Promise.all(s3Promises)
      }
    })

    await Promise.all(recordPromises)
  }
}
