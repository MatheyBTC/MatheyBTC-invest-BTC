# MatheyBTC-invest-BTC — Notas del proyecto

## Ejes principales
1. DCA en Bitcoin
2. Colateral con BTC
3. Hodl en BTC
4. Ciclos de BTC

---

## Plan 1 — DCA Fijo

### Calculadora DCA histórica
- Ingresás monto (ej: $10)
- Elegís frecuencia (diaria, semanal, bisemanal, mensual)
- Elegís fecha A (inicio) y fecha B (fin o hoy)
- Calcula: BTC acumulado, precio promedio de compra, valor hoy, rentabilidad

### Tablero comparativo de frecuencias
- Comparativa automática: diaria / semanal / bisemanal / mensual
- Para una misma inversión supuesta, muestra el resultado según frecuencia

### Semáforo de precio vs promedio de compra
- Períodos de análisis: últimos 90 días / 180 días / 12 / 24 / 36 / 48 / 60 / 72 meses
- Semáforo de 5 colores según distancia al promedio de compra:
  - 50% por arriba → color 1
  - 40% por arriba → color 2
  - 30% por arriba → color 3
  - 25% por arriba → color 4
  - 15% por arriba → color 5
- Avisa si el precio está por arriba o por debajo del promedio

### Media móvil de 90 días (ventana deslizante)
- Se corre día a día sobre el período de inversión
- En 24 meses genera ~640 puntos de dato (365×2 - 90)
- Calcula cuántas veces el precio estuvo por debajo del promedio de compra
- Calcula % del tiempo en ganancia vs pérdida
- Identifica mejores y peores períodos

### Backtesting automático — última década
- Tabla de 10 filas, una por año de inicio (desde hace 10 años hasta hace 1 año)
- Cada fila muestra: año inicio, años invertido, BTC acumulado, precio medio, valor hoy, rentabilidad
- Se actualiza automáticamente con el precio del día

---

## Plan 2 — DCA Re-compra

### Concepto
- DCA con toma de ganancias automática y reinversión
- Cuando el precio sube X% por encima del promedio de 90 días → vendés X% del stack
- Con esa venta arrancás un nuevo ciclo DCA desde cero, misma frecuencia
- Objetivo: optimizar el precio promedio de compra acumulado ciclo a ciclo
- Se repite cada vez que se da la condición

### Pendiente de definir
- ¿Los porcentajes son fijos (siempre 25%/25%) o configurables?
- ¿Los ciclos se solapan o uno arranca cuando termina el otro?
- ¿Comparativa Plan 1 vs Plan 2 en el mismo tablero?

---

---

## Plan C — Colateral BTC
- Depositás BTC como garantía
- Pedís prestado USDT → comprás más BTC
- Apostás a suba de BTC para pagar préstamo + intereses
- Resultado: más BTC nominal del que empezaste
- Ya existe Excel y programa de referencia en la carpeta

---

## Plan D — Trading Bot
- Señales de compra/venta ya armadas en TradingView
- Captura automática via webhook de TradingView
- Recolecta cada señal y calcula beneficio/pérdida acumulada
- Resultado: rendimiento histórico de la estrategia

---

## Tablero Maestro — Visión general

### Estructura
- 4 hojas individuales: Plan A / Plan B / Plan C / Plan D
- 1 hoja resumen que combina los 4 planes
- Formato: Excel o aplicación similar al programa de colateral

### Inputs globales
- BTC que tenés hoy
- Cuánto podés invertir por mes (en USD o BTC)
- Gastos mensuales para vivir (en USD)

### Output final
- Cuánto BTC acumulás con cada plan
- Cuánto tiempo hasta poder vivir de BTC
- Comparativa entre planes: cuál es más eficiente
- Extrapolación: con X BTC colateralizado + ingresos mensuales → ¿cuándo sos libre?

---

## Pendiente de definir
- Hodl en BTC (eje separado)
- Ciclos de BTC (eje separado)
- Plan B: ¿porcentajes fijos o configurables? ¿ciclos solapados o secuenciales?
