#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -euo pipefail

mvn_cmd="mvn ${BUILD_MVN_OPTS:-} ${BUILD_MVN_OPTS_QUARKUS_UPDATE:-}"

source <(curl -s https://raw.githubusercontent.com/kiegroup/kogito-pipelines/main/dsl/seed/scripts/install_quarkus.sh)

echo "Update project with Quarkus version ${QUARKUS_VERSION}"

set -x

# Update with Quarkus version and commit
${mvn_cmd} \
    -DremotePom=io.quarkus:quarkus-bom:${QUARKUS_VERSION} \
    -DupdatePropertyVersions=true \
    -DupdateDependencies=true \
    -DgenerateBackupPoms=false \
    versions:compare-dependencies

${mvn_cmd} \
    -Dproperty=version.io.quarkus \
    -DnewVersion=${QUARKUS_VERSION} \
    -DgenerateBackupPoms=false \
    -Dmaven.wagon.http.ssl.insecure=true \
    versions:set-property
