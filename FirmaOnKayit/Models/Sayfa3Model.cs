using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirmaOnKayit.Models
{
    public class Sayfa3Model
    {
        public List<F3_UrunPortfoyu> urunPortListesi { get; set; }
        public List<F3_HariciMal_Tanimlari> hariciMal_Tanimlari { get; set; }
        public F3_FirmaGenelBilgi3 genelBilgi3 { get; set; }
        public List<F3_SirketCalisanlari> sirketCalisanlari { get; set; }
    }
}