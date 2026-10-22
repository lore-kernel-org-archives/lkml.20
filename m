Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659619;
	b=BxC+L+w75DBNlo/zN2oEFBWfK6UqBo+JW9mqV7JDCkD0JvnhkMuQsmRxZNF+TfRDO3LP
	 p1H3CU1aBI4CgRXqQmJXi5NRsjT+yJgsA9lWQYBgC6WTdlS9Uh0FTJFrA1T4zexsoAKiU
	 zjlNJjDHZu+G5W8L0+sVDC3+SUhXuOYqfvhsSymWu6nkwiMnWD3W4xw8yCSGR2uHXAVbc
	 RIF/+w8cBrkFTsJ1RxWl8LpWEHv9DvlleChtuTbeZWZ5H2jef88nIkviKN0aqFYIhjBN7
	 oE+4IWdnlHAOBWnP3BZB+XmnhYlKnqQ4LSd0LzGBz4s4der1s8sOHSe473F/he68ptA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659619;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qBqp13DPdEHUHCSXRn7+Q5vq7grlNus6E/juuLjtF0A=;
	b=kK6/H8QE+lh6ZPeUcWWlqwAXaOnWOrpNDgZFMhXaxCXS0sYz+KdOaA8evhZgS1JbG8ol
	 xqfbkxoNV6t48h1JwlQnGJ7k7ur3mvm5dSp5qCpmvpPXisehkEwfJ0lybxYkzPvxeVy9V
	 v2+3AQyW5tETefCxhKOI8JGQ8rYRp2H5p5FBAs6WhV4/lllvhOIwHdtV3p2jsnJUbAkvK
	 PoEW89jKnIF2mPbGd2uve2Uco5zvVV4lCVIOnex6aRD6rfj/gdH/xLWCKctcQgFg4ElWv
	 ovGcXMECtoa+bR41quYRAE35KAT0DWrFmMrNbxAzJCC6ngu7n9y1Snm9rSxCOLeMirQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=sDvq7toM;
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6E606A319;
	Thu, 22 Oct 2026 09:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C6E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=sDvq7toM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792659557;
	bh=qBqp13DPdEHUHCSXRn7+Q5vq7grlNus6E/juuLjtF0A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=sDvq7toMbyTAGofLV0Sc6uI88o6FgCdC81AuJbSvywP6GgJDjSHTtimrcV0IGcQ0i
	 n8+UjcAss5UOn0y/5pE2yp3bCM92vaBq19uFFhlfoVJWHljOzwm0HTJCV2h8hRToHV
	 1udQWEKnvxePVk9jDVjqi5bpxl0+vmCD16L+zKOwv3fZ6kVmPRXhC5Q0UFomX8jIk8
	 NyykdOq9ObUOTh/lmEde9zWBUOV1P9YQsaweyYX8EYtOXscAXlbIAONmsb9px83Bna
	 ygrhoNhVS3VxnyVWCMDmDaXRBmhXKPbGJS4+GHA3zmgiipI95UjDS6i+3MpjFOA6hu
	 NijZ6yPZ6vpwg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
Thread-Topic: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB
 number
Thread-Index: AQHdYWJeSY9vaX+wRk+57BDo1ZAIarcIHKaAgAEaxXA=
Date: Thu, 22 Oct 2026 08:59:15 +0000
Message-ID: <75107c033de14aa19a21f3b2fc66ece1@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <20261021134435.17350-2-cniedermaier@dh-electronics.com>
 <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
In-Reply-To: <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
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
T2N0b2JlciAyMSwgMjAyNiA3OjIxIFBNDQo+IE9uIDEwLzIxLzI2IDM6NDQgUE0sIENocmlzdG9w
aCBOaWVkZXJtYWllciB3cm90ZToNCj4+IFRoZSBQQ0IgbnVtYmVyIG9mIHRoZSBtYXZlbyBib3gg
aXNuJ3QgNTI1LiBDaGFuZ2UgdGhlDQo+PiBudW1iZXIgdG8gdGhlIGNvcnJlY3QgbnVtYmVyLCA2
MjUuDQo+Pg0KPj4gRml4ZXM6IDE0NWUyNzMyYTVlOSAoIkFSTTogZHRzOiBpbXg2dWxsLWRoY29y
OiBBZGQgTWFyYW50ZWMgbWF2ZW8gYm94IikNCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBO
aWVkZXJtYWllciA8Y25pZWRlcm1haWVyQGRoLWVsZWN0cm9uaWNzLmNvbT4NCj4+IC0tLQ0KPj4g
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+PiBDYzogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0KPj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRA
a2VybmVsLm9yZz4NCj4+IENjOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4+IENjOiBT
YXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+PiBDYzogUGVuZ3V0cm9uaXgg
S2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4+IENjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2
LmNvbT4NCj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPj4gQ2M6IGlteEBsaXN0
cy5saW51eC5kZXYNCj4+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tDQo+PiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPj4gLS0tDQo+PiAgIGFyY2gvYXJtL2Jvb3QvZHRz
L254cC9pbXgvaW14NnVsbC1kaGNvci1tYXZlby1ib3guZHRzIHwgMiArLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVvLWJveC5kdHMg
Yi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZ1bGwtZGhjb3ItbWF2ZW8tYm94LmR0cw0K
Pj4gaW5kZXggZWIwYjkxMDQwMTEwLi5iYjgyZDk3ZjlkODQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9ueHAvaW14L2lteDZ1bGwtZGhjb3ItbWF2ZW8tYm94LmR0cw0KPj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRoY29yLW1hdmVvLWJveC5kdHMN
Cj4+IEBAIC02LDcgKzYsNyBAQA0KPj4gICAgKiBESENPTSBpTVg2VUxMIHZhcmlhbnQ6DQo+PiAg
ICAqIERIQ1ItaU1YNlVMTC1DMDgwLVIwNTEtU1BJLVdCVC1JLTAxTEcNCj4+ICAgICogREhDT1Ig
UENCIG51bWJlcjogNTc4LTIwMCBvciBuZXdlcg0KPj4gLSAqIG1hdmVvIGJveCBQQ0IgbnVtYmVy
OiA1MjUtMjAwIG9yIG5ld2VyDQo+PiArICogbWF2ZW8gYm94IFBDQiBudW1iZXI6IDYyNS0yMDAg
b3IgbmV3ZXINCj4gSXMgdGhlIHJldi4yMDAgY29ycmVjdCAsIG9yIGlzIHRoZSBiYXNlIGJvYXJk
IHN0aWxsIHJldi4xMDAgPw0KDQpIYXJkd2FyZSByZXYuMTAwIHdhcyBhIHByb3RvdHlwZSB0aGF0
IHdhcyBuZXZlciBzaGlwcGVkIGFuZA0KaXMgbm90IGNvbXBhdGlibGUgd2l0aCByZXYuMjAwIG9y
IGxhdGVyLg0KDQpSZWdhcmRzDQpDaHJpc3RvcGgNCg==
