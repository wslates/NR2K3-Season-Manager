
//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace NR2K3_Season_Manager.Model
{

using System;
    using System.Collections.Generic;
    
public partial class PointsResult
{

    public PointsResult()
    {

        this.Penalties = new HashSet<Penalty>();

    }


    public int Id { get; set; }

    public short RacePointsEarned { get; set; }

    public short RookiePointsEarned { get; set; }

    public short TeamPointsEarned { get; set; }

    public short ManufacturerPointsEarned { get; set; }



    public virtual WeekendResult WeekendResult { get; set; }

    public virtual ICollection<Penalty> Penalties { get; set; }

}

}