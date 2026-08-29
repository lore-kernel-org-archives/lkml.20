Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A06418371
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029305; cv=pass; b=ktRuzJyvEFpl0V+2G7INnws7PlnTYcyWoES7e7wSWa4gOB33n6aGYWW9YAQtyJbpcz8g3kpCjNbIbSblQceUf86/z9WYgg/c0jJaUWFPjZBjw8vD+8iPxKgldfcLeoGoOHLwixNPo4lLUkfOWM6y99OsClBoDVC2NVYfODiY1A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029305; c=relaxed/simple;
	bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cMhCjNY2vF5dmPCJE4jrCCpGNz8VRqIZP5VLzvM1lpPNzqA8ufTRTaruaETLn8Ezm2w5RpbvOfBXOTU/9nNf16voKqhtConpVluQwAF+v60qrgMfdsSL0B01YY8ymJrGSpmRgR3bN3IDbv8UWJL6NhOe9BFXZsUF12k0VPZ5rFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laVf+bQl; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laVf+bQl"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7ec1e9d3359so1987139a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788029303; cv=none;
        d=google.com; s=arc-20260327;
        b=caFPgvj4SC5hd6mnobMn3JbT2Ixvx/CDpKA+rvavzvx7Qjtlomj59jBJjWXdE/xv+3
         2yyDRYFXVOCEL9VtsLQpDz7Wwixu3wDcHSUWuMS6LDGExRJrZHxbMfSvqv6xFtoy5LYG
         u+Z9G1C/i/6EX9wdWHtGRG4whBe9AzcRVYQVCX1A34iFCT5t9P1Nh0JWdTn+B+u6B/ys
         SxuE9lewCjwWUKlTdf72eO0JVJdVZLtpHqh+NnyzrunOwpq+uwNyIhXdR/6S3H9z62ip
         t6IDKOprVCOnOtafz74nvmPewF0iTo/OpfgVHfLTR3OJdewPgy1Y8YsHzU+sa0f0gcLB
         dPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
        fh=hI96hi3GoOP7Dm0T5ZIwwug9fSvVNz+8h+p8+5/xlws=;
        b=IiOeqr1SYV+NYpRpaqg+Bevn+I2FHXjwSsayOS5Rut98khzwYzjHjnpd0uIfHLlJru
         UbbDJ9Pstm3zsdWoGoSFu6gjXkWPLowxBb2yiNVFSQne9UZMJCzB7mxV0lKBYsYpDdZE
         yV9jLJ/+PO/Blz+el8nE72vcb4oTdHJtCfxGHjRfR1G+GpMGb9GibW8yRwnXUDnFWN6u
         CmjIxPxqpTTPZv1ReNF364P9tu7W4hlqv4OBFFkr0jTW2BscGiRn0tG8BvzvwQkNb0CL
         xeFWoBGcQikO//m1OgaKAjNG0agq6l4QD63DJvqdEsktDoHSMPp8DyCBJBIe2A2fWlyS
         gRNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788029303; x=1788634103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
        b=laVf+bQloM7KUm0qvEDQc5w1Bf3oD1HZ6lMSX8+NMQPD8+/jJcn36GJh+kspe1kSbh
         Q5IUOyiCQiqo0GjTCfw4BUcthngrnBfdaXidYReUb/IDAHLTffnr+CnWkQ2BmHMu/Uuo
         9fEQzKJk2QuAJDn+4Q8M2pIGbDn/jFMHSvGAUuC37c46bkM8LhsGoJn5VO76Ltwfvna1
         EKIl++JsCqd8usrbJ5JJIgeQyHAHT93EBwVZ5kFKy5Yt3vGc2Pqvk4LToTV6G4v4wbtL
         KTUhUx9RjK4FkL0Jk9Pne39gSb+J5UbnrYcMQd4sfw8FN+4OWowyr8wWWuceV5rgHY+9
         JbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788029303; x=1788634103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qbxmhWZD0CW07SmrijqAqneEw1xNz+/IbBRJSA32L9Q=;
        b=YGXeeZdLiR95qIsZxXVedD2ehA5YgELdEKT5mwcfo5uVqwxITmnpiH2DgIb8sQq8js
         olhbfkS5gz9jTOELHhAE6d2zuXHTfRK74IXq1uunpByrybbDXKD8QfW1M3tuX+r3Vk79
         64LjbDH3sLAEMR3EzfGIzs4QL0ziL38T3gD2qPrkrOpRAvIh+8rXPtVxbcqXySUzR0UE
         QIYSd5kiZJuNS/RgEjkLNoR+KhZtgFo9ifzAGgXYW/Fus33AO3xQAMMu/rGFoXzAV13I
         333Yrjgpm7e1jMmn3u3k5wHnVTuxKVeZa5kboOaqZqhvay5Ndnc3xPjr/SKsMmNyUzvW
         2Uzg==
X-Forwarded-Encrypted: i=1; AHgh+RrZNlTqUbYh7KuxfEv5yieAjGLYl8s/maf/XELTGmD2Rud8D/xkwi6JzH1L51ywm2Y479Ln/nIu52bfNNA=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ8Soq9e1Z8iPT8pq6CM76DgxvtPGS4Xih/45zU7hL/VsqPkBM
	zrQJXMC6ArkJ21u1Yu4J1Jn/Ho6/ZFoUOJSgbDQJbtHExwSlixtCYkux6tX4Nn37SLGnkflCgzS
	z2gxadYSZAH/XNr3fFQ4OiW57nEfdOyo=
X-Gm-Gg: AR+sD13+FTBePg3+5WqK+IwHIkyJ8ZVtwPrE4mEIKUbtLxvF2n/I2h+DcbImKNtiShq
	0V9hJYvSMU6ZVZFGRMH4aj74i9SpqSwVQnehYygET+LZ3PG6cSFP/oOSei5D/jehYMv09tbFSSM
	qAlOfkaeoKmV66G2eiHVxibw+FLSUJF+LJ9wn+LrHn7TrboX2fD53qq1rALuo09/Glrz8PHZ9Iy
	5lGrYiN54QyDg0CkfHquvG9VX/MfHoVyzCaz03U1gbL9V7okd35OARRGlsvp0rHV+FBgeU8XV1F
	Kn4e4Z/V8FwQdfAuKCE/oTwDJH/RUXLOatBZ9MKwrgo/4g==
X-Received: by 2002:a05:6808:f8b:b0:4b3:63a7:b75d with SMTP id
 5614622812f47-4b397c8e6a4mr16340667b6e.0.1788029302802; Sat, 29 Aug 2026
 11:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 29 Aug 2026 20:48:07 +0200
X-Gm-Features: AcwNN1XChojeVTwGAGrg0Wq_4NOfaFshuyXC2v51uuJhhiroqPm4vT63tnE8hQc
Message-ID: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
Subject: [PATCH] docs/zh_CN: add usb/ohci translation
To: linux-doc@vger.kernel.org
Cc: "corbet@lwn.net" <corbet@lwn.net>, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAzOTU5NDgyMTIxNDQ1NDllMjBjZmNkYmQwNTM4MTdjNGUwNjhkYTM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSmlhbWluZyBPdXlhbmcgPGppYW1pbmdvdXlhbmcxM0BnbWFp
bC5jb20+DQpEYXRlOiBTYXQsIDI5IEF1ZyAyMDI2IDIwOjM1OjM3ICswMjAwDQpTdWJqZWN0OiBb
UEFUQ0hdIGRvY3MvemhfQ046IGFkZCB1c2Ivb2hjaSB0cmFuc2xhdGlvbg0KDQpTaWduZWQtb2Zm
LWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KIC4u
Li90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdCAgICAgICAgICB8ICAyICstDQogRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0IHwgMzcgKysrKysrKysr
KysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3VzYi9pbmRleC5yc3QNCmIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dXNiL2luZGV4LnJzdA0KaW5kZXggZGY5OTgxNGM2NDk3Li5jOTZlYWNmMTNlMTEgMTAwNjQ0DQot
LS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQorKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2IvaW5kZXgucnN0DQpAQCAtMzIs
NiArMzIsNyBAQCBVU0Ig5pSv5oyBDQogICAgIGNoaXBpZGVhDQogICAgIGR3YzMNCiAgICAgZWhj
aQ0KKyAgICBvaGNpDQogICAgIHVzYm1vbg0KDQog5b6F57+76K+R5paH5qGj77yaDQpAQCAtNDks
NyArNTAsNiBAQCBVU0Ig5pSv5oyBDQogKiBtYXNzLXN0b3JhZ2UNCiAqIG1pc2NfdXNic2V2c2Vn
DQogKiBtdG91Y2h1c2INCi0qIG9oY2kNCiAqIHJhdy1nYWRnZXQNCiAqIHVzYmlwX3Byb3RvY29s
DQogKiB1c2Itc2VyaWFsDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdXNiL29oY2kucnN0DQpiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Vz
Yi9vaGNpLnJzdA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uNDM4
N2JiMjc0MDcxDQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi91c2Ivb2hjaS5yc3QNCkBAIC0wLDAgKzEsMzcgQEANCisuLiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KKw0KKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi91c2Ivb2hj
aS5yc3QNCisNCis657+76K+ROiDmrKfpmLPlrrbpk60gSmlhbWluZyBPdXlhbmcgPGppYW1pbmdv
dXlhbmcxM0BnbWFpbC5jb20+DQorDQorPT09PT09PT0NCitPSENJ6amx5YqoDQorPT09PT09PT0N
CisNCisyMDI25bm0OOaciDI55pelDQorDQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/mmK/k
uIDkuKpVU0LkuLvmnLrmjqfliLblmajpqbHliqjnqIvluo/vvIhIQ0TvvInvvIzlroPmupDoh6oy
LjTlhoXmoLjns7vliJfkuK3nmoTigJx1c2Itb2hjaeKAnQ0KK+mpseWKqOeoi+W6j+OAguKAnHVz
Yi1vaGNp4oCd5Luj56CB5Li76KaB55SxIFJvbWFuIFdlaXNzZ2FlcmJlciA8d2Vpc3NnQHZpZW5u
YS5hdD4g57yW5YaZ77yM5L2G5Lmf6I635b6X5LqGDQor6K645aSa5YW25LuW5Lq655qE6LSh54yu
77yI6K+36ZiF6K+75YW254mI5p2D77yJDQor44CCDQorDQor5a6D5pSv5oyB4oCc5byA5pS+5Li7
5py65o6n5Yi25Zmo5o6l5Y+j4oCd77yIT0hDSe+8ie+8jOivpeaOpeWPo+agh+WHhuWMluS6hueU
qOS6juS4jlVTQiAxLjHkuLvmnLrmjqfliLblmajpgJrkv6HnmoTnoazku7blr4QNCivlrZjlmajl
jY/orq7jgILkuI7oi7HnibnlsJTml6nmnJ/nmoTigJzpgJrnlKjkuLvmnLrmjqfliLblmajmjqXl
j6PigJ3vvIhVSENJ77yJ55u45q+U77yM5a6D5bCG5pu05aSa5Y+q6IO95Yqf6IO95rOo5YWl5Yiw
56Gs5Lu2DQor5Lit44CC6Zmk6Iux54m55bCU5ZKM5aiB55ub5LmL5aSW55qE5YW25LuW5L6b5bqU
5ZWG55qEVVNCMS4x5o6n5Yi25Zmo6YCa5bi45L2/55SoT0hDSeOAgg0KKw0KK+iHqjIuNOWGheag
uOS7peadpeeahOabtOaUueWMheaLrA0KKw0KKyAtIOaPkOmrmOS6huWBpeWjruaApzsg5L+u5aSN
5LqG6ZSZ6K+vOyDlh4/lsJHkuoblvIDplIANCisgLSDmlK/mjIHmm7TmlrDlkoznroDljJbnmoR1
c2Jjb3JlIEFQSQ0KKyAtIOS4reaWreS8oOi+k+WPr+S7peabtOWkp++8jOW5tuS4lOWPr+S7peaO
kumYnw0KKyAtIOmAmui/h+S9v+eUqOS4iuWxguKAnGhjZOKAneahhuaetu+8jOWHj+WwkeS7o+eg
gemHjw0KKyAtIOaUr+aMgeS4gOS6m+mdnlBDSeeahE9IQ0nlrp7njrANCisgLSAuLi4g5Lul5Y+K
5pu05aSaDQorDQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/lpITnkIbmiYDmnIlVU0IgMS4x
5Lyg6L6T57G75Z6L44CC5omA5pyJ57G75Z6L55qE5Lyg6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo
4oCcdXNiLW9oY2nigJ3kuK3kuZ8NCivmmK/lpoLmraTvvIzkvYbkuK3mlq3kvKDovpPpmaTlpJbj
gILku6XliY3vvIzkvb/nlKjkuIDluKfnmoTlkajmnJ/kvJrlm6DkuLpJUlHlpITnkIbnmoTlvIDp
lIDogIzlr7zoh7TmlbDmja7kuKLlpLHnmoTpo47pmanjgIINCivlvZPkuK3mlq3kvKDovpPmjpLp
mJ/ml7bvvIzlj6/ku6XpgJrov4fnoa7kv53noazku7blnKjmk43kvZzns7vnu5/lpITnkIbnm7jl
hbNJUlHml7blp4vnu4jmnInkvKDovpPpnIDopoHlpITnkIbvvIzmnaXmnIDlpKfpmZANCivluqbn
moTpmY3kvY7ov5nkupvpo47pmakNCisNCistIOasp+mYs+WutumTrSBKaWFtaW5nIE91eWFuZw0K
KyAgPGppYW1pbmdvdXlhbmcxM0BnbWFpbC5jb20+DQotLSANCjIuNTMuMA0K
