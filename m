Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8464DDB2E;
	Mon, 19 Oct 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408820; cv=none; b=KInhzLPRpU02Luv532Sd/DNPjl7jp7ZUOsZ9qm1eCYV6tklSM1ofPwtuDVkeQX1kHV1J56O2ILoiMUFWt9pTd7TyZvmLmiwGsaIvqZfZhpe5tF7kSx48a8xtH43de+cBNQxPIyPR7TIKrbFdbEMMByqJ0yoRhfuWN+flmav9V88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408820; c=relaxed/simple;
	bh=QA1eOrPJrYNKlxWlaIRYtRL2w5ep69GInvvuM85VaoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pqUeFumA1kinYt5mWRYaxYInTo9IQf75yjyo29d6mxfj7nuYXytydepoGWnFjZ4Yd4yc6tQ7wFZRb8+RQQOxsyHcoKELOqVQuz74tBSkv6Qx8vIgoFRyUacKMcCbzBLTxce/dHEZSUa3+mh4CP8XYdwn80sDWXVx8kmYwEuTSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=G7/dfBEE; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="G7/dfBEE"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69JBJIrdC1843777, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792408758; bh=QA1eOrPJrYNKlxWlaIRYtRL2w5ep69GInvvuM85VaoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=G7/dfBEEogSn5trDkoOtJmwNN5o9QZHOYwrYPKKpKyGua4LreGDym9O3fL3b974LB
	 i3T5UnL2PyeMupjYK2hohgb+KktC1IKbUCn0zEb49IAIRwz+E3zRfXfdnuG2cBKWE+
	 o4LZxhjsPbPdYWVbYX/dgAfC09W0udypNeFESx8cQSMnkMUy3Cor2A06pXrvbN6gfL
	 oRUPRIqpHgv8gUeb1WEzgowX0BWnMShpBPUOu5j334bnD1CwdyLq+fRoGoAFL7gG5S
	 Pntc6cSoDfu0uk5eWfM9CR2hQtWM0ISnJVd8m9OdY11sIzIbKFQvwsFBUf3TOcqTQR
	 1XqdwlsWCCkaQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69JBJIrdC1843777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 19:19:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 19:19:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 19:19:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Mon, 19 Oct 2026 19:19:17 +0800
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
Thread-Index: AQHdXxqxrooHtuvy+0+IPKYEf41fuLcED+AAgACnvNA=
Date: Mon, 19 Oct 2026 11:19:17 +0000
Message-ID: <b12ff328ebca405f96a9b25decdb7c81@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
 <20261019-prophetic-moth-of-youth-40dbd6@quoll>
