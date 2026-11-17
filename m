Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876098;
	b=ugUogWqMKsTaRgWoqpTZWoAZb0nTVMkVt9bh0ElzTbahWRo+nx4Ep7A+0YhCwv/CnQ8G
	 W1TKUa27hppOzX8ZbOnJydfLFGVkhmxZnZTcA0Tg4UQ4a4h/mxidRf5V+HM0p4JIWWQbw
	 YviS9Kh2oNC+AO/bLB02s2XWX/fzH/MLGJEuP5T2uq3tZdhQgTxq8w3mxQ38tK0kd1cCi
	 jGFbvbc3H/FvLaKVskfB39NbdgR1enWID/oAqvEGQLrflShm6bfspbA7514oehKkD0n/V
	 cr9XNUNh89WBPGgLB664NRkR8D/0dDJnTVZOfj7RaclYcc4kVCWnvv7YeSezCed0agQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876098;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Wamf/8QY/WSddJRl6WK3BwrXY3Yj7OVM7fpv5Bwll44=;
	b=s4shet6r8ZWoimMNN4XSH8yBdhWbEiblnDlvIi89mgYl2MHc2zhw9xDKsPcwc8YS/ENV
	 Bo5KDBnjITJFsIoWiGju6YAG3aSm7yLsG9o0ZVLzGRnpnI33236dIVBLcjuGktjEf4Pa6
	 szwIxtFgvSD7ZhdOmwVrBZDbWDIbapOtmGn9+P8Kbs/y7X9m2Ls4KMgg/h8ikcjYDMszk
	 ni9dwZPUDweYkJ43uGoc/092BQHoOEWt/uqCxdW3xQ2fhM8u26t9E9apdnnnBcamljiSO
	 W5qEwSEpfO8fa+QAq9N4KNr0vPKHIOONG/nsLwf8sehkZxl8twMbR7VjUHi6c8b3rog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=fQ78ZyZ4;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D37606A31C;
	Tue, 17 Nov 2026 00:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=fQ78ZyZ4
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH0fSm353912518, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794876088; bh=Wamf/8QY/WSddJRl6WK3BwrXY3Yj7OVM7fpv5Bwll44=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fQ78ZyZ4zJzV4zg6Vtwcyz0dIjCvW2apJkHfVUtyVIGgu86jlJFJa+2XHwrTV8+tD
	 Hxrr8prDVyh0zSROKa/G0SUWEDS2DjVdYdh/KRGYNYLX0msWKeCpeqxL7dY+0Bq7WS
	 zWJcZCRQC59hlFCkBVV63nfjpT4DkKjgUx7VzKM4Zzq2lXEFLxnSpb+/pYKBGV7o/J
	 yUlw4+1rJIibcyDkrZfZU9h50CW50AwsF/lWj8J3eK0ew9PyInUR0CHJlFceV/+QJs
	 3edOpDU+KtXy8jiyvbtVy+G528WS56irw+OJ1cwW5BD8ysFxxHY9gEaJYMRdgmZ7KI
	 kzRX2+g8979/Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH0fSm353912518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 08:41:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 08:41:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 08:41:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 08:41:29 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for
 monitor interfaces
Thread-Topic: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for
 monitor interfaces
Thread-Index: AQHdc8qFK2Jt1QtiLUSH4J8FZa1Wk7cuhEiggAHMI4CAASAJsA==
Date: Tue, 17 Nov 2026 00:41:28 +0000
Message-ID: <ffc63e08f954499799f67fffc068c0de@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-6-owner@ph4ntom-rev.uz>
 <971ff7a2aa6e4f5bb6d4e459c386d433@realtek.com>
 <20261116152804.781-7-owner@ph4ntom-rev.uz>
In-Reply-To: <20261116152804.781-7-owner@ph4ntom-rev.uz>
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
diAxNSwgMjAyNiBhdCAwNDowODozMUFNICswMDAwLCBQaW5nLUtlIFNoaWggd3JvdGU6DQo+ID4g
RGVzY3JpYmUgd2h5IHlvdSBuZWVkIHRoaXMgcGF0Y2guIFdoaWNoIHByb2JsZW0geW91IGVuY291
bnRlcmVkIGFuZA0KPiA+IHdhbnRlZCB0byBmaXguDQo+ID4gWy4uLl0NCj4gPiBJJ2xsIGNoZWNr
IGZpcm13YXJlIHBlb3BsZSB0aGUgc2V0dGluZy4NCj4gDQo+IFdpdGhvdXQgdGhpcyBjaGFuZ2Us
IHJhdyBmcmFtZXMgaW5qZWN0ZWQgb24gYSBtb25pdG9yIGludGVyZmFjZSBhcmUNCj4gcXVldWVk
IGJ5IHRoZSBkcml2ZXIgd2l0aG91dCBlcnJvciwgYnV0IG5vdGhpbmcgaXMgdHJhbnNtaXR0ZWQg
b3ZlciB0aGUNCj4gYWlyIGJlY2F1c2UgZmlybXdhcmUgc2lsZW50bHkgZHJvcHMgZnJhbWVzIHF1
ZXVlZCBvbiB0aGUgbW9uaXRvciBNQUMgSUQNCj4gd2hlbiBpdCB3YXMgaW5pdGlhbGl6ZWQgd2l0
aCB0aGUgZGVmYXVsdCBjbGllbnQgcm9sZSBhbmQgZGlzYXNzb2MgPSAxLg0KDQpCdXQgSSBjYW4g
dXNlIHlvdXIgcHl0aG9uIHNjcmlwdCB0byBpbmplY3QgcGFja2V0cyB3aXRob3V0IGFueSBjaGFu
Z2Ugb24NCmtlcm5lbCA3LjEuNS4gQ2FuIHlvdSBkZXNjcmliZSB0aGUgInJhdyBmcmFtZXMiIG1v
cmUgc3BlY2lmaWM/DQoNCg0K
