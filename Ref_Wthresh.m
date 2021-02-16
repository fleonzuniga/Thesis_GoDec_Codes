function y = Ref_Wthresh(x,sorh,t)
	switch sorh
		case 's'
			tmp = (abs(x)-t);
			tmp = (tmp+abs(tmp))/2;
			y = sign(x).*tmp;
		case 'h'
			y = x.*(abs(x)>t);
		otherwise
			error('Invalid argument value.');
end
 
