
import Foundation

class Games{
    var leagueName: String
    var leagueImage: String
    
    init(data:JSON){
        
        leagueName=data["name"].stringValue
        leagueImage=data["image"].stringValue
        
    }
}
