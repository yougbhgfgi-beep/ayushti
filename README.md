# بصمة و الابداع — موقع الحب

## الملفات

| الملف / المجلد | الوظيفة |
| --- | --- |
| `index.html` | **الموقع الأساسي** (HTML + CSS + React في ملف واحد) |
| `preview.html` | نسخة/تصميم قديم (احتياطي) |
| `assets/images` | ضع هنا الصور الجديدة |
| `assets/audio` | ضع هنا الأغنية الجديدة |
| `assets/video` | ضع هنا الفيديو الجديد |
| `_old_media` | الصور والأغاني والفيديوهات القديمة (تمت إزالتها من الموقع) |

> ملفات `package.json` و `vite.config.js` و `tailwind.config.js` و `postcss.config.js`
> و `index.vite.html` هي بقايا إعداد Vite وقديمة وغير مستخدمة — يمكن حذفها بأمان.

## إضافة الصور / الأغنية / الفيديو

كل حاجة في مكان واحد. افتح `index.html` وابحث عن:

```
⚙️ إعدادات الميديا
```

هتلاقي الكائن ده:

```js
const MEDIA = {
    music: "",                       // الأغنية
    video: "",                       // الفيديو
    memories: ["", "", "", "", ""],  // صور خط الذكريات (5 صور)
    gallery: ["", "", "", "", ""],   // صور الألبوم
};
```

- ضع مسار الملف بين علامتي التنصيص، مثال:

```js
const MEDIA = {
    music: "./assets/audio/song.mp3",
    video: "./assets/video/memory.mp4",
    memories: [
        "./assets/images/mem1.jpg",
        "./assets/images/mem2.jpg",
        "./assets/images/mem3.jpg",
        "./assets/images/mem4.jpg",
        "./assets/images/mem5.jpg",
    ],
    gallery: [
        "./assets/images/g1.jpg",
        "./assets/images/g2.jpg",
        "./assets/images/g3.jpg",
    ],
};
```

- أي مكان سايبه فاضي `""` هيظهر مكانه إطار منقّط مكتوب عليه «صورة الذكرى / مكان الفيديو...» بدل ما الموقع يبوظ.
- زر الموسيقى في أعلى الصفحة يظهر تلقائياً أول ما تضيف `music`.
- تقدر تزوّد صور الألبوم أو تقللها بحرية (كل صورة بتضيف سطر جديد في `gallery`).

## كود الدخول

اليوم: `1` — الشهر: `1` (غيّرها من دالة `handleLogin` في `index.html`).

## تشغيل سريع

افتح `index.html` مباشرة في المتصفح. (محتاج إنترنت لأن React و Tailwind و Babel من CDN.)
