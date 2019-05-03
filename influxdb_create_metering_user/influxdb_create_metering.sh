#!/bin/bash

influxdb_username=`(bosh int /opt/spacex/workspaces/autoDeployManifest/password-vars.yml --path /ops_influxdb_production_root)`
influxdb_password=`(bosh int /opt/spacex/workspaces/autoDeployManifest/password-vars.yml --path /ops_influxdb_production_root_password)`
metering_username=`(bosh int /opt/spacex/workspaces/autoDeployManifest/password-vars.yml --path /ops_influxdb_production_metering_root)`
metering_password=`(bosh int /opt/spacex/workspaces/autoDeployManifest/password-vars.yml --path /ops_influxdb_production_metering_root_password)`
metering_database=`(bosh int /opt/spacex/workspaces/autoDeployManifest/password-vars.yml --path /ops_influxdb_production_metering_database)`

influx -host 10.100.48.121 -username $influxdb_username -password $influxdb_password -database 'test' --execute "CREATE USER \"$metering_username\" WITH PASSWORD '$metering_password'"
influx -host 10.100.48.121 -username $influxdb_username -password $influxdb_password -database 'test' --execute "CREATE DATABASE \"$metering_database\""
influx -host 10.100.48.121 -username $influxdb_username -password $influxdb_password -database 'test' --execute "GRANT ALL ON \"$metering_database\" TO \"$metering_username\""
