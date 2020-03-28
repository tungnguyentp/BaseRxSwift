//
//  CavanseeService.swift
//
//
//  Created by Mac on 1/16/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import Alamofire
import Moya

enum BeberiaService{
    // user
    case login(param: Parameters)
    case loginSocial(param:Parameters)
    case registerSocial(param:Parameters)
    case updateInfo(param:Parameters)
    case checkName(param:Parameters)
    case checkPhone(param:Parameters)
    case register(param:Parameters)
    // profile
    case getFeedbyUser(param:Parameters)
    case updateInfoProfile(param:Parameters)
    case editBabyProfile(param:Parameters)
    case addBabyProfile(param:Parameters)
    case changePassWord(param:Parameters)
    case changeAvatar(param:Parameters)
    case listFavorite(param:Parameters)
    case logout(param:Parameters)
    case deleteBaby(param:Parameters)
    // home
    case getHomeFeed(param:Parameters)
    case createFeed(param:Parameters)
    case getSearchHome(param:Parameters)
    case likeHomeFeed(param:Parameters)
    case saveHomeFeed(param:Parameters)
    case checkCompletedFeed(param:Parameters)
    case getCommentFeed(param:Parameters)
    case editCommentFeed(param:Parameters)
    case detailFeed(param:Parameters)
    case sendCommentHomeFeed(param:Parameters)
    case deleteCommentHomeFeed(param:Parameters)
    case getNoti(param:Parameters)
    case deleteAndCancelFeed(param:Parameters)
    case editFeed(param:Parameters)
    case readNotification(param:Parameters)
    case turnOnOffNotification(param:Parameters)
    // imfomation
    case getCategoryShow(param: Parameters)
    case getCategory(param: Parameters)
    case getPostDetail(param: Parameters)
    case likePost(param: Parameters)
    case favouritePost(param: Parameters)
    case getComment(param: Parameters)
    case getCommentReply(param: Parameters)
    case sendComment(param: Parameters)
    case deleteComment(param: Parameters)
    case editComment(param: Parameters)
    case getDetailMore(param:Parameters)

    // getLocation
    case getLocation(param:Parameters)
    case getDistrict(param:Parameters)
    // Diary
    case getDate(param:Parameters)
    case getBanner(param:Parameters)
    case gethomeDiary(param:Parameters)
    case getlistDiary(param:Parameters)
    case createDiary(param:Parameters)
    case checkCreateDiary(param:Parameters)
    case detailDiary(param:Parameters)
    case getSearchDiary(param:Parameters)
    case deleteDiary(param:Parameters)
    case editDiary(param:Parameters)
    case settingNoti(param:Parameters)
    

    //MARK: Secret
    case getSecretHome(param:Parameters)
    case createPassSecret(param:Parameters)
    case getNotiSecret(param:Parameters)
    
}

extension BeberiaService: TargetType{

    var baseURL: URL {
       // return URL(string: "http://bebegateway.test:8080/")!
//        return URL(string: "http://192.168.1.45:9090/bebegateway/public/")!
       // return URL(string: "http://192.168.1.52:8080/")!
        return URL(string: "https://api.beberia.me/")!

//        return URL(string: "http://api.spacev.monster/")!

    }
    
    var path: String {
        switch self {
        // user
        case .login:
            return "/api/v1/auth/login"
        case .logout:
            return "/api/v1/logout"
        case .loginSocial:
            return "/api/v1/auth/loginSocial"
        case.registerSocial:
             return "/api/v1/auth/registerSocial"
        case.register:
            return "/api/v1/auth/register"
        case.checkName:
            return "/api/v1/auth/checkName"
        case.checkPhone:
            return "/api/v1/auth/checkPhone"
            // imfomation
        case .getCategoryShow:
            return "/api/v1/categories/show"
        case .getCategory:
            return "/api/v1/categories/list"
        case .getPostDetail:
            return "/api/v1/posts/detail"
        case .likePost:
            return "/api/v1/likes"
        case .favouritePost:
            return "/api/v1/posts/favourite"
        case .getComment:
            return "/api/v1/comments/list"
        case .getCommentReply:
            return "/api/v1/comments/reply"
        case .sendComment:
            return "/api/v1/comments"
        case .deleteComment:
            return "/api/v1/comments/delete"
        case .editComment:
            return "/api/v1/comments/update"
        case .getDetailMore:
            return "/api/v1/posts/list"
        case .updateInfo:
            return "/api/v1/auth/updateInfo"
            
            // Home
        case .getHomeFeed:
            return "/api/v1/feed/home"
        case .createFeed:
            return "/api/v1/feed/create"
        case .getSearchHome:
            return "/api/v1/search/feed"
        case .likeHomeFeed:
            return "/api/v1/feed/like"
        case .saveHomeFeed:
            return "/api/v1/feed/save"
        case .checkCompletedFeed:
            return "/api/v1/feed/checkCompleted"
        case .getCommentFeed:
            return "/api/v1/comment/get"
        case .editCommentFeed:
            return "/api/v1/comment/edit"
        case .detailFeed:
            return "/api/v1/feed/detailFeed"
        case .sendCommentHomeFeed:
            return "api/v1/feed/comment"
        case .deleteCommentHomeFeed:
            return "api/v1/comment/delete"
        case .getNoti:
            return "/api/v1/notification/get"
        case .deleteAndCancelFeed:
            return "/api/v1/feed/cancel"
        case .editFeed:
            return "/api/v1/feed/edit"
        case .readNotification:
            return "/api/v1/notification/read"
        case .turnOnOffNotification:
            return "/api/v1/feed/settingNoti"
            
            
        // getLocation
        case .getLocation:
            return "/api/v1/location/get"
        case .getDistrict:
            return "/api/v1/location/district"
            
        // Profile
        case .getFeedbyUser:
            return "/api/v1/user/listFeed"
        case .updateInfoProfile:
            return "/api/v1/user/editProfile"
        case .editBabyProfile:
            return "/api/v1/user/editBaby"
        case .addBabyProfile:
            return "/api/v1/user/addBaby"
        case .changePassWord:
            return "/api/v1/user/changePass"
        case .changeAvatar:
            return "/api/v1/user/changeAvatar"
        case .listFavorite:
            return "/api/v1/posts/favourite/list"
        case .deleteBaby:
            return "/api/v1/user/delBaby"
            
        // Diary
        case .getDate :
            return "/api/v1/diaries/date"
        case .getBanner :
            return "/api/v1/banners"
        case.gethomeDiary :
            return "/api/v1/diaries/home"
        case.getlistDiary :
            return "/api/v1/diaries/list"
        case .createDiary :
            return "/api/v1/diaries/create"
        case .checkCreateDiary :
            return "/api/v1/diaries/check"
        case .detailDiary :
            return "/api/v1/diaries/detail"
        case .getSearchDiary:
            return "/api/v1/search/diary"
        case .deleteDiary:
            return "/api/v1/diaries/delete"
        case .editDiary:
            return "/api/v1/diaries/update"
        case .settingNoti:
            return "/api/v1/posts/settingNotify"

        //MARK: Secret
        case .getSecretHome:
            return "/api/v1/search/feed"
        case .createPassSecret:
            return "/api/v1/user/createPassSecret"
        case .getNotiSecret:
            return "api/v1/notification/getNotiSecret"
        
        }
    }


var method: Moya.Method {
        switch self {
        default :
            return .post
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .login(param: let parameters):
            return parameters
        case .logout(param: let parameters):
            return parameters
        case .loginSocial(param: let parameters):
            return parameters
        case .register(param: let parameters):
            return parameters
        case .registerSocial(param: let parameters):
            return parameters
        case .checkName(param: let parameters):
            return parameters
        case .checkPhone(param: let parameters):
            return parameters
        case .getCategory(param: let parameters):
            return parameters
        case .getPostDetail(param: let parameters):
            return parameters
        case .likePost(param: let parameters):
            return parameters
        case .favouritePost(param: let parameters):
            return parameters
        case .getComment(param: let parameters):
            return parameters
        case .getCommentReply(param: let parameters):
            return parameters
        case .sendComment(param: let parameters):
            return parameters
        case .deleteComment(param: let parameters):
            return parameters
        case .editComment(param: let parameters):
            return parameters
        case .getDetailMore(param: let parameters):
            return parameters
        case .getCategoryShow(param: let parameters):
            return parameters
        case .updateInfo(param: let parameters):
            return parameters
        case .getHomeFeed(param: let parameters):
            return parameters
        case .getLocation(param: let parameters):
            return parameters
        case .createFeed(param: let parameters):
            return parameters
        case .getDate(param: let parameters):
            return parameters
        case .getBanner(param: let parameters):
            return parameters
        case .getSearchHome(param: let parameters):
            return parameters
        case .likeHomeFeed(param: let parameters):
            return parameters
        case .saveHomeFeed(param: let parameters):
            return parameters
        case .gethomeDiary(param: let parameters):
            return parameters
        case .getlistDiary(param: let parameters):
            return parameters
        case .checkCompletedFeed(param: let parameters):
            return parameters
        case .getCommentFeed(param: let parameters):
            return parameters
        case .editCommentFeed(param: let parameters):
            return parameters
        case .detailFeed(param: let parameters):
            return parameters
        case .sendCommentHomeFeed(param: let parameters):
            return parameters
        case .deleteCommentHomeFeed(param: let parameters):
            return parameters
        case .createDiary(param: let parameters):
            return parameters
        case .checkCreateDiary(param: let parameters):
            return parameters
        case .getFeedbyUser(param: let parameters):
            return parameters
        case .updateInfoProfile(param: let parameters):
            return parameters
        case .editBabyProfile(param: let parameters):
            return parameters
        case .addBabyProfile(param: let parameters):
            return parameters
        case .changePassWord(param: let parameters):
            return parameters
        case .changeAvatar(param: let parameters):
            return parameters
        case .getNoti(param: let parameters):
            return parameters
        case .detailDiary(param: let parameters):
            return parameters
        case .deleteAndCancelFeed(param: let parameters):
            return parameters
        case .editFeed(param: let parameters):
            return parameters
        case .listFavorite(param: let parameters):
            return parameters
        case .getSearchDiary(param: let parameters):
            return parameters
        case .deleteDiary(param: let parameters):
            return parameters
        case .editDiary(param: let parameters):
            return parameters
        case .readNotification(param: let parameters):
            return parameters
        case .turnOnOffNotification(param: let parameters):
            return parameters
        case .settingNoti(param: let parameters):
            return parameters
        case .getDistrict(param: let parameters):
            return parameters
        case .getSecretHome(param: let parameters):
            return parameters
        case .createPassSecret(param: let parameters):
            return parameters
        case .getNotiSecret(param: let parameters):
            return parameters
        case .deleteBaby(param: let parameters):
            return parameters
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case  .login(param: _):
            return ["Content-Type": "application/json"]
            
        default :
            return ["Content-Type": "application/json"]
         //   print(UserInfo.shareUserInfo.token)
         //   return ["Content-Type": "application/json", "Authorization": "Bearer \(UserInfo.shareUserInfo.token)"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .login(param: _):
            return JSONEncoding.default
        default :
            return JSONEncoding.default
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
