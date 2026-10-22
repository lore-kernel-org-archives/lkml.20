Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660377;
	b=t07bzuo2Zuq2FD79SfPaBSScIjuZdL3Wdw1JXbEVY8zGpN0vwaPcfkdTKyQqTLSbh+SB
	 x+9ypjcxXEF++5fEeTxI9PjvPhNmmYEoJv+9wUSfmxOpx8PQsrQkvlR9/nMtfF8Kr6JFF
	 WTWUhFIViPaAJPhtJUdjWjrw3LQ2akbf0Z2/JHm5wjC0pmbka+9kN7RrT4txUHU2tXUMn
	 RqNyjLLCy6ZNvRD54lk3iI+SQAavym+crpTQzB4YquW3b+1B0QaMZFLt9nDU5h7dFOCc1
	 WllDNlSXrwFVM+DtxN8c4InDvvLRKmrGgr4aryK51myEkvihSXie0aJ8cqQd+Rt2Uog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660377;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sV3xJoh3E5WH6Oq6+YTEAJ85QCayDJ982ZNTGMzvMzI=;
	b=iFDEmVJMVWxjGs0sRAed2GqGwFPEykEoucrH4HXLi3/7JuTUb9yhTcf/zT15rjV3BU1H
	 njDj+7pSDFJrz/6ex7eJ6O5bxzMen83HZR1SN5dvJyIViRO4xYOyI2g2eLke0ooexDwlq
	 aZXYGxOx38Xvz3r7v0gFc6OXkm6jhHEZobxVOUuxXJzsIoXyGKg+TzasMgRFcmhqZRVG5
	 PoHDc+KjKB2mDemIOZmJtTcI9IEEvvSP4R5hRTDtblCWZr3BhqLBSxauM2i5mh/KzGpc1
	 pqTHJrX/Hszt0vWJBgMm6KU4DXP/0ZgBjDewQHP20lzJmfP0U71DCQcSk0nL7aves3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=DOpQaK4w;
	arc=none smtp.remote-ip=116.203.31.6
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED2606A31D;
	Thu, 22 Oct 2026 09:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7ED2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=DOpQaK4w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792660334;
	bh=sV3xJoh3E5WH6Oq6+YTEAJ85QCayDJ982ZNTGMzvMzI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DOpQaK4wYAkwT+yqnRSXLSwQfZAv9mXIBhdx2RSokhey5JlTAGD1MP52PsqBkHtnM
	 Hl6mNGrDJoPQyIjKStzi1+pQcGMpuvi3J6kBryLEFKuqBY3kkT/+54N+JhF8zJOkrI
	 FctWcWeQp/4R6QwaCxi0IL8D+E6HYbdfEU+YjPwgszOl0MIIzwuwbGNDXkL3Ht8EjR
	 0FlVRaZ5n+JmckmvdQeQV8HlWjvHOJASp89X2gYAm8OLivVl+Hg36R8GYpZtXJPp8f
	 NX+Z0WqxhH50m2y2x+0C258hs8swBivHifm3bSByFkifR8LCV54+k1X4aiNodMuQLl
	 a+SOE0r2nOZiA==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, Francesco Dolcini <francesco@dolcini.it>
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
Thread-Index: AQHdYWJZTE2xKAx+vUqMiv2pzw4VvLcIHF4AgAAVrACAAAUxgIABDqQA
Date: Thu, 22 Oct 2026 09:12:12 +0000
Message-ID: <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
In-Reply-To: <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4NClNlbnQ6IFdlZG5lc2RheSwg
T2N0b2JlciAyMSwgMjAyNiA4OjU2IFBNDQo+IE9uIDEwLzIxLzI2IDg6MzcgUE0sIEZyYW5jZXNj
byBEb2xjaW5pIHdyb3RlOg0KPj4gT24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgMDc6MTk6MzBQTSAr
MDIwMCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+Pj4gT24gMTAvMjEvMjYgMzo0NCBQTSwgQ2hyaXN0
b3BoIE5pZWRlcm1haWVyIHdyb3RlOg0KPj4+PiBPbiB0aGUgbWF2ZW8gYm94LCB0aGUgU1BJIHBp
bnMgYXJlIGNvbm5lY3RlZCB0byBjb25uZWN0b3IgWDEwLA0KPj4+PiBidXQgbm8gZGV2aWNlIGlz
IGNvbm5lY3RlZC4gVGhlIGRldmljZSAiZGhjb20tYm9hcmQiIHdhcyB1c2VkDQo+Pj4+IG9ubHkg
dG8gdGVzdCB0aGUgaGFyZHdhcmUsIGJ1dCB3YXMgbm90IHJlbW92ZWQgYWZ0ZXJ3YXJkLiBTbw0K
Pj4+PiByZW1vdmUgdGhpcyBkZXZpY2UgdG8gYWNjdXJhdGVseSByZXByZXNlbnQgdGhlIGN1cnJl
bnQgaGFyZHdhcmUNCj4+Pj4gY29uZmlndXJhdGlvbiBoZXJlLg0KPj4+Pg0KPj4+PiBGaXhlczog
MTQ1ZTI3MzJhNWU5ICgiQVJNOiBkdHM6IGlteDZ1bGwtZGhjb3I6IEFkZCBNYXJhbnRlYyBtYXZl
byBib3giKQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVk
ZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBDYzogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4NCj4+Pj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsr
ZHRAa2VybmVsLm9yZz4NCj4+Pj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9y
Zz4NCj4+Pj4gQ2M6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPj4+PiBDYzogU2FzY2hh
IEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPj4+PiBDYzogUGVuZ3V0cm9uaXggS2Vy
bmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4+Pj4gQ2M6IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4NCj4+Pj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBuYWJsYWRl
di5jb20+DQo+Pj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPj4+PiBDYzogaW14
QGxpc3RzLmxpbnV4LmRldg0KPj4+PiBDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQ0KPj4+
PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPj4+PiAtLS0NCj4+Pj4gICAgYXJj
aC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVvLWJveC5kdHMgfCA4IC0t
LS0tLS0tDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1h
dmVvLWJveC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZ1bGwtZGhjb3ItbWF2
ZW8tYm94LmR0cw0KPj4+PiBpbmRleCAwNDdmN2IyZDg1MjYuLmViMGI5MTA0MDExMCAxMDA2NDQN
Cj4+Pj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVv
LWJveC5kdHMNCj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRo
Y29yLW1hdmVvLWJveC5kdHMNCj4+Pj4gQEAgLTYwLDE0ICs2MCw2IEBAICZlY3NwaTQgew0KPj4+
PiAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2Vjc3BpND47DQo+Pj4+ICAgICBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOw0KPj4+PiAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4+DQo+Pj4gRHJv
cCAic3RhdHVzID0gIm9rYXkiIiB0b28gLCBzaW5jZSB0aGlzIGNvbnRyb2xsZXIgd2lsbCBiZSB1
bnVzZWQgPw0KPj4NCj4+IHlvdSBjYW4gaW5zdGFudGlhdGUgYSBuZXcgZGV2aWNlIG9uIHRoZSBT
UEkgYnVzIGZyb20gdXNlcnNwYWNlLiB1cCB0bw0KPj4geW91LCBidXQgaWYgSSB3YXMgYSB1c2Vy
IEkgd291bGQgYXBwcmVjaWF0ZSB0byBoYXZlIGl0IGVuYWJsZWQuDQo+IEdvb2QgcG9pbnQgLS0g
Q2hyaXN0b3BoLCBpcyB0aGlzIHRoZSAodXNlKWNhc2UgaGVyZSAsIGNhbiB0aGUgdXNlciBkbyB0
aGF0Pw0KDQpJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUgY2FzZSwgc2luY2UgdGhlcmUgaXNuJ3Qg
Y3VycmVudGx5IGFuIFNQSSBkZXZpY2UNCmNvbm5lY3RlZCB0byB0aGlzIGludGVyZmFjZS4gTmV2
ZXJ0aGVsZXNzLCBJJ2QgYmUgaW50ZXJlc3RlZCB0byBrbm93IGhvdw0KdG8gaW5zdGFudGlhdGUg
YSBuZXcgZGV2aWNlIGZyb20gdXNlciBzcGFjZS4NCg0KUmVnYXJkcw0KQ2hyaXN0b3BoDQo=
