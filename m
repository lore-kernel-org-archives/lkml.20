Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586A33F5BE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436381; cv=pass; b=rya/HEnjbX7+L22GlHke6JVOka7zccHE7Tc6Qj7i9P4A3Vpqqwo6wRsbvgs93RFTPGGNDZc/126Z6e+jp+DtMTcbsgTqfSiu2K4HLnjMY6frhDLFKJ1Frb9ELSDM5+Eo9VdXgKu4G9dLemK/mwALudYLZSxbPfNK9dNRBxcKncU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436381; c=relaxed/simple;
	bh=jsXY8q60YvIEKOxzyKNJ5rydpTYaSpxDVSfpGMoTGaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msdBxwbIu0tNlHMQvYKUCRhIv4g2mB1VQUjf28Fan2cKWD77MaKSMmx1TL0u7a/XFTLFj7gxMxrBHhSWVzfgDjMyx7I0DLiPB8ovGyyxTysvOOee2Hm1tRFVqlfqaHozqDo6AkQOxX+K/gpWPvn63QO9r0urzBaaTvU69YPc3pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOJZ3HRf; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOJZ3HRf"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805cc8b4231so1288179a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790436378; cv=none;
        d=google.com; s=arc-20260327;
        b=B37XEicqkusqyUhaeo8KrWEbDLlxOFEK0l6H49f/nkNOUmx6oQ0nwqNl8oHp3r09x/
         GntJX5M9hT31pknbEI/CMgf2fguoDTg683LLKpo+ZLeyhufcdvP7NX70tXwR7fUrbwmm
         rIpc8hASRvLxcYAKaIv5yOQ//652EO2LmLnFIV83zea6yQQFlpWIa7gClRxw5+FWxV3C
         C08R7TsVJI2+XUyMioRw8sHQzBVCAiFBu5ZOFyJ7GGSkngRCznIGjPVUTjSAeNAv/Jlz
         Z2UzJX5i2uhujWFEIGqkK8UF3WB8DpU6F6zTxPFXpXrG1n1KqJsWU71/lmf9AgOYkmUa
         8mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsXY8q60YvIEKOxzyKNJ5rydpTYaSpxDVSfpGMoTGaw=;
        fh=XmQIHt3VtjP/zSdwYeirO4SpmV2Mz/2cBWbyM/gENF8=;
        b=H6N5CFCaY/42bUo9PXrf1nOqZcJb8AKWtUUk+vo394z9qUwCX6J7be+r4EvN7R04l1
         eoQkztjzbn0T+7gNxzsyvzqzBOccR+9f3luPveg9AP0LTZAU+Q9B8hC0J+FU5sztzD4x
         NKq0Z6Vw8GS7knO4XVyy8Yn7aJHuf1doBAcmNEB8FcpkLvj8Wqf6DJImBgCLPcteCYsW
         1lHp5rafxBICRjk5GYMOszH7B6J+1tXygGlH4GEwicYJwt8GP6GBmhXzUZ1J8jq/K8hb
         LRNOEKong6da0aZuWB+P1fcS+CHkMC0X6dMleGjQYBS8vX8E4QOsxKc6uHUd08f4wbTf
         t3tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436378; x=1791041178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jsXY8q60YvIEKOxzyKNJ5rydpTYaSpxDVSfpGMoTGaw=;
        b=kOJZ3HRfg738tLXPULKZqxmP8KwXFyIrkskUg5w2AvWWLOEuocqPue9igUOUBuOsPd
         RKyy8ELmjqg85j5AP4h1iiaSJxsyFACGi1P3lhhWjFHNcgSgZxF3ahcuEwJAFsgIsPKQ
         SJy1raUOrT/Z3pvV2totF/vBjkBG1jNXNEBHYDHY6RtA13nHE65QucSPh30smzk1BftA
         Bj41nGuUzeIhlR1OoBm/YiaZeU7CiHLIYem8vDpTYT12hA+vwIahIOmFM/6tMJYoxxza
         VDxLSg2YKpMkW5I77ajZkVAhXO/5wFLzqlzDuIbasyPJmBGjrfWiuvZZ3gDndubFSoFN
         Sb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436378; x=1791041178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsXY8q60YvIEKOxzyKNJ5rydpTYaSpxDVSfpGMoTGaw=;
        b=pmY32dEkFUO0lu8ORFgC7X67xXGfC5S3d4t+yJ1SPr0ju2mHdmLfoJk36pQxpCPIST
         W/fHdjY3IVw9MdbT0d9A7Ya+HqGBhQlYIpndm5gDUy+tx0WSG8yRvN6BjFu0HVbVHgvU
         dE7+EPCRvH1WKsCjQNCj3vbpMTEFMZU93RLQaZfgi20VL6c1q0BKsDYPEHq8T0aOQmJx
         DgNDnPYcchiNuY2xfQ/KAZZHZYZzPw1YHlpouCrHQJSn7vIKNK6dz3yoTLArolnsOfDr
         LuzVQd8gUwRX5EZG17qldzx2LWYMxux7t5SsG28PFSLlV0trucaxfJqPB5/5fSjFntHH
         UWOw==
