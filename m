Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565323;
	b=pNh4DtOgzsgMYs8FxKbhZARPbT6iE+79hCkxs86tztTtjWmjRXgEMSw2XOTx+2Rg0wRa
	 4iYv1R4L1d89oNRBmvDL6Zyf3Ed2jB96ilUPcHOcqks7fNZL4/OuGWhqrKX62sxQE9Omi
	 rLkakRsWmTudBzziBdtuJkeBudH+/42Mv5AmbW3GuAwRhfGRK2LRSUAT4YvGAumsKU4yT
	 51XTU3X5Ygz4mI5Dlrs4l/zAyVBinhaZazyqS2jTvM9uMexbd1QXtz154yx8X1EVyOGUy
	 Gkq68FpTgXrdXkRrQTbUo8OhRMRRKViIXuU++uNe1GtSh2wUlOR7em7M8TwVusDOZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565323;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rDKciXOIHB8mILegZ89a1GnAFy2GQ4LH0JYUZeyzKnk=;
	b=CO58dmW4oNjDH5K+V0TXUSNPrHjd+GHFXrjNdWm9ozlrd14FOeDYwRfUpnK19TxJODgg
	 4bNhVNsB0WMJpD/4VGKICcdooviii8aq/BPtPyGcKQO25kV6jXz5kdHzmGobakNE+rczv
	 olfW5lavC68Uu8MsWTr5WloZBDt0uOR6acnWMoZKjAUaqJtDnzWeM9VgYZ3v//si/MH3q
	 HVasolWjv5KVTy5e+TZzBNlQRCrj6jyLMASo6jPcBjJThc1PC4V27R0GLX+JRNv7fPbIe
	 Wesx4+J51UCf3VMyhQeB+lPYkMtrZ+9m+v6ayed3P9bIUiIHCWodMcUBoOwpieaxOFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=nazkQNh4;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AF606A33F;
	Fri, 13 Nov 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0AF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=nazkQNh4
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6ADALGhI4724312, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794565276; bh=rDKciXOIHB8mILegZ89a1GnAFy2GQ4LH0JYUZeyzKnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=nazkQNh4z8yIv0kfuER+pCkIIacpN6KjhWBM76L8ZxZ14CIhVQ9TtQvd7txUp0wSr
	 xBdeTk7AH4iH1+RfgD0OtatWCMA74+4TNnj9mMYC4ZjqN0KbG7j3ADqzCHlBHrjNQj
	 C+UXGZDdEX+zPPFdRnHAAdXiUQsfMC4rLruwV/h3eBA24ZJ5ADgDG1s3ZiaymCSqOh
	 PKgbIhugZmaTKJYXjjPj0kK46ztgZDyRcxWcBHKVGrfm69hEZ7GQE2dJ7ft20HrqKD
	 rpOuZWaz/cKxXKc4bN9E+VG5WLUbAjuDsyCMyIO6qHcmuh+wMcjMo39HqBWyl0vzw6
	 s9ZxKvLCx6qmw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6ADALGhI4724312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 18:21:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 18:21:17 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 18:21:16 +0800
Received: from RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8]) by
 RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8%9]) with mapi id
 15.02.2562.056; Fri, 13 Nov 2026 18:21:16 +0800
From: Zong-Zhe Yang <kevin_yang@realtek.com>
To: "luka.gejak@linux.dev" <luka.gejak@linux.dev>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Mehmet
 Fide" <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang
	<yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka
	<sgruszka@redhat.com>, Brian Norris <briannorris@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next 1/3] wifi: rtw88: free the reserved pages of an
 interface on firmware recovery
Thread-Topic: [PATCH rtw-next 1/3] wifi: rtw88: free the reserved pages of an
 interface on firmware recovery
