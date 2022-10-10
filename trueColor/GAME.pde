//main game screen //<>//

void game() {
  background(black);
  controlButtons();
  gameText();
  timeBar();
  
  //Ingame purchases in action
  if (b2) maxCount = 360;
  else if (b1) maxCount = 180;
  
  //score display
  textSize(18);
  fill(white);
  text("Score: " + score, width/2, 50);
  //timer display
  textSize(36);
  text(nfs((maxCount-count)/60.0, 1, 1), width/2, 100);
  
  //determine by keys
  if (rKey) choice = 1;
  if (lKey) choice = -1;
  
  rKey = lKey = false; // ensures the choices are instant
  
  //time out lead to death
  if (choice ==0 && count > maxCount) mode = END;
  
  gameLogic();
}

void gameClick() {
  if (rectPressed(width*0.3, 500, 180, 60)) choice = 1; //oui
  if (rectPressed(width*0.7, 500, 180, 60)) choice = -1; //non
}
//custom functions -------------------------------------
void timeBar () {
  fill(white);
  noStroke();
  rect(width/2, 20, 300, 20, 5); //base bar
  
  //green bar
  float len = map(count, 1, maxCount, 2, 300);
  fill(red);
  rect(width/2, 20, len, 20, 5);
}

void gameLogic() {
    //logic
  if (choice == 1) { 
    if (match) {
      score ++;
      count = 0;
      choice = 0;
      //play success music
      win.rewind();
      win.play();
    } else {
      mode = END;
    }
  } else if (choice == -1) {
    if (match) mode = END;
    else {
      score ++;
      count = 0;
      choice = 0;
      //play sucess music
      win.rewind();
      win.play();
    }    
  }
}

void controlButtons() {
  //display keyboard instructions
  image(aKeyIcon, width*0.3, 100, 50, 50);
  image(dKeyIcon, width*0.7, 100, 50, 50);
  
  //display mouse buttons
  rectButton(width*0.3, 500, 180, 60, green, black);
  rectButton(width*0.7, 500, 180, 60, red, black);

  fill(white); //display button text
  textSize(32);
  text("OUI", width*0.3, 500);
  text("NON", width*0.7, 500);
}

void gameText() {
  textSize(1 + count/2);

  //determine spin time, switching word
  if (count == 1) determiningLogic();
  count++;

  //color filled
  fill(colorD);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount%(maxCount/2) * 2 * (360/maxCount)));
  text(textD, 0, 0);
  popMatrix();
}

void determiningLogic () {
  int order = (int) random(0, 6); //used to determine match or not
  textD = gText[order];
  //determine whether the color text will match
  if (random(-1, 1) >= 0) match = true;
  else match = false;
  //determine color base on match status
  if (match) colorD = gColors[order];
  else {
    while (true) {
      colorD = gColors[(int) random(0, 6)];
      if (colorD != gColors[order]) break;
    }
  }
}
