<!-- Readme Dosyası Şablonu: https://github.com/othneildrew/Best-README-Template -->

<!-- PROJECT LOGO -->
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



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">İçindekiler Tablosu</h2></summary>
  <ol>
    <li>
      <a href="#Program-hakkında">Program Hakkında</a>
      <ul>
        <li><a href="#program-özellikleri-öğrenci-versiyonu">Program Özellikleri</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Kaynak Kodunu Kullanma</a>
      <ul>
        <li><a href="#prerequisites">Gereksinimler</a></li>
        <li><a href="#installation">Kaynak Kodunu Anlama</a></li>
        <li><a href="#installation">Programı Derleme</a></li>
</ul>
    </li>
    <li><a href="#installation">Getirilmesi Planlanan Özellikler</a></li>
    <li><a href="#installation">Sorun Bildirme ve Özellik Talep Etme</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">İletişim</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
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

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/github_username/repo_name.git
   ```
2. Install NPM packages
   ```sh
   npm install
   ```



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/github_username/repo_name/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email

Project Link: [https://github.com/github_username/repo_name](https://github.com/github_username/repo_name)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/github_username
