using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NR2K3_Season_Manager.Data
{
    interface IDataQuery<T>
    {
        void Create(T obj);
        T Read();
    }
}
