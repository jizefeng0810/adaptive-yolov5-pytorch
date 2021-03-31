echo 'PID:' $$

log_path=./logs/log_test_20201223.txt

nohup \
stdbuf -oL \
python test.py \
--data './data/bdd.yaml' \
--weights 'runs/train/exp6/weights/best.pt' \
--img 640 \
--conf 0.001 \
--iou 0.65 \
2>&1 1>$log_path &

python test.py --data ./data/bdd.yaml --weights runs/train/bdd_all_map.509/weights/best.pt --img 640 --conf 0.001 --iou 0.5

python test.py --data ./data/bdd_night.yaml --weights runs/train/bdd_daytime_map.485/weights/best.pt --img 640 --conf 0.001 --iou 0.5

python test.py --data ./data/cityscapes.yaml --weights runs/train/exp38/weights/last.pt --img 640 --conf 0.001 --iou 0.5

python test.py --data ./data/foggy_cityscapes.yaml --weights runs/train/exp37/weights/best.pt --img 640 --conf 0.001 --iou 0.5
python test.py --data ./data/foggy_cityscapes.yaml --weights runs/train/exp83/weights/best.pt --img 640 --conf 0.001 --iou 0.5