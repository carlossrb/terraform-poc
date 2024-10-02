#!/bin/bash

cd ../lambda

yarn install

yarn build

rm -f ../lambda.zip

cd dist

zip -r ../../lambda.zip ./*

cd ../../
