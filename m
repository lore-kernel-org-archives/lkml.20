Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1F132B100
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791035984; cv=pass; b=qlODA/mZy/pPu0IrpCDHWFtizlKC6oGN5uwl89IeTvyzi6pun1MEtNA17QLiQU4ybz1YjzSd/veWSdZRE0Rajpqg4A3y7twfpvObPvsm4+cQiRXSemeD3wo10eYci3yituv7o0E9ekVtYHqgyBVWmbY0XoSdC7sLoimf/WduXQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791035984; c=relaxed/simple;
	bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JsDCPJxSf5KdeHnepsu0CyZmWRnqz32ThnAQH8q3CmPcrjzkRTZYr3a1Uel3oCr3byWFU08hlJyt6K5077bYvUEps8RTrtivHAo82tb3ECaCcNBtSfEIUcabcENTQsoi/LtI40FbtAukO4gwccxCyubJWNZy20AQAddLvLUrO9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMM+lGQR; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMM+lGQR"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f1b285e934so178172b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791035982; cv=none;
        d=google.com; s=arc-20260327;
        b=fVi5DnxyeRvBRovzQSc2hlWXK+9Fpz/zuZkLrcUa+g0qsVPuPl1zlf5JdGISPobwwH
         KyJyNuE2M0k3E5rXpySjpNI1L07eqQBpA8L6i6RSGEph0B7T5wfHiAeFBJAhIh17piB8
         cy7lSqHHKfj7p7/cZJZ5p5EfWPUbRtgmO8tjuz2TO3wp8v6kw56oY4d0ybrMnLXMKvqR
         wifSHhqkPkgFdJipM1odMUkqO3nP05vQAU8vtRYKfDjN03Jwbg8bE5/y+d/5uCRnczMb
         jgde92CSJrRcM9ofdSh/UYcrHF8VqYHgYhtJkwo0KqwB9z2DDqLByDzmuTG3gFV2+7e9
         ffZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        fh=v9pueLSVXVWWqKzK0YZ4fNi+bXrAwylEjksTfjJz8eI=;
        b=E3LDYS6Ss+/UTQrZPVOqiVvZejnWbpcK8adYr8AjnpLP+ZPJpVvszmSi42kMWVNyTQ
         G7Xpt2nkVxlf/UQnjG6/D+4QsT1AhvSJv6h1QKwTIewD/q+JazZO7E0/3OjszPefRDgv
         6EmcyEx2sEccsxVubUIaSE2DuueXb2gD0kuf6Lgpx0K4LjJ54zZGbxefkgo9CtWIRPwh
         K706OmhgfkTqxg9oRRHmmD1konOgcWbNmtAW8ptYBjoTmjxntpOHrb1ejXoOJmmfkwYx
         o8ht31yDjxA7jLChUPEDI6brzHQ3pGlkeNoXWwyzuVVwFYdF2NmqlPlQ1d8DWwTcPOmY
         51Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791035982; x=1791640782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        b=tMM+lGQRjSBJum3+zv+2xexzZC5jdK67RJw+BFNwwZ83xXBTr0DcVpMptLoC4ryzpz
         cWVduvV+MPc6B65IoJ8FzbJ4gNjAhQ7vGZp8+37EsWC9Q8nOpEyLkmZmEVzMmWyoGyGD
         LV/8vVCdqdHIN8BlMAVUkRusVgsSdLGJVxl/ESKKwVtNcZ2/R9V6vf0pcv+VwztyjZUl
         KJLZIZIWCFkvbc6jSgEbe4qeaTeohyl+AmHFEFTMNSKXNIU3ZJPOYzTc98s5NOv4P5aS
         WYOAyYC1S+333D+XBBNQS/pvCp83XQO1lbUnKOInrkjUnTon+Mkr2xPGHTxwodM7TtqK
         l52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791035982; x=1791640782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RE+We5gpB0yEZFpvEPvhDPB0zlwF6sdRfR7T+1Y5KD4=;
        b=sqfYi5HBDWasUduHUx87ojszueoxW9aR/g3U2hgmxfLEg39EXLWdnfrUQCBgrrNWPo
         DCdKy30WuVk1Zllok92gjUIYymKFVLPr/nAkxpJwEtpN/vvpX9gbYl6mdAWGhEIPDse5
         tkcweCFXIpesAPSnBggt0gUfWr65yNzOhB2KzkH08nPSgopeMSZx6pwWIYOifD2Y8Rnh
         6KmVxaP7mMLg4M4kM71NlnHAawGzd+OFsvsbhn8nr/yDcz3YghHWEaRjEeOHcaFb0+sy
         1PfIO/6iI2P0DZkLmjIe9p+TijPLiDNj3XNC3wBAdCr1esIYFceu6FJt5lE0ij7Iq+6Z
         ob0Q==
X-Gm-Message-State: AFuF++nkquHrbQSm6yjEGKaZITcoGQz079TOQVxn8+S5DCxe/jDMQnIJ
	6GxJugG+TFaYOCv7r1j+d4+G6UGDnUOYb/uZShasL183wnW6DOrNv5KdI0cLcR1JsMntFRLCqdG
	srs1eF90VvwvJ5VQgjyfJ10FEzlg7zUIfaCZW
X-Gm-Gg: AYBFou111jzMyb2hX28WyUuODmK/ZNjqcMY+iNX1MHzbuWgsqumO9T/iZwTfZTpGbaS
	UIqpOzrB7k7KOp5m2x8v+F2DNwtQQiWBM/7x8eAmi6pR14S0SfDe9sr40Vd6wjyQpNNvyGihnWU
	VTg57NXIzMn1hiyC3bmKiWkZaKpe3Uk93/Jr/CpVuCJVIQCKqWCCBxoaMGxxtDxfJALAp0GAd4u
	wmW5to7+SvqBZ5pncAeldpJhvopZvtFRiZk63vCotkG7y9bcKiph8M5OTirPKGnisxdxT7K+twt
	qJPE/k8lWA93sXkH8JqvEWg1k1K19MLtMZqmAtQiRa9p7b1VY6X43EyNg84ikn0lSUgNKmg=
X-Received: by 2002:a05:6808:1a0c:b0:4d6:93e2:5bc7 with SMTP id
 5614622812f47-4f52a783a30mr4673724b6e.67.1791035982024; Sat, 03 Oct 2026
 06:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 3 Oct 2026 15:59:30 +0200
X-Gm-Features: AclHuK9__NQxZ2YT_5UZ36KsZGoMUWudG4sEGF5oj_dlmf4ZQ-Z_OdgrJ9lmJ4U
Message-ID: <CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com>
Subject: [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net, 
	Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rdunlap@infradead.org
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
