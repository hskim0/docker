#!/bin/bash

# docker build -f webgui.Dockerfile -t hskim:webgui .
docker build -f rapidsai_jupyter_webgui.Dockerfile -t hskim:webgui-gpu .