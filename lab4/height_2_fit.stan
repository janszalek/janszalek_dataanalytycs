data {
   int N;
   real heights[N];
   vector [N] weight;
}
parameters {
   real alpha;
   real<lower=0> sigma;
   real beta;
}
transformed parameters {
    vector [N] mu = weight*beta+alpha;
}
model {
   mu ~ normal(180,15);
   beta ~ lognormal(0,1);
   sigma ~ exponential(0.067);
   heights ~ normal(mu, sigma);
}
generated quantities {
   real height[N];
   for (i in 1:N){
    height[i] = normal_rng(mu[i],sigma);
   }
}