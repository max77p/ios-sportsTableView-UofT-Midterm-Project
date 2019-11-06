//
//  leagueDetailTableViewController.swift
//  sportsTableViewApp
//
//  Created by Shan Indrakumar on 2019-11-01.
//  Copyright © 2019 CS2680. All rights reserved.
//

import UIKit

class leagueDetailTableViewController: UITableViewController {
    weak var taskTableView: weekTableViewController?
    var tasks: [String]?
    var curIndex:Int?
    var leagues: [Leagues]?//from leagues.swift class
    var taskString: Int?
    var sportsWeekName:String?
    var passLeagueData:JSON?
    
    override func viewDidLoad() {
        if let file=Bundle(for: AppDelegate.self).path(forResource: getRow(rowid: taskString ?? 0), ofType: "json"), let data=NSData(contentsOfFile: file) as Data?{
            let jsonData=JSON(data: data)
            
            self.parseJSON(json: jsonData)
        }
        
    }
    
    //parse the json and save the types of leagues in leagues array
    func parseJSON(json:JSON){
        let leagueDataArray=json["leagues"].arrayValue
        passLeagueData=json["leagues"]
        
        //        self.passLeagueData=leagueDataArray
        leagues=[Leagues]()
        for leagueData in leagueDataArray{
            self.leagues?.append(Leagues(data: leagueData))
        }
    }
    
    //change the file name depending on week clicked
    func getRow(rowid:Int)->
        String{
            self.sportsWeekName="sports_week_\(rowid+1)"
            return "sports_week_\(rowid+1)"
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagues?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let leagueInfo=leagues?[indexPath.row]else{
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainCell", for: indexPath)
        
        // For a standard cell, use the UITableViewCell properties.
        cell.textLabel!.text = leagueInfo.leagueName
        cell.imageView!.image = UIImage(named: leagueInfo.leagueImage)
        return cell
    }
    
    //prepare to load the games section
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailView = segue.destination as? gamesTableViewController {
            
            detailView.gameTableView = self
            
            if let tableViewCell = sender as? UITableViewCell {
                
                if let index = tableView.indexPath(for: tableViewCell)?.row {
                    detailView.leagueIndex=index
                    detailView.weekIndex=taskString
                    detailView.sportsWeek=sportsWeekName
                    detailView.allgames=passLeagueData
                    
                }
            }
        }
    }
 
}
