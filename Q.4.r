#Q4. The following iterative sequence is defined for the set of positive integers:
#n → n/2 (n is even)
#n → 3n + 1 (n is odd)

#Using the rule above and starting with 13, we generate the following sequence:
#13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#Which starting number, under one thousand, produces the longest chain?

collatz.length <- vector(length = 1E6)
collatz.length[1] <- 0
for (n in 2:1E6) {
    x <- n
    count <- 0 
    while (x != 1 & x >= n) {
        if (x %% 2 == 0) {
            x <- x / 2
            count <- count + 1
        }
        else {
            x <- (3 * x + 1) / 2
            count <- count + 2
        }
    }
    count <- count + collatz.length[x]
    collatz.length[n] <- count
}
answer <- which.max(collatz.length)
print(answer)