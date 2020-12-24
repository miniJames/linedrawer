class lineMaker {
  PVector prev;
  PVector next;
  float xoff = random(100);
  float yoff = random(100);

  ArrayList<singleLine> DNA;
  float strokeLength = lineLength;
  PGraphics pic;
  int health;
  color bgnd;
  color pen;
  PImage target;
  lineMaker(PImage t, color bg, color p) {
    target=t;
    bgnd = bg;
    pen = p;
    pic = createGraphics(target.width, target.height);
    DNA = new ArrayList<singleLine>();
    next =new PVector();//random(width), random(height));
    prev=new PVector(random(pic.width), random(pic.height));//new PVector();

    target.loadPixels();

    //color col = color(random(255));
    //singleLine s = new singleLine(prev.x, prev.y, col, 3);
    //update();
    ////DNA.add(s);
    //col = color(target.pixels[(int)random(target.pixels.length)]);
    //s = new singleLine(next.x, next.y, col, 3);
    //DNA.add(s);    

    target.updatePixels();
  }
  lineMaker(ArrayList<singleLine> dnaItems, PVector nxt, PVector pvs, PImage tgt, color bg, color p) {
    DNA = new ArrayList<singleLine>();
    bgnd = bg;
    pen = p;
    target = tgt;
    for (singleLine t : dnaItems) {
      singleLine n = new singleLine(t.loc.x, t.loc.y, t.col, t.linewidth);
      DNA.add(n);
    }
    next =nxt.copy();
    prev= pvs.copy();
    pic = createGraphics(tgt.width, tgt.height );
  }
  //void update() {
  //  xoff+=0.01;
  //  yoff+=0.01;
  //  float nextx = (noise(xoff) * width/2) ;
  //  //println(nextx);
  //  //while (nextx< -10 || nextx > (pic.width)+10) {
  //  //  float xrand = random(-strokeLength, strokeLength);

  //  //  nextx=prev.x + xrand;
  //  //}
  //  float nexty = (noise(yoff) * height) ;
  //  println(nexty);
  //  //while (nexty< -10 || nexty > pic.height+10) {
  //  //  float yrand = random(-strokeLength, strokeLength);
  //  //  nexty=prev.y + yrand;
  //  //}
  //  next = new PVector(nextx, nexty);
  //  //color col =color( random(255),random(255),random(255),random(255));
  //  color col = target.pixels[floor(random(0, target.pixels.length))];
  //  col = color(red(col), green(col), blue(col));
  //  //float lw = map(mouseY,0,width,0,50);
  //  singleLine n= new singleLine(nextx, nexty, col, lineWidth);
  //  DNA.add(n);
  //  prev = next.copy();
  //}
  void update() {
    float nextx=-100, nexty=-100;
    while (nextx< -10 || nextx > (pic.width)+10) {
      float xrand = random(-strokeLength, strokeLength);

      nextx=prev.x + xrand;
    }

    while (nexty< -10 || nexty > pic.height+10) {
      float yrand = random(-strokeLength, strokeLength);
      nexty=prev.y + yrand;
    }
    next = new PVector(nextx, nexty);
    //color col =color( random(255),random(255),random(255),random(255));
    color col = target.pixels[floor(random(0, target.pixels.length))];
    //col = color(red(col),green(col),blue(col),random(255 ));
    //float lw = map(mouseY,0,width,0,50);
    singleLine n= new singleLine(nextx, nexty, col,lineWidth);
    DNA.add(n);
  //prev=next.copy();
  }
  void show() {
    pic.beginDraw();
    pic.background(255);
    //DNA.add(next);
    prev=next.copy();
    for (int c=0; c<DNA.size(); c++) {
      pic.strokeWeight(1);
      singleLine t = DNA.get(c);
      if (c+1<DNA.size()) {
        singleLine nxt = DNA.get(c+1);
        pic.stroke(t.col);
        //pic.stroke(pen,255);
        pic.strokeWeight(nxt.linewidth);
        pic.line(t.loc.x, t.loc.y, nxt.loc.x, nxt.loc.y);
      }
    }
    pic.endDraw();
  }
  void updateHealth() {
    health = getHealth(target);
  }
  int getHealth( PImage t) {
    health=0;
    //pic.loadPixels();
    //t.loadPixels();
    for (int px=0; px<min(t.pixels.length, pic.pixels.length); px++) {
      color so, tg;
   
      so = pic.pixels[px]; 
      tg = target.pixels[px];
      
        // if(so!=0){
        //println("Found col " + so);
        
      //}
      int r, g, b;
      r=abs((int)(red(so)-red(tg)));
      g=abs((int)(green(so)-green(tg)));
      b=abs((int)(blue(so)-blue(tg)));
      health +=r+g+b;
    }
    return health;
  }
}


class singleLine {

  int strokeLength;
  color col;
  PVector loc;
  float linewidth;
  singleLine(float x, float y, color c, float wd) {
    loc = new PVector(x, y);
    col = c;
    linewidth=wd;
  }
}
