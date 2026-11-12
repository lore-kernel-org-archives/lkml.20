Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.10.52.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450322;
	b=bB7/RCG83YqVrZHEhc/uFRNx5WR2OKHgu1g2xqnW/GU0g7CI2kJMgamsagRVHnMrFVLa
	 el+6hiEfhXtanosorO5uyoz4mxg4YIAuLJXzeFqT38g6IIM1CS2M4MdMa6PTW3EDtGAP6
	 RcQI+sSQo6riNZiJbMLX8P+kao8t5m0Qd4qoUaox0sxYJqXle/ccPieQp7fCmtdEClHBe
	 ZvDuWQmnI/5wxGGba/hcCyOoPpX/3DehqHTLY7KUte4do35DmFKjgXE7qiLx3Fm0oB4uM
	 hGLqpGK1d+ZOcgLFmry6dKZPmwLPlel9/y6zm4QxQn28JY1/ZWd9ds0ZeQhZqWMvkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450322;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:Received:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uXbRj8A6orQZ4SdQ2U6VzzsZHYKOIW/75PBZOqmy5HU=;
	b=QLfB068EGRDlFzUUChFleTwPJqx02TnbUFruG+2NMmBE3yLxQkvYcwf7T2WDezsfjJCy
	 LzI/nm8yAU91w+vE2ZIfloUqtp2tkqszz0cKL3x5jdzvOCKS1eVO4wxctk3WQxwB4mgQ4
	 XFEBzN/62HDQhIRlYU6P3+H/vDuay+0TtIsBDKMRHbugbhOO4Uj0wxivzaYejllNK7G0W
	 oWprT1/E8AKsTUEh6MPP333JAJslfIntCAGnwiTGGUDm5mZSgKdatuwbmyjS14IwURqNb
	 OMNoxMfm4Dcf+UxbqBpOJE0sdxOL5IJ1LkdDsWdErGgtnh+64cCWw6ifAZByVjFe/pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=BwHlsLLR;
	arc=none smtp.remote-ip=217.10.52.204
Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36509606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36509606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=BwHlsLLR
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794450322; x=1825986322;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uXbRj8A6orQZ4SdQ2U6VzzsZHYKOIW/75PBZOqmy5HU=;
  b=BwHlsLLR06wQkKDtJotUqak3x4G3Z/mvQyZ5J8WbBhycSRzneM44/x1N
   ln51Z7UdxbmH7ymq70gWNRUtFIYVJmXefMQmiUYlDTUO0PNJXmRw4B6uy
   cMGyEJBCICYENxMJ1InRQOuWgCGoRFXE7VGRQdOmftJTmIqyBN7w77ePm
   Y=;
X-CSE-ConnectionGUID: WVtleJhZQwq9BZTiSHe4Mg==
X-CSE-MsgGUID: UIdin4kOQCOnsEz+XVu9Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="117437193"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="117437193"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:25:19 +0100
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 03:25:18 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 03:25:18 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 03:25:18 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <nuno.sa@analog.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
Subject: RE: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Thread-Topic: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Thread-Index: AQHdbgxT16z/LCoqo0ucH5OFl4R/+7cpmcow
Date: Thu, 12 Nov 2026 02:25:18 +0000
Message-ID: <f3510faf94ae4f878a96d4382dfd3d35@infineon.com>
References: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
In-Reply-To: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
Accept-Language: en-US
Content-Language: en-US
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

SGksDQoNCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRywgYSAxIEdiaXQgKDEy
OCBNaUIpIG9jdGFsIE5PUiBmbGFzaC4NCj4gVGhlIHBhcnQgaXMgZnVsbHkgZGVzY3JpYmVkIGJ5
IFNGRFAsIHNvIG9ubHkgdGhlIGZsYXNoIElEIGFuZCBzbWFsbA0KPiBwb3N0X2JmcHQgYW5kIHBv
c3Rfc2ZkcCBmaXh1cHMgYXJlIG5lZWRlZC4NCj4gDQo+IFdSSVRFIFNUQVRVUyBSRUdJU1RFUiAo
MDFoKSB0YWtlcyBhIHNpbmdsZSBkYXRhIGJ5dGUgYW5kIG9ubHkgYWZmZWN0cw0KPiBzdGF0dXMg
cmVnaXN0ZXIgYml0cyA3OjIsIHNvIHRoZSBkZWZhdWx0IDE2LWJpdCBXcml0ZSBTdGF0dXMgYXNz
dW1wdGlvbg0KPiBkb2VzIG5vdCBob2xkLiBDbGVhciB3cml0ZV9zcjFfYW5kX3NyMiBzbyB0aGF0
IHRoZSBzaW5nbGUgYnl0ZSB3cml0ZV9zcjENCj4gcGF0aCBpcyB0YWtlbjsgd3JpdGVfc3IxIGlz
IGFscmVhZHkgc2V0IHRvIDAxaCBieSB0aGUgQkZQVCBwYXJzaW5nLg0KPiANCj4gVGhlIGZsYXNo
IGFsc28gaGFzIG5vIFN0YXR1cyBSZWdpc3RlciAyLiBDb25maWd1cmF0aW9uIHJlZ2lzdGVycyBh
cmUgcmVhZA0KPiB3aXRoIEI1aC84NWggYW5kIHdyaXR0ZW4gd2l0aCBCMWgvODFoLCBhbmQgdGhl
IDM1aCBSZWFkIENvbmZpZ3VyYXRpb24NCj4gUmVnaXN0ZXIgY29tbWFuZCBkb2VzIG5vdCBleGlz
dCwgc28gY2xlYXIgcmVhZF9zcjIgYXMgd2VsbC4NCj4gDQo+IFNvZnR3YXJlIHdyaXRlIHByb3Rl
Y3Rpb24gaXMgZG9uZSB0aHJvdWdoIHRoZSBibG9jayBwcm90ZWN0IGJpdHMgaW4gdGhlDQo+IHN0
YXR1cyByZWdpc3RlcjogQlAwLUJQMiBhdCBiaXRzIDQ6MiwgQlAzIGF0IGJpdCA2IGFuZCBhIFRv
cC9Cb3R0b20gYml0IGF0DQo+IGJpdCA1LCB3aGljaCBpcyBleGFjdGx5IHdoYXQgU1BJX05PUl9I
QVNfTE9DSywgU1BJX05PUl80QklUX0JQLA0KPiBTUElfTk9SX0JQM19TUl9CSVQ2IGFuZCBTUElf
Tk9SX0hBU19UQiBkZXNjcmliZSwgc28gc2V0IHRob3NlIGZsYWdzIHRvIGdldA0KPiB0aGUgZ2Vu
ZXJpYyBsb2NraW5nIHN1cHBvcnQuDQo+IA0KPiBUaGUgZmxhc2ggYWxzbyBzdXBwb3J0cyA4RC04
RC04RCwgYnV0IHRoaXMgY291bGQgbm90IGJlIHRlc3RlZC4gU2luY2UgdGhlDQo+IFNGRFAgaGFz
IG5vIFNDQ1IgbWFwLCB0aGUgY29yZSB3b3VsZCBzZWxlY3QgOEQtOEQtOEQgb24gYSBjYXBhYmxl
DQo+IGNvbnRyb2xsZXIgYnV0IG5ldmVyIHN3aXRjaCB0aGUgZmxhc2ggaW50byBpdC4gSGVuY2Us
IGRyb3AgdGhlIDhELThELThEDQo+IGNhcGFiaWxpdGllcyBpbiBhIHBvc3Rfc2ZkcCBmaXh1cCBm
b3Igbm93Lg0KPiANClRvIGZpeCBtaXNzaW5nIFNDQ1IgbWFwLA0KCS5maXh1cF9mbGFncyA9IFNQ
SV9OT1JfSU9fTU9ERV9FTl9WT0xBVElMRQ0KaXMgbmVlZGVkLg0KDQpDb3VsZCB5b3UgY2hlY2sg
aWYgaXQgd29ya3M/DQoNClRoYW5rcywNClRha2FoaXJvDQoNCg==