Thread-Index: AQHdc1i3DP1GVTXGWkK6XnSjuUYppA==
Date: Fri, 13 Nov 2026 10:21:16 +0000
Message-ID: <96da951407ab4c39b7e229ca365950eb@realtek.com>
References: <7DDD0FC3-AD89-4819-8058-15DFDA7E5D6D@linux.dev>
In-Reply-To: <7DDD0FC3-AD89-4819-8058-15DFDA7E5D6D@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiANCj4gT24gTm92ZW1i
ZXIgMTEsIDIwMjYgMTA6MzI6MzcgUE0gR01UKzAxOjAwLCBNZWhtZXQgRmlkZQ0KPiA8bWVobWV0
LmZpZGVAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODgvbWFpbi5jDQo+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
cmVhbHRlay9ydHc4OC9tYWluLmMNCj4gPiBpbmRleCBmNzcwOGFkMTdiNmYuLmFkYzU0YjA2MzM4
MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg4L21h
aW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODgvbWFpbi5j
DQo+ID4gQEAgLTYyNyw2ICs2MjcsNyBAQCBzdGF0aWMgdm9pZCBydHdfcmVzZXRfdmlmX2l0ZXIo
dm9pZCAqZGF0YSwgdTggKm1hYywNCj4gc3RydWN0IGllZWU4MDIxMV92aWYgKnZpZikNCj4gPiAg
ICAgICBydHdfYmZfZGlzYXNzb2MocnR3ZGV2LCB2aWYsIE5VTEwpOw0KPiA+ICAgICAgIHJ0d192
aWZfYXNzb2NfY2hhbmdlZChydHd2aWYsIE5VTEwpOw0KPiA+ICAgICAgIHJ0d190eHFfY2xlYW51
cChydHdkZXYsIHZpZi0+dHhxKTsNCj4gPiArICAgICBydHdfcmVtb3ZlX3JzdmRfcGFnZShydHdk
ZXYsIHJ0d3ZpZik7DQo+IA0KPiBBcyBmYXIgYXMgSSBjYW4gc2VlLCB1cGRhdGVfYmVhY29uX3dv
cmsgY2FuIHN0aWxsIHJ1biBhZnRlciB0aGlzIHJlc2V0DQo+IGFuZCBiZWZvcmUgaWVlZTgwMjEx
X3JlY29uZmlnKCkgYWRkcyB0aGUgaW50ZXJmYWNlcyBhZ2Fpbi4NCj4gcnR3X2NvcmVfc3RvcCgp
IGNhbmNlbHMgaXQgZnJvbSBydHdfZW50ZXJfaXBzKCksIGJ1dCBydHdfb3BzX3NldF90aW0oKQ0K
PiBjYW4gcXVldWUgaXQgYWdhaW4gcmlnaHQgYWZ0ZXIsIGZvciBleGFtcGxlIHdoZW4gYSBmcmFt
ZSBmb3IgYSBkb3ppbmcNCj4gc3RhdGlvbiBnZXRzIGJ1ZmZlcmVkLiBpZWVlODAyMTFfcmVzdGFy
dF93b3JrKCkgdGhlbiBmbHVzaGVzDQo+IGxvY2FsLT53b3JrcXVldWUgYmVmb3JlIGl0IGNhbGxz
IGllZWU4MDIxMV9yZWNvbmZpZygpLg0KPiANCj4gU28gaWYgSSByZWFkIGl0IHJpZ2h0LCB3aXRo
IGFuIEFQIGludGVyZmFjZSAoYXBfYWN0aXZlIHN0YXlzIHNldCkgdGhlDQo+IHdvcmsgbm93IGZp
bmRzIGV2ZXJ5IHBlciB2aWYgbGlzdCBlbXB0eSBhbmQgcnVucyBpbnRvIHRoaXMgaW4NCj4gX19y
dHdfYnVpbGRfcnN2ZF9wYWdlX2Zyb21fdmlmcygpOg0KPiANCj4gICAgICAgICByc3ZkX3BrdCA9
IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnR3ZGV2LT5yc3ZkX3BhZ2VfbGlzdCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnR3X3JzdmRf
cGFnZSwNCj4gYnVpbGRfbGlzdCk7DQo+ICAgICAgICAgaWYgKCFyc3ZkX3BrdCkgew0KPiAgICAg
ICAgICAgICAgICAgV0FSTigxLCAiU2hvdWxkIG5vdCBoYXZlIGFuIGVtcHR5IHJlc2VydmVkIHBh
Z2VcbiIpOw0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgICAgfQ0K
PiANCj4gQmVmb3JlIHRoaXMgcGF0Y2ggaXQgYnVpbHQgdGhlIHBhZ2UgZnJvbSB0aGUgc3RhbGUg
ZW50cmllcyBhbmQgZGlkIG5vdA0KPiB3YXJuLiBNYXliZSBydHdfZndfdXBkYXRlX2JlYWNvbl93
b3JrKCkgY291bGQgc2tpcCB0aGUgZG93bmxvYWQgd2hpbGUNCj4gUlRXX0ZMQUdfUkVTVEFSVElO
RyBpcyBzZXQ/IFRoZSByZWNvbmZpZyBkb3dubG9hZHMgdGhlIGJlYWNvbiBhZ2FpbiBmb3INCj4g
QlNTX0NIQU5HRURfQkVBQ09OIGFueXdheS4NCj4gDQoNCkhvdyBhYm91dCBhZGRpbmcgYSBmbGFn
IHRvIGluZGljYXRlIGlmIHRoaXMgcnR3dmlmIGhhcyBiZWVuIGluaXQtZWQgb3Igbm90ID8NCklm
IGluaXQtZWQgYW5kIHJ0d19vcHNfYWRkX2ludGVyZmFjZSgpIGFnYWluLCBjYWxsIHJ0d19yZW1v
dmVfcnN2ZF9wYWdlKCkgZmlyc3QuDQoNCg==
