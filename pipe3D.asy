settings.outformat="pdf";
settings.prc = false;
settings.render=4;
import three;
import gsl;
import graph3;
size(0,3cm);
//point of view 
currentprojection = orthographic(3,4,1);
draw((0,0,0)--1.1Z,invisible);


//indicator function of the defect 
real bol(pair uv){
real t = uv.x;
real r = uv.y; 
if (r>pi/2.5-0.3) {
if (r<pi/2.5+0.3) {return (1);}
}
return (0);
}

//surface of cylinder 
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (t,cos(r)*(1+exp(-(t-2)^2*2)*3*(r-pi/2.5-0.3)*(r-pi/2.5+0.3)*bol((t,r))), sin(r)*(1+exp(-(t-2)^2*2)*3*(r-pi/2.5-0.3)*(r-pi/2.5+0.3)*bol((t,r))));
}
surface moeb = surface(F, (-1,0), (5,2*pi),Spline);
draw(moeb,  surfacepen=material(diffusepen=lightblue, emissivepen=deepgrey+opacity(0.7), specularpen=grey+opacity(0.7)));


//small inhomogeneity
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (t,1.1*cos(r), 1.1*sin(r));
}
surface moeb = surface(F, (0,pi/12-0.2), (0.5,pi/12+0.2),Spline);
draw(moeb,  surfacepen=material(diffusepen=deepmagenta, emissivepen=deepgrey+opacity(0.7), specularpen=grey+opacity(0.7)));


//interior of the cylinder
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (t,cos(r)*(0.8+exp(-(t-2)^2*2)*3*(r-pi/2.5-0.3)*(r-pi/2.5+0.3)*bol((t,r))), sin(r)*(0.8+exp(-(t-2)^2*2)*3*(r-pi/2.5-0.3)*(r-pi/2.5+0.3)*bol((t,r))));
}
surface moeb = surface(F, (-1,0), (5,2*pi),Spline);
draw(moeb,  surfacepen=material(diffusepen=lightblue, emissivepen=deepgrey+opacity(0.7), specularpen=grey+opacity(0.7)));


//left of the cylinder
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (5,cos(r)*t,sin(r)*t);
}
surface moeb = surface(F, (0.8,0), (1,2*pi),Spline);
draw(moeb,  surfacepen=material(diffusepen=lightblue, emissivepen=deepgrey+opacity(0.7), specularpen=grey+opacity(0.7)));

// axes
draw((4,0,1.1)--(3.3,0,1.1), arrow=Arrow3(DefaultHead2));
label("$e_z$", (3.2,0,1.1), align=N,fontsize(8pt)+darkgray);
draw((4,0,1.1)--(4,0,1.8), arrow=Arrow3(DefaultHead2));
label("$e_r$", (3.7,0,1.5), align=N,fontsize(8pt)+darkgray);
draw((4,0,1.1)--(4,0.7,1.1), arrow=Arrow3(DefaultHead2));
label("$e_\theta$", (4,0.8,0.8), align=N,fontsize(8pt)+darkgray);

// width 
draw((5,0.8,0)--(5,1,0),white,arrow=Arrow3(DefaultHead2,size=2pt, emissive(white))); 
draw((5,1,0)--(5,0.8,0),white,arrow=Arrow3(DefaultHead2,size=2pt, emissive(white))); 
label("$2\varepsilon$", (4.9,1.2,0), align=N,fontsize(8pt)+white);
