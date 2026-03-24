# MEMORY — MatheyBTC-invest-BTC
_Última actualización: 2026-03-24_

## Estado Actual
App funcional en GitHub Pages. 5 planes implementados: A, B, C, D, E.

## Última Sesión
**Fecha:** 2026-03-24

### Plan E) DCA Cosecha — NUEVO
- Nueva tab implementada en invest-BTC y DCA-plan
- Estrategia: DCA base + vende % del stack cuando precio sube X% sobre costo promedio propio; recompra lump sum cuando precio baja Y% desde precio de venta; fallback a 3 cuotas DCA si no recompra en 3 meses
- `costPromedio` no se modifica al vender (solo sube con compras)
- `checkDates` = reloj fijo desde startDate, nunca se resetea por ventas
- `currentValue = btcStack * getPriceAt(endDate)` — precio histórico, no live
- `lastPlanE = { totalBTC, totalInvested, avgPrice, currentValue, roi, cycles }`
- Integrado en Dashboard de invest-BTC
- Spec: `docs/superpowers/specs/2026-03-24-plan-e-dca-cosecha-design.md`
- Plan: `docs/superpowers/plans/2026-03-24-plan-e-dca-cosecha.md`

### Plan D) Trading — Mejoras
- **BackTesting**: sección visible pero campos CCI Period y T3 Period ocultos (usan default 35/7); título limpiado a "BackTesting"
- **Nuevo fila de stat boxes**: Órdenes Positivas / Órdenes Negativas / Valor Esperado (EV%)
  - EV = WinRate × AvgWin% + (1 − WinRate) × AvgLoss%
  - Cada "trade" = señal de VENTA analizada vs costo promedio acumulado al momento
- **Tabla "Esperanza por Año"**: últimos 5 años con señales de venta, columnas Señales+ / Señales− / Win Rate / Avg Win / Avg Loss / EV%
- Los stat boxes muestran 0 cuando no hay señales registradas; P&L requiere `currentPrice` cargado

### Plan B) DCA Re-compra — Toggle Trigger
- Botón "Activar Trigger" (ON/OFF) antes de los campos de trigger
- OFF: oculta campos de trigger y sell%, `triggerPct = Infinity` → nunca dispara → comportamiento idéntico a Plan A
- Variable global `_planBTriggerActive` controla el estado

### Sesión anterior (2026-03-23)
- Plan A: removido uppercase, USD→U$S, semáforo 8 ventanas, X-axis 2 filas
- Plan B: trigger MA90 → vende X% → lump sum rebuy, cooldown 30 días
- Análisis backtest: Plan A gana en todos los períodos vs Plan B y Plan E

## Planes
| Plan | Descripción |
|---|---|
| Plan A | DCA fijo — compras periódicas |
| Plan B | DCA Re-compra — trigger MA90 vende X% y crea sub-DCA; toggle ON/OFF |
| Plan C | Colateral BTC — calculadora de préstamos |
| Plan D | Señales T3-CCI — journal manual de operaciones TradingView + EV stats |
| Plan E | DCA Cosecha — DCA + venta parcial sobre costo propio + recompra lump sum |

## Pendiente / Próximos Pasos
1. Verificar `btc_prices.json` actualizado con precios recientes
2. Revisar Plan C (Colateral) — no fue tocado en las últimas sesiones

## Decisiones Técnicas Clave
- U$S siempre (no USD) en la UI; Title Case en labels
- Todo inline en `index.html` — sin archivos .js/.css separados
- `getPriceAt(date)` busca precio más cercano anterior disponible
- Plan B trigger: sell + rebuy inmediato al MISMO precio (lump sum, no sub-DCA distribuido)
- Plan E: `costPromedio` no decrece con ventas; `checkDates` fijo desde startDate
- Plan D EV: solo señales de VENTA cuentan como trades; P&L vs costo promedio acumulado (avg-cost)
- Semáforo usa `currentPrice` (último precio del dataset) vs precio promedio de compra del período
- `getMA90AtDate()` devuelve 0 si hay menos de 89 días de datos previos

## Contexto Importante
- Repo: `MatheyBTC/MatheyBTC-invest-BTC` — deployed en GitHub Pages
- Precios se cargan desde Google Sheets CSV (URL en index.html)
- `btc_prices.json` se copia a `MatheyBTC-DCA-plan`
- DCA-plan tiene Planes A, B, C, E — NO tiene Plan D ni Dashboard
