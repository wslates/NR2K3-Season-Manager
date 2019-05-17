using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.CommandWpf;
using NR2K3_Season_Manager.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NR2K3_Season_Manager.ViewModel
{
    public class LoadSeriesPageViewModel : ViewModelBase
    {
        private IFrameNavigationService _navigationService;
        private RelayCommand _newSeriesCommand;
        public RelayCommand NewSeriesCommand
        {
            get
            {
                return _newSeriesCommand
                    ?? (_newSeriesCommand = new RelayCommand(
                    () =>
                    {
                        _navigationService.NavigateTo("NewSeriesPage");
                    }));
            }
            private set { }
        }

        public LoadSeriesPageViewModel(IFrameNavigationService navigationService)
        {
            _navigationService = navigationService;

        }
    }
}
