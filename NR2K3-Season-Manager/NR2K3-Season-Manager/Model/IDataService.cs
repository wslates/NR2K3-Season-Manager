using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NR2K3_Season_Manager.Model
{
    public interface IDataService
    {
        void GetData(Action<DataItem, Exception> callback);
    }
}
