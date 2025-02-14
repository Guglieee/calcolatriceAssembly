# Calcolatrice in Assembly 8086

## Descrizione
Questa è una semplice calcolatrice scritta in Assembly 8086 che supporta le seguenti operazioni:
- Addizione
- Moltiplicazione
- Sottrazione
- Divisione (con gestione dell'errore per divisione per zero)

Il programma utilizza `INT 21h` per la gestione dell'input/output e `INT 16h` per la lettura della tastiera.

## Requisiti
Per eseguire il codice, è necessario un emulatore compatibile con Assembly 8086, come:
- DOSBox con MASM/TASM
- EMU8086 (opzionale, può essere usato per testare il codice in un ambiente grafico)

## Uso
1. Compilare il codice con un assembler compatibile (MASM/TASM).
2. Eseguire il programma in un ambiente DOS o emulato.
3. Selezionare un'operazione premendo il tasto corrispondente (1-4).
4. Inserire i numeri richiesti e visualizzare il risultato.

## Funzionamento
- Il programma mostra un menu iniziale con le operazioni disponibili.
- Dopo aver scelto un'operazione, viene richiesto di inserire due numeri.
- Il risultato viene calcolato e visualizzato a schermo.
- In caso di errore (ad esempio, divisione per zero), viene mostrato un messaggio di errore.

## Messaggi di Errore
- "Choice Error": scelta non valida nel menu iniziale.
- "Error: Division by zero or invalid input!": errore nella divisione.

## Nota
Questo programma è stato sviluppato per scopi educativi e dimostrativi.

