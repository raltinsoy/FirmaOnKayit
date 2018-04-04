using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FirmaOnKayit.Models;
using System.Web.Routing;
using System.IO;

namespace FirmaOnKayit.Controllers
{
    public class KayitController : Controller
    {
        private FirmaKayitDBEntities db = new FirmaKayitDBEntities();

        static private Dictionary<string, int> sessionID_DBIndex = new Dictionary<string, int>();

        // GET: Kayit
        public ActionResult Index()
        {
            return View(db.FirmaGenelBilgi.ToList());
        }

        // GET: Kayit/Create
        public ActionResult Create()
        {
            return View();
        }

        private int DbKaydetSayfa1(string subeAdresiEH, string fabrikaAdresiEH, Sayfa1Model s1m)
        {
            db.FirmaGenelBilgi.Add(s1m.firmaGenelBilgi);
            db.SaveChanges();

            s1m.merkezAdresi.FirmaID = s1m.firmaGenelBilgi.ID;
            db.F1_MerkezAdresi.Add(s1m.merkezAdresi);
            db.SaveChanges();

            if (subeAdresiEH.Equals("1")) // Şube adresi girildi ise
            {
                s1m.subeAdresi.FirmaID = s1m.firmaGenelBilgi.ID;
                db.F1_SubeAdresi.Add(s1m.subeAdresi);
                db.SaveChanges();
            }

            if (fabrikaAdresiEH.Equals("1"))
            {
                s1m.fabrikaAdresi.FirmaID = s1m.firmaGenelBilgi.ID;
                db.F1_FabrikaAdresi.Add(s1m.fabrikaAdresi);
                db.SaveChanges();
            }

            for (int i = 0; i < 5; i++)
            {
                if (!string.IsNullOrEmpty(s1m.sirketOrtaklari[i].Adi) && !string.IsNullOrEmpty(s1m.sirketOrtaklari[i].Soyadi))
                {
                    s1m.sirketOrtaklari[i].FirmaID = s1m.firmaGenelBilgi.ID;
                    db.F1_SirketOrtaklari.Add(s1m.sirketOrtaklari[i]);
                    db.SaveChanges();
                }
            }

            return s1m.firmaGenelBilgi.ID;
        }

        private void DbKaydetSayfa2(int firmaID, bool? banka1CheckBox, bool? banka2CheckBox, Sayfa2Model s2m)
        {
            s2m.bankaBilgileri[0].FirmaID = firmaID;
            db.F2_BankaBilgileri.Add(s2m.bankaBilgileri[0]);
            db.SaveChanges();

            if(banka1CheckBox!=null && banka1CheckBox==true)
            {
                s2m.bankaBilgileri[1].FirmaID = firmaID;
                db.F2_BankaBilgileri.Add(s2m.bankaBilgileri[1]);
                db.SaveChanges();
            }

            if (banka2CheckBox != null && banka2CheckBox == true)
            {
                s2m.bankaBilgileri[2].FirmaID = firmaID;
                db.F2_BankaBilgileri.Add(s2m.bankaBilgileri[2]);
                db.SaveChanges();
            }

            s2m.genelBilgiSayfa2.FirmaID = firmaID;
            db.F2_FirmaGenelBilgi2.Add(s2m.genelBilgiSayfa2);
            db.SaveChanges();

            for (int i = 0; i < 6; i++)
            {
                if (!string.IsNullOrEmpty(s2m.referanslar[i].FirmaAdi) && !string.IsNullOrEmpty(s2m.referanslar[i].Ciro))
                {
                    s2m.referanslar[i].FirmaID = firmaID;
                    db.F2_Referanslar.Add(s2m.referanslar[i]);
                    db.SaveChanges();
                }
            }
        }

        private void DbKaydetSayfa3(int firmID,Sayfa3Model s3m)
        {
            if (s3m.urunPortListesi != null)
            {
                foreach (var item in s3m.urunPortListesi)
                {
                    item.FirmaID = firmID;
                    db.F3_UrunPortfoyu.Add(item);
                    db.SaveChanges();
                }
            }

            for (int i = 0; i < 5;i++ )
            {
                if (!string.IsNullOrEmpty(s3m.sirketCalisanlari[i].Ad))
                {
                    s3m.sirketCalisanlari[i].FirmaID = firmID;
                    db.F3_SirketCalisanlari.Add(s3m.sirketCalisanlari[i]);
                    db.SaveChanges();
                }
            }

            s3m.genelBilgi3.FirmaID = firmID;
            db.F3_FirmaGenelBilgi3.Add(s3m.genelBilgi3);
            db.SaveChanges();
        }

