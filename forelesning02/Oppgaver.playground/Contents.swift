import Foundation

/*:
 # Øvingsoppgaver forelesning 2
 
 
 ## Oppgave 1a:
 Lag en funksjon, minimum, som tar to verdier, og returnerer den minste
 
 minimum(a: 54, b: 392)   // 54
 
 ## Oppgave 1b: Lag samme type funksjon for maximum
 
 maximum(a:54, b: 392)    // 392
 */

func minimum(a: Int, b: Int) -> Int {
    if a < b {return a}
    else {return b}
}

func maximum(a: Int, b: Int) -> Int {
    if a > b {return a}
    else {return b}
}

/*:
 ## Oppgave 2:
 Lag en funksjon, sumOfAllValues, som summerer all verdiene i et array
 
 sumOfAllValues(inArray: [34,10,10,10,100]) //  164
 
 */

func sumOfAllValues(inArray: [Int]) -> Int {
    var sum = 0
    for value in inArray {
        sum += value
    }
    return sum
}

/*:
 ## Oppgave 3a:
 Lag en funksjon, numbersBiggerThan, som tar inn et tall, og et array og returnerer alle verdiene i arrayet som var større enn tallet som ble gitt
 
 numbersBiggerThan(54, [34,39,100,493,1,5])    // [ 100, 493 ]
 
 ## Oppgave 3b: Utvid funksjonen til å returnere nil hvis ingen verdier var større enn tallet du ga
 
 numbersBiggerThan(999, [34,39,100,493,1,5])    // nil ,   MERK: nil er ikke det samme som et tomt array
 
 */

func numbersBiggerThan(number: Int, inArray: [Int]) -> [Int]? {
    var numbersBigger = [Int]()
    for arrayNum in inArray {
        if (arrayNum > number) {
            numbersBigger.append(arrayNum)
        }
    }
    if inArray.isEmpty {return nil}
    return numbersBigger
}


/*:
 ## Oppgave 4a:
 Lag denne funksjonen. Output skal være "WWWWW"
 
 repeatCharacter(Character("W"), 5)
 
 */

func repeatCharacter(character: Character, times: Int) -> String {
    var str = ""
    for _ in 1 ... times {
        str += String(character)
    }
    return str
}

/*:
 ## Oppgave 4b
 Utvid funksjonen til å støtte default parametere. Dvs. at når times ikke oppgis, så skal den som standard settes til 1. Output her blir altså "W"
 
 repeatCharacter(Character("W"))
 */

func repeatCharacter(character: Character) -> String {
    return repeatCharacter(character: character, times: 1)
}

/*:
 
 ## Oppgave 5a :
 
 Lag en funksjon og en enum gjør at du kan definere denne metoden :
 
 setCase(text: "Interstellar", case: .Uppercase) // INTERSTELLAR
 setCase(text: "Interstellar", case: .Lowercase) // interstellar
 */

enum Case {
    case Uppercase
    case Lowercase
}

func setCase(text: String, casee: Case) -> String {
    switch casee {
    case .Uppercase:
        return text.uppercased()
    case .Lowercase:
        return text.lowercased()
    }
}

/*:
 ## Opppgave 5b
 utvid funksjonen til å akseptere nil som case argument, hvor den da velger uppercase
 
 setCase(text: "Interstellar", case: nil) // INTERSTELLAR
 
 */

func setCase(text: String, casee: Case?) -> String {
    var newCase: Case
    if casee == nil {
        newCase = Case.Uppercase
    } else {
        newCase = casee!
    }
    switch newCase {
    case Case.Uppercase:
        return text.uppercased()
    case Case.Lowercase:
        return text.lowercased()
    }
}

/*:
 ## Oppgave 5c
 utvid funksjonen til å ha default nil som case arugment, slik at man kan, men ikke trenger å gi case
 
 setCase(text: "Interstellar") // INTERSTELLAR
 */

func setCase(text: String) -> String {
    return setCase(text: text, casee: .Uppercase)
}

/*:
 ## Oppgave 5d
 utvid funksjonen til å kunne ta nil som text argument også, men da retunerer nil
 
 setCase(text: nil) // nil
 
 */

func setCase(text: String?) -> String? {
    if text == nil {return nil}
    return setCase(text: text!, casee: .Uppercase)
}

/*:
 ## Oppgave 6a
 Lag en funksjon som kan ta inn et variabelt antall parametere, og sum regner ut produktet av disse:
 
 calculate(2, 5, 5) // --> 50
 calculate(10, 10) // --> 100
 */

func calculate(numbers: Int...) -> Int {
    var sum = 1
    for number in numbers {
        sum *= number
    }
    return sum
}

/*:
 ## Oppgave 6b
 Utvid funksjonen slik at den støtter utregning av både produkt og sum (med enum som første parameter):
 
 calculate(.Product, 2, 5, 5) // -> 50
 calculate(.Product, 10, 10) // -> 100
 calculate(.Sum, 2, 5, 5) // -> 12
 calculate(.Sum, 10, 10) // -> 20
 */

enum CalcType {
    case Product
    case Sum
}

func calculate(type: CalcType, numbers: Int...) -> Int {
    var sum = 0
    if type == .Sum {
        for number in numbers {
            sum += number
        }
    } else if type == .Product {
        sum = 1
        for number in numbers {
            sum *= number
        }
    }
    return sum
}

