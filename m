Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192686;
	b=1/DbcDpiXBJr/ZHEHMLxJ5bMacZZfjmxA+aLzaH10ytwq5gin0UEGAQV7s6kWoRvjVWJ
	 964/BLVTQ+QPDUxTvOiQI14pdrg1b0XPYU8kocjx5sNiwH1LGDEICYZilcfZ7Ak04bLu4
	 04eRPSpeMpeUVMe2rotFUcx9mnnf3a5Vo9usv0Nvsz9tP+2OgkmwRCRWvGQq63kZX4e6I
	 q6BPNZUeZ3VAiXAZnoG72GAkD5L64UWAY8GgQ35d2K2uKBs7wXGJWE9SgZzD7tQ/XBtGn
	 CwYFE5xTD1Q5iU1AapMyuOo5BF9wgK45G7Icwe4ww09pjidvMuXVDqSkNvCdjlhmp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192686;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yTYUib1MGMVyxtthrN5sU3B00cdwHWtOZ/vvOCv5dXs=;
	b=GzGjitpBg9Exl1loDGqKDbvOQ3w/t9+ctko37fcqHXboDcFDXvKMJWmWVRsxZQZ3L4Et
	 Ji4x+od303PUGQHZNeJ1gbZ0d/Q19yTNvrt6wdr5+AYqFZPKw/X98qXYM5Z3jJhu1Xiig
	 hn9eM6j2CeAwFgkSr9J0FIX2vE5fWrotEOsbb73MuhwRtOZm11gcUwppMe+KDkhJDpCui
	 8gqka97Du30vGT3NczVnoDE7VeZLLTTPMr/AFqF3Rc7fwely7pA4yPFvEhR4pbqbls0kS
	 jXCIj+Q/fKo9qdOzTga5CPtMCUMYKlXdlv3czs9vooKExKb3j265AtEBVoP+SZj68BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vpX875be;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBB4606A321;
	Mon,  9 Nov 2026 02:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vpX875be
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A92pLSZ13959415, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794192681; bh=yTYUib1MGMVyxtthrN5sU3B00cdwHWtOZ/vvOCv5dXs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vpX875beWrEqaVnwNIBPUJZPVBLboaejIzg2AP5qrJ4CN/gjL2smVmTPPFgO+X2KV
	 JSKKRPfEw1J7hh59wnWFslmn7OVsfb8ETpl9QvzQ8r91h6RsjXKTyvnycMNLwN52m3
	 DXJ/njBX4yr01Nv+GpP3DiNrFLCC89vf7LxANZfdEq+pAe4/3j+9j2FhcA+V2uqkub
	 hEuEeUc1hmbrfLzSvCBy4wfwf8h46IPQIMTWaBnCTijD38vZ/Xd2dGJ0+aVFlmmslv
	 aOJSr95XiBHYIiMpohjKEomyH1E8Avu2P8VBrjuC1wk+QQuDBHwV9A8akyPfKR0BGR
	 yOz3jn4zHJtvw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A92pLSZ13959415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:51:21 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:51:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:51:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:51:21 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jie Feng <hjf3108@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
Thread-Topic: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
Thread-Index: AQHda3lJdalEcwjiU0OtTtWG7HGUobcjlzEwgABlJgCAARavAA==
Date: Mon, 9 Nov 2026 02:51:20 +0000
Message-ID: <586c158b0fac4a4084f1319ad31f0d5d@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-3-hjf3108@gmail.com>
 <ea79031bd2324090bb1b39b3c3f18a36@realtek.com>
 <CABOQOSV0Uys3VigkU4xoT-wfBmRk3UyxJ1KJ5dLDVA6vy=k6tA@mail.gmail.com>
In-Reply-To: <CABOQOSV0Uys3VigkU4xoT-wfBmRk3UyxJ1KJ5dLDVA6vy=k6tA@mail.gmail.com>
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

SmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPiB3cm90ZToNCj4gT24gU3VuLCA4IE5vdiAyMDI2
IGF0IDExOjEzLCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIbyBKaWUgRmVuZyA8aGpmMzEwOEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gT25seSB0
aGUgZmlyc3QgZnJhbWUgb2YgYW4gQS1NUERVIGNvbWVzIHdpdGggdGhlIFBIWSBzdGF0dXMuDQo+
ID4gPiBUaGlzIG1ha2VzIG1hYzgwMjExIHJlcG9ydCB0aGUgY29ycmVjdCB2YWx1ZSB3aGVuIHF1
ZXJpZWQgZnJvbSBpdy4NCj4gPiA+DQo+ID4gPiBUZXN0IHJlc3VsdHMgKDIuNCBHSHopOg0KPiA+
ID4gICAgYmVmb3JlIGFmdGVyDQo+ID4gPiBUWCA2LjEgICAgNS4yDQo+ID4gPiBSWCAyOS4xICAg
MjcuMQ0KPiA+DQo+ID4gSG93IGRvZXMgaW1wcm9wZXIgUlhfRkxBR19OT19TSUdOQUxfVkFMIGFm
ZmVjdCB0aHJvdWdocHV0Pw0KPiBJIGluY2x1ZGVkIHRoZSB0aHJvdWdocHV0IG51bWJlcnMgYXMg
YSByZWdyZXNzaW9uIHRlc3QsIHRvIHNob3cgdGhhdCBpdCBkb2VzIG5vdA0KPiBjYXVzZSBhbnkg
c3BlZWQgcmVncmVzc2lvbnMuIEl0IHNob3VsZCBub3QgYWZmZWN0IHRocm91Z2hwdXQuDQoNClJl
bW92ZSB0aGUgbnVtYmVycy4gT3IgYXQgbGVhc3QgbWVudGlvbiBpdCBkb2Vzbid0IGFmZmVjdCB0
aHJvdWdocHV0Lg0KDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSG8gSmllIEZlbmcgPGhq
ZjMxMDhAZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3Mv
cmVhbHRlay9ydGx3aWZpL3J0bDgxOTJkL3RyeF9jb21tb24uYyB8IDMgKysrDQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bHdpZmkvcnRsODE5MmQvdHJ4X2NvbW1vbi5j
DQo+ID4gPiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsd2lmaS9ydGw4MTkyZC90
cnhfY29tbW9uLmMNCj4gPiA+IGluZGV4IDlmOWEzNDQ5MjAzMGM2Li5hODkxMGNkYmZhMDk3OSAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsd2lmaS9y
dGw4MTkyZC90cnhfY29tbW9uLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3Jl
YWx0ZWsvcnRsd2lmaS9ydGw4MTkyZC90cnhfY29tbW9uLmMNCj4gPiA+IEBAIC00MjUsNiArNDI1
LDkgQEAgYm9vbCBydGw5MmRfcnhfcXVlcnlfZGVzYyhzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywg
c3RydWN0IHJ0bF9zdGF0cyAqc3RhdHMsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRzLT5yeF9idWZzaGlmdCk7DQo+ID4gPiAg
ICAgICAgICAgICAgICAgX3J0bDkyZF90cmFuc2xhdGVfcnhfc2lnbmFsX3N0dWZmKGh3LCBza2Is
IHN0YXRzLCBwZGVzYywNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcF9kcnZpbmZvKTsNCj4gPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiA+
ICsgICAgICAgICAgICAgICAvKiBPbmx5IHRoZSBmaXJzdCBmcmFtZSBvZiBhbiBBLU1QRFUgaGFz
IHRoZSBQSFkgc3RhdHVzLiAqLw0KPiA+DQo+ID4gSXQgaXMgY2xlYXIgdGhhdCB0aGlzIGJyYW5j
aCBpcyAhcGh5c3RhdHVzLCBzbyBubyBuZWVkIGNvbW1lbnQuDQo+IFdpbGwgYmUgcmVtb3ZlZCBp
biB2MiBvZiB0aGUgcGF0Y2ggc2VyaWVzLg0KDQpXYWl0IGEgd2hpbGUsIHNpbmNlIHBhdGNod29y
ayBhbmQgbG9yZSBmb3Igd2lyZWxlc3MgYXJlIGJyb2tlbi4gSXQgaXMgaGFyZA0KdG8gbWUgdG8g
dHJhY2UgcGF0Y2hlcy4uLiANCg0KPiANCj4gPiA+ICsgICAgICAgICAgICAgICByeF9zdGF0dXMt
PmZsYWcgfD0gUlhfRkxBR19OT19TSUdOQUxfVkFMOw0KPiA+ID4gICAgICAgICB9DQo+ID4gPiAg
ICAgICAgIC8qcnhfc3RhdHVzLT5xdWFsID0gc3RhdHMtPnNpZ25hbDsgKi8NCj4gPiA+ICAgICAg
ICAgcnhfc3RhdHVzLT5zaWduYWwgPSBzdGF0cy0+cmVjdnNpZ25hbHBvd2VyICsgMTA7DQo+ID4g
PiAtLQ0KPiA+ID4gMi41My4wDQo+ID4NCg==