X-Forwarded-Encrypted: i=1; AKwUvBxYcuQ4h1hgL77AX8xlKd0OXI9EI/80V9KPc2viPHOsy/6wZB81UqtWvoU7Ksqm6kqKlrGXopSC/J65tIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBhsjbns6WHGl+xdok574DegQwPzfvzKCBxUvlxyU9ByJR1aZa
	FsunC0JSdY4JXmNL2fFk4Dd0Q2dkpDESfI8kz/OFHcpwI8Ya81MLhUgSe4nJdaSrrOyQVplQfBK
	Q+t2hdph1aumoJGfwoYzr/9266KHASo4=
X-Gm-Gg: AYBFou1p4ACbQXsYcvPj+FehkRDDw/eYJbr8ECQ/J6Nfh4GIvPuj1hBtSUN03X6ulK8
	kEsNycUYODG0HPbC928AugxiMaqIRFqwNjEiplzLIWB1vqeeRX+G8uKm5osWSVOlBnzEqep2Zme
	nfw0CemMO59UiHjjmQ0YwDrNgnTrUbg2SPf2hmshchAX4Rhiwb1QN/eXb2bxyW9YbzLB6hVeYax
	2ovBT581OUGGTZ83Qg2YjXUOcHUeCN8uTKJBeP1tgEMOKrPaVR1LlAT4XwhX8viXg9aZoACzRQw
	ryZv5W194eFGZcgXCxLAi7iK0LeHPjwQaqlPCH2IyTJzojXAJTyXs3X2
X-Received: by 2002:a05:6808:4f0b:b0:4d5:291b:b851 with SMTP id
 5614622812f47-4d72ef5617cmr9396545b6e.55.1790436377961; Sat, 26 Sep 2026
 08:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn> <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
 <2026092601-reassure-darkness-229b@gregkh> <aresDaW09qoYZsVH@wyuan.org>
In-Reply-To: <aresDaW09qoYZsVH@wyuan.org>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 26 Sep 2026 17:26:07 +0200
X-Gm-Features: AclHuK-mfo7y02D9o8DG-iC7BMWRt9BbARmaIOz1o4zlN5PO0nlM1BZG46Hfaug
Message-ID: <CAMnqnYzjDmXhbsMUCT3s1qARHu-w+BODv3OLg8rO=-DQi4StYw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, si.yanteng@linux.dev, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

