//
//  ViewController.swift
//  Weathr_App
//
//  Created by Dennis on 06-03-18.
//  Copyright © 2018 Dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=s-Hertogenbosch&appid=3b7c0bb2df5778f696d6dfc53b6189c9")!
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                
                let main = json["main"] as! [String: Any]
                let kelvin_temparature = main["temp"] as! Double
                let celcius = kelvin_temparature - 272.15
                
                DispatchQueue.main.async {
                    self.lblTemp.text = "\(String(format: "%.if", celcius))"
                }
            } catch {
                
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

