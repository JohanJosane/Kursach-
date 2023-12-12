using DTP.Model;
using DTP.ViewEditAndAdd;
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

namespace DTP.ViewWindow
{
    /// <summary>
    /// Логика взаимодействия для OwnerPage.xaml
    /// </summary>
    public partial class OwnerPage : Page
    {
        public OwnerPage()
        {
            InitializeComponent();
            if (MainWindow.Globals.userrole == 1)
            {
                Delete.Visibility = Visibility.Visible;
            }
            else
            {
                Delete.Visibility = Visibility.Collapsed;
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                CopsBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                OwnerGP.ItemsSource = CopsBaseEntities.GetContext().Owner.ToList();
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            WindowEditOwner WEG = new WindowEditOwner((sender as Button).DataContext as Owner);
            WEG.Show();
        }

        private void EditDrivers_Click(object sender, RoutedEventArgs e)
        {
            WindowEditOwner WEG = new WindowEditOwner(null);
            WEG.Show();
        }

        private void PTS_Click(object sender, RoutedEventArgs e)
        {
            Manager.Frame1.Navigate(new PSTPage());
        }

        private void DeleteDrivers_Click(object sender, RoutedEventArgs e)
        {
            var DriverForRemoving = OwnerGP.SelectedItems.Cast<Owner>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {DriverForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    CopsBaseEntities.GetContext().Owner.RemoveRange(DriverForRemoving);
                    CopsBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    OwnerGP.ItemsSource = CopsBaseEntities.GetContext().Owner.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
