//
//  TextView.swift
//  BullseyeGame
//
//  Created by Pedro Acevedo on 01/04/23.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2.0) //Space between characters
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(1.5)
            .multilineTextAlignment(.center)
            .lineSpacing(2.0)
            .font(.caption)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(15.0)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .font(.title3)
            .bold()
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(21.0)
            
    }
}


struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .foregroundColor(Color("TextColor"))
            .kerning(-1.0)
            .fontWeight(.black)
            .font(.largeTitle)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.body)
            .frame(width: 35.0)
    }
}

//For the leaderboards....
struct ScoreText: View {
    var score: Int
    
    var body: some View{
        Text(String(score))
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(-0.2)
            .font(.title3)
        
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View{
        Text(date, style: .time)
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(-0.2)
            .font(.title3)
    }
}

struct BigBoldText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "score")
            BodyText(text: "You Scored 200 points \n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 10)
        }
        .padding()
        
    }
}
