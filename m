Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB391FA272
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417431; cv=pass; b=ik8uMOCmdUXVezaC71sejM6LlbP8bRRuUQHuFfbHTSwC3tsLpOHXweVIeJegUcnBZ9HlMyEG5J00LlN2NouurQz932iO3UHd/rSMXACxbRW03F/d2UrlYkDvGGrowZqwhdtAeAtvqqZXGMCDilonNOtaSpUFp/HIAcHWbx+4OJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417431; c=relaxed/simple;
	bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgPQPGlRUaX11wOc9a7mdy3nQPeiJG4gETzTA4kTCYBrCpm+6gNMdZ9kY5j1rDg5P7KUFv02OkIn0gC3Q5PfTlYRrg1vrFIZRRFlajR9+XAoBMGSENHMQXCsL5kiGBLOgD+bMZo5uEV23QJZYX6jpKHUcF08vvoe0ZhYQbOUU+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXx7bd+Y; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXx7bd+Y"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e6782ee70aso81901b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790417429; cv=none;
        d=google.com; s=arc-20260327;
        b=rtvlxvUsAk4AQdGn7qV6YyGoEQarfOjYsjKZcSqWgpa8KzFbMpyxH5lXCVM79a9Unq
         uvOivwBBH7v50GRb3bo5KF5ej5fpthFU7vPVfoNuraqGlpWFZWRiA6UwJ411huXnPicR
         IyfHyC2fvn/Hod03hiWI/gA5O6IMB8k622x0KUuywpYZJJ0P47it4fDTURqpNf1GtnJ7
         x6mmVTHEOJOzvJ8rHSu/SNmphyXEPPJyOdQa3v9PpvpP+AOaG5pinNAyNCDS2A6UUaFp
         gkuB/xvRS8r4ZCA+bNSNKuxyO0B0EFykwQpO7zTUlq/nUshn8GX36SxHpQVleWRV3Nq2
         DYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
        fh=mRiv9jl37uUEI8wHqWRZn0OW3S83xd97aXZjx6MreWs=;
        b=WncYkZZKmD0AGOUsWsT6r6hw23VKuRiQotNSsmkj7CgXUIsts7m4l/bFI3bW4PYRpd
         m/Q+bt9a6WmxcWNcvwnoQN+b5FLbp/syT/hoaWTOdeX6DPloqLeOqSsE2RV2bxKqcIBT
         MVNO/OItoteAJyNPimt2FZSajJCnEI4TaOfQyWNzxbcnFgEHDubHFcpbMdA0xDwm2oPQ
         xbpnwzmM7+Idx4oE/lSf885WMNJf8agu9RQ7ymuCu8STONMpj6WlFbmdTJVw+63VD1vy
         7xY2CT4j0ijW1O/9ht0my0biT3UA1b2XOal32Gs9CJ7WiHKlyW0Hnw5Jc1Tap06p8sHa
         uhEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417429; x=1791022229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
        b=MXx7bd+YvBRWRPbpN2n+jDZjtFbh9YEP1cVzUmtOAOOktDoF5wJOmpsNBlIjMbPiUv
         s35rDczVR6k5glU8w9WvuCxgOthwP3epHKI8Wg8gh48BIeAfFy40BxTgs6hwKTsnKiU2
         B/maYtjm2UabHM8v9yeaVSNsYiQdG7jXUHRIwzCID+rficyqQ+jKZNPyobdn37aa7yh6
         cHyePLvy3BxRiUrZb+6T1/yQsRent2ZJOFNOPqKRYc+TdEAJwWkod5pS9dK8tLyuwk/2
         aH/sW6tGiFV/h/dNSzoFbdkRzc1qA6BN6r7utbLAfKLsRxwP2PL5mtWX09vh2UC223SP
         G9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417429; x=1791022229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Os3pfspsqHbWB7/+IsBR6tOZ9/A0oT8IgsED+SKOYQ=;
        b=M6Kein3rSBwCfxSTelR4KCg2T2AzN9RezeRkK9RsppWpDciGlpLx2IuoXMEFhVkcQh
         vcz8uGb9mZz7ZwYlLaPFGB8FtK/3d7gx2TTZ6EGA+5eG8u9vidENGfnK2PCBhPgVjMf1
         5bPaO3wRv9/BpJfqlAxuHVilKKHk62l1qjz/wpcwmxa2vYI7f8TifCcnZeUTXO2SW+nf
         yscTcVIShlH4UJjrwos8NSwqh+8mu+NRBiqh+LvHU6TMLzO6pq4k862OA5sK8HiWrg7M
         cHBCiKE3tLr8ecwZEAwxm7hP6KXFItYyQLkqCtrz4cyl05lTtswpvXRz7wLU4xTOmdLp
         O68g==
X-Forwarded-Encrypted: i=1; AKwUvBych0w6/QqngIUKukZgHccfln/YfwpbuMnqnWGUL/37oBGAP5oxpXPB1Oam24eX1tYG9pyCaKe5tDTP+ro=@vger.kernel.org
X-Gm-Message-State: AFuF++nLY7Vl00hlWiFXHfDtmYRstz8kMWOvxCF+YXzAUELgfe8IVeVh
	PcA60nhJda4gaGT21aAiEcd7flRMM+ViUN6JqbHoHoULImE92mzuoLrJW79iuajEjjLt6AGmXdZ
	orL/i0tHt+yLMxBtOYin63s5zdzhHQv4=
