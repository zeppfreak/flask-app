source .env

# GCRへイメージをプッシュ
## 事前にサービスアカウントとサービスアカウントキーを認証情報をJSON形式でダウンロードしておく必要がある。
## ref: https://medium.com/infrastructure-adventures/docker-registry-login-with-google-cloud-service-accounts-6bd528bed134
echo ${GOOGLE_APPLICATION_CREDENTIALS}
docker login -u _json_key --password-stdin  https://gcr.io < ${GOOGLE_APPLICATION_CREDENTIALS}
docker push gcr.io/${GCR_PROJECT_ID}/${IMAGE_TAG}

gcloud container clusters get-credentials ${CLUSTER_NAME} --region ${REGION} --project ${GCR_PROJECT_ID}
kubectl apply -f deployment.yaml  