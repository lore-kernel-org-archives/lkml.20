Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF046EF65
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924914; cv=none; b=CY+I7IuqG/zOK/5evW9e/u84Uc2VSQhzPeEYuLrxPlcfrJlaXyw0U8vq7kviy8G7wReQ+G8C1R1uFumqujfhG0OQYORXE1ejenYqfPV/+1P0lth1+mSKgLHSQf9cz5YFjbE3GSvtHFy3HOMYBRK6ZZn+eA4BSU/BRx8XbcShb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924914; c=relaxed/simple;
	bh=ryt7yZmF0T0BLkRjL8DfW4WEGpGCHSG+s/XfPRWVBow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tf3iV60RnMitOHnZ0df6ifsl1jckoeBcKuk4b8VjokL8c1kg7w0qIyJLbXKSp2ynfeIYoVMQAyUUwDr6TLSkgaJKL/vZS0PNm0WWEA2NRcEf3C1ZsHMmmolHDJledEXpdYElndKamrjjKEgb4kABf9bwHcrEhen4VBBArWLYERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYEK+7kB; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYEK+7kB"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so812190a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787924911; x=1788529711; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ryt7yZmF0T0BLkRjL8DfW4WEGpGCHSG+s/XfPRWVBow=;
        b=bYEK+7kB06KFzx27OQw4s0OdbRrsnbqyVQCFYK/P6wIMAT88eAhIbY81IB0YHNVlLU
         3JcaN/4FGVNWtb9w4HzpmuSmdAxtWT+PaVtsKLREXMz9SZHCzdmqXXAkLaXn1r6atSM4
         bb6bk9A8OdERzfZY/PZ95DiKYemL/IOjzQmHiec1lEJBLqY0GVnN//ujBNNo9XDgMouB
         TBsZF7BAaQy413th2fv8Dp9Ev7iuCDEmfiJOZHzHK/aEMxs0SWu4E501VzhVpeaBpbbS
         NtTuiSYkxIDBBErTCnWcNaskQTijihnFSSPhCcUyBoJKmEDCMYqr/AQUoT2UwqTQRaVB
         iQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924911; x=1788529711;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryt7yZmF0T0BLkRjL8DfW4WEGpGCHSG+s/XfPRWVBow=;
        b=h8sI4aUwvEMO4EMocoO0+xwIo3E7ZUZ6olkQb+wja4HfUoIVL21gDaX63588bA9mrv
         i9GTq167kOHUuj55yQqEOJDObmR5flSRQLNZ/XZz4ic5paB5gppYG1vaA9IXy5DtTluv
         ddudBhnS3chjmzk3ZIXVVr/dmFwAQvJu0/JEtPRHykh+lEjP6FDB6UGmw9wxuKSmPhuZ
         ZXImbp+GNPZgZDgMdhTkJCKA7hYCBFC0v4zkv4ygpa/P+0mykIglHSiAmF1vlR0eKfPm
         rnRtKWDHxl2uMet2Yjy0fGuvluFJyn9OOKzNZA08B0KwmalDlroIW1XjkKonLD+8Zzdy
         iUbg==
X-Forwarded-Encrypted: i=1; AHgh+RqiqPBQmwtCF8bMyPDG7vPs3BwWBe1NWVXuwqGxCZAEJ4rdPw54Fid5Q0kJezJTWIyS0/U/kPuxr2ceOiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lgP9i+uZEO0gK8yLH/uOxek66KjWhYz/KIMFs0XtUIj+3/HZSo
	M5ojx0i62wMCZADNZidRdxP/auzetXG3QJpb8leIBcrSErGb5WHB4FOY
