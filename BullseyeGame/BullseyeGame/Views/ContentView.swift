//
//  ContentView.swift
//  BullseyeGame
//
//  Created by Pedro Acevedo on 01/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    
    @State private var sliderValue = 50.0
    
    @State private var game = Game()
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                
                InstructionView(game: $game).padding(.bottom, alertIsVisible ? 0 : 100)
                
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale)
                }else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue).transition(.scale)
            }
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            InstructionText(text: "🎯🎯🎯 \nPut the bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)

            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack{
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("Hit Me".uppercased()).bold().font(.title3)
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
        .padding(20.0)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: Constants.Generel.strokeWidth)
        )
        /*
        .alert("Hello there!", isPresented: $alertIsVisible){
            Button(action: {
                game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
            }) {
                  Text("Awesome!")
              }
            } message: {
              let roundedValue = Int(sliderValue.rounded())
              Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round.")
        }
         */
    }
}

//este bloque controla las previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))  //preview en modo landscape
            
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
