import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    visible: true 
    id: janela
    width: 800
    height: 500
    title: "CONVERSÃO" /*nome da janela*/
    font.pixelSize: 24

    Image {
        id: imagem1
        width: 800
        height: 500
        fillMode: Image.PreserveAspectCrop /*a imagem é dimensionada uniformemente para preencher, cortando se necessário (é necessário definir altura e largura, vai ser dimensionada com base nisso)*/
        source: "https://media.seudinheiro.com/uploads/2019/04/pontos-e-dinheiro.jpg"
        TextField {
            id: reais
            width: 200
            height: 70

            color: "#ffe031" /*cor do texto*/  

            font { 
                family: "Courier New"
                pointSize: 19 /*tamanho do texto*/
                bold: true /*texto em negrito*/
            }

            placeholderText: "BRL" /*nome de fundo*/
            placeholderTextColor: "#ffe031" /*cor do nome de fundo*/

            anchors {
                right: imagem1.right /*fixando na esquerda da imagem1*/
                rightMargin: 60 /*margem*/
                top: imagem1.top /*fixando no topo da imagem1*/
                topMargin: 120 /*margem*/
            }
            cursorDelegate: Rectangle { /*mudando a cor do cursor*/
                visible: reais.cursorVisible
                color: "#1b6aa0"
                width: reais.cursorRectangle.width
            }
            background: Rectangle {
                color: "#40FFFFFF" /*cor transparente (o 40 representa o quanto é transparente)*/
                border.color: "#1b6aa0" /*cor da borda*/
                border.width: 3 /*tamanho da borda (1 é o padrão, feito manualmente para possíveis consultas)*/
                radius: 4
            }
        }
        Button {
            id: button
            width: 50
            height: 70
            Text { /*para poder mudar a cor do texto*/
                text: "↑↓"
                 
                anchors.fill: button /*posicionando em relação ao botão*/
                horizontalAlignment: Text.AlignHCenter /*alinhando ao centro do botão horizontalmente*/
                verticalAlignment: Text.AlignVCenter /*alinhando ao centro do botão verticalmente*/
                
                color: "#1b6aa0" /*cor do texto*/
                style: Text.Outline /*colocando estilo de texto que permite borda*/
                styleColor: "#111112" /*cor da borda do texto*/

                font { 
                    family: "Courier New"
                    pointSize: 19 /*tamanho do texto*/
                    bold: true /*texto em negrito*/
                }
            }
            anchors {
                right: reais.right /*fixando na direita do textfield*/
                rightMargin: 75 /*margem*/
                top: reais.top /*fixando no topo da textfield*/
                topMargin: 75 /*margem*/
            }
            background: Rectangle {
                color: "#00FFFFFF" /*cor transparente (o 40 representa o quanto é transparente)*/
                border.color: "#1b6aa0" /*cor da borda*/
                border.width: 3 /*tamanho da borda (1 é o padrão, feito manualmente para possíveis consultas)*/
                radius: 4
            }
            onClicked: {
                var conversao_return = conversao.entrada(reais.text)
                label.text = conversao_return
            }
        }
        Rectangle {
            id: frame
            width: 200
            height: 70
            color: "#40FFFFFF" /*cor transparente (o 40 representa o quanto é transparente)*/
            border.color: "#1b6aa0" /*cor da borda*/
            border.width: 3 /*tamanho da borda (1 é o padrão, feito manualmente para possíveis consultas)*/
            radius: 4

            anchors {
                right: imagem1.right
                rightMargin: 60
                top: button.top
                topMargin: 75
            }
            Label {
                id: label
                text: "USD"
                color: "#ffe031" /*cor do texto*/

                font { 
                    family: "Courier New"
                    pointSize: 19 /*tamanho do texto*/
                    bold: true /*texto em negrito*/
                }
                anchors {
                    left: frame.left
                    leftMargin: 15
                    top: frame.top
                    topMargin: 20
                }
            }
        }
    }
}