Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666735;
	b=Dj7IRoCZ/XmqByf17sAtMTHq05dvhxHjzbZqoUlNuCK6Uye7JWJGEwCurnz3O16D8v9O
	 84rMi1rY6EoLkiAxYcHti2DwX0UnXz7XVcIf7bU5YD2Z4suLfOs8TsnhhI2btoYCwtyiM
	 4/tQsAiNxhGouvAP6/tULxXq7F89DAOAxVyiUa+JJJEcaKivoK41+UVRTzUToNuK4GPyI
	 KZ3oNR07p/2xeXnh1cyvDFgc2PtnmcPQoinvAvx7AJIIUMhHUnYU5djvgFoVctoKMmFHC
	 kB9971RH1y5IzBz5hLq+cSCKKNvlZKY9zPRDKW0WmCDiODuSLH4PJJmKRuoIY4jyLWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666735;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=43/F1bWKItWCpS9O3/hFiulcJFFFuEja5jONgOWJrrA=;
	b=0C7+0xqM7YQOpc4m3zJvjxXJF6dckwB8CFFKQ6XBHECUn0LeloGdbLrooXOtaC7bQJsY
	 YSGcw5fM68P8Ja/upa9XzLUtaBLdW3aNlzTLT+qcpMNoogarr8Q3jiosU7TLRt3AF4wYz
	 +aec4gqwWKeYz8YVV/ey0v6b1JRepN8XI177c1qUr7UfmEKczjy1V/tkDCIfWtt7i8mnc
	 L//SVSCyeBpS6d4x9OkAhruHUfurFn32lL0V3I3Tg+lOxdnN61QDPOj1+4d8rAwBO0gCY
	 9SArfdJcYv0xATFVWr6YPMeo8qK1Xfs+GCs/CSz8IvjvTGz6WRofPQGlNn8FOOdHPIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=T8eDSq1a;
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F8606A319;
	Thu, 22 Oct 2026 10:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811F8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=T8eDSq1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792666702;
	bh=43/F1bWKItWCpS9O3/hFiulcJFFFuEja5jONgOWJrrA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=T8eDSq1aNTq5qFIZmDgPlXMQcyqp0+IRXU+FNvoJRSUWGugD36vx4KVMV60c72tbG
	 se2zHEEAYq7LQ1RVdD+vxjf1UX8NqONBoxlJ3E6+oudzjjjYC0JT2TyF1VfvGler67
	 w+I2aZRYcwJNLxPdjRoFz/j2OWT/WZP/iroCChyb/NShCoeaWy9uJJDJ5y1MADyzsp
	 htRDJukA4E+OaJz6VZ/xB3UkKJInSI5Oma2GwlGcFW+msZ051UhsqG+Q520P6efuqF
	 KHJnfqm3yITECyWe5wtYPcAxZE7HswtAxt+Ylrrj3hnFXQ4Q2trnkn8S0i90E+h1jj
	 CKw/NTUMmq3RA==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@nabladev.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Thread-Topic: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Thread-Index: AQHdYWJZTE2xKAx+vUqMiv2pzw4VvLcIHF4AgAAVrACAAAUxgIABDqQA///kbACAADcugA==
Date: Thu, 22 Oct 2026 10:58:19 +0000
Message-ID: <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
 <20261022092536.GA232648@francesco-nb>
In-Reply-To: <20261022092536.GA232648@francesco-nb>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
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

RnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNjb0Bkb2xjaW5pLml0Pg0KU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgMjIsIDIwMjYgMTE6MjYgQU0NCj4gDQo+IEhlbGxvIENocmlzdG9waCwN
Cj4gDQo+IE9uIFRodSwgT2N0IDIyLCAyMDI2IGF0IDA5OjEyOjEyQU0gKzAwMDAsIENocmlzdG9w
aCBOaWVkZXJtYWllciB3cm90ZToNCj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBuYWJsYWRl
di5jb20+DQo+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjEsIDIwMjYgODo1NiBQTQ0KPj4+
IE9uIDEwLzIxLzI2IDg6MzcgUE0sIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOg0KPj4+PiBPbiBX
ZWQsIE9jdCAyMSwgMjAyNiBhdCAwNzoxOTozMFBNICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToN
Cj4+Pj4+IE9uIDEwLzIxLzI2IDM6NDQgUE0sIENocmlzdG9waCBOaWVkZXJtYWllciB3cm90ZToN
Cj4gDQo+IFsuLi5dDQo+IA0KPj4+Pj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgv
aW14NnVsbC1kaGNvci1tYXZlby1ib3guZHRzDQo+Pj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVvLWJveC5kdHMNCj4+Pj4+PiBAQCAtNjAsMTQg
KzYwLDYgQEAgJmVjc3BpNCB7DQo+Pj4+Pj4gICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9lY3Nw
aTQ+Ow0KPj4+Pj4+ICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4+Pj4+ICAgICBz
dGF0dXMgPSAib2theSI7DQo+Pj4+Pg0KPj4+Pj4gRHJvcCAic3RhdHVzID0gIm9rYXkiIiB0b28g
LCBzaW5jZSB0aGlzIGNvbnRyb2xsZXIgd2lsbCBiZSB1bnVzZWQgPw0KPj4+Pg0KPj4+PiB5b3Ug
Y2FuIGluc3RhbnRpYXRlIGEgbmV3IGRldmljZSBvbiB0aGUgU1BJIGJ1cyBmcm9tIHVzZXJzcGFj
ZS4gdXAgdG8NCj4+Pj4geW91LCBidXQgaWYgSSB3YXMgYSB1c2VyIEkgd291bGQgYXBwcmVjaWF0
ZSB0byBoYXZlIGl0IGVuYWJsZWQuDQo+Pj4gR29vZCBwb2ludCAtLSBDaHJpc3RvcGgsIGlzIHRo
aXMgdGhlICh1c2UpY2FzZSBoZXJlICwgY2FuIHRoZSB1c2VyIGRvIHRoYXQ/DQo+Pg0KPj4gSSBk
b24ndCB0aGluayB0aGF0J3MgdGhlIGNhc2UsIHNpbmNlIHRoZXJlIGlzbid0IGN1cnJlbnRseSBh
biBTUEkgZGV2aWNlDQo+PiBjb25uZWN0ZWQgdG8gdGhpcyBpbnRlcmZhY2UuIE5ldmVydGhlbGVz
cywgSSdkIGJlIGludGVyZXN0ZWQgdG8ga25vdyBob3cNCj4+IHRvIGluc3RhbnRpYXRlIGEgbmV3
IGRldmljZSBmcm9tIHVzZXIgc3BhY2UuDQo+IA0KPiBEb2N1bWVudGF0aW9uL3NwaS9pbnN0YW50
aWF0aW5nLWRldmljZXMucnN0DQoNClRoaXMgaXMgYSByZWxhdGl2ZWx5IG5ldyBkb2N1bWVudCwg
SSBoYXZlbid0IHNlZW4gaXQgeWV0LiBUaGFuayB5b3UgdmVyeSBtdWNoLg0KDQpJJ20gbm93IGxl
YW5pbmcgdG93YXJkIGxlYXZpbmcgdGhlIGludGVyZmFjZSBzZXQgdG8g4oCcb2theeKAnSBzbyB0
aGF0IHRoZSBleGlzdGluZw0KU1BJIHBpbnMgb24gWDEwIGNvbm5lY3RvciBjYW4gZWFzaWx5IGFj
Y2Vzc2VkIGluIHRoZSBmdXR1cmUuDQoNCkBNYXJlazogSWYgeW91IGluc2lzdCwgSSBjYW4gYWxz
byByZW1vdmUgdGhlIHN0YXR1cyBsaW5lLg0KDQoNClJlZ2FyZHMNCkNocmlzdG9waA0K
