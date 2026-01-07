# 🚗 RIMBORSO KM

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![Flask](https://img.shields.io/badge/Flask-3.0-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

**Rimborso KM** è una web application production-ready per la gestione di trasferte chilometriche, reimborsi e flotta veicoli. Perfetta per professionisti, agenti commerciali e aziende.

### ✨ Caratteristiche

- 🎨 **Design Apple-style** - Minimalista, elegante, responsive
- 📍 **Google Maps Integration** - Calcolo km automatico
- 🚙 **Gestione Flotta** - Tariffe configurabili per veicolo
- 📊 **Statistiche Avanzate** - Report per veicolo, motivo, periodo
- 💾 **Export Multipli** - Excel, CSV, PDF
- 📱 **100% Responsive** - Mobile, tablet, desktop
- ⚡ **Zero Setup** - SQLite built-in, nessuna configurazione
- 🔒 **Production-Ready** - Validazioni, error handling, logging

---

## 🎯 Demo Rapida

1. **Installa dipendenze:**
   ```bash
   python -m venv venv
   venv\Scripts\activate          # Windows
   source venv/bin/activate       # Mac/Linux
   pip install -r requirements.txt
   ```

2. **Avvia il server:**
   ```bash
   python run.py
   ```

3. **Accedi:**
   ```
   http://127.0.0.1:5000
   ```

4. ✅ Fatto! Database SQLite si crea automaticamente

---

# 📘 Documentazione Completa

## 🎯 Panoramica
- Crea API Key (tipo Restricted Key)
- Incolla in `.env`

### 5. Inizializza Database

```bash
python run.py
```

La prima volta crea automaticamente il database SQLite in `data/app.db`

### 6. Accedi all'App

Apri browser e vai a:

```
http://127.0.0.1:5000
```

---

## 📁 Struttura Progetto

```
RIMBORSO KM/
├── app/
│   ├── __init__.py                 # Flask app principale e routes
│   ├── models.py                   # SQLAlchemy models (Veicolo, Trasferta)
│   ├── config.py                   # Configurazione e variabili
│   ├── services.py                 # Google Maps Service
│   ├── export.py                   # Esportazione Excel/CSV
│   ├── templates/
│   │   ├── index.html              # Dashboard homepage
│   │   ├── trasferte.html          # Pagina trasferte
│   │   ├── veicoli.html            # Pagina veicoli
│   │   └── statistiche.html        # Pagina statistiche
│   └── static/
│       ├── css/
│       │   └── style.css           # Design system Apple-like
│       └── js/
│           ├── app.js              # JS principale (navigazione, utilità)
│           ├── trasferte.js        # Logica trasferte (CRUD)
│           ├── veicoli.js          # Logica veicoli (CRUD)
│           └── statistiche.js      # Logica report
├── run.py                          # Entry point (python run.py)
├── schema.sql                      # Schema database (documentazione)
├── requirements.txt                # Dipendenze Python
├── .env.example                    # Configurazione di esempio
├── .gitignore
└── README.md                       # Questo file

data/
└── app.db                          # SQLite database (creato al primo avvio)
```

---

## 🔧 Configurazione

### Google Maps API (Opzionale)

L'app funziona ANCHE SENZA Google Maps. Modalità fallback disponibile sempre.

**Con Google Maps** (automatico):
1. Configura `GOOGLE_MAPS_API_KEY` in `.env`
2. Clicca "Calcola Distanza" nella forma trasferta
3. I km si riempiono automaticamente

**Senza Google Maps** (manuale):
1. Inserisci i km manualmente
2. Rimborso si calcola lo stesso
3. Nessuna limitazione funzionale

### Tariffe Veicoli

Crea veicoli con tariffe personalizzate:
- Benzina: €0.42/km (standard ACI 2024)
- Diesel: €0.38/km
- Elettrico: €0.35/km
- Personalizzate per azienda

---

## 💻 Utilizzo dell'App

### Dashboard
- **Riepilogo mensile** - km, rimborsi, numero trasferte
- **Trasferte recenti** - ultimi 5 viaggi
- **Azioni rapide** - link veloci a funzioni principali

### Trasferte
1. **Inserisci trasferta**
   - Seleziona data, veicolo, partenza, arrivo
   - (Opzionale) Clicca "Calcola Distanza" per Google Maps
   - Seleziona motivo trasferta
   - Salva

2. **Modifica trasferta**
   - Clicca ✏️ nella tabella
   - Modifica campi
   - Salva o Elimina

3. **Filtri avanzati**
   - Per data (da/a)
   - Per veicolo
   - Per motivo
   - Combina filtri

4. **Esporta**
   - Excel (.xlsx) - formattazione professionale
   - CSV - compatibile Excel

### Veicoli
1. **Aggiungi veicolo**
   - Marca, modello, alimentazione, €/km
   - Salva

2. **Modifica**
   - Clicca card
   - Modifica tariffa, alimentazione
   - Salva

3. **Elimina**
   - Solo se nessuna trasferta associata
   - Altrimenti veicolo rimane ma inattivo

### Statistiche
- **Per veicolo** - km totali, numero trasferte, rimborso
- **Per motivo** - analisi per tipo trasferta
- **Per mese** - trend mensile
- **Per anno** - report annuale

Filtra per periodo personalizzato.

---

## 🎨 Design & UX

### Filosofia Design

- **Minimalismo Apple** - Zero clutter, essenziale
- **Colori neutri** - Bianco, grigio, nero, blu primary
- **Tipografia pulita** - San-serif web-safe (-apple-system)
- **Spacing generoso** - Respira, non affollato
- **Animazioni leggere** - Micro-interazioni smooth
- **Responsive first** - Mobile → Tablet → Desktop

### Palette Colori

```css
Primary:     #0071e3 (Blu Apple)
Success:     #34c759 (Verde)
Warning:     #ff9500 (Arancio)
Danger:      #ff3b30 (Rosso)
Gray 50-900: Scala neutrale
```

---

## 📡 API Endpoints

### Veicoli
```
GET    /api/veicoli              # Lista veicoli
GET    /api/veicoli/<id>         # Singolo veicolo
POST   /api/veicoli              # Crea veicolo
PUT    /api/veicoli/<id>         # Modifica veicolo
DELETE /api/veicoli/<id>         # Elimina veicolo
```

### Trasferte
```
GET    /api/trasferte                    # Lista (con filtri)
GET    /api/trasferte/<id>               # Singolo
POST   /api/trasferte                    # Crea
PUT    /api/trasferte/<id>               # Modifica
DELETE /api/trasferte/<id>               # Elimina
```

### Utilità
```
POST   /api/calcola-distanza             # Google Maps
GET    /api/statistiche                  # Report aggregati
GET    /api/esporta-excel                # Download .xlsx
GET    /api/esporta-csv                  # Download .csv
GET    /api/config                       # Configurazione frontend
```

---

## 🔒 Sicurezza & Best Practices

✅ **Validazioni server-side** - Tutti i dati validati
✅ **SQL Injection protection** - SQLAlchemy ORM
✅ **CORS & CSRF ready** - Struttura per middleware
✅ **No sensitive data in frontend** - API Key non esposta
✅ **HTTPS ready** - Flask production-ready
✅ **Error handling robusto** - 400, 404, 500 handled

---

## 📊 Database

### Schema SQLite

**Tabella: veicoli**
```sql
id (PK)
marca (TEXT, NOT NULL)
modello (TEXT, NOT NULL)
alimentazione (ENUM)
tariffa_km (DECIMAL, NOT NULL)
data_creazione (TIMESTAMP)
attivo (BOOLEAN)
```

**Tabella: trasferte**
```sql
id (PK)
data (DATE, NOT NULL)
luogo_partenza (TEXT, NOT NULL)
luogo_arrivo (TEXT, NOT NULL)
chilometri (DECIMAL, NOT NULL)
calcolo_km (manuale|automatico)
motivo (TEXT, NOT NULL)
veicolo_id (FK)
rimborso (GENERATED: km × tariffa)
note (TEXT)
data_creazione (TIMESTAMP)
data_modifica (TIMESTAMP)
```

**Tabella: luoghi_frequenti**
```sql
id (PK)
nome (TEXT, UNIQUE)
latitudine (FLOAT)
longitudine (FLOAT)
```

---

## 🐛 Troubleshooting

### Porta 5000 occupata
```bash
# Cambia porta in run.py oppure:
python run.py --port=5001
```

### Database corrotto
```bash
# Elimina e ricrea
rm data/app.db
python run.py
```

### Errore Google Maps
- Controlla API Key in `.env`
- Verifica Distance Matrix API abilitato
- Usa fallback manuale

### Stile CSS non carica
- Hard refresh browser (Ctrl+Shift+R)
- Cancella cache browser

---

## 📈 Roadmap Futuri

- [ ] Autenticazione multi-user
- [ ] Cloud sync (Google Drive, OneDrive)
- [ ] Mobile app nativa (React Native)
- [ ] Integrazione bancaria automatica
- [ ] Reportistica PDF avanzata
- [ ] Importazione bulk CSV

---

## 🤝 Supporto & Contributi

Per problemi:
1. Controlla la sezione Troubleshooting
2. Verifica console browser (F12)
3. Controlla logs terminale Python

---

## 📝 Licenza

Uso personale e commerciale libero.

---

## 👨‍💻 Crediti

**Sviluppato come:**
- Web app production-ready
- Design Apple-style
- Stack Python/Flask/SQLite
- Zero dipendenze opzionali

---

## 📞 Info Tecniche

- **Framework:** Flask 3.0
- **ORM:** SQLAlchemy 2.0
- **Database:** SQLite 3
- **Frontend:** HTML5, CSS3, Vanilla JS
- **API:** RESTful JSON
- **Export:** openpyxl (Excel)

---

**Ultimo aggiornamento:** Dicembre 2024
**Versione:** 1.0.0
**Status:** Production Ready ✅