        private void DbKaydetSayfa4(int firmID, HttpPostedFileBase file1, HttpPostedFileBase file2, HttpPostedFileBase file3)
        {
            if (file1.ContentLength > 0 && file2.ContentLength > 0 && file3.ContentLength > 0)
            {
                // aynı dosya isminden olabilir kontrol ettir var ise isimi değiştir !!!
                string fname1 = Path.Combine(Server.MapPath("~/Uploads/"), file1.FileName);
                file1.SaveAs(fname1);
                string fname2 = Path.Combine(Server.MapPath("~/Uploads/"), file2.FileName);
                file2.SaveAs(fname2);
                string fname3 = Path.Combine(Server.MapPath("~/Uploads/"), file3.FileName);
                file3.SaveAs(fname3);

                F4_BelgeVeDokuman item = new F4_BelgeVeDokuman();
                item.FirmaID = firmID;
                item.SicilTasdik = fname1;
                item.SicilGazet = fname2;
                item.İmzaSirkul = fname3;
                db.F4_BelgeVeDokuman.Add(item);
                db.SaveChanges();
            }
        }

        [HttpPost]
        public string Create(string subeAdresiEH, string fabrikaAdresiEH, Sayfa1Model s1m,
            bool? banka1CheckBox, bool? banka2CheckBox, Sayfa2Model s2m,
            Sayfa3Model s3m,
            HttpPostedFileBase file1, HttpPostedFileBase file2, HttpPostedFileBase file3)
        {
            if (subeAdresiEH == null || fabrikaAdresiEH == null || s1m == null ||
                s2m == null || s3m == null || file1 == null || file2 == null ||
                file3 == null)
                return "Create";
            
            if (subeAdresiEH.Equals("0"))
            {
                ModelState.Remove("subeAdresi.AcikAdres");
                ModelState.Remove("subeAdresi.Semt");
                ModelState.Remove("subeAdresi.Telefon1");
            }
            if (fabrikaAdresiEH.Equals("0"))
            {
                ModelState.Remove("fabrikaAdresi.AcikAdres");
                ModelState.Remove("fabrikaAdresi.Semt");
                ModelState.Remove("fabrikaAdresi.Telefon1");
            }

            if (banka1CheckBox == null)
            {
                ModelState.Remove("bankaBilgileri[1].IbanNo");
                ModelState.Remove("bankaBilgileri[1].BankaKodu");
                ModelState.Remove("bankaBilgileri[1].ParaBirimiKodu");
            }
            if (banka2CheckBox == null)
            {
                ModelState.Remove("bankaBilgileri[2].IbanNo");
                ModelState.Remove("bankaBilgileri[2].BankaKodu");
                ModelState.Remove("bankaBilgileri[2].ParaBirimiKodu");
            }

            if (ModelState.IsValid)
            {
                int firmaID = DbKaydetSayfa1(subeAdresiEH, fabrikaAdresiEH, s1m);

                DbKaydetSayfa2(firmaID, banka1CheckBox, banka2CheckBox, s2m);

                DbKaydetSayfa3(firmaID, s3m);

                DbKaydetSayfa4(firmaID,file1,file2,file3);

                return "Index";
            }
       
            return "Create";
        }
        
        // GET
        public ActionResult Sayfa1()
        {
            ViewBag.personeller = MvcApplication.personelListesi;

            ViewBag.subeRadio = "0";
            ViewBag.fabrikaRadio = "0";

            return PartialView();
        }
        
        [HttpPost]
        
        //[Bind(Include = "ID,FirmaAdi,SirketTuru,KurulusYili,IliskiliTaraf,OrtakIliskisi,Sermaye,WebAdresi,Email1,Email2,Email3,VergiDairesi,VergiNo,TCNo")] FirmaGenelBilgi firmaGenelBilgi
        public ActionResult Sayfa1(string subeAdresiEH, string fabrikaAdresiEH, Sayfa1Model tm)
        {
            ViewBag.personeller = MvcApplication.personelListesi;

            ViewBag.subeRadio = subeAdresiEH;
            ViewBag.fabrikaRadio = fabrikaAdresiEH;

            if (subeAdresiEH.Equals("0"))
            {
                ModelState.Remove("subeAdresi.AcikAdres");
                ModelState.Remove("subeAdresi.Semt");
                ModelState.Remove("subeAdresi.Telefon1");
            }
            if (fabrikaAdresiEH.Equals("0"))
            {
                ModelState.Remove("fabrikaAdresi.AcikAdres");
                ModelState.Remove("fabrikaAdresi.Semt");
                ModelState.Remove("fabrikaAdresi.Telefon1");
            }

            if (ModelState.IsValid)
            {
                // Sorunsuz çalışması halinde tab2 ye geçecek
                ViewBag.tabSayaci = 2;
            }

            return PartialView(tm);
        }

        // GET
        public ActionResult Sayfa2()
        {
            ViewBag.bankalar = MvcApplication.bankaListesi;

            ViewBag.paraBirimleri = MvcApplication.paraBirimListesi;

            ViewBag.sektor = from m in db.SektorView
                             select new SelectListItem
                             {
                                 Text = m.SektorAdi,
                                 Value = m.SektorID.ToString()
                             };

            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Sayfa2(bool? banka1CheckBox, bool? banka2CheckBox, Sayfa2Model s2m)
        {
            ViewBag.banka1Sec = (banka1CheckBox != null) ? "checked" : null;
            ViewBag.banka2Sec = (banka2CheckBox != null) ? "checked" : null;

            if (banka1CheckBox == null)
            {
                ModelState.Remove("bankaBilgileri[1].IbanNo");
                ModelState.Remove("bankaBilgileri[1].BankaKodu");
                ModelState.Remove("bankaBilgileri[1].ParaBirimiKodu");
            }
            if (banka2CheckBox == null)
            {
                ModelState.Remove("bankaBilgileri[2].IbanNo");
                ModelState.Remove("bankaBilgileri[2].BankaKodu");
                ModelState.Remove("bankaBilgileri[2].ParaBirimiKodu");
            }
            
            if (ModelState.IsValid)
            {
                ViewBag.tabSayaci = 3;
            }

            ViewBag.bankalar = MvcApplication.bankaListesi;

            ViewBag.paraBirimleri = MvcApplication.paraBirimListesi;

            ViewBag.sektor = from m in db.SektorView
                             select new SelectListItem
                             {
                                 Text = m.SektorAdi,
                                 Value = m.SektorID.ToString()
                             };

            return PartialView(s2m);
        }

        public ActionResult Sayfa3()
        {
            ViewBag.MallarinListesi = from m in db.HariciMalGrubuView
                             select new SelectListItem
                             {
                                 Text = m.Text,
                                 Value = m.ID
                             };

            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Sayfa3(Sayfa3Model s3m)
        {
            if (ModelState.IsValid)
            {
                ViewBag.tabSayaci = 4;
            }
            
            ViewBag.MallarinListesi = from m in db.HariciMalGrubuView
                                      select new SelectListItem
                                      {
                                          Text = m.Text,
                                          Value = m.ID
                                      };


            return PartialView(s3m);
        }

        public JsonResult tanimGetirJson(string q,string k)
        {
            if(!string.IsNullOrEmpty(q) && !string.IsNullOrEmpty(k))
            {
                if(k.Equals("1"))
                {
                    var result = db.F3_HariciMal_Tanimlari.Where(m => m.HariciMalGrupID == q);
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                else if(k.Equals("2"))
                {
                    var result = db.F3_HariciMal_Tanimlari.Where(m => m.Tanim.Contains(q));
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
                
            }
            return Json("");
        }

        // GET
        public ActionResult Sayfa4()
        {
            
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Sayfa4(HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                ;
            }

            return RedirectToAction("Index");
        }

        public ActionResult SonAdim(Sayfa1Model s1m,Sayfa2Model s2m,Sayfa3Model s3m,Sayfa4Model s4m)
        {
            return RedirectToAction("Index");
        }

    }
}
