data{
    int N;
    real weight[N];
}

generated quantities {
   real alpha = normal_rng(180, 15);
   real beta = lognormal_rng(0, 1);
   real beta_2 = normal_rng(0, 1);
   real sigma = exponential_rng(0.067);
   real height[N];

   for (i in 1:N){
    height[i] = normal_rng(weight[i] * weight[i] * beta_2 + weight[i] * beta + alpha, sigma);
   }
}