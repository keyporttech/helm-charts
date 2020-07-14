#!/bin/bash

# Copyright 2020 Keyporttech Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
mkdir -p .cr-release-packages
releases=$(curl https://api.github.com/repos/keyporttech/helm-charts/releases)
for row in $(echo "${releases}" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
   file_name=$(echo $(_jq '.assets[0].name'))
   download_url=$(echo $(_jq '.assets[0].browser_download_url'))
   curl -o .cr-release-packages/$file_name -LO $download_url
done
