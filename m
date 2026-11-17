Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877028;
	b=gX14UNeEorzhgQQw7qSqZ1aGe//ZXAynXkmBQ8kIKF71CLefvH1z4JK0aOH7S0cMiO3V
	 dN6TsxnruVxOBh6myrgj4tmigZKR04XXlo/sTR8qpPNkwQeFwNc+YloUVbrcjtHSTHRJ3
	 RZiGS0RPSK3gxhQuRPYk0x+q+ntAGHaO0fiCPWWFYM5IRYOHqeLTAOX5sfZSVQnY+B7Vl
	 4RpSQ7CQRepEwD/bAqw6yiLBch2+m8CaZJrvODtb+MD6wAEOHJdlkMwV278fn4PfGNNmU
	 /maVWh/xOm36phUd8LgxiMN09Y/rBUlanG0t+r0fRvfSlh0zBhpX2s8jajTsmiNnrcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877028;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=KkSocnQnBgp0BjKmXIH5z0p/YimYzgerqDGPhJWVJlI=;
	b=kdMQGh3rJo9g7qSb5FNNM6lx2/Q7914CARwWHqplVQG9uJCd4WP7X85amQw8h7OFB4fG
	 AVWBldQax1lM1xUtwEttIrk8L5Wie0xoQ9W5bMVLZQ5fx7dOv/8AYSIXh5+nwbx5PiZt7
	 Pyg7hUUDENc6Ra6mxYux7HS3ACLKehcj1tAcFVGy3TG38R8lvAPB9M099YAe7wcx7Zilf
	 DUYowoEu5z2UOtVC7Q3YtxA9dODAFImmDJWEqmGBC5wBLzo4WF9+EfxStFAANwpKo/j1f
	 UlvNUWzPda+67WV1E2PBLseQoGU6IIiTcrqH49T+28HtVqRPO62wSlJFyBqyDqeX8QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oL1e9aht;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF2606A31C;
	Tue, 17 Nov 2026 00:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oL1e9aht
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH0sStqD3918343, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794876868; bh=KkSocnQnBgp0BjKmXIH5z0p/YimYzgerqDGPhJWVJlI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oL1e9aht0xw+xPgT6bG4mzsI3sCTBce+3uXc0QQvc6nWXtKdHJkbtoRD2SHLS4f+O
	 59wO1VVpl2gWqkNx49vn/PhesL6QYAVtyDdrpkM2O0U6CfmhuN9xWFMmEfB0YAdKgG
	 BwXzwkxn7ka6sQNREGqhApoYsaByzsHStT9mPMhLT4pOTyx0s3iv29OCYT0lUbFvLk
	 8FrdasxT/sLVpdZa/bEgTJnJrhO3eA2OkpwOjB47pkWhmjGhtx1kaJ1gNn3DXWF8mf
	 CLgY1fyNXR7VhDMcfwi7gWrMeH1swAgP9xTIg3nk5FiFDKPxHBnSnG7ZwB/1CEi9Vt
	 BSCqGVow1eapA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH0sStqD3918343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 08:54:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 08:54:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 08:54:28 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Leonard Lausen <leonard@lausen.nl>
CC: "leonard@lausen.nl" <leonard@lausen.nl>, =?utf-8?B?RGF2aWQgSMOkcmRlbWFu?=
	<david@hardeman.nu>, Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner
	<heiko@sntech.de>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 0/2] wifi: rtw88: reduce RTL8822CS SDIO
 request overhead
Thread-Topic: [PATCH rtw-next v3 0/2] wifi: rtw88: reduce RTL8822CS SDIO
 request overhead
Thread-Index: AQHddg2EVbbHh10fu0+8z00k0SLpZrcwtZYAgAC6T7A=
Date: Tue, 17 Nov 2026 00:54:28 +0000
Message-ID: <b2ccb54c9b264722b2fac5ddbf854379@realtek.com>
References: <20261116205739.462458-2-leonard@lausen.nl>
 <0867C5E9-DDCC-448A-A22A-9AEEFE009358@linux.dev>
In-Reply-To: <0867C5E9-DDCC-448A-A22A-9AEEFE009358@linux.dev>
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

SGkgTHVrYSwNCg0KTHVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBI
aSBMZW9uYXJkLA0KPiANCj4gT24gTm92ZW1iZXIgMTYsIDIwMjYgOTo1NzozNiBQTSBHTVQrMDE6
MDAsIExlb25hcmQgTGF1c2VuDQo+IDxsZW9uYXJkQGxhdXNlbi5ubD4gd3JvdGU6DQo+ID5SZWR1
Y2UgUlRMODgyMkNTIFNESU8gcmVxdWVzdCBvdmVyaGVhZCBieSBmaWx0ZXJpbmcgaGFyZHdhcmUt
aGFuZGxlZA0KPiA+Y29udHJvbCBmcmFtZXMgYW5kIGNvbWJpbmluZyBhZGphY2VudCBUWC1jYXBh
Y2l0eSByZWFkcy4NCj4gPg0KPiA+Q2hhbmdlcyBpbiB2MzoNCj4gPi0gSW5jbHVkZSBtb25pdG9y
LWZpbHRlciBjb3JyZWN0aW9uIGluIHBhdGNoIDEgYXMgc3VnZ2VzdGVkIGJ5IEx1a2EgR2VqYWsu
DQo+ID4tIENhY2hlIHRoZSBjdXJyZW50IEZJRl9DT05UUk9MIHJlcXVlc3QgZXZlbiB3aGVuIGNo
YW5nZWRfZmxhZ3Mgb21pdHMgaXQuDQo+ID4tIFVzZSBhIHNoYXJlZCBmaWx0ZXIgd3JpdGVyIGlu
IGV2ZXJ5IGNoaXAgaW5pdGlhbGl6ZXIgYW5kIGJvdGgNCj4gPiAgYmVhbWZvcm1pbmcgcGF0aHMs
IHByZXNlcnZpbmcgdGhlIG1vbml0b3Igb3ZlcnJpZGUgYW5kIG5vcm1hbCBkZWZhdWx0Lg0KPiA+
LSBLZWVwIHRoZSBUWC1jYXBhY2l0eSByZWFkIG9wdGltaXphdGlvbiB1bmNoYW5nZWQgZnJvbSB2
Mi4NCj4gPg0KPiANCj4gVGhhbmtzIGZvciB2My4gSXQgbG9va3MgZ29vZCB0byBtZSwgc28gZm9y
IHRoZSBzZXJpZXMsDQo+IA0KPiBSZXZpZXdlZC1ieTogTHVrYSBHZWphayA8bHVrYS5nZWpha0Bs
aW51eC5kZXY+DQoNClNpbmNlIEknbSBub3QgdXNpbmcgYjQgdG8gYXBwbHkgcGF0Y2hlcywgY291
bGQgeW91IHBsZWFzZSBhZGQgeW91ciB0YWcNCnRvIGVhY2ggcGF0Y2g/IFRoYW5rcy4gDQoNCg0K