/*:
 ## Oppgave 6c
 Endre funksjonen slik at den returnerer flere verdier, og alltid regner ut både produkt og sum:
 
 let result = calculateBoth(numbers: 2, 5, 5)
 print("Produkt: \(result.product), Sum: \(result.sum)")
 */

func calculateBoth(numbers: Int...) -> (product: Int, sum: Int) {
    var sum = 0, product = 1
    for number in numbers {
        sum += number
        product *= number
    }
    return (product: product, sum: sum)
}

/*:
 ## Oppgave 7
 Lag en funksjon getCalculator, som tar imot en operator. Dersom operatoren er gyldig (er + eller *) skal riktig regnefunksjon returneres, som igjen kan kalles for å utføre selve regneoperasjonen. Hvis operatoren ikke er støttet (altså ikke er + eller *) skal nil returneres.
 
 // Skal kunne regne ut produkt ved å bytte ut + med *:
 if let calcFn = getCalculator("+") {
 print(calcFn([3, 6, 9]))
 }
 */

func getCalculator(oprtr: String) -> (Int) -> Int? {
    var type: CalcType?
    if (oprtr == "+") {
        type = .Sum
    } else if oprtr == "*" {
        type = .Product
    } else {
        type = nil
    }
    return { numbers in
        if (type == nil) {return nil}
        return calculate(type: type!, numbers: numbers)
    }
}

/*
 let calcFn = getCalculator(oprtr: "+") {
 print(calcFn([3, 6, 9]))
 }
 */

/*:
 # Oppgave 8
 Lag en request-metode som tar inn en string som første
 parameter, og en closure som 2. parameter:
 
 request("http://www.vg.no", { beskrivelse in
 if beskrivelse {
 print(beskrivelse)
 } else {
 print("Fant ikke noen beskrivelse")
 }
 })
 
 Når URLen er `http://www.vg.no` som i eksemplet, skal
 beskrivelsen være "Verdens gang". Dersom URLen er `http://www.aftenposten.no` skal beskrivelsen være "Aftenposten". I andre tilfeller er beskrivelsen `nil` og `Fant ikke noen beskrivelse` skal skrives ut
 */

func request(address: String, callback: (String?) -> Void) {
    var description: String?
    if (address == "http://www.vg.no") {
        description = "Verdens gang"
    } else if (address == "http://www.aftenposten.no") {
        description = "Aftenposten"
    }
    if description != nil {
        callback(description!)
    } else {
        callback(nil)
    }
}

/*:
 
 # Oppgave 9 a.
 
 Lag en metode som tar string som 1. parameter, success-closure som 2. parameter, og error-closure som 3.parameter. Response skal være av typen [NSObject : AnyObject], og error skal være av typen NSError
 
 startRequesting(url:"http://http.cat", success: { (response) in
 print(response)
 }, failure: { (error) in
 print(error)
 }
 
 */

func startRequesting(url: String, success: (_: AnyObject) -> Void, failure: (_: NSError) -> Void) {}

/*:
 # Oppgave 9 b.
 
 Gjør om metoden til å kunne kalles med optional failure closure som er default nil.
 
 startRequesting(url:"http://http.cat", success: { (response) in
 print(response)
 }
 */

func startRequestingB(url: String, success: (_: AnyObject) -> Void, failure: ((_: NSError?) -> Void)? = nil) {}

/*:
 # Oppgave 9 c.
 
 Legg til en enum som sier hva slags HTTP-verb som skal brukes
 enumen skal ha GET, POST, PUT og DELETE
 
 startRequesting(url:"http://http.cat", method: httpMethod.GET, success: { (response) in
 print(response)
 }
 */

func startRequestingC(url: String, method: httpMethod, success: (_: AnyObject) -> Void, failure: ((_: NSError?) -> Void)? = nil) {}

enum httpMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

/*:
 # Oppgave 10:
 
 Fullfør dette programmet:
 
 // 1. Lag en struct `Coordinate` som inneholder lat/long her */

struct Coordinate {
    var lat: Double
    var long: Double
}

/* 2. Lag en klasse `GeoCache` som har properties for:
 - Coordinate
 - name
 - hint
 - log (en array med strenger)
 
 Lag en `signLog` metode som legger igjen en beskjed i cacheloggen
 */

class GeoCache {
    var coordinate: Coordinate
    var name: String {get {return self.name} set{self.name = newValue}}
    var hint: String {get {return self.hint} set{self.hint = newValue}}
    var log: [String]{get {return self.log} set{self.log = newValue}}
    
    init(coordinate: Coordinate, name: String, hint: String) {
        self.coordinate = coordinate
        self.name = name
        self.hint = hint
        self.log = [String]()
    }
    
    func signLog(message: String) {
        self.log.append(message)
    }
}

/* instansier og populer GeoCache, eks:
 lat: 59.91126
 long: 10.76046
 name: Westerdals
 hint: Rom 81
 */

let cache = GeoCache(coordinate: Coordinate(lat: 59.91126, long: 10.76046), name: "Westerdals", hint: "Rom 81")

cache.signLog(message: "Someone was here...")
cache.signLog(message: "I was here!")

/*
 Slik at det ender med å skrive ut:
 
 Westerdals
 59.0 42.0
 Hint: Rom 81
 
 Logg:
 Someone was here...
 I was here!
 */
