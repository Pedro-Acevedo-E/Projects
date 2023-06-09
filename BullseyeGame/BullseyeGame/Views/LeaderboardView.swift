//
//  LeaderboardView.swift
//  BullseyeGame
//
//  Created by Pedro Acevedo on 01/04/23.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(RoundedRectangle(cornerRadius: .infinity)
                        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.Generel.strokeWidth))
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}

struct HeaderView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack{
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                    
                }
            }.padding(.top)
            
            HStack{
                Spacer()
                Button(action: {
                    leaderBoardIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack{
            Spacer().frame(width: Constants.Generel.roundedViewLenght)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        LeaderboardView(leaderBoardIsShowing: leaderboardIsShowing, game: game)
    }
}
