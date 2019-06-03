using GalaSoft.MvvmLight;
using NR2K3_Season_Manager.Navigation;
using System;
using Microsoft.WindowsAPICodePack.Dialogs;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GalaSoft.MvvmLight.CommandWpf;
using System.Windows.Controls;
using NR2K3_Season_Manager.Model;
using NR2K3_Season_Manager.Data;

namespace NR2K3_Season_Manager.ViewModel
{
    public class NewEditSeriesViewModel : ViewModelBase
    {
        private IFrameNavigationService _navigationService;

        private string _seriesName;
        private string _seriesShort;
        private string _sanctioningBody;
        private string _seriesLogo;
        private string _sanctioningLogo;
        private string _gameDirectory;

        public RelayCommand LoadNewSeriesCommand { get; private set; }
        public RelayCommand LoadNewSanctioningCommand { get; private set; }
        public RelayCommand NR2K3RootCommand { get; private set; }
        public RelayCommand CancelCommand { get; private set; }
        public RelayCommand CreateCommand { get; private set; }
        public string SeriesName
        {
            get
            {
                return _seriesName;
            }
            set
            {
                _seriesName = value;
                RaisePropertyChanged();
            }
        }

        public string SeriesShort
        {
            get
            {
                return _seriesShort;
            }
            set
            {
                _seriesShort = value;
                RaisePropertyChanged();
            }
        }

        public string SanctioningBody
        {
            get
            {
                return _sanctioningBody;
            }
            set
            {
                _sanctioningBody = value;
                RaisePropertyChanged();
            }
        }

        public string SeriesLogo
        {
            get
            {
                return _seriesLogo;
            }
            set
            {
                _seriesLogo = value;
                RaisePropertyChanged();
            }
        }

        public string SanctioningLogo
        {
            get
            {
                return _sanctioningLogo;
            } set
            {
                _sanctioningLogo = value;
                RaisePropertyChanged();
            }
        }

        public string GameDirectory
        {
            get
            {
                return _gameDirectory;
            }
            set
            {
                _gameDirectory = value;
                RaisePropertyChanged();
            }
        }
        public NewEditSeriesViewModel(IFrameNavigationService navigationService)
        {
            _navigationService = navigationService;

            //register commands
            LoadNewSanctioningCommand = new RelayCommand(LoadNewSanctioningCommandAction);
            LoadNewSeriesCommand = new RelayCommand(LoadNewSeriesCommandAction);
            NR2K3RootCommand = new RelayCommand(NR2K3RootCommandAction);
            CancelCommand = new RelayCommand(CancelCommandAction);
            CreateCommand = new RelayCommand(CreateCommandAction);

        }

        /// <summary>
        /// Method to execute when the user opens their NR2K3 root folder.
        /// </summary>
        private void NR2K3RootCommandAction()
        {
            CommonOpenFileDialog diag = new CommonOpenFileDialog() { IsFolderPicker = true };

            if (diag.ShowDialog() == CommonFileDialogResult.Ok)
            {
                GameDirectory = diag.FileName;
            }
        }

        /// <summary>
        /// Prompts user with open file dialog to open an image.
        /// </summary>
        /// <returns>Returns the path to the image the user opened.</returns>
        private String LoadImage()
        {
            Microsoft.Win32.OpenFileDialog openFile = new Microsoft.Win32.OpenFileDialog();

            var codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
            var codecFilter = "Image Files|";
            foreach (var codec in codecs)
            {
                codecFilter += codec.FilenameExtension + ";";
            }
            openFile.Filter = codecFilter;

            if (openFile.ShowDialog() == true)
            {
                return openFile.FileName;
            }
            else
            {
                return null;
            }


        }

        /// <summary>
        /// Method to execute when user opens a new series image.
        /// </summary>
        public void LoadNewSeriesCommandAction()
        {
            string path = LoadImage();

            if (null != path)
            {
                SeriesLogo= path;
            }
        }

        /// <summary>
        /// Action to execute when user opens a new sanctioning body image.
        /// </summary>
        public void LoadNewSanctioningCommandAction()
        {
            string path = LoadImage();

            if (null != path)
            {
                SanctioningLogo = path;
            }
        }

        public void CancelCommandAction()
        {
            Clear();
            _navigationService.NavigateTo("LoadSeriesPage");
        }

        public void CreateCommandAction()
        {
            if (String.IsNullOrWhiteSpace(_seriesName) || String.IsNullOrWhiteSpace(_seriesShort) || String.IsNullOrWhiteSpace(_sanctioningBody))
            {
                ShowDialog("Please enter all required inputs!");
            } else
            {
                Series temp = new Series
                {
                    SeriesName = SeriesName,
                    SeriesShort = SeriesShort,
                    SeriesLogo = SeriesLogo,
                    SanctioningLogo = SanctioningLogo,
                };
                try
                {
                    SeriesQueries.CreateSeries(temp);
                } catch (ArgumentException e)
                {
                    ShowDialog(e.Message);
                }
                Clear();
            }

        }

        private async void ShowDialog (string message)
        {
            var dialogContent = new TextBlock
            {
                Text = message,
                Margin = new System.Windows.Thickness(20)
            };
            await MaterialDesignThemes.Wpf.DialogHost.Show(dialogContent);
        }
        private void Clear()
        {
            SeriesName = null;
            SeriesShort = null;
            SanctioningBody = null;
            SeriesLogo = null;
            SanctioningLogo = null;
        }

    }
}
