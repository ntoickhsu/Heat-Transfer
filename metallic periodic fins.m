%%Geometry of periodic fins
x = 0.14;
y = 0.04;
dx = 0.02;
dy = 0.02;

%% Coefficient and Temperature
h = 30;
k = 3;
Ta = 20;
Tb = 50;

M = floor(y/dy + 1);
N = floor(x/dx + 1);
T = Ta*ones(M,N);
ae = zeros(M,N) ;
aw = zeros(M,N);
an = zeros(M,N);
as = zeros(M,N);
c = zeros(M,N);
for i = 1:M
    T(i,1) = Tb;
end
max = 10000;
for r = 1:max
%%Zone1
    for j = 2:floor((N-1)*2/7)
        i = 1;
        ae(i,j) = k*dy/dx/2;
        aw(i,j) = k*dy/dx/2;
        an(i,j) = 0;
        as(i,j) = k*dx/dy;
        c(i,j) = 0;
        T(i,j) = (ae(i,j)*T(i,j+1)+aw(i,j)*T(i,j-1)+as(i,j)*T(i+1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));
    end
%%Zone2
    j = floor((N-1)*2/7+1);
    ae(1,j) = 0;
    aw(1,j) = k*dy/dx/2;
    an(1,j) = 0;
    as(1,j) = k*dx/dy/2;
    c(1,j) = h*dy/2;
    T(1,j) = (aw(1,j)*T(1,j-1)+as(1,j)*T(1+1,j)+c(1,j)*Ta)/(ae(1,j)+aw(1,j)+an(1,j)+as(1,j)+c(1,j));
%%Zone3
    for i = 2:floor((M-1)/2+1)
        for j = 2:floor((N-1)*2/7)
            ae(i,j) = k*dy/dx;
            aw(i,j) = k*dy/dx;
            an(i,j) = k*dx/dy;
            as(i,j) = k*dx/dy;
            c(i,j) = 0;
            T(i,j) = (ae(i,j)*T(i,j+1)+aw(i,j)*T(i,j-1)+an(i,j)*T(i-1,j)+as(i,j)*T(i+1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));
        end
    end
    if M > 3;
%%Zone4
        j = floor((N-1)*2/7+1);
        ae(2,j)= 0;
        aw(2,j) = k*dy/dx;
        an(2,j) = k*dx/dy/2;
        as(2,j) = k*dx/dy/2;
        c(2,j) = h*dy;
        T(2,j) = (ae(2,j)*T(2,j+1)+aw(2,j)*T(2,j-1)+an(2,j)*T(2-1,j)+as(2,j)*T(2+1,j)+c(2,j)*Ta)/(ae(2,j)+aw(2,j)+an(2,j)+as(2,j)+c(2,j));
%%Zone5
         for j = 2 :floor(N-1)
            ae(4,j) = k*dy/dx;
            aw(4,j) = k*dy/dx;
            an(4,j) = k*dx/dy;
            as(4,j) = k*dx/dy;
            c(4,j) = 0;
            T(4,j) = (ae(4,j)*T(4,j+1)+aw(4,j)*T(4,j-1)+an(4,j)*T(4-1,j)+as(4,j)*T(4+1,j)+c(4,j)*Ta)/(ae(4,j)+aw(4,j)+an(4,j)+as(4,j)+c(4,j));
         end
%%Zone6
         ae(4,N) = 0;
         aw(4,N) = k*dy/dx;
         an(4,N) = k*dx/dy/2;
         as(4,N) = k*dx/dy/2;
         c(4,N) = h*dy;
         T(4,N) = (aw(4,N)*T(4,N-1)+an(4,N)*T(4-1,N)+as(4,N)*T(4+1,N)+c(4,N)*Ta)/(ae(4,N)+aw(4,N)+an(4,N)+as(4,N)+c(4,N));
    else
    end
%%Zone7
    i = floor((M-1)/2+1);
    j = floor((N-1)*2/7+1);
    ae(i,j) = k*dy/dx/2;
    aw(i,j) = k*dy/dx;
    an(i,j) = k*dx/dy/2;
    as(i,j) = k*dx/dy;
    c(i,j) = h*(dx+dy)/2;
    T(i,j) = (ae(i,j)*T(i,j+1)+aw(i,j)*T(i,j-1)+an(i,j)*T(i-1,j)+as(i,j)*T(i+1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));
