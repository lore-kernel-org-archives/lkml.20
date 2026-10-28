Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175374;
	b=l/YcqAMT1PIbr4R+ySeP3UD48u7CmDRs6IbWxlJ+e7GKNpHSCvvg0Xfc2Ti4GQhNKh6X
	 T9ggFxkgQHWRwuBGbHlsOUqh0AxpRojjg26UI4IYLjpxG+ybOA6MfADvaB2S5eI62kvPj
	 +2iRlJcOwN3+DDB0g1hY0bExL9nGSZDz8lAkUxDzB9Em8848hgSxm713WOkHRxfUrxjxB
	 fwIK2QvgZNMbxz4sFIdmLRBNfTXvhA1qgzG7YySm9noTMWYg/JaURxneBplYI7ApzLcnO
	 IuqmdjCgz2HWIl+0RsGfx3yzQc4isni3bjVnSzqgbPGIzrqM/0L0EIESGx8k8AfjRdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175374;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=tNUnQc1pWHXFyd2VHA69XfeglS4iq5IpHn1I4EN/QGU=;
	b=jHLF7+X9AKnvxy1AggzfeTETVr++pOl0fH04QssLqsSNqJTpUVkFmFfMN4rcN9Jw/ddK
	 zEpPGRf8cFSu9I1riLaM5+QEfoF7ZxU/2f0LovJHiU9b+i+OpfJmBAutcaJE/sZg2AiKO
	 QsNAP7IYoSrwgS3zOyLmiixdUC+lJSABfhiRurUqYmVT9Cosefs3UF3JWw917Dh+c76OR
	 RTrd0enQ3cRWUBT7D5JPxemXnDVC0M27QhCN5OnIejmdgjpjx3TVO4++ZvDHolYg+qBmU
	 GvUt1xhgvQpAJisbO3JJ2vjMneySl4NZmFsZMs5cD/TTR3PIrCod435Pi7FUJRquPqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kZW2DJ22;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77886606A31A;
	Wed, 28 Oct 2026 08:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77886606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kZW2DJ22
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69S8FH4p81614653, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793175317; bh=tNUnQc1pWHXFyd2VHA69XfeglS4iq5IpHn1I4EN/QGU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kZW2DJ22vfZv3to1+5vcbYOAjhcdXPJC4plDnlSojMdMFu2RQyQujTV0DhTz1167A
	 9BB9Uz3hTNeNL2CG4rUnxQFj1m4rNhSQ+XpPTsnrAvvpSUDtxVKZFdQdybWEm0Dwud
	 4ZNzFxTk1dwGDjHTZSZ2S5oaFVJ8Rd1KLmD17ReGS93VYC4jI8AhaD+5mcX5JA50Aj
	 ftu3qh2kjIvb9sOY621AznNR5WxUhQtWSu+Tgm65SeHtEFvY+MfsKTZIBLCz+3NAko
	 DYGFbXlq+XFlAKRvKOWPMMRKZ89oeQaTAGz9ZwTKePxwGwYZ0uE3wVR89XiqH4XCnH
	 spd3qVOhAOSVQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69S8FH4p81614653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Oct 2026 16:15:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 16:15:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw ([::1]) by
 RTKEXHMBS05.realtek.com.tw ([fe80::b3a:156c:7813:1697%4]) with mapi id
 15.02.2562.049; Wed, 28 Oct 2026 16:15:16 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "tglx@kernel.org" <tglx@kernel.org>, "radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Thread-Topic: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Thread-Index: AQHdXxqxrooHtuvy+0+IPKYEf41fuLcED+AAgACnvNCAALIlgIADtvpA//9/KICACgojcA==
Date: Wed, 28 Oct 2026 08:15:16 +0000
Message-ID: <d5621ab36b734a1899f897dd61ce5fcc@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
 <20261019-prophetic-moth-of-youth-40dbd6@quoll>
 <b12ff328ebca405f96a9b25decdb7c81@realtek.com>
 <d6d7c3ba-5329-4c90-8994-ea29cedd7c53@kernel.org>
 <ef63cc3df2424f888ba807701af0ce84@realtek.com>
 <936769c6-c8e7-4bf2-b300-b287088c31af@kernel.org>
In-Reply-To: <936769c6-c8e7-4bf2-b300-b287088c31af@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

SGkgS3J6eXN6dG9mLA0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuDQoNCj4gT24gMjIvMTAv
MjAyNiAwODo0NCwgWXUtQ2h1biBMaW4gW+ael+elkOWQm10gd3JvdGU6DQo+ID4gSGkgS3J6eXN6
dG9mLA0KPiA+DQo+ID4+Pj4+ICBwYXR0ZXJuUHJvcGVydGllczoNCj4gPj4+Pj4gKyAgIl5pbnRl
cnJ1cHQtY29udHJvbGxlciI6DQo+ID4+Pj4+ICsgICAgJHJlZjogL3NjaGVtYXMvaW50ZXJydXB0
LWNvbnRyb2xsZXIvcmVhbHRlayxydGQxMzE5LWludGMtaXNvLnlhbWwNCj4gPj4+Pj4gKyAgICB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4+Pj4+ICsNCj4gPj4+Pj4gICAgJ0BbMC05
YS1mXSskJzoNCj4gPj4+Pj4gICAgICB0eXBlOiBvYmplY3QNCj4gPj4+Pg0KPiA+Pj4+IFdoYXQg
aXMgdGhpcyBmb3IgdGhlbj8gU2hvdWxkIGl0IGJlIHJlbW92ZWQ/DQo+ID4+Pj4NCj4gPj4+DQo+
ID4+PiBUaGUgb3JpZ2luYWwgc3lzY29uIGNvbXBhdGlibGUgaGFzIG90aGVyIGNoaWxkIG5vZGVz
IHRoYXQgZG8gaGF2ZSAncmVnJw0KPiA+Pj4gcHJvcGVydGllcyBhbmQgdW5pdCBhZGRyZXNzZXMs
IHNvIHRoaXMgcGF0dGVybiBpcyBzdGlsbCBuZWVkZWQgZm9yIHRoZW0uDQo+ID4+Pg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBAQCAtNzYsMyArODAsMjcgQEAgcmVxdWlyZWQ6DQo+ID4+Pj4+ICAgIC0gcmVn
DQo+ID4+Pj4+DQo+ID4+Pj4+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPj4+Pj4g
Kw0KPiA+Pj4+PiArZXhhbXBsZXM6DQo+ID4+Pj4+ICsgIC0gfA0KPiA+Pj4+PiArICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4+Pj4+
ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0K
PiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgc3lzY29uQDcwMDAgew0KPiA+Pj4+PiArICAgICAgICBj
b21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pc28iLCAic3lzY29uIiwgInNpbXBsZS1tZmQi
Ow0KPiA+Pj4+PiArICAgICAgICByZWcgPSA8MHg3MDAwIDB4MTAwMD47DQo+ID4+Pj4+ICsgICAg
ICAgIHJhbmdlcyA9IDwweDAgMHg3MDAwIDB4MTAwMD47DQo+ID4+Pj4+ICsgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPiA+Pj4+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4g
Pj4+Pg0KPiA+Pj4+IFdoeSBkbyB5b3UgaGF2ZSBjZWxscyBpdCB5b3VyIGNoaWxkIGhhcyBubyBh
ZGRyZXNzaW5nPw0KPiA+Pj4+DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICAgICAgaW50ZXJydXB0
LWNvbnRyb2xsZXIgew0KPiA+Pj4+DQo+ID4+Pj4gU28gdGhlIGJpbmRpbmcgcmVxdWlyZXMgY2hp
bGRyZW4gd2l0aCB1bml0IGFkZHJlc3MsIHllcz8NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IFRoZSBp
bnRlcnJ1cHQtY29udHJvbGxlciBkb2VzIG5vdCBuZWVkIGEgdW5pdCBhZGRyZXNzIGJlY2F1c2Ug
aXQNCj4gPj4+IGFjY2Vzc2VzIHRoZSByZWdpc3RlcnMgdmlhIHRoZSBwYXJlbnQncyByZWdtYXAu
DQo+ID4+DQo+ID4+IFRoYXQncyBub3QgcmVhbGx5IHJlbGV2YW50LiBDaGlsZCBkcml2ZXJzIHN0
aWxsIGFjY2VzcyB2aWEgcGFyZW50J3MNCj4gPj4gcmVnbWFwIGFuZCBoYXZlIHVuaXQgYWRkcmVz
cy4gVGhpcyBiaW5kaW5nIGhhcyBidXMgYWRkcmVzc2luZyBmb3INCj4gPj4gY2hpbGRyZW4sIHNv
IHVzZSBpdC4gRG8gbm90IGFkZCByYW5kb20gb3IgaW5jb25zaXN0ZW50IGNvZGUuDQo+ID4+DQo+
ID4NCj4gPiBUaGUgcmVnaXN0ZXJzIGZvciBpbnRlcnJ1cHQgY29udHJvbGxlciBhcmUgcXVpdGUg
c2NhdHRlcmVkIHdpdGhpbiB0aGUNCj4gPiBwYXJlbnQgc3lzY29uIGJsb2NrLiBUYWtlIHJ0ZDE2
MjUtaW50Yy1taXNjIGFzIGFuIGV4YW1wbGUsIHRoZSBvZmZzZXRzDQo+ID4gYXJlIDB4NCwgMHhj
LCAweDgwLCBhbmQgMHg4OCBBZnRlciBhZGRpbmcgdW5pdC1hZGRyZXNzIGFuZCByZWcuDQo+ID4g
SXQgd291bGQgYmUgbGlrZToNCj4gPg0KPiA+IGludGVycnVwdC1jb250cm9sbGVyQDQgew0KPiA+
ICAgICBjb21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pbnRjLW1pc2MiOw0KPiA+ICAgICBy
ZWcgPSA8MHg0IDB4ND4sDQo+ID4gICAgICAgICAgIDwweGMgMHg0PiwNCj4gPiAgICAgICAgICAg
PDB4ODAgMHg0PiwNCj4gPiAgICAgICAgICAgPDB4ODggMHg0PjsNCj4gPiAgICAgaW50ZXJydXB0
LWNvbnRyb2xsZXI7DQo+IA0KPiBUaGF0IHdvdWxkIG1lYW4gdGhhdCB0aGlzIGRldmljZSBpcyBp
bnN0ZWFkIHBhcnQgb2YgdGhlIHBhcmVudC4gSWYgeW91IGRvIG5vdA0KPiBoYXZlIHNlcGFyYXRl
IGFkZHJlc3Mgc3BhY2UsIGhvdyBpcyBpdCBhIHNlcGFyYXRlIGRldmljZT8NCj4gDQoNCkkgd2ls
bCBkcm9wIHRoZSBzZXBhcmF0ZSBpbnRlcnJ1cHQtY29udHJvbGxlciBub2RlIGFuZCBtYWtlIHRo
ZSBzeXNjb24NCm5vZGUgaXRzZWxmIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlcjoNCg0Kc3lzY29u
IG5vZGUgd291bGQgbG9vayBsaWtlIHRoaXM6DQoNCglpc286IHN5c2NvbkA3MDAwIHsNCgkJY29t
cGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDE2MjUtaXNvLXN5c2NvbiIsICJzeXNjb24iLCAic2ltcGxl
LW1mZCI7DQoJCXJlZyA9IDwweDcwMDAgMHgxMDAwPjsNCgkJaW50ZXJydXB0cy1leHRlbmRlZCA9
IDwmZ2ljIEdJQ19TUEkgNDEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JmdpYyBHSUNfU1BJIDU3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZnaWMgR0lDX1NQSSAzOSBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsNCgkJaW50ZXJydXB0LWNvbnRyb2xsZXI7DQoJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8
MT47DQoJfTsNCg0KSW4gYWRkaXRpb24sIEkgd291bGQgbGlrZSB0byBjb25maXJtIG9uZSB0aGlu
Zy4NClRoZSBpc28gc3lzY29uIHJlZ2lvbiAoMHg3MDAwLTB4N2ZmZikgb3ZlcmxhcHMgd2l0aCB0
aGUgZXhpc3RpbmcNCnVhcnQwIG5vZGUgKHNlcmlhbEA3ODAwKSBpbiBrZW50LmR0c2kgWzFdLiBJ
cyB0aGlzIG92ZXJsYXANCmFjY2VwdGFibGU/DQoNClsxXSBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ny4zLXJjMS9zb3VyY2UvYXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrL2tl
bnQuZHRzaSNMMTQ0DQoNCn07DQo+ID4gICAgIC4uLg0KPiA+IH07DQo+ID4NCj4gPiBDb3VsZCB5
b3UgcGxlYXNlIGNvbmZpcm0gaWYgdGhpcyBpcyB0aGUgY29ycmVjdCBhbmQgcHJlZmVycmVkIGFw
cHJvYWNoPw0KPiA+DQo+ID4+Pg0KPiA+Pj4gV2lsbCB1cGRhdGUgdGhlIGV4YW1wbGUgdG8gcmVt
b3ZlIHRoZSB1bm5lY2Vzc2FyeSBwcm9wZXJ0aWVzIGZyb20NCj4gPj4+IHRoZSBwYXJlbnQgYXMg
Zm9sbG93czoNCj4gPj4+DQo+ID4+PiBzeXNjb25ANzAwMCB7DQo+ID4+PiAgICAgY29tcGF0aWJs
ZSA9ICJyZWFsdGVrLHJ0ZDE2MjUtaXNvIiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsNCj4gPj4+
ICAgICByZWcgPSA8MHg3MDAwIDB4MTAwMD47DQo+ID4+Pg0KPiA+Pg0KPiA+PiBTdGlsbCBpbmNv
bXBsZXRlLiBXaGVyZSBhcmUgb3RoZXIgZGV2aWNlcz8NCj4gPj4NCj4gPg0KPiA+IEluIHRoZSBw
YXN0LCBBbmRyZWFzIHVzZWQgYSBnZW5lcmljICdAWzAtOWEtZl0rJCInIHRvIG1hdGNoIGNoaWxk
IG5vZGVzLg0KPiA+IEJlY2F1c2Ugb2YgdGhpcywgaW4gb2xkZXIgU29DcyAoZS5nLiwgcnRkMTI5
eC5kdHNpLCBydGQxNnh4LmR0c2ksDQo+ID4gcnRkMTM5eC5kdHNpKSwgZGV2aWNlcyBsaWtlIHJl
c2V0LWNvbnRyb2xsZXIsIHdhdGNoZG9nLCBhbmQgc2VyaWFsDQo+ID4gd2VyZSBhbGxvd2VkIGFu
ZCBwbGFjZWQgdW5kZXIgdGhlIGlzbyBvciBtaXNjIHN5c2NvbiBub2Rlcy4NCj4gPg0KPiA+IEhv
d2V2ZXIsIEkgaGF2ZSBzb21lIGRvdWJ0cyBhYm91dCBjb250aW51aW5nIHRvIHVzZSB0aGF0IGV4
YWN0IHN0cnVjdHVyZToNCj4gPg0KPiA+IDEuIFdlIHByZXZpb3VzbHkgZGlzY3Vzc2VkIGFuZCBh
Z3JlZWQgWzFdIHRoYXQgZGV2aWNlcyBsaWtlIHNlcmlhbA0KPiA+IHNob3VsZCBhY3R1YWxseSBi
ZSBwbGFjZWQgdW5kZXIgcmJ1cywgbm90IHN5c2Nvbi4NCj4gPiAyLiBGb3IgdGhlIFNvQ3MgaW50
cm9kdWNlZCBpbiB0aGlzIHBhdGNoIChydGQxMzE5LHJ0ZDEzMTlkLCBydGQxMzI1LA0KPiA+IHJ0
ZDE2MjUpLCB0aGUgZHJpdmVycyBmb3IgdGhlIG90aGVyIGNoaWxkIGRldmljZXMgKGxpa2Ugd2F0
Y2hkb2cpIGFyZQ0KPiA+IG5vdCB1cHN0cmVhbWVkIHlldC4NCj4gPg0KPiA+IFRvIHByb3Blcmx5
IGZpeCB0aGUgImluY29tcGxldGUgZXhhbXBsZSIgZm9yIHRoZSBzaW1wbGUtbWZkIHN0cnVjdHVy
ZSwNCj4gPiBjb3VsZCB5b3UgcGxlYXNlIGFkdmlzZToNCj4gPg0KPiA+IDEuIFNob3VsZCBJIHJl
cGxhY2UgdGhlIGdlbmVyaWMgJ0BbMC05YS1mXSskJyBpbiB0aGUgWUFNTCBiaW5kaW5nIHdpdGgN
Cj4gPiBleHBsaWNpdCBkZXZpY2UgZGVmaW5pdGlvbnMgZm9yIHRoZXNlIHNwZWNpZmljIGNoaWxk
IG5vZGVzPw0KPiA+IDIuIEZvciB0aGUgZXhhbXBsZSBzZWN0aW9uLCBzaG91bGQgSSBqdXN0IHBv
cHVsYXRlIGl0IHdpdGgNCj4gPiBwbGFjZWhvbGRlcnMgKGUuZy4sIHdhdGNoZG9nKSByZWZlcmVu
Y2luZyBBbmRyZWFzJ3Mgb2xkZXIgRFRzIChsaWtlDQo+ID4gcnRkMTI5eC5kdHNpKSB0byBpbGx1
c3RyYXRlIHRoZSBNRkQgc3RydWN0dXJlPw0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8xNTk1MTI2NDI4OWQ0NGY3OTdlYmQ0ZTA1MjM4YjM4MEByZWFsdGVr
Lg0KPiA+IGNvbS8NCj4gDQo+IElmIHlvdSBrbm93IHRoYXQgZXhpc3RpbmcgcGF0dGVybiBpcyBu
b3QgcmVhbGx5IGNvcnJlY3QsIHBsZWFzZSBkbyBub3QgZ3JvdyBpdC4NCg0KVW5kZXJzdG9vZC4g
SSB3aWxsIGxlYXZlIHRoZSBvbGQgYmluZGluZyBhcyBpdCBpcy4NCg0KQmVzdCBSZWdhcmRzLA0K
WXUtQ2h1bg0K
