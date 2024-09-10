class lineMaker {
  PVector prev;
  PVector next;
  float xoff = random(100);
  float yoff = random(100);

  ArrayList<singleLine> DNA;
  PGraphics pic;
  int health;
  color bgnd;
  color pen;
  PImage target;
  int lineLength;
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
  lineMaker(ArrayList<singleLine> dnaItems, PVector nxt, PVector pvs, PImage tgt, color bg, color p, int bWidth, PGraphics cp) {
    DNA = new ArrayList<singleLine>();
    bgnd = bg;
    pen = p;
    target = tgt;
    lineLength=bWidth;
    for (singleLine t : dnaItems) {
      singleLine n = new singleLine(t.loc.x, t.loc.y, t.col, t.linewidth);
      DNA.add(n);
    }
    next =nxt.copy();
    prev= pvs.copy();
    pic = cp; // createGraphics(tgt.width, tgt.height );
  }



  void update() {

      float radius = lineLength;
    float nextx=-100, nexty=-100;
    float angle;

    while (nextx < 0 || nextx > (pic.width) || nexty< 0 || nexty > pic.height) {
      angle = random(0, 2*PI);
      float xrand = radius * cos(angle);
      nextx = prev.x + xrand;
      float yrand = radius * sin(angle);
      nexty=prev.y + yrand;
    }
    next = new PVector(nextx, nexty);
    color col = color(0);
    
    if(colMode == rgb) {
      int r = (int)random(3);
      if (r < 1){
        col = color(255,0,0);
      } else if(r<2) {
        col = color(0,255,0);
      } else {
        col = color(0,0,255);
      }
    } else if (colMode == targetpallet) {
      col = target.pixels[floor(random(0, target.pixels.length))];
    } else if (colMode == randomcolour) {
      col =color( random(255),random(255),random(255),random(255));
    } else if (colMode == bw) {
       col = color(0);
    } else if (colMode == grey) {
      col = color(random(255));
    }
    float lw =(int) (lineWidth);
    singleLine n= new singleLine(nextx, nexty, col, lw);
    DNA.add(n);
  }

  void show() {
    pic.beginDraw();
    pic.background(255);
    prev=next.copy();
    for (int c=0; c<DNA.size(); c++) {
      singleLine t = DNA.get(c);
      if (c+1<DNA.size()) {
        singleLine nxt = DNA.get(c+1);
        pic.stroke(t.col);
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
    pic.loadPixels();
    t.loadPixels();
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
