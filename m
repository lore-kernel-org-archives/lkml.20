Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107221;
	b=1LyiGQhSsigVQwgAa2WVrI18PIjBJUCB9Rkaz9m2bZfoQa5GmMhcxixHefg+IyMTXIDl
	 sb+t6JKXrXU1rW/36N5Zi5QHHiy9RCSIk128od0b08aQFVCqSN+nzTB1xf0eB27Z/rrzv
	 rgmFFwwroBtuFFp/OSNj8HmNVWON28JhKz6pjEZhIkpXKYEH9CLTISr0iB2fQNJ333Iyv
	 JIYT897iDX08P0Dhp0VT+tAL+ZqU6humla2VLd7xPsBRIouZPiNTcaJzPHhQ1cX51ht+e
	 bR5wThjl4WHcqJyKv4LSwEq/1C5nAP3pRY1eqQFFKvZk17y+9XiqNjCDjrBrzJavG3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107221;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NgdDlzhSW3zizye8YCZqZJ/83KLqMv9ltqKtYqjtZmo=;
	b=mj/ieau9qGCeed39DmOBpoW1cdqoe0u97MyDz304Fq/4aC/9T0r6zpdRyyrW+1hm4PD2
	 ZcEbAAEKvizKBRjc0p8XnoBkpxPiG5960qIKeVaGXMGZaIk/W/p5H72IVN7KjRtK4jAvj
	 QYfETRL1Iv/n0dYaE+Tt6HhXIkConXIfPA0isDSZJmbPxM4Pyvw1NNREl3dsoftvLH3Dr
	 isYZBOeuZTIf25v7Hd01l8K/MCplJ6NiZ75VPuGfanT08tdGtkCcgQZv5qsbM+2AVUHg/
	 KGGix1g2o3Zj1+GGATQpVBQcUuQzretuMzZJUi5lCkB0rJq531DqXWT1ot9E6cqfWqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Zgty6MIj;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08C606A31A;
	Sun,  8 Nov 2026 03:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C08C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Zgty6MIj
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A836S9O03108934, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794107188; bh=NgdDlzhSW3zizye8YCZqZJ/83KLqMv9ltqKtYqjtZmo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Zgty6MIjTtLrq0Gj+zYt6bu4gany++GMonz756hOB/K0ro6zmt8VkIZKP6TJDNDmq
	 2rLKwzuUPKT6mM/202LLbh3EjLiRCsaSVI7BQyGQFVgYRBd7+vMKS2BGnlCgt0/FQ0
	 60TEsxNLw0f6IgWeMnb335l+HVvbM7rzse0TqLzvOnP3R1v/yVnr5oOb9Wwhrn4jhG
	 Nn6uIUYDMgKYTnpJ7G4KFFum7+Yv8YrDhWLEHfUoL7hWb/Bk9LR79SdDWEjzPe7YjI
	 CrwLi+3xPUz1QVUjBka79Gmo5XhIQPOBzSfQceMzwrQZkFZoqhhsLu6mEMe8zVPduK
	 NE+o6fFRsWQ0A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A836S9O03108934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 11:06:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 11:06:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 8 Nov 2026 11:06:16 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Alastair D'Silva
	<alastair@d-silva.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Alastair
 D'Silva" <alastair@d-silva.org>
Subject: RE: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX
 request interrupt storm
Thread-Topic: [PATCH rtw-next v9 0/4] wifi: rtw88: sdio: Fix unhandled RX
 request interrupt storm
Thread-Index: AQHdbmubDtMQEoMQ7UqQ9bl+kqyQ0bchwisAgAG8zdA=
Date: Sun, 8 Nov 2026 03:06:15 +0000
Message-ID: <f2784538533947a38e9d03af7bc7fce8@realtek.com>
References: <20261107035321.1210303-1-alastair@d-silva.org>
 <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev>
