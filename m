Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2AE3F871B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852108; cv=pass; b=uZUHg3F8oJI/6/zZGGpKJQky0n89sftYyKHOHoU8kuUI7NioPY7u7LObWTMkxUSnc5Z9zusdNgJ4nOcDlpIMmy3C+0iqruTSe6Sz2yfv5gc35/G5vMeXTm3OUMI32q44XxqWxokO6h0G2GfqhoNzhAYjb3WFraKF1OPvOSekFhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852108; c=relaxed/simple;
	bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r3Yy6PPYKXRb4XEm++85bej62Owp9crfT+CzF589OwLp2ZyJNSd3kt2zSzxHH40JJSVt5afdSMc5yzLWLQgeq1cbRcZAe2/mEoOYKBOeWVXL6YW6rF1UXHmD/IhG1hrczavGucVlEd/u1VAZz1/An/VvA+1/2OXtv6noUPCwEcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4rKkSpD; arc=pass smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4rKkSpD"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-4881ca701a4so3313243fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852102; cv=none;
        d=google.com; s=arc-20260327;
        b=QFY5YuIVi6HeSBz2YSA34DdC3apF/LvC0Ov9ib5Vy78/f26pN9e8hXMm0PXras9Jyv
         e0utn3pC0BCPT7mH2dJ1TQlC0nJ6xAtoBYNf6teRNOVRWKhzngMZAzpq/Jrj1JmQg7lc
         c9eujT6+BUepy15D4oe/XA8n0hY28Qld2HL7Osf6/q3XXBYmyIJQr6vk2L+ZCin2sTsn
         dReWKQ0V71VH082+6qJNp88OiAB/q5J9URWzeZaav0prJl/cw1HGF89FryrztaJlRNO+
         9Z19GhVCcc0aa0tGFBQb6B5r98BqTHidDoSkKlrSj+/f0vNAown+VmxEpKH4m3EIvkJm
         wOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        fh=vcTmNfTNKe22/1VHQsbEcHkP2cN1Y6AsRGrlvbyJrOg=;
        b=nI0j71eSYIM01+vJGmp0YLTaRiC+w5x1u71AdaQyh0yhaM+LdlDci7pWrwZINtee6I
         ZO2asRJYBHjhYJ5l1sxMfFQ37gL1bBAJe70IAAZ42E/YaQwhVBYq8w55O+HilAV1hi6T
         4b+tINdZ9MDmWYxnMwmFM6rRGCZNHzWNG4Llr9UhBlJf2XO/NwSvaD7K7vU7s4lZ4NgR
         TNTa3DYvzP+/ccHB5BF9DXrUa8Kc2wSLxlsk6kM1D9gKzW6osFR8RfzbViBWjLFSpXOq
         J5d9pwR2oivjpdJs4jGvei95pPDrCdHfJ6VmQeiVM8uQwBPFlyuMBUcaNbu2cCrPPEbX
         Jdtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852102; x=1791456902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        b=b4rKkSpDtDsl0IH/4cGgGxf866ftxTY3ApnpOmN4pCmYNlAb7e7yL4mPUsh+Icz5ch
         m+nldH5//kFhNyaCdsIQ+OS4JKh3QpWAzFnohkQU5g21GdX3IRgbu46k4XwlzBuehToR
         KzJJfOO6R298J56wrErcpimzOYhR+sfimy/iNCmIBbcrn8Umip8Qh1Xh+dwwpO4TiSVD
         Gph38BWPehTX/+u0UNhAvhBLC4O67mJiZAV0p0pA2Z4y6cEN607aTf1K4zzoIdFAuLSg
         0QExlgY6yx1TI1hpAFiuBuMc1MSoQKjrGBX4pV7Xgg2NRAtfhsrz2SHRLZlDRfrB0/9M
         vsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852102; x=1791456902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        b=u6+1S3+PO0zbHdmR5nMgbYP3q8kpo5OZCob7icGv1snRXCSMG7dtPKmCQ0VEupp+/3
         510Ra4x2tRz7bzLFNSfAhqTFCTMctrhOEOW18qFCPBkfdyI4aJ12pmo8zOI8gOxyfvYZ
         3yjNz0307BhbD/aBX8+FJGFouLV3e64az04Ej9slgE5Dbhz4T+Y5lrcKOLJpQ2k/8c2z
         2dVs8njAAkHjqIfId80V1P33gbEQVZ+bmTmASZ01WJz9UMVyQQcf9IEX4cS5rKYKFGsZ
         mUldtEc9ZCZnlPI2hX8nprmO73ZSorGXQUWaeL2pFNd/PY9HpoXF4kL5/rGCSGkik41x
         k1pw==
