clear all

dt = 0.05;
t  = 0:dt:20;

Nsamples = length(t);

Xsaved = zeros(Nsamples, 3);
Zsaved = zeros(Nsamples, 1);
               
for k=1:Nsamples
  r = GetRadar(dt); 

  [pos, vel, alt] = RadarEKF(r, dt);
  
  Xsaved(k, :) = [pos vel alt];
  Zsaved(k)    = r;
end 


PosSaved = Xsaved(:, 1);
VelSaved = Xsaved(:, 2);
AltSaved = Xsaved(:, 3);

t = 0:dt:Nsamples*dt-dt;

figure
plot(t, PosSaved, 'r')
xlabel('Time [sec]')
ylabel('Position [m]')

figure
plot(t, VelSaved, 'r')
xlabel('Time [sec]')
ylabel('Speed [m/s]')

figure
plot(t, AltSaved, 'r')
xlabel('Time [sec]')
ylabel('Altitude [m]')