% function [k1 k2] = find_str(str,k1)
% 
% k2=k1+1;
% while str(k2)==' ' k2=k2+1 end
% 
% k1=k2;
% 
% while str(k1) ~=' '
%     if k1==length(s)
%         break
%     end
%     k1=k1+1;
%     

function [k1 k2]=find_k1k2(s,k2)
   k1=k2+1;
   while s(k1)==' ' 
       k1=k1+1; 
   end
   k2=k1; 
   while s(k2)~=' '
    if k2==length(s)
        break
    end
    k2=k2+1;
   end
       