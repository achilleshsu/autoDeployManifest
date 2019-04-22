# 簡易部屬服務步驟

1. 透過git 下載 
```
git clone https://github.com/achilleshsu/autoDeployManifest.git
``` 
2. 進入 production 
```
cd autoDeployManifest/production
```
3. 執行佈署指令 (IOT-Hub請參考步驟四)
(production)
```
bosh -e spacex deploy -d apps-postgresql-production apps-postgresql-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-postgresql-production ops-postgresql-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d apps-mongodb-production apps-mongodb-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d apps-influxdb-production apps-influxdb-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-influxdb-production ops-influxdb-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-influxdb-healthcheck ops-influxdb-healthcheck.yml --vars-store ../password-vars.yml
```
