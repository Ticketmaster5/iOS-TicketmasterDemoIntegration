//
//  DiscoveryHelper.swift
//  TMSDKDemoIntegration
//
//  Created by Jonathan Backer on 7/5/23.
//

import Foundation
import TicketmasterDiscoveryAPI // for DiscoveryService and TMDiscoveryAPI

/// a class to wrap helpful methods
class DiscoveryHelper: NSObject {

    private(set) var discoveryService: DiscoveryService?
    
    func configure(configuration: Configuration, completion: @escaping (_ success: Bool) -> Void) {
        guard configuration.apiKey != "<your apiKey>" else {
            fatalError("Set your apiKey in Configuration.swift")
        }
        
        // PrePurchase does NOT use TicketmasterAuthentication,
        //  so no need to configure TicketmasterAuthentication first

        print("DiscoveryAPI Configuring...")
        
        TMDiscoveryAPI.shared.apiKey = configuration.apiKey
        TMDiscoveryAPI.shared.marketDomain = configuration.retailMarketDomain
        
        discoveryService = TMDiscoveryAPI.shared.discoveryService
        
        print(" - DiscoveryAPI Configured")

        completion(true)
    }
        
    enum DetailsIdentifierType: String, CaseIterable {
        case discovery
        case legacyHost
        
        var keyName: String {
            switch self {
            case .discovery:
                return "Discovery"
            case .legacyHost:
                return "Legacy Host"
            }
        }
    }
}
