class PictureMaker {
  ArrayList<lineMaker> lines;
  int healthiest;
  int healthiestIndex;
  int generationSize = gens;
  PImage target;
  color pen;
  color bgnd;
  PictureMaker(PImage t, color bg, color p) {
    pen = p;
    bgnd=bg;
    lines=new ArrayList<lineMaker>();
    target = t;
    for (int c=0; c<generationSize; c++) {
      lines.add(new lineMaker(target, bg, p));
    }
  }

  void processPictures() {
    for (int c =0; c<lines.size(); c++) {
      lineMaker line= lines.get(c);
      line.update();
      line.show();
      line.updateHealth();
    }
  }

  lineMaker getHealthiest() {
    int index= 0;
    healthiest = lines.get(index).health;
    //println(healthiest);
    for (int count = 1; count < lines.size(); count ++) {
      if (lines.get(count).health < healthiest) {
        healthiest = lines.get(count).health;
        index = count;
      }
    }
    healthiestIndex = index;
    return lines.get(index);
  }

  void nextGeneration() {
    lineMaker h = lines.get((int)healthiestIndex);
    lines = new ArrayList<lineMaker>();
    int brushSize =(int)random(lineLength);
    for (int c = 0; c<generationSize; c++) {
      PGraphics newP = createGraphics(h.pic.width, h.pic.height);
      newP.pixels = h.pic.pixels;

      lineMaker d = new lineMaker(h.DNA, h.next, h.prev, target, bgnd, pen,brushSize, newP);
      //d.xoff=h.xoff;
      //d.yoff=h.yoff;
      //lineMaker d = lines.get(c); //new lineMaker( h.prev, h.next, target, bgnd,pen);
      d.target = target;
      lines.add(d);
    }
    lines.add(h);
  }
}
