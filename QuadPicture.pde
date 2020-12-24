//class QuadPictures {
//  ArrayList<PImage> imgs;
//  ArrayList<PictureMaker> pm;
//  int ww, hh;
//  int magnitude;
//  PImage target;
//  QuadPictures(PImage t, int mag) {
//    ww = t.width%mag;
//    hh=t.height%mag;
//    magnitude=mag;
//    pm=new ArrayList<PictureMaker>();
//    imgs=new ArrayList<PImage>();
//    for (int c=0; c<magnitude*magnitude; c++) {
//      PImage tmp = new PImage((t.width+ww)/mag, (t.height+hh)/mag);
//      tmp.loadPixels();
//      imgs.add(tmp);
//    }
//    target = t;
//    target.loadPixels();

//    for (int c=0; c<magnitude*magnitude; c++) {
//      imgs.get(c).loadPixels();
//    }
//    int p0 = 0, p1=0, p2=0, p3=0;

//    IntList p = new IntList();

//    for (int c=0; c<target.pixels.length; c++) {
//      //println(c + ": p0 " + p0 + " p1 " + p1 + " p2 " + p2 + " p3 " + p3 + " " + imgs.get(0).pixels.length) ;
//      float x, y;

//      x=c%t.width+ww ;
//      y=(int)c/target.width+hh;

//      int index;
//      index = (1+((int)x % magnitude)) * (1+( (int) y * magnitude)) ;

//      //int x1 = ((int)x % magnetude);
//      //int y1 = ((int)y / magnetude);
//      //println("X1:"+x1 + " X:"+x);
//      //println("Y1:"+y1+ " Y:"+y);

//      int ppp=0;
//      //ppp=((x1)*magnetude)+y1;

//      for (float pxl=0; pxl<magnitude*magnitude; pxl++) {
//        float wdh = target.width / magnitude;
//        float ht = target.height / magnitude;

//        if (x>wdh * pxl && x < (wdh*pxl)+wdh) {
//          if (x>wdh * pxl && x < (wdh*pxl)+wdh) {
            
//          }
//        }
//      }

//      println(ppp);
//      if (ppp==1) {
//        //if (x<=((target.width-ww)/magnetude)&&(y <= (target.height-hh)/magnetude)) {
//        PImage l = imgs.get(0);
//        l.pixels[p0] = target.pixels[c];
//        p0++;
//      } else if (ppp==2) {
//        //} else if (x<=((target.width-ww)/magnetude)&&(y > (target.height-hh)/magnetude)) {
//        PImage l = imgs.get(1);
//        println("P1 " + l.pixels.length);
//        l.pixels[p1] = target.pixels[c];
//        p1++;
//      } else if (ppp==3) {
//        //} else if (x>((target.width-ww)/magnetude)&&(y <= (target.height-hh)/magnetude)) {
//        PImage l = imgs.get(2);
//        l.pixels[p2] = target.pixels[c];
//        p2++;
//      } else if (ppp==4) {
//        //} else if (x> ((target.width-ww)/magnetude) && (y > (target.height-hh)/magnetude) ) {
//        PImage l = imgs.get(3);
//        l.pixels[p3] = target.pixels[c];
//        //println(1/0);
//        p3++;
//      }
//    }
//    target.updatePixels();

//    for (int c=0; c<magnitude*magnitude; c++) {
//      imgs.get(c).updatePixels();
//      PictureMaker tmp = new PictureMaker(imgs.get(c));

//      pm.add(tmp);
//    }
//  }
//  PImage update() {
//    PImage rtrn = new PImage(target.width, target.height);
//    ArrayList<lineMaker> healthiest=new ArrayList<lineMaker>();
//    for (PictureMaker pml : pm) {


//      int count = 0;
//      while (count<1) {
//        pml.processPictures();


//        healthiest.add(pml.getHealthiest());

//        pml.nextGeneration();
//        count++;
//      }
//    }
//    int p0 = 0, p1=0, p2=0, p3=0;
//    for (int c=0; c<rtrn.pixels.length; c++) {

//      float x, y;

//      x=c%target.width;
//      y=(int)c/target.width;
//      if ((x<=(target.width-ww)/magnitude)&&(y < (target.height-hh)/magnitude)) {
//        PImage l = healthiest.get(0).pic;
//        rtrn.pixels[c]=l.pixels[p0] ;
//        p0++;
//        //print(p0 + " ");
//      } else if ((x<=(target.width-ww)/magnitude)&&(y >= (target.height-hh)/magnitude)) {
//        PImage l = healthiest.get(1).pic;
//        rtrn.pixels[c]=l.pixels[p1] ;
//        p1++;
//        //print(1);
//      } else if ((x>=(target.width-ww)/magnitude)&&(y < (target.height-hh)/magnitude)) {
//        PImage l = healthiest.get(2).pic;
//        rtrn.pixels[c]= l.pixels[p2] ;
//        p2++;
//        //print(2);
//      } else if ((x>=(target.width-ww)/magnitude)&&(y >= (target.height-hh)/magnitude)) {
//        PImage l = healthiest.get(3).pic;
//        rtrn.pixels[c]=l.pixels[p3];
//        p3++;
//        //print(3);
//      }
//    }
//    return rtrn;
//  }
//  //PImage getImage() {
//  //  //println("GETIMAGE:");
//  //  float x, y;

//  //  int p0 = 0, p1=0, p2=0, p3=0;
//  //  PImage rtrn = new PImage(target.width, target.height);
//  //  rtrn.loadPixels();
//  //  for (int c=0; c>rtrn.pixels.length; c++) {
//  //    x=c%target.width;
//  //    y=(int)c/target.width;
//  //    if ((x<target.width/2)&&(y < rtrn.height/2)) {
//  //      PImage l = imgs.get(0);
//  //      l.loadPixels();
//  //      rtrn.pixels[c]=l.pixels[p0];

//  //      p0++;
//  //      //print(0);
//  //    } else if ((x<target.width/2)&&(y > rtrn.height/2)) {
//  //      PImage l = imgs.get(1);
//  //      l.loadPixels();
//  //      rtrn.pixels[c]=l.pixels[p1];
//  //      p1++;
//  //      //print(1);
//  //    } else if ((x>target.width/2)&&(y < rtrn.height/2)) {
//  //      PImage l = imgs.get(2);
//  //      l.loadPixels();
//  //      rtrn.pixels[c]=l.pixels[p2];
//  //      p2++;
//  //      //print(2);
//  //    } else if ((x>target.width/2)&&(y > rtrn.height/2)) {
//  //      PImage l = imgs.get(3);
//  //      l.loadPixels();
//  //      rtrn.pixels[c]=l.pixels[p3];
//  //      p3++;
//  //      //print(3);
//  //    }

//  //    color col = 0;
//  //    rtrn.pixels[c]=col;
//  //  }
//  //  rtrn.updatePixels();
//  //  return rtrn;
//  //}
//}
