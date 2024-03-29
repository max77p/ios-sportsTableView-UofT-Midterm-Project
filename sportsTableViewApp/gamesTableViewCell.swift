//
//  gamesTableViewCell.swift
//  sportsTableViewApp
//
//  Created by Shan Indrakumar on 2019-11-04.
//  Copyright © 2019 CS2680. All rights reserved.
//

import UIKit

class gamesTableViewCell: UITableViewCell {

    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var visitorScoreLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    
    @IBOutlet weak var pregameLabel: UILabel!
    
    @IBOutlet weak var visitorImage: UIImageView!
    @IBOutlet weak var homeImage: UIImageView!
    
    
    func setGame(homeTeam:Games){
        self.visitorLabel.text = "test"
       
        self.visitorLabel.text = homeTeam.visit_team_name

        self.homeLabel.text = homeTeam.home_team_name
        
        self.visitorImage.image=UIImage(named: homeTeam.visit_team_logo)
        self.homeImage.image=UIImage(named: homeTeam.home_team_logo)
        
        self.determinePregameOrGame(status: homeTeam.game_state, data: homeTeam)
//        if homeTeam.game_state=="Final"{
//                 self.homeScoreLabel.text=homeTeam.home_team_score
//                 self.visitorScoreLabel.text=homeTeam.visit_team_score
//                 self.pregameLabel.isHidden=true
//
//             }
//        else{
//                 self.homeScoreLabel.isHidden=true
//                 self.visitorScoreLabel.isHidden=true
//                 self.pregameLabel.text=homeTeam.game_time
//             }
       }

    
    func determinePregameOrGame(status:String,data:Games){
        if status=="Final"{
            self.homeScoreLabel.text=data.home_team_score
            self.visitorScoreLabel.text=data.visit_team_score
            self.pregameLabel.isHidden=true
        }
        else if status=="Pregame"{
            self.homeScoreLabel.isHidden=true
            self.visitorScoreLabel.isHidden=true
            self.pregameLabel.text=data.game_time
        }
    }
    
   
}
//var game_state : String
//  var assignImage: String
//  var assignLeagueName: String
//
//
//  var home_team_city : String
//  var home_team_score : Int
//  var home_team_name : String
//  var game_time : Int
//  var visit_team_name : String
//  var visit_team_logo : String
//  var visit_team_score : Int
//  var visit_team_city : String
//  var home_team_logo : String