X-Forwarded-Encrypted: i=1; AKwUvBwKnZBbxMrniL0hosCUIhowX9TO3M3YgPcQsczFbNpVHgzRuWoZldLMZpuM/Voe/7qPl5WWyswv3KETo8A=@vger.kernel.org
X-Gm-Message-State: AFuF++miLJPF2XtqjKS9W7R4t8mvY1XhaOw3oEM+juNlfEfJxqUGmF9f
	ndkMbs3kEHJ5sw5M+fqn5k1ZeCBxE4JikXKPv10z6F3pwe2OAnQ/TaKDFZ22w8VuhHZNi7sOW/L
	fo4pdrctfVw8vx1O32EaXrvVK7mkDQ5EJ/RV2
X-Gm-Gg: AYBFou1E3ug2M00LvyaXjkRlmGdTjOWhQ3XtRtLnZ7D7w59OdWjdkmWhz3oqRfl2wCB
	XLei8YwpBLBi0NUH23yDTPlwriC722NHQMRfz7wEz0Kr7Hbk2F5jo/j9RaTMSOY8JKuepC0RAbS
	YUxfdps1+U9sU7NeAb8qlMMPDX2xp3re5q8tsw4ULExX9sDIYQ5HgzhCZRiZVPEPou5LEkfqT3S
	Md7l7o4HMeoYc+/K9L4Q+Ikpao7/OCg0WeOs6iwEQu+hChNmzbdVZTCiPDQYwOpcx//wZe5/9pc
	yd4oRv7edJiR0w1jhIPyNg6LIbhKV4bs5MTTrMIaoraZ5h8kVnnSGWo=
X-Received: by 2002:a05:6808:c1ef:b0:4b9:a88b:888c with SMTP id
 5614622812f47-4f1b64a6ef5mr4765837b6e.34.1790852101873; Thu, 01 Oct 2026
 03:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Thu, 1 Oct 2026 12:54:50 +0200
