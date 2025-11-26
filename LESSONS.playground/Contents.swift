print("Lezione: operazione tra variabili")

var a:Int = 2
var b:Int = 5
var c:Int = 0

c = a

print(c)

a = -2

print("a: ",a)
print("c:", c)


var a1: Double = 4.4
var b1: Int = Int(a1)


var e1: String = String(a1)
var f1: String = "Misura \(a1)"


var array :[String] = ["Luca", "Carlo", "Nicola", "Sandro"]

var index = 0

for nome in array{
    
    print("Ciao \(nome) - \(index)")
    index+=1
}
