data {
   int N;
   real heights[N];
}
parameters {
   real mu;
   real<lower=0> sigma;
}
model {
   mu ~ normal(180,15);
   sigma ~ exponential(0.067);
   heights ~ normal(mu, sigma);
}
generated quantities {
   real height = normal_rng(mu, sigma);
}