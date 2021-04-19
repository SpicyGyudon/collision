% 완전탄성충돌
clear; clc;
L1 = 0.1; L2 = 0.2;
m1 = 1; m2 = 10000000000;

x1 = 1;
x2 = 3;

v1 = 0  ;
v2 = -1 ;

dt = 0.0000001;
time_final = 10;
interval_number = 1000000;
idx=1;
N=0;
col_num = 0;
for i = 0:dt:time_final
    x1 = x1 + v1*dt;
    x2 = x2 + v2*dt;
    
    if (x1+L1)>(x2-L2)
       [v1,v2] = col(v1,v2,m1,m2); 
       col_num = col_num+1;
    end
    
    if x1-L1 < 0
        v1 = -1*v1;
        col_num = col_num+1;
    end
    if N==interval_number
        X1(idx) = x1;
        X2(idx) = x2;
        Col(idx) = col_num;
        idx = idx + 1;
        N=0;
    end
    N=N+1; 
end

for i = 1:length(X1)
    figure(1)
    plot([X1(i)+L1 X1(i)+L1 X1(i)-L1 X1(i)-L1 X1(i)+L1],[0 2*L1 2*L1 0 0],'r-')
    hold on;
    plot([X2(i)+L2 X2(i)+L2 X2(i)-L2 X2(i)-L2 X2(i)+L2],[0 2*L2 2*L2 0 0],'b-')
    plot([0 0],[-10 10],'k-','LineWidth',2)
    plot([0 10],[0 0],'k-','LineWidth',2)
    hold off;
    text(4,1,'time = ')
    text(4,2,'# of Collision = ')
    text(5,1,num2str(i*interval_number*dt))
    text(5,2,num2str(Col(i)))
    axis([0 8 0 4])
    
end
