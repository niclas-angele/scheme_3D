settings.outformat="pdf";
settings.prc = false;
settings.render=4;
import three;
import graph3;

size(0,3cm);
triple v=(1,1,0); 
// point of view
currentprojection=orthographic((5,2,1.4));
//invisible vectors to ensure we see all the scheme
draw(-1.5Z--1.5Z,invisible);
draw(-6X--6X,invisible);
draw(-6Y--6Y,invisible);

//top surface
real f(pair xy) {
real x = xy.x; real y = xy.y;
  return 0.5+0.4*1/sqrt(x^2+y^2+1)*cos(4*sqrt(x^2+y^2));
}
real xmax = 4;  real xmin = -4;
real ymax = 4;  real ymin = -4;
surface s = surface(f, (xmin,ymin), (xmax,ymax), Spline);
draw(s, surfacepen=material(diffusepen=lightblue,
    emissivepen=deepgrey, specularpen=grey));


//right surface
triple F(pair uv) {
real t = uv.x;
real r = uv.y;
return (t, 4+0.05*cos(4*sqrt(t^2+16))*(r-1)*(1+r), r*(0.5+0.4*1/sqrt(t^2+16+1)*cos(4*sqrt(t^2+16))));
}
surface moeb = surface(F, (-4,-1), (4.04,1),Spline);
draw(moeb,  surfacepen=material(diffusepen=lightblue, emissivepen=deepgrey, specularpen=grey));


//left surface
triple F(pair uv) {
real t = uv.x;
real r = uv.y;
return (4+0.05*cos(4*sqrt(t^2+16))*(r-1)*(1+r), t, r*(0.5+0.4*1/sqrt(t^2+16+1)*cos(4*sqrt(t^2+16))));
}
surface moeb = surface(F, (-4,-1), (4.04,1),Spline);
draw(moeb, surfacepen=material(diffusepen=lightblue,emissivepen=deepgrey, specularpen=grey));

//gray bow of measurements 
path planeoutline = box((-0.7,-4.3),  (0.7,4.3));
draw(shift(3.9,0,0)*rotate(90,Y)*surface(planeoutline), surfacepen=mediumgrey+opacity(0.7), light=nolight);

//measurements points
surface tri = unitcone; draw(shift(3.8,3,f((3.8,3)))*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(3.8,1,f((3.8,1))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(3.8,-1,f((3.8,-1))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(3.8,-3,f((3.8,-3)))*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(2,2,f((2,2))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(2,0,f((2,0))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(2,-2,f((2,-2))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); //draw(shift(0,3,f((0,3)))*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(0,1,f((0,1))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(0,-1,f((0,-1))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(0,-3,f((0,-3)))*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-3.2,3,f((3.8,3)))*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-3.2,1,f((3.8,1))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-3.2,-1,f((3.8,-1))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-3.2,-3,f((3.8,-3)))*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-1.6,2,f((2,2))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-1.6,0,f((2,0))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 
draw(shift(-1.6,-2,f((2,-2))+0.1)*rotate(-60,Y)*scale(0.005,0.2,0.25)*tri,red,light=nolight); 