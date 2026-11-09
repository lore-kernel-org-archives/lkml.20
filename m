Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193118;
	b=FtqGDrSoX1nr9qUIkMTKTZLObTKHUlJsD4trkEv4sQQyyS+FQ4xrix7Wi2qvfKv8euBv
	 bz+UvMpq2K9MGt30zIxbdTal1DsO7HFeyvUpv/g/V9u+mc7ylf3dpQ5j+ygfA5vyMSd67
	 xImvJGWeXmuHhJAhnOzcrUMD7PprO1JtFuJU9KqoG+cRdtPHVP/5umglusNFPhn3qXR82
	 6Q3F1eJN48OwF/LvSXirgNSJqIsfsaVGQx7/8FvcwfId5BlUW0toS4Glig1nqkG/+Z3Zq
	 G27UHNs6Y00sLSvArbQQ304FL9BGJDY0QeSG/azvx5uUWRBNPbL2TB7bCaRLecF3GZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193118;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=EZjE/JK3/R7shkaCTiy2m7At7WNjnN07YK5DWmAePew=;
	b=kv138iwmA25CLzsNhmD4X+dtAQkqJajdYYQATlV5Po1tdMfDi2gQP5kS1MeKQRf1UtWE
	 0Li0wJqg2WXD1nXCgJQ0FEUlrcsCRyJRKwh0YSBh3OALWSYumD51g6DWP3znPb3iolPDh
	 s8R8MAfLMse5lqZSM5OnRGlZuWzaO1JKs7ooz6s+NjZAghHlJaWCh4L4ewQMBDZMPlLVd
	 E82icYO0/Zv5GHJAOnD0SkMuRHQsxZKGpM8aFzhjq+TWR3XPg3Uqe/ZGRtHhDqHunZuOY
	 7O6ne0orYnFc9b0mbBEzsYe25eD9rufG6fGby1GM4XI0q8xN1R6UfseRcT3VhGQIxcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EqhObOSN;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC0606A31C;
	Mon,  9 Nov 2026 02:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EqhObOSN
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A92wW7F13966444, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794193112; bh=EZjE/JK3/R7shkaCTiy2m7At7WNjnN07YK5DWmAePew=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EqhObOSNEO5puUUsRIGI8WZdD+ExKsRfaYhoCJQ2vuWzRncbBd5/BYLSN+S2MaNl5
	 NjARlTqK9bqxh7/IzODT/96dCqn2GxPFbeyOhpOPAkLlFZAWR75YsZm6ZgFAP/jVRI
	 2x4R+y3Jj7iWqo57rRKtX1VNKjZ/BxYjuR5WG94XJzK2R9yDNcpIxo+5DFM2vF9Nq1
	 vgR9L1EJKGoGUGhpkWIc05pWPcMDfn52Jxwwqgwly6Xhllfrx2N3g9GckBWes5BR6h
	 eay6iBjc+R0CCOjNMStcldwV2nOk5HO59NMNtH6vy1Ah7X1UW38pcYYcETRr2b+IgO
	 EBhWH/R5VCS2w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A92wW7F13966444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:58:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:58:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:58:32 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jie Feng <hjf3108@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware
 use all rates
Thread-Topic: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware
 use all rates
Thread-Index: AQHda3lMjeHUYZEd20CIBb6M95IYCLclAbug//+JqICAAIiU4A==
Date: Mon, 9 Nov 2026 02:58:32 +0000
Message-ID: <fcba3b4d22e5441691f8c0fc71e1c71c@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-6-hjf3108@gmail.com>
 <8fbf3fbba7d94b55b7510a57ff376e8d@realtek.com>
 <CABOQOSWLNQC3SHj1AUEQ8SmUAig-8xHGm=GO6w8EN-nSzy-7=Q@mail.gmail.com>
In-Reply-To: <CABOQOSWLNQC3SHj1AUEQ8SmUAig-8xHGm=GO6w8EN-nSzy-7=Q@mail.gmail.com>
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

SmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPiB3cm90ZToNCj4gT24gTW9uLCA5IE5vdiAyMDI2
IGF0IDA4OjU2LCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIbyBKaWUgRmVuZyA8aGpmMzEwOEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gVGhlIHJh
dGUgbWFzayBpcyBjaG9zZW4gYmFzZWQgb24gcnNzaV9sZXZlbCwgaG93ZXZlciByc3NpX2xldmVs
DQo+ID4gPiBpcyBhbHdheXMgMCwNCj4gPg0KPiA+IFNob3VsZCB3ZSBmaXggaXQgPw0KPiBUaGUg
dmVuZG9yIGRyaXZlciBmb3IgcnRsODE5MmR1IGFsc28gZG9lc24ndCBkbyB0aGUgcnNzaV9sZXZl
bCB1cGRhdGUNCj4gSXQgaXMgbm90IGNvbXBpbGVkIGR1ZSB0byB0aGUgI2lmIDANCj4gaHR0cHM6
Ly9naXRodWIuY29tL2x3ZmluZ2VyL3J0bDgxOTJkdS9ibG9iL21hc3Rlci9oYWwvcnRsODE5MmRf
ZG0uYyNMMjYyNA0KPiBUaGVyZWZvcmUsIEknbSBub3Qgc3VyZSBpZiBpdCBpcyBva2F5IHRvIHBv
cnQgaXQgb3Zlci4NCg0KQWRkIHRvIHlvdXIgdG9kbyBsaXN0LiBUbyBmaW5lIHR1bmUgdGhyb3Vn
aHB1dCwgeW91IG5lZWQgYSBzZXQgb2YgcGxhbiB0bw0KdmVyaWZ5IHRvIGVuc3VyZSB5b3VyIGlt
cGxlbWVudGF0aW9uIGlzIGdvb2QuDQoNCj4gDQo+ID4gPiBzaW5jZToNCj4gPiA+IC0gZm9yIHJ0
bDgxOTJkZSwgY2FsbCB0byBydGw5MmRfZG1fcmVmcmVzaF9yYXRlX2FkYXB0aXZlX21hc2sgaXMN
Cj4gPiA+ICAgY29tbWVudGVkIG91dCBhbmQgZnVuY3Rpb24gaXMgbm90IGltcGxlbWVudGVkDQo+
ID4gPiAtIGZvciBydGw4MTkyZHUsIGl0IGlzIGFsc28gbm90IGNhbGxlZC4NCj4gPiA+DQo+ID4g
PiBUaGlzIG1ha2VzIHRoZSBicmFuY2ggYWx3YXlzIGNob29zZSBsZXNzIHRoYW4gb3B0aW1hbCBh
bGxvd2VkIE1DUyByYXRlcy4NCj4gPiA+IEVuYWJsZSBhbGwgdGhlIHJhdGVzLg0KPiA+ID4NCj4g
PiA+IFRlc3QgcmVzdWx0cyAoMi40IEdIeik6DQo+ID4gPiAgICBiZWZvcmUgYWZ0ZXINCj4gPiA+
IFRYIDYuNCAgICAxMi42DQo+ID4NCj4gPiBIb3cgYWJvdXQgdGhlIHJhdGUgYmVmb3JlL2FmdGVy
PyBJIHRoaW5rIHRoZSBoaWdoZXN0IHJhdGUgd2lsbCBiZSBzaW1pbGFyDQo+ID4gb3IgdGhlIHNh
bWU/DQo+IEhpZ2hlc3QgcmF0ZSB3aWxsIGJlIHNpbWlsYXIsIGJ1dCBJIHNhdyBpdCB1c2luZyBt
b3JlIGludGVybWVkaWF0ZSByYXRlcy4NCg0KV2l0aCBsb25nZXIgdGVzdCB0aW1lIChlLmcuIDEw
IG1pbnV0ZXMpLCB3aWxsIHRocm91Z2hwdXQgYmVjb21lIHNpbWlsYXI/DQoNCj4gDQo+ID4gPiBS
WCAzMi4wICAgMzkuMQ0KPiA+DQo+ID4gWW91IGNoYW5nZSBtYW55IHJhdGUgbWFza3MgZm9yIGRp
ZmZlcmVudCB3aXJlbGVzcyBtb2Rlcywgc28gcGxlYXNlIHByb3ZpZGUNCj4gPiBtb3JlIGV4cGVy
aW1lbnRzLiBFc3BlY2lhbGx5IHlvdSBuZWVkIHRlc3RzIGZvciBhIGNsZWFuICYgbm9pc3kgZW52
aXJvbm1lbnRzLg0KPiBTbyB0aGlzIHBhdGNoIGJ5IGl0c2VsZiBpcyBtb3JlIG9mIGFuIFJGQywg
YW5kIEkgbWlnaHQgZHJvcCBpdCBpbiB2Mg0KPiBpZiBpdCBjaGFuZ2VzDQo+IGJlaGF2aW91ciB0
b28gbXVjaCBpbiBkaWZmZXJlbnQgY2lyY3Vtc3RhbmNlcy4NCg0KWWVzLCBJIHRoaW5rIHNvLiAN
Cg0KSWYgeW91IGNhbiBtYWtlIHBsYW5zIHRvIHZlcmlmeSBpdCBmdWxseSwgSSBjYW4gYWNjZXB0
IHRoZSBjaGFuZ2UuDQoNCg0K