%%Zone8
    for j = floor((N-1)*2/7+2):N-1
       i = floor((M-1)/2+1);
       ae(i,j) = k*dy/dx/2;
       aw(i,j) = k*dy/dx/2;
       an(i,j) = 0;
       as(i,j) = k*dx/dy;
       c(i,j) = h*dx;
       T(i,j) = (ae(i,j)*T(i,j+1)+aw(i,j)*T(i,j-1)+an(i,j)*T(i-1,j)+as(i,j)*T(i+1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));
    end
%%Zone9
    i = floor((M-1)/2+1);
    j = floor(N);
    ae(i,j)= 0;
    aw(i,j) = k*dy/dx/2;
    an(i,j) = 0;
    as(i,j) = k*dx/dy/2;
    c(i,j) = h*(dx+dy)/2;
    T(i,j) = (aw(i,j)*T(i,j-1)+an(i,j)*T(i-1,j)+as(i,j)*T(i+1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));
%%Zone10
    for j = 2:floor(N-1);
        i = floor(M);
        ae(i,j) = k*dy/dx/2;
        aw(i,j) = k*dy/dx/2;
        an(i,j) = k*dx/dy;
        as(i,j) = 0;
        c(i,j) = 0;
        T(i,j) = (ae(i,j)*T(i,j+1)+aw(i,j)*T(i,j-1)+an(i,j)*T(i-1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));
    end  
%%Zone11
    i = floor(M);
    j = floor(N);
    ae(i,j) = 0;
    aw(i,j) = k*dy/dx/2;
    an(i,j) = k*dx/dy/2;
    as(i,j) = 0;
    c(i,j) = h*dy/2;
    T(i,j) = (aw(i,j)*T(i,j-1)+an(i,j)*T(i-1,j)+c(i,j)*Ta)/(ae(i,j)+aw(i,j)+an(i,j)+as(i,j)+c(i,j));    
    if abs(T(1,2)-((ae(1,2)*T(1,2+1)+aw(1,2)*T(1,2-1)+as(1,2)*T(1+1,2)+c(1,2)*Ta)/(ae(1,2)+aw(1,2)+an(1,2)+as(1,2)+c(1,2))))<0.0001;
        break;
    else
    end
end
figure(1);
contourf(dx*(1:M),dy*(1:N),T',100);
shading flat;
colorbar
hold on
[Tx,Ty]=gradient(T');
qx=-k*Tx;
qy=-k*Ty;
quiver(dx*(1:M),dy*(1:N),qx,qy,1,'k');
q = zeros(M,N);
i = 1;
j = floor((N-1)*2/7+1);
q(i,j) = h*dy/2*(T(i,j)-Ta);
if M > 3
q(2,3) = h*dy*(T(2,3)-Ta);
q(4,8) = h*dy*(T(4,8)-Ta);
else
end
i = floor((M-1)/2+1);
j = floor((N-1)*2/7+1);
q(i,j) = h*(dx+dy)/2*(T(i,j)-Ta);
for j = floor((N-1)*2/7+1+1):N-1
    i = floor((M-1)/2+1);
    q(i,j) = h*dx*(T(i,j)-Ta);
end
i = floor((M-1)/2+1);
j = N;
q(i,j) = h*(dx+dy)/2*(T(i,j)-Ta);
i = M;
j = N;
q(i,j) = h*dy/2*(T(i,j)-Ta);
qtot = sum(q(:));
qf = zeros(M,N);
if M > 3
qf(4,8) = h*dy*(T(4,8)-Ta);
else
end
i = floor((M-1)/2+1);
j = floor((N-1)*2/7+1);
qf(i,j) = h*(dx)/2*(T(i,j)-Ta);
for j = floor((N-1)*2/7+1+1):N-1
    i = floor((M-1)/2+1);
    qf(i,j) = h*dx*(T(i,j)-Ta);
end
i = floor((M-1)/2+1);
j = N;
qf(i,j) = h*(dx+dy)/2*(T(i,j)-Ta);
i = M;
j = N;
qf(i,j) = h*dy/2*(T(i,j)-Ta);
qftot = sum(qf(:));
qone = 2*qtot;
qfone = 2*qftot;
