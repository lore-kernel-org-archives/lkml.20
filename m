Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651507;
	b=tf0MJv6XjGaB6oSkHeWXYQ0R0drr/OIGRcSar3LqkshMHfaj2sINNUqG3m/xX7wRm4bJ
	 P4St2efY3YujtT8xYOh4qdjqme/qTCsJgafkuN0oTJ+m8spDiTfonegIkjY4T8oa55zAF
	 i4FBRqth+hiovn7ZEM5BudbBr1ppd8Z6UvVdnEKFJAfWvFOCo/BqioqEKujCDgGgSfcgk
	 hW9W7bYBjmRnnHTfAVRJLjymPHuMHTPk1A99dT6uTWQ7NI8IB1fMsOQ8tzlxDB1Dh+rbS
	 /Ez+jB2xSQItkrjqDgd3h9CrEiOnBvOdQZWAN01RJrdGdPh6vt+JJdsuvcCJ/ImkO4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651507;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QTwJSPOti9Y6zWrCbrnQDZv23h9b8QcoecB+3/18N5w=;
	b=LD4GvimsCEXGxyDVgkZ/q+tBTOINNVwbM60uoxlUSa4pxyBDKESYpjrYciBMriwcu9HN
	 lbPF82lQaG1P1rYQv6tYuZaYr+5QtjmZliBG7Wy3gkYd5BW+934BbwOpQCRKc5gVbS+9h
	 6n60b3CNv7LZjW1rHhBmF/IZ+c7el+V+YTQ6kZVGCJO6ppaQseS1GRpnIeFKXRgpkSJMr
	 VjxA0jxMb95SQr/Ad1q1j+lQFy32lBJT4uDTgZIINt382xgkVLb3ZrXvJ3xvhQlUlD4pX
	 URsIQPMTRAMa/M3eRXcRI0myaOKmJTWVoicrfE8SIvEPVlR2y5tCKo35vhl+iyihitg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=C6iuK5C6;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED66606A31A;
	Thu, 22 Oct 2026 06:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=C6iuK5C6
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69M6iBDv9702485, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792651452; bh=QTwJSPOti9Y6zWrCbrnQDZv23h9b8QcoecB+3/18N5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=C6iuK5C60MiMvm1LQdecBithjKRWy/9qhNHPGw4xDgDT2iXai53/47Xkmq8rtB17j
	 kXrbYcU2MEDSooTkV0AjvdXfeukAsp74S3j0zR4VBFvjnhEwznDW7RQjbx25/AfxPX
	 7o87f7/Lp8rtykXc0d40vV3DLyNTKUeTTiY8OSTS2yoOtrnpE+Nt2jaWrmjspLQ2Fy
	 0+V2Oi4jln1pc7XY5cLrDMLoTi0n8Z2q4oRi/cmnnLKcKgj9ZPgQKnjUPqZIUr8XN6
	 FaMOCo5rWpBPFfYUUfwCRJD5KoVgerZ/OlC4PBlQB7mT/oXYwM9TsCI0WJAjyw+5Ha
	 9hBEFpA1d8JDQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69M6iBDv9702485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Oct 2026 14:44:12 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 14:44:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 14:44:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Thu, 22 Oct 2026 14:44:12 +0800
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
Thread-Index: AQHdXxqxrooHtuvy+0+IPKYEf41fuLcED+AAgACnvNCAALIlgIADtvpA
Date: Thu, 22 Oct 2026 06:44:11 +0000
Message-ID: <ef63cc3df2424f888ba807701af0ce84@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
 <20261019-prophetic-moth-of-youth-40dbd6@quoll>
 <b12ff328ebca405f96a9b25decdb7c81@realtek.com>
 <d6d7c3ba-5329-4c90-8994-ea29cedd7c53@kernel.org>
In-Reply-To: <d6d7c3ba-5329-4c90-8994-ea29cedd7c53@kernel.org>
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

