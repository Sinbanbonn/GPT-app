//
//  ViewController.swift
//  ChatGPT
//
//  Created by Андрей Логвинов on 4/6/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
       

        let url = "https://api.openai.com/v1/engines/davinci/completions"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer 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"
        ]
        let parameters: Parameters = [
            "prompt": "Ilon Mask",
            "max_tokens": 2000,
            "temperature": 0.7
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseData { response in
                if let responceData = response.data {
                    //let json = try? JSON(responceData)
                    print(self.parseJson(gptData: responceData))
                }
        }
    }
    
    func parseJson(gptData: Data)->String{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(GPTData.self, from: gptData )
            let text = decodedData.choices[0].text
            return text
            
        }
        catch{
            print(error)
            return "error"
        }
    }
    
}

