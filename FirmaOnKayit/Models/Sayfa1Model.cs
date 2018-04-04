using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirmaOnKayit.Models
{
    public class Sayfa1Model
    {
        public F1_MerkezAdresi merkezAdresi { get; set; }
        public FirmaGenelBilgi firmaGenelBilgi { get; set; }
        public F1_SubeAdresi subeAdresi { get; set; }
        public F1_FabrikaAdresi fabrikaAdresi { get; set; }
        public List<F1_SirketOrtaklari> sirketOrtaklari { get; set; }
    }
}