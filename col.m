function [u1, u2] = col(v1,v2,m1,m2)
    
    u1 = (v1*(m1-m2)+2*m2*v2)/(m1+m2);
    u2 = (v2*(m2-m1)+2*m1*v1)/(m1+m2);
    
end