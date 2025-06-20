//
//  animeDetailedVC.swift
//  Anime-API
//
//  Created by Krishnanunni K A on 19/06/2025.
//

import UIKit

class animeDetailedVC: UIViewController {

    @IBOutlet weak var durationInMin    : UILabel!
    @IBOutlet weak var scoreInPoint     : UILabel!
    @IBOutlet weak var airingStatus     : UILabel!
    @IBOutlet weak var airedOn          : UILabel!
    @IBOutlet weak var synopsis         : UITextView!
    @IBOutlet weak var coverImage       : UIImageView!
    
   var durationInMinString  = ""
   var scoreInPointString   = ""
   var airingStatusString   = ""
   var airedOnString        = ""
   var synopsisString       = ""
   var coverImageString     = ""
    var titleString     = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = titleString
        durationInMin.text = durationInMinString
        scoreInPoint.text = scoreInPointString
        airingStatus.text = airingStatusString
        airedOn.text = airedOnString
        synopsis.text = synopsisString
        
        coverImage.layer.cornerRadius = 10
        let urlstring = coverImageString
        
        let urlimg = URL(string: urlstring)
        let dataimg = try? Data(contentsOf: urlimg!)
        coverImage.image = UIImage(data: dataimg!)
        coverImage.layer.cornerRadius = 10
        
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
