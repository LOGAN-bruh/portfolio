// Logan Bywater | 25 September 2025 | Calculator
Button[] buttons = new Button[12];
Button[] numButtons = new Button[10];
int num = 0;
float l, r, result;
String dVal;
String op;
boolean left;
boolean resetOnNextInput = false;
boolean fullState = false;
int fullTimer = 0;
boolean fullBlinkOn = false;

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

void keyReleased() {
  println("Key:" + key);
  println("keyCode:" + keyCode);
  if (key == '+') {
    dVal = "0.0";
    left = false;
    op = "+";
  } else if (key == '-') {
    dVal = "0.0";
    left = false;
    op = "-";
  } else if (key == '*') {
    dVal = "0.0";
    left = false;
    op = "*";
  } else if (key == '/') {
    dVal = "0.0";
    left = false;
    op = "/";
  } else if (key == 'c') {
    l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0.0";
      op = "C";
      left = true;
  } else if (key == 's') {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (key == '^') {
    dVal = "0.0";
    left = false;
    op = "^";
  } else if (key == 'r') {
    op = "R";
    performCalculation();
    left = true;
  } else if (keyCode == ENTER) {
    performCalculation();
  } else if (key == '.') {
    if (resetOnNextInput) {
      dVal = "0";
      resetOnNextInput = false;
    }

    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (key == 'n') {
    if (left) {
      l = l * -1;
      dVal = str(l);
    } else {
      r = r * -1;
      dVal = str(r);
    }
  } else if (keyCode == BACKSPACE) {
    if (dVal.equals("0") || dVal.equals("0.0") || dVal.equals("Error :(")) return;
    dVal = dVal.substring(0, dVal.length() - 1);
    if (dVal.length() == 0 || dVal.equals("-") || dVal.equals(".")) {
      dVal = "0.0";
    } 
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (key >= '0' && key <= '9') {
    if (dVal.length() >= 18) return; // prevents display overflow
    char digit = key;

    if (resetOnNextInput) {
      dVal = String.valueOf(digit);
      resetOnNextInput = false;
    } else {
      if (dVal.equals("0.0") || dVal.equals("0")) {
        dVal = String.valueOf(digit);
      } else {
        dVal += digit;
      }
    }

    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } 
}

void mouseReleased() {
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
   // Dynamic text scaling based on number length
  int len = dVal.length();
  if (len < 12) {
    textSize(30);
  } else if (len < 17) {
    textSize(22);
  } else {
    textSize(16);
  }

  // Keep right alignment (baseline for bottom reference)
  textAlign(RIGHT, BASELINE);

  // Dynamically lock text to a fixed distance from bottom of display rectangle
  float displayTop = 35 - 25;   // display rect center (35) - half height (25)
  float displayBottom = 35 + 25;
  float bottomMargin = 8;       // distance between text and bottom of display
  float textY = displayBottom - bottomMargin;

  // Draw text — consistent vertical position regardless of font size
  text(dVal, width - 15, textY);
  if (len >= 18) {
    float fullBoxWidth = 65;
    float fullBoxHeight = 15;
    float fullBoxX = 47;   // position near left side of display
    float fullBoxY = 20;   // vertically centered in display

    // Light background box
    fill(#39FF14);
    noStroke();
    rectMode(CENTER);
    rect(fullBoxX, fullBoxY + 2, fullBoxWidth, fullBoxHeight, 4);

    // Dark “Full” text
    fill(#1B3620);
    textAlign(CENTER, CENTER);
    textSize(12);
    text("Storage Full", fullBoxX, fullBoxY);
  }
  textSize(12);
  stroke(0);
}

void performCalculation() {
  if (op.equals("") || op.equals("C")) {
    dVal = str(left ? l : r);
    resetOnNextInput = false;
    return;
  } else if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("*")) {
  result = l * r;
  } else if (op.equals("/")) {
    if (r == 0) {
      dVal = "0";
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

  // Display rounding — formats float neatly up to 8 decimal places
  if (abs(result - int(result)) < 0.0000001) {
    dVal = str(int(result));  // If it's effectively an integer
  } else {
    dVal = nf(result, 0, 8);  // Format with up to 8 decimal places
  }

  resetOnNextInput = true;
  l = result;
  left = true;
}
