using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FirmaOnKayit.Patterns
{
    public class SingletonPattern
    {
        private static IQueryable<SelectListItem> PersonelListesi = null;
        private static IQueryable<SelectListItem> BankaListesi = null;
        private static IQueryable<SelectListItem> ParaBirimListesi = null;
        private static readonly object padlock1 = new object();
        private static readonly object padlock2 = new object();
        private static readonly object padlock3 = new object();

        //public SingletonPattern();

        public static IQueryable<SelectListItem> PersonelListesiGetir
        {
            get
            {
                lock (padlock1)
                {
                    if (PersonelListesi == null)
                    {
                        FirmaOnKayit.Models.FirmaKayitDBEntities db = new FirmaOnKayit.Models.FirmaKayitDBEntities();
                        if (db.Database.Exists())
                        {
                            PersonelListesi = (from m in db.PersonellerView
                                               select new SelectListItem
                                               {
                                                   Text = m.IsimSoyisim,
                                                   Value = m.ID.ToString()
                                               });
                        }
                        else
                            throw new NullReferenceException("database hatası!");
                        db.Database.Connection.Close();
                    }
                    return PersonelListesi;
                }
            }
        }

        public static IQueryable<SelectListItem> BankaListesiGetir
        {
            get
            {
                lock (padlock2)
                {
                    if (BankaListesi == null)
                    {
                        Models.FirmaKayitDBEntities db = new Models.FirmaKayitDBEntities();
                        if(db.Database.Exists())
                        {
                            BankaListesi = from m in db.BankalarView
                                           select new SelectListItem
                                           {
                                               Text = m.BankaAdi,
                                               Value = m.BankaKodu
                                           };
                        }
                        else
                            throw new NullReferenceException("database hatası!");
                        db.Database.Connection.Close();
                    }
                    return BankaListesi;
                }
            }
        }

        public static IQueryable<SelectListItem> ParaBirimListesiGetir
        {
            get
            {
                lock (padlock3)
                {
                    if (ParaBirimListesi == null)
                    {
                        Models.FirmaKayitDBEntities db = new Models.FirmaKayitDBEntities();
                        if (db.Database.Exists())
                        {
                            ParaBirimListesi = from m in db.ParaBirimleriView
                                               select new SelectListItem
                                               {
                                                   Text = m.ParaBirimiAdi,
                                                   Value = m.ParaBirimiKodu
                                               };
                        }
                        else
                            throw new NullReferenceException("database hatası!");
                        db.Database.Connection.Close();
                    }
                    return ParaBirimListesi;
                }
            }
        }

    }
}