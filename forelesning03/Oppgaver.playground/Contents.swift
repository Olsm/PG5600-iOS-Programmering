
import Foundation
/*:
# Oppgave 1
Lag en extension på String som gjør at du kan subscripte String og få ut en Character.
Den skal oppfylle dette:

"Hei"[0]     // H
"Hei"[1]     // e
"Hei"[4]     // nil

// observer hva som skjer om du bruker emojis og subscripter dem med samme metode:

"😸👻🙆🏽"[1]

"LOL😸👻🙆🏽"[5]

*/

extension String {
    subscript(position: Int) -> Character? {
        guard (position >= 0 && position < self.characters.count) else {
            return nil
        }
        let index = self.characters.index(self.startIndex, offsetBy: position)
        return (self[index])
    }
}

/*:

## Oppgave 2
lag en klasse MadScientist som er subklasse av Scientist som er subklasse av Person som er subklasse av LivingBeing

følgende attributter skal lages:

Madscientist skal ha madnessfactor
Scientist skal ha IQ
Person skal ha name
livingBeing skal ha birthDate og birthPlace , disse skal det ikke gå ann å override

Dette skal gå kompilere:

let madScientist = MadScientist(name: "John Doe", IQ: 32, madnessfactor: 41)

let madScientist2 = MadScientist(IQ: 32)       // HINT: bruk convenience init og sett default-verdier på attributtene som ikke blir gitt

*/

class LivingBeing {
    let birthDate: Date
    let birthPlace: String
    
    init(birthDate: Date, birthPlace: String) {
        self.birthDate = birthDate
        self.birthPlace = birthPlace
    }
}

class Person : LivingBeing {
    var name: String
    
    init(name: String, birthDate: Date, birthPlace: String) {
        self.name = name
        super.init(birthDate: birthDate, birthPlace: birthPlace)
    }
}

class Scientist : Person {
    var IQ: Int
    
    init(name: String, birthDate: Date, birthPlace: String, IQ: Int) {
        self.IQ = IQ
        super.init(name: name, birthDate: birthDate, birthPlace: birthPlace)
    }
}

class MadScientist : Scientist {
    var madnessfactor: Int
    
    init(name: String, birthDate: Date, birthPlace: String, IQ: Int, madnessfactor: Int) {
        self.madnessfactor = madnessfactor
        super.init(name: name, birthDate: birthDate, birthPlace: birthPlace, IQ: IQ)
    }
    
    convenience init (IQ: Int) {
        self.init(name: "", birthDate: Date(), birthPlace: "", IQ: IQ, madnessfactor: 0)
    }
    
    convenience init(name: String, IQ: Int, madnessfactor: Int) {
        self.init(name: name, birthDate: Date(), birthPlace: "", IQ: IQ, madnessfactor: madnessfactor)
    }
}

/*:

## Oppgave 3

1. Svar på hvorfor kompilatoren feiler når du limer inn klassen uten kontruktør
2. Lag en designated konstruktør og en convenience kontruktør for denne klassen
3. Lag nye instanser av klassen ved hjelp av de to kontruktørene du lagde i oppgave 2.2

class Timer {
var hour: Int
var minute: Int
var second: Int

var running: Bool = false
var startedAt: Date?
var stoppedAt: Date?
}

*/

// 1. Fordi hour, minute og second er ikke optional og settes ikke til en default verdi.
// Uten initializer blir variabler uten default verdi satt til nil, men da må de være optional.

class Timer {
    var hour: Int
    var minute: Int
    var second: Int
    
    var running: Bool = false
    var startedAt: Date?
    var stoppedAt: Date?
    
    init(hour: Int, minute: Int, second: Int, running: Bool, startedAt: Date?, stoppedAt: Date?) {
        self.hour = hour
        self.minute = minute
        self.second = second
        self.running = running
        self.startedAt = startedAt
        self.stoppedAt = stoppedAt
    }
    
    init(hour: Int, minute: Int, second: Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    convenience init(hour: Int, minute: Int) {
        self.init(hour: hour, minute: minute, second: 0)
    }
    
    convenience init(hour: Int) {
        self.init(hour: hour, minute: 0, second: 0)
    }
}
let date = Date()
let timer1 = Timer(hour: 0, minute: 0, second: 0, running: false, startedAt: nil, stoppedAt: date)
let timer2 = Timer(hour: 1)

/*:
## Oppgave 4

1. Lag en base klasse Animal, der du finner måter å bruke final og required som beskrevet i slidene
2. Lag en metode for å sove, en metode for å returnere lyden dyret lager
3. Lag deretter en subclass, for eksempel Bird som arver av base klassen Animal
4. Bruk override for å skrive over base klassen funksjonaliteten
5. Lag en subclass til som arver av Animal base klassen
6. Lag en array med begge subklassene og foreach over dem,
7. Identifiser hva slags type det er og skriv det ut ved hjelp av println

*/

class Animal {
    let name: String
    
    final var sleep: String {
        return "\(name) is sleeping"
    }
    
    func getSound() -> String {
        return "\(name) makes a sound"
    }
    
