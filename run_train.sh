echo 'PID:' $$

log_path=./logs/log_20201223.txt

nohup \
stdbuf -oL \
python train.py \
--data './data/bdd.yaml' \
--batch-size 128 \
--weights 'weights/yolov5s.pt' \
--cfg yolov5s.yaml \
2>&1 1>$log_path &

# tensorboard --logdir=/data1/zefeng/code/yolov5/runs/train/exp6


python train.py --sdata ./data/cityscapes.yaml --tdata ./data/foggy_cityscapes.yaml --epochs 200 --batch-size 32 --weights ./weights/yolov5s.pt --cfg yolos.yaml

python train.py --sdata ./data/cityscapes.yaml --tdata ./data/foggy_cityscapes.yaml --epochs 200 --batch-size 32 --weights runs/train/exp40/weights/last.pt --cfg yolos.yaml --resume