Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899838;
	b=eaSmeoZLLj2kUlC4cmuH4LSVtmd5qAP4lBgYbJ+DclWcI7aUs70uA/AtXxnYV7XJWqWg
	 CioisHXefvGdx/HzSRJGtxdMSGBahXDRVGxDTyq5yCUWv+gTbH3dVhd5Y6I4BKfEcnhF9
	 XNbu5Ba1rRNM0+4GmkHvpKWNEL8d1x511EPV5DKLA137wI5DVn1IKtgpIIBejdW1uxEhW
	 cwLO4lh1ZEY2MkGaXOuafmsr0zr0m2uVjSm4idULWfzju1PZP+Df5aBQIxX7S9DPdmDnj
	 uDoNljCG9OgCk0DFiFmQl9swSodWU3/nS6iyd0C7xHIR0fv1pMhDpuGylE/UWwgW/xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899838;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=qNllxfNEQUDfMbvpc0joSISQX3hVJ95+yhNvYERibLY=;
	b=oUa9spvr60iD80lSh/Kl0yGytJUtG6oEdnlYi3yNhRgfuW052YoeFUDXFN42tgbKloFX
	 Gn0ZXopZzxZFDl+4b0Z4Yuz3Q1g61DwYaDY3Pcixxz+rOXGGmZ1/jwiHQHsiNlD0ro+r2
	 S6GiOXvvmuiYGR7WhJfHHGKxjJ9dnvZSPQ4Kit6FH1ovN9gwFHccpQDS/g+EdTIMcaho0
	 IkNsuBEz5WZh9D+R+7igYnHclhXRi2dAF6077ZdrYG+ag/I/4yk7cz5h22jaSHl1EjXxA
	 6+vq3jwwAuEIVzKJrcxIfK0aRwaHNLK9J9gxW1wR0xSvcgpz9enRDZ0s/iI6pvO9udA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=bevNIuPc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0139606A33B;
	Tue, 17 Nov 2026 07:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0139606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=bevNIuPc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH7HALJ0021635, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794899830; bh=qNllxfNEQUDfMbvpc0joSISQX3hVJ95+yhNvYERibLY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=bevNIuPc/u+Q2qAv2NqBSnns3Zg+2MqCskPPFonjo62lNY5RNWRxuqUVhafJMdEdR
	 BIDCUoIRFyhyOdKv9pArQw/eNimSK7JaNYzd4FrRrqMUVqtTewFz6dtxwgv1fj/gsz
	 ULH1/ZsJ/ca5LYMR/2XTjhIIEXfkbO2Gva1F4coakDsbF5xfMzMPwI5CwUvDAXB1yH
	 wnbuJmVMDxioolr1lUCKATFVl8tVt2SWWjJFuEMNfaUFP5+XNCYtwKxqZ7P2PZJF15
	 S56IXPhi+ykR3tOWWMpbuxSeD1HqULs0sgnNpJtUl2j20xPrYmwYEWcJGeqRPsIiC0
	 h5FPWml9eHgsA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH7HALJ0021635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 15:17:10 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:17:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:17:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 15:17:10 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter
 configuration for monitor mode
Thread-Topic: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter
 configuration for monitor mode
Thread-Index: AQHdc8pMdgCLaTs82ESX+TiwL0Qf/bcufleggAHSEoCAAY5rIA==
Date: Tue, 17 Nov 2026 07:17:09 +0000
Message-ID: <51477fcfcbb7462488e2fa3f299328b8@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-4-owner@ph4ntom-rev.uz>
 <0a6a486d052e43c0adfb7fc6445b2026@realtek.com>
 <20261116152804.781-5-owner@ph4ntom-rev.uz>
In-Reply-To: <20261116152804.781-5-owner@ph4ntom-rev.uz>
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

RW52ZXIgSWtyb21vdiA8b3duZXJAcGg0bnRvbS1yZXYudXo+IHdyb3RlOg0KPiBPbiBTdW4sIE5v
diAxNSwgMjAyNiBhdCAwMzo0ODoxOUFNICswMDAwLCBQaW5nLUtlIFNoaWggd3JvdGU6DQo+ID4g
UGxlYXNlIGRlc2NyaWJlIHlvdXIgcHVycG9zZS4gRm9yIGV4YW1wbGUsIGRlc2NyaWJlIHdoaWNo
IGtpbmQgb2YNCj4gPiBwYWNrZXRzIHlvdSB3YW50IHRvIGNhcHR1cmUsIGJ1dCBjdXJyZW50IHNl
dHRpbmdzIG1pc2JlaGF2aW9yLiBUaGVuLA0KPiA+IEkgY2FuIGFzayBpbnRlcm5hbGx5IHRvIGtu
b3cgaWYgeW91IHBhdGNoIGlzIG5lY2Vzc2FyeSBvciBub3QuDQo+IA0KPiBJIHJlLXRlc3RlZCBz
dGFuZGFsb25lIG1vbml0b3IgbW9kZSBvbiBSVEw4ODUyQUUgd2l0aCBydHctbmV4dCdzDQo+IGRl
ZmF1bHQgMHhDRTIwID0gMHgwMzE3NDQzOSAoQl9BWF9TTklGRkVSX01PREUgPSAxKS4gQWNyb3Nz
IGludGVybGVhdmVkDQo+IGNhcHR1cmUgd2luZG93cyBvbiAyLjQgR0h6IGFuZCA1IEdIeiwgMHgw
MzE3NDQzOSBhbHJlYWR5IHJlY2VpdmVzDQo+IGJyb2FkY2FzdCwgbXVsdGljYXN0LCBhbmQgb3Ro
ZXItQlNTIHVuaWNhc3QgZGF0YSwgbWFuYWdlbWVudCwgYW5kDQo+IGNvbnRyb2wgKFJUUy9DVFMv
QUNLL0Jsb2NrQWNrKSBmcmFtZXMsIGFuZCBGSUZfRkNTRkFJTCBhbHJlYWR5IHRvZ2dsZXMNCj4g
Ql9BWF9BX0NSQzMyX0VSUi4NCg0KSSBhbHNvIGNvbmZpcm1lZCB3aGVuIEJfQVhfU05JRkZFUl9N
T0RFIGlzIHNldCwgQl9BWF9BX0NSQzMyX0VSUiBpcyB0aGUNCmFkZGl0aW9uYWwgYml0IHlvdSBu
ZWVkIHRvIHNldC4gSSB0aGluayB0aGlzIGJpdCBjYW4gYmUgZW5hYmxlZCBieQ0KZmxhZyBvZiBp
dyBzZXQgbW9uaXRvciBjb21tYW5kLCByaWdodD8NCg0KDQo=
