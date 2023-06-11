generated quantities{
    real alpha = normal_rng(0.5, 0.2);
    real theta = normal_rng(0.0008, 0.00008);
    real n = normal_rng(5716, 1118);
    real lambda =  exp(alpha + theta * n);
    int y = poisson_rng(lambda);
}