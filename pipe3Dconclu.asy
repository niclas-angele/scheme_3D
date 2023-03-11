settings.outformat="pdf";
settings.prc = false;
settings.render=4;
import three;
import graph3;
size(0,3cm);
//choice of the view 
currentprojection = orthographic(3,4,1);
// invisible line to ensure that I see all the scheme
draw((0,0,0)--1.1Z,invisible);

//test function to localize the defect
real bol(pair uv){
real t = uv.x;
real r = uv.y; 
if (r>pi/4-0.3) {
if (r<pi/4+0.3) {return (1);}
}
return (0);
}

//surface definition 
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (t,cos(r)*(1+exp(-(t-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))), sin(r)*(1+exp(-(t-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))));
}
surface moeb = surface(F, (-1,0), (5,2*pi),Spline);
draw(moeb,  surfacepen=material(diffusepen=lightblue+opacity(0.7), emissivepen=deepgrey+opacity(0.7), specularpen=grey+opacity(0.7)));


//section x=2
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (2,t*cos(r)*(1+exp(-(2-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))), t*sin(r)*(1+exp(-(2-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))));
}
surface moeb = surface(F, (0,0), (1,2*pi),Spline);
draw(moeb,  surfacepen=black);

//section x=0
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (0,t*cos(r)*(1+exp(-(0-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))), t*sin(r)*(1+exp(-(0-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))));
}
surface moeb = surface(F, (0,0), (1,2*pi),Spline);
draw(moeb,  surfacepen=black);

//section x=4
triple F(pair uv) {
real t = uv.x;
real r = uv.y; 
return (4,t*cos(r)*(1+exp(-(0-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))), t*sin(r)*(1+exp(-(0-2)^2*2)*7*(r-pi/4-0.3)*(r-pi/4+0.3)*bol((t,r))));
}
surface moeb = surface(F, (0,0), (1,2*pi),Spline);
draw(moeb,  surfacepen=black);