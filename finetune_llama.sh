my_pid=$$
echo "save file: job_$my_pid.log"

# source /home/fuxu/work/oneflow/build/source.sh

rm -r /data0/home/fuxu/libai/new5/sft_result

# bash tools/train.sh tools/train_net.py projects/Llama/configs/test_llama_config.py 8
# 使用nsys存储相关的运行信息
# nsys profile --trace=cuda --output=/data0/home/fuxu/job_$my_pid.qdrep bash tools/train.sh projects/Llama/train_net.py projects/Llama/configs/llama_sft.py 8 >> job_$my_pid.log 2>&1
nsys profile \
    --trace=nvtx --delay=62 --duration=6 --output=/data0/home/fuxu/job_$my_pid.qdrep bash tools/train.sh tools/train_net.py projects/Llama/configs/test_llama_config.py 8 >> job_$my_pid.log 2>&1
# nsys profile \
#     --trace=cuda,nvtx --delay=70 --duration=45 --output=/data0/home/fuxu/job_$my_pid.qdrep bash tools/train.sh tools/train_net.py projects/Llama/configs/test_llama_config.py 8 >> job_$my_pid.log 2>&1


# bash tools/train.sh tools/train_net.py projects/Llama/configs/test_llama_config.py 8 >> job_$my_pid.log 2>&1