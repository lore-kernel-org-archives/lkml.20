Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7363B4CCDD5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703153; cv=pass; b=P8Wxj0PQ5XadBllIvacUUUh1oUejgvtlAVbzAL2nQLs93TJbSryDnSDgh1L2DXiYUSRQK35aXKE1BXKU3xDZL4EdEcI1s06r3aixj+aaIFwlaOk7sPk+TsMFNWz91gdv1YzEr7BwrQ0mqW0b53dE+ORSsOw6T4RuyyjT2Jks33s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703153; c=relaxed/simple;
	bh=q4im8T6krvAgeClrNJp91WX4LU1MUPcEO8GSV5Jt9rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkGt4D1ywHQpc05+CTvDpwe2Di2ZdKcv9qc1O9gdgzQwytM3cbq262mTtXuiMlYuvyh0q0djRR7/N4ucWE5oJ/x4PYRkdYiAWOcUgv+FBNEGbOOKTZg6VUG5tkKOsqOUiiT8UQRjqfK+nnHk5jRU7ZnvFbG2sSgTncuEKnXEppo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifI0VEcq; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifI0VEcq"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4e1568932so2365846a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788703151; cv=none;
        d=google.com; s=arc-20260327;
        b=XjgTM/OoHYwclqSJo3sz5qjj3VDkeJeF7sODNN//MqzIc11qjGJu491g/RlYEJqLru
         8InLWMCaZ+b89kMgqmPcApA1CucRZwc82vj3hHr2K9BkHxTb3pt2hHSZrUezBy4OG7rO
         BxDf/sc35jhhaKPnaz3h4cg76sIQ0u998J9JROthPCTV49RlMBBZpU7zlNwpye/yvg3x
         4AMk6oWiz1fxF3NFPxCpzkO0MIc52A5hZ43nsETlU5ZB8oVFmwfBat9pNMMDcUgUIEXn
         1Kurd+p70bEDdfxYZsNx/khzKGHBqEXWjHzSOuS2XPZUmXu6VHQg4WnLTE3iPh0o1xtz
         zWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4im8T6krvAgeClrNJp91WX4LU1MUPcEO8GSV5Jt9rk=;
        fh=55pT+6XXWsJyhFBhLGt6sMgvVDgldtYaLHmRn7mf07o=;
        b=q5dJNt7r8MjRUh9tY6HjkQkWofK/fS0pUJPyAos1UlaqFYPKnQrohx+zPOe8NTdw8X
         LRZ7NWFM0PrxlO9k2Rb1Bmn9cyNGC2+voXtB94eNdlALGps2D5O1kT/gfVpk6aACBMYR
         kJoJ/Ndegfvp3RjyaDSu0+9IGrUtyY4bO2ogRZC9GtUubr1wMaOEIpdLN4cTRbhDv1lQ
         sjggVmNBQeSDHMjbvcKXqVaagIvVtip/Q1PaDMEzaYD1aKzuXziryRmgO/hmHkBF0XYx
         sOYulo8TKm5gsTmQCggqvUFF6E3j0tQJNdG5L0p5SH11FIu/PsCxZS864F+to2ullGTN
         0vLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788703151; x=1789307951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4im8T6krvAgeClrNJp91WX4LU1MUPcEO8GSV5Jt9rk=;
        b=ifI0VEcqfeaLCEe4I/gKdaAr48BnHry2h97fZLDRfYaz4TyXW1XcSw7CXcmXncjP+Y
         17vz4J1cG/NNF3wEQScw6in4lMElS1aPWDYH+stAWo05k9o6CgUDbB5fsBAd1S1f4iAo
         7nUR6jevL7wM684pBtvfH3NEcZaEhGTSQmQcroeZrG53DhE79GzHY3YDhHrrGFwPCY/p
         g4LQ0yrwN2Nwq4/UyJA3pmXCLwoHhJZaugf+EVnDIUoyNIaVlbf33imenkCJ6cMF8Cb6
         LNTBo2pFzGB6HzOaGxTQ0K79GdTCFXlSkuM22yCTI9Pv4IO3nu6qA8RmUhqACN1XF9Cl
         LSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788703151; x=1789307951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4im8T6krvAgeClrNJp91WX4LU1MUPcEO8GSV5Jt9rk=;
        b=E3DVcBGxrJ9TW7TxO/1Sx0Vdj8z/fpHAaE/vgXgAsQn3x3mCr1l+UTvnzj43mQOmnZ
         ou2Dw5PjhXy5MZxRLCDJIq+ZwJGYwabCnp42n0sohNJeAUQeGfhYI9Oqj3lrXjruVxth
         iCQkvny5uQ99oHe+/hKCOJtpOzs4X9siul1fql6bEc92Kfob/mw6FhXb447L4mA4mrtv
         hZTVoidV4xrKa+Me+9F+Nsw+sTwq6BIrLTNFT1kG8xu+/0Tq5h4M1UEhE97M5WWIkYp1
         jvH86SPiRrEQn+FTzqFd+D6qWULjHI3QlXfaOw8goXOBT7Ny1CQONhdwAE684kDvSU3T
         pN7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/E4foqspi3pHA0OGAMbA62Hi25bWSFIFASDOoDXY9CbDKRTOOvlqeFRHJNXlKlV0pBj5B9oCzH5rzGYU=@vger.kernel.org
X-Gm-Message-State: AFuF++nySWY4erwNe4USxEWoqYjhlxSOooiFtq+u8t3jblibCuU7scYH
	YnAlb5NOj3N17+ByoOCjloR8KWMQt5ldt/5E8KdejPH+PH3TND/szvWZvRcQMSMyANHjZB2Ykpz
	ODCBI6q8fagEohnKpzM4gE12YOCqs+gZzG2Py
X-Gm-Gg: AYBFou0nLKN5Y/1ldsa8nqVLhs7AbzBOjr1xhqemQURQqsCzAonrjfegYavxqeL4Vub
	xx9mbUzckJDaskZ7kSPVXr+2Gvcb1NIRdBbSVl9tm9TqypEWaJwM95mi9wX0N0trDOuSwqnOguJ
	3ZOm1klA8X3gwMsFTrG0Xtv/YrkzbSUcWgWQaTUDAaKQ0HmXMvvnvHkQSqdj9duk3oTO4IseJCF
	3QZCgimEEqwI2uU7/+DxYDAqisKhf2K9iRT8MGgemoTyvZHlFB7uDIkKO19sTkMrP5EpA054q2G
	oiV/QL775Efa1D1u7pQyuUUz2XBf2Ux0sqU0m5vX39vCfA==
X-Received: by 2002:a4a:e916:0:b0:6aa:cce3:ab61 with SMTP id
 006d021491bc7-6b6fb0ee5fcmr10658265eaf.9.1788703151237; Sun, 06 Sep 2026
 06:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
 <apqWn2EoguCwX5po@wyuan.org> <CAMnqnYwSKeTHi41iesHxJo1b_GGKWkFzfavJHWtEqxD0St3oBg@mail.gmail.com>
 <apw1PMXXv2JmDX29@wyuan.org>
In-Reply-To: <apw1PMXXv2JmDX29@wyuan.org>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sun, 6 Sep 2026 15:59:00 +0200
X-Gm-Features: AcwNN1WHZPbvYs5tjWWsHBhOUhW-32ltXjTVOoH01aJ8WldoL6DPAroYSMThP8c
Message-ID: <CAMnqnYxD56YveYOgVKH0R7pzs7URhsWH6mCog6hLDoZovh-PbA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
To: Weijie Yuan <wy@wyuan.org>
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
eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KU28gSSB0aGluayB0aGlzIGZv
bGxvd3MgdGhlIHJ1bGUgb2YgIm5vIGF0dGFjaG1lbnRzIg0KDQogLi4uL3RyYW5zbGF0aW9ucy96
aF9DTi91c2IvaW5kZXgucnN0ICAgICAgICAgIHwgIDIgKy0NCiBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QgfCAzNyArKysrKysrKysrKysrKysrKysrDQogMiBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0K
DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4
LnJzdA0KYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQpp
bmRleCBkZjk5ODE0YzY0OTcuLmM5NmVhY2YxM2UxMSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QNCkBAIC0zMiw2ICszMiw3IEBAIFVTQiDm
lK/mjIENCiAgICAgY2hpcGlkZWENCiAgICAgZHdjMw0KICAgICBlaGNpDQorICAgIG9oY2kNCiAg
ICAgdXNibW9uDQoNCiDlvoXnv7vor5HmlofmoaPvvJoNCkBAIC00OSw3ICs1MCw2IEBAIFVTQiDm
lK/mjIENCiAqIG1hc3Mtc3RvcmFnZQ0KICogbWlzY191c2JzZXZzZWcNCiAqIG10b3VjaHVzYg0K
LSogb2hjaQ0KICogcmF3LWdhZGdldA0KICogdXNiaXBfcHJvdG9jb2wNCiAqIHVzYi1zZXJpYWwN
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5y
c3QNCmIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi40Mzg3YmIyNzQwNzENCi0tLSAv
ZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNp
LnJzdA0KQEAgLTAsMCArMSwzNyBAQA0KKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wDQorDQorOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdA0KKw0KKzrnv7vo
r5E6IOasp+mYs+WutumTrSBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNv
bT4NCisNCis9PT09PT09PQ0KK09IQ0npqbHliqgNCis9PT09PT09PQ0KKw0KKzIwMjblubQ45pyI
Mjnml6UNCisNCivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+aYr+S4gOS4qlVTQuS4u+acuuaO
p+WItuWZqOmpseWKqOeoi+W6j++8iEhDRO+8ie+8jOWug+a6kOiHqjIuNOWGheaguOezu+WIl+S4
reeahOKAnHVzYi1vaGNp4oCdDQor6amx5Yqo56iL5bqP44CC4oCcdXNiLW9oY2nigJ3ku6PnoIHk
uLvopoHnlLEgUm9tYW4gV2Vpc3NnYWVyYmVyIDx3ZWlzc2dAdmllbm5hLmF0PiDnvJblhpnvvIzk
vYbkuZ/ojrflvpfkuoYNCivorrjlpJrlhbbku5bkurrnmoTotKHnjK7vvIjor7fpmIXor7vlhbbn
iYjmnYPvvIkNCivjgIINCisNCivlroPmlK/mjIHigJzlvIDmlL7kuLvmnLrmjqfliLblmajmjqXl
j6PigJ3vvIhPSENJ77yJ77yM6K+l5o6l5Y+j5qCH5YeG5YyW5LqG55So5LqO5LiOVVNCIDEuMeS4
u+acuuaOp+WItuWZqOmAmuS/oeeahOehrOS7tuWvhA0KK+WtmOWZqOWNj+iuruOAguS4juiLseeJ
ueWwlOaXqeacn+eahOKAnOmAmueUqOS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInn
m7jmr5TvvIzlroPlsIbmm7TlpJrlj6rog73lip/og73ms6jlhaXliLDnoazku7YNCivkuK3jgILp
maToi7HnibnlsJTlkozlqIHnm5vkuYvlpJbnmoTlhbbku5bkvpvlupTllYbnmoRVU0IxLjHmjqfl
iLblmajpgJrluLjkvb/nlKhPSENJ44CCDQorDQor6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS5
5YyF5ousDQorDQorIC0g5o+Q6auY5LqG5YGl5aOu5oCnOyDkv67lpI3kuobplJnor687IOWHj+Ww
keS6huW8gOmUgA0KKyAtIOaUr+aMgeabtOaWsOWSjOeugOWMlueahHVzYmNvcmUgQVBJDQorIC0g
5Lit5pat5Lyg6L6T5Y+v5Lul5pu05aSn77yM5bm25LiU5Y+v5Lul5o6S6ZifDQorIC0g6YCa6L+H
5L2/55So5LiK5bGC4oCcaGNk4oCd5qGG5p6277yM5YeP5bCR5Luj56CB6YePDQorIC0g5pSv5oyB
5LiA5Lqb6Z2eUENJ55qET0hDSeWunueOsA0KKyAtIC4uLiDku6Xlj4rmm7TlpJoNCisNCivigJxP
SENJLWhjZOKAnempseWKqOeoi+W6j+WkhOeQhuaJgOaciVVTQiAxLjHkvKDovpPnsbvlnovjgILm
iYDmnInnsbvlnovnmoTkvKDovpPpg73lj6/ku6XmjpLpmJ/jgILlnKjigJx1c2Itb2hjaeKAneS4
reS5nw0KK+aYr+WmguatpO+8jOS9huS4reaWreS8oOi+k+mZpOWkluOAguS7peWJje+8jOS9v+eU
qOS4gOW4p+eahOWRqOacn+S8muWboOS4uklSUeWkhOeQhueahOW8gOmUgOiAjOWvvOiHtOaVsOaN
ruS4ouWkseeahOmjjumZqeOAgg0KK+W9k+S4reaWreS8oOi+k+aOkumYn+aXtu+8jOWPr+S7pemA
mui/h+ehruS/neehrOS7tuWcqOaTjeS9nOezu+e7n+WkhOeQhuebuOWFs0lSUeaXtuWni+e7iOac
ieS8oOi+k+mcgOimgeWkhOeQhu+8jOadpeacgOWkp+mZkA0KK+W6pueahOmZjeS9jui/meS6m+mj
jumZqQ0KKw0KKy0g5qyn6Ziz5a626ZOtIEppYW1pbmcgT3V5YW5nDQorICA8amlhbWluZ291eWFu
ZzEzQGdtYWlsLmNvbT4NCi0tIA0KMi41My4wDQoNCk9uIFNhdCwgU2VwIDUsIDIwMjYgYXQgNToy
OeKAr1BNIFdlaWppZSBZdWFuIDx3eUB3eXVhbi5vcmc+IHdyb3RlOg0KPg0KPiBPbiBTYXQsIFNl
cCAwNSwgMjAyNiBhdCAwMzoyOTozNlBNICswMjAwLCBKaWFtaW5nIE91eWFuZyB3cm90ZToNCj4g
PiBJIHRoaW5rIHRoaXMgLnBhdGNoIGluIGF0dGFjaG1lbnQgd2lsbCBzb2x2ZSB0aGlzIHByb2Js
ZW0sIGFuZCB0aGUNCj4NCj4gVGhhbmtzIGZvciB0aGUgZWZmb3J0LCBidXQgc2FkbHksICJubyBh
dHRhY2htZW50cyIgaXMgYSBiZXR0ZXIgcHJhY3RpY2UuDQo+IDstKQ0KPg0KPiBTZWU6DQo+DQo+
IGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwj
bm8tbWltZS1uby1saW5rcy1uby1jb21wcmVzc2lvbi1uby1hdHRhY2htZW50cy1qdXN0LXBsYWlu
LXRleHQNCj4NCj4gTWF5YmUgeW91IGNhbiB0cnkgZ2l0LXNlbmQtZW1haWwgbGF0ZXIuDQo+DQo+
IEFueXdheSwgSSBtYW51YWxseSBzYXZlZCB0aGUgcGF0Y2ggYW5kIGdpdCBhbSAtMyB3b3JrcyB3
aGlsZSBnaXQgYW0gZG9lcw0KPiBub3QuDQo+DQo+ID4gY29tbWl0IGluZm9ybWF0aW9uIGhhcyBi
ZWVuIG1vZGlmaWVkIGFjY29yZGluZyB0byB5b3VyIGZlZWRiYWNrLg0KPg0KPiBZZWFoLCBJIHRo
aW5rIHRoaXMgb25lIGxvb2tzIGdvb2QsIHRob3VnaC4NCj4NCj4gVGhhbmtzLg0K
