clc;
clear;
close();

// Parameters - Easy to change
A = 1;           // Amplitude of each wave
f = 5;           // Frequency (Hz)
T = 1/f;         // Period
ω = 2*%pi*f;     // Angular frequency
t = linspace(0, 2*T, 500); // Time vector for 2 periods

// ===== MODULE 1: CONSTRUCTIVE INTERFERENCE (φ = 0) =====
φ1 = 0;
y1 = A * sin(ω * t);
y2 = A * sin(ω * t + φ1);
y_total1 = y1 + y2;           // Superposition
A_result1 = 2*A;              // Resultant amplitude (constructive)
disp("Module 1 - Constructive: A_result ="); disp(A_result1);

scf(1); clf();
plot(t, y1, 'b-', 'thickness', 2);
plot(t, y2, 'r--', 'thickness', 2);
plot(t, y_total1, 'g-', 'thickness', 3);
xlabel('Time (s)'); ylabel('Displacement');
title('Constructive Interference (φ = 0 rad)');
legend(['Wave 1', 'Wave 2', 'Resultant (2A)']);

// ===== MODULE 2: DESTRUCTIVE INTERFERENCE (φ = π) =====
φ2 = %pi;
y1 = A * sin(ω * t);
y2 = A * sin(ω * t + φ2);
y_total2 = y1 + y2;           // Superposition
A_result2 = 0;                // Resultant amplitude (destructive)
disp("Module 2 - Destructive: A_result ="); disp(A_result2);

scf(2); clf();
plot(t, y1, 'b-', 'thickness', 2);
plot(t, y2, 'r--', 'thickness', 2);
plot(t, y_total2, 'g-', 'thickness', 3);
xlabel('Time (s)'); ylabel('Displacement');
title('Destructive Interference (φ = π rad)');
legend(['Wave 1', 'Wave 2', 'Resultant (0)']);

// ===== MODULE 3: GENERAL AMPLITUDE vs PHASE =====
φs = linspace(0, 2*%pi, 100);
A_result = 2*A * abs(cos(φs/2));  // Formula: Superposition amplitude
scf(3); clf();
plot(φs, A_result, 'k-', 'thickness', 2);
xlabel('Phase difference φ (rad)');
ylabel('Resultant Amplitude');
title('Amplitude vs Phase (all cases)');
xgrid(1);

// Save all
xs2png(1, 'constructive.png');
xs2png(2, 'destructive.png');
xs2png(3, 'amplitude.png');

disp("All modules done. Check Figures + PNG files.");
