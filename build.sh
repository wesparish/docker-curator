#!/bin/bash

docker build -t wesparish/curator:5.4.1-1.2 . && \
  docker push wesparish/curator:5.4.1-1.2
