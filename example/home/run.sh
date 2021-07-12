#!/bin/bash

>&2 echo "Hello from stderr"
>&1 echo "Hello from stdout"
exec 2>/dev/null
>&2 echo "this is stderr"
>&1 echo "this is stdout"
timeout 60 /bin/bash
