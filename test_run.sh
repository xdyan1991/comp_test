#!/bin/bash
curl -d '
{
    "country" : "IN"
}
' "127.0.0.1:9986/competitor"
