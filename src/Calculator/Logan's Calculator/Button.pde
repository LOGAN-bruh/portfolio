class Button {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean over;

  //Constructor
  Button(int x, int y, int w, int h, char val, color c1, color c2) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.val=val;
    this.c1=c1;
    this.c2=c2;
    over = false;
  }

  //Member Methods
  void display() {
    rectMode(CENTER);
    if (over == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 4); //button size 4=curve
    fill(225);
    textAlign(CENTER, CENTER);
    fill(0);
    text(val, x, y);
  }

  void hover (int tempX, int tempY) {
    if (x>tempX-w/2 && x<tempX+w/2 && y>tempY-h/2 && y<tempY+h/2) {
      over = true;
    } else {
      over=false;
    }
  }
}