X-Gm-Gg: AYBFou0rir7I80d0CxwOjYXCmGvn6tjKvASpeLx/Ir4FTwMvGfgzYqauL4/nXhw3iH7
	oSTAmjcNOzV3DMsFH1PU9Y6HxYxRJnCcUpeJbf4Dp7J+AqaGuS+VZyHFutlZi3cqjoJ1pWU+UwX
	tRKwJHMUO+Jm67Je1Qriynp1rnIxHHlNliNXwaeUjzGTpGGrGvMg+kfs7NHkEJeT2KYli99upcm
	Je04SdeoafcrJZRjauGbL1NoP2lM1KAoKT79l41jpDbWSXLmphy1DuxpnH3IntXAwdW0dhl6Y63
	571PN+43hEIuo0fvjQHQe4CeNS9hOigBo457RHKfiY5Wq8OgFUThaK5O
X-Received: by 2002:a05:6808:bcc:b0:4b3:7da2:f393 with SMTP id
 5614622812f47-4d72c636b6cmr8941062b6e.15.1790417427530; Sat, 26 Sep 2026
 03:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn> <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh>
In-Reply-To: <2026092601-reassure-darkness-229b@gregkh>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 26 Sep 2026 12:10:16 +0200
X-Gm-Features: AclHuK_PmhLb8Gh308L9mMNLEKeLUlEUkhhQ3UFDEaxAlMSkC-H929WaN-YXZoU
Message-ID: <CAMnqnYwDoNc5=RjEkeRB3-yB+HJvYkrcTBHpPo6cxydSfRMphw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, si.yanteng@linux.dev, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

