
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
    
public partial class RaceResult
{

    public int Id { get; set; }

    public byte StartingPosition { get; set; }

    public byte FinishingPosition { get; set; }

    public short LapsLed { get; set; }

    public float TimeOffLeader { get; set; }

    public bool MostLapsLed { get; set; }

    public bool DNF { get; set; }

    public string DNFReason { get; set; }



    public virtual WeekendResult WeekendResult { get; set; }

}

}
