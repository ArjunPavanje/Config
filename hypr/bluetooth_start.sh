#!/bin/bash
bluetoothctl power on
bluetoothctl agent on
bluetoothctl default-agent
bluetoothctl pairable on
bluetoothctl discoverable on

