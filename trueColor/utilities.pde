void cirButton(float x, float y, float r, color col, color bor) {
  //x, y, radius, button inside color, button border color
  fill(col);
  strokeWeight(3);
  
  //tactile
  if (dist(mouseX, mouseY, x, y) < r) stroke(white);
  else stroke(bor);
  
  circle(x,y,r*2); //draw button
}

boolean cirPressed(float x, float y, float r) {
  return(dist(mouseX, mouseY, x, y) < r);
}

void rectButton(float x, float y, float w, float h, color col, color bor) {
  //display rectangle buttons
  //x, y, button inside color, button border color
  fill(col);
  strokeWeight(3);
  
  //tactile
  float pX = x - w/2;
  float pY = y - h/2;
  if (mouseX > pX && mouseX < pX+w && mouseY > pY && mouseY < pY+h) stroke(white);
  else stroke(bor);
  
  rect(x,y,w,h); //draw button
}

boolean rectPressed(float x, float y, float w, float h) {
  float pX = x - w/2;
  float pY = y - h/2;
  
  return ( mouseX > pX && mouseX < pX+w && mouseY > pY 
  && mouseY < pY+h);
}

void textedButtons(String text) {
  textFont(newYork);
  textSize(startSize());
  //tactile
  if (mouseX > width/2-150 && mouseX < width/2+150 && mouseY > height*0.85 - 30 && mouseY < height*0.85 + 30) {
    noFill();
    stroke(white);
    strokeWeight(3);
    rect(width/2, height*0.85, 300, 60);
    //instruction
    fill(white);
    text(text, width/2, height*0.85);  
  } else {
    //instruction
    fill(blue);
    text(text, width/2, height*0.85);  
  }
}
