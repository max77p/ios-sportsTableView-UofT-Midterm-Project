//
//  gamesTableViewController.swift
//  sportsTableViewApp
//
//  Created by Shan Indrakumar on 2019-11-04.
//  Copyright © 2019 CS2680. All rights reserved.
//

import UIKit

class gamesTableViewController: UITableViewController {
    weak var gameTableView: leagueDetailTableViewController?
    var allgames: JSON?//from gamesFinder.swift class
    
    var games: [Games]?//
    var leagueIndex: Int?//get the index of league selected
    var weekIndex: Int?//get the index of week
    var sportsWeek:String?//get name of sports week file
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(weekIndex ?? 0)
        print(leagueIndex ?? 0)
        print(sportsWeek ?? 0)
        games=[Games]()
        //        let gameName:String
        //        let gameImage:String
        for (key,value) in allgames?[leagueIndex ?? 0] ?? 0{
            //                        print(key)
            //                        print(key)
            
            if(key=="games"){
                for el in value.arrayValue{
                    //                    print(el)
                    self.games?.append(Games(data:el,name:"Hockey",image:"hockey"))
                }
                
            }
            //
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as? gamesTableViewCell, let gamesData = self.games?[indexPath.row] {
            cell.setGame(homeTeam: gamesData)
            return cell
        }
        return UITableViewCell()
        
        
        
    }
    
    
    //        if let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as? gamesTableViewCell, let gameInfo = games?[indexPath.row]{
    //            cell.setGame(homeTeam: [gameInfo])
    //             return cell
    //                   }
    ////        cell.setGame(homeTeam: games![indexPath.row] as! [AnyObject])
    //         return UITableViewCell()
    //
    //       }
    
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
