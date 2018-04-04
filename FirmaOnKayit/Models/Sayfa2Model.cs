using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirmaOnKayit.Models
{
    public class Sayfa2Model
    {
        public List<F2_BankaBilgileri> bankaBilgileri { get; set; }
        public F2_FirmaGenelBilgi2 genelBilgiSayfa2 { get; set; }
        public List<F2_Referanslar> referanslar { get; set; }
    }
}