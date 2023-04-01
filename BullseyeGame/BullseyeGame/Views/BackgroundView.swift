//
//  BackgroundView.swift
//  BullseyeGame
//
//  Created by Pedro Acevedo on 01/04/23.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game

  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false

  var body: some View {
    HStack {
        Button(action: {
            game.restart()
        }) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
        Spacer()
        Button(action: {
            leaderboardIsShowing = true
        }) {
            RoundedImageViewFilled(systemName: "list.dash")
        }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
            LeaderboardView(leaderBoardIsShowing: $leaderboardIsShowing, game: $game)
        })
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String

  var body: some View {
      RoundRectTextView(title: title,text: text)
  }
}

struct BottomView: View {
  @Binding var game: Game

  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme //phone in dark mode?
    
    var body: some View {
        Color("BackgroundColor").edgesIgnoringSafeArea(.all)
        ForEach(1..<6) { ring in
            let size = CGFloat(ring * 100)
            let opacity = colorScheme == .dark ? 0.1 : 0.3 //if statement
            Circle()
                .stroke(lineWidth: 20.0)
                .fill(
                    RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity * 0.8), Color("RingColor").opacity(0.0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                .frame(width: size, height: size)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
