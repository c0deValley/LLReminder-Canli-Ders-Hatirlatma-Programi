<!-- Readme Dosyası Şablonu: https://github.com/othneildrew/Best-README-Template -->

<br />
<p align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="Görseller/LLReminderlogo.jpg" alt="Logo">
  </a>

  <h3 align="center">LLReminder - Canlı Ders Hatırlatma Programı</h3>

  <p align="center">
    LLReminder, Zoom üzerinden gerçekleştirilen derslere otomatik olarak katılmanızı sağlayacak bir otomasyon programıdır. Haftanın 7 günü, 24 saat boyunca sınırsız sayıda ders eklenebilir ve bu derslerin otomatikleştirilmesi sağlanabilir. Zoom otomasyon işlemi için hem ID ve PASS hem de URL ekleyebilmek mümkündür.
    <br />
    <a href="https:/LLReminder.online/"><strong>LLReminder Web Sitesi »</strong></a>
    <br />
    <br />
    <a href="https://github.com/CodeWALLEY/LLReminder-Canli-Ders-Hatirlatma-Programi/tree/main/Kaynak%20Kodlar%C4%B1">Kaynak Kodları</a>
    ·
    <a href="https://github.com/CodeWALLEY/LLReminder-Canli-Ders-Hatirlatma-Programi/issues">Sorun Bildir</a>
    ·
    <a href="https://github.com/CodeWALLEY/LLReminder-Canli-Ders-Hatirlatma-Programi/issues">Özellik Talep Et</a> 
    ·
    <a href="mailto:info@llreminder.online">İletişim</a>  
  </p>
</p>



<details open="open">
  <summary><h2 style="display: inline-block">İçindekiler Tablosu</h2></summary>
  <ol>
    <li>
      <a href="#program-hakkında">Program Hakkında</a>
      <ul>
        <li><a href="#program-özellikleri-öğrenci-versiyonu">Program Özellikleri</a></li>
        <li><a href="#programın-kurulumu">Programın Kurulumu</a></li>
      </ul>
    </li>
    <li>
      <a href="#kaynak-kodunu-kullanma">Kaynak Kodunu Kullanma</a>
      <ul>
        <li><a href="#gereksinimler">Gereksinimler</a></li>
        <li><a href="#programı-anlama">Programı Anlama</a></li>
        <li><a href="#kaynak-kodunu-düzenleme">Kaynak Kodunu Düzenleme</a></li>
</ul>
    </li>
    <li><a href="#katkı-sağlama-ve-sorun-bildirme">Katkı Sağlama ve Sorun Bildirme</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#iletişim">İletişim</a></li>
  </ol>
</details>




## Program Hakkında

<p align="center">
<img src="Görseller/programArayuzu.png" alt="Program Arayüzü">
</p>

LLReminder Öğrenci ve Öğretmen olmak üzere iki farklı versiyondan oluşur ve derslerin daha kolay işlenebilmesi için Zoom programının otomatize edilmesini sağlar. Programın öğrenci versiyonunun ilk kararlı sürümü tamamlanmış ve yayınlanmıştır. Öğretmen versiyonunun ise şuanlık tamamlanması planlanmamaktadır.


### Program Özellikleri (Öğrenci Versiyonu)

* []()Haftanın 7 günü, 24 saat boyunca sınırsız sayıda ders eklenebilir.
* []()Dersler Zoom ID ve PASS şeklinde veya Davet URL'si olarak eklenebilir.
* []()Ders programı kolaylıkla ayarlanabilir ve sonradan değiştirilebilir.
* []()Dersinizin saati geldiği zaman arkaplanda çalışan program bir bildirim gösterir. Bu bildirim ile derse katılmak isteyip istemediğiniz sorulur. Katılmak istemeniz durumunda derse otomatik bir şekilde giriş yapılır. Katılmak istemezseniz ise bir sonraki dersin gelmesi beklenir.
* []()Otomasyon işlemi şu şekilde işlemektedir; eğer kullanıcı Zoom ID ve Pass bilgisi ile derse girilmesini istediyse LLReminder zoom.us/j/<ders ID bilgisi> adresini açar. Bu adres Zoom programına yönlendirir ve dersin şifresini sorar. LLReminder bu şifre giriş ekranının açıldığını tespit ettiği zaman şifreyi yazar ve derse otomatik bir şekilde giriş yapmış olur. Eğer kullanıcı ID ve PASS yerine direkt olarak URL girmiş ise o zaman program sadece URL'ye giriş yapar.
* []()LLReminder ile sadece derslere değil, Zoom üzerinden gerçekleşen her türlü meeting'e katılmak mümkündür. Hem bireysel hem de konferans şeklinde gerçekleşen etkinliklere katılım test edilmiştir.
* []()Bu temel özelliklerin yanı sıra LLReminder programına bazı ek özellikler eklenmiştir. Üst menüde bulunan Ayarlar>Dosya Bakımı kısmından bütün dersleri silmek veya bütün ders programını silmek mümkündür. Ayarlar>Yazılım Ayarları kısmından programın bilgisayar başlangıcında çalıştırılması sağlanabilir. Ayarlar>Güncelleme Kontrolü kısmından yeni bir güncelleme olup olmadığı kontrol edilebilir. Aynı şekilde bu güncelleme kontrolü işlemi haftanın üç günü boyunca arkaplanda da kontrol edilmektedir. Ek olarak program lisans sistemine sahiptir. Program başta ticari olarak geliştirildiğinden dolayı lisans sistemi kullanılmıştır.

