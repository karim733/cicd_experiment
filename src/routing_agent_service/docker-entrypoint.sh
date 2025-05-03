#!/bin/bash

python routing_agent_service.py --server_ip 0.0.0.0 --server_port 8001 \
       --ft_endpoint http://ft_test_service:8002/sft/inference \
       --rag_endpoint http://rag_test_service:8003/rag/str