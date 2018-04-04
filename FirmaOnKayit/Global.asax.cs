using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FirmaOnKayit
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            listeDoldur();

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        private FirmaOnKayit.Models.FirmaKayitDBEntities db = new FirmaOnKayit.Models.FirmaKayitDBEntities();
        public static IQueryable<SelectListItem> personelListesi { get; set; }
        public static IQueryable<SelectListItem> bankaListesi { get; set; }
        public static IQueryable<SelectListItem> paraBirimListesi { get; set; }

        protected void listeDoldur()
        {
            personelListesi = (from m in db.PersonellerView
                               select new SelectListItem
                               {
                                   Text = m.IsimSoyisim,
                                   Value = m.ID.ToString()
                               });

            bankaListesi = from m in db.BankalarView
                           select new SelectListItem
                           {
                               Text = m.BankaAdi,
                               Value = m.BankaKodu
                           };

            paraBirimListesi = from m in db.ParaBirimleriView
                               select new SelectListItem
                               {
                                   Text = m.ParaBirimiAdi,
                                   Value = m.ParaBirimiKodu
                               };
        }
    }
}
