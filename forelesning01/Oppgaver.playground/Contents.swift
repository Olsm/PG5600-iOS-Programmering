import UIKit

/*:

# Øvingsoppgaver forelesning 1


#### Oppgave 1

  Definer en konstant med “Swift er fett!”.
- Forsøk å sette verdien til noe annet.
- Hvorfor fikk du feilmelding nå?
- Endre koden slik at du kan endre verdien uten å få feilmelding

*/
let const = "Swift er fett!"
// const = "kan ikke endres"
/* Jeg får feilmelding fordi en let er konstant og kan ikke endres.
    Den kan kun settes 1 gang.
    Enten kan man endre fra let til var som tillater endring,
    eller man kan opprette ny var som bruker verdien til konstanten */
var v = const + " Swift FTW!"   // V = "Swift er fett! Swift FTW!"
var num = 1
num = 2 // num = 2
/*:
## Oppgave 2

Lag en konstant med en eksplisitt String type og verdien “iOS FTW” - Fjern deretter typen. Hvorfor er dette mulig?

*/
let iOS : String = "iOS FTW"
let iOS2 = "iOS FTW"
/* Dette er mulig på grunn av type casting
 Swift skjønner selv at "iOS FTW" er en string
 og dermed trengs det ikke defineres at det er en string */
/*:
## Oppgave 3

Lag en numerisk konstant og en streng konstant, lag deretter en konstant som innholder begge.
Gjennomfør dette både med string interpolering og uten.

*/
let number = 1
let text = "test"
// Uten String interpolation
let numtext = String(number) + " and " + text // numtext = "1 and test"
// Med String interpolation
let numbertext = "\(number) and \(text)"    // numtext = "1 and test"
/*:
## Oppgave 4

Lag et utrykk med string interpolering der du regner ut summen av 5 * 120 som en del av interpoleringen, skriv dette ut ved hjelp av println

*/
print("5 * 120 = \(5*120)") // 5 * 120 = 600
/*:
## Oppgave 5

Sammenlign to strenger og print “de er like”, om de er helt like, eller “de er forskjellige” om de er ulike

*/
if "test" == "test" {
    print ("de er like")
} else {
    print ("de er forskjellige")
}
/*:
## Oppgave 6

Lag en tuple med innholdet (5600, “iOS programmering”). Bruk deretter println for å skrive ut “PG5600 - iOS programmering”
*/
let tuple = (5600, "iOS programmering")
print("PG\(tuple.0) - \(tuple.1)")
/*:
## Oppgave 7

Lag en loop der du skriver ut hver ord i en array på egen linje
Lag deretter en loop som printer ut hver enkelt bokstav i hvert ord på en ny linje


Forventet resultat
*/
//:    Falcon 9
//:    Dragon
//:    F
//:    a
//:    l
//:    c
//:    o
//:    n
//:
//:    9
//:    D
//:    r
//:    a
//:    g
//:    o
//:    n
let array = ["falcon 9", "Dragon"]

for item in array {
    print (item)
}

for item in array {
    for i in item.characters {
        print (i)
    }
}
/*:
## Oppgave 8

Lag en dictionary med 5 key-value par, loop over den og skriv ut key og value med print

*/
let stringAsInts: [String:Int] = [
    "one" : 1,
    "two" : 2,
    "three" : 3,
    "four" : 4,
    "five" : 5
]

// print(stringAsInts)
for (string, int) in stringAsInts {
    print ("\(string) = \(int)")
}
/*:
## Oppgave 9

Lag et nytt iOS prosjekt i Xcode av typen “Single View Application”.
1. Finn det stedet som kalles når applikasjonen starter opp
2. Definer opp streng konstanter for title, beskjed og knapp.
3. Lag et UIAlertView som bruker konstantene du har definert.
4. Kall en metode .show på alert view instansen.
5. Kjør simulatoren og verifiser at tekststrengen dukker opp.
*/
// Første sted som kalles når applikasjonen starter opp
/*
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let title = "SuchProject"
    let message = "very message"
    let button = "so button"
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Really reset?" message:@"Do you really want to reset this game?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"Yes"];
    [alert show];
    return true
}*/

//:## Oppgave 10

//:Du har fått disse to objektene med data fra et API, dessverre har det kommet med litt andre verdier i array,
//:men index og antall launches er fortsatt riktig - Falcon 9 har 19 launches, Atlas V har 55, osv.
let rockets : [Any?] = ["Falcon 9", nil, -999, nil, "Atlas V", nil, "Space Shuttle", nil, "My Water bottle-rocket"]
let numberOfLaunches = [19, 55, 135, 1]
//:    Gå gjennom rockets og skriv rakettenes navn og antall launches på formatet
//:    Falcon 9 : 55 launches
//:    ...
//:    My water bottle-rocket : 1 launch        // merk dropp genitivs-s når det er kun 1 launch
// Return only the String elements from array as a String array
let rocketNames = rockets.filter{$0 is String} as! [String]

// Combine the rocket names and launches to a new array
var rocketInfo: [String: Int] = [:]

// Alternative 1: zip
for (key, value) in zip(rocketNames, numberOfLaunches) {
    rocketInfo[key] = value
}

// Alternative 2: enumerated
for (index, element) in rocketNames.enumerated() {
    rocketInfo[element] = numberOfLaunches[index]
}

// Print the result of the new array of rocket names and launches
for (name, launches) in rocketInfo {
    print ("\(name) : \(launches) launches")

}
/*:
## Oppgave 11

Denne oppgaven er ekstra utfordrende og må løses utenfor playground. I terminalen, kjør først:

xcode-select -s /Applications/Xcode-beta.app/Contents/Developer

Slik at du kan kjøre swift fra kommandolinjen.

Lag deretter en fil “langauges.txt” med innholdet:

Swift
Java
Objective-C
Python

Lag deretter en fil kalt “swiftsort.swift” med følgede innhold:

#!/usr/bin/env xcrun swift
import Cocoa
print(“Hello world”)

For å gjøre denne kjørbar fra terminalen, skriver du

chmod +x swiftsort

Prøv å kjøre applikasjonen med

./swiftsort

Du skal nå se "Hello world" i terminalen. Oppgaven videre er å oppdatere swiftsort slik at

cat languages.txt | ./swiftsort

Vil skrive ut:

Java, Objective-C, Python, Swift

*/
