# 🚀 QUICKSTART - Avvio in 5 Minuti

## Prerequisiti
- **Python 3.8+** installato
- **Windows/Mac/Linux**

## Passaggi

### 1. Apri PowerShell/Terminal nella cartella del progetto

```bash
cd "C:\percorso\RIMBORSO KM"
```

### 2. Crea ambiente virtuale Python

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# Mac/Linux
python3 -m venv venv
source venv/bin/activate
```

**Dovresti vedere `(venv)` all'inizio del prompt.**

### 3. Installa dipendenze

```bash
pip install -r requirements.txt
```

Attendi ~1-2 minuti per l'installazione.

⚠️ **Dipendenze richieste:**
- **reportlab** - Necessario per esportazione PDF
- **openpyxl** - Necessario per esportazione Excel  
- **requests** - Necessario per calcolo distanze online
- **APScheduler** - Necessario per backup automatici

### 4. Inizializza database

```bash
python run.py
```

**Output atteso:**
```
* Running on http://127.0.0.1:5000
```

### 5. Apri browser

Vai a: **http://127.0.0.1:5000**

---

## ✅ Setup Completo!

Dovresti vedere dashboard con:
- 4 stat card vuoti
- Form per inserire trasferta
- Menu navigazione

---

## 📝 Primo Utilizzo

### 1. Aggiungi un veicolo
- Menu → Veicoli
- Riempi: Marca, Modello, Alimentazione, Tariffa €/km
- Salva

### 2. Aggiungi clienti e indirizzi (opzionale)
- **Importazione veloce CSV:**
  - Menu → Clienti → "Scarica Template CSV"
  - Compila il file con i tuoi dati
  - Menu → Clienti → "Importa da CSV"
  - Seleziona il file e importa in 1 secondo
  
- **Oppure manuale:**
  - Menu → Clienti → Aggiungi cliente
  - Menu → Indirizzi Aziendali → Aggiungi indirizzo

### 3. Inserisci trasferta
- Menu → Trasferte
- Seleziona: Data, Veicolo, Partenza, Arrivo, Motivo
- Salva

### 4. Visualizza statistiche
- Menu → Statistiche
- Vedi report

---

## 🎯 Info Importanti

### Google Maps (Opzionale)
L'app funziona SENZA Google Maps. Se vuoi il calcolo automatico km:
1. Apri `.env`
2. Aggiungi API Key da https://console.cloud.google.com
3. Riavvia app

### Database
- Salvo in `data/app.db` (SQLite locale)
- Zero configurazione richiesta
- Auto-creato al primo avvio

### Arresto app
- Premi `CTRL + C` nel terminale

---

## 🐛 Problemi?

### Porta 5000 occupata
Modifica `run.py`:
```python
app.run(host='127.0.0.1', port=5001)  # Cambia 5000 → 5001
```

### Errori database
```bash
rm data/app.db
python run.py
```

### Dipendenze non trovate
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

---

## 📚 Documentazione Completa

Leggi `README.md` per:
- Struttura progetto dettagliata
- API endpoints
- Configurazione avanzata
- Troubleshooting

---

**Enjoy!** 🎉
