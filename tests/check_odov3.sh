#!/usr/bin/env bash

set -x

# Source shared utilities
source "$(dirname "$0")/paths_util.sh"

# Parse all arguments
parse_arguments "$@"

# Restore positional parameters
set -- "${POSITIONAL_ARGS[@]}"

# Set defaults for stack arguments
set_stack_defaults

args=""

if [ ! -z "${1}" ]; then
  args="-odoPath ${1} ${args}"
fi

ginkgo run --mod=readonly --procs 2 \
  --skip="stack: java-openliberty-gradle version: 0.4.0 starter: rest" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-cache-example-redhat" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-cache-example" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-circuit-breaker-example-redhat" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-circuit-breaker-example" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-crud-example-redhat" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-crud-example" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-configmap-example" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-http-example-redhat" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-secured-http-example" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-istio-circuit-breaker-booster" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-istio-distributed-tracing-booster" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-istio-routing-booster" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-istio-security-booster" \
  --skip="stack: java-vertx version: 1.2.0 starter: vertx-messaging-work-queue-booster" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-cache-example-redhat" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-cache-example" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-circuit-breaker-example-redhat" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-circuit-breaker-example" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-crud-example-redhat" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-crud-example" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-configmap-example" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-http-example-redhat" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-secured-http-example" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-istio-circuit-breaker-booster" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-istio-distributed-tracing-booster" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-istio-routing-booster" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-istio-security-booster" \
  --skip="stack: java-vertx version: 1.3.0 starter: vertx-messaging-work-queue-booster" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-cache-example-redhat" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-cache-example" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-circuit-breaker-example-redhat" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-circuit-breaker-example" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-crud-example-redhat" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-crud-example" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-configmap-example" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-http-example-redhat" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-secured-http-example" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-istio-circuit-breaker-booster" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-istio-distributed-tracing-booster" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-istio-routing-booster" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-istio-security-booster" \
  --skip="stack: java-vertx version: 1.4.0 starter: vertx-messaging-work-queue-booster" \
  --skip="stack: java-websphereliberty-gradle version: 0.4.0 starter: rest" \
  --skip="stack: jhipster-online" \
  --skip="stack: kaoto" \
  --skip="stack: java-wildfly-bootable-jar" \
  --skip="stack: java-wildfly" \
  --skip="stack: java-openliberty" \
  --skip="stack: java-websphereliberty" \
  --skip="stack: java-quarkus" \
  --skip="stack: ollama" \
  --slow-spec-threshold 120s \
  --timeout 3h \
  tests/odov3 -- -stacksPath "$stacksPath" -stackDirs "$stackDirs" ${args}
