using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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

namespace WpfDataGridSQLExample
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            using (var dbContext = new AdventureWorks2022Entities())
            {
                // it will use delegate to log SQL to Output/Debug window
                dbContext.Database.Log = sql => System.Diagnostics.Debug.WriteLine(sql); 

                var query =
                    from product in dbContext.Products
                    where product.Color == "Red"
                    orderby product.ListPrice
                    select new { 
                          product.Name
                        , product.Color
                        , SubCategoryName = product.ProductSubcategory.Name
                        , CategoryName = product.ProductSubcategory.ProductCategory.Name
                        , product.ListPrice };

                dataGrid1.ItemsSource = query.ToList();
            }



        }
    }
}
