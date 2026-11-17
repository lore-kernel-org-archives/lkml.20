Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901652;
	b=fxjYkYzOey5WHmkpaV+Q8XwLl586GLhDTD0rJCRKmspMIKcSOc04EwXOtPlqQ1lEOuXM
	 Fh8+018TiVNcUU/8AO1vWxPDT9jk7pdRnWjybBhKLMozHIus2fFeJmZY0NTPbqTYso7In
	 Y83QiMbziG2/R9Vh+y6Sox7xwIzqi7Y8Wv3pv1Jk8m1e/HuWgphjN/6FOisVea+sYHmBl
	 K+pmoJZoKjt+coMDcjDOQ8ttNsnhRoeY3s7S1Y7Oba0B9hXwkCmiN5tEMg21uSRFfMj2O
	 QKYkay3rSQ00s0qPH9G10kgJmMtlfWe0qNdeRlwHDhAj3oE6ajATi0Wm+TcrfPe0+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901652;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OJ3r04GuSjyhSN8axOjHdwytmVDEfojJU16qbNpx0XA=;
	b=z5XHpuxN3OPXGrugzvePhfwc84vP2f/vVgCYm1IdU8oi0lOSC0fn7HvA2rcHeQQNbK0e
	 lRJc2ufyex4K44Xa0LD80G4IvlrDoycV2O0IQgRcXsx8Na2hQ6g48BdlQ8Hk587S639M1
	 cgOBU7OquQf7KPSyyOsRwVoB8zJh4RL0uhgI02/D34Ndnxceh1S1MjUq6Zy8AgfOjtCRy
	 +gc7Ad3IQY5iZs4kdq9J8Su8fzX59FUxsdCCnHRC4BOivroGu6LYXdSA64MYVE/J5bwq9
	 IG3eVxUn1EP/UlmVZDlJ9oiIUZVs3CGYFuxfTragoRkQcEC9/8QQGPpwZxO5DHpxIrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RvGELSNR;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5799606A31C;
	Tue, 17 Nov 2026 07:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5799606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RvGELSNR
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH7kjqoF057981, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794901606; bh=OJ3r04GuSjyhSN8axOjHdwytmVDEfojJU16qbNpx0XA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RvGELSNRSos8zB2GwZV/B/94y+CaVoz4h5eh3YnMTTQfd/n2C59tAAwPVKYu9iVUF
	 LpF1/6PWp2CsYqz8xlW0z+rJx1+siBVSgbXbX+7t/L2d7C34c1+hbrLDRjXth8a0Al
	 R4ygcPUP9IWhafh8zIbrDO6UaWZnQyXCgKi4bNf/1bWPamiQveuWQCJ80kZtNfTlqR
	 hybB7Y7lrORqQdXfo9VJYYQdf3BIUrHuRAzUt/o5b2/lkJBvXM3RbamWDsZgXwAJRf
	 +C6KrSMnhvP4chIhjqLxvXcJBi6Gkg4mP0Z/PpFlfE0lp0heZdE8LkZOwGQtO8FylU
	 EY4xQ5o5KVRRg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH7kjqoF057981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 15:46:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:46:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 15:46:44 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: =?utf-8?B?RGF2aWQgSMOkcmRlbWFu?= <david@hardeman.nu>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Leonard
 Lausen" <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, "Luka
 Gejak" <luka.gejak@linux.dev>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: RE: [PATCH rtw-next 0/5] wifi: rtw88: sdio: faster and fairer TX for
 the 88xx chips
Thread-Topic: [PATCH rtw-next 0/5] wifi: rtw88: sdio: faster and fairer TX for
 the 88xx chips
Thread-Index: AQHddgQDfZKeyZuyCUqJjidW/UaqCLcx3raA
Date: Tue, 17 Nov 2026 07:46:44 +0000
Message-ID: <4c0d81f7a207468d8bca3c3c1a5b8dc5@realtek.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
In-Reply-To: <20261116190145.2736364-1-david@hardeman.nu>
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

