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
    var leagues: [AnyObject]?//from leagues.swift class
    var games: [AnyObject]?//from gamesFinder.swift class
    var leagueIndex: Int?//get the index of league selected
    var weekIndex: Int?//get the index of week
    var sportsWeek:String?//get name of sports week file
    override func viewDidLoad() {
        super.viewDidLoad()

        print(weekIndex ?? 0)
        print(leagueIndex ?? 0)
        print(sportsWeek ?? 0)
        
        if let file=Bundle(for: AppDelegate.self).path(forResource: sportsWeek, ofType: "json"), let data=NSData(contentsOfFile: file) as Data?{
                          let jsonData=JSON(data: data)
                          self.parseJSON(json: jsonData)
                      }

    }
    


    //parse the json and save the types of leagues in leagues array
    func parseJSON(json:JSON){
//        games=[Games]()
        let leagueDataArray=json["leagues"].arrayValue
        self.games=leagueDataArray[leagueIndex ?? 0]["games"].array as [AnyObject]?
        print(self.games ?? 0)
        print(self.games?.count ?? 0)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return self.games?.count ?? 0
           }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           guard let gameInfo=games?[indexPath.row]else{
               return UITableViewCell()
           }

           let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

           // For a standard cell, use the UITableViewCell properties.
           cell.textLabel!.text = "test"
        cell.textLabel!.text = "test2"
//           cell.imageView!.image = UIImage(named: leagueInfo.leagueImage)
           return cell
       }
    
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
