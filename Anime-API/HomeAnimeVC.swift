//
//  HomeAnimeVC.swift
//  Anime-API
//
//  Created by iroid on 19/06/25.
//

import UIKit

class HomeAnimeVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("inside numberOfRow-------->",animeDict.count)
        return animeDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AnimeTableViewCell
        
        cell.titleEng.text = "CowBoy beepop"
        cell.animeCoverimage.image = UIImage(named: "cowboy")
//
        let dict = self.animeDict[indexPath.row] as! NSDictionary
        let images = dict["images"] as! NSDictionary
        let jpg = images["jpg"] as! NSDictionary
        let titleEng = dict["title_english"] as? String
        let animeStatus = dict["status"] as? String
        let TvRatin = dict["rating"] as? String
        
        cell.titleEng.text = titleEng
        cell.animeStatus.text = animeStatus
        cell.animeCoverimage.layer.cornerRadius = 10
        cell.AnimeTvRating.text = TvRatin

//        let coverImageUrl = jpg["large_image_url"] as! NSDictionary
        let urlstring = String(describing: jpg["large_image_url"]!)
        let urlimg = URL(string: urlstring)
        let dataimg = try? Data(contentsOf: urlimg!)
        cell.animeCoverimage.image = UIImage(data: dataimg!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }


 
    @IBOutlet weak var myTbaleView: UITableView!
    var jsondata = NSDictionary()
    var actualData = NSDictionary()
    var animeDict = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Animes"
        
        
        
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

                            print("Data-------------->",self.jsondata.count)
                            print("animeDict",self.animeDict.count)
                            self.myTbaleView.reloadData()
                            
                            
                            
                            
                            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let DetailedVC = sb.instantiateViewController(withIdentifier: "animeDetailedVC") as! animeDetailedVC
        
        let dict        = self.animeDict[indexPath.row] as! NSDictionary
        let score       = dict["score"] as! Double
        let airedDict     = dict["aired"] as? NSDictionary
        let airedOn = airedDict!["string"] as? String
        
        let duration    = dict["duration"] as? String
        let synopsis    = dict["synopsis"] as? String
        let title       = dict["title_english"] as? String
        let airStatus   = dict["status"] as? String
        
        let images      = dict["images"] as! NSDictionary
        let jpg         = images["jpg"] as! NSDictionary
        
        let urlstring = String(describing: jpg["large_image_url"]!)

        
        DetailedVC.airedOnString            = airedOn!
        DetailedVC.scoreInPointString       = String(score)
        DetailedVC.synopsisString           = synopsis!
        DetailedVC.airingStatusString       = airStatus!
        DetailedVC.durationInMinString      = duration!
        DetailedVC.titleString              = title!
        
        DetailedVC.coverImageString         = urlstring
        
        navigationController?.pushViewController(DetailedVC, animated: true)
        
        
        
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
