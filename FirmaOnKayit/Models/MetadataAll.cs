using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FirmaOnKayit.Models
{
    [MetadataType(typeof(sayfa3Genel_Metadata))]
    public partial class F3_FirmaGenelBilgi3 { }

    public class sayfa3Genel_Metadata
    {
        [Required(ErrorMessage = "İsim alanını boş geçmeyiniz.")]
        public string FormDolAd { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public string FormDolSoyad { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public string FormDolUnvan { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public string FormDolDepart { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public string FormDolTel { get; set; }
    }

    [MetadataType(typeof(BankaBilgileri_Metadata))]
    public partial class F2_BankaBilgileri { }

    public class BankaBilgileri_Metadata
    {
        [Required(ErrorMessage = "Banka seçiniz.")]
        public string BankaKodu { get; set; }

        [Required(ErrorMessage = "IBAN numarası giriniz.")]
        public string IbanNo { get; set; }

        [Required(ErrorMessage = "Para birimi seçiniz.")]
        public string ParaBirimiKodu { get; set; }
    }

    [MetadataType(typeof(sayfa2Genel_Metadata))]
    public partial class F2_FirmaGenelBilgi2 { }

    public class sayfa2Genel_Metadata
    {
        [Required(ErrorMessage = "Zorunlu alan")]
        public int SektorID { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public string FirmaFaliyetSekli { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public string SirketCirosu { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public int SirketCiroYili { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public bool BagimsizDenetleme { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public bool TedarikciKaliteYonetim { get; set; }
        [Required(ErrorMessage = "Zorunlu alan")]
        public bool KaliteSistemiBelgesi { get; set; }
    }

    [MetadataType(typeof(FabrikaAdresi_Metadata))]
    public partial class F1_FabrikaAdresi { }

    public class FabrikaAdresi_Metadata
    {
        [Required(ErrorMessage = "Adres giriniz.")]
        public string AcikAdres { get; set; }

        [Required(ErrorMessage = "Semt giriniz.")]
        public string Semt { get; set; }

        [Required(ErrorMessage = "Telefon numarası giriniz.")]
        public string Telefon1 { get; set; }
    }

    [MetadataType(typeof(SubeAdresi_Metadata))]
    public partial class F1_SubeAdresi { }

    public class SubeAdresi_Metadata
    {
        [Required(ErrorMessage = "Adres giriniz.")]
        public string AcikAdres { get; set; }

        [Required(ErrorMessage = "Semt giriniz.")]
        public string Semt { get; set; }

        [Required(ErrorMessage = "Telefon numarası giriniz.")]
        public string Telefon1 { get; set; }
    }

    [MetadataType(typeof(MerkezAdresi_Metadata))]
    public partial class F1_MerkezAdresi { }

    public class MerkezAdresi_Metadata
    {
        [Required(ErrorMessage = "Adres giriniz.")]
        public string AcikAdres { get; set; }

        [Required(ErrorMessage = "Semt giriniz.")]
        public string Semt { get; set; }

        [Required(ErrorMessage = "Telefon numarası giriniz.")]
        public string Telefon1 { get; set; }

        [Required(ErrorMessage = "Faks numarası giriniz.")]
        public string Faks1 { get; set; }
    }

    [MetadataType(typeof(FirmaGenelBilgi_Metadata))]
    public partial class FirmaGenelBilgi { }

    public class FirmaGenelBilgi_Metadata
    {
        [Required(ErrorMessage = "Firma adını yazınız.")]
        [MaxLength(70, ErrorMessage = "En fazla 70 karakter yazılabilir.")]
        public string FirmaAdi { get; set; }

        [Required(ErrorMessage = "Şirketin türünü seçiniz.")]
        [SirketTuruAtt("VergiNo", "TCNo", ErrorMessage = "Şirketin türünü seçiniz.")]
        public byte SirketTuru { get; set; }

        [Required(ErrorMessage = "Kuruluş yılını giriniz.")]
        [Range(1800,2200)]
        public int KurulusYili { get; set; }

        [Required(ErrorMessage = "Seçilmedi.")]
        public bool IliskiliTaraf { get; set; }

        [Required(ErrorMessage = "Seçilmedi.")]
        public bool OrtakIliskisi { get; set; }

        [Range(0, Int32.MaxValue, ErrorMessage = "Sayı giriniz.")]
        public int Sermaye { get; set; }

        [Required(ErrorMessage = "Zorunlu alan.")]
        public string Email1 { get; set; }
        public string Email2 { get; set; }
        public string Email3 { get; set; }

        [Required(ErrorMessage = "Zorunlu alan.")]
        [StringLength(11, ErrorMessage = "En fazla 11 karakter girilebilir.")]
        public string VergiDairesi { get; set; }

        [Required(ErrorMessage = "Zorunlu alan.")]
        public Nullable<byte> yazismaAdresi { get; set; }

        [RequiredIf("TCNo", ErrorMessage = "Vergi numarasını veya TC numarası giriniz.")]
        public string VergiNo { get; set; }

        [RequiredIf("VergiNo", ErrorMessage = "Vergi numarasını veya TC numarası giriniz.")]
        [StringLength(11, ErrorMessage = "11 karakter giriniz.")]
        public string TCNo { get; set; }
    }

    public class RequiredIf : ValidationAttribute
    {
        public string OtherPropertyName { get; set; }
        public RequiredIf(string otherPropertyName)
        {
            OtherPropertyName = otherPropertyName;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var otherPropertyInfo = validationContext.ObjectType.GetProperty(OtherPropertyName);
            var otherValue = (string)otherPropertyInfo.GetValue(validationContext.ObjectInstance, null);
            if (string.IsNullOrEmpty(otherValue) && string.IsNullOrEmpty((string)value))
            {
                return new ValidationResult(this.ErrorMessage); //The error message passed into the Attribute's constructor
            }
            return null;
        }
    }

    public class SirketTuruAtt : ValidationAttribute
    {
        public string VergiPropertyName { get; set; }
        public string TcPropertyName { get; set; }

        public SirketTuruAtt(string vPN, string tPN)
        {
            VergiPropertyName = vPN;
            TcPropertyName = tPN;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value == null || (byte)value == 0)
                return new ValidationResult(this.ErrorMessage); //The error message passed into the Attribute's constructor

            var vergiPropertyInfo = validationContext.ObjectType.GetProperty(VergiPropertyName);
            var vergiValue = (string)vergiPropertyInfo.GetValue(validationContext.ObjectInstance, null);

            var tcPropertyInfo = validationContext.ObjectType.GetProperty(TcPropertyName);
            var tcValue = (string)tcPropertyInfo.GetValue(validationContext.ObjectInstance, null);
            
            if (((byte)value == 1 && !string.IsNullOrEmpty(vergiValue)) ||
                ((byte)value == 2 && !string.IsNullOrEmpty(vergiValue)) ||
                ((byte)value == 3 && !string.IsNullOrEmpty(tcValue)) ||
                ((byte)value == 4 && !string.IsNullOrEmpty(vergiValue)) ||
                ((byte)value == 5 && !string.IsNullOrEmpty(vergiValue)) ||
                ((byte)value == 6 && !string.IsNullOrEmpty(vergiValue))
                )
            {
                return null;
            }
            
            return new ValidationResult("Vergi numarası veya TC numarası giriniz."); //The error message passed into the Attribute's constructor
        }
    }
}