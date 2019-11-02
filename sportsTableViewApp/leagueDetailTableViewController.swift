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
    
    override func viewDidLoad() {
        self.tasks=["Hockey", "Basketball", "Soccer", "Baseball"]
        if let file=Bundle(for: AppDelegate.self).path(forResource: getRow(rowid: taskString ?? 0), ofType: "json"), let data=NSData(contentsOfFile: file) as Data?{
                   let jsonData=JSON(data: data)
                   self.parseJSON(json: jsonData)
               }
        
    }
    
    //parse the json and save the types of leagues in leagues array
    func parseJSON(json:JSON){
         let leagueDataArray=json["leagues"].arrayValue
        leagues=[Leagues]()
        for leagueData in leagueDataArray{
            self.leagues?.append(Leagues(data: leagueData))
        }
    }
    
    //change the file name depending on week clicked
    func getRow(rowid:Int)->
    String{
        return "sports_week_\(rowid+1)"
    }
    
    
    
    

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            print(self.leagues?.count ?? 0)//5 items above
            return self.leagues?.count ?? 0
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let leagueInfo=leagues?[indexPath.row]else{
            return UITableViewCell()
        }
        print(leagueInfo.leagueName)
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainCell", for: indexPath)

        // For a standard cell, use the UITableViewCell properties.
        cell.textLabel!.text = leagueInfo.leagueName
        cell.imageView!.image = UIImage(named: leagueInfo.leagueImage)
        return cell
    }

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
