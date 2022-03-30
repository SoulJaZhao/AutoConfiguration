// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

struct Configuration {    
    static let FRAUDFORCE_API_KEY : String = "fdYb4NnDcO5n6LhFomIkkZFLUux3206bxcbUnRSR14A"
    static let RECAPTCHA_SITE_KEY : String = "6LdtnTYcAAAAAG14y1eWqH_KFVSQClL9nyqjRDRc"
    static let UJET_COMPANY_KEY : String = "1579036854857411d57d64188b22f450"
    static let UJET_MENU_KEY : String = "gobank_rewards_authenticated"
    static let UJET_SUBDOMAIN : String = "gdqa"

    struct Location {
        let devint1 = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
        let pie = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
        let production = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
        let qa = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
        let qa3 = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
        let qa4 = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
        let qa5 = "https://secure.go2bank.com/enroll/acquisition/get-started?fl=HighHurdle"
    }
    static let location = Configuration.Location.init()

}
