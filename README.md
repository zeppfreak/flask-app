## GKEクラスタの作成
```sh
gcloud container clusters create my-cluster \
    --zone asia-northeast2-a \
    --num-nodes 1 \
    --machine-type n1-standard-1
gcloud container clusters list
```
## GKEクラスタの削除
```sh
gcloud container clusters delete my-cluster --region "asia-northeast2-a" --project "ornate-course-263801"
```

## ビルド＆デプロイ
```sh
cd api
chmod u+x build.sh
./build.sh
chmod u+x deploy.sh
./deploy.sh
```

## k8s servicesの疎通テスト
```sh
# EXTERNAL-IPを確認
kubectl get services
# 疎通確認
curl http://${EXTERNAL_IP}:80
```

## ローカルでのflaskサーバ起動
```sh
python3 -m venv venv
source venv/bin/activate
cd api
pip install -r requirements.txt
flask run
```