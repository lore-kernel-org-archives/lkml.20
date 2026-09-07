Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CFA43A806
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771060; cv=pass; b=TqLWmB9T0yBezqOAyYt9eKG9lVxZAu9WXYpioQo18igR6a416rSZVWSirc4j+hhazkgiB250CbqKBpBCXiBRPxy06grGD7xyRuUXmW3u2W8eVng0GhwhNsf6O+QX1mBaZN8txgwMthDSBRy6QMGg4YUW41XDaEOflA5vHTk6rFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771060; c=relaxed/simple;
	bh=koPdY52LnC6fAIdACWkN29i6GoQ1Taayy64LhpC53Ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZadDaLjG4BZZIFFPcHMTaGTRK7yIPEf/hamyr/nbgnxNuKy7pKZOyWlse92tTmfCmDSV9Mx/yDLM8LU0xPSxK71XKrGsEIWnN+UDYi1lIcjDTHPHlhzSKLu21SD2vSqUfK5nVHRIRpAInf0UHUoLtxz3W5E2EQ9CgVoEcHK7MAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra86+6ad; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra86+6ad"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6acc74fef22so1465796eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788771057; cv=none;
        d=google.com; s=arc-20260327;
        b=POOo7lz0i+Uy/6neOpOmGYp8yyWbRHFHIcKcaywBsxeNYqWduESONKWFr6Hs33Kk3D
         qlo8Fsi8qeqfVhHO5NzV6XgGG57oMCEMZl5J+qCsejHGddHdOV7mHEGLEw2tMpxpobwe
         ILb9WwYNR3HNLJ9qjpqTuYcsX3XRwMU+162EiDI7VQCkkLkJs3lXkTPNJXFAhodLfAiB
         W1DmH+42lJ+kdJE+LiLpKrEhdq51acx5erllpFyUKsMadx77Lw2EpaX9sjgIVpoWRaJu
         r0BbDUx/tRbCh19UANLZw/qWcELBjM3qOaoAV+SPEz0pxlKtnuZisddUjhJgo55uIwlT
         VS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=koPdY52LnC6fAIdACWkN29i6GoQ1Taayy64LhpC53Ws=;
        fh=uJRje2O8EPeJab/Z4fYwMF/eNW9sEqqFOXmDu4F8G54=;
        b=TnO/eP2ozWrx7fqUhXDVO1i36hv81KMTd17RJzkdVMGmtvHOAUCFl4MTV3M1kQFPoR
         FcTbdSoxggHtFeXpTEwMgvxsdB/m08tZoSyfGv5p7pHlu0l/aleFTKVNjGISe25DEGV4
         mcp5G5DPxxhL1WIq4zvKPFqmHe65YzYnVGGY1+zUkctZMIbZ6oX9hgVs4DH7F0S7kIB0
         QYb371Rf1/K2WW5djVk+L0X8g6qhrCSQ6Z+6Jqw8ktcyoIUqVvpTpOXfxNj6FMH7w7BD
         R0ZWFXnbIEjL3PklUrNTW6/ECdOanUKxWw+kzfv+EdYNjNQqXtAoVK6XHsUkEf7X+Xoi
         1K2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771057; x=1789375857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koPdY52LnC6fAIdACWkN29i6GoQ1Taayy64LhpC53Ws=;
        b=Ra86+6adkW3dNRKa4eDEj4BPNxzh3h+LDlkKiuGjjkkQ/kaLZxbREQ48T+dftXuOK8
         zxOuGbyfFfxyoPMEgy7+lBaNGTtIS0UsAeFxGqxe/UqZXnI9by6BMKIF3H/G4tH2rK2H
         iKOoID+zdN2jYSi1nTFmWsmdagUmDUNN+oLDv91UTKuHlWkIFDmP1DokmA0sWsC6x7Nn
         EDyjRvHeMjeMQzHCmkLkdWbFVMl6x8k/q7I9OhHoxJgbEZxzr1pBu3shl4oGK+5Op/bT
         /seGF60RPF5BUAbhb4hjVQaSbnvYJEKyQXsa1WTUwkNKrdPaEj1WqhgSxY6wu3tOEMpo
         hsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771057; x=1789375857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koPdY52LnC6fAIdACWkN29i6GoQ1Taayy64LhpC53Ws=;
        b=N/ayPdSbZRU4vrkCKO4GKelL6Bs7S2Q9L1iChnjks/8wYaWTWPcMgHoaVDehykHL7v
         3FLnEIOiii+/kkk2WEB5oNWlSmm42Ym5OxmNYPiqUrxOtA4QHNU/LRuTrFwBgrfCpZiI
         CIj5HeRqerx9MP/f/Nr1xre3l4Xm6BL1A0CAseY7RonCfa5Kr9Ppzp20gKINRSuGY8DC
         Xneq9L/nYjrrgxVTaT9VaJTyyApJgU1OBwDcK5bRWVR9EKOQVlFe1Ms/jNASL9MDMibl
         LhcDgSr+wPzYypVen3voWuQRfI0ZjhtF/jHXoviKZarOQMiT3UbnOoJm86HcqdjJOT/m
         FuUg==
X-Forwarded-Encrypted: i=1; AKwUvBzMJf7yh4kdIo06I/c9S5obYq8Fti3JMXlzBe1qe/jz9XdOffDcXLlVq8Vx2fz5JXd0nMZ77Qtk950yxU4=@vger.kernel.org
X-Gm-Message-State: AFuF++nz8DYXJMRsmuEAp9RWNRkZBLTcQCgCOV0Rcx2wrziy5tFEwoE1
	9FFbIV79PRGnuVFKfW2BgG0zDJSgWI2X+vjF1nyU6X1YyAN6ScNuSv25OAiz6tuWMtv2YSSzQVf
	Y+5LfN9YqrzXt2OO6IjTZx2u+gvdI2js=
X-Gm-Gg: AYBFou3U4JikTAZu7q0dm499OjQ721Db9ssezBTrD50IyCG5+owIxK+GDQGM/fimJjh
	x+ePbxX3NxPny1pBimFDkA9yrSTKC9i0oaS+k42ePXlkofzVXEXMcI73rB0X+9guFx9IMRw5hn8
	yyGNAfwf2MDHHVFJ6ZIayb41nJ31nVOBcqo1E2X/9EfH4RtQmDAoZFmoh+iDfXrZfxllzgGfcXC
	k6hQDKZ8jWhuMjZC1BEm84qi4nbRz9ccBASUzr0j5Dl6FyEQM+beYKijxuCS0e28K8IPWqbaPZN
	qnhxYxtwy43fGvKIF2DFwIdpa6E4v4/m+XziZCXpDq0G
X-Received: by 2002:a05:6820:81e:b0:6b1:afca:5c78 with SMTP id
 006d021491bc7-6b6fddba8bbmr12716316eaf.32.1788771054674; Mon, 07 Sep 2026
 01:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
 <df3d1c27-2de5-4e63-8a4d-6119d19a358f@gmail.com>
In-Reply-To: <df3d1c27-2de5-4e63-8a4d-6119d19a358f@gmail.com>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Mon, 7 Sep 2026 10:50:43 +0200
X-Gm-Features: AcwNN1VlrMgKnfn4eUYD_bXkleWDU8BJsjeskHBSGqosCOpXXEqnb03v8mQLrjo
Message-ID: <CAMnqnYxarwJ1MaW-HX-bJmPvok+xugn7V0-u2cGp+FeXPz69rA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
To: Alex Shi <seakeel@gmail.com>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>, alexs@kernel.org, 
	si.yanteng@linux.dev, dzm91@hust.edu.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