ZG9jcy96aF9DTjogYWRkIENoaW5lc2UgdHJhbnNsYXRpb24gZm9yIHVzYi9vaGNpLnJzdA0KDQpU
cmFuc2xhdGUgRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QgaW50byBDaGluZXNlIFNpbXBsaWZp
ZWQuDQoNClRoZSB0cmFuc2xhdGlvbiBjb3ZlcnMgT0hDSSBkcml2ZXIgb3ZlcnZpZXcsIGhhcmR3
YXJlIHByb3RvY29sDQpkaWZmZXJlbmNlcyAoT0hDSSB2cyBVSENJKSwgaW1wcm92ZW1lbnRzIHNp
bmNlIDIuNCBrZXJuZWwsDQpxdWV1ZWFibGUgaW50ZXJydXB0IHRyYW5zZmVycywgYW5kIG5vbi1Q
Q0kgc3VwcG9ydC4NCg0KLS0tDQpDaGFuZ2VzIGluIHYyOg0KLSBDb3JyZWN0IHRoZSBkYXRlDQot
IENvcnJlY3QgdGhlIGxheW91dA0KLSBBZGQgc3BlY2lmaWMgZGV0YWlscyBmb3IgaXQncyBjb250
cmlidXRvcnMNCg0KLS0tDQpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291
eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3VzYi9vaGNpLnJzdCB8IDM4ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
MzggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAw
MDAwMDAwMDAuLjVlMzY4MzFiZjM3MA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpAQCAtMCwwICsxLDM4IEBADQorLi4g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisNCis6T3JpZ2luYWw6IERvY3VtZW50
YXRpb24vdXNiL29oY2kucnN0DQorDQorOue/u+ivkTog5qyn6Ziz5a626ZOtIEppYW1pbmcgT3V5
YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KKw0KKz09PT09PT09DQorT0hDSempseWK
qA0KKz09PT09PT09DQorDQorMjAwMuW5tDjmnIgyM+aXpQ0KKw0KK+KAnE9IQ0ktSENE4oCd6amx
5Yqo56iL5bqP5piv5LiA5LiqVVNC5Li75py65o6n5Yi25Zmo56iL5bqP77yISENE77yJ77yM5a6D
5rqQ6IeqMi405YaF5qC457O75YiX5Lit55qE4oCcdXNiLW9oY2nigJ0NCivpqbHliqjnqIvluo/j
gILigJx1c2Itb2hjaeKAneS7o+eggeS4u+imgeeUsSBSb21hbiBXZWlzc2dhZXJiZXIgPHdlaXNz
Z0B2aWVubmEuYXQ+57yW5YaZ5L2G5Lmf6I63DQor5b6X5LqG5p2l6IeqRGF2aWQgQnJvd25lbGwg
PGRicm93bmVsbEB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+77yMTGludXMgVG9ydmFsZHMNCivlkoxH
cmVnb3J5IFAuIFNtaXRo55qE5pSv5oyB44CCDQorDQor5a6D5pSv5oyB4oCc5byA5pS+5Li75py6
5o6n5Yi25Zmo5o6l5Y+j4oCd77yIT0hDSe+8ie+8jOivpeaOpeWPo+agh+WHhuWMluS6hueUqOS6
juS4jlVTQiAxLjHkuLvmnLrmjqfliLblmajpgJrkv6HnmoQNCivnoazku7blr4TlrZjlmajljY/o
rq7jgILigJzkuI7oi7HnibnlsJTml6nmnJ/nmoTigJzpgJrnlKjkuLvmnLrmjqfliLblmajmjqXl
j6PigJ3vvIhVSENJ77yJ55u45q+U77yM5a6D5bCG5pu05aSa5Y+q6IO95Yqf6IO9DQor5rOo5YWl
5Yiw56Gs5Lu25Lit44CC6Zmk6Iux54m55bCU5ZKM5aiB55ub5LmL5aSW55qE5YW25LuW5L6b5bqU
5ZWG55qEVVNCMS4x5o6n5Yi25Zmo6YCa5bi45L2/55SoT0hDSeOAgg0KKw0KK+iHqjIuNOWGheag
uOS7peadpeeahOabtOaUueWMheaLrA0KKw0KKyAgICAgICAgIC0g5o+Q6auY5LqG5YGl5aOu5oCn
OyDkv67lpI3kuobplJnor687IOWHj+WwkeS6huW8gOmUgA0KKyAgICAgICAgIC0g5pSv5oyB5pu0
5paw5ZKM566A5YyW55qEdXNiY29yZSBBUEkNCisgICAgICAgICAtIOS4reaWreS8oOi+k+WPr+S7
peabtOWkp++8jOW5tuS4lOWPr+S7peaOkumYnw0KKyAgICAgICAgIC0g6YCa6L+H5L2/55So5LiK
5bGC4oCcaGNk4oCd5qGG5p6277yM5YeP5bCR5Luj56CB6YePDQorICAgICAgICAgLSDmlK/mjIHk
uIDkupvpnZ5QQ0nnmoRPSENJ5a6e546wDQorICAgICAgICAgLSAuLi4g5Lul5Y+K5pu05aSaDQor
DQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/lpITnkIbmiYDmnIlVU0IgMS4x5Lyg6L6T57G7
5Z6L44CC5omA5pyJ57G75Z6L55qE5Lyg6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo4oCcdXNiLW9o
Y2nigJ0NCivkuK3kuZ/mmK/lpoLmraTvvIzkvYbkuK3mlq3kvKDovpPpmaTlpJbjgILku6XliY3v
vIzkvb/nlKjkuIDluKfnmoTlkajmnJ/kvJrlm6DkuLpJUlHlpITnkIbnmoTlvIDplIDogIzlr7zo
h7TmlbDmja7kuKINCivlpLHnmoTpo47pmanjgILlvZPkuK3mlq3kvKDovpPmjpLpmJ/ml7bvvIzl
j6/ku6XpgJrov4fnoa7kv53noazku7blnKjmk43kvZzns7vnu5/lpITnkIbnm7jlhbNJUlHml7bl
p4vnu4jmnInkvKDovpPpnIDopoENCivlpITnkIbvvIzmnaXmnIDlpKfpmZDluqbnmoTpmY3kvY7o
v5nkupvpo47pmanjgIINCisNCistIERhdmlkIEJyb3duZWxsDQorICA8ZGJyb3duZWxsQHVzZXJz
LnNvdXJjZWZvcmdlLm5ldD4NCisNCi0tIA0KMi41My4wDQoNCk9uIFNhdCwgU2VwIDI2LCAyMDI2
IGF0IDk6MTPigK9BTSBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZw0KPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToNCj4NCj4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMDU6Mjg6
NDdQTSArMDIwMCwgSmlhbWluZyBPdXlhbmcgd3JvdGU6DQo+ID4gU3ViamVjdDogW1BBVENIXSBk
b2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3IgdXNiL29oY2kucnN0DQo+DQo+
IFRoaXMgc2hvdWxkbid0IGJlIGluIHRoZSBlbWFpbCBib2R5IDooDQo+DQo+ID4NCj4gPiBUcmFu
c2xhdGUgRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QgaW50byBDaGluZXNlIFNpbXBsaWZpZWQu
DQo+ID4NCj4gPiBUaGUgdHJhbnNsYXRpb24gY292ZXJzIE9IQ0kgZHJpdmVyIG92ZXJ2aWV3LCBo
YXJkd2FyZSBwcm90b2NvbA0KPiA+IGRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kpLCBpbXByb3Zl
bWVudHMgc2luY2UgMi40IGtlcm5lbCwNCj4gPiBxdWV1ZWFibGUgaW50ZXJydXB0IHRyYW5zZmVy
cywgYW5kIG5vbi1QQ0kgc3VwcG9ydC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYW1pbmcg
T3V5YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+IEkgaGF2ZSBt
b2RpZmllZCBhY2NvcmRpbmcgdG8geW91ciBmZWVkYmFjaw0KPg0KPiBQbGVhc2UgcHJvdmlkZSBw
cm9wZXIgdjIgaW5mb3JtYXRpb24gYXMgdGhlIGRvY3VtZW50YXRpb24gYXNrcy4NCj4NCj4gdGhh
bmtzLA0KPg0KPiBncmVnIGstaA0K
