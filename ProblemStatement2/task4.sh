#!/bin/bash
URL="http://google.com"
CHECK_INTERVAL=60  # Interval between checks in seconds

check_application_status() {
    HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")
    if [ "$HTTP_STATUS" -eq 200 ]; then
        echo "Website is up"
    else
        echo "Website is down"
    fi
}

while true; do
    STATUS=$(check_application_status)
    echo "Application status: $STATUS"
    sleep $CHECK_INTERVAL
done
