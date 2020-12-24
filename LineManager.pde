//class lineMaker {
//  PVector prev;
//  PVector next;
//  //ArrayList<singleLine> DNA;
//  float strokeLength = lineLength;
//  PGraphics pic;
//  //PImage pic;
//  int health;
//  color bgnd;
//  color pen;
//  singleLine currentLine;
//  PImage crnt;
//  PImage target;
//  lineMaker(PImage t, color bg, color p) {
//    target=t;
//    crnt=createImage(target.width , target.height,RGB);
//    crnt.loadPixels();
//    for(int i=0;i<crnt.pixels.length  ;i++){
//      crnt.pixels[i]=color(255);
//    }
//    crnt.updatePixels();
//    bgnd = bg;
//    pen = 0;
//    pic = createGraphics(target.width, target.height ,P2D);
//    //DNA = new ArrayList<singleLine>();
//    next =new PVector();//random(width), random(height));
//    prev=new PVector(random(pic.width), random(pic.height));//new PVector();

//    //target.loadPixels();

//    color col = color(random(255));
//    //singleLine s = new singleLine(prev.x, prev.y, col, lineWidth);
//    update();
//    //DNA.add(s);
//    //col = color(target.pixels[(int)random(target.pixels.length)]);
//    //s = new singleLine(next.x, next.y, col, lineWidth);
//    //DNA.add(s);    

//    //target.updatePixels();
//  }
//  //lineMaker(PVector nxt, PVector pvs, PImage tgt, color bg, color p) {
//  //  //DNA = new ArrayList<singleLine>();
//  //  //bgnd = bg;
//  //  pen = 0;
//  //  target = tgt;
//  //  //for (singleLine t : dnaItems) {
//  //  //  singleLine n = new singleLine(t.loc.x, t.loc.y, t.col, lineWidth);
//  //  //  DNA.add(n);
//  //  //}
//  //  //crnt=createImage(target.width , target.height,RGB);
//  //  //crnt.loadPixels();
//  //  //for(int i=0;i<crnt.pixels.length;i++){
//  //  //  crnt.pixels[i]=color(255);
//  //  //}
//  //  //crnt.updatePixels();
//  //  //crnt.loadPixels();
//  //  next =nxt.copy();
//  //  prev= pvs.copy();
//  //  pic = createGraphics(target.width, target.height ,P2D);
//  //}
//  void update() {
//    float nextx=-100, nexty=-100;
//    while (nextx< -10 || nextx > (pic.width)+10) {
//      float xrand = random(-strokeLength, strokeLength);

//      nextx=prev.x + xrand;
//    }

//    while (nexty< -10 || nexty > pic.height+10) {
//      float yrand = random(-strokeLength, strokeLength);
//      nexty=prev.y + yrand;
//    }
//    next = new PVector(nextx, nexty);

//    //color col =color( random(255),random(255),random(255),random(255));
//    //color color(red(col), green(col), blue(col), random(255 ));
//    //float lw = map(mouseY,0,width,0,50);

//    singleLine n= new singleLine(nextx, nexty, color(0), lineWidth);
//    currentLine=n;
//    //DNA.add(n);
//  }
//  void show() {
    
    
//    pic.beginDraw();
//    pic.image(crnt,0,0);
//    pic.loadPixels();
    
     
//    //pic.pixels=crnt.pixels;
    
//    pic.stroke(pen);
//    //pic.stroke(pen,255);
//    pic.strokeWeight(lineWidth);
//    pic.line(prev.x, prev.y, currentLine.loc.x, currentLine.loc.y);
//    prev=currentLine.loc.copy();

   
//    pic.updatePixels();
//    crnt.loadPixels();
//    crnt.pixels=pic.pixels;
//    crnt.updatePixels();
    
//    pic.endDraw();

//  }
//  void updateHealth() {
//    health = getHealth(target);
//  }
//  int getHealth( PImage t) {
//    health=0;
//    pic.loadPixels();
//    t.loadPixels();
//    for (int px=0; px<min(t.pixels.length, pic.pixels.length); px++) {
//      color so, tg;
//      so = pic.pixels[px]; 
//      tg = target.pixels[px];
//      int r, g, b;
//      r=abs((int)(red(so)-red(tg)));
//      g=abs((int)(green(so)-green(tg)));
//      b=abs((int)(blue(so)-blue(tg)));
//      health +=r+g+b;
//    }
//    return health;
//  }
//}


//class singleLine {

//  int strokeLength;
//  color col;
//  PVector loc;
//  float linewidth;
//  singleLine(float x, float y, color c, float wd) {
//    loc = new PVector(x, y);
//    col = c;
//    linewidth=wd;
//  }
//}
