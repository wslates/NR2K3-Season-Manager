using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NR2K3_Season_Manager.Model;
namespace NR2K3_Season_Manager.Data
{
    class SeriesQueries
    {
        private static readonly SeriesDataModelContainer _context = new SeriesDataModelContainer();

        public static bool CreateSeries(Series series)
        {
            //check if there has alredy been a series with that name.
            if (_context.Series.Count(d=>d.SeriesName.Equals(series.SeriesName)) != 0)
            {
                throw new ArgumentException("Cannot have duplicate series names.");
            } else
            {
                _context.Series.Add(series);
                _context.SaveChanges();
                return true;
            }
        }

        public static Series UpdateSeries(Series series)
        {
            if (_context.Series.Count(d => d.SeriesName.Equals(series.SeriesName)) == 0)
            {
                throw new ArgumentException("Cannot find Series in database.");
            } else
            {
                throw new NotImplementedException(); 
            }
        }
    }
}
