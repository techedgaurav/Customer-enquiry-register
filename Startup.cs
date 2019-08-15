using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Customer_Enquiry.Startup))]
namespace Customer_Enquiry
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
