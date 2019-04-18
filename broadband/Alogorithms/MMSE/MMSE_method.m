function  [V_mopt, W_mopt] = MMSE_method(k)

%the algorithm for fully_digital design
%cite the paper Generalized linear precoder and decoder design for MIMO channels using the
%weighted mmse criterion

global Ns Vn H Nr;

Hk = H(:,:,k);
[Nr,~] = size(Hk);
Rnn = Vn *eye(Nr) ;
S = Hk' * Rnn^(-1) * Hk ;
[A,B] = eig(S);
%% ����ֵ�ֽ�+��������ȡǰN_RF��
b = diag(B) ;
[B_sort, B_index] = sort(b,'descend');
A = A(:,B_index);
B = diag(B_sort);
A = A(:,1:Ns);
B = B(1:Ns,1:Ns);
b = diag(B) ;
c = diag(B.^(-1/2));  %\lamda ^-1/2
C = diag(c);
d = diag(B.^(-1));
D = diag(d);
%% ��� /mu + 1
n = Ns;
while ( n>0)
    u = sum(c(1:n))/(1+sum(d(1:n)));   %\mu^1/2
    if u <= b(n)
        break
    else
        n = n - 1;
    end
end

f = (u^(-1) * C - D)^(0.5);
M = zeros(Ns,Ns);
M(1:n,1:n) = f(1:n,1:n);   %ȡǰ����
K = (u * C - u^2 * D )^(0.5) * C;
Y = zeros(Ns,Ns);
Y(1:n,1:n) = K(1:n,1:n);
V_mopt = A * M;
W_mopt = (Y * A' * Hk' * Rnn^(-1))';

