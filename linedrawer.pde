PictureMaker pm;
//QuadPictures q;
int lineLength =10;
float lineWidth = 1;
//int multiplier = 1;
int gens =30;
PImage tg;
color black1 = color(0);
color white1 = color(255);
int rgb =0;
int targetpallet = 2;
int randomcolour=3;
int bw = 4;
int grey = 5;



int colMode = bw;
//float xoff=0;
//float yoff=0.50;
void settings() {
  tg = loadImage("lennon.jpg");  
  size(tg.width*2, tg.height, P2D);
}

void setup() {
  //q = new QuadPictures(tg,2);
  pm = new PictureMaker(tg, white1, black1);
  strokeWeight(1);
}
void draw() {
  //}
  //void mouseClicked(){
  //lineMaker healthiest=pm.getHealthiest();


  //save("data\\" + healthiest.health + '-' + frameCount*1 + "-pic.jpg");
  //println("data\\" + healthiest.health + '-' + frameCount*1 + "-pic.jpg");
  //}
  //void draw() {
  //lineLength =floor( map(mouseX,0,width,0,300));


  
  lineMaker healthiest=null;

  pm.processPictures();


  healthiest= pm.getHealthiest();
  pm.nextGeneration();

  //image(q.imgs.get(0),0,0);
  //image(q.imgs.get(1),0,height/2);
  //image(q.imgs.get(2),width/4,0);
  //image(q.imgs.get(3),width/4,height/2);

  //image( q.update(), 0, 0);

  //healthiest.show();
  //if (frameCount % 1 ==0) {
    background(255);
    image(healthiest.pic, 0, 0);
    image(tg, width/2, 0);
    fill(0);
    text(frameCount, 10, 10);
  //}

  

  
}
