#!/bin/bash

if [ -z "${SSH_ORIGINAL_COMMAND}" ]; then
        echo "This script can only be executed via SSH remote calls"
        exit
fi
case $SSH_ORIGINAL_COMMAND in
     "hostname"*)
         $SSH_ORIGINAL_COMMAND
         ;;
     "/usr/local/nagios/libexec/"*)
         $SSH_ORIGINAL_COMMAND
         ;;
     "check_mk_agent")
         check_mk_agent
         ;;
    *)
        echo "Permission denied. Unauthorized command"
        exit 1
        ;;
esac

