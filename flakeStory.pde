import KinectPV2.KJoint;
import KinectPV2.*;

import ddf.minim.*;

import processing.video.*;

KinectPV2 kinect;

Minim minim;

float windowSizeX=1920;
float windowSizeY=1080;
float centerX=960;
float centerY=850;

//data
Movie introMovie;

PImage choiceBg;
PImage choice;
AudioPlayer choiceMusic;
PImage rightHand;
PImage leftHand;
PImage event1;
PImage event2;
PImage event3;
PImage gift1;
PImage gift2;
PImage gift3;
PImage gift4;
PImage gift5;
PImage gift6;
PImage gift7;
PImage gift8;
PImage gift9;
PImage ribben1;
PImage ribben2;
PImage ribben3;
PImage color11;
PImage color12;
PImage color13;
PImage color14;
PImage color15;
PImage color16;
PImage color17;
PImage color18;
PImage color19;
PImage color21;
PImage color22;
PImage color23;
PImage color24;
PImage color25;
PImage color26;
PImage color27;
PImage color28;
PImage color29;
PImage color31;
PImage color32;
PImage color33;
PImage color34;
PImage color35;
PImage color36;
PImage color37;
PImage color38;
PImage color39;

Movie endingMovie;

PImage flakeBg;
AudioPlayer flakeMusic;
PImage finish;
PImage again;
PImage start;

//parameter
float rX;
float rY;
float lX;
float lY;

float rgbRange=800;
float r;
float g;
float b;
float flakeColorR;
float flakeColorG;
float flakeColorB;

float shoulderRX;
float shoulderRY;
float shoulderLX;
float hipY;

float curPointFirstX=0;
float curPointFirstY=0;
float curPointSecondX=0;
float curPointSecondY=0;
float curPointThirdX=0;
float curPointThirdY=0;
float curPointFourthX=0;
float curPointFourthY=0;
float curPointFifthX=0;
float curPointFifthY=0;
float curPointSixthX=0;
float curPointSixthY=0;

int i;
int k;

String gameState;
String event;
int timer=0;

float eventChoice=0;
float firstChoice=0;
float secondChoice=0;
float thirdChoice=0;
float lastStage=0;

void setup() {
  surface.setResizable(true);
  size(1920, 1080);
  background(210);
  frameRate(10);
  strokeWeight(5);
  stroke(0, 0, 0);
  smooth();

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.init();

  choiceBg = loadImage("choiceBg.jpg");
  choice = loadImage("choiceBg.png");
  rightHand = loadImage("rightHand.png");
  leftHand = loadImage("leftHand.png");
  event1 =loadImage("event1.jpg");
  event2 =loadImage("event2.jpg");
  event3 =loadImage("event3.png");
  gift1 = loadImage("gift1.png");
  gift2 = loadImage("gift2.png");
  gift3 = loadImage("gift3.png");
  gift4 = loadImage("gift4.png");
  gift5 = loadImage("gift5.png");
  gift6 = loadImage("gift6.png");
  gift7 = loadImage("gift7.png");
  gift8 = loadImage("gift8.png");
  gift9 = loadImage("gift9.png");
  ribben1 = loadImage("ribben1.png");
  ribben2 = loadImage("ribben2.png");
  ribben3 = loadImage("ribben3.png");
  color11 =loadImage("color11.png");
  color12 =loadImage("color12.png");
  color13 =loadImage("color13.png");
  color14 =loadImage("color14.png");
  color15 =loadImage("color15.png");
  color16 =loadImage("color16.png");
  color17 =loadImage("color17.png");
  color18 =loadImage("color18.png");
  color19 =loadImage("color19.png");
  color21 =loadImage("color21.png");
  color22 =loadImage("color22.png");
  color23 =loadImage("color23.png");
  color24 =loadImage("color24.png");
  color25 =loadImage("color25.png");
  color26 =loadImage("color26.png");
  color27 =loadImage("color27.png");
  color28 =loadImage("color28.png");
  color29 =loadImage("color29.png");
  color31 =loadImage("color31.png");
  color32 =loadImage("color32.png");
  color33 =loadImage("color33.png");
  color34 =loadImage("color34.png");
  color35 =loadImage("color35.png");
  color36 =loadImage("color36.png");
  color37 =loadImage("color37.png");
  color38 =loadImage("color38.png");
  color39 =loadImage("color39.png");


  flakeBg =loadImage("flakeBg.png");
  finish =loadImage("finish.png");
  again =loadImage("again.png");
  start =loadImage("start.png");

  minim = new Minim(this);
  choiceMusic = minim.loadFile("choiceMusic.mp3");
  flakeMusic = minim.loadFile("flakeMusic.mp3");

  introMovie = new Movie(this, "introMovie.mp4");
  endingMovie = new Movie(this, "endingMovie.mp4");

  gameState="intro";
}

