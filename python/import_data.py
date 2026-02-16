import pandas as pd
from sqlalchemy import create_engine

# Leggi CSV
print("Caricamento CSV...")
df = pd.read_csv(
    "/Volumes/SSD/EPICODE/PROGETTI/PROGETTO 2/data/Sample - Superstore.csv",
    encoding="latin1",
)

print(f"Righe caricate: {len(df)}")

# Pulisci nomi colonne (rimuovi spazi)
df.columns = df.columns.str.replace(" ", "_").str.replace("-", "_")

# Connessione MySQL (CAMBIA PASSWORD)
engine = create_engine(
    "mysql+mysqlconnector://root:008Ambulatorio!@localhost/sales_analysis"
)

# Import in MySQL
print("Import in MySQL...")
df.to_sql("orders", con=engine, if_exists="replace", index=False, chunksize=1000)

print("Import completato!")
