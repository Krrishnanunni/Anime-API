//
//  HomeAnimeVC.swift
//  Anime-API
//
//  Created by iroid on 19/06/25.
//

import UIKit

class HomeAnimeVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AnimeTableViewCell
        cell.titleEng.text = "CowBoy beepop"
        cell.animeCoverimage.image = UIImage(named: "cowboy")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


 
    @IBOutlet weak var myTbaleView: UITableView!
    var jsondata = NSDictionary()
    var animeDict = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlstring = URL(string: "https://api.jikan.moe/v4/anime?type=movie")
        let URLreq = URLRequest(url: urlstring!)
        let task = URLSession.shared .dataTask(with: URLreq){
            (data,error,request)in
            if let mydata = data {
                print("my data -------->",mydata)
                
                do{
                    self .jsondata = try
                    JSONSerialization.jsonObject(with: mydata , options: []) as! NSDictionary
                    do{
                        DispatchQueue.main.async {
                            self.myTbaleView.reloadData()
                            
                            self.animeDict = self.jsondata["data"] as! NSArray
                            print("Data-------------->",self.animeDict)
                            
                            
                        }
                    }
                }catch{
                    print("errorr -->" ,error.localizedDescription)
                }
            }
        }
        task.resume()
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