ZG9jcy96aF9DTjogYWRkIENoaW5lc2UgdHJhbnNsYXRpb24gZm9yIHVzYi9vaGNpLnJzdA0KDQpU
cmFuc2xhdGUgRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QgaW50byBDaGluZXNlIFNpbXBsaWZp
ZWQuDQoNClRoZSB0cmFuc2xhdGlvbiBjb3ZlcnMgT0hDSSBkcml2ZXIgb3ZlcnZpZXcsIGhhcmR3
YXJlIHByb3RvY29sDQpkaWZmZXJlbmNlcyAoT0hDSSB2cyBVSENJKSwgaW1wcm92ZW1lbnRzIHNp
bmNlIDIuNCBrZXJuZWwsDQpxdWV1ZWFibGUgaW50ZXJydXB0IHRyYW5zZmVycywgYW5kIG5vbi1Q
Q0kgc3VwcG9ydC4NCg0KLS0tDQpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWlu
Z291eWFuZzEzQGdtYWlsLmNvbT4NCg0KLS0tDQpDaGFuZ2VzIGluIHYyOg0KLSBDb3JyZWN0IHRo
ZSBkYXRlDQotIENvcnJlY3QgdGhlIGxheW91dA0KLSBBZGQgc3BlY2lmaWMgZGV0YWlscyBmb3Ig
aXQncyBjb250cmlidXRvcnMNCi0tLQ0KIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
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
LnNvdXJjZWZvcmdlLm5ldD4NCisNCi0tIA0KMi41My4wDQoNCg0KT24gU2F0LCBTZXAgMjYsIDIw
MjYgYXQgMToyN+KAr1BNIFdlaWppZSBZdWFuIDx3eUB3eXVhbi5vcmc+IHdyb3RlOg0KPg0KPiBI
aSBHcmVnLA0KPg0KPiBPbiAyMDI2LTA5LTI2IDA5OjEzOjI2ICswMjAwLCBHcmVnIEtIIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+DQo+ID4gT24gRnJpLCBTZXAgMjUsIDIw
MjYgYXQgMDU6Mjg6NDdQTSArMDIwMCwgSmlhbWluZyBPdXlhbmcgd3JvdGU6DQo+ID4gPiBTdWJq
ZWN0OiBbUEFUQ0hdIGRvY3MvemhfQ046IGFkZCBDaGluZXNlIHRyYW5zbGF0aW9uIGZvciB1c2Iv
b2hjaS5yc3QNCj4gPg0KPiA+IFRoaXMgc2hvdWxkbid0IGJlIGluIHRoZSBlbWFpbCBib2R5IDoo
DQo+DQo+IEFsdGhvdWdoIHRoaXMgbGluZSBvZiB0ZXh0IGlzIHNvbWV3aGF0IHJlZHVuZGFudCwg
YXMgaXQgaXMgdGhlIHNhbWUgYXMNCj4gdGhlICJTdWJqZWN0IiBsaW5lIGluIHRoZSBlbWFpbCBo
ZWFkZXIgKGdpdCBtYWlsaW5mbyB3b3VsZCBzdHJpcCB0aGUNCj4gIlJlOiAiIGJ5IGRlZmF1bHQp
LCBpdCBpcyBmaW5lIHRvIGxlYXZlIGl0IGhlcmUuPw0KPg0KPiBnaXQuZ2l0L0RvY3VtZW50YXRp
b24vZ2l0LWFtLmFkb2M6OltbZGlzY3Vzc2lvbl1dOg0KPg0KPiAiRnJvbTogIiwgIkRhdGU6ICIs
IGFuZCAiU3ViamVjdDogIiBsaW5lcyBzdGFydGluZyB0aGUgYm9keSBvdmVycmlkZSB0aGUNCj4g
cmVzcGVjdGl2ZSBjb21taXQgYXV0aG9yIG5hbWUgYW5kIHRpdGxlIHZhbHVlcyB0YWtlbiBmcm9t
IHRoZSBoZWFkZXJzLg0KPg0KPiBlLmcuIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2dpdC94bXFx
bXM2M29rN2cuZnNmQGdpdHN0ZXIuZy8NCj4NCj4gQnV0IEkgZ3Vlc3MgeW91IGtub3cgYWxsIGFi
b3V0IHRoaXMsIGp1c3Qgd2FudCB0byBoYW5kbGUgaXQgaGVyZSBpbiBhDQo+IHNpbXBsZSB3YXku
IDstKQ0KPg0KPiBUaGFua3MuDQo=
