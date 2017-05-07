import UIKit
import Firebase
import FBSDKLoginKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                // error handler
                return
            }
        }
        
        function()
    }
    
    var loginButton : FBSDKLoginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loginButton.center = self.view.center
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self;
        self.view.addSubview(loginButton)
        
    }
    
    func function(){
        let request : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/me/friendlists", parameters: ["fields": ""], httpMethod: "GET")
        
        request.start(completionHandler: {( connection, result, error) -> Void in
            if(error == nil){
                print(result)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: Error?) {
        print("User Logged In")
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        print("User did Logout")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }
    
    
    
}

