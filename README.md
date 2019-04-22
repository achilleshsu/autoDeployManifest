# 簡易部屬服務步驟

1. 透過git 下載 
```
git clone https://github.com/achilleshsu/autoDeployManifest.git -b privateCloud
``` 
2. 進入 production 
```
cd autoDeployManifest/production
```
3. 執行佈署指令 (production)
```
bosh -e spacex deploy -d apps-postgresql-production apps-postgresql-production.yml --vars-store ../password-vars.yml --ops-file ../operations/apps-postgresql-production-operations.yml
bosh -e spacex deploy -d ops-postgresql-production ops-postgresql-production.yml --vars-store ../password-vars.yml --ops-file ../operations/ops-postgresql-production-operations.yml
bosh -e spacex deploy -d apps-mongodb-production apps-mongodb-production.yml --vars-store ../password-vars.yml --ops-file ../operations/apps-mongodb-production-operations.yml
bosh -e spacex deploy -d apps-influxdb-production apps-influxdb-production.yml --vars-store ../password-vars.yml --ops-file ../operations/apps-influxdb-production-operations.yml
bosh -e spacex deploy -d ops-influxdb-production ops-influxdb-production.yml --vars-store ../password-vars.yml --ops-file ../operations/ops-influxdb-production-operations.yml
bosh -e spacex deploy -d ops-influxdb-healthcheck ops-influxdb-healthcheck.yml --vars-store ../password-vars.yml --ops-file ../operations/ops-influxdb-healthcheck-operations.yml
```

備註: 私有雲DB使用清單

服務名稱 | 數量 | IP | disk_size(GB) | vm_type(GB) | cpu (core) | mem (GB)
---|:-------|:-----|:----|:---|:----|:------
apps-influxdb-production | 1 | * | 512 | medium | 4 | 16
ops-influxdb-healthcheck | 1 | * | 512 | small-lowmem | 2 | 4
ops-influxdb-production | 1 | * | 512 | small-lowmem | 2 | 4
apps-postgresql-production | 2 | * | 128 | medium | 4 | 16
ops-postgresql-production | 2 | * | 128 | small | 2 | 8
apps-mongodb-production | 3 | * | 512 | medium | 4 | 16		
總和 | 10 | * | 3584 | | 32 | 120