In-Reply-To: <ab3dcde64bb90809ae10627803315d7385d6708e@linux.dev>
Accept-Language: en-US, zh-TW
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBOb3ZlbWJlciA3LCAy
MDI2IGF0IDQ6NTMgQU0sICJBbGFzdGFpciBEJ1NpbHZhIiA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+
IHdyb3RlOg0KPiANCj4gPg0KPiA+IE9uIDMwODEtYmFzZWQgU0RJTyBjaGlwcyAob2JzZXJ2ZWQg
b24gUlRMODgyMUNTOyBSVEw4ODIyQlMgYW5kIFJUTDg4MjJDUw0KPiA+IGFyZSBpbmZlcnJlZCB0
byBiZSBhZmZlY3RlZCBhcyB0aGV5IHNoYXJlIHRoZSAzMDgxIGFyY2hpdGVjdHVyZSksIGNsZWFy
aW5nDQo+ID4gUkVHX1NESU9fSElTUl9SWF9SRVFVRVNUIHJlcXVpcmVzIGJvdGggYSBzb2Z0d2Fy
ZSBXMUMgYWNrbm93bGVkZ2UgYW5kIGFuDQo+ID4gZW1wdHkgUlggRklGTy4gTWFza2luZyB0aGlz
IGJpdCBvdXQgYmVmb3JlIHdyaXRpbmcgYmFjayB0byBISVNSIHByZXZlbnRzDQo+ID4gdGhlIHNv
ZnR3YXJlIGFja25vd2xlZGdlIGZyb20gaGFwcGVuaW5nLCBsZWF2aW5nIHRoZSBiaXQgYXNzZXJ0
ZWQgZXZlbg0KPiA+IGFmdGVyIHRoZSBGSUZPIGlzIGRyYWluZWQgYW5kIHRyYXBwaW5nIHRoZSBD
UFUgY29yZSBpbiBhbiBpbmZpbml0ZQ0KPiA+IGludGVycnVwdCBzdG9ybSB0aGF0IGxvY2tzIHVw
IHRoZSBzeXN0ZW0gdXBvbiByZWNlaXZpbmcgbmV0d29yayB0cmFmZmljLg0KPiA+DQo+ID4gVGhp
cyBzZXJpZXMgZml4ZXMgdGhlIGludGVycnVwdCBzdG9ybSBvbiAzMDgxIGNoaXBzIGFuZCBhZGRy
ZXNzZXMNCj4gPiByZWxhdGVkIFNESU8gbGlmZWN5Y2xlLCBsb2NraW5nLCBhbmQgZXJyb3IgaGFu
ZGxpbmcgaXNzdWVzOg0KPiA+DQo+ID4gLSBQYXRjaCAxIHJldHVybnMgZXJyb3IgY29kZXMgZnJv
bSBydHdfc2Rpb19yeGZpZm9fcmVjdigpIG9uIGFsbG9jYXRpb24sDQo+ID4gIG92ZXJzaXplZCBw
YWNrZXQsIG9yIHJlYWQgZmFpbHVyZXMgc28gdGhlIGNhbGxlciBzdG9wcyBpbW1lZGlhdGVseQ0K
PiA+ICBpbnN0ZWFkIG9mIGJ1cm5pbmcgdGhyb3VnaCB0aGUgbG9vcCBidWRnZXQuDQo+ID4gLSBQ
YXRjaCAyIHRyYWNrcyBvcGVyYXRpb25hbCBzdGF0ZSB2aWEgcnR3c2Rpby0+cnVubmluZyBwcm90
ZWN0ZWQgYnkgYW4NCj4gPiAgaXJxX2xvY2sgbXV0ZXggKHVzaW5nIGEgbXV0ZXggYXMgU0RJTyBi
dXMgb3BlcmF0aW9ucyBzbGVlcCksIHNlcmlhbGl6ZXMNCj4gPiAgc3RhcnQvc3RvcCBzdGF0ZSB0
cmFuc2l0aW9ucyB1bmRlciBzZGlvX2NsYWltX2hvc3QoKSBhbmQgaXJxX2xvY2ssDQo+ID4gIGNh
bmNlbHMgdGhlIFRYIHdvcmtlciBzeW5jaHJvbm91c2x5IG9uIHN0b3AsIGRyYWlucyBydHdzZGlv
LT50eF9xdWV1ZVtdDQo+ID4gIHdpdGggbG9ja2VkIHNrYl9kZXF1ZXVlKCkgYW5kIGllZWU4MDIx
MV9mcmVlX3R4c2tiKCkgaW4gcnR3X3NkaW9fc3RvcCgpDQo+ID4gIGFuZCBhZ2FpbiBpbiBydHdf
c2Rpb19zdGFydCgpLCBhbmQgcmVzZXRzIHJ0d3NkaW8tPnR4X3F1ZXVlX3N0b3BwZWRbXQ0KPiA+
ICB3aGlsZSB3YWtpbmcgc3RvcHBlZCBBQyBxdWV1ZXMgdW5kZXIgdHhfcXVldWVbXS5sb2NrIGlu
IHJ0d19zZGlvX3N0YXJ0KCkuDQo+ID4gLSBQYXRjaCAzIGZpeGVzIHRoZSBpbnRlcnJ1cHQgc3Rv
cm0gYnkgc3BsaXR0aW5nDQo+ID4gIHJ0d19zZGlvX2hhbmRsZV9pbnRlcnJ1cHQoKSBpbnRvIDgw
NTEgYW5kIDMwODEgcGF0aHMuIE9uIDMwODEsDQo+ID4gIGludGVycnVwdHMgYXJlIG1hc2tlZCB2
aWEgSElNUiwgYWNrbm93bGVkZ2VkIHZpYSBXMUMgd3JpdGViYWNrLA0KPiA+ICBzZXJ2aWNlZCwg
YW5kIHJlLWVuYWJsZWQgdW5kZXIgaXJxX2xvY2sgaWYgc3RpbGwgcnVubmluZy4NCj4gPiAtIFBh
dGNoIDQgcmVmYWN0b3JzIHJ0d19zZGlvX3J4X2lzcigpIGludG8gc2VwYXJhdGUgODA1MSBhbmQg
MzA4MSB2YXJpYW50cw0KPiA+ICB0byBjbGFyaWZ5IHRoZSBkaWZmZXJlbmNlcyBpbiByZWdpc3Rl
ciB3aWR0aCBhbmQgSElTUiBoYW5kbGluZyB3aXRob3V0DQo+ID4gIGFueSBsb2dpYyBjaGFuZ2Vz
Lg0KPiA+DQo+IA0KPiBUaGFua3MgZm9yIGFkZHJlc3NpbmcgdGhvc2UgY29tbWVudHMsIHY5IGxv
b2tzIGdvb2QgdG8gbWUsDQo+IA0KPiBSZXZpZXdlZC1ieTogTHVrYSBHZWphayA8bHVrYS5nZWph
a0BsaW51eC5kZXY+DQoNCkkgZG9uJ3Qga25vdyB3aHkgSSBjYW4ndCBzZWUgdjEwIGluIHBhdGNo
d29yayBbMV0uDQpQbGVhc2UgdGFrZSBMdWthJ3MgUmV2aWV3ZWQtYnkgZm9yIGVhY2ggcGF0Y2gs
IGFuZCBzZW5kIHYxMC4NCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC13aXJlbGVzcy9saXN0Lz9zZXJpZXM9JnN1Ym1pdHRlcj1BbGFzdGFpciZzdGF0ZT0q
JnE9JmFyY2hpdmU9JmRlbGVnYXRlPQ0KDQoNCg==
