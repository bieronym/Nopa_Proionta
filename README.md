# Νωπά Προϊόντα

Αυτοματοποιημένο ανέβασμα των τιμολόγιων των νωπών προϊόντων στην πλατφόρμα του Υπουργείου.

## Εγκατάσταση
Για την λειτουργία χρειάζεται να εγκατασταθεί η RUBY. (https://rubyinstaller.org/) Στην συνέχεια θα πρέπει να εγκατασταθούν τα πακέτα:
```sh
gem install watir
gem install roo
```
Παράλληλα χρειάζεστε και το Chrome Driver (http://chromedriver.chromium.org/downloads) και να το βάλετε στο path (https://www.youtube.com/watch?v=dz59GsdvUF8).

## Λειτουργία
### Λίστα
Στο excel αρχείο με το όνομα lista.xlsx καταχωρούμε τα απαραίτητα στοιχεία.

| Username | Password | Date | AFM_Emporou | Arithmos | Synolo | Vathos | Synalagi_1_typos | Synalagi_1_metrisi | Synalagi_1_posotita | Synalagi_1_timi | ktl |
| ------ | ------ |------ |------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |

**Username:** Το username του taxis  
**Password:** Το password του taxis  
**Date:** Ημερομηνία του παραστατικού  
**AFM_Emporou:** Το αφμ που κόπηκε το τιμολόγιο  
**Arithmos:** Ο αριθμός του τιμολογίου  
**Synolo:** Το σύνολο του τιμολογίου με ΦΠΑ  
**Vathmos:** Σε πόσες κατηγορίες τροφίμων χωρίζεται το τιμολόγιο. Βάση των βαθμών δημιουργούμε και καινούργιες στήλες. π.χ. για βαθμός = 2 σημαίνει ότι υπάρχει πώληση δύο διαφορετικών προϊόντων ενημερώνω επομένως τις στήλες Synalagi_1_typos, Synalagi_1_metrisi, Synalagi_1_posotita και Synalagi_1_timi και συνεχίζω στο ίδιο μοτίβο δημιουργόντας το Synalagi_2_typos, Synalagi_2_metrisi κτλ  
**Synalagi_typos:** Ένας από τους τύπους που περιγραφή μέσα η πλατφόρμα (Πρέπει να αναγραφεί ακριβώς όπως και μέσα)  
**Synalagi_metrisi:** Η μονάδα μέτρησης που περιγράφει την ποσότητα. Αυτή μπορεί να είναι ΓΡΑΜΜΑΡΙΑ, ΚΙΛΑ, ΤΟΝΟΙ, ΤΕΜΑΧΙΟ, ΧΩΡΙΣ ΜΟΝ.ΜΕΤΡΗΣΗΣ και βάζοντας οτιδήποτε άλλο βγαίνει η επιλογή ------.  
**Synalagi_Posotita:** Η ποσότητα που πουλήθηκε από το συγκεκριμένο προϊόν.  
**Synalagi_timi:** Η αξία των συγκεκριμένων προϊόντων.  

Στο excel συμπληρώνω κάθε φορά όλες τις στήλες από το Username έως και τον τελευταίο βαθμό.  
Συμπληρώνω το κάθε τιμολόγιο ουσιαστικά ξεχωριστά.  
Κατά την εκτέλεση το πρόγραμμα σταματά και ζητά να επιλέξετε στην οθόνη του browser την σωστή κατηγόρια χρήσης (αγρότης, έμπορος, κτλ).  

**Δεν έχω ακόμα οριστικοποίηση κάποιο από τα τιμολόγια που ανέβασα καθώς δεν γνωρίζω πλήρως όλες τις λεπτομέρειες του συστήματος επομένως μετά το επόμενο βήμα δεν γνωρίζω τι προκύπτει.**  

# Δημιουργία
Ιερωνυμάκης Βασίλειος, MSc CFE, Λογιστής, Σαουνάτσου 26 Ρέθυμνο 74100, email: info@ieronymakis.gr, bieronym@gmail.com