In-Reply-To: <20261019-prophetic-moth-of-youth-40dbd6@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIE1vbiwgT2N0IDE5LCAyMDI2IGF0IDEyOjA2OjQ4QU0gKzA4
MDAsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+IEFsbG93IGFuIGludGVycnVwdCBjb250cm9sbGVy
IGFzIGEgY2hpbGQgbm9kZSBieSByZWZlcmVuY2luZyB0aGUNCj4gPiBydGQxMzE5LWludGMtaXNv
IHNjaGVtYSwgdXBkYXRlIGFkZGl0aW9uYWxQcm9wZXJ0aWVzIHRvDQo+ID4gdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzLCBhbmQgYXBwZW5kIGEgdXNhZ2UgZXhhbXBsZS4NCj4gDQo+IEkgZG8gbm90IHNl
ZSB0aGF0ICJ1cGRhdGUiLg0KPiANCg0KU29ycnkgYWJvdXQgdGhpcy4gSSB1cGRhdGVkIHRoZSBk
aWZmIGJ1dCBtaXNzZWQgdXBkYXRpbmcgdGhlIGNvbW1pdA0KbWVzc2FnZS4gV2lsbCBmaXguDQoN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0ZDF4eHgueWFt
bCAgICAgICAgIHwgMjgNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0ZDF4eHgueWFtbA0KPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0ZDF4eHgueWFt
bA0KPiA+IGluZGV4IDcxN2UyOWMzN2IzNi4uYjIxZTE0ZGYyODc5IDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGQxeHh4Lnlh
bWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0
ZWsscnRkMXh4eC55YW1sDQo+ID4gQEAgLTY1LDYgKzY1LDEwIEBAIHByb3BlcnRpZXM6DQo+ID4g
ICAgICBjb25zdDogMQ0KPiA+DQo+ID4gIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ICsgICJeaW50
ZXJydXB0LWNvbnRyb2xsZXIiOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvaW50ZXJydXB0LWNv
bnRyb2xsZXIvcmVhbHRlayxydGQxMzE5LWludGMtaXNvLnlhbWwNCj4gPiArICAgIHVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gICAgJ0BbMC05YS1mXSskJzoNCj4gPiAg
ICAgIHR5cGU6IG9iamVjdA0KPiANCj4gV2hhdCBpcyB0aGlzIGZvciB0aGVuPyBTaG91bGQgaXQg
YmUgcmVtb3ZlZD8NCj4gDQoNClRoZSBvcmlnaW5hbCBzeXNjb24gY29tcGF0aWJsZSBoYXMgb3Ro
ZXIgY2hpbGQgbm9kZXMgdGhhdCBkbyBoYXZlICdyZWcnDQpwcm9wZXJ0aWVzIGFuZCB1bml0IGFk
ZHJlc3Nlcywgc28gdGhpcyBwYXR0ZXJuIGlzIHN0aWxsIG5lZWRlZCBmb3IgdGhlbS4NCg0KPiA+
DQo+ID4gQEAgLTc2LDMgKzgwLDI3IEBAIHJlcXVpcmVkOg0KPiA+ICAgIC0gcmVnDQo+ID4NCj4g
PiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4g
PiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvaXJxLmg+DQo+ID4gKw0KPiA+ICsgICAgc3lzY29uQDcwMDAgew0KPiA+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGQxNjI1LWlzbyIsICJzeXNjb24iLCAic2lt
cGxlLW1mZCI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4NzAwMCAweDEwMDA+Ow0KPiA+ICsgICAg
ICAgIHJhbmdlcyA9IDwweDAgMHg3MDAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+IA0KPiBXaHkg
ZG8geW91IGhhdmUgY2VsbHMgaXQgeW91ciBjaGlsZCBoYXMgbm8gYWRkcmVzc2luZz8NCj4NCj4g
PiArDQo+ID4gKyAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXIgew0KPiANCj4gU28gdGhlIGJp
bmRpbmcgcmVxdWlyZXMgY2hpbGRyZW4gd2l0aCB1bml0IGFkZHJlc3MsIHllcz8NCj4gDQoNClRo
ZSBpbnRlcnJ1cHQtY29udHJvbGxlciBkb2VzIG5vdCBuZWVkIGEgdW5pdCBhZGRyZXNzIGJlY2F1
c2UgaXQgYWNjZXNzZXMNCnRoZSByZWdpc3RlcnMgdmlhIHRoZSBwYXJlbnQncyByZWdtYXAuDQoN
CldpbGwgdXBkYXRlIHRoZSBleGFtcGxlIHRvIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgcHJvcGVy
dGllcyBmcm9tIHRoZQ0KcGFyZW50IGFzIGZvbGxvd3M6DQoNCnN5c2NvbkA3MDAwIHsNCiAgICBj
b21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pc28iLCAic3lzY29uIiwgInNpbXBsZS1tZmQi
Ow0KICAgIHJlZyA9IDwweDcwMDAgMHgxMDAwPjsNCg0KICAgIGludGVycnVwdC1jb250cm9sbGVy
IHsNCiAgICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDE2MjUtaW50Yy1pc28iOw0KICAg
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCiAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwm
Z2ljPjsNCiAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQxIElSUV9UWVBFX0xFVkVMX0hJ
R0g+LA0KICAgICAgICAgICAgPEdJQ19TUEkgNTcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQogICAg
ICAgICAgICA8R0lDX1NQSSAzOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCiAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MD47DQogICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQogICAgfTsN
Cn07DQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0K
