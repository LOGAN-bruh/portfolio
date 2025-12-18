# Logan Bywater's Programming Portfolio | 2025-26

## Projects for Term 1

### Calculator (2025)

This Processing code creates a fully functional retro-style calculator GUI modeled after the Apple II aesthetic, featuring a number pad, operators, and display. It supports basic arithmetic operations—addition, subtraction, multiplication, division, as well as exponentiation (^), square root (√), rounding (R), negation (±), and decimal input. The calculator's interface includes numeric buttons (0–9) and operation buttons, each rendered as custom Button objects that respond visually when hovered over. The display at the top shows the current input or result in a green retro font against a dark background. The logic tracks the left (l) and right (r) operands, the selected operation (op), and whether the calculator should reset the display on the next input. Special features like clear (C), backspace (D), and error handling (e.g., division by zero shows "Error :(") are also integrated. The GUI is polished with stylized text like “Apple Computer Inc.® (1977)” and “Apple II Calculator,” giving it a vintage appearance while offering modern calculator functionality.

![Running Calculator](https://github.com/LOGAN-bruh/portfolio/blob/main/images/Calc.png?raw=true)

![CalculatorUML](https://github.com/LOGAN-bruh/portfolio/blob/main/images/CalculatorUML.jpg?raw=true)

* [Windows EXE](https://github.com/LOGAN-bruh/portfolio/blob/main/src/Calculator/windows-amd64.zip)
* [MacOSX](https://github.com/LOGAN-bruh/portfolio/blob/main/src/Calculator/macos-aarch64.zip)
* [MacOSX Intel Based](https://github.com/LOGAN-bruh/portfolio/blob/main/src/Calculator/macos-x86_64.zip)
* [Source Code](https://github.com/LOGAN-bruh/portfolio/tree/main/src/Calculator/Logan's%20Calculator)


### Ballbounce (2025)

This code is written in Processing and creates a simple interactive animation with bouncing balls (called bubbles). When the program starts, it opens a 500×500 pixel window. The draw() function runs repeatedly, clearing the screen to white each frame and then looping through an ArrayList of Ball objects. For each ball in the list, it calls the display() method to draw the ball on the screen and the move() method to update its position. Whenever the user clicks the mouse, the mousePressed() function runs and adds a new Ball to the list at the current mouse location. Over time, this allows the user to create multiple moving balls by clicking, all of which are animated continuously on the screen.

[Source Code](https://github.com/LOGAN-bruh/portfolio/tree/main/src/BallBounce/ballbouncecode)

![RunningBallBounce](https://github.com/LOGAN-bruh/portfolio/blob/main/images/BallBounce.png)

### Level Counter (2025)

This code creates a simple level timer display using Processing. It starts with a variable called level set to 1 and a countdown timer timeLeft set to 10 seconds. In the setup() function, the program creates a 600 by 400 window and sets the text to be centered and displayed in a large font. The draw() function runs continuously, clearing the background each frame and decreasing the timer by 1/60 of a second to match the frame rate. When the timer reaches zero, the level number increases by one and the timer resets back to 10 seconds. The program then displays the current level and shows how many seconds remain until the next level, updating smoothly in real time on the screen.

[Source Code](https://github.com/LOGAN-bruh/portfolio/blob/main/src/LevelCounter/Level_counter.zip)

![levelCounter](https://github.com/LOGAN-bruh/portfolio/blob/main/images/levelcounter.png)

### Making Cars (2025)

This code creates and manages multiple car objects using an array in Processing. At the top, two individual Car variables are declared, along with an array that can hold 50 Car objects. In the setup() function, the program creates a 1000 by 600 window and uses a loop to fill the array by creating a new Car object for each position. The draw() function runs continuously, clearing the screen with a white background each frame and looping through the array of cars. For every car in the array, the program calls the display() method to draw the car on the screen and the move() method to update its position. This results in multiple cars being animated and moving independently across the window.

[Source Code](https://github.com/LOGAN-bruh/portfolio/blob/main/src/MakingCars/Making_Cars.zip)

![MakingCars](https://github.com/LOGAN-bruh/portfolio/blob/main/images/Cars.png)

### Ski Free

The game is a downhill skiing game inspired by SkiFree, where the player controls a skier sliding continuously down a snowy slope. The skier is always moving forward, and the player uses the left, right, and down arrow keys to steer, slow down, or straighten out. Going straight makes the skier move fastest, while sharper turns reduce speed, so the player has to balance control with momentum. As you ski, obstacles like trees or objects appear from different directions, and hitting one causes the skier to crash and stop until the player recovers. The goal is to survive as long as possible while traveling the greatest distance. The game tracks your time, distance, and speed in real time, and difficulty settings increase how fast and frequently obstacles appear. There is a colorful animated title screen, a stats screen where you can view progress and change difficulty, and simple arcade-style gameplay that focuses on reflexes and control rather than a final “win” condition.

[Source Code](https://github.com/LOGAN-bruh/portfolio/blob/main/src/SkiFree25/compProcessing-project-skifree-main%202/compProcessing-project-skifree-main.zip)

![SkiFreeRunning](https://github.com/LOGAN-bruh/portfolio/blob/main/images/PlayingSkiFree.png)
![SkiFreeTitle](https://github.com/LOGAN-bruh/portfolio/blob/main/images/SkiFreeTitle.png)
![SkiFreeStats](https://github.com/LOGAN-bruh/portfolio/blob/main/images/StatsskiFree.png)

