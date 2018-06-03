#PACOTE
if(!require(dplyr)) install.packages("dplyr")

#DADOS
dados=read.csv("http://mwstat.com/andersonara/IVD/dados1.csv",
               sep=";",stringsAsFactors = T)

glimpse(dados)

#FUNÇÃO SELECT
select(dados,Q1)
select(dados,Q1,Q9)
select(dados,c(1,9))
select(dados,Q1:Q9)
select(dados,-Q3)
select(dados,-Q3,-Q5)
select(dados,-c(Q3,Q5))
select(dados,-c(3,5))
select(dados, starts_with("Q"))
select(dados, ends_with("9"))
select(dados, contains("1"))

#FUNÇÃO RENAME
rename(dados,quest1=Q1,quest2=Q2)

#UTILIZANDO O COMANDO PIPE %>%
dados %>% select(Q1)
dados %>% rename(quest1=Q1)

#FUNÇÃO FILTER

filter(dados,Q5=="S",Q1>20)
filter(dados,Q5=="S",Q1>20,Q9==6)
filter(dados,Q5=="S",Q1>20 & Q9==6)
filter(dados,Q5=="S",Q1>20 | Q9==6)

dados %>% filter (Q1>20,Q9>=6)

#FUNÇÃO SLICE
slice(dados,1:10)
dados %>% slice (1:10)

#FUNÇÃO MUTATE
mutate(dados,Q10=Q6+Q9)

dados %>% mutate(Idade_c=if_else(Q1>mean(Q1),"Acima","Abaixo"))

#FUNÇÃO TRANSMUTE
transmute(dados,Q1,Q10=Q6+Q9)

dados %>% transmute(Q1,Q2,Q10=Q6+Q9)
dados %>% transmute(Idade_c=if_else(Q1>mean(Q1),"Acima","Abaixo"))

