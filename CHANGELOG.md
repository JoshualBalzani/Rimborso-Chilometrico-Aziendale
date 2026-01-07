# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-01-07

### Added
- ✨ Dashboard con statistiche live (km totali, rimborso totale, trasferte, media)
- 📋 CRUD completo per trasferte con calcolo rimborso automatico
- 🚙 Gestione flotta veicoli con tariffe configurabili
- 👥 Gestione clienti e indirizzi aziendali
- 📊 Statistiche avanzate (per veicolo, motivo, periodo)
- 📁 Archivio trasferte con filtri e ricerca
- 💾 Export Excel, CSV, PDF con formattazione professionale
- 📥 Import bulk da CSV per clienti e indirizzi
- 🗺️ Integrazione Google Maps Distance Matrix API (opzionale)
- 📱 Design Apple-style 100% responsive
- 🔒 Validazioni server-side e client-side
- 💾 SQLite database con auto-backup
- 🛠️ API REST completa con 12+ endpoints
- 📝 Logging strutturato
- ⚙️ Zero configurazione richiesta

### Technical
- Flask 3.0.3 con SQLAlchemy ORM
- Vanilla JavaScript (no jQuery/Bootstrap)
- CSS Grid responsive
- Request/Werkzeug per HTTP
- ReportLab per PDF
- OpenPyXL per Excel
- APScheduler per backup automatici

### Documentation
- README.md - Setup e guida completa
- QUICKSTART.md - Avvio in 5 minuti
- WELCOME.md - Sommario progetto
- MANIFEST.txt - Architettura tecnica
- Schema.sql - Database schema
- Codice commentato con docstrings

## Browser Support
- Chrome 90+
- Safari 14+
- Firefox 88+
- Edge 90+

## Security Notes
- Validazioni server-side su tutti gli endpoint
- CSRF protection ready (Flask-WTF)
- SQL injection prevention (SQLAlchemy ORM)
- XSS protection via templating
- Environment variables per secrets

## Known Limitations
- Single user (non multi-utente)
- SQLite per sviluppo (scalare con PostgreSQL per produzione)
- Google Maps API opzionale (fallback manuale)

## Future Improvements
- [ ] Multi-user authentication
- [ ] Role-based access control
- [ ] Advanced reporting (PDF con grafici)
- [ ] Fatturazione automatica
- [ ] API v2 con OAuth2
- [ ] Mobile app native