X-Gm-Gg: AR+sD13aTWGV6pRB5DOwMIyY3xMjwsmNGtsmvPkGlvX+sZ/k1WGh6cVbFoMbEZTSGeU
	BN0KharWsHehYjmTqeNIDgDO80Vo1dq/OxMleQJ0fcHeTeaBSlOwCLQKzeKASikZNp2XoXk0j/Z
	tBqv9VExQaW2tnQn0nxI7UM8WrLfelIThi/yHjee6oGfeB1m/A4xI5IEtDTrOelBcUyFVShB8Tw
	kHWmmx9mUoUz6Nb6EwuGGQdSJtlk20SWeoN3JPP+L6TRGjahsfofVovfnWGT5wVbF1JGjG9y6aF
	Tgj4IzhEvHK90Th2muYuG349rfg6vJNtlH1i1sc+LYFM8XSsSF8jFX3cOpb3W2Wv6yOLPGaMFnK
	HC5BmITP3excTYaiHm3mPpkVh/nlpWdlzfJj6pOi5jJJtdR6BH778czu5+euJvOud1U6GMgdac1
	O9GAP5mBLRRMI50kW6EOiIVOm7zh5q6gwy12cipf8hyu58rjp4yoqWlcrVf4XNCOOJjZbqp4eV1
	e+yOrDUK8ZjEQ==
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr1472296a91.10.1787924911385;
        Fri, 28 Aug 2026 06:48:31 -0700 (PDT)
Received: from hppc-archlinux.localnet ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm7340190a91.6.2026.08.28.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:48:30 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Fri, 28 Aug 2026 21:46:40 +0800
Message-ID: <RbJcKtULSuOq1gqhZCEqbA@gmail.com>
In-Reply-To: <apGIgyn-iJ534D9S@wyuan.org>
References:
 <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
 <apGIgyn-iJ534D9S@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"

