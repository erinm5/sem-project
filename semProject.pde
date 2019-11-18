//Ok so here is the code for our game as of 10:45pm on 11/17

//FOR TESTING
//If you press the ‘h’ key, the players health decreases by 10
//If you press the ‘s’ key, the players happiness decreases by 10
//If you press the ‘g’ key, the players grades decrease by 10
//If you press the ‘w’ key, the players wealth decreases by 10

//You can push the button above to see the values and the stat bars change accordingly. I know this isn’t at all finished or ready for our presentation (don’t worry I’m still working) but I wanted to show what we have as of right now - Aidan

//***CODE STARTS HERE***


boolean nameEntered = false;
boolean creditsSelected = false;
String username = "";
String typing = "";
PFont f;
PImage openScreen; //Image used for the backgorund on the username screen
PImage healthIcon; //Image used for the icon representing the player's health
float totalGrades = 100;
float totalHealth = 100;
float totalHappiness = 100;
float totalWealth = 100;
final float MAX_WEALTH = 100;
final float MAX_HAPPY = 100;
final float MAX_HEALTH = 100;
boolean gameStarted = false;
String letterGrade = "";
int courseCredits;
color UMBC_Gold = color(243,175,39);
color UMBC_Red = color(213,53,40);
color grade_Box = color(0,255,0);

void setup() {
  size(1000,700);
  background(255);
  f = createFont("Arial",16);
  openScreen = loadImage("openScreen.jpeg");
  healthIcon = loadImage("healthIcon.png");
  
}

void draw() {
  background(0);
  if(!gameStarted) {
   usernameEntryScreen();
  }
  if(gameStarted) {
    mainScreen();
  }
}

void mainScreen() {
  displayName();
  drawGrades();
  drawHeart();
  drawWealth();
  drawFace();
  quitButton();
}

void displayName() {
  fill(UMBC_Gold);
  textSize(32);
  text(username + "'s College Life", 20,30);
}

void quitButton() {
  fill(UMBC_Gold);
  rect(10,45,100,50);
  fill(UMBC_Red);
  textSize(18);
  text("Drop Out",20,75);
}
//drawHeart - (Erin) this icon will represent the health stat by drawing a heart
void drawHeart() {
  float healthPercent = totalHealth / MAX_HEALTH;
  float barFilled = 150 * healthPercent;
  image(healthIcon,125,45);
  fill(235);
  rect(175,60,150,20);
  fill(0,255,0);
  rect(175,60,barFilled,20);
}

//drawWealth - (Rohit) this will draw a cash symbol which will represent the player's wealth
void drawWealth() {
  float wealthPercent = totalWealth / MAX_HEALTH;
  float barFilled = 150 * wealthPercent;
  fill(0,255,0);
  textSize(50);
  text('$',765,88);
  
  fill(235);
  rect(800,60,150,20);
  fill(0,255,0);
  rect(800,60,barFilled,20);
}

//drawFace - (Hailey) will draw a smiley face to represent to player's happiness level
void drawFace() {
  float happyPercent = totalHappiness / MAX_HAPPY;
  float barFilled = 150 * happyPercent;
  int x = 360;
  int y = 70;
  ellipseMode(CENTER);
  fill(255,255,0);
  ellipse(x,y,50,50);
  fill(204,255,51);
  ellipse(x - 10,y - 5,10,10);
  ellipse(x + 10,y - 5,10,10);
  arc(x,y + 10,20,20,0,PI,CHORD);
  
  fill(235);
  rect(390,60,150,20);
  fill(0,255,0);
  rect(390,60,barFilled,20);
}

//drawGrades - (Karlos) will draw and change the grade icon depending on the user's totalGrades. 
void drawGrades() {
  float gradePercent = totalGrades / MAX_HAPPY;
  float barFilled = 150 * gradePercent;
  float gradesX = 550;
  float gradesY = 45;
  fill(grade_Box);
  rect(gradesX,gradesY,55,45); //background rectangle
  textSize(40);
  fill(0);
  text(letterGrade,gradesX + 15,gradesY + 38);
  
  fill(235);
  rect(610,60,150,20);
  fill(0,255,0);
  rect(610,60,barFilled,20);
  
  //letters changing depending on the value of totalGrades
  if(totalGrades >= 90) {
    letterGrade = "A";
    grade_Box = color(0,255,0); //make backgorund box green
  }
  if(totalGrades >= 80 && totalGrades <= 89) {
    letterGrade = "B";
    grade_Box = color(200,220,55); // make background box yellow-green
  }
  if(totalGrades >= 70 && totalGrades <= 79) {
    letterGrade = "C";
    grade_Box = color(245,237,46); // make background box yellow
  }
  if(totalGrades >= 60 && totalGrades <= 69) {
    letterGrade = "D";
    grade_Box = color(250,170,25); // make background box orange
  }
  if(totalGrades <= 59) {
    letterGrade = "F";
    grade_Box = color(255,0,0); // make backgorund box red
  }  
}

void mouseClicked() {
  //(Aidan) - checking to see which credits button is clicked and saving the number of credits the user is taking
  totalWealth -= 10;
  if(!creditsSelected) { 
    if(mouseX >= 288 && mouseX <= 412 && mouseY >= 425 && mouseY <= 500) {
      courseCredits = 12;
      gameStarted = true;
    }
    if(mouseX >= 438 && mouseX <= 561 && mouseY >= 425 && mouseY <= 500) {
      courseCredits = 15;
      gameStarted = true;
    }
    if(mouseX >= 588 && mouseX <= 714 && mouseY >= 425 && mouseY <= 500) {
      courseCredits = 18;
      gameStarted = true;
    }
  }
}

void keyPressed() {
  if(!nameEntered) {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    username = typing;
    nameEntered = true;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  }
  if(key == 8) {
    typing = typing.substring(0,typing.length() - 1);
  }
  else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
 }
 //the rest of the code in this function is for testing purposes
 if(key == 'h') {
   totalHealth -= 10;
 }
 if(key == 's') {
   totalHappiness -= 10;
 }
 if(key == 'g') {
   totalGrades -= 10;
 }
 if(key == 'w') {
   totalWealth -= 10;
 }

}

void usernameEntryScreen() { //(Aidan) - displays screen for entering username and selecting number of credits
  image(openScreen,0,0); 
  fill(0);
  rectMode(CENTER);
  rect(500,450,500,150);
  
  if(!nameEntered) {
    // Set the font and fill for text
    textFont(f);
    fill(UMBC_Gold);
  
    // Display enter username text
    text("Type your username and press enter to start!", 340, 400);
    fill(UMBC_Red);
    text("Username: " + typing,255,460);
  }
  if(nameEntered) { // starts displaying credit selection buttons
    textFont(f);
    fill(UMBC_Gold);
    text("How many credits do you want to take this semester?",310,400);
    //Drawing the buttons to select the number of credits the user will take
    noStroke();
    rect(350,460,125,75);
    rect(500,460,125,75);
    rect(650,460,125,75);
    //rect(474,460,125,75);
    fill(UMBC_Red);
    rect(350,460,110,60);
    rect(500,460,110,60);
    rect(650,460,110,60);
    //adding the text that is on top of the buttons
    fill(UMBC_Gold);
    textSize(36);
    text("12",328,472);
    text("15",478,475);
    text("18",628,475);
  }
}
