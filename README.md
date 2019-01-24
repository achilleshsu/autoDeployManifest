# 簡易部屬服務步驟

1. 透過git 下載 
```
git clone https://github.com/achilleshsu/autoDeployManifest.git
```
1. 確認部屬環境是production或是stage
2. 進入 production 或是 stage 資料夾
```
cd autoDeployManifest/production
```
```
cd autoDeployManifest/stage
```
3. 執行佈署指令 (IOT-Hub請參考步驟四)
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

4. IOT-Hub 佈署方式
* 請先使用vi 編輯檔案中標示 #need_to_change 的位置，除了prometheus帳號密碼位置
* 執行下列佈署指令產生 password。
* 查看 ../password-vars.yml 檔案將帳號密碼填回prometheus帳號密碼位置
* 再次執行下列指令
※ 備註，部份的release版本需要一致，否則會出現錯誤
(production)
```
bosh -e spacex deploy -d apps-iothub-production apps-iothub-production.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-iothub-production ops-iothub-production.yml --vars-store ../password-vars.yml
```
(stage)
```
bosh -e spacex deploy -d apps-iothub-stage apps-iothub-stage.yml --vars-store ../password-vars.yml
bosh -e spacex deploy -d ops-iothub-stage ops-iothub-stage.yml --vars-store ../password-vars.yml
```

