//
//  ForecastViewController.swift
//  Clima
//
//  Created by Ant Milner on 09/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{


    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "locationMenuButton"
        {
            let destinationVC = segue.destination as! ChangeCityViewController
        }
        else if segue.identifier == "homeButtonPressed"
        {
            let destinationVC = segue.destination as! WeatherViewController
        }
    }

}
