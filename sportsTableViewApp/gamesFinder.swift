
import Foundation

class Games{
    var game_state : String
    var assignImage: String
    var assignLeagueName: String
    
    
//    var home_team_city : String
    var home_team_score : String
    var home_team_name : String
    var game_time : String
    var visit_team_name : String
    var visit_team_logo : String
    var visit_team_score : String
//    var visit_team_city : String
    var home_team_logo : String


    init(data:JSON,name:String,image:String){

        assignImage=image
        assignLeagueName=name
        game_state=data["game_state"].stringValue

        home_team_name="\(data["home_team_city"].stringValue) \(data["game_state"].stringValue)"
        home_team_logo=data["home_team_logo"].stringValue
        
        if game_state == "Final"{
            game_time="None"
            home_team_score="\(data["home_team_score"].intValue)"
            visit_team_score="\(data["visit_team_name"].intValue)"
        }
        else{
            let date = NSDate(timeIntervalSince1970: data["game_time"].doubleValue)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle=DateFormatter.Style.short
             home_team_score="\(0)"
            visit_team_score="\(0)"
            let localTime = dateFormatter.string(from: date as Date)
            game_time=localTime
        }
  
                
               
        visit_team_name="\(data["visit_team_city"].stringValue) \(data["visit_team_name"].stringValue)"
        visit_team_logo=data["visit_team_logo"].stringValue
//        visit_team_city=data["visit_team_city"].stringValue
    }
    
    
}