SGkgV2VpamllLAoKT24gRnJpZGF5LCBBdWd1c3QgMjgsIDIwMjYgOTowOToyM+KAr1BNIENoaW5h
IFN0YW5kYXJkIFRpbWUgV2VpamllIFl1YW4gd3JvdGU6Cj4gSGkgWXVrYWksCj4gCj4gT24gRnJp
LCBBdWcgMjgsIDIwMjYgYXQgMDI6MTg6MTZQTSArMDgwMCwgWXVrYWkgV3Ugd3JvdGU6Cj4gPiBV
cGRhdGUgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0IHRyYW5z
bGF0aW9uLgo+ID4gCj4gPiBVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IGVk
ODQzYWU5NDdmOAo+ID4gKCJkb2NzOiBtb3ZlIHJpc2N2IHVuZGVyIGFyY2giKQo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZdWthaSBXdSA8eGlhb3lld3V6LlJ1c3RlckBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+IAo+ID4gIC4uLi96aF9DTi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0ICAg
ICB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQKPiA+IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJz
dAo+ID4gYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3BhdGNo
LWFjY2VwdGFuY2UucnN0IGluZGV4Cj4gPiBjOGViMjMwY2E4ZWUuLmE0OGU2ZTU3NWE2NyAxMDA2
NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yv
cGF0Y2gtYWNjZXB0YW5jZS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QKPiA+IEBAIC0xNSwxOSArMTUs
NDEgQEAgYXJjaC9yaXNjdiDlvIDlj5HogIXnu7TmiqTmjIfljZcKPiA+IAo+ID4gIOamgui/sAo+
ID4gIC0tLS0KPiA+IAo+ID4gLVJJU0MtVuaMh+S7pOmbhuS9k+ezu+e7k+aehOaYr+WFrOW8gOW8
gOWPkeeahO+8mgo+ID4gK1JJU0MtViDmjIfku6Tpm4bkvZPns7vnu5PmnoTmmK/lhazlvIDlvIDl
j5HnmoTvvJoKPiA+IAo+ID4gIOato+WcqOi/m+ihjOeahOiNieahiOWPr+S+m+aJgOacieS6uuaf
peeci+WSjOa1i+ivleWunueOsOOAguaWsOaooeWdl+aIluiAheaJqeWxleiNieahiOWPr+iDveS8
muWcqOW8gOWPkei/h+eoi+S4reWPkQo+ID4gCj4gPiAt55Sf5pu05pS5LS0t5pyJ5pe25Lul5LiN
5YW85a6555qE5pa55byP5a+55Lul5YmN55qE6I2J5qGI6L+b6KGM5pu05pS544CC6L+Z56eN54G1
5rS75oCn5Y+v6IO95Lya57uZUklTQy1WIExpbnV4Cj4gPiAt57u05oqk6ICF5bim5p2l5oyR5oiY
44CCTGludXjlvIDlj5Hov4fnqIvmm7TllpzmrKLnu4/ov4foia/lpb3mo4Dmn6XlkozmtYvor5Xn
moTku6PnoIHvvIzogIzkuI3mmK/or5Xpqozku6PnoIHjgILmiJEKPiA+IC3ku6zluIzmnJvmjqjl
ub/lkIzmoLfnmoTop4TliJnliLDljbPlsIbooqvlhoXmoLjlkIjlubbnmoRSSVNDLVbnm7jlhbPk
u6PnoIHjgIIKPiA+ICvnlJ/mm7TmlLkgLS0tIOacieaXtuS7peS4jeWFvOWuueeahOaWueW8j+Wv
ueS7peWJjeeahOiNieahiOi/m+ihjOabtOaUueOAgui/meenjeeBtea0u+aAp+WPr+iDveS8mue7
mSBSSVNDLVYKPiA+ICtMaW51eCDnu7TmiqTogIXluKbmnaXmjJHmiJjjgIJMaW51eCDnu7TmiqTo
gIXkuI3otZ7miJDpopHnuYHnmoTlj5jmm7TvvIzkuJQgTGludXgg5byA5Y+R6L+H56iL5pu05Zac
5qyi57uP6L+HCj4gPiAr6Imv5aW95qOA5p+l5ZKM5rWL6K+V55qE5Luj56CB77yM6ICM5LiN5piv
6K+V6aqM5Luj56CB44CC5oiR5Lus5biM5pyb5o6o5bm/5ZCM5qC355qE6KeE5YiZ5Yiw5Y2z5bCG
6KKr5YaF5qC45ZCI5bm255qECj4gPiArUklTQy1WIOebuOWFs+S7o+eggeOAggo+ID4gCj4gPiAr
6KGl5LiB6Lef6Liq57O757ufCj4gPiArLS0tLS0tLS0tLS0tCj4gPiArCj4gPiArUklTQy1WIOac
ieS4gOS4quihpeS4gei3n+i4quezu+e7n+WunuS+i++8jOWPr+S7peWcqOmCo+mHjOafpeeci+ih
peS4geeahOeKtuaAge+8mgo+IAo+IEkgc3VnZ2VzdCBrZWVwaW5nIHRoZSBuYW1lICJQYXRjaHdv
cmsiIGFzIGlzLiBCZWNhdXNlIHdlIGRvbid0IHRyYW5zbGF0ZQo+IGl0IGluIG1vc3QgY2FzZXMu
Cj4gCgpBZ3JlZWQuIEkgd2lsbCBrZWVwIGl0IGluIHRoZSB2MiBwYXRjaC4KCj4gPiArCj4gPiAr
ICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8K
PiA+ICsKPiA+ICvlpoLmnpzkvaDnmoTooaXkuIHkuI3lnKjpu5jorqTop4blm77kuK3lh7rnjrDv
vIzpgqPkuYggUklTQy1WIOe7tOaKpOiAheW+iOacieWPr+iDveW3suimgeaxguS/ruaUue+8jOaI
luiAheW4jOacmwo+ID4gK+WwhuWFtuW6lOeUqOWIsOWPpuS4gOS4quS7o+eggeagkeS4iuOAggo+
ID4gKwo+ID4gK+iHquWKqOWMlua1geeoi+S8muWcqOivpeihpeS4gei3n+i4quezu+e7n+WunuS+
i+S4iui/kOihjO+8jOWcqOavj+S4quihpeS4geWIsOi+vuaXtueri+WIu+WvueWFtui/m+ihjOae
hOW7ui/mtYvor5XjgIIKPiA+ICvoh6rliqjljJbmtYHnqIvmoLnmja7ooaXkuIHmmK/lkKbooqvo
r4bliKvkuLrkv67lpI3vvIzlsIblhbblupTnlKjliLAgUklTQy1WIGBmb3ItbmV4dGAg5ZKMIGBm
aXhlc2Ag5YiG5pSvCj4gPiAr5b2T5YmN55qEIEhFQUQg5LiK44CC5aaC5p6c5Z2H5LiN6YCC55So
77yM5YiZ5Lya5L2/55SoIFJJU0MtViBgbWFzdGVyYCDliIbmlK/jgILooaXkuIHns7vliJfooqvl
upTnlKjliLDnmoTlhbcKPiA+ICvkvZPmj5DkuqTlsIbmoIfms6jlnKjooaXkuIHot5/ouKrns7vn
u5/kuIrjgILku7vkvZXmo4Dmn6XmnKrpgJrov4fnmoTooaXkuIHpgJrluLjkuI3kvJrooqvlupTn
lKjvvIzlubbkuJTlnKjlpKflpJrmlbDmg4UKPiA+ICvlhrXkuIvlsIbpnIDopoHph43mlrDmj5Dk
uqTjgIIKPiA+IAo+ID4gIOmZhOWKoOeahOaPkOS6pOajgOafpeWNlQo+ID4gIC0tLS0tLS0tLS0t
LS0tLS0KPiA+IAo+ID4gLeaIkeS7rOS7heaOpeWPl+ebuOWFs+agh+WHhuW3sue7j+iiq1JJU0Mt
VuWfuumHkeS8muagh+WHhuS4uuKAnOW3suaJueWHhuKAneaIluKAnOW3suWGu+e7k+KAneeahOaJ
qeWxleaIluaooeWdl+eahOihpeS4geOAggo+ID4gLe+8iOW8gOWPkeiAheW9k+eEtuWPr+S7pee7
tOaKpOiHquW3seeahExpbnV45YaF5qC45qCR77yM5YW25Lit5YyF5ZCr5omA6ZyA5Luj56CB5omp
5bGV6I2J5qGI55qE5Luj56CB44CC77yJCj4gCj4gT3JpZ2luYWw6ICJGcm96ZW4iIG9yICJSYXRp
ZmllZCIgLS0gIuW3suWGu+e7kyLmiJYi5bey5om55YeGIgo+IAo+IEJ1dCBkb2VuJ3QgbWF0dGVy
IG11Y2guCj4gCgpVbmRlcnN0b29kLiBJIHdpbGwgY2hhbmdlIGl0LgoKPiA+IC0KPiA+IC3mraTl
pJbvvIxSSVNDLVbop4TojIPlhYHorrjniLHlpb3ogIXliJvlu7roh6rlt7HnmoToh6rlrprkuYnm
ianlsZXjgILov5nkupvoh6rlrprkuYnmi5PlsZXkuI3pnIDopoHpgJrov4dSSVNDLVYKPiA+IC3l
n7rph5HkvJrnmoTku7vkvZXlrqHmoLjmiJbmibnlh4bjgILkuLrkuobpgb/lhY3lsIbniLHlpb3o
gIXkuIDkupvnibnliKvnmoRSSVNDLVbmi5PlsZXmt7vliqDov5vlhoXmoLjku6PnoIHluKbmnaUK
PiA+IC3nmoTnu7TmiqTlpI3mnYLmgKflkozlr7nmgKfog73nmoTmvZzlnKjlvbHlk43vvIzmiJHk
u6zlsIblj6rmjqXlj5dSSVNDLVbln7rph5HkvJrmraPlvI/lhrvnu5PmiJbmibnlh4bnmoTnmoTm
ianlsZUKPiAKPiB3ZSdsbCBvbmx5IGNvbnNpZGVyIC0g5Y+q6ICD6JmR77yfCj4gCj4gVGhlIGNo
YW5nZSAoYWNjZXB0IC0+IGNvbnNpZGVyKSBpcyBpbiBjb21taXQgOTM2MTAwZDQ1MDdmCj4gKERv
Y3VtZW50YXRpb246IFJJU0MtVjogQWxsb3cgcGF0Y2hlcyBmb3Igbm9uLXN0YW5kYXJkIGJlaGF2
aW9yKQo+IAo+IERpZCB5b3UgbWlzcyBpdD8KPiAKClllcywgSSBtaXNzZWQgdGhhdC4gVGhhbmsg
eW91IGZvciBwb2ludGluZyBvdXQuIEkgd2lsbCBjb3JyZWN0IGl0IGluIHYyLgoKPiA+IC3ooaXk
uIHjgILvvIjlvIDlj5HogIXlvZPnhLblj6/ku6Xnu7TmiqToh6rlt7HnmoRMaW51eOWGheaguOag
ke+8jOWFtuS4reWMheWQq+S7luS7rOaDs+imgeeahOS7u+S9leiHquWumuS5ieaJqeWxlQo+ID4g
LeeahOS7o+eggeOAgu+8iQo+ID4gK+aIkeS7rOS7heaOpeWPl+mSiOWvueaWsOaooeWdl+aIluaJ
qeWxleeahOihpeS4ge+8jOWJjeaPkOaYr+i/meS6m+aooeWdl+aIluaJqeWxleeahOinhOiMg+ii
q+WIl+S4uuacquadpeS4jeWkquWPr+iDveWPkQo+ID4gK+eUn+S4jeWFvOWuueeahOWPmOabtOOA
guWvueS6juadpeiHqiBSSVNDLVYg5Z+66YeR5Lya55qE6KeE6IyD77yM6L+Z5oSP5ZGz552A4oCc
5bey5om55YeG4oCd5oiW4oCc5bey5Ya757uT4oCd77yM5a+55LqOCj4gPiArVUVGSSDorrrlnZvn
moTop4TojIPvvIzov5nmhI/lkbPnnYDlt7Llj5HluIPnmoQgRUNS44CC77yI5byA5Y+R6ICF5b2T
54S25Y+v5Lul57u05oqk6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8jAo+ID4gK+WFtuS4reWM
heWQq+S7luS7rOaJgOmcgOeahOS7u+S9leaJqeWxleiNieahiOeahOS7o+eggeOAgu+8iQo+ID4g
Kwo+ID4gK+atpOWklu+8jFJJU0MtViDop4TojIPlhYHorrjlrp7njrDogIXliJvlu7roh6rlt7Hn
moToh6rlrprkuYnmianlsZXjgILov5nkupvoh6rlrprkuYnmianlsZXkuI3pnIDopoHpgJrov4cg
UklTQy1WCj4gPiAr5Z+66YeR5Lya55qE5Lu75L2V5a6h5qC45oiW5om55YeG5rWB56iL44CC5Li6
5LqG6YG/5YWN5Zug5re75Yqg5a6e546w6ICF54m55a6a55qEIFJJU0MtViDmianlsZXluKbmnaXn
moTnu7TmiqTlpI3mnYIKPiA+ICvmgKflkozlr7nmgKfog73nmoTmvZzlnKjlvbHlk43vvIzmiJHk
u6zlsIblj6rmjqXlj5fnrKblkIjku6XkuIvku7vkuIDmnaHku7bnmoTmianlsZXooaXkuIHvvJoK
PiA+ICsKPiA+ICstIOW3sueUsSBSSVNDLVYg5Z+66YeR5Lya5q2j5byP5Ya757uT5oiW5om55YeG
Cj4gPiArLSDlt7LmjInnhafmoIflh4YgTGludXgg5oOv5L6L77yM5Zyo5bm/5rOb5Y+v55So55qE
56Gs5Lu25Lit5a6e546wCj4gPiArCj4gPiAr77yI5a6e546w6ICF5b2T54S25Y+v5Lul57u05oqk
6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8jOWFtuS4reWMheWQq+S7luS7rOaJgOmcgOeahOS7
u+S9leiHquWumuS5ieaJqeWxleeahOS7o+eggeOAgu+8iQo+IAo+IC0gUmV2aWV3cyBmcm9tIGNv
bW11bml0eSwgYmV0dGVyIHdhaXQgZm9yIHRoZSByZXBseSBmcm9tIG1haW50YWluZXJzLgo+IAo+
IFRoYW5rcy4KClRoYW5rcyBhZ2FpbiBmb3IgeW91ciB0aW1lIGFuZCByZXZpZXcuIEFuZCBzb3Jy
eSBmb3IgcmVhZGluZyB0aGUgb3JpZ2luYWwgCmRvY3VtZW50YXRpb24gbm90IHNvIGNhcmVmdWxs
eS4KCkJlc3QgcmVnYXJkcywKWXVrYWkgV3U=




