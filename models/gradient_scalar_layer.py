import torch


class _GradientScalarLayer(torch.autograd.Function):
    @staticmethod
    def forward(ctx, input, weight, alpha):
        ctx.weight = weight
        ctx.alpha = alpha
        return input.view_as(input)

    @staticmethod
    def backward(ctx, grad_output):
        grad_input = grad_output.clone()
        return ctx.weight*grad_input*ctx.alpha, None, None

gradient_scalar = _GradientScalarLayer.apply


class GradientScalarLayer(torch.nn.Module):
    def __init__(self, weight):
        super(GradientScalarLayer, self).__init__()
        self.weight = weight
        self.alpha = 1.0

    def forward(self, input, alpha=1.0):
        self.alpha = alpha
        return gradient_scalar(input, self.weight, self.alpha)

    def __repr__(self):
        tmpstr = self.__class__.__name__ + "("
        tmpstr += "weight=" + str(self.weight * self.alpha)
        tmpstr += ")"
        return tmpstr