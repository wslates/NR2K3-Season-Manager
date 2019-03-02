using GalaSoft.MvvmLight.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NR2K3_Season_Manager.Navigation
{
    interface IFrameNavigationService: INavigationService
    {
        object Parameter { get; }
    }
}
