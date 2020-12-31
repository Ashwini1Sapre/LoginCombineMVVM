//


import SwiftUI

struct HomeView: View {
    var body: some View {
      //  navigationBarTitle("Home")
        
        NavigationView{
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.blue)
            .font(Font.custom("Helvetica-Light", size: 50.0))
            .padding()
            
    }
        .navigationBarTitle("Home")
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
