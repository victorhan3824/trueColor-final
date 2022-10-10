//end screen

void end() {
  song.pause(); //stop background music
  fail.play();
  background(red);
  
  deathCause(); //tell you why you failed
  textedButtons("Go Home"); //goto intro page

  if (frameCount % 10 == 0) colorEnd = gColors[(int) random(1, 6)];
  fill(colorEnd);
  textSize(128);
  text("GAMEOVER", width/2, 200);

  fill(white);
  textSize(24);
  text("Score :" + score, width/2, 300);
  if (max(score, highScore) == score) highScore = score;
  text("HighScore: " + max(score, highScore), width/2, 350);
}

void endClick() {
  if (rectPressed(width/2, height*0.85, 300, 60)) {
    mode = INTRO;

    //reset things
    count = score = choice = 0;
    colorEnd = white;
    song.rewind();
    fail.rewind();
    fail.pause();
  }
}

void deathCause () {
  fill(white);
  textSize(24);
  if (choice == 0) text("Timed out", width/2, 125);
  else text("Wrong guess", width/2, 125);
}
