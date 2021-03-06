import torch
c = torch.rand(8, 4)
# 拆分成4份
c1, c2 = c.chunk(2, dim=0)
print(c1.shape, c2.shape)