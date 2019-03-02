using System.Windows;
using GalaSoft.MvvmLight.Threading;

namespace NR2K3_Season_Manager
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        static App()
        {
            DispatcherHelper.Initialize();
        }
    }
}
