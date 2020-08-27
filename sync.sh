#!/bin/bash

rsync -rtuv ./* h2:/apps/pktgen-dpdk
rsync -am --include='*.pcap' --exclude='*' h2:/apps/pktgen-dpdk/* ./
