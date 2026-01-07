"""
run.py - Entry point applicazione
Avvia Flask development server con backup automatico
"""

import os
import sys
from pathlib import Path

# Aggiungi app directory al path
app_dir = Path(__file__).parent
sys.path.insert(0, str(app_dir))

# Setup environment
os.environ.setdefault('FLASK_ENV', 'development')
os.environ.setdefault('FLASK_DEBUG', 'True')

# Importa app e backup
from app import app, db, Trasferta
from app.backup import GestoreBackup

if __name__ == '__main__':
    # Inizializza database
    with app.app_context():
        # Create tables only if they don't exist
        db.create_all()
        print("[OK] Database initialized")
        
        # Backup manager
        backup_manager = GestoreBackup('data/app.db', 'backups', max_backups=10)
        
        # Controlla se il database è vuoto
        db_count = Trasferta.query.count()
        
        if db_count == 0:
            # Database vuoto - prova a ripristinare il backup più recente
            backups = backup_manager.lista_backup()
            if backups:
                latest_backup = backups[0]['nome']  # Il primo è il più recente (sorted reverse)
                print(f"\n[RESTORE] Database vuoto. Ripristino ultimo backup: {latest_backup}")
                if backup_manager.restore_backup(latest_backup):
                    print(f"[OK] Database ripristinato da backup")
                    # Ricarica il database context
                    db_count = Trasferta.query.count()
                    print(f"[OK] Dati ripristinati: {db_count} trasferte")
                else:
                    print("[WARN] Errore nel ripristino del backup")
            else:
                print("[INFO] Nessun backup disponibile - database vuoto")
        else:
            # Database con dati - crea un nuovo backup
            print(f"\n[OK] Database con {db_count} trasferte")
            backup_manager.crea_backup()

    # Stampa info backup
    backups = backup_manager.lista_backup()
    print(f"\n[BACKUP] Disponibili: {len(backups)}")
    if backups:
        print(f"   Ultimo: {backups[0]['nome']} ({backups[0]['size_mb']} MB)")

    # Leggi HOST e PORT da variabili di ambiente
    host = os.getenv('FLASK_HOST', '127.0.0.1')
    port = int(os.getenv('FLASK_PORT', '5000'))

    # Avvia server
    print("\n" + "="*60)
    print("START - RIMBORSO KM - Production Ready")
    print("="*60)
    print(f"\nURL: http://{host}:{port}")
    print("Press CTRL+C to stop\n")

    app.run(
        debug=True,
        host=host,
        port=port,
        use_reloader=True
    )

