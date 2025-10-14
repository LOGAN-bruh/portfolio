// Logan Bywater | 25 September 2025 | Calculator
Button[] buttons = new Button[12];
Button[] numButtons = new Button[10];
int num = 0;
float l, r, result;
String dVal;
String op;
boolean left;
boolean resetOnNextInput = false;

void setup() {
  size(210, 290);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  dVal = "0.0";
  op = "";
  left = true;
  numButtons[0] = new Button(65, 245, 30, 30, '0', #AAA68F, #918C73);
  numButtons[1] = new Button(25, 205, 30, 30, '1', #AAA68F, #918C73);
  numButtons[2] = new Button(65, 205, 30, 30, '2', #AAA68F, #918C73);
  numButtons[3] = new Button(105, 205, 30, 30, '3', #AAA68F, #918C73);
  numButtons[4] = new Button(25, 165, 30, 30, '4', #AAA68F, #918C73);
  numButtons[5] = new Button(65, 165, 30, 30, '5', #AAA68F, #918C73);
  numButtons[6] = new Button(105, 165, 30, 30, '6', #AAA68F, #918C73);
  numButtons[7] = new Button(25, 125, 30, 30, '7', #AAA68F, #918C73);
  numButtons[8] = new Button(65, 125, 30, 30, '8', #AAA68F, #918C73);
  numButtons[9] = new Button(105, 125, 30, 30, '9', #AAA68F, #918C73);
  buttons[0] = new Button(25, 85, 30, 30, 'C', #FFFFFF, #CCCCCC);
  buttons[1] = new Button(65, 85, 30, 30, 'D', #FFFFFF, #CCCCCC);
  buttons[2] = new Button(105, 85, 30, 30, 'R', #FFFFFF, #CCCCCC);
  buttons[3] = new Button(25, 245, 30, 30, '±', #AAA68F, #918C73);
  buttons[4] = new Button(105, 245, 30, 30, '.', #AAA68F, #918C73);
  buttons[5] = new Button(145, 125, 30, 30, '÷', #FF8808, #A34F00);
  buttons[6] = new Button(185, 125, 30, 30, '^', #FF8808, #A34F00);
  buttons[7] = new Button(145, 165, 30, 30, 'x', #FF8808, #A34F00);
  buttons[8] = new Button(185, 165, 30, 30, '√', #FF8808, #A34F00);
  buttons[9] = new Button(145, 205, 30, 30, '+', #FF8808, #A34F00);
  buttons[10] = new Button(145, 245, 30, 30, '-', #FF8808, #A34F00);
  buttons[11] = new Button(185, 225, 30, 70, '=', #FF8808, #A34F00);
}

void draw() {
  background(#C7C1A3);
  fill(#C0C0C0);
  rect(165, 85, 70, 30, 4);
  fill(0);
  textAlign(CENTER);
  text("Apple Computer Inc.® (1977)", 105, 279);
  textSize(13);
  text("A p p l e II", 166, 83);
  line(135, 97, 195, 97);
  textSize(9);
  text("C a l c u l a t o r", 166, 94);
  line(30, 283, 180, 283);
  for (int i = 0; i<buttons.length; i++) {
    textSize(15);
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void mousePressed() {
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].over &&  buttons[i].val == '+') {
      dVal = "0.0";
      left = false;
      op = "+";
    } else if (buttons[i].over &&  buttons[i].val == '=') {
      performCalculation();
    } else if (buttons[i].over &&  buttons[i].val == 'x') {
      dVal = "0.0";
      left = false;
      op = "*";
    }
    if (buttons[i].over && buttons[i].val == '.') {
      if (resetOnNextInput) {
        dVal = "0";
        resetOnNextInput = false;
      }

      if (!dVal.contains(".")) {
        dVal += ".";
      }

      if (left) {
        l = float(dVal);
      } else {
        r = float(dVal);
      }
    } else if (buttons[i].over &&  buttons[i].val == 'D') {
      if (dVal.equals("0") || dVal.equals("0.0") || dVal.equals("Error :(")) return;
      dVal = dVal.substring(0, dVal.length() - 1);
      if (dVal.length() == 0 || dVal.equals("-") || dVal.equals(".")) {
        dVal = "0.0";
        if (left) {
          l = float(dVal);
        } else {
          r = float(dVal);
        }
      }
    } else if (buttons[i].over &&  buttons[i].val == 'R') {
      op = "R";
      performCalculation();
      left = true;
    } else if (buttons[i].over &&  buttons[i].val == '÷') {
      dVal = "0.0";
      left = false;
      op = "/";
    } else if (buttons[i].over &&  buttons[i].val == '±') {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].over &&  buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].over &&  buttons[i].val == '^') {
      dVal = "0.0";
      left = false;
      op = "^";
    } else if (buttons[i].over &&  buttons[i].val == 'C') {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0.0";
      op = "C";
      left = true;
    } else if (buttons[i].over &&  buttons[i].val == '-') {
      dVal = "0.0";
      left = false;
      op = "-";
    }
  }



  for (int i = 0; i < numButtons.length; i++) {
    if (dVal.length() < 18 && numButtons[i].over) {
      char digit = numButtons[i].val;
      if (resetOnNextInput) {
        dVal = "0.0";
        resetOnNextInput = false;
      }
      if (left) {
        if (dVal.equals("0.0") || dVal.equals("0")) {
          dVal = String.valueOf(digit);
        } else {
          dVal += digit;
        }
        l = float(dVal);
      } else {
        if (dVal.equals("0.0") || dVal.equals("0")) {
          dVal = String.valueOf(digit);
        } else {
          dVal += digit;
        }
        r = float(dVal);
      }
    }
  }
  println("l: " + l);
  println("r: " + r);
  println("result: " + result);
  println("left: " + left);
  println("op: " + op);
}

void updateDisplay() {
  rectMode(CENTER);
  fill(#1B3620);
  rect(105, 35, 190, 50, 4);
  fill(#39FF14);
  textSize(30);
  textAlign(RIGHT);
  if (dVal.length()<12) {
    textSize(30);
  } else if (dVal.length ()>=12) {
    textSize(20);
  }
  text(dVal, width-15, 53);
  textSize(12);
}

void performCalculation() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("*")) {
    if (r == 0) {
      dVal = "Error :(";
      return;
    } else {
      result = l*r;
    }
  } else if (op.equals("/")) {
    if (r == 0) {
      dVal = "Error :(";
      return;
    } else {
      result = l/r;
    }
  } else if (op.equals("^")) {
    result = pow(l, r);
  } else if (op.equals("√")) {
    result = sqrt(r);
  } else if (op.equals("R")) {
    result = round(l);
  }
  if (result == int(result)) {
    dVal = str(int(result));
  } else {
    dVal = str(result);
  }
  resetOnNextInput = true;
  l = result;
  left = true;
}