void draw() {

  noFill();

  if (gameState=="intro") {
    image(kinect.getColorImage(), 0, 0, 1920, 1080);

    image(introMovie, 0, 0, 1920, 1080);
    introMovie.play();

    int x = int(random(shoulderLX, shoulderRX));
    int y = int(random(shoulderRY, hipY));
    int loc = x + y*width;

    loadPixels();
    r = red(kinect.getColorImage().pixels[loc]);  
    g = green(kinect.getColorImage().pixels[loc]);
    b = blue(kinect.getColorImage().pixels[loc]);

    //test
    //fill(r, g, b);
    // rect(0, 0, 200, 200);
    println("("+r+","+","+g+","+b+")");

    timer+=1;
    if (timer>50) {
      gameState="eventChoice";
      timer=0;
    }
  }


  if (gameState=="eventChoice") {

    choiceMusic.play();
    background(choiceBg);

    image(event1, 230, 556, 350, 350);
    image(event2, 785, 287, 350, 350);
    image(event3, 1337, 543, 350, 350);

    chooseA();
    if (eventChoice>0) {
      gameState="firstChoice";
    }
  }

  if (gameState=="firstChoice") {
    image(choice, 0, 0, 1920, 1080);

    chooseB();  
    if (eventChoice==1) {
      image(gift1, 230, 556, 350, 350);
      image(gift2, 785, 287, 350, 350);
      image(gift3, 1337, 543, 350, 350);
    } else if (eventChoice==2) {
      image(gift4, 230, 556, 350, 350);
      image(gift5, 785, 287, 350, 350);
      image(gift6, 1337, 543, 350, 350);
    } else if (eventChoice==3) {
      image(gift7, 230, 556, 350, 350);
      image(gift8, 785, 287, 350, 350);
      image(gift9, 1337, 543, 350, 350);
    }
    if (firstChoice==1) {
      float shapeSize=0.3;
      stroke(255, 255, 255);
      strokeWeight(5);
      beginShape();
      vertex(centerX+0*shapeSize, centerY-50*shapeSize);
      vertex(centerX+14*shapeSize, centerY-20*shapeSize);
      vertex(centerX+47*shapeSize, centerY-15*shapeSize);
      vertex(centerX+23*shapeSize, centerY+7*shapeSize);
      vertex(centerX+29*shapeSize, centerY+40*shapeSize);
      vertex(centerX+0*shapeSize, centerY+25*shapeSize);
      vertex(centerX-29*shapeSize, centerY+40*shapeSize);
      vertex(centerX-23*shapeSize, centerY+7*shapeSize);
      vertex(centerX-47*shapeSize, centerY-15*shapeSize);
      vertex(centerX-14*shapeSize, centerY-20*shapeSize);
      endShape(CLOSE);
      gameState="secondChoice";
    } else if (firstChoice==2) {
      float shapeSize=0.3;
      stroke(255, 255, 255);
      strokeWeight(5);
      ellipse(centerX, centerY, 100*shapeSize, 100*shapeSize);
      gameState="secondChoice";
    } else if (firstChoice==3) {
      float shapeSize=0.3;
      stroke(255, 255, 255);
      strokeWeight(5);
      beginShape();
      vertex(centerX+0*shapeSize, centerY-50*shapeSize);
      vertex(centerX+47*shapeSize, centerY-15*shapeSize);
      vertex(centerX+29*shapeSize, centerY+40*shapeSize);
      vertex(centerX-29*shapeSize, centerY+40*shapeSize);
      vertex(centerX-47*shapeSize, centerY-15*shapeSize);
      endShape(CLOSE);
      gameState="secondChoice";
    }
  }

  if (gameState=="secondChoice") {
    image(choice, 0, 0, 1920, 1080);

    chooseC();  
    image(ribben1, 230, 556, 350, 350);
    image(ribben2, 785, 287, 350, 350);
    image(ribben3, 1337, 543, 350, 350);
    if (secondChoice==1) {
      float shapeSize=0.3;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY-10*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY-10*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY+4*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY+4*shapeSize;
      gameState="thirdChoice";
    } else if (secondChoice==2) {
      float shapeSize=1;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY-150*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY-190*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY-300*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY-300*shapeSize;
      gameState="thirdChoice";
    } else if (secondChoice==3) {
      float shapeSize=1;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY-10*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY-10*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY+4*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY+4*shapeSize;
      secondChoice=secondChoice+0.1;
    } else if (secondChoice==3.1) {
      float shapeSize=0.7;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY+150*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY+190*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY+300*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY+300*shapeSize;
      secondChoice=secondChoice-0.1;
      gameState="thirdChoice";
    }
  }

  if (gameState=="thirdChoice") {
    image(choice, 0, 0, 1920, 1080);

    if (secondChoice==1) {
      if (eventChoice==1) {
        image(color11, 230, 556, 350, 350);
        image(color12, 785, 287, 350, 350);
        image(color13, 1337, 543, 350, 350);
      } else if (eventChoice==2) {
        image(color14, 0, 0, 1, 1);
        image(color15, 0, 0, 1, 1);
        image(color16, 0, 0, 1, 1);
      } else if (eventChoice==3) {
        image(color17, 0, 0, 1, 1);
        image(color18, 0, 0, 1, 1);
        image(color19, 0, 0, 1, 1);
      }
    } else if (secondChoice==2) {
      if (eventChoice==1) {
        image(color21, 0, 0, 1, 1);
        image(color22, 0, 0, 1, 1);
        image(color23, 0, 0, 1, 1);
      } else if (eventChoice==2) {
        image(color24, 0, 0, 1, 1);
        image(color25, 0, 0, 1, 1);
        image(color26, 0, 0, 1, 1);
      } else if (eventChoice==3) {
        image(color27, 0, 0, 1, 1);
        image(color28, 0, 0, 1, 1);
        image(color29, 0, 0, 1, 1);
      }
    } else if (secondChoice==3) {
      if (eventChoice==1) {
        image(color31, 0, 0, 1, 1);
        image(color32, 0, 0, 1, 1);
        image(color33, 0, 0, 1, 1);
      } else if (eventChoice==2) {
        image(color34, 0, 0, 1, 1);
        image(color35, 0, 0, 1, 1);
        image(color36, 0, 0, 1, 1);
      } else if (eventChoice==3) {
        image(color37, 0, 0, 1, 1);
        image(color38, 0, 0, 1, 1);
        image(color39, 0, 0, 1, 1);
      }
    }

    chooseD();
    if (eventChoice==1) {
      if (thirdChoice==1) {
        stroke(242, 95, 92);
        flakeColorR=80;
        flakeColorG=81;
        flakeColorB=79;
        gameState="ending";
      } else if (thirdChoice==2) {
        stroke(239, 111, 118);
        flakeColorR=66;
        flakeColorG=106;
        flakeColorB=90;
        gameState="ending";
      } else if (thirdChoice==3) {
        stroke(227, 181, 164);
        flakeColorR=119;
        flakeColorG=51;
        flakeColorB=68;
        gameState="ending";
      }
    } else if (eventChoice==2) {
      if (thirdChoice==1) {
        stroke(235, 235, 211);
        flakeColorR=8;
        flakeColorG=61;
        flakeColorB=119;
        gameState="ending";
      } else if (thirdChoice==2) {
        stroke(232, 237, 223);
        flakeColorR=245;
        flakeColorG=203;
        flakeColorB=92;
        gameState="ending";
      } else if (thirdChoice==3) {
        stroke(246, 126, 125);
        flakeColorR=132;
        flakeColorG=59;
        flakeColorB=98;
        gameState="ending";
      }
    } else if (eventChoice==3) {
      if (thirdChoice==1) {
        stroke(219, 80, 74);
        flakeColorR=8;
        flakeColorG=76;
        flakeColorB=79;
        gameState="ending";
      } else if (thirdChoice==2) {
        stroke(255, 175, 177);
        flakeColorR=123;
        flakeColorG=13;
        flakeColorB=30;
        gameState="ending";
      } else if (thirdChoice==3) {
        stroke(236, 115, 87);
        flakeColorR=117;
        flakeColorG=79;
        flakeColorB=68;
        gameState="ending";
      }

    }

    if (gameState=="ending") {
      image(endingMovie, 0, 0, 1920, 1080);
      endingMovie.play();
      chooseE();
    }
  }


  //*********************************************************************************************************
  if (gameState=="drawFlake") 
  {
    flakeBg = loadImage("flakeBg.png");
    background(flakeBg);
    flakeMusic.play();
    if (firstChoice==1) {
      float shapeSize=0.3;
      stroke(255, 255, 255);
      strokeWeight(5);
      beginShape();
      vertex(centerX+0*shapeSize, centerY-50*shapeSize);
      vertex(centerX+14*shapeSize, centerY-20*shapeSize);
      vertex(centerX+47*shapeSize, centerY-15*shapeSize);
      vertex(centerX+23*shapeSize, centerY+7*shapeSize);
      vertex(centerX+29*shapeSize, centerY+40*shapeSize);
      vertex(centerX+0*shapeSize, centerY+25*shapeSize);
      vertex(centerX-29*shapeSize, centerY+40*shapeSize);
      vertex(centerX-23*shapeSize, centerY+7*shapeSize);
      vertex(centerX-47*shapeSize, centerY-15*shapeSize);
      vertex(centerX-14*shapeSize, centerY-20*shapeSize);
      endShape(CLOSE);
    } else if (firstChoice==2) {
      float shapeSize=0.3;
      stroke(255, 255, 255);
      strokeWeight(5);
      ellipse(centerX, centerY, 100*shapeSize, 100*shapeSize);
    } else if (firstChoice==3) {
      float shapeSize=0.3;
      stroke(255, 255, 255);
      strokeWeight(5);
      beginShape();
      vertex(centerX+0*shapeSize, centerY-50*shapeSize);
      vertex(centerX+47*shapeSize, centerY-15*shapeSize);
      vertex(centerX+29*shapeSize, centerY+40*shapeSize);
      vertex(centerX-29*shapeSize, centerY+40*shapeSize);
      vertex(centerX-47*shapeSize, centerY-15*shapeSize);
      endShape(CLOSE);
    }

    if (secondChoice==1) {
      float shapeSize=1.15;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY-10*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY-10*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY+4*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY+4*shapeSize;
      secondChoice=secondChoice-1;
    } else if (secondChoice==2) {
      float shapeSize=1;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY-150*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY-190*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY-300*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY-300*shapeSize;
      secondChoice=secondChoice-2;
    } else if (secondChoice==3) {
      float shapeSize=1;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY-10*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY-10*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY+4*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY+4*shapeSize;
      secondChoice=secondChoice+0.1;
    } else if (secondChoice==3.1) {
      float shapeSize=0.7;
      smooth();
      stroke(255, 255, 255);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+100*shapeSize;
      curPointThirdY=centerY+150*shapeSize;
      curPointFourthX=centerX+200*shapeSize;
      curPointFourthY=centerY+190*shapeSize;
      curPointFifthX=centerX+300*shapeSize;
      curPointFifthY=centerY+300*shapeSize;
      curPointSixthX=centerX+300*shapeSize;
      curPointSixthY=centerY+300*shapeSize;
      secondChoice=secondChoice-3.1;
    }

    if (eventChoice==1) {
      if (thirdChoice==1) {
        stroke(242, 95, 92);
      } else if (thirdChoice==2) {
        stroke(239, 111, 118);
      } else if (thirdChoice==3) {
        stroke(227, 181, 164);
      }
    } else if (eventChoice==2) {
      if (thirdChoice==1) {
        stroke(235, 235, 211);
      } else if (thirdChoice==2) {
        stroke(232, 237, 223);
      } else if (thirdChoice==3) {
        stroke(246, 126, 125);
      }
    } else if (eventChoice==3) {
      if (thirdChoice==1) {
        stroke(219, 80, 74);
      } else if (thirdChoice==2) {
        stroke(255, 175, 177);
      } else if (thirdChoice==3) {
        stroke(236, 115, 87);
      }
    }

    lastStage=1;
    if (lastStage==1) {
      float shapeSize=0.7;
      stroke(flakeColorR, flakeColorG, flakeColorB);
      strokeWeight(3);
      curPointFirstX=centerX+0*shapeSize;
      curPointFirstY=centerY+0*shapeSize;
      curPointSecondX=centerX+0*shapeSize;
      curPointSecondY=centerY+0*shapeSize;
      curPointThirdX=centerX+(r+g+b)*1/3*shapeSize;
      curPointThirdY=centerY+r*shapeSize;
      curPointFourthX=centerX+(r+g+b)*2/3*shapeSize;
      curPointFourthY=centerY+(g+b)*shapeSize;
      curPointFifthX=centerX+(r+g+b)*shapeSize;
      curPointFifthY=centerY+(r+g+b)*shapeSize;
      curPointSixthX=centerX+(r+g+b)*shapeSize;
      curPointSixthY=centerY+(r+g+b)*shapeSize;
      lastStage=1.1;
    } else if (lastStage==1.1) {
      float shapeSize=0.7;
      float flakeSize=0;
      if (eventChoice==1) {
        flakeSize=30;
      } else if (eventChoice==2) {
        flakeSize=50;
      } else if (eventChoice==3) {
        flakeSize=70;
      }


      if (r+g+b>rgbRange/4) {
        curPointFirstX=centerX+0*shapeSize;
        curPointFirstY=centerY+0*shapeSize;
        curPointSecondX=centerX+0*shapeSize;
        curPointSecondY=centerY+0*shapeSize;
        curPointThirdX=centerX+(r+g+flakeSize)*1/3*shapeSize;
        curPointThirdY=centerY+g*shapeSize;
        curPointFourthX=centerX+(r+g+flakeSize)*2/3*shapeSize;
        curPointFourthY=centerY+(r+b)*shapeSize;
        curPointFifthX=centerX+(r+g+flakeSize)*shapeSize;
        curPointFifthY=centerY+(r+g+flakeSize)*shapeSize;
        curPointSixthX=centerX+(r+g+flakeSize)*shapeSize;
        curPointSixthY=centerY+(r+g+flakeSize)*shapeSize;
      } else if (r+g+b<rgbRange/4) {
        curPointFirstX=centerX+(r+g+flakeSize)*shapeSize;
        curPointFirstY=centerY+(r+g+flakeSize)*shapeSize;
        curPointSecondX=centerX+(r+g+flakeSize)*shapeSize;
        curPointSecondY=centerY+(r+g+flakeSize)*shapeSize;
        curPointThirdX=centerX+(r+g+flakeSize+(b-r)*1/3)*shapeSize;
        curPointThirdY=centerY+(r+g+flakeSize+(-r-g-flakeSize)*1/3)*shapeSize;
        curPointFourthX=centerX+(r+g+flakeSize+(b-r)*2/3)*shapeSize;
        curPointFourthY=centerY+(r+g+flakeSize+(-r-g-flakeSize)*2/3)*shapeSize;
        curPointFifthX=centerX+(g+b+flakeSize)*shapeSize;
        curPointFifthY=centerY+0*shapeSize;
        curPointSixthX=centerX+(g+b+flakeSize)*shapeSize;
        curPointSixthY=centerY+0*shapeSize;
      }  
      lastStage=1.2;
    } else if (lastStage==1.2) {
      float shapeSize=0.7;
      float flakeSize=0;
      if (eventChoice==1) {
        flakeSize=80;
      } else if (eventChoice==2) {
        flakeSize=100;
      } else if (eventChoice==3) {
        flakeSize=120;
      }

      if (r+g+b>rgbRange*2/4) {
        curPointFirstX=centerX+0*shapeSize;
        curPointFirstY=centerY+0*shapeSize;
        curPointSecondX=centerX+0*shapeSize;
        curPointSecondY=centerY+0*shapeSize;
        curPointThirdX=centerX+(b+g+flakeSize)*1/3*shapeSize;
        curPointThirdY=centerY+b*shapeSize;
        curPointFourthX=centerX+(b+g+flakeSize)*2/3*shapeSize;
        curPointFourthY=centerY+(r+g)*shapeSize;
        curPointFifthX=centerX+(b+g+flakeSize)*shapeSize;
        curPointFifthY=centerY+(b+g+flakeSize)*shapeSize;
        curPointSixthX=centerX+(b+g+flakeSize)*shapeSize;
        curPointSixthY=centerY+(b+g+flakeSize)*shapeSize;
      } else if (r+g+b<rgbRange*2/4) {
        curPointFirstX=centerX+(b+g+flakeSize)*shapeSize;
        curPointFirstY=centerY+(b+g+flakeSize)*shapeSize;
        curPointSecondX=centerX+(b+g+flakeSize)*shapeSize;
        curPointSecondY=centerY+(b+g+flakeSize)*shapeSize;
        curPointThirdX=centerX+(b+g+flakeSize+(r-g)*1/3)*shapeSize;
        curPointThirdY=centerY+(b+g+flakeSize+(-b-g-flakeSize)*1/3)*shapeSize;
        curPointFourthX=centerX+(b+g+flakeSize+(r-g)*2/3)*shapeSize;
        curPointFourthY=centerY+(b+g+flakeSize+(-b-g-flakeSize)*2/3)*shapeSize;
        curPointFifthX=centerX+(r+b+flakeSize)*shapeSize;
        curPointFifthY=centerY+0*shapeSize;
        curPointSixthX=centerX+(r+b+flakeSize)*shapeSize;
        curPointSixthY=centerY+0*shapeSize;
      }  
      lastStage=1.3;
    } else if (lastStage==1.3) {
      float shapeSize=0.7;
      float flakeSize=0;
      if (eventChoice==1) {
        flakeSize=130;
      } else if (eventChoice==2) {
        flakeSize=150;
      } else if (eventChoice==3) {
        flakeSize=170;
      }

      if (r+g+b>rgbRange*3/4) {
        curPointFirstX=centerX+0*shapeSize;
        curPointFirstY=centerY+0*shapeSize;
        curPointSecondX=centerX+0*shapeSize;
        curPointSecondY=centerY+0*shapeSize;
        curPointThirdX=centerX+(r+b+flakeSize)*1/3*shapeSize;
        curPointThirdY=centerY+r*shapeSize;
        curPointFourthX=centerX+(r+b+flakeSize)*2/3*shapeSize;
        curPointFourthY=centerY+(b+g)*shapeSize;
        curPointFifthX=centerX+(r+b+flakeSize)*shapeSize;
        curPointFifthY=centerY+(r+b+flakeSize)*shapeSize;
        curPointSixthX=centerX+(r+b+flakeSize)*shapeSize;
        curPointSixthY=centerY+(r+b+flakeSize)*shapeSize;
      } else if (r+g+b<rgbRange*3/4) {
        curPointFirstX=centerX+(r+b+flakeSize)*shapeSize;
        curPointFirstY=centerY+(r+b+flakeSize)*shapeSize;
        curPointSecondX=centerX+(r+b+flakeSize)*shapeSize;
        curPointSecondY=centerY+(r+b+flakeSize)*shapeSize;
        curPointThirdX=centerX+(r+b+flakeSize+(g-b)*1/3)*shapeSize;
        curPointThirdY=centerY+(r+b+flakeSize+(-r-b-flakeSize)*1/3)*shapeSize;
        curPointFourthX=centerX+(r+b+flakeSize+(g-b)*2/3)*shapeSize;
        curPointFourthY=centerY+(r+b+flakeSize+(-r-b-flakeSize)*2/3)*shapeSize;
        curPointFifthX=centerX+(g+r+flakeSize)*shapeSize;
        curPointFifthY=centerY+0*shapeSize;
        curPointSixthX=centerX+(g+r+flakeSize)*shapeSize;
        curPointSixthY=centerY+0*shapeSize;
      }  
      lastStage=1.4;
    } else if (lastStage==1.4) {
      float shapeSize=0.7;
      curPointFirstX=centerX+(r+g)*shapeSize;
      curPointFirstY=centerY+(r+g)*shapeSize;
      curPointSecondX=centerX+(r+g)*shapeSize;
      curPointSecondY=centerY+(r+g)*shapeSize;
      curPointThirdX=centerX+(r+g+(b-r)*1/3)*shapeSize;
      curPointThirdY=centerY+(r+g+(-r-g)*1/3)*shapeSize;
      curPointFourthX=centerX+(r+g+(b-r)*2/3)*shapeSize;
      curPointFourthY=centerY+(r+g+(-r-g)*2/3)*shapeSize;
      curPointFifthX=centerX+(g+b)*shapeSize;
      curPointFifthY=centerY+0*shapeSize;
      curPointSixthX=centerX+(g+b)*shapeSize;
      curPointSixthY=centerY+0*shapeSize;
      lastStage=0;
    }
  }

  float[] curveXY={curPointFirstX, curPointFirstY, curPointSecondX, curPointSecondY, curPointThirdX, curPointThirdY, curPointFourthX, curPointFourthY, curPointFifthX, curPointFifthY, curPointSixthX, curPointSixthY};
  float[] drawpoints=new float[96];
  float flakeSizeX=2*centerX;
  float flakeSizeY=2*centerY;

  for (i=0; i<6; i++) {
    float x=curveXY[2*i];
    float y=curveXY[2*i+1];

    float leftUpX=x;
    float leftUpY=y;
    float leftDownX=x;
    float leftDownY=flakeSizeY-y;
    float rightUpX=flakeSizeX-x;
    float rightUpY=y;
    float rightDownX=flakeSizeX-x;
    float rightDownY=flakeSizeY-y;
    float upLeftX=y;
    float upLeftY=x;
    float upRightX=flakeSizeY-y;
    float upRightY=x;
    float downLeftX=y;
    float downLeftY=flakeSizeX-x;
    float downRightX=flakeSizeY-y;
    float downRightY=flakeSizeX-x;

    int j=i*16;
    drawpoints[j]=leftUpX;
    drawpoints[j+1]=leftUpY;
    drawpoints[j+2]=leftDownX;
    drawpoints[j+3]=leftDownY;
    drawpoints[j+4]=rightUpX;
    drawpoints[j+5]=rightUpY;
    drawpoints[j+6]=rightDownX;
    drawpoints[j+7]=rightDownY;
    drawpoints[j+8]=upLeftX;
    drawpoints[j+9]=upLeftY;
    drawpoints[j+10]=upRightX;
    drawpoints[j+11]=upRightY;
    drawpoints[j+12]=downLeftX;
    drawpoints[j+13]=downLeftY;
    drawpoints[j+14]=downRightX;
    drawpoints[j+15]=downRightY;

    if (i==5) {
      for (k=0; k<15; k=k+2) {
        beginShape();
        curveVertex(drawpoints[k], drawpoints[k+1]);
        curveVertex(drawpoints[k+16], drawpoints[k+17]);
        curveVertex(drawpoints[k+32], drawpoints[k+33]);
        curveVertex(drawpoints[k+48], drawpoints[k+49]);
        curveVertex(drawpoints[k+64], drawpoints[k+65]);
        curveVertex(drawpoints[k+80], drawpoints[k+81]);
        endShape();
      }
    }

  }
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

    //individual JOINTS
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      if (skeleton.isTracked()) {
        KJoint[] joints = skeleton.getJoints();
        color col  = skeleton.getIndexColor();
        fill(col);
        stroke(col);
        drawBodyR(joints);
        drawBodyL(joints);

        drawHandState(joints[KinectPV2.JointType_HandRight]);
        drawHandState(joints[KinectPV2.JointType_HandLeft]);

        translate(joints[KinectPV2.JointType_ShoulderRight].getX(), joints[KinectPV2.JointType_ShoulderRight].getY(), joints[KinectPV2.JointType_ShoulderRight].getZ());
        translate(joints[KinectPV2.JointType_ShoulderLeft].getX(), joints[KinectPV2.JointType_ShoulderLeft].getY(), joints[KinectPV2.JointType_ShoulderLeft].getZ());
        translate(joints[KinectPV2.JointType_HipLeft].getX(), joints[KinectPV2.JointType_HipLeft].getY(), joints[KinectPV2.JointType_HipLeft].getZ());
        shoulderRX=joints[KinectPV2.JointType_ShoulderRight].getX();
        shoulderRY=joints[KinectPV2.JointType_ShoulderRight].getY();
        shoulderLX=joints[KinectPV2.JointType_ShoulderLeft].getX();
        hipY=joints[KinectPV2.JointType_HipLeft].getY();
      }
    }
  
}


