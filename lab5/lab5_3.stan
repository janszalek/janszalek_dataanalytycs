data{
    int N;
    vector[N] miles;
    int y[N];
}

parameters{
    vector[N] alpha;
    real theta;
}

model{
    alpha ~ normal(0.5, 0.2); 
    theta ~ normal(0.0008, 0.00008); 

    for (i in 1:N){
        y[i] ~ poisson_log(alpha[i] + theta * miles[i]);
    }
}
generated quantities {
    real y_pred[N];

    for (i in 1:N){
        y_pred[i] = poisson_log_rng(alpha[i] + theta *miles[i]);
    }
}
