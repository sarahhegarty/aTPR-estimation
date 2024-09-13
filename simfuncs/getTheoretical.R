# Calculates p(pi > tau, y = 1)
int_pi_y1 <- function(par1, par2, rho, tau){
  p.piy1.1 <- integrate(function(t, par) {t * dbeta(t, par[1], par[2])}, lower = tau, upper = 1, par=par1)$value  
  p.piy1.2 <- integrate(function(t, par) {t * dbeta(t, par[1], par[2])}, lower = tau, upper = 1, par=par2)$value  
 
  out.piy1 <- c(p.piy1.1, p.piy1.2)
  names(out.piy1) <- c('p.piy1.1', 'p.piy1.2')
  return(out.piy1)
}

# Calculates p(r > tau, y = 1)
int_r_y1 <- function(par1, par2, rho, tau,  abs1, abs2){
  integrand_num <- function(t, par, abs, tau) {
    mu = abs[1] + abs[2] * logit(t) 
    sigma = abs[3]
    
    t * dbeta(t, par[1], par[2]) *(1 - pnorm(logit(tau), mu, sigma))
  }
  p.ry1.1 <- integrate(integrand_num, lower = 0, upper = 1, par=par1, abs = abs1, tau =tau)$value  
  p.ry1.2 <- integrate(integrand_num, lower = 0, upper = 1, par=par2, abs = abs2, tau = tau)$value  
  
  out.ry1 <- c(p.ry1.1, p.ry1.2)
  names(out.ry1) <- c('p.ry1.1', 'p.ry1.2')
  return(out.ry1)
}

# get TPRs for specified tau
getTheoretical <- function(par1, par2, abs1, abs2, rho, tau_values){
  
  # initialize output data.frame
  outdf_ref1 = outdf_ref2 <- data.frame(refgp = NA
                                          ,tau = tau_values
                                          , TPR1 = NA, TPR2 =NA
                                          , aTPR1 = NA, aTPR2 = NA)
                      
  # loop over taus
  for(t in 1:length(tau_values)){
    # observed TPR, using par1 and par2 (benchmark for naive)
    observed <- int_r_y1(par1, par2, rho, tau=tau_values[t],abs1, abs2)/int_pi_y1(par1, par2, rho, tau=0)  
    
    # counterfactual TPR, settning par2 equal to par1 (benchmark for adjusted when reference group = 1)
    counterfactual1 <- int_r_y1(par1, par1, rho, tau=tau_values[t], abs1, abs2)/int_pi_y1(par1, par1, rho, tau=0) 
   
    # counterfactual TPR, setting par1 equal to par2 (benchmark for adjusted when reference group = 2)
    counterfactual2 <- int_r_y1(par2, par2, rho, tau=tau_values[t], abs1, abs2)/int_pi_y1(par2, par2, rho, tau=0) 
    
    outdf_ref1[t,] <- c(1, tau_values[t], observed, counterfactual1)
    
    outdf_ref2[t,] <- c(2, tau_values[t], observed, counterfactual2)
  }
  
  theolist <- list(outdf_ref1,outdf_ref2)
  
  return(theolist)
}