U3ViamVjdDogW1BBVENIXSBkb2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3Ig
dXNiL29oY2kucnN0DQoNClRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdCBpbnRv
IENoaW5lc2UgU2ltcGxpZmllZC4NCg0KVGhlIHRyYW5zbGF0aW9uIGNvdmVycyBPSENJIGRyaXZl
ciBvdmVydmlldywgaGFyZHdhcmUgcHJvdG9jb2wNCmRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kp
LCBpbXByb3ZlbWVudHMgc2luY2UgMi40IGtlcm5lbCwNCnF1ZXVlYWJsZSBpbnRlcnJ1cHQgdHJh
bnNmZXJzLCBhbmQgbm9uLVBDSSBzdXBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91
eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KSSBoYXZlIG1vZGlmaWVkIGFj
Y29yZGluZyB0byB5b3VyIGZlZWRiYWNrLg0KDQogLi4uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Iv
aW5kZXgucnN0ICAgICAgICAgIHwgIDIgKy0NCiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi91c2Ivb2hjaS5yc3QgfCAzNyArKysrKysrKysrKysrKysrKysrDQogMiBmaWxlcyBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KDQpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdA0KYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQppbmRleCBkZjk5
ODE0YzY0OTcuLmM5NmVhY2YxM2UxMSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3VzYi9pbmRleC5yc3QNCkBAIC0zMiw2ICszMiw3IEBAIFVTQiDmlK/mjIENCiAg
ICAgY2hpcGlkZWENCiAgICAgZHdjMw0KICAgICBlaGNpDQorICAgIG9oY2kNCiAgICAgdXNibW9u
DQoNCiDlvoXnv7vor5HmlofmoaPvvJoNCkBAIC00OSw3ICs1MCw2IEBAIFVTQiDmlK/mjIENCiAq
IG1hc3Mtc3RvcmFnZQ0KICogbWlzY191c2JzZXZzZWcNCiAqIG10b3VjaHVzYg0KLSogb2hjaQ0K
ICogcmF3LWdhZGdldA0KICogdXNiaXBfcHJvdG9jb2wNCiAqIHVzYi1zZXJpYWwNCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCmIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi4xZmMwNmYwMWQ3ZTgNCi0tLSAvZGV2L251bGwN
CisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KQEAg
LTAsMCArMSwzNyBAQA0KKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorDQor
Ok9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdA0KKw0KKzrnv7vor5E6IOasp+mY
s+WutumTrSBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCisNCis9
PT09PT09PQ0KK09IQ0npqbHliqgNCis9PT09PT09PQ0KKw0KKzIwMjblubQ45pyIMjnml6UNCisN
CivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+aYr+S4gOS4qlVTQuS4u+acuuaOp+WItuWZqOmp
seWKqOeoi+W6j++8iEhDRO+8ie+8jOWug+a6kOiHqjIuNOWGheaguOezu+WIl+S4reeahOKAnHVz
Yi1vaGNp4oCdDQor6amx5Yqo56iL5bqP44CC4oCcdXNiLW9oY2nigJ3ku6PnoIHkuLvopoHnlLEg
Um9tYW4gV2Vpc3NnYWVyYmVyIDx3ZWlzc2dAdmllbm5hLmF0PiDnvJblhpnvvIzkvYbkuZ/ojrfl
vpfkuoYNCivorrjlpJrlhbbku5bkurrnmoTotKHnjK7vvIjor7fpmIXor7vlhbbniYjmnYPvvIkN
CivjgIINCisNCivlroPmlK/mjIHigJzlvIDmlL7kuLvmnLrmjqfliLblmajmjqXlj6PigJ3vvIhP
SENJ77yJ77yM6K+l5o6l5Y+j5qCH5YeG5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4u+acuuaOp+WI
tuWZqOmAmuS/oeeahOehrOS7tuWvhA0KK+WtmOWZqOWNj+iuruOAguS4juiLseeJueWwlOaXqeac
n+eahOKAnOmAmueUqOS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzl
roPlsIbmm7TlpJrlj6rog73lip/og73ms6jlhaXliLDnoazku7YNCivkuK3jgILpmaToi7Hnibnl
sJTlkozlqIHnm5vkuYvlpJbnmoTlhbbku5bkvpvlupTllYbnmoRVU0IxLjHmjqfliLblmajpgJrl
uLjkvb/nlKhPSENJ44CCDQorDQor6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS55YyF5ousDQor
DQorIC0g5o+Q6auY5LqG5YGl5aOu5oCnOyDkv67lpI3kuobplJnor687IOWHj+WwkeS6huW8gOmU
gA0KKyAtIOaUr+aMgeabtOaWsOWSjOeugOWMlueahHVzYmNvcmUgQVBJDQorIC0g5Lit5pat5Lyg
6L6T5Y+v5Lul5pu05aSn77yM5bm25LiU5Y+v5Lul5o6S6ZifDQorIC0g6YCa6L+H5L2/55So5LiK
5bGC4oCcaGNk4oCd5qGG5p6277yM5YeP5bCR5Luj56CB6YePDQorIC0g5pSv5oyB5LiA5Lqb6Z2e
UENJ55qET0hDSeWunueOsA0KKyAtIC4uLiDku6Xlj4rmm7TlpJoNCisNCivigJxPSENJLWhjZOKA
nempseWKqOeoi+W6j+WkhOeQhuaJgOaciVVTQiAxLjHkvKDovpPnsbvlnovjgILmiYDmnInnsbvl
novnmoTkvKDovpPpg73lj6/ku6XmjpLpmJ/jgILlnKjigJx1c2Itb2hjaeKAneS4reS5nw0KK+aY
r+WmguatpO+8jOS9huS4reaWreS8oOi+k+mZpOWkluOAguS7peWJje+8jOS9v+eUqOS4gOW4p+ea
hOWRqOacn+S8muWboOS4uklSUeWkhOeQhueahOW8gOmUgOiAjOWvvOiHtOaVsOaNruS4ouWkseea
hOmjjumZqeOAgg0KK+W9k+S4reaWreS8oOi+k+aOkumYn+aXtu+8jOWPr+S7pemAmui/h+ehruS/
neehrOS7tuWcqOaTjeS9nOezu+e7n+WkhOeQhuebuOWFs0lSUeaXtuWni+e7iOacieS8oOi+k+mc
gOimgeWkhOeQhu+8jOadpeacgOWkp+mZkA0KK+W6pueahOmZjeS9jui/meS6m+mjjumZqQ0KKw0K
Ky0gRGF2aWQgQnJvd25lbGwNCisgIDxkYnJvd25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0K
LS0gDQoyLjUzLjANCg0KT24gTW9uLCBTZXAgNywgMjAyNiBhdCA0OjM34oCvQU0gQWxleCBTaGkg
PHNlYWtlZWxAZ21haWwuY29tPiB3cm90ZToNCj4NCj4NCj4NCj4gT24gMjAyNi84LzMwIDAyOjQ4
LCBKaWFtaW5nIE91eWFuZyB3cm90ZToNCj4gPiAgRnJvbSAzOTU5NDgyMTIxNDQ1NDllMjBjZmNk
YmQwNTM4MTdjNGUwNjhkYTM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiA+IEZyb206IEpp
YW1pbmcgT3V5YW5nPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQo+ID4gRGF0ZTogU2F0LCAy
OSBBdWcgMjAyNiAyMDozNTozNyArMDIwMA0KPiA+IFN1YmplY3Q6IFtQQVRDSF0gZG9jcy96aF9D
TjogYWRkIHVzYi9vaGNpIHRyYW5zbGF0aW9uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFt
aW5nIE91eWFuZzxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4u
L3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0ICAgICAgICAgIHwgIDIgKy0NCj4gPiAg
IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdCB8IDM3ICsrKysr
KysrKysrKysrKysrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCj4gPiBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCj4gPiBpbmRleCBkZjk5ODE0
YzY0OTcuLmM5NmVhY2YxM2UxMSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdA0KPiA+IEBAIC0zMiw2ICszMiw3IEBAIFVTQiDm
lK/mjIENCj4gPiAgICAgICBjaGlwaWRlYQ0KPiA+ICAgICAgIGR3YzMNCj4gPiAgICAgICBlaGNp
DQo+ID4gKyAgICBvaGNpDQo+ID4gICAgICAgdXNibW9uDQo+ID4NCj4gPiAgIOW+hee/u+ivkeaW
h+aho++8mg0KPiA+IEBAIC00OSw3ICs1MCw2IEBAIFVTQiDmlK/mjIENCj4gPiAgICogbWFzcy1z
dG9yYWdlDQo+ID4gICAqIG1pc2NfdXNic2V2c2VnDQo+ID4gICAqIG10b3VjaHVzYg0KPiA+IC0q
IG9oY2kNCj4gPiAgICogcmF3LWdhZGdldA0KPiA+ICAgKiB1c2JpcF9wcm90b2NvbA0KPiA+ICAg
KiB1c2Itc2VyaWFsDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3VzYi9vaGNpLnJzdA0KPiA+IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vdXNiL29oY2kucnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjQzODdiYjI3NDA3MQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCj4gPiBAQCAtMCwwICsx
LDM3IEBADQo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKw0K
PiA+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdXNiL29oY2kucnN0DQo+ID4gKw0KPiA+ICs6
57+76K+ROiDmrKfpmLPlrrbpk60gSmlhbWluZyBPdXlhbmc8amlhbWluZ291eWFuZzEzQGdtYWls
LmNvbT4NCj4gPiArDQo+ID4gKz09PT09PT09DQo+ID4gK09IQ0npqbHliqgNCj4gPiArPT09PT09
PT0NCj4gPiArDQo+ID4gKzIwMjblubQ45pyIMjnml6UNCj4gPiArDQo+ID4gK+KAnE9IQ0ktaGNk
4oCd6amx5Yqo56iL5bqP5piv5LiA5LiqVVNC5Li75py65o6n5Yi25Zmo6amx5Yqo56iL5bqP77yI
SENE77yJ77yM5a6D5rqQ6IeqMi405YaF5qC457O75YiX5Lit55qE4oCcdXNiLW9oY2nigJ0NCj4g
PiAr6amx5Yqo56iL5bqP44CC4oCcdXNiLW9oY2nigJ3ku6PnoIHkuLvopoHnlLEgUm9tYW4gV2Vp
c3NnYWVyYmVyPHdlaXNzZ0B2aWVubmEuYXQ+IOe8luWGme+8jOS9huS5n+iOt+W+l+S6hg0KPiA+
ICvorrjlpJrlhbbku5bkurrnmoTotKHnjK7vvIjor7fpmIXor7vlhbbniYjmnYPvvIkNCj4gPiAr
44CCDQo+ID4gKw0KPiA+ICvlroPmlK/mjIHigJzlvIDmlL7kuLvmnLrmjqfliLblmajmjqXlj6Pi
gJ3vvIhPSENJ77yJ77yM6K+l5o6l5Y+j5qCH5YeG5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4u+ac
uuaOp+WItuWZqOmAmuS/oeeahOehrOS7tuWvhA0KPiA+ICvlrZjlmajljY/orq7jgILkuI7oi7Hn
ibnlsJTml6nmnJ/nmoTigJzpgJrnlKjkuLvmnLrmjqfliLblmajmjqXlj6PigJ3vvIhVSENJ77yJ
55u45q+U77yM5a6D5bCG5pu05aSa5Y+q6IO95Yqf6IO95rOo5YWl5Yiw56Gs5Lu2DQo+ID4gK+S4
reOAgumZpOiLseeJueWwlOWSjOWogeebm+S5i+WklueahOWFtuS7luS+m+W6lOWVhueahFVTQjEu
MeaOp+WItuWZqOmAmuW4uOS9v+eUqE9IQ0njgIINCj4gPiArDQo+ID4gK+iHqjIuNOWGheaguOS7
peadpeeahOabtOaUueWMheaLrA0KPiA+ICsNCj4gPiArIC0g5o+Q6auY5LqG5YGl5aOu5oCnOyDk
v67lpI3kuobplJnor687IOWHj+WwkeS6huW8gOmUgA0KPiA+ICsgLSDmlK/mjIHmm7TmlrDlkozn
roDljJbnmoR1c2Jjb3JlIEFQSQ0KPiA+ICsgLSDkuK3mlq3kvKDovpPlj6/ku6Xmm7TlpKfvvIzl
ubbkuJTlj6/ku6XmjpLpmJ8NCj4gPiArIC0g6YCa6L+H5L2/55So5LiK5bGC4oCcaGNk4oCd5qGG
5p6277yM5YeP5bCR5Luj56CB6YePDQo+ID4gKyAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nl
rp7njrANCj4gPiArIC0gLi4uIOS7peWPiuabtOWkmg0KPiA+ICsNCj4gPiAr4oCcT0hDSS1oY2Ti
gJ3pqbHliqjnqIvluo/lpITnkIbmiYDmnIlVU0IgMS4x5Lyg6L6T57G75Z6L44CC5omA5pyJ57G7
5Z6L55qE5Lyg6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo4oCcdXNiLW9oY2nigJ3kuK3kuZ8NCj4g
PiAr5piv5aaC5q2k77yM5L2G5Lit5pat5Lyg6L6T6Zmk5aSW44CC5Lul5YmN77yM5L2/55So5LiA
5bin55qE5ZGo5pyf5Lya5Zug5Li6SVJR5aSE55CG55qE5byA6ZSA6ICM5a+86Ie05pWw5o2u5Lii
5aSx55qE6aOO6Zmp44CCDQo+ID4gK+W9k+S4reaWreS8oOi+k+aOkumYn+aXtu+8jOWPr+S7pemA
mui/h+ehruS/neehrOS7tuWcqOaTjeS9nOezu+e7n+WkhOeQhuebuOWFs0lSUeaXtuWni+e7iOac
ieS8oOi+k+mcgOimgeWkhOeQhu+8jOadpeacgOWkp+mZkA0KPiA+ICvluqbnmoTpmY3kvY7ov5nk
upvpo47pmakNCj4gPiArDQo+ID4gKy0g5qyn6Ziz5a626ZOtIEppYW1pbmcgT3V5YW5nDQo+ID4g
KzxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KPg0KPiBUaGlzIHNpZ25hdHVyZSBtaWdodCBt
aXNsZWFkIHBlb3BsZSBpbnRvIHRoaW5raW5nIHlvdSBhcmUgdGhlIGF1dGhvci4NCj4NCj4gUGxl
YXNlIGtlZXAgdGhlIG9yaWdpbmFsIGF1dG9yOg0KPiAtIERhdmlkIEJyb3duZWxsDQo+ICAgIDxk
YnJvd25lbGxAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KPiAgID4gLS0gMi41My4wDQo+ID4NCj4N
Cg==
