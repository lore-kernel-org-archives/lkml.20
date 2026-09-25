Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE04D6C49
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350142; cv=pass; b=grvMvRo84V8PGBtB8/OWZj6nUKxnVR7lQf9adm4UgxiQ9J/+/YM8ecH93Dy95Bo55pURa5doNiG2RCU6GSk/n9s4gva9iMLhW8PReHV8UhJ99tqYQZCsPRM0eVgrZaveSSwu5BcVqEXLnsCdNSSw51XEfgWrCBkL/tVAobkgylQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350142; c=relaxed/simple;
	bh=o7Lr3M2Ezt8GMzzWwShJWJlUPx5bx/JGye1DeKi03nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NB/YbDNQxSkWGeXnZcWTRnT9Tn3LDLNxAqjFC7EHmmUJfsE/Jio4qzXVADnoLsK7lAZw8aGWrb07E0OQ5nAyKJo9PKUP4KObqq4mhVxLxHtZs4Tz7+TN2yKmT9goJkn4b4+HcKYI4x7yqj4Cen1inUrXvcteBNq8Mp7TD6/WR/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfPvf6WL; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfPvf6WL"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47b8afe046dso610418fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350139; cv=none;
        d=google.com; s=arc-20260327;
        b=jKidBWzp9IRVYDTF5yLJ67Kc4TD2XHRpBkrrz5LiFlIN5iAIu9KMlEi4J6OL0DYyH7
         Duh/aI1N5MEJk7Ixqr69G8NT5Oqnobd5TL4ugAxtoZ6o3DATkPOR6JoTxJ7Lj7WjEUI+
         GyOCd8RrQgRKr74Vp+wxuL//oRSDzGghJ4hcoEC63fiJoa4AXWE1IZyborT4WwK5gac4
         C1/phXiXvkAckbp6w9zpVB8KfIE7HIDt480SLhemdVxhZ2R9psAna99Cvxr7XsD0ZIAe
         TaUtOf2YBPMurU5daYgbm0Doyyh82sYTVVAryUeCaQZXK0pjNtpEdsybuyqUwIQSYxeU
         qQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o7Lr3M2Ezt8GMzzWwShJWJlUPx5bx/JGye1DeKi03nw=;
        fh=+98cvLrEJB0R7GWFhXio74gz0wS1x264dg7e2IEgTGI=;
        b=fh9RJK1D2QK4g+fVNJCwTeZkYwUWlxK5s/psijgB2O2/PIYu4N4ywrJ3X/oHe7fAp1
         O8GEBGUTeKxQquwJmphIagCOBUxBru1IEeMjBXYSiDYAyePFiL5GoYPxRPhksfOSyNTw
         Ib5K6eLfSDyG+waTL7eE4OmVJ4invmnAs21HRm583MaSUNvrGr4Tx7yW3VI08e1oL1/o
         4zTPpC5uhJOimJuPsQEmOx3YQoeiqzWLVOr/IEPPNtJfWY92A1lR165RbPWRrVBTfGd1
         HpLGs1zO1h0F57HW95N9PoiEutOH11eiTp6SnoOf+v0SRyhLG1xL4jzR1TcsteZ4qSpC
         /Fig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790350139; x=1790954939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7Lr3M2Ezt8GMzzWwShJWJlUPx5bx/JGye1DeKi03nw=;
        b=lfPvf6WLYnIGEEZtUqye/dk9La/inxxTDDPskmSacLoRrBlvU97ryQsObc+88RJmMJ
         wTsN2kVA5/8QphkxezTGAtQ2MG/t36T06hrfDlBRGHF7Et08rhzDTTLYZgen+S2vO3eQ
         0NakSjs9B0GdWeRe9cZgMVnZX4OoBmUe+FmTBBKJwsWu5ZPI8gz7rF5f59yPHirAaCmm
         gKauMarbZqd9RCPQu+GluImNdbKd7noATtvG8/HR3FgM8GFjPi51XcQylDjRHm5eqZ8o
         n6ZDAn69LlbZbPfthR8X8fviCBiFj0/2Wjwl9bkm4n8/RMe3YqHN6UKTjPp8ZGrpodqr
         GtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350139; x=1790954939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Lr3M2Ezt8GMzzWwShJWJlUPx5bx/JGye1DeKi03nw=;
        b=g693pRhQoCWEQxdRaIKCQrZELIqF4cUUEGrxw4Hm04PBt8ixF0/11B6FpZsZhp6pcz
         2WfHQ4WmonjVMnHQSEGXsEqbgKKlPO6dHra9Ic+eVw16PpTrGQbUzUxr7QHAlAl7Z4cM
         Cn6TU3Grnw72avS9jYR8rYees79oEIMX9njNkL2gqneU0lwuaRQI2jj4w1K7fZ4EnmEB
         HY7iNKMvbTbaFThtLexYC0TuSyKVL1FOsstbUvajdm/oI/Po8+nHQtxEElOFXkXXuRaW
         ++IUt1CDn44l9WJdQ9o9qMaXNPhlRuBDkwUL8Bog/1VNZGv/6UeP7+C+DywXpUDHNvew
         yUww==