void drawBodyR(KJoint[] joints) {
  drawBoneR(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
}

void drawBodyL(KJoint[] joints) {
  drawBoneL(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
}

void drawBoneR(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  rX=joints[jointType1].getX();
  rY=joints[jointType1].getY();
  image(rightHand, rX, rY, 150, 150);
  popMatrix();
}

void drawBoneL(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  lX=joints[jointType1].getX();
  lY=joints[jointType1].getY();
  image(leftHand, lX, lY, 150, 150);
  popMatrix();
}


void chooseA() {
  if (rX<=640&&rX>=230&&rY<=830&&rY>=510&&lX<=640&&lX>=230&&lY<=830&&lY>=510) {
    //190-690
    //470-870
    timer+=1;
    if (timer>30) {
      eventChoice=1;
      timer=0;
    }
  } else if (rX<=1190&&rX>=770&&rY<=600&&rY>=300&&lX<=1190&&lX>=770&&lY<=600&&lY>=300) {
    //730-1230
    //250-650
    timer+=1;
    if (timer>30) {
      eventChoice=2;
      timer=0;
    }
  } else if (rX<=1720&&rX>=1320&&rY<=890&&rY>=590&&lX<=1720&&lX>=1320&&lY<=890&&lY>=590) {
    //1270-1770
    //540-940
    timer+=1;
    if (timer>30) {
      eventChoice=3;
      timer=0;
    }
  }
}

void chooseB() {
  if (rX<=640&&rX>=230&&rY<=830&&rY>=510&&lX<=640&&lX>=230&&lY<=830&&lY>=510) {
    //190-690
    //470-870
    timer+=1;
    if (timer>30) {
      firstChoice=1;
      timer=0;
    }
  } else if (rX<=1190&&rX>=770&&rY<=600&&rY>=300&&lX<=1190&&lX>=770&&lY<=600&&lY>=300) {
    //730-1230
    //250-650
    timer+=1;
    if (timer>30) {
      firstChoice=2;
      timer=0;
    }
  } else if (rX<=1720&&rX>=1320&&rY<=890&&rY>=590&&lX<=1720&&lX>=1320&&lY<=890&&lY>=590) {
    //1270-1770
    //540-940
    timer+=1;
    if (timer>30) {
      firstChoice=3;
      timer=0;
    }
  }
}

void chooseC() {
  if (rX<=640&&rX>=230&&rY<=830&&rY>=510&&lX<=640&&lX>=230&&lY<=830&&lY>=510) {
    //190-690
    //470-870
    timer+=1;
    if (timer>30) {
      secondChoice=1;
      timer=0;
    }
  } else if (rX<=1190&&rX>=770&&rY<=600&&rY>=300&&lX<=1190&&lX>=770&&lY<=600&&lY>=300) {
    //730-1230
    //250-650
    timer+=1;
    if (timer>30) {
      secondChoice=2;
      timer=0;
    }
  } else if (rX<=1720&&rX>=1320&&rY<=890&&rY>=590&&lX<=1720&&lX>=1320&&lY<=890&&lY>=590) {
    //1270-1770
    //540-940
    timer+=1;
    if (timer>30) {
      secondChoice=3;
      timer=0;
    }
  }
}


void chooseD() {
  if (rX<=640&&rX>=230&&rY<=830&&rY>=510&&lX<=640&&lX>=230&&lY<=830&&lY>=510) {
    //190-690
    //470-870
    timer+=1;
    if (timer>30) {
      thirdChoice=1;
      timer=0;
    }
  } else if (rX<=1190&&rX>=770&&rY<=600&&rY>=300&&lX<=1190&&lX>=770&&lY<=600&&lY>=300) {
    //730-1230
    //250-650
    timer+=1;
    if (timer>30) {
      thirdChoice=2;
      timer=0;
    }
  } else if (rX<=1720&&rX>=1320&&rY<=890&&rY>=590&&lX<=1720&&lX>=1320&&lY<=890&&lY>=590) {
    //1270-1770
    //540-940
    timer+=1;
    if (timer>30) {
      thirdChoice=3;
      timer=0;
    }
  }
}

void chooseE() {
  if (rY<=shoulderRY&&lY<=shoulderRY) {
    timer+=1;
    if (timer>30) {
      gameState="drawFlake";
      timer=0;
    }
  }
}



//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  //handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  popMatrix();
}

void movieEvent(Movie m) { 
  m.read();
} 

void keyPressed() {
  if (key=='s') {
    firstChoice=firstChoice+1;
  } else if (key=='d') {
    secondChoice=secondChoice+1;
  } else if (key=='f') {
    thirdChoice=thirdChoice+1;
  } else if (key=='g') {
    gameState="drawFlake";
    lastStage=lastStage+1;
  } else if (key=='a') {
    eventChoice=eventChoice+1;
  }
}  