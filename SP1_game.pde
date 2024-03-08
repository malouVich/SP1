// Define global variable
float ballX, ballY; // position of the ball
float ballSpeedX, ballSpeedY; // speed of the ball
float playerX, playerY; // players position
float playerSpeed; // players speed
boolean gameOver; // game status
int score; // players score

void setup() {
  size(400, 400);
  // Inittialize variables 
  ballX = width/2;
  ballY = height/2;
  ballSpeedX = random(-1, 3);
  ballSpeedY = random(-1, 3);
  playerX = width/2;
  playerY = height - 20;
  playerSpeed = 7;
  gameOver = false;
  score = 0;
}

void draw() {
  background(255);
  
  // draw ball
  drawBall();
  // draw player
  drawPlayer();
  // update the ball's position
  updateBall();
  // check collision between ball and player 
  checkCollision();
  // checking if game is over
  checkGameOver();
  // show the score
  displayScore();
}

// Method to draw the ball
void drawBall() {
  fill(255, 0, 0);
  ellipse(ballX, ballY, 20, 20);
}

// Method to draw the player
void drawPlayer() {
  fill(0, 0, 255);
  rectMode(CENTER);
  playerX = mouseX; // Update the players x-position with the x-position of the mouse
  rect(playerX, playerY, 80, 10);
}

// Method to update the ball's position
void updateBall() {
  ballX += ballSpeedX;
  ballY += ballSpeedY;
  // if the ball hits the edge of the screen it will change direction
  if (ballX < 0 || ballX > width) {
    ballSpeedX *= -1;
  }
  if (ballY < 0 || ballY > height) {
    ballSpeedY *= -1;
  }
}

// Method to check collision between the player and the ball
void checkCollision() {
  if (dist(ballX, ballY, playerX, playerY) < 20) {
    ballSpeedY *= -1;
    score++;
  }
}


// Method to check if the game is over 
void checkGameOver() {
  if (ballY > height) {
    gameOver = true;
  }
  if (gameOver) {
    textSize(30);
    textAlign(CENTER);
    fill(0);
    text("Game Over", width/2, height/2);
    noLoop(); // this will stop the game loop
  }
}

// Method to show the final score
void displayScore() {
  textSize(20);
  textAlign(RIGHT);
  fill(0);
  text("Score: " + score, width - 20, 20);
}