X-Gm-Message-State: AFuF++kHb7d9CrbMnsuUROzbSZkcRVBvqqZH/fkGwZyAXeRFl3nUkwWp
	S0GCqOs0iaZ4gjFFR4p9wl8STVHBqIAixLbcmv5+USt39GG+34wAjlAUWnf5N3QbQNnT2MFaEt1
	2pnrOVOnyaP6po5bHe9PwRFpiM+m3roQ=
X-Gm-Gg: AYBFou1oCSk4kGjSd1GysZ9IG7FT/eD+jvcCym6aEogjNWuGMfZLZguqB/lY3pzNTdr
	xabXFEDEoeKrwl3BE7YkHQXbdhoF2maYT9QLOmSX6CtqRye2fo1hcLLBsencvCxgeZtI9EEs3P3
	JaorN6wwaO4d9C7L99PIUJDZ8igOqrfvdWeXU/o2KJjUl2UcdTyLJDFAW4B9doQyY2zh5Vp6utN
	CgkVLVfiO+AsYYAbMmf5xX4IroJqfsrB12rt4Cpz2gkCcyc+wwAeEPfENP65YPkxnmnHIKKx/j2
	pHoIw29sI7os9GNAtGLratbmXh4wxuluiTb31T7//UStifYHS0g+05RXUw==
X-Received: by 2002:a05:6809:156:20b0:4dd:cca1:3c79 with SMTP id
 5614622812f47-4ddccb0837cmr1303596b6e.34.1790350138619; Fri, 25 Sep 2026
 08:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
 <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
In-Reply-To: <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Fri, 25 Sep 2026 17:28:47 +0200
X-Gm-Features: AclHuK_4rcPrd5qqyLhMYcXWAefFmW3Sr0MLBjuc2aev9V2zVBm70pYbGKr5bSc
Message-ID: <CAMnqnYxzfUUaeaGTG=pESVN+2yeue4b_7N6d=xMGNE7qdrNbYA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, si.yanteng@linux.dev, 
	rdunlap@infradead.org, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

