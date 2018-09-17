# 簡易部屬服務步驟

1. 透過git 下載 
```
git clone https://github.com/achilleshsu/autoDeployManifest.git
```
1. 確認部屬環境是production或是stage
2. 進入 production 或是 stage 資料夾
```
cd autoDeployManifest/postgresql 
```
```
cd autoDeployManifest/stage
```
3. 執行佈署指令(全部服務)
(production)
```
bosh -e spacex deploy -d apps-postgresql-production apps-postgresql-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-postgresql-production ops-postgresql-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d apps-mongodb-production apps-mongodb-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d apps-influxdb-production apps-influxdb-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-influxdb-production ops-influxdb-production.yml --vars-store ../password-vars.yml
```
(stage)
```
bosh -e spacex deploy -d apps-postgresql-stage apps-postgresql-stage.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-postgresql-stage ops-postgresql-stage.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d apps-mongodb-stage apps-mongodb-stage.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d apps-influxdb-stage apps-influxdb-stage.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-influxdb-stage ops-influxdb-stage.yml --vars-store ../password-vars.yml
```