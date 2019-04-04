function [tipAccel, tipVel, tipDisp] = dynamics(data, C)

	tipAccel = (data(:,1)-mean(data(:,1)))/( C*9.8);
	tipVel = zeros(length(tvec),1);
	tipDisp = zeros(length(tvec),1);

	tipVel = cumtrapz(tipAccel)*dt;
    tipDisp = cumtrapz(tipVel)*dt;
end