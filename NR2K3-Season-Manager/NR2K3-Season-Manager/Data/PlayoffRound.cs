//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NR2K3_Season_Manager.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class PlayoffRound
    {
        public PlayoffRound()
        {
            this.Races = new HashSet<Race>();
        }
    
        public int Id { get; set; }
        public int PointsSystemId { get; set; }
    
        public virtual ICollection<Race> Races { get; set; }
        public virtual PointsSystem PointsSystem { get; set; }
    }
}
