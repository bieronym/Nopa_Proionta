require 'watir'
require 'roo'

path=Dir.pwd
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: path
  },
   plugins: {
    always_open_pdf_externally: true
  }
}

browser=Watir::Browser.new:chrome, options: {prefs: prefs}
browser.goto "http://e-services.minagric.gr/fftransactionlogbook/"

data=Roo::Spreadsheet.open('./lista.xlsx')
username=data.column(1)
password=data.column(2)
idiotita=data.column(3)
date=data.column(4)
afm_emporou=data.column(5)
arithmos=data.column(6)
synolo=data.column(7)
vathos=data.column(8)

n_length=username.length
n_length=n_length-1

browser.text_field(:name=>'j_username').value = username[1]
browser.text_field(:name=>'j_password').value = password[1]
browser.button(:class=>["btn", "btn-primary", "submit-button"]).click
sleep(1)

if browser.div(:text=>'Αυθεντικοποίηση Χρήστη').present?
  browser.button(:class=>["btn", "btn-primary", "submit-button"]).click
end

#if idiotita[1] == 1
  #_pgpcgkeg
#  browser.div(:class=>'col-sm-1 col-xs-6 z-div').click
#  epilogi="Επιλογή"
#  epilogi = epilogi.encode(Encoding::UTF_8)
#  browser.button(:text=>epilogi).click
#end

print "Επιλέξτε Κατηγορία Χρήσης Πατήστε ΕΠΙΛΟΓΗ και στην Συνέχεια πατήστε Enter\r"
gets

for i in 1..n_length do

  kataxorisi = "Καταχώρηση Τιμολογίου"
  kataxorisi = kataxorisi.encode(Encoding::UTF_8)
  browser.button(:text=>kataxorisi).click

  browser.text_field(:class=>"z-datebox-input").value = date[i]
  browser.text_field(:class=>"z-textbox", :index => 0).value = afm_emporou[i]
  browser.send_keys :tab
  sleep(2)
  browser.send_keys :enter
  browser.text_field(:class=>"z-textbox", :index => 2).value = arithmos[i]
  browser.text_field(:class=>"z-decimalbox").value = synolo[i]
  browser.label(:class=>"z-checkbox-content").click

  repeat=vathos[i]
  f=9
  j=0

while j!=repeat do
  row=data.column(f)
  prosthiki= "Προσθήκη Προιόντος"
  prosthiki= prosthiki.encode(Encoding::UTF_8)
  browser.button(:text=>prosthiki).click
  sleep(2)
  browser.element(:class=>"z-bandbox-icon z-icon-search", :index=>0).click
  sleep(0.5)
  browser.text_field(:class=>"z-bandbox-input", :index=>0).set(row[i])
  f=f+1
  row=data.column(f)
  browser.send_keys :enter
  sleep(2)
  browser.element(:class=>"z-bandbox-icon z-icon-search", :index=>1).click
  sleep(0.5)

  metrisi=row[i]
  ##print metrisi
  metrisi=metrisi.encode(Encoding::UTF_8)
  #browser.element(:text=>metrisi).click
  if metrisi=="ΓΡΑΜΜΑΡΙΑ"
    browser.element(:class=>"z-listcell-content", :index=>3).click
  elsif metrisi=="ΚΙΛΑ"
    browser.element(:class=>"z-listcell-content", :index=>5).click
  elsif metrisi=="ΤΟΝΟΙ"
    browser.element(:class=>"z-listcell-content", :index=>7).click
  elsif metrisi=="ΤΕΜΑΧΙΟ"
    browser.element(:class=>"z-listcell-content", :index=>9).click
  elsif metrisi=="ΧΩΡΙΣ ΜΟΝ.ΜΕΤΡΗΣΗΣ"
    browser.element(:class=>"z-listcell-content", :index=>10).click
  else
    browser.element(:class=>"z-listcell-content", :index=>12).click
  end

  browser.send_keys :enter
  f=f+1
  row=data.column(f)
  sleep(1)
  browser.text_field(:class=>"z-decimalbox", :index=>1).value = row[i]
  f=f+1
  row=data.column(f)
  browser.send_keys :enter
  sleep(1)
  browser.text_field(:class=>"z-decimalbox", :index=>2).value = row[i]
  f=f+1
  apothikeusi = "Αποθήκευση"
  apothikeusi = apothikeusi.encode(Encoding::UTF_8)
  browser.button(:text=>apothikeusi).click
  j=j+1
  sleep(1)
end
  sleep(2)
  final = "Οριστικοποίηση"
  final = final.encode(Encoding::UTF_8)
  browser.button(:text=>final).click
  sleep(2)
end



#ΙΕΡΩΝΥΜΑΚΗΣ ΒΑΣΙΛΕΙΟΣ
#ΛΟΓΙΣΤΗΣ, ΣΑΟΥΝΑΤΣΟΥ 26, ΡΕΘΥΜΝΟ
