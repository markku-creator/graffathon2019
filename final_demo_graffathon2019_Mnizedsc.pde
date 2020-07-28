/**
 * Demo Black Hole by Mnizedsc
 * Graffathon 2019
 * 
 */
 
 PShape earth;
 PShape moon;
 PShape blackhole;
 
 PImage backgroundtexture;
 PImage earthtexture;
 PImage moontexture;
 PImage blackholetexture;
  
 import moonlander.library.*;

// Minim must be imported when using Moonlander with soundtrack.
import ddf.minim.*;

Moonlander moonlander;
   
 void setup() {
   moonlander = Moonlander.initWithSoundtrack(this, "black_hole_music.mp3", 120, 1);
   // Production code setting
   size(889, 500, P3D); 
   // For testing on my laptop
   //size(1920, 1080, P3D); 
   
   noCursor();
   scale(width/2, height/2);
   scale(width/1000);
   colorMode(HSB,360,100,100);
   moonlander.start();
   
   earth = createShape(SPHERE, 150);
   moon = createShape(SPHERE, 150);
   blackhole = createShape(SPHERE, 50);
   
 }
 
 void draw() {
   moonlander.update();
   double beats = moonlander.getValue("beats");
   double scene = moonlander.getValue("scene");

   double hue = beats/65.0 * 360.0;
   double saturation = beats/65.0 * 100;
   double brightness = beats/65.0 * 100;
   hue = scene/5 * 360;
   saturation = scene/5 * 100;
   brightness = scene/5 * 100;
   if ((scene > 0.9) && (scene < 1.1)) brightness = 100;
   if ((scene > 1.9) && (scene < 2.1)) brightness = 100;
   if ((scene > 2.9) && (scene < 3.1)) brightness = 100;
   if ((scene > 3.9) && (scene < 4.2)) brightness = 100;  
   background((int)hue,(int)saturation,(int)brightness);
      
   // SCENE 1
   if ((scene >= 1.0) && (scene < 2.0)) {
  
   pushMatrix();
   translate(width/2, height/1.3, -300);
   for (int i = 0;i<(int)((2*beats)-0.5);i++) {
   //translate((width/2)-(width/(2+(int)(beats))), (height/2)-(height/(2+(int)(beats))), -300.0);  
   translate(-(float)beats, -(float)beats, -30.0);  
   rotateY(PI * frameCount / 500);
   shape(earth);
   }
   popMatrix();
   
   }
   
   // SCENE 2
   if ((scene >=2.0) && (scene < 3.0)) {

   pushMatrix();
   translate(width/2, height/1.3, -300);
   for (int i = 0;i<(int)((2*beats)-0.5);i++) {
   //translate((width/2)-(width/(2+(int)(beats))), (height/2)-(height/(2+(int)(beats))), -300.0);  
   translate(-(float)beats, -(float)beats, -30.0);  
   rotateY(PI * frameCount / 300);
   rotateX(PI * frameCount / 300);
   shape(earth);
   }
   popMatrix();
   
   pushMatrix();
   translate(width/1.5, height/1.3, -300);
   for (int i = 0;i<(int)((2*beats)-0.5);i++) {
   //translate((width/2)-(width/(2+(int)(beats))), (height/2)-(height/(2+(int)(beats))), -300.0);  
   translate(-(float)beats, -(float)beats, -30.0);  
   rotateX(PI * frameCount / 300);
   rotateY(PI * frameCount / 300);
   shape(earth);
   }

   popMatrix();
   
   }
   
   // SCENE 3
   if ((scene >= 3.0) && (scene < 4.0)) {
   translate(width/2, height/2, -300);  
  
for (int ii=0;ii<((beats-33)/2);ii++) {
   pushMatrix();
   translate(ii*100,ii*150,0);
   rotateY(PI * frameCount / 500);
   rotateX(PI * frameCount / 300);
   shape(earth);

   pointLight(255,  255,  255,  0,  0,  0);  
   rotateY(PI * frameCount / 300);
   translate(0, 0, 300);
   shape(moon);  
   popMatrix();
}
  
   }
   
   // SCENE 4
   if ((scene >= 4.0) && (scene < 5.0)) {
    
   translate(width/2, height/2, -300);      
   
   pushMatrix();
   translate(0,0,0);
   rotateY(PI * frameCount / 500);
   rotateX(PI * frameCount / 300);
   shape(earth);

   pointLight(255,  255,  255,  0,  0,  0);  
   rotateY(PI * frameCount / 300);
   translate(0, 0, 300);
   shape(moon);  
   popMatrix();   
   
   for (int iii=0;iii<(beats-49);iii++) {
     pushMatrix();
     noLights();
     pointLight(255,  255,  255,  0,  0,  -150); 
     translate(0.75 * width-(iii*100),  0.6 * height-(iii*100),  50);
     shape(blackhole);           
     popMatrix();
   }

   }
   
   // SCENE 5 = END TEXTS
   if ((scene >= 5.0) && (scene < 6.0)) {

     // end texts here
     
     textSize(100);
     text("Black Hole", (width/2)-(width/3.4), 150);
     text("Demo by Mnizedsc", (width/2)-(width/3.4), 250);
     text("Graffathon 2019", (width/2)-(width/3.4), 400);
    
   }
   
   // SCENE 6 = EXIT
   if (scene >= 6.0) {
     exit();
   }
        
 }