    required init(name: String) {
        self.name = name
    }
}

class Bird: Animal {
    override func getSound() -> String {
        return "\(name) whistles"
    }
}

class Cat: Animal {
    override func getSound() -> String {
        return "\(name) meows"
    }
}

let bird = Bird(name: "birdie")
let cat = Cat(name: "cutie")
let animals = [bird, cat]

for animal in animals {
    if (animal is Cat) {
        print("\(animal.name) is a cat")
    } else if (animal is Bird) {
        print("\(animal.name) is a bird")
    }
    print(animal.getSound())
}

/*:
## Oppgave 5

1. Lag en protocol LivingBeing som har attributtene isAlive, birthDate og deathDate
2. Lag en procotol extension som lager standard implmentasjon av isAlive
3. Lag en klasse Frog som følger protokollen LivingBeing
4. Skriv klassen slik at dette er mulig:

var frog = Frog(birthDate: Date())

frog.isAlive     // true

frog.deathDate = Date()

frog.isAlive     // false

*/

protocol LivingBeing2 {
    var isAlive: Bool {get}
    var birthDate: Date {get set}
    var deathDate: Date? {get set}
}

extension LivingBeing2 {
    var isAlive: Bool {
        return deathDate == nil
    }
}

class Frog: LivingBeing2 {
    internal var deathDate: Date?
    var birthDate: Date
    
    init(birthDate: Date) {
        self.birthDate = birthDate
        self.deathDate = nil
    }
}

/*:
## Oppgave 6

1. Lag det som er nødvendig for at denne if statementen fungerer
2. Lag et eksempel på begge utfall av if


if let street = westerdals.students?.first?.address?.street {
println("Studenten bor i \(street).")
} else {
println("Kunne ikke hente gatenavn")
}

*/

class Westerdals {
    var students: [Student]?
    
    init() {
        students = [Student]()
    }
    
    func addStudent(student: Student) {
        students?.append(student)
    }
}

class Student {
    var address: Address?
    
    init(address: Address?) {
        self.address = address
    }
}

class Address {
    var street: String
    
    init(street: String) {
        self.street = street
    }
}

/*:
## Oppgave 7

1. Lag det som er nødvendig for at denne if statementen fungerer

```swift
if (westerdals.students?.first?.address = otherAddress) != nil {
println("Du satt en ny addresse")
} else {
println("Det var ikke mulig å sette en ny addresse")
}
```

*/

// Dette fungerer allerede med koden over

/*:
## Oppgave 8

1. Bytt ut first? og bruk subscript i stedet

```swift
if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
println("Fullstendig gatenavn er \(fullStreetName)")
} else {
println("Kunne ikke hente fullstendig gatenavn")
}
```

*/

let address = Address(street: "Dyretråkket 24")
let student = Student(address: address)
let westerdals = Westerdals()
westerdals.addStudent(student: student)


if let fullStreetName = westerdals.students?[0].address?.street {
    print("Fullstendig gatenavn er \(fullStreetName)")
} else {
    print("Kunne ikke hente fullstendig gatenavn")
}


/*:

## Oppgave 9

1. Lag extention på String, slik at følgende kode vil fungere

```swift
"AB".length // 2
"AB".reverse() // Skal printe ut BA
"Abba".contains("AbA") // Skal printe ut false
"Abba".contains("Abb") // SKal printe ut true
```
*/

extension String {
    var length: Int {
        return self.characters.count
    }
    
    func reverse() -> String {
        return String(self.characters.reversed())
    }
}

/*:

## Oppgave 10

1. Lag en extention på Array med en metode thirdElementInArray

```swift
let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]

anArray.thirdElementInArray()    // 24
anotherArray.thirdElementInArray()    // !
thirdArray.thirdElementInArray()    // nil

```
*/

extension Array {
    func thirdElementInArray() -> Any? {
        if self.count < 3 {
            return nil
        }
        return self[2]
    }
}

let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]


/*:

# Oppgave 12

du har fått følgende state satt (enumen må du definere selv):

let isOnline = false
let hasTakenBackup = true
let readyState = ReadyState.Ready
let name : String? = "User login screen"

func createUser() {

}

12a : Fyll ut metoden createUser med control flow uten å bruke guard - sjekk om alle bool er true, state er ready, og name har en verdi

12b : lag en ny implementasjon av metoden der du bruker så mange guard statements som mulig


*/

enum ReadyState {
    case Ready
}

let isOnline = false
let hasTakenBackup = true
let readyState = ReadyState.Ready
let name : String? = "User login screen"

func createUser() {
    if (isOnline) {
        if (hasTakenBackup) {
            if (readyState == ReadyState.Ready) {
                if name != nil {
                    // Do something
                }
            }
        }
    }
}

func createUser2() {
    guard (isOnline) else {return}
    guard (hasTakenBackup) else {return}
    guard (readyState == ReadyState.Ready) else {return}
    guard ((name) != nil) else {return}
    // Do something
}

/*:

# Oppgave 13

Få klassen Car til å implementere hashable

implementer funksjonalitet slik at hvis man har to car objekter og plusser de sammen så får man et dictionary hvor key er modelName

car1 + car2    // ["Tesla" : car1 ... ]

2b:
car1 + nil     // ["Tesla" : car1]


*/






/*:

#Oppgave 14

Lag en [Any] med 5 forskjellige objekter, løp gjennom arrayet og bruk switch for å printe de forskjellige objektene hvor du skriver ut klassens navn og hvor mange av dem du har funnet til nå.

*/
/*:

#Oppgave 15

Lag en generisk metode printAllStrings som er generic på CollectionType, som går gjennom og printer alle stringer den finner til console. Den skal ikke printe ut andre objekter eller typer enn strenger

let intArray = [ 234, 34 ,33]
let stringArray = [ "hello", "world" ]
let anyObjectArray : [AnyObject] = ["Omg", 234, 342.3]

printAllStrings(intArray)
printAllStrings(stringArray)         // printer: Hello   world
printAllStrings(anyObjectArray)      // printer: Omg


*/
