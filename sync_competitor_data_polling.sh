#!/usr/bin/env bash

mkdir /data/competitor/
aws s3 sync s3://emr-gift-sin/daily_competitor_user_id/sync/ /data/competitor/ --exclude *$