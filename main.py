from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication
from httpx import get

class Conversao(QObject):
    @Slot(str, result=str)
    def entrada(self, real): 
        response = get(
                f'https://economia.awesomeapi.com.br/json/last/BRL-USD'
            ).json() #pega o link e transforma em um json (o response adquire todas as informações do json da conversão)
        
        real1 = float(real.replace(',', '.')) #sistema brasileiro de moedas (,) -> sistema americano de moedas (.) e transformando a string em float
        
        dolar1 = float(response["BRLUSD"]["bid"]) #pegando o valor de compra de real para dólar e transformando a string em float
        dolar2 = float(response["BRLUSD"]["ask"]) #pegando o valor de venda de real para dólar e transformando a string em float
        dolar = (dolar1 + dolar2)/2 #fazendo a média para obter quanto 1 real vale em dólar 

        valor = str(round(real1*dolar, 2)) #realizando a operação, deixando somente com duas casas decimais e transformando o float em string

        valor1 = str(valor.replace('.', ','))  #sistema americano de moedas (.) -> sistema brasileiro de moedas (,)

        return "US$ " + valor1

app = QGuiApplication()

engine = QQmlApplicationEngine()
engine.load("conversão.qml")

conversao = Conversao()
context = engine.rootContext()
context.setContextProperty("conversao", conversao)

app.exec() 