

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm: LoginViewModel
 //   @ObservedObject var vm1: LoginFormViewModel
    private let bgColor = Color(red: 246/255, green: 246/255, blue: 246/255)
    private let fontStyle = Font.custom("Helvetica-Light", size: 16.0)
    
    init(vm: LoginViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack {
                    HStack {
                        
                        
                        //textFldEmail.rx.text.map {$0 ?? ""}.bind(to: loginViewModel.email)
                        TextField("Email", text: $vm.email)
                            .multilineTextAlignment(.center)
                            .padding(.all)
                            .background(Color.white)
                            .cornerRadius(0.0)
                    }                            .clipShape(Rectangle())
                        .overlay(Rectangle()
                            .stroke(Color(vm.txtFieldEmailColor), lineWidth: 1))
                    
                    HStack {
                        TextField("Password", text: $vm.password)
                            .multilineTextAlignment(.center)
                            .padding(.all)
                            .background(Color.white)
                            .cornerRadius(0.0)
                    }
                    .clipShape(Rectangle())
                    .overlay(Rectangle()
                    .stroke(Color(vm.txtFieldPasswordColor), lineWidth: 1))
                    
                    
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Login")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(Color(vm.titleColor))
                    }
                    .navigationBarTitle("Login")
                    .padding(.all)
                    .background(Color(vm.btnColor))
                    .disabled(!vm.isValid)
                    .cornerRadius(0.0)
                    .navigationBarHidden(true)
                }
                    //.background(Color.red)
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 2, trailing: 25))
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Email: atif@email.com")
                            .font(fontStyle)
                            .padding(.all, 2)
                            .foregroundColor(Color.blue)
                            .background(bgColor)
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(bgColor)
                    
                    HStack {
                        Text("Password: aTiF@123")
                            .padding(.all, 2)
                            .font(fontStyle)
                            .foregroundColor(Color.blue)
                            .background(bgColor)
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(bgColor)
                    
                    Text("name@domain.com and minimum 8 characters at least 1 uppercase alphabet, 1 lowercase alphabet, 1 number and 1 special character")
                        .font(fontStyle)
                        .padding(.all, 2)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .background(bgColor)
                    
                }
                    //.background(Color.green)
                    .padding(EdgeInsets(top: 30, leading: 25, bottom: 2, trailing: 25))
                
                Spacer()
                
            }
            .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
            //.background(Color.blue)
        }
        
    }
    }


private extension LoginView {
  
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LoginViewModel()
        let loginView = LoginView(vm: vm)
        return loginView
    }
}


