clear all;
close all;
x = [0.1:1/22:1];
d = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;
figure(1);
plot (x,d, 'b'); grid on

%iš akies c1, c2, sigma1, sigma2 iš grafiko
%%Pasirinkti spindulio tipo bazinių funkcijų parametrus

c1 = 0.19;
c2 = 0.91;
sigma1 = 0.151;
sigma2 = 0.153;
w0 = rand(1);
w1 = rand(1);
w2 = rand(1);
mokymo_zingsnis = 0.05;

%% Skaičiuojame SBF atsakus
for indx_of_epoch = 1:10000
    for n = 1:length(x)
        Phi_1 = exp(-((x(n) - c1)^2)/(2*sigma1^2));
        Phi_2 = exp(-((x(n) - c2)^2)/(2*sigma2^2));
        %% Skaiciuojame tinklo atsaka
        v = Phi_1*w1 + Phi_2*w2 + w0;
        y = v;
        %% Palyginame atsaka su teisingu atsakymu
        e = d(n) - y  ;
        %% Atnaujinkime rysiu svorius
        w1 = w1 + mokymo_zingsnis*e*Phi_1;
        w2 = w2 + mokymo_zingsnis*e*Phi_2;
        w0 = w0 + mokymo_zingsnis*e;
    end
end


%% Tikrinimas
hold on
    for n = 1:length(x)
        Phi_1 = exp(-((x(n) - c1)^2)/(2*(sigma1)^2));
        Phi_2 = exp(-((x(n) - c2)^2)/(2*(sigma2)^2));
        %% Skaiciuojame tinklo atsaka
        v = Phi_1*w1 + Phi_2*w2 + w0;
%         if v>0
%             y = 1;
%             plot(x1(n), x2(n), 'r*');
%         else
%             y = 0;
%             plot(x1(n), x2(n), 'g+');
%         end

        y = v;
        plot (x(n), y, 'r*');
        %% Palyginame atsaka su teisingu atsakymu
        %e = d(n) - y  ;
        %% Atnaujinkime rysiu svorius
        %w1 = w1 + mokymo_zingsnis*e*x1(n);
        %w2 = w2 + mokymo_zingsnis*e*x2(n);
        %w0 = w0 + mokymo_zingsnis*e;
    end




