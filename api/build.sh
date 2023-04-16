#!/bin/bash

source .env

# Dockerイメージのビルド
docker build -t gcr.io/${GCR_PROJECT_ID}/${IMAGE_TAG} .