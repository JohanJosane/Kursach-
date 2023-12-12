using DTP.Model;
using DTP.ViewWindow;
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

namespace DTP
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer = new DispatcherTimer();
        string code;
        public MainWindow()
        {
            InitializeComponent();

        }

        public static class Globals
        {
            public static int userrole;
            public static ClientProgram userinfo { get; set; }
        }

        private void gencode()
        {
            code = null;
            Random random = new Random();
            string[] massiveCharacters = new string[] { "2", "6", "7", "8", "a", "y", "e" };
            for (int i = 0; i < 3; i++)
            {
                code += massiveCharacters[random.Next(0, massiveCharacters.Length)];
            }
            textBoxCodSpawn.Text = code;
            timer.Interval = TimeSpan.FromSeconds(10);
            timer.Tick += Timer_Tick;
            timer.Start();

            textBoxCod.IsEnabled = true;
            Vhod.IsEnabled = true;
            Cod.IsEnabled = true;
            Cod.Visibility = Visibility.Visible;
        }

        void Timer_Tick(object sender, EventArgs e)
        {
            code = null;
            MessageBox.Show("Закончилось время ожидания. Повторите попытку");
            timer.Stop();
        }

        private void LogBlock_Up(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                using (var db = new CopsBaseEntities())
                {
                    var ShifrLog = ShifrCode.ShifrPass(textBoxLogin.Text);
                    var login = AppData.db.ClientProgram.FirstOrDefault(l => l.Login == ShifrLog.Trim());
                    if (login == null)
                    {
                        MessageBox.Show("Неверный логин");
                    }
                    else
                    {
                        textBoxPassword.IsEnabled = true;
                        textBoxLogin.IsEnabled = false;
                        textBoxPassword.Focus();
                    }
                }
            }
        }

        private void PassBlock_Up(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                using (var db = new CopsBaseEntities())
                {
                    var ShifrLog = ShifrCode.ShifrPass(textBoxLogin.Text);
                    var ShifrPass = ShifrCode.ShifrPass(textBoxPassword.Password);
                    var login = AppData.db.ClientProgram.FirstOrDefault(l => l.Login == ShifrLog && l.Password == ShifrPass.Trim());
                    if (login == null)
                    {
                        MessageBox.Show("Неверный пароль");
                    }
                    else
                    {
                        textBoxPassword.IsEnabled = false;
                        gencode();
                        Cod.Focus();
                    }
                }
            }
        }

        private void Vhod_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new CopsBaseEntities())
            {
                var ShifrLog = ShifrCode.ShifrPass(textBoxLogin.Text);
                var ShifrPass = ShifrCode.ShifrPass(textBoxPassword.Password);
                var auth = AppData.db.ClientProgram.FirstOrDefault(m => m.Login == ShifrLog && m.Password == ShifrPass);
                if (auth != null & code == textBoxCod.Text)
                {
                    if (MainWindow.Globals.userrole == 0)
                    {
                        MessageBox.Show("Вы вошли под администратором");
                        timer.Stop();
                        Globals.userrole = auth.RoleId;
                        Globals.userinfo = auth;
                        Main Mwin = new Main();
                        Mwin.Show();
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Вы вошли как пользователь");
                        timer.Stop();
                        Globals.userrole = auth.RoleId;
                        Globals.userinfo = auth;
                        Main Mwin = new Main();
                        Mwin.Show();
                        Close();
                    }
                }
                else
                {
                    MessageBox.Show("Неверно написан код, повторите снова!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    timer.Stop();
                }
            }
        }

        private void Cod_Click(object sender, RoutedEventArgs e)
        {
            timer.Stop();
            gencode();
            Cod.Focus();
        }

        private void Otmena_Click(object sender, RoutedEventArgs e)
        {
            textBoxLogin.Clear();
            textBoxPassword.Clear();
            textBoxCod.Clear();
            textBoxLogin.IsEnabled = true;
            textBoxPassword.IsEnabled = false;
            textBoxLogin.Focus();
        }
    }
}
