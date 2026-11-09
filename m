Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192561;
	b=G2vp/Y+vlBYac1Imv404gFugL0JQrf0gGGVd2SG9qYGiducsl6CiZpSfPs6RVydIZ6aw
	 mKcCB+cH9UM4vD6749ik5OsrLexPagzsN2+eoUv7wsi5RKl3Pq34TJxiT0cFXaawWE66h
	 /ADkeaaOV6VZuj4q3GBaQSZwlLIXD8ekZskn1P1/uuh14+1GyXgYm7UzbS4NylPAcSDcU
	 LC40tr9ibE4YZag4afl7F8vK2pkWxe/PNvQHvMais3TmV/+2bWufk1EWcMh24wN9xepk1
	 9KRDBo5O6CmVUOimSvgvmh83ry1y0rZvf8q7wCkRvVmGWUFYWQ/3hIef81c2tW7NPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192561;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YJFIEO4Yo1Kwr5WnDwBRFU+vuAS+BAEotaPvoQmyOGM=;
	b=QUTkIaazlsgCQVeaqp0u0dGEWmP5/BoLzrVJgYA9nrDAjp5MLwvl0mshv9J9+CBGhgPG
	 RSc7aeZsPOnwBEtB34gs+Lwwrfqn9ZgcTED754onOXVjcd17+A8LBdlpk5Z5UlsTVgzfy
	 byFDCcMVf5EmuFTi14XKUYnoCKX1O7mmZJLJzybirJGqYcKBg3RHkJbIQQEU/pIAz2ZRk
	 5/LcWjP/vSSh5OCcoYB5PulnP8FQXXahOzxSBt8UxxGA+abJg7CKq/xS8+t3mW/U1+kvk
	 kytVYGLLiAquUutBcDFC4xOm6i35Qu+b2XSeJUQ1rtNpHvxQSxZrC+hI2gmFDJr4VWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=CCcGPtBU;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C9606A31C;
	Mon,  9 Nov 2026 02:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=CCcGPtBU
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A92nGEG13957756, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794192556; bh=YJFIEO4Yo1Kwr5WnDwBRFU+vuAS+BAEotaPvoQmyOGM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=CCcGPtBUDjn7vI3UCIUTi/seesuLWSdMdnDUg5XWR9915WfZvlluVHH77iKI959bK
	 W4iTSPnOE4s07iBMwI6bMxbIn2PDTsuxC9TcYg72odH4yUvcjFPEfbhhhA3gy/cL2+
	 kNl3OI3z7iwC/T8CHq/2z2w0pRvMUOzvmuuzpvg0aGysJXyw1dLA/lLiz5bIadJ7Bp
	 y9By2RH2t7MRmrT200q966EaGSUGr6T8C5Owckp3qR7mrsLg3EWwAE2zxX2kKpOHYd
	 YtqG9QCDzHeAUu6841vc3VG9MLtru7dWcKWPOUjCirGnMvZXxN1Jy6kbSvYMa9LK9m
	 zjcJrRhpmWEZw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A92nGEG13957756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:49:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:49:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:49:16 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jie Feng <hjf3108@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for
 QoS null frames
Thread-Topic: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for
 QoS null frames
Thread-Index: AQHda3lHxIC7vpFqd0S6iIDQsoFki7cjlhkAgABmC4CAARZ1kA==
Date: Mon, 9 Nov 2026 02:49:15 +0000
Message-ID: <a69a96e55d1a43fea6b89db002adc33b@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-2-hjf3108@gmail.com>
 <e4895ae4df0e4de6a5dc45bc276cb1d1@realtek.com>
 <CABOQOSWgd5hyvZj4tcSwYHD2_n3Su1hBGkBRo3AYvvRmPijeYw@mail.gmail.com>
In-Reply-To: <CABOQOSWgd5hyvZj4tcSwYHD2_n3Su1hBGkBRo3AYvvRmPijeYw@mail.gmail.com>
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
IGF0IDExOjA4LCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIbyBKaWUgRmVuZyA8aGpmMzEwOEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gT25seSBz
dGFydCBCQSBzZXNzaW9ucyBmb3IgZnJhbWVzIHRoYXQgY2FycnkgZGF0YS4NCj4gPg0KPiA+IEkg
Y2FuJ3QgdW5kZXJzdGFuZCB3aHkgYnVpbGRpbmcgYSBCQSBzZXNzaW9uIGZvciBudWxsIGZyYW1l
cyBjYXVzZSBsb3dlcg0KPiA+IHRocm91Z2hwdXQ/IFBsZWFzZSBleHBsYWluIHdoeS4NCj4gSSBp
bmNsdWRlZCB0aGUgdGhyb3VnaHB1dCBudW1iZXJzIGFzIGEgcmVncmVzc2lvbiB0ZXN0LCB0byBz
aG93IHRoYXQgaXQgZG9lcyBub3QNCj4gY2F1c2UgYW55IHNwZWVkIHJlZ3Jlc3Npb25zLiBJdCBz
aG91bGQgbm90IGFmZmVjdCB0aHJvdWdocHV0Lg0KDQpQbGVhc2UgZHJvcCB0aGUgbnVtYmVycyBm
cm9tIHRoaXMgcGF0Y2guIA0KDQoNCg==
