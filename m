Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204795;
	b=MWXDRVO1kHdeRxdgN4owjsUDbhE0VCxfB5KMsa8o2hhVxALt6+jQ+XD5zCvjpvovFu7G
	 /WT5B0ETp+w3fbvWAJw3ZpUGAzxipqK675TtxSVsNWhZSt1DUwlHUms7I1PHcq4Lgysnt
	 mijTNzP766RUvKQUmTDoKGtERPi57R1gQSHEId7BjXjAr/nYhVl13TNJVIh+VmKcm8y3A
	 9QbgXbIKPJ+4ShBp4fGMZ/qaOldBNsi+ho+HXEMQRsWuBMyuZenJOXb8lRQEESC5fCosQ
	 NcLqOk74EXjLgxAQPhenOMui8HOXlq3jmBXNOkdToXMW5GZH8sHs4YXGwlOr+jeTLIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204795;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9Q52aaILj3OGXrjpZGl+q5JiL+rAyRrpE5X6+qYn/XA=;
	b=JMEU4B7N7GTxjbxSrkXGBTyesJ3Cbs1fbul4LmTgFLjrFIlhAvICpFwBtjq+kdQBBg68
	 atasC1jxpgevYwiz3SPcmP5zrP4xKtYsdPfEm69TScPk64BZTLHg7tPkp6F9JNjTCInVF
	 ZAhctyUEP5Fc5DaBAA6MOSdXz3tDK9qiA/Dz6buJak+tp4UI03ybwmbX+a8+ScCkKAvyU
	 C3IK/d3KZGC4is1aAPUSlWPqaHLCs3+hGhcbuiIVa8QeTx2WSGE/Y220acEIeEaSfPD4c
	 /nFBiQ2U68ZcvMhNdNRngNib+YehoFViiBXEMs0aFY5cDLAfmk/QePau4C0uoIb+U/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SBGEYlIo;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EE606A321;
	Mon,  9 Nov 2026 06:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB0EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SBGEYlIo
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A96CtVmA4103070, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794204775; bh=9Q52aaILj3OGXrjpZGl+q5JiL+rAyRrpE5X6+qYn/XA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SBGEYlIo3TMSQQ8MQ04raX8qhYyYiVKi8Y6rGqWcz9dSgZiMF7gTWkIaGLOJHhIm4
	 FK5B/C6c+odmIlcUuGU0cjYJxwM39g5riU1n2tyIPTQzRF7CVYYzIP6KaP01OFJv4q
	 sESAWE/1DW0g18pF8T0x+G6oYaLcPePdttdkCA/WpkLQ0DqBUO2DOjnFuLphIJDNqx
	 RAUgEIIyj4U+L1wTUJtoLVp8LLroRIFj92pD5n6S66i/sC6glskWxLY51A+cdMFBMe
	 iDn2E7U+ys7e/qY6eHXfCEl8cYOJSZzpOKqw3e6XynDb9VkM9EKLNl697UsCsOXcD+
	 EzGzKwtAOpUHA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A96CtVmA4103070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 14:12:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:12:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 14:12:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Topic: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Index: AQHdb15tzENGiXbpUkmLg1jSpFrwf7clBUSw//+124CAAIglsA==
Date: Mon, 9 Nov 2026 06:12:52 +0000
Message-ID: <86803b2c13a74ada92ab73e79f38164d@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
 <9fd1c42c5df94629a21c41dd08645b96@realtek.com>
 <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev>
In-Reply-To: <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBPbiBOb3ZlbWJlciA5
LCAyMDI2IDM6MzA6NTggQU0gR01UKzAxOjAwLCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVr
LmNvbT4NCj4gd3JvdGU6DQo+ID5LYWxwZXNoIFNvbGFua2kgPHNrYWxwZXNoOTQyQGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4+IENoYW5nZXMgaW4gdjM6DQo+ID4+IC0gTm90ZTogdjIgcGF0Y2ggMS8y
IChETUkgcXVpcmspIGlzIGFscmVhZHkgYXBwbGllZCBpbiBydHctbmV4dC4NCj4gPj4gLSBBZGQg
cGF0Y2ggMS8yIHRvIGNsZWFyIFJUV19GTEFHX1JFU1RBUlRJTkcgaW4gcnR3X29wc19zdG9wKCkN
Cj4gPj4gICB3aXRoIEZpeGVzIHRhZy4NCj4gPj4gLSBJbiBwYXRjaCAyLzI6DQo+ID4+ICAgLSBD
b3VudCBjb25zZWN1dGl2ZSBmYWlsdXJlcyBiZWZvcmUgdHJpZ2dlcmluZyByZWNvdmVyeQ0KPiA+
PiAgICAgKFJUV19QU19IQU5HX01BWF9DTlQgPSAzKS4NCj4gPj4gICAtIFJlc2V0IHBzX2hhbmdf
Y250IG9uIHN1Y2Nlc3NmdWwgTFBTIGxlYXZlIGFuZCBpbiBydHdfY29yZV9zdGFydCgpLg0KPiA+
PiAgIC0gU3VwcHJlc3MgcmF3IHJlZ2lzdGVyIGR1bXAgb24gdHJhbnNpZW50IGZhaWx1cmVzIHRv
IGF2b2lkIGxvZyBzcGFtLg0KPiA+DQo+ID5UaGUgcGF0Y2hzZXQgZG9lc24ndCBwcmVzZW50IGlu
IFsxXSBub3IgWzJdLiBQbGVhc2Ugd2FpdCBhIHdoaWxlIHRvIHNlbmQNCj4gPm5ld2VyIHZlcnNp
b24gYWZ0ZXIgaXQgcmVjb3ZlcmVkLg0KPiA+DQo+ID5bMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvDQo+ID5bMl0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtd2lyZWxlc3MvDQo+ID4NCj4gPg0KPiANCj4gSGkgUGluZy1LZSwN
Cj4gDQo+IFRoZSBsaW51eC13aXJlbGVzcyBsaXN0IGlzIGJ1Z2dlZCBhbmQgbm90aGluZyBpcyBh
cHBlYXJpbmcgb24gaXQgc2luY2UNCj4gMjAyNi0xMS0wNiAxNTo0NiBVVEMuIEFyZW4ndCBwYXRj
aGVzIGFjY2Vzc2libGUgZHVlIHRvDQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgYmVp
bmcgQ0MnZWQ/DQoNCkkgdGhpbmsgbm90LiBJIHNlbnQgcGF0Y2hlcyB0byBsaW51eC13aXJlbGVz
cywgbm90IGluY2x1ZGluZyBsaW51eC1rZXJuZWwsDQpiZWZvcmUsIGFuZCB0aGUgbG9yZSBhbmQg
cGF0Y2h3b3JrIG9mIGxpbnV4LXdpcmVsZXNzIGNhbiBjYXB0dXJlIHRoZQ0KcGF0Y2hlcy4gDQoN
Cg0KDQo=
