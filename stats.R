#!/usr/bin/Rscript
data <- scan(file("stdin"), quiet=TRUE);
printf <- function(...) cat(sprintf(...))
printf("mean    %.5f\n", mean(data));
printf("median  %.5f\n", median(data));
printf("sd      %.5f\n", sd(data));
printf("min     %.5f\n", min(data));
printf("max     %.5f\n", max(data));
