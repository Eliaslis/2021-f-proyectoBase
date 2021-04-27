module Library where
import PdePreludat

type Horas = Number
type Objetivo = String
type Presion = Number
type Golpe = Objetivo -> Presion

cantidadDeLetrasNombre = length

poderDelGolpe :: Horas -> Number
poderDelGolpe = (* 15)

fortalezaDelObjetivo :: Objetivo -> Number
fortalezaDelObjetivo  = (* 2).cantidadDeLetrasNombre

presion :: Horas -> Objetivo -> Presion
presion horas oponente = poderDelGolpe horas / fortalezaDelObjetivo oponente

gomuGomuElephantGatling :: Golpe
gomuGomuElephantGatling = presion 180 

golpesNormalesConsecutivos :: Golpe
golpesNormalesConsecutivos = presion 240 

esDificil :: Objetivo -> Bool   
esDificil oponente = gomuGomuElephantGatling oponente < 100

focalizar :: Objetivo -> Objetivo
focalizar = take 7 
 
esAccesible :: Objetivo -> Bool
esAccesible = (between 200 400).(golpesNormalesConsecutivos.focalizar)

between :: Ord(a) => a -> a -> a -> Bool
between a c b = a <= b && b <= c

