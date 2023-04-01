//
//  RoundViews.swift
//  BullseyeGame
//
//  Created by Pedro Acevedo on 01/04/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.Generel.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: 56.0, height: 56.0)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack (spacing: 5){
        LabelText(text: title)
        Text(text)
            .kerning(-0.2)
            .bold()
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.Generel.strokeWidth)
            )
            .font(.title2)
        
        }
    }
}

//For the leaderboards
struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle().strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.Generel.strokeWidth)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(title: "score", text: "0")
            RoundedTextView(text: "1")
            
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
        
    }
}
