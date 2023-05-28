data{
    int N;
    real heights [N];
    vector[N] weight;
}

parameters{
    real alpha;
    real beta;
    real beta_2;
    real<lower=0> sigma;
}

transformed parameters {
   vector[N] mu = weight .* weight * beta_2 + weight * beta + alpha;
}

model{
    alpha ~ normal(180,15);
    beta ~ lognormal(0,1);
    beta_2 ~ normal(0,1);
    sigma ~ exponential(0.067);
    heights ~ normal(mu, sigma);
}

generated quantities {
   real height[N];

   for (i in 1:N){
      height[i] = normal_rng(mu[i], sigma);
   }
}