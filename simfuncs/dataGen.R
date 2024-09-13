dataGen <- function(ngps = 2 # number of groups
                    , n = c(1000,1000) # sample sizes for group 1, 2
                    , alpha = c(2,4) # beta distribution shape parameter
                    , beta = c(8,8) # beta distribution scale parameter
                    , sigeps = c(0.01,0.01) # noise
                    , theta_a = c(0,0) # calibration intercept
                    , theta_b = c(1,1) # calibration slope
                    , h = c("logit","logit")){
  
  # ------------ Data generation ------------- #
  # group label: s
  s <- rep(c(1:ngps),times=n)
  
  # true risk: pi |s ~ Beta(alpha_s,beta_s)
  alpha_s <- rep(alpha,times=n)
  beta_s <- rep(beta,times=n)
  pi_s <- rbeta(sum(n),alpha_s,beta_s)
  
  # y: y | pi ~ Bern(pi)
  y <- rbinom(sum(n),1,pi_s)
  
  # gX = h(pi_s,theta)
  a_s <- rep(theta_a,times=n)
  b_s <- rep(theta_b,times=n)
  
  sigeps_s <- rep(sigeps,times=n)
  epsilon <- rnorm(sum(n),0,sigeps_s)
  
  if(h[1] == "logit"){
    h.pi_s <- log(pi_s/(1-pi_s))
  } else if(h[1] == "cloglog"){
    h.pi_s <- log(-log(1-pi_s))
  } else{
    print("choice of h is unknown")
    stop()
  }
  
  logit.gX <- a_s + b_s * h.pi_s + epsilon
  gX <- exp(logit.gX)/(1+exp(logit.gX))
  
  # Create dataframe 
  simData <- data.frame(s, pi_s, y, logit.gX, gX)
  
  return(simData)
}