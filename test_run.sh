#!/bin/bash
curl -d '
{
    "country" : "IN";out
}
' "127.0.0.1:9986/competitor"