X-Gm-Features: AclHuK8AuvSeIEDvFdVXJ1BcDoYuYJK_4LwuepSYvn8RQjOTdj5yZPKZ_GGJBTc
Message-ID: <CAMnqnYxWj7jFKcgekEXoq0EP-7g6mST6yqoU5DRhsHCkhfaGJg@mail.gmail.com>
Subject: [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alexs@kernel.org, corbet@lwn.net, Dongliang Mu <dzm91@hust.edu.cn>, 
	si.yanteng@linux.dev, skhan@linuxfoundation.org, gregkh@linuxfoundation.org, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VHJhbnNsYXRlIERvY3VtZW50YXRpb24vdXNiL29oY2kucnN0IGludG8gQ2hpbmVzZSBTaW1wbGlm
aWVkLg0KDQpUaGUgdHJhbnNsYXRpb24gY292ZXJzIE9IQ0kgZHJpdmVyIG92ZXJ2aWV3LCBoYXJk
d2FyZSBwcm90b2NvbA0KZGlmZmVyZW5jZXMgKE9IQ0kgdnMgVUhDSSksIGltcHJvdmVtZW50cyBz
aW5jZSAyLjQga2VybmVsLA0KcXVldWVhYmxlIGludGVycnVwdCB0cmFuc2ZlcnMsIGFuZCBub24t
UENJIHN1cHBvcnQuDQoNClNpZ25lZC1vZmYtYnk6IEppYW1pbmcgT3V5YW5nIDxqaWFtaW5nb3V5
YW5nMTNAZ21haWwuY29tPg0KLS0tDQoNCkNoYW5nZXMgaW4gdjM6DQotIENvcnJlY3QgdGhlIGRv
Y3MgbGlzdCBpbiBpbmRleC5yc3QNCi0tLQ0KIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2lu
ZGV4LnJzdCAgICAgICAgICB8ICAyICstDQogRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vdXNiL29oY2kucnN0IHwgMzggKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCmIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdA0KaW5kZXggZGY5OTgx
NGM2NDk3Li5jOTZlYWNmMTNlMTEgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi91c2IvaW5kZXgucnN0DQpAQCAtMzIsNiArMzIsNyBAQCBVU0Ig5pSv5oyBDQogICAg
IGNoaXBpZGVhDQogICAgIGR3YzMNCiAgICAgZWhjaQ0KKyAgICBvaGNpDQogICAgIHVzYm1vbg0K
DQog5b6F57+76K+R5paH5qGj77yaDQpAQCAtNDksNyArNTAsNiBAQCBVU0Ig5pSv5oyBDQogKiBt
YXNzLXN0b3JhZ2UNCiAqIG1pc2NfdXNic2V2c2VnDQogKiBtdG91Y2h1c2INCi0qIG9oY2kNCiAq
IHJhdy1nYWRnZXQNCiAqIHVzYmlwX3Byb3RvY29sDQogKiB1c2Itc2VyaWFsDQpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uNWUzNjgzMWJmMzcwDQotLS0gL2Rldi9udWxsDQor
KysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCkBAIC0w
LDAgKzEsMzggQEANCisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKw0KKzpP
cmlnaW5hbDogRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QNCisNCis657+76K+ROiDmrKfpmLPl
rrbpk60gSmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQorDQorPT09
PT09PT0NCitPSENJ6amx5YqoDQorPT09PT09PT0NCisNCisyMDAy5bm0OOaciDIz5pelDQorDQor
4oCcT0hDSS1IQ0TigJ3pqbHliqjnqIvluo/mmK/kuIDkuKpVU0LkuLvmnLrmjqfliLblmajnqIvl
uo/vvIhIQ0TvvInvvIzlroPmupDoh6oyLjTlhoXmoLjns7vliJfkuK3nmoTigJx1c2Itb2hjaeKA
nQ0KK+mpseWKqOeoi+W6j+OAguKAnHVzYi1vaGNp4oCd5Luj56CB5Li76KaB55SxIFJvbWFuIFdl
aXNzZ2FlcmJlciA8d2Vpc3NnQHZpZW5uYS5hdD7nvJblhpnkvYbkuZ/ojrcNCivlvpfkuobmnaXo
h6pEYXZpZCBCcm93bmVsbCA8ZGJyb3duZWxsQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD7vvIxMaW51
cyBUb3J2YWxkcw0KK+WSjEdyZWdvcnkgUC4gU21pdGjnmoTmlK/mjIHjgIINCisNCivlroPmlK/m
jIHigJzlvIDmlL7kuLvmnLrmjqfliLblmajmjqXlj6PigJ3vvIhPSENJ77yJ77yM6K+l5o6l5Y+j
5qCH5YeG5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4u+acuuaOp+WItuWZqOmAmuS/oeeahA0KK+eh
rOS7tuWvhOWtmOWZqOWNj+iuruOAguKAnOS4juiLseeJueWwlOaXqeacn+eahOKAnOmAmueUqOS4
u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzlroPlsIbmm7TlpJrlj6ro
g73lip/og70NCivms6jlhaXliLDnoazku7bkuK3jgILpmaToi7HnibnlsJTlkozlqIHnm5vkuYvl
pJbnmoTlhbbku5bkvpvlupTllYbnmoRVU0IxLjHmjqfliLblmajpgJrluLjkvb/nlKhPSENJ44CC
DQorDQor6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS55YyF5ousDQorDQorICAgICAgICAgLSDm
j5Dpq5jkuoblgaXlo67mgKc7IOS/ruWkjeS6humUmeivrzsg5YeP5bCR5LqG5byA6ZSADQorICAg
ICAgICAgLSDmlK/mjIHmm7TmlrDlkoznroDljJbnmoR1c2Jjb3JlIEFQSQ0KKyAgICAgICAgIC0g
5Lit5pat5Lyg6L6T5Y+v5Lul5pu05aSn77yM5bm25LiU5Y+v5Lul5o6S6ZifDQorICAgICAgICAg
LSDpgJrov4fkvb/nlKjkuIrlsYLigJxoY2TigJ3moYbmnrbvvIzlh4/lsJHku6PnoIHph48NCisg
ICAgICAgICAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nlrp7njrANCisgICAgICAgICAtIC4u
LiDku6Xlj4rmm7TlpJoNCisNCivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+WkhOeQhuaJgOac
iVVTQiAxLjHkvKDovpPnsbvlnovjgILmiYDmnInnsbvlnovnmoTkvKDovpPpg73lj6/ku6XmjpLp
mJ/jgILlnKjigJx1c2Itb2hjaeKAnQ0KK+S4reS5n+aYr+WmguatpO+8jOS9huS4reaWreS8oOi+
k+mZpOWkluOAguS7peWJje+8jOS9v+eUqOS4gOW4p+eahOWRqOacn+S8muWboOS4uklSUeWkhOeQ
hueahOW8gOmUgOiAjOWvvOiHtOaVsOaNruS4og0KK+WkseeahOmjjumZqeOAguW9k+S4reaWreS8
oOi+k+aOkumYn+aXtu+8jOWPr+S7pemAmui/h+ehruS/neehrOS7tuWcqOaTjeS9nOezu+e7n+Wk
hOeQhuebuOWFs0lSUeaXtuWni+e7iOacieS8oOi+k+mcgOimgQ0KK+WkhOeQhu+8jOadpeacgOWk
p+mZkOW6pueahOmZjeS9jui/meS6m+mjjumZqeOAgg0KKw0KKy0gRGF2aWQgQnJvd25lbGwNCisg
IDxkYnJvd25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KKw0KLS0gDQoyLjUzLjANCg==
