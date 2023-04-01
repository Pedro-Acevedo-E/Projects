//
//  Constants.swift
//  BullseyeGame
//
//  Created by Pedro Acevedo on 01/04/23.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue:Int) -> Int {
        let difference = abs(target - sliderValue)
        if difference == 0 {
            return 200
        }
        if difference < 3 {
            return 150 - difference
        }
        return 100 - difference
    }
    
    mutating func startNewRound(points: Int){
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
}
