
import Foundation

class Games{
    var game_state : String
    var assignImage: String
    var assignLeagueName: String
    
    
    var home_team_city : String
    var home_team_score : Int
    var home_team_name : String
    var game_time : Int
    var visit_team_name : String
    var visit_team_logo : String
    var visit_team_score : Int
    var visit_team_city : String
    var home_team_logo : String
//    var dateString: String

    init(data:JSON,name:String,image:String){
        game_state="hu"
        assignImage=image
        assignLeagueName=name
//        let date = data["game_time"].intValue
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEE, MMM, dd"
//        self.dateString = formatter.string(from: date)
        home_team_city=data["home_team_city"].stringValue
        home_team_name=data["home_team_name"].stringValue
        home_team_logo=data["home_team_logo"].stringValue
        
        if data["game_time"].intValue > 0{
            game_time=data["game_time"].intValue
             home_team_score=data["home_team_score"].intValue
            visit_team_score=data["visit_team_name"].intValue
        }
        else{
            game_time=0
             home_team_score=0
            visit_team_score=0
        }
  
                
               
        visit_team_name=data["visit_team_name"].stringValue
        visit_team_logo=data["visit_team_logo"].stringValue
        visit_team_city=data["visit_team_city"].stringValue
    }
    
    
}