[Daha fazla detay için LLReminder web sitesini ziyaret edebilirsiniz](https://LLReminder.online/ "LLReminder Web Sitesi")

### Programın Kurulumu

Programı kurmak için bu repo'nun Relases kısmından veya [LLReminder web sitseinden](http://llreminder.online/indir) ulaşabileceğiniz "LLReminder Setup.exe" dosyasını kullanabilirsiniz. Bu dosya LLReminder'ı sunucudan indirerek bilgisayarınızdaki mevcut kullanıcının Belgelerim klasörüne kuracak, masaüstü kısayolu oluşturacak ve deneme lisansı oluşturacaktır. 
Programın belgeler klasörüne kurulacak şekilde yapmamızın sebebi False Detection durumunu önlemek. Antivirüs yazılımları Autoit ile yazılmış programları genelde zararlı yazılım olarak görmekte. LLReminder programı şuana kadar çok defa False Detection durumuna maruz kaldı, bunların büyük bir kısmını antivirüs yazılım şirketlerinden yeni bir analiz talep ederek çözebildik ancak yine de programın false detection olarak tespit edilme ihtimalini azaltabilmek adına LLReminder programının belgeler klasörüne kurulmasını sağladık. Eğer programı silmek isterseniz Setup.exe dosyasını tekrardan açmanız yeterli olacaktır. Eğer program zaten yüklüyse kurulum sihirbazı programı kaldırmanızı sağlayacaktır.

Programın kurulumuyla ilgili daha fazla bilgiye [LLReminder Web Sitesi Destek Sayfası](http://llreminder.online/destek)'nda bulunan makalelerden ulaşabilirsiniz.


## Kaynak Kodunu Kullanma

LLReminder'ı ilk olarak ticari olarak geliştirmemize rağmen programlama bilgimizin programın geleceği için yeterli olmayacağını bildiğimizden dolayı açık kaynak hale çevirdik. Böylece programın kaynak kodunu kendi amaçlarınıza göre değiştirerek programı GNU General Public License v3.0 kapsamında istediğiniz şekilde kullanabilirsiniz.
Program Autoit programlama dili ile yazıldı ve programı yapmaya kalkışmadan önce bu programlama dili ile ilgili pek bir bilgim yoktu. Bundan dolayı kaynak kodu içerisinde mantık hataları veya eksikler olabilir, bilginize. Her türlü katkılarınıza açığız.

### Gereksinimler

* []()Autoit (SciTE Script Editor ve KODA Form Designer kullanılacak.)

Ayrıca bu repo'da bulunan "Kaynak Kodları" klasörü ve "Program/v1.0" klasörü gerekmektedir.

### Programı Anlama

Programın kaynak kodunu kullanabilmek için ilk olarak programın çalışma şeklini anlamanız gerekmektedir.
LLReminder'ın program dosyaları bu repo'nun "Program/v1.0" klasöründe gözüktüğü gibidir. Programı anlamak için bu klasörü inceleyelim;

Bu klasörde bulunan "LLReminder Setup.exe" dosyası programın tek bir exe dosyası ile kurulabilmesi için oluşturulmuştur. Bu exe dosyası çalıştırıldığı zaman ilk olarak programın zaten yüklü olup olmadığını kontrol eder. Eğer program zaten yüklü ise kullanıcıya programı kaldırmak veya güncellemek olmak üzere iki seçenek sunar. Eğer program yüklü değil ise programı yükler. Programın yüklenmesi şu şekilde gerçekleşir; İlk olarak sunucudan LLReminder'ın zip olarak sıkıştırılmış bir hali indirilir, bu zip dosyası bilgisayarın Belgeler klasörüne dışa aktarılır, eğer program ilk defa yükleniyorsa deneme lisansı başlatılır ve son olarak programın sürümü kayıt defterine yazılır.

LLReminder klasörünün içine bakacak olursak;
- LLReminder.exe ders ekleme, ders programını düzenleme ve programı başlatma gibi çeşitli özelliklerin bulunduğu ana programdır. Bu program otomasyon işlemini gerçekleştirmez. Bu program ders ekleme, ders programını düzenleme ve otomasyon işlemini başlatmayı sağlar. Otomasyon işlemi bu program üzerinden başlatıldıktan sonra bu program kapatılabilir. Dersler ve ders programı .ini dosyası olarak /core/veriler klasörünün içine oluşturulur. 

LLReminder klasörünün içindeki core klasörünün içindeki dosyalara ve klasörlere bakacak olursak;
- LLReminderDersHatirlatici.exe dosyası programın arka planda çalışan ve otomasyon fonksiyonununu gerçekleştiren dosyadır. LLReminder.exe programından programı çalıştır butonuna basıldığı zaman bu dosya çalıştırılır. Bu dosya arkaplanda çalıştığı sürece ders otomasyonu işlemi gerçekleşir.
- LLReminderHizliBaslangicRehberi.pdf dosyası LLReminder programının kullanımını ve özelliklerini anlatan bir kullanım kılavuzu ve hızlı başlangıç rehberidir.
- LisansSozlesmesi.txt dosyası programın lisans sözleşmesini barındırır. Bu dosya LLReminder.exe programındaki Program Hakkında sayfasında gözükür.
- "font" klasörü programda kullanılan Trenda yazı tipini barındırır.
- "gorseller" klasörü programda kullanılan görselleri barındırır.
- "veriler" klasörü LLReminder.exe programında oluşturulan derslerin ve ders programının tutulduğu klasördür. Aynı zaman LLReminderDersHatirlatici.exe programı açıldığı zaman ilk olarak buradaki veriyi okur, daha sonra otomasyon işlemine geçer.

Programın dosya sistemi bu şekilde. Tabiki de en iyisi bu değil, iyileştirmeler yapmak mümkün.


## Kaynak Kodunu Düzenleme

Programın kaynak kodunu istediğiniz şekilde lisans kapsamında düzenleyebilirsiniz.
Bunun için dikkat etmeniz gereken birkaç nokta bulunmaktadır.

Programın kaynak kodları bu repo'nun "Kaynak Kodları" klasöründe bulunmaktadır. Bu klasörün içinde programın kendi kaynak kodları ve programa include edilen birkaç kaynak kodu bulunmaktadır. Ayrıca bunlara ek olarak KODA Form Designer kodları da eklenmiştir. Eğer görsel arayüzde değişiklik yaparsanız bunu kaynak koda yansıtmanız gerektiğini unutmayın.

Programın kaynak kodlarını düzenlemek için şunları yapmanız gerekir;
İlk olarak Includes klasöründe bulunan "Startup.au3", "license.au3" ve "Includes" klasörünü "Program Kaynak Kodları" klasörünün içine atın.
Daha sonra "Program/v1.0" klasöründe bulunan core klasörünü içindeki LLReminderDersHatirlatici.exe hariç olmak üzere Program Kaynak Kodları klasörünün içine atın.

Böylece programın kaynak kodlarını düzenleyebilirsiniz.
LLReminder (Ana Program).au3 => LLReminder.exe dosyasının kaynak kodudur.
LLReminder (Arkaplanda Çalışan Program).au3 => LLReminderDersHatirlatici.exe dosyasının kaynak kodudur.
LLReminder Kurulum Sihirbazı.au3 => LLReminderSetup.exe dosyasının kaynak kodudur.

Not: LLReminder Kurulum Sihirbazını derlerken tasarımda bulunan resmin programın içine gömülebilmesi için "/Görsel Arayüz Dosyaları/Kurulum Sihirbazı Arayüz Dosyaları" klasörü içinde bulunan foto.jpg dosyasınn "LLReminder Kurulum Sihirbazı.au3" dosyası ile aynı dizin içinde bulunması gerekmektedir.

Bu noktalara dikkat ederek programın kaynak kodunu istediğiniz şekilde düzenleyebilirsiniz.
Bir sorun yaşamanız durumunda Issue oluşturabilirsiniz.
Programı düzenleyip yayınlamanız durumunda bu repo'ya bir bağlantı vermeniz bizi sevindirir.


## Katkı Sağlama ve Sorun Bildirme

LLReminder programı için yapacağınız her katkıya açığız. Sorunları bildirmek için Issues sayfasını kullanabilirsiniz. Programda değişiklik yapmak için ise Fork yapıp değişikliklerinizi gönderebilirsiniz.


<!-- LICENSE -->
## License

Distributed under the GPL-3.0 License. See `LICENSE` for more information.



<!-- CONTACT -->
## İletişim

* []()LLReminder web sitesi - [LLReminder.online](https://LLReminder.online/)
* []()LLReminder e-posta adresi - [e-posta](mailto:info@llreminder.online)

* []()Ahmet Emin Dilben e-posta adresi - me[at]ahmetemindilben[.]com[.]tr
* []()Süleyman Umut Dursun e-posta adresi - suleymanumutkurt[at]gmail[.]com
