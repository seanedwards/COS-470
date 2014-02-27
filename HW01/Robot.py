import sys
sys.path.append("/usr/local/lib/python2.7/site-packages/")

import PIL.ImageTk as ImageTk
from myro import *

init("/dev/tty.IPRE6-296352-DevB")

p = takePicture("color")
show(p)

for i in range(0, 4):
    p = takePicture("color")
    savePicture(p, "Picture%d.png" % i)
    forward(0.5, 0.65)
    turnRight(0.25, 0.5)

p = takePicture("color")
savePicture(p, "PictureFin.png")
