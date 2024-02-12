using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Bocharova41
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        
        DispatcherTimer timer = new DispatcherTimer();
        public AuthPage()
        {
            InitializeComponent();
        }

        private void GuestLoginBtn_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new HeadPage(null));
            LoginTB.Text = "";
            PassTB.Text = "";
            timer.Stop();
            LoginBtn.IsEnabled = true;
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTB.Text;
            string password = PassTB.Text;
            if (login == "" || password == "")
            {
                MessageBox.Show("Введите данные");
                return;
            }

            User user = Bocharova41Entities.GetContext().User.ToList().Find(p => p.UserLogin == login && p.UserPassword == password);

            if (user != null)
            {
                Manager.MainFrame.Navigate(new HeadPage(user));
                LoginTB.Text = "";
                PassTB.Text = "";
            }
            
            else
            {
                
                MessageBox.Show("Введите верные данные!");
                LoginBtn.IsEnabled = false;
                
                timer.Interval = TimeSpan.FromSeconds(2);
                timer.Start();

                timer.Tick += (senderr, er) =>
                {
                    LoginBtn.IsEnabled = true;
                    timer.Stop();
                };

                
            }
            
        }
    }
}
