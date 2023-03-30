data {
    int<lower=0> N;
    int<lower=0,upper=N> y;
}
parameters {
    real<lower=0, upper=1> p;
}
model {
   p ~ beta(10,40);
   y ~ binomial(N,p);
}
generated quantities {
   real<lower=0, upper=50> y_pred = binomial_rng(N,p);
}