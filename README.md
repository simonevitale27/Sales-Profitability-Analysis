# Sales & Profitability Analysis

<img width="1324" height="763" alt="Screenshot 2026-02-16 alle 10 04 55 (2)" src="https://github.com/user-attachments/assets/f04e9d59-c12b-41f1-a503-62664d9503af" />

## Panoramica Progetto

Analisi delle vendite e della profittabilità per un retailer americano su 9.994 transazioni nel periodo 2014-2017. L'obiettivo è capire dove l'azienda sta perdendo soldi nonostante le vendite appaiano buone, e fornire indicazioni concrete per migliorare i margini.

---

## Il Problema

Il management vuole capire:
- Quali prodotti generano profitto e quali perdite
- Se i target di vendita 2017 sono stati raggiunti
- Perché alcune regioni performano meglio di altre
- Quanto impattano gli sconti sui margini

Domanda principale: "Dove vendiamo tanto ma guadagniamo poco?"

---

## Strumenti Utilizzati

- MySQL per query SQL
- Power BI per dashboard interattiva
- Dataset: Superstore Sales (Kaggle)

---

## Risultati Principali

### 1. Prodotti che Perdono Denaro

Ho scoperto che Tables e Bookcases stanno perdendo soldi:

**Tables:**
- Vendite: 207.000 dollari
- Profitto: -17.700 dollari (PERDITA)
- Margine: -8,56%
- Sconto medio: 26%

**Bookcases:**
- Vendite: 115.000 dollari
- Profitto: -3.500 dollari (PERDITA)
- Margine: -3,02%
- Sconto medio: 21%

Insieme queste due sub-categorie generano 322.000 dollari di vendite ma perdono 20.000 dollari.

Il problema: gli sconti (26% su Tables) sono così alti che superano completamente i margini operativi.

---

### 2. Differenze tra Regioni

La regione Central ha margini dimezzati rispetto a West:

- **West:** 725k vendite, margine 14,94%, sconto medio 11%
- **Central:** 501k vendite, margine 7,92%, sconto medio 24%

Central applica sconti doppi rispetto a West ma non genera più volume in proporzione. Il revenue per cliente è il più basso (797 dollari vs 1.058 di West).

---

### 3. Budget vs Risultati 2017

Ho simulato un budget 2017 basato su crescita del 15% rispetto al 2016:

- **Office Supplies:** superato budget del 16,34% (molto bene)
- **Technology:** superato budget del 4,38% (bene)
- **Furniture:** sotto budget del 5,84% (male)

Furniture non raggiunge il target perché il management ha ridotto le promozioni a metà anno dopo aver scoperto i margini negativi.

---

### 4. Crescita nel Tempo

Le vendite sono cresciute del 51% in 3 anni:
- 2014: 484k dollari
- 2017: 733k dollari

Ma il margine di profitto nel 2017 peggiora leggermente (12,74% vs 13,43% del 2016) perché sono stati usati più sconti per spingere le vendite.

---

## Raccomandazioni

### 1. Eliminare Perdite su Tables e Bookcases

Tre opzioni:
- Ridurre subito gli sconti sotto il 15%
- Rinegoziare i costi con i fornitori
- Rimuovere questi prodotti dal catalogo se i margini restano negativi

Impatto stimato: recupero di 20.000 dollari all'anno.

---

### 2. Ridurre Sconti in Central

Portare lo sconto medio dal 24% al 15% (come nelle altre regioni).

Calcolo:
- Profitto attuale Central: 39.700 dollari
- Profitto con sconti normalizzati: 60.100 dollari
- Incremento: +20.400 dollari (+51%)

Ho già considerato una perdita del 10% nei volumi di vendita.

---

### 3. Cambiare Mix Prodotti

Aumentare il focus su Technology e Office Supplies (margini 17%) e ridurre Furniture (margine 2,5%).

Target: ridurre del 20% l'inventario Furniture e reinvestire il budget marketing sulle categorie profittevoli.

Risultato atteso: margine complessivo dal 12,5% al 15,5%.

---

## Struttura File
```
sales_profitability_analysis/
├── data/
│   ├── monthly_trend.csv
│   ├── category_profitability.csv
│   └── regional_performance.csv
├── sql/
│   ├── 01_profitability_analysis.sql
│   ├── 02_budget_vs_actual.sql
│   └── 03_regional_performance.sql
├── dashboard/
│   ├── Sales_Profitability_Analysis.pbix
│   └── dashboard_sales_profitability.png
└── README.md
```

---

## Come Replicare

1. Scarica il dataset Superstore da Kaggle
2. Importa in MySQL
3. Esegui le query SQL nella cartella sql/
4. Esporta i risultati come CSV
5. Importa i CSV in Power BI e ricrea la dashboard

---

## Competenze Applicate

- SQL: aggregazioni, CTE, funzioni date, simulazioni budget
- Analisi finanziaria: margini di profitto, budget vs actual, analisi variance
- Business Intelligence: dashboard Power BI con drill-down e filtri
- Analisi commerciale: performance regionali, ottimizzazione mix prodotti

---

Progetto completato: Gennaio 2026  
Dataset: 9.994 transazioni retail USA (2014-2017)
