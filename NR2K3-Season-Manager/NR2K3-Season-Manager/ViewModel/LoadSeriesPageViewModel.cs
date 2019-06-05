using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.CommandWpf;
using NR2K3_Season_Manager.Data;
using NR2K3_Season_Manager.Model;
using NR2K3_Season_Manager.Navigation;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NR2K3_Season_Manager.ViewModel
{
    public class LoadSeriesPageViewModel : ViewModelBase
    {
        private IFrameNavigationService _navigationService;
        private RelayCommand _newSeriesCommand;
        private ObservableCollection<SelectableViewModel> _series;
        private SelectableViewModel _selected;
        public RelayCommand NewSeriesCommand
        {
            get
            {
                return _newSeriesCommand
                    ?? (_newSeriesCommand = new RelayCommand(
                    () =>
                    {
                        Selected = null;
                        _navigationService.NavigateTo("NewSeriesPage");
                    }));
            }
            private set { }
        }

        public SelectableViewModel Selected
        {
            get
            {
                return _selected;
            }
            set
            {
                Set(ref _selected, value);
                OnSeriesClickCommandAction();
                Set(ref _selected, null);
            }
        }
        public RelayCommand<SelectableViewModel> OnSeriesClickCommand { get; private set; }

        public ObservableCollection<SelectableViewModel> Series => _series;
        public LoadSeriesPageViewModel(IFrameNavigationService navigationService)
        {
            _navigationService = navigationService;
            LoadSeries();
        }

        public void LoadSeries()
        {
            var allSeries = SeriesQueries.GetSeries();
            _series = new ObservableCollection<SelectableViewModel>();
            foreach (Series series in allSeries)
            {
                StringBuilder sb = new StringBuilder(series.SeriesName);
                sb.Append(" - ");
                sb.Append(series.Seasons.Count);
                sb.Append(series.Seasons.Count == 1 ? " Season" : " Seasons");

                _series.Add(new SelectableViewModel
                {
                    Name = series.SeriesShort,
                    Description = sb.ToString(),
                    Code = series.SeriesName[0],
                });
            }
        }

        public void OnSeriesClickCommandAction()
        {
            //var select = item as SelectableViewModel;
            if (_selected !=null)
            {
                Console.WriteLine("CLICKED " + _selected.Name);

            }
        }
    }
}
