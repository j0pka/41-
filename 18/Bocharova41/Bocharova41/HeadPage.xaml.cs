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

namespace Bocharova41
{
    /// <summary>
    /// Логика взаимодействия для HeadPage.xaml
    /// </summary>
    public partial class HeadPage : Page
    {
        int CountRecords;
        int AllProductsAmount;
        public HeadPage()
        {
            InitializeComponent();
            var currentRazmer = Bocharova41Entities.GetContext().Product.ToList();
            RazmerListView.ItemsSource = currentRazmer;
            ComboType.SelectedIndex = 0;
            UpdateProduct();

        }
         private void UpdateProduct()
        {
            var currentRazmer = Bocharova41Entities.GetContext().Product.ToList();
            if (ComboType.SelectedIndex == 0)
            {
                currentRazmer = currentRazmer.Where(p => Convert.ToInt32(p.ProductDiscountAmount) >= 0 && Convert.ToInt32(p.ProductDiscountAmount) <= 100).ToList();
            }

            if (ComboType.SelectedIndex == 1)
            {
                currentRazmer = currentRazmer.Where(p => Convert.ToInt32(p.ProductDiscountAmount) >= 0 && Convert.ToInt32(p.ProductDiscountAmount) < 10).ToList();
            }

            if (ComboType.SelectedIndex == 2)
            {
                currentRazmer = currentRazmer.Where(p => Convert.ToInt32(p.ProductDiscountAmount) >= 10 && Convert.ToInt32(p.ProductDiscountAmount) < 15).ToList();
            }

            if (ComboType.SelectedIndex == 3)
            {
                currentRazmer = currentRazmer.Where(p => Convert.ToInt32(p.ProductDiscountAmount) >= 15 && Convert.ToInt32(p.ProductDiscountAmount) <= 100).ToList();
            }

            currentRazmer = currentRazmer.Where(p => p.ProductName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            RazmerListView.ItemsSource = currentRazmer;
            CountRecords = currentRazmer.Count();

            if (RButtonDown.IsChecked.Value)
            {
                RazmerListView.ItemsSource = currentRazmer.OrderByDescending(p => p.ProductCost);
                CountRecords = currentRazmer.OrderByDescending(p => p.ProductCost).Count();
            }

            if (RButtinUp.IsChecked.Value)
            {
                RazmerListView.ItemsSource = currentRazmer.OrderBy(p => p.ProductCost);
                CountRecords = currentRazmer.OrderBy(p => p.ProductCost).Count();
            }

            AllProductsAmount = Bocharova41Entities.GetContext().Product.ToList().Count();

            ProductsAmount.Text = AllProductsAmount.ToString();
            ProductsCount.Text = CountRecords.ToString();
        }

        
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            
        }//удалить

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPage());
        }

        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateProduct();
        }

        private void RButtinUp_Checked(object sender, RoutedEventArgs e)
        {
            UpdateProduct();
        }

        private void RButtonDown_Checked(object sender, RoutedEventArgs e)
        {
            UpdateProduct();
        }

        private void ComboType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateProduct();
        }
    }
}