U3ViamVjdDogW1BBVENIXSBkb2NzL3poX0NOOiBhZGQgQ2hpbmVzZSB0cmFuc2xhdGlvbiBmb3Ig
dXNiL29oY2kucnN0DQoNClRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdCBpbnRv
IENoaW5lc2UgU2ltcGxpZmllZC4NCg0KVGhlIHRyYW5zbGF0aW9uIGNvdmVycyBPSENJIGRyaXZl
ciBvdmVydmlldywgaGFyZHdhcmUgcHJvdG9jb2wNCmRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kp
LCBpbXByb3ZlbWVudHMgc2luY2UgMi40IGtlcm5lbCwNCnF1ZXVlYWJsZSBpbnRlcnJ1cHQgdHJh
bnNmZXJzLCBhbmQgbm9uLVBDSSBzdXBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91
eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4NCi0tLQ0KSSBoYXZlIG1vZGlmaWVkIGFj
Y29yZGluZyB0byB5b3VyIGZlZWRiYWNrDQoNCg0KIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3VzYi9vaGNpLnJzdCB8IDM4ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRl
eCAwMDAwMDAwMDAwMDAuLjVlMzY4MzFiZjM3MA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0DQpAQCAtMCwwICsxLDM4IEBA
DQorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCisNCis6T3JpZ2luYWw6IERv
Y3VtZW50YXRpb24vdXNiL29oY2kucnN0DQorDQorOue/u+ivkTog5qyn6Ziz5a626ZOtIEppYW1p
bmcgT3V5YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KKw0KKz09PT09PT09DQorT0hD
SempseWKqA0KKz09PT09PT09DQorDQorMjAwMuW5tDjmnIgyM+aXpQ0KKw0KK+KAnE9IQ0ktSENE
4oCd6amx5Yqo56iL5bqP5piv5LiA5LiqVVNC5Li75py65o6n5Yi25Zmo56iL5bqP77yISENE77yJ
77yM5a6D5rqQ6IeqMi405YaF5qC457O75YiX5Lit55qE4oCcdXNiLW9oY2nigJ0NCivpqbHliqjn
qIvluo/jgILigJx1c2Itb2hjaeKAneS7o+eggeS4u+imgeeUsSBSb21hbiBXZWlzc2dhZXJiZXIg
PHdlaXNzZ0B2aWVubmEuYXQ+57yW5YaZ5L2G5Lmf6I63DQor5b6X5LqG5p2l6IeqRGF2aWQgQnJv
d25lbGwgPGRicm93bmVsbEB1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+77yMTGludXMgVG9ydmFsZHMN
CivlkoxHcmVnb3J5IFAuIFNtaXRo55qE5pSv5oyB44CCDQorDQor5a6D5pSv5oyB4oCc5byA5pS+
5Li75py65o6n5Yi25Zmo5o6l5Y+j4oCd77yIT0hDSe+8ie+8jOivpeaOpeWPo+agh+WHhuWMluS6
hueUqOS6juS4jlVTQiAxLjHkuLvmnLrmjqfliLblmajpgJrkv6HnmoQNCivnoazku7blr4TlrZjl
majljY/orq7jgILigJzkuI7oi7HnibnlsJTml6nmnJ/nmoTigJzpgJrnlKjkuLvmnLrmjqfliLbl
majmjqXlj6PigJ3vvIhVSENJ77yJ55u45q+U77yM5a6D5bCG5pu05aSa5Y+q6IO95Yqf6IO9DQor
5rOo5YWl5Yiw56Gs5Lu25Lit44CC6Zmk6Iux54m55bCU5ZKM5aiB55ub5LmL5aSW55qE5YW25LuW
5L6b5bqU5ZWG55qEVVNCMS4x5o6n5Yi25Zmo6YCa5bi45L2/55SoT0hDSeOAgg0KKw0KK+iHqjIu
NOWGheaguOS7peadpeeahOabtOaUueWMheaLrA0KKw0KKyAgICAgICAgIC0g5o+Q6auY5LqG5YGl
5aOu5oCnOyDkv67lpI3kuobplJnor687IOWHj+WwkeS6huW8gOmUgA0KKyAgICAgICAgIC0g5pSv
5oyB5pu05paw5ZKM566A5YyW55qEdXNiY29yZSBBUEkNCisgICAgICAgICAtIOS4reaWreS8oOi+
k+WPr+S7peabtOWkp++8jOW5tuS4lOWPr+S7peaOkumYnw0KKyAgICAgICAgIC0g6YCa6L+H5L2/
55So5LiK5bGC4oCcaGNk4oCd5qGG5p6277yM5YeP5bCR5Luj56CB6YePDQorICAgICAgICAgLSDm
lK/mjIHkuIDkupvpnZ5QQ0nnmoRPSENJ5a6e546wDQorICAgICAgICAgLSAuLi4g5Lul5Y+K5pu0
5aSaDQorDQor4oCcT0hDSS1oY2TigJ3pqbHliqjnqIvluo/lpITnkIbmiYDmnIlVU0IgMS4x5Lyg
6L6T57G75Z6L44CC5omA5pyJ57G75Z6L55qE5Lyg6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo4oCc
dXNiLW9oY2nigJ0NCivkuK3kuZ/mmK/lpoLmraTvvIzkvYbkuK3mlq3kvKDovpPpmaTlpJbjgILk
u6XliY3vvIzkvb/nlKjkuIDluKfnmoTlkajmnJ/kvJrlm6DkuLpJUlHlpITnkIbnmoTlvIDplIDo
gIzlr7zoh7TmlbDmja7kuKINCivlpLHnmoTpo47pmanjgILlvZPkuK3mlq3kvKDovpPmjpLpmJ/m
l7bvvIzlj6/ku6XpgJrov4fnoa7kv53noazku7blnKjmk43kvZzns7vnu5/lpITnkIbnm7jlhbNJ
UlHml7blp4vnu4jmnInkvKDovpPpnIDopoENCivlpITnkIbvvIzmnaXmnIDlpKfpmZDluqbnmoTp
mY3kvY7ov5nkupvpo47pmanjgIINCisNCistIERhdmlkIEJyb3duZWxsDQorICA8ZGJyb3duZWxs
QHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCisNCi0tDQoyLjUzLjANCg0KT24gRnJpLCBTZXAgMjUs
IDIwMjYgYXQgMjozM+KAr1BNIERvbmdsaWFuZyBNdSA8ZHptOTFAaHVzdC5lZHUuY24+IHdyb3Rl
Og0KPg0KPg0KPiBPbiA5LzI1LzI2IDY6NTcgUE0sIEppYW1pbmcgT3V5YW5nIHdyb3RlOg0KPiA+
IFN1YmplY3Q6IFtQQVRDSF0gZG9jcy96aF9DTjogYWRkIENoaW5lc2UgdHJhbnNsYXRpb24gZm9y
IHVzYi9vaGNpLnJzdA0KPiA+DQo+ID4gVHJhbnNsYXRlIERvY3VtZW50YXRpb24vdXNiL29oY2ku
cnN0IGludG8gQ2hpbmVzZSBTaW1wbGlmaWVkLg0KPiA+DQo+ID4gVGhlIHRyYW5zbGF0aW9uIGNv
dmVycyBPSENJIGRyaXZlciBvdmVydmlldywgaGFyZHdhcmUgcHJvdG9jb2wNCj4gPiBkaWZmZXJl
bmNlcyAoT0hDSSB2cyBVSENJKSwgaW1wcm92ZW1lbnRzIHNpbmNlIDIuNCBrZXJuZWwsDQo+ID4g
cXVldWVhYmxlIGludGVycnVwdCB0cmFuc2ZlcnMsIGFuZCBub24tUENJIHN1cHBvcnQuDQo+DQo+
IFRoZSBnaXQgYXBwbHkgLS1jaGVjayBmYWlsZWQgaW4gbXkgbG9jYWwgd29ya3NwYWNlLiBBbmQg
dGhlcmUgYXJlIHNvbWUNCj4gdHJhbnNsYXRpb24gaXNzdWVzIGJlbG93Lg0KPg0KPiBEb25nbGlh
bmcgTXUNCj4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFu
ZzEzQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdXNi
L2luZGV4LnJzdCAgICAgICAgICB8ICAyICstDQo+ID4gICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QgfCAzNyArKysrKysrKysrKysrKysrKysrDQo+ID4gICAy
IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hj
aS5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi91c2IvaW5kZXgucnN0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti91c2IvaW5kZXgucnN0DQo+ID4gaW5kZXggZGY5OTgxNGM2NDk3Li5jOTZlYWNmMTNlMTEgMTAw
NjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4
LnJzdA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRl
eC5yc3QNCj4gPiBAQCAtMzIsNiArMzIsNyBAQCBVU0Ig5pSv5oyBDQo+ID4gICAgICAgY2hpcGlk
ZWENCj4gPiAgICAgICBkd2MzDQo+ID4gICAgICAgZWhjaQ0KPiA+ICsgICAgb2hjaQ0KPiA+ICAg
ICAgIHVzYm1vbg0KPiA+DQo+ID4gICDlvoXnv7vor5HmlofmoaPvvJoNCj4gPiBAQCAtNDksNyAr
NTAsNiBAQCBVU0Ig5pSv5oyBDQo+ID4gICAqIG1hc3Mtc3RvcmFnZQ0KPiA+ICAgKiBtaXNjX3Vz
YnNldnNlZw0KPiA+ICAgKiBtdG91Y2h1c2INCj4gPiAtKiBvaGNpDQo+ID4gICAqIHJhdy1nYWRn
ZXQNCj4gPiAgICogdXNiaXBfcHJvdG9jb2wNCj4gPiAgICogdXNiLXNlcmlhbA0KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi91c2Ivb2hjaS5yc3QNCj4g
PiBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9vaGNpLnJzdA0KPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44NDY5ZjU2NTlmOGQN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdXNiL29oY2kucnN0DQo+ID4gQEAgLTAsMCArMSwzNyBAQA0KPiA+ICsuLiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVu
dGF0aW9uL3VzYi9vaGNpLnJzdA0KPiA+ICsNCj4gPiArOue/u+ivkTog5qyn6Ziz5a626ZOtIEpp
YW1pbmcgT3V5YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29tPg0KPiA+ICsNCj4gPiArPT09
PT09PT0NCj4gPiArT0hDSempseWKqA0KPiA+ICs9PT09PT09PQ0KPiA+ICsNCj4gPiArMjAyNuW5
tDnmnIg35pelDQo+IERvIG5vdCBtb2RpZnkgdGhlIGRhdGUgLSAiMjMtQXVnLTIwMDIiDQo+ID4g
Kw0KPiA+ICvigJxPSENJLUhDROKAnempseWKqOeoi+W6j+aYr+S4gOS4qlVTQuS4u+acuuaOp+WI
tuWZqOeoi+W6j++8iEhDRO+8ie+8jOWug+a6kOiHqjIuNOWGheaguOezu+WIl+S4reeahOKAnHVz
Yi1vaA0KPiA+ICtjaeKAnempseWKqOeoi+W6j+OAguKAnHVzYi1vaGNp4oCd5Luj56CB5Li76KaB
55SxIFJvbWVuIFdlaXNzZ2FlcmJlciA8d2Vpc3NnQHZpZW5uYS5hdD7nvJblhpkNCj4NCj4gRG8g
bm90IHNlcGFyYXRlIHVzYi1vaGNpIGludG8gdHdvIGxpbmVzLg0KPg0KPiBSb21lbiAtPiBSb21h
bg0KPg0KPiA+ICvkvYbkuZ/ojrflvpfkuoborrjlpJrlhbbku5bkurrnmoTotKHnjK7vvIjor7fp
mIXor7vlhbbniYjmnYPvvInjgIINCj4NCj4gcmVhZCBpdHMgY29weXJpZ2h0L2xpY2VuY2luZyBo
ZWFkZXINCj4NCj4gUmUtdHJhbnNsYXRlIHRoaXMgcGFydC4NCj4NCj4gPiArDQo+ID4gK+Wug+aU
r+aMgeKAnOW8gOaUvuS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iE9IQ0nvvInvvIzor6XmjqXl
j6PmoIflh4bljJbkuobnlKjkuo7kuI5VU0IgMS4x5Li75py65o6n5Yi25Zmo6YCa5L+h55qEDQo+
ID4gK+ehrOS7tuWvhOWtmOWZqOWNj+iuruOAguKAnOS4juiLseeJueWwlOaXqeacn+eahOKAnOmA
mueUqOS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzlroPlsIbmm7Tl
pJrlj6rog73lip/og70NCj4g5Y+q6IO95Yqf6IO977yfDQo+ID4gK+azqOWFpeWIsOehrOS7tuS4
reOAgumZpOiLseeJueWwlOWSjOWogeebm+S5i+WklueahOWFtuS7luS+m+W6lOWVhueahFVTQjEu
MeaOp+WItuWZqOmAmuW4uOS9v+eUqE9IQ0njgIINCj4gPiArDQo+ID4gK+iHqjIuNOWGheaguOS7
peadpeeahOabtOaUueWMheaLrA0KPiA+ICsNCj4gPiArICAgICAgICAgLSDmj5Dpq5jkuoblgaXl
o67mgKc7IOS/ruWkjeS6humUmeivrzsg5YeP5bCR5LqG5byA6ZSADQo+ID4gKyAgICAgICAgIC0g
5pSv5oyB5pu05paw5ZKM566A5YyW55qEdXNiY29yZSBBUEkNCj4gPiArICAgICAgICAgLSDkuK3m
lq3kvKDovpPlj6/ku6Xmm7TlpKfvvIzlubbkuJTlj6/ku6XmjpLpmJ8NCj4gPiArICAgICAgICAg
LSDpgJrov4fkvb/nlKjkuIrlsYLigJxoY2TigJ3moYbmnrbvvIzlh4/lsJHku6PnoIHph48NCj4g
PiArICAgICAgICAgLSDmlK/mjIHkuIDkupvpnZ5QQ0nnmoRPSENJ5a6e546wDQo+ID4gKyAgICAg
ICAgIC0gLi4uIOS7peWPiuabtOWkmg0KPiA+ICsNCj4gPiAr4oCcT0hDSS1oY2TigJ3pqbHliqjn
qIvluo/lpITnkIbmiYDmnIlVU0IgMS4x5Lyg6L6T57G75Z6L44CC5omA5pyJ57G75Z6L55qE5Lyg
6L6T6YO95Y+v5Lul5o6S6Zif44CC5Zyo4oCcdXNiLW9oYw0KPiA+ICtp4oCd5Lit5Lmf5piv5aaC
5q2k77yM5L2G5Lit5pat5Lyg6L6T6Zmk5aSW44CC5Lul5YmN77yM5L2/55So5LiA5bin55qE5ZGo
5pyf5Lya5Zug5Li6SVJR5aSE55CG55qE5byA6ZSA6ICM5a+86Ie05pWw5o2u5LiiDQo+IERvIG5v
dCBzZXBhcmF0ZSB1c2Itb2hjaSBpbnRvIHR3byBsaW5lcy4NCj4gPiAr5aSx55qE6aOO6Zmp44CC
5b2T5Lit5pat5Lyg6L6T5o6S6Zif5pe277yM5Y+v5Lul6YCa6L+H56Gu5L+d56Gs5Lu25Zyo5pON
5L2c57O757uf5aSE55CG55u45YWzSVJR5pe25aeL57uI5pyJ5Lyg6L6T6ZyA6KaBDQo+ID4gK+Wk
hOeQhu+8jOadpeacgOWkp+mZkOW6pueahOmZjeS9jui/meS6m+mjjumZqeOAgg0KPiA+ICsNCj4g
PiArLSBEYXZpZCBCcm93bmVsbA0KPiA+ICsgIDxkYnJvd25lbGxAdXNlcnMuc291cmNlZm9yZ2Uu
bmV0Pg0KPiA+ICsNCj4NCg==
