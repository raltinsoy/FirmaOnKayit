﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FirmaOnKayit.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class FirmaKayitDBEntities : DbContext
    {
        public FirmaKayitDBEntities()
            : base("name=FirmaKayitDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<F1_FabrikaAdresi> F1_FabrikaAdresi { get; set; }
        public virtual DbSet<F1_MerkezAdresi> F1_MerkezAdresi { get; set; }
        public virtual DbSet<F2_Referanslar> F2_Referanslar { get; set; }
        public virtual DbSet<F1_SirketOrtaklari> F1_SirketOrtaklari { get; set; }
        public virtual DbSet<F2_FirmaGenelBilgi2> F2_FirmaGenelBilgi2 { get; set; }
        public virtual DbSet<FirmaGenelBilgi> FirmaGenelBilgi { get; set; }
        public virtual DbSet<F1_SubeAdresi> F1_SubeAdresi { get; set; }
        public virtual DbSet<F2_BankaBilgileri> F2_BankaBilgileri { get; set; }
        public virtual DbSet<F3_FirmaGenelBilgi3> F3_FirmaGenelBilgi3 { get; set; }
        public virtual DbSet<F1_Personeller> F1_Personeller { get; set; }
        public virtual DbSet<BankalarView> BankalarView { get; set; }
        public virtual DbSet<ParaBirimleriView> ParaBirimleriView { get; set; }
        public virtual DbSet<PersonellerView> PersonellerView { get; set; }
        public virtual DbSet<SektorView> SektorView { get; set; }
        public virtual DbSet<F4_BelgeVeDokuman> F4_BelgeVeDokuman { get; set; }
        public virtual DbSet<F3_SirketCalisanlari> F3_SirketCalisanlari { get; set; }
        public virtual DbSet<HariciMalGrubuView> HariciMalGrubuView { get; set; }
        public virtual DbSet<F3_UrunPortfoyu> F3_UrunPortfoyu { get; set; }
        public virtual DbSet<F3_HariciMal_Tanimlari> F3_HariciMal_Tanimlari { get; set; }
        public virtual DbSet<F3_HariciMalGrubu> F3_HariciMalGrubu { get; set; }
    }
}