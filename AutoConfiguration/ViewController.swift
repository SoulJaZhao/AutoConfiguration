//
//  ViewController.swift
//  AutoConfiguration
//
//  Created by Long Zhao on 2022/3/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dumpConfiguration()
    }
    
    private func dumpConfiguration() {
        let config =
        """
        ==> Start <==
        FRAUDFORCE_API_KEY = \(Configuration.FRAUDFORCE_API_KEY)
        RECAPTCHA_SITE_KEY = \(Configuration.RECAPTCHA_SITE_KEY)
        UJET_COMPANY_KEY = \(Configuration.UJET_COMPANY_KEY)
        UJET_MENU_KEY = \(Configuration.UJET_MENU_KEY)
        UJET_SUBDOMAIN = \(Configuration.UJET_SUBDOMAIN)
        devint1 = \(Configuration.location.devint1)
        pie = \(Configuration.location.pie)
        production = \(Configuration.location.pie)
        qa = \(Configuration.location.pie)
        qa3 = \(Configuration.location.pie)
        qa4 = \(Configuration.location.pie)
        qa5 = \(Configuration.location.pie)
        ==> End <==
        """
        print(config)
    }
}

