#!/usr/bin/env bash
sshpass -p habopen ssh -q -p 8101 openhab@localhost 'openhab:users list'
