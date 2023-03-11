settings.outformat="pdf";
settings.prc = false;
settings.render=4;
import three;
import graph3;
size(0,3cm);

//point of view 
currentprojection = orthographic(3,4,1);


//cylinder
draw(scale(4.4,1,1)*rotate(90, Y) * unitcylinder,  surfacepen=material(diffusepen=lightblue,
    emissivepen=deepgrey, specularpen=grey));
draw((0,0,0)--1.1Z,invisible);

//acoustic wave 
triple f(real t) {
    return (-t, 0, 0.4*sin(5*t)-0.05);
}
path3 spiral = graph(f, -5.6, 1.45, operator ..);
draw(spiral, arrow=Arrow3(DefaultHead2, emissive(black)));

//gray measurement plan 
path planeoutline = box((-1.2,-1.2),  (1.2,1.2));
draw(shift(4,0,0)*rotate(90,Y)*surface(planeoutline), surfacepen=mediumgrey+opacity(0.8), light=nolight);

//measurement points
surface tri = unitcone; 
draw(shift(4,0,0.8)*scale(0.005,0.12,0.15)*tri,red,light=nolight); 
draw(shift(4,0.5,0.6)*scale(0.005,0.12,0.15)*tri,red,light=nolight); 
draw(shift(4,-0.5,0.6)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
  draw(shift(4,0.7,0.3)*scale(0.005,0.12,0.15)*tri,red,light=nolight); draw(shift(4,-0.7,0.3)*scale(0.005,0.12,0.15)*tri,red,light=nolight); 
draw(shift(4,0,-0.8)*scale(0.005,0.12,0.15)*tri,red,light=nolight); 
draw(shift(4,0.5,-0.6)*scale(0.005,0.12,0.15)*tri,red,light=nolight); 
draw(shift(4,-0.5,-0.6)*scale(0.005,0.12,0.15)*tri,red,light=nolight);  
draw(shift(4,0.7,-0.3)*scale(0.005,0.12,0.15)*tri,red,light=nolight); 
draw(shift(4,-0.7,-0.3)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,-0.8,0)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,0.8,0)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,0,0.5)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,0,-0.5)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,0.3,0.2)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,-0.3,0.2)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,0.3,-0.2)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,-0.3,-0.2)*scale(0.005,0.12,0.15)*tri,red,light=nolight);
draw(shift(4,0,0)*scale(0.005,0.12,0.15)*tri,red,light=nolight);