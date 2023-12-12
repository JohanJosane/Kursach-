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
    /// Логика взаимодействия для PSTPage.xaml
    /// </summary>
    public partial class PSTPage : Page
    {
        public PSTPage()
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

        private void EditPTS_Click(object sender, RoutedEventArgs e)
        {
            WindowEditPTS WEP = new WindowEditPTS(null); ;
            WEP.Show();
        }

        private void DeletePTS_Click(object sender, RoutedEventArgs e)
        {
            var PTSForRemoving = PTSP.SelectedItems.Cast<PTS>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {PTSForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    CopsBaseEntities.GetContext().PTS.RemoveRange(PTSForRemoving);
                    CopsBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    PTSP.ItemsSource = CopsBaseEntities.GetContext().PTS.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                CopsBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                PTSP.ItemsSource = CopsBaseEntities.GetContext().PTS.ToList();
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            WindowEditPTS WEG = new WindowEditPTS((sender as Button).DataContext as PTS);
            WEG.Show();
        }
    }
}
