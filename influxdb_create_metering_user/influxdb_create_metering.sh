#!/bin/bash

sudo dpkg -i influxdb_1.6.1_amd64.deb
export influxdb_username=`(bosh int password-vars.yml --path /ops_influxdb_production_root)`
export influxdb_password=`(bosh int password-vars.yml --path /ops_influxdb_production_root_password)`
export metering_username=`(bosh int password-vars.yml --path /ops_influxdb_production_metering_root)`
export metering_password=`(bosh int password-vars.yml --path /ops_influxdb_production_metering_root_password)`
export metering_database=`(bosh int password-vars.yml --path /ops_influxdb_production_metering_database)`

influx -host 10.100.48.121 -username $influxdb_username -password $influxdb_password -database 'test' --execute "CREATE USER \"$metering_username\" WITH PASSWORD '$metering_password'"
influx -host 10.100.48.121 -username $influxdb_username -password $influxdb_password -database 'test' --execute "CREATE DATABASE \"$metering_database\""
influx -host 10.100.48.121 -username $influxdb_username -password $influxdb_password -database 'test' --execute "GRANT ALL ON \"$metering_database\" TO \"$metering_username\""

unset influxdb_username
unset influxdb_password
unset metering_username
unset metering_password
unset metering_database