RGF2aWQgSMOkcmRlbWFuIDxkYXZpZEBoYXJkZW1hbi5udT4gd3JvdGU6DQo+IEtub3duIGlzc3Vl
LCBub3QgYWRkcmVzc2VkIGhlcmU6IHdoZW4gdGhlIGNsaWVudCBnb2VzIG9mZi1jaGFubmVsIChm
b3INCj4gZXhhbXBsZSBmb3IgYSBiYWNrZ3JvdW5kIHNjYW4pLCB0aGUgY2hpcCBzb21ldGltZXMg
Z2l2ZXMgdXAgb24gYW4gTVBEVQ0KPiBvZiBhbiBBLU1QRFUgc2Vzc2lvbiB3aXRob3V0IHNlbmRp
bmcgYSBCQVIsIGFuZCBrZWVwcyBzZW5kaW5nIHVwIHRvIDY0DQo+IGZyYW1lcyBwYXN0IGl0LiAN
Cg0KV2hhdCBkbyB5b3UgZXhwZWN0PyANCg0KICAgICBydHc4OCAgICAgICAgICAgICAgICBjbGll
bnQNCiAgICAgVFggQS1NUERVICAgLS0+DQogICAgIFRYIEJBUiAgICAgIC0tPg0KICAgICAgICAg
ICAgICAgICA8LS0gICAgICBCQQ0KDQpJIGhhdmUgbm90IHNlZW4gQkFSIGZvciBhIGxvbmcgdGlt
ZS4gRG8geW91IHJlYWxseSBuZWVkIGl0Pw0KDQo+IHJ0dzg4IHJlcG9ydHMgZXZlcnkgU0RJTyBk
YXRhIGZyYW1lIGFzIGFja2VkLCBzbw0KPiBtYWM4MDIxMSBkb2Vzbid0IGtub3cgZWl0aGVyIGFu
ZCBjYW4ndCBzZW5kIGEgQkFSLiANCg0KQ2FuIHlvdSBjaGVjayBhaXIgc25pZmZlciBpZiB0aGUg
QS1NUERVIGlzIGFjdHVhbGx5IGFja2VkLCBvciBmaXJtd2FyZQ0KcmVwb3J0IGluY29ycmVjdCBh
Y2s/DQoNCkkgdGhpbmsgbWFjODAyMTEgaGFzIG5vIHdheSB0byBzZW5kIGEgQkFSLiBIb3cgY2Fu
IGl0IGRvPyBEcml2ZXINCnRlbGxzIG1hYzgwMjExIG9uY2UgaXQgVFggYSBzZXQgb2YgZnJhbWVz
Pw0KDQo+IFRoZSBjbGllbnQncw0KPiByZW9yZGVyIHdpbmRvdyB0aGVuIHN0YWxscyB1bnRpbCBp
dCBpcyBwdXNoZWQgcGFzdCB0aGUgaG9sZSwgd2hpY2gNCj4gY29zdHMgYSBzaG9ydCB0aHJvdWdo
cHV0IGRpcC4gDQoNCkFyZSB0aGVyZSBzb21lIGZyYW1lcyBnZXQgbWlzc2VkIGJ1dCBoYXJkd2Fy
ZSBzb21laG93IGNvbnNpZGVycyBpdA0KaGFzIGFja2VkIHRoZW0gYWxyZWFkeT8gKEkgdGhpbmsg
bmVlZCB0byBjaGVjayBhaXIgc25pZmZlcikNCg0KPiBXaXRoIGl3bHdpZmkgY2xpZW50cyBpdCB0
dXJuZWQgaW50bw0KPiBidXJzdHMgb2YgdXAgdG8gNjMgbG9zdCBmcmFtZXMgcGVyIGhvbGUgYmVj
YXVzZSBvZiBhIHJlb3JkZXIgYnVmZmVyDQo+IGJ1ZyB0aGVyZSwgZm9yIHdoaWNoIEkgaGF2ZSBz
ZW50IGZpeGVzOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy8yMDI2
MTExNjE1NTYwOS41MzU1OTUtMS1kYXZpZEBoYXJkZW1hbi5udS8NCj4gSSB0cmllZCB0aGUgaGFy
ZHdhcmUgQkFSIHNldHRpbmdzIChSRUdfQkFSX01PREVfQ1RSTCB0aHJlc2hvbGRzLCB0aGUNCj4g
QkFSIHJldHJ5IGJpdHMgaW4gdGhlIFRYIGRlc2NyaXB0b3IpLCBhIGxvbmdlciByZXRyeSBsaW1p
dCwgTUFDSUQgc2xlZXANCj4gZm9yIGRvemluZyBjbGllbnRzLCBwZXItZnJhbWUgVFggcmVwb3J0
cyBhbmQgYSBCQVIgc2VudCBieSB0aGUgZHJpdmVyDQo+IGFmdGVyIHRoZSBjbGllbnQgd2FrZXMg
dXA7IG5vbmUgb2YgdGhlbSBoZWxwZWQsIGFuZCBwZXItZnJhbWUgcmVwb3J0cw0KPiBvbmx5IGNh
bWUgYmFjayBmb3IgYWJvdXQgb25lIGZyYW1lIHBlciBBLU1QRFUuIFBpbmctS2UsIGlzIHRoZXJl
IGEgd2F5DQo+IGZvciB0aGUgZmlybXdhcmUgdG8gcmVwb3J0IHdoaWNoIE1QRFUgaXQgZHJvcHBl
ZCwgDQoNCkkgdGhpbmsgaGFyZHdhcmUncyByZXRyeSBidWZmZXIgd2lsbCBkbyBpdCBwcm9wZXJs
eS4gSWYgYSBmcmFtZSBleGNlZWRzDQpyZXRyeSBsaW1pdCwgVFggcmVwb3J0IHRlbGxzIGRyaXZl
ciBhIGZyYW1lIGlzIGRyb3BwZWQuIEJ1dCB0aGlzIGlzIG9ubHkNCmZvciBzcGVjaWZpYyBmcmFt
ZXMgd2l0aCBTTiAoc2VlIHJ0d190eF9yZXBvcnRfZW5xdWV1ZSgpKS4gDQoNCj4gb3IgdG8gc2Vu
ZCB0aGUgQkFSDQo+IGl0c2VsZj8NCg0KQXMgSSBrbm93IEJBUiBpcyB0byBhc2sgcGVlciB0byBz
ZW5kIEJBLCB3aGF0IGRvZXMgeW91ciBleHBlY3RhdGlvbiBpZg0KeW91IGNhbiBzZW5kIEJBUj8N
Cg0KDQo=
