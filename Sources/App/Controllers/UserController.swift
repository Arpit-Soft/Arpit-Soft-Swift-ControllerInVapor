//
//  File.swift
//  
//
//  Created by Arpit Dixit on 07/09/21.
//

import Foundation
import Vapor

struct UserController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        // /users
        let users = routes.grouped("users")
        
        // /users GET
        users.get(use: index)
        
        // /users POST
        users.post(use: create)
        
        // /users/23
        users.group(":userId") { user in
            user.get(use: show)
        }
    }

    func index(req: Request) throws -> String {
        return "INDEX"
    }
    
    func create(req: Request) throws -> String {
        return "CREATE"
    }
    
    func show(req: Request) throws -> String {
        guard let userId = req.parameters.get("userId") else { throw Abort(.badRequest) }
        return "User ID - \(userId)"
    }
}