SGkgS3J6eXN6dG9mLA0KDQo+ID4+PiAgcGF0dGVyblByb3BlcnRpZXM6DQo+ID4+PiArICAiXmlu
dGVycnVwdC1jb250cm9sbGVyIjoNCj4gPj4+ICsgICAgJHJlZjogL3NjaGVtYXMvaW50ZXJydXB0
LWNvbnRyb2xsZXIvcmVhbHRlayxydGQxMzE5LWludGMtaXNvLnlhbWwNCj4gPj4+ICsgICAgdW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+Pj4gKw0KPiA+Pj4gICAgJ0BbMC05YS1mXSsk
JzoNCj4gPj4+ICAgICAgdHlwZTogb2JqZWN0DQo+ID4+DQo+ID4+IFdoYXQgaXMgdGhpcyBmb3Ig
dGhlbj8gU2hvdWxkIGl0IGJlIHJlbW92ZWQ/DQo+ID4+DQo+ID4NCj4gPiBUaGUgb3JpZ2luYWwg
c3lzY29uIGNvbXBhdGlibGUgaGFzIG90aGVyIGNoaWxkIG5vZGVzIHRoYXQgZG8gaGF2ZSAncmVn
Jw0KPiA+IHByb3BlcnRpZXMgYW5kIHVuaXQgYWRkcmVzc2VzLCBzbyB0aGlzIHBhdHRlcm4gaXMg
c3RpbGwgbmVlZGVkIGZvciB0aGVtLg0KPiA+DQo+ID4+Pg0KPiA+Pj4gQEAgLTc2LDMgKzgwLDI3
IEBAIHJlcXVpcmVkOg0KPiA+Pj4gICAgLSByZWcNCj4gPj4+DQo+ID4+PiAgYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlDQo+ID4+PiArDQo+ID4+PiArZXhhbXBsZXM6DQo+ID4+PiArICAtIHwN
Cj4gPj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2Fy
bS1naWMuaD4NCj4gPj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2lycS5oPg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBzeXNjb25ANzAwMCB7DQo+ID4+PiAr
ICAgICAgICBjb21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pc28iLCAic3lzY29uIiwgInNp
bXBsZS1tZmQiOw0KPiA+Pj4gKyAgICAgICAgcmVnID0gPDB4NzAwMCAweDEwMDA+Ow0KPiA+Pj4g
KyAgICAgICAgcmFuZ2VzID0gPDB4MCAweDcwMDAgMHgxMDAwPjsNCj4gPj4+ICsgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+Pj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+
ID4+DQo+ID4+IFdoeSBkbyB5b3UgaGF2ZSBjZWxscyBpdCB5b3VyIGNoaWxkIGhhcyBubyBhZGRy
ZXNzaW5nPw0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xs
ZXIgew0KPiA+Pg0KPiA+PiBTbyB0aGUgYmluZGluZyByZXF1aXJlcyBjaGlsZHJlbiB3aXRoIHVu
aXQgYWRkcmVzcywgeWVzPw0KPiA+Pg0KPiA+DQo+ID4gVGhlIGludGVycnVwdC1jb250cm9sbGVy
IGRvZXMgbm90IG5lZWQgYSB1bml0IGFkZHJlc3MgYmVjYXVzZSBpdA0KPiA+IGFjY2Vzc2VzIHRo
ZSByZWdpc3RlcnMgdmlhIHRoZSBwYXJlbnQncyByZWdtYXAuDQo+IA0KPiBUaGF0J3Mgbm90IHJl
YWxseSByZWxldmFudC4gQ2hpbGQgZHJpdmVycyBzdGlsbCBhY2Nlc3MgdmlhIHBhcmVudCdzIHJl
Z21hcCBhbmQNCj4gaGF2ZSB1bml0IGFkZHJlc3MuIFRoaXMgYmluZGluZyBoYXMgYnVzIGFkZHJl
c3NpbmcgZm9yIGNoaWxkcmVuLCBzbyB1c2UgaXQuIERvDQo+IG5vdCBhZGQgcmFuZG9tIG9yIGlu
Y29uc2lzdGVudCBjb2RlLg0KPiANCg0KVGhlIHJlZ2lzdGVycyBmb3IgaW50ZXJydXB0IGNvbnRy
b2xsZXIgYXJlIHF1aXRlIHNjYXR0ZXJlZCB3aXRoaW4gdGhlIHBhcmVudA0Kc3lzY29uIGJsb2Nr
LiBUYWtlIHJ0ZDE2MjUtaW50Yy1taXNjIGFzIGFuIGV4YW1wbGUsIHRoZSBvZmZzZXRzIGFyZSAw
eDQsDQoweGMsIDB4ODAsIGFuZCAweDg4IEFmdGVyIGFkZGluZyB1bml0LWFkZHJlc3MgYW5kIHJl
Zy4NCkl0IHdvdWxkIGJlIGxpa2U6DQoNCmludGVycnVwdC1jb250cm9sbGVyQDQgew0KICAgIGNv
bXBhdGlibGUgPSAicmVhbHRlayxydGQxNjI1LWludGMtbWlzYyI7DQogICAgcmVnID0gPDB4NCAw
eDQ+LA0KICAgICAgICAgIDwweGMgMHg0PiwNCiAgICAgICAgICA8MHg4MCAweDQ+LA0KICAgICAg
ICAgIDwweDg4IDB4ND47DQogICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQogICAgLi4uDQp9Ow0K
DQpDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gaWYgdGhpcyBpcyB0aGUgY29ycmVjdCBhbmQgcHJl
ZmVycmVkIGFwcHJvYWNoPw0KDQo+ID4NCj4gPiBXaWxsIHVwZGF0ZSB0aGUgZXhhbXBsZSB0byBy
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHByb3BlcnRpZXMgZnJvbSB0aGUNCj4gPiBwYXJlbnQgYXMg
Zm9sbG93czoNCj4gPg0KPiA+IHN5c2NvbkA3MDAwIHsNCj4gPiAgICAgY29tcGF0aWJsZSA9ICJy
ZWFsdGVrLHJ0ZDE2MjUtaXNvIiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsNCj4gPiAgICAgcmVn
ID0gPDB4NzAwMCAweDEwMDA+Ow0KPiA+DQo+IA0KPiBTdGlsbCBpbmNvbXBsZXRlLiBXaGVyZSBh
cmUgb3RoZXIgZGV2aWNlcz8NCj4gDQoNCkluIHRoZSBwYXN0LCBBbmRyZWFzIHVzZWQgYSBnZW5l
cmljICdAWzAtOWEtZl0rJCInIHRvIG1hdGNoIGNoaWxkIG5vZGVzLg0KQmVjYXVzZSBvZiB0aGlz
LCBpbiBvbGRlciBTb0NzIChlLmcuLCBydGQxMjl4LmR0c2ksIHJ0ZDE2eHguZHRzaSwNCnJ0ZDEz
OXguZHRzaSksIGRldmljZXMgbGlrZSByZXNldC1jb250cm9sbGVyLCB3YXRjaGRvZywgYW5kIHNl
cmlhbCB3ZXJlDQphbGxvd2VkIGFuZCBwbGFjZWQgdW5kZXIgdGhlIGlzbyBvciBtaXNjIHN5c2Nv
biBub2Rlcy4NCg0KSG93ZXZlciwgSSBoYXZlIHNvbWUgZG91YnRzIGFib3V0IGNvbnRpbnVpbmcg
dG8gdXNlIHRoYXQgZXhhY3Qgc3RydWN0dXJlOg0KDQoxLiBXZSBwcmV2aW91c2x5IGRpc2N1c3Nl
ZCBhbmQgYWdyZWVkIFsxXSB0aGF0IGRldmljZXMgbGlrZSBzZXJpYWwgc2hvdWxkDQphY3R1YWxs
eSBiZSBwbGFjZWQgdW5kZXIgcmJ1cywgbm90IHN5c2Nvbi4NCjIuIEZvciB0aGUgU29DcyBpbnRy
b2R1Y2VkIGluIHRoaXMgcGF0Y2ggKHJ0ZDEzMTkscnRkMTMxOWQsIHJ0ZDEzMjUsDQpydGQxNjI1
KSwgdGhlIGRyaXZlcnMgZm9yIHRoZSBvdGhlciBjaGlsZCBkZXZpY2VzIChsaWtlIHdhdGNoZG9n
KSBhcmUgbm90DQp1cHN0cmVhbWVkIHlldC4NCg0KVG8gcHJvcGVybHkgZml4IHRoZSAiaW5jb21w
bGV0ZSBleGFtcGxlIiBmb3IgdGhlIHNpbXBsZS1tZmQgc3RydWN0dXJlLA0KY291bGQgeW91IHBs
ZWFzZSBhZHZpc2U6DQoNCjEuIFNob3VsZCBJIHJlcGxhY2UgdGhlIGdlbmVyaWMgJ0BbMC05YS1m
XSskJyBpbiB0aGUgWUFNTCBiaW5kaW5nIHdpdGgNCmV4cGxpY2l0IGRldmljZSBkZWZpbml0aW9u
cyBmb3IgdGhlc2Ugc3BlY2lmaWMgY2hpbGQgbm9kZXM/DQoyLiBGb3IgdGhlIGV4YW1wbGUgc2Vj
dGlvbiwgc2hvdWxkIEkganVzdCBwb3B1bGF0ZSBpdCB3aXRoIHBsYWNlaG9sZGVycw0KKGUuZy4s
IHdhdGNoZG9nKSByZWZlcmVuY2luZyBBbmRyZWFzJ3Mgb2xkZXIgRFRzIChsaWtlIHJ0ZDEyOXgu
ZHRzaSkgdG8NCmlsbHVzdHJhdGUgdGhlIE1GRCBzdHJ1Y3R1cmU/DQoNClsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzE1OTUxMjY0Mjg5ZDQ0Zjc5N2ViZDRlMDUyMzhiMzgwQHJlYWx0
ZWsuY29tLw0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo=
