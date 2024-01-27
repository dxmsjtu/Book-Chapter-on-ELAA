close all;  clear all;
% 设置参数
num_samples = 10000; % 抽样次数
sigma = 1; % 正态分布的标准差
current_value = 0; % 初始值
% 存储采样结果的数组
samples = zeros(num_samples, 1);
% MCMC模拟
for i = 1:num_samples
    % 生成候选值
    proposal = current_value + sigma * randn;    
    % 计算接受概率
    acceptance_prob = min(1, exp(-(proposal^2 - current_value^2)/2));    
    % 决定是否接受候选值
    if rand < acceptance_prob
        current_value = proposal;
    end    
    % 保存样本
    samples(i) = current_value;
end
% 绘制结果
figure;fontsize =28;
histogram(samples, 'Normalization', 'pdf');
hold on;
x = -5:0.1:5;
y = exp(-x.^2/2) / sqrt(2*pi);
plot(x, y, 'r', 'LineWidth', 2);
legend('MCMC采样结果', '标准正态分布');
xlabel('样本值');
ylabel('概率密度');
title('MCMC采样结果与标准正态分布对比');
set(gca,'fontsize',fontsize);set(gcf, 'Position', get(0, 'Screensize'));
colorbar
