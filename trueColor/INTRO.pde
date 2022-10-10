//the intro screen;

void intro() {
  if (b3) song.play(); //play background music IF you bought it
  
  background(black);
  //display the intro gif (gif version can't be uploaded to github)
  int n = (frameCount%91);
  image(introGif[n], width/2, height/2, width, height); 
  
  //title
  title("True", width*0.17, 50, newYork);
  title("Colour", width*0.17, 100, newYork);
  
  //go to the game
  textedButtons("Play Now");
  
  //accessing help page
  helpButton();
}

void helpButton() {
  //access to help page
  pushMatrix();
  translate(50,50);
  rotate(radians(frameCount%360));
  image(settingLogo, 0, 0, 60, 60);
  popMatrix();
  
  //tactile
  if (dist(mouseX, mouseY, 50, 50) < 30) {
    noFill();
    strokeWeight(3);
    stroke(white);
    circle(50,50,70);
  }
}

void title(String text, float x, float y, PFont font) {
  fill(white);
  textFont(font);
  textSize(32);
  text(text, x, y);
}

float startSize() {
  float x = radians(frameCount*6);
  return abs(5 * sin(0.5*x)) + 30;
}

void introClick() {
  //help page access
  if (cirPressed(50,50,30)) mode = HELP;
  
  //start game
  else if (rectPressed(width/2, height*0.85, 300, 60)) {
    mode = GAME;
  }
}
