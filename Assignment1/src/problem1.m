% Problem 1
A = [3 6 6; 4 8 8];
Pc = A * pinv(A' * A) * A'; %Projection matrix onto columnspace of A
Ar = A';
Pr = Ar * pinv(Ar' * Ar) * Ar'; % Projection matrix onto rowspace of A
B = Pc * A * Pr;
disp(B);