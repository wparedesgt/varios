#Carga Datos
library(tidyverse)
library(readxl)

dat <- read_xlsx("data/1Graduandos_MINEDUC.xlsx")

str(dat)
class(dat)
names(dat)
head(dat)

#1.     ¿Qué número de estudiantes registra en total la base de datos utilizada?

sum(dat$CANTIDAD_ESTUDIANTES, na.rm = TRUE)

#2.     Liste los primeros 5 departamentos con mayor cantidad de alumnos.

dat <- dat %>% select(CANTIDAD_ESTUDIANTES, DEPARTAMENTO, ESTABLECIMIENTO, SECTOR, PLAN, '%_NO_LOGRO_LECTURA')

names(dat)[6] <- "NO_LOGRO_LECTURA"
head(dat)

dat %>% count(DEPARTAMENTO, wt = CANTIDAD_ESTUDIANTES) %>% arrange(desc(n)) %>% head(5)

#3.     Liste los primeros 5 establecimientos con mayor cantidad de alumnos.

dat %>% count(ESTABLECIMIENTO, wt = CANTIDAD_ESTUDIANTES) %>% arrange(desc(n)) %>% head(5)

#4.     Liste el número de estudiantes por sector y establezca el porcentaje que representa cada sector con respecto al total.

unique(dat$SECTOR)

dat %>% count(SECTOR, wt = CANTIDAD_ESTUDIANTES)  %>% mutate(porcentaje = n*100/sum(dat$CANTIDAD_ESTUDIANTES, na.rm = TRUE)) 


#5.     Liste por Plan de estudios “A DIARIO”, los primeros 4 lugares con más estudiantes.
head(dat)
unique(dat$PLAN)

dat %>% filter(PLAN == "DIARIO(REGULAR)") %>% count(ESTABLECIMIENTO, wt = CANTIDAD_ESTUDIANTES) %>% arrange(desc(n)) %>% head(4)




#6.     ¿Cuántos establecimientos tienen un puntaje de 100, en la variable: %_NO_LOGRO_LECTURA?
names(dat)


dat %>% filter(NO_LOGRO_LECTURA == 100)

x <- dat %>% filter(NO_LOGRO_LECTURA == 100)  
length(x$ESTABLECIMIENTO)
#7.     Describa su análisis de acuerdo con los datos que usted tiene en esta base de datos y en base a ellos liste 5 conclusiones y 5 recomendaciones para mejorar la situación percibida.