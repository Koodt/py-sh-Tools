#!/bin/bash

virtualenv -p python3 venvName
source venvName/bin/activate
pip install -e /path/to/pack/
