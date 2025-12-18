class Ball {
  int x, y, w, h, speed;

  Ball(int x, int y) {
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    speed = (int) (Math.random() * 4 + 1);
  }

  void display() {
   fill(127);
   ellipse(x, y, w, h);
  }

  void move() {
    x = x + speed;

    if (x > width - w/2) {
      speed = speed * -1;
      x = width - w/2;
    }
    
    if (x < w/2) {
      speed = speed * -1;
      x = w/2;
    }
  }
}
