Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888903;
	b=UIn+CEOY/jRZBWchsu1ie+Yd3I4+uFJZZpkCuWj+Z/mb+tleeYAiT8a3k4sEwUUD9D0x
	 niuSTcT5o4UEe1XAimoVsuxxv9nKz/9b02nYXSUIqg0QvucelieXVDXmDQGL9eoaeyJhz
	 LWRAMVHFC3g/C13fss6njjgaJ5ioYNSAjMALYQhHv8VjFxLOauUboW1/0ImMAeeayHMxK
	 eb2MF9x9J0HN9I18IjaCup8LPIpx9RiRlpbkC8+yvJkclknwLoepQek73ESTMA1DjTjiO
	 FXUOcuOZvPzawTNI8XS2IpM0NIN1LuHOoN5ALFECGxNcTc8jrfx8PheoSbBVrKvN8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888903;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jpEA1p737d/LV6b1EhSKDxczg7NwRl/i2PETIxXcRJM=;
	b=W8xbuTa4DObr5/tHvDM6XFqajEDTj0auDOpL2ggb9OLG0tErkz5SUdXx5D1rV3awUnKO
	 UmmzCEdyWnW26aB7ath9m/xwjDnqIhXqBlyPBzIaDohrlMFODc/CSi7BG7HIMt2LLZDMX
	 5d0wwG9SfXSSWB8oIeKlGAkPzDswYOGPeU5mrfmbqWJrZw1+1tksZOCuOIpibTqOytCHq
	 nderPYNfhwcGutWLJdA46LMj9OLnGWQ75ZD5i6uHYGqv8rMJP+6q/34ysIucz3ygYLo+3
	 d99pfBzd++eUsGN3eHBFzuFOlzFqnWJx8mol34M1FKxl3HJdxYzmGE39TtPEkiXRkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RHi7poMd;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C3606A329;
	Tue, 17 Nov 2026 04:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8C3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RHi7poMd
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH4EkWX24070782, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794888886; bh=jpEA1p737d/LV6b1EhSKDxczg7NwRl/i2PETIxXcRJM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RHi7poMdqSSknvK19taRqxFECNnhOURXLeo5+5iizIs4AFW0xcYQtjH+CZU5YdvAK
	 geIR+3rsFxHAvhTVWQaW5faUe2UgqHHIJQeC91bngGpBwevPHAJpqzr+rbbKLlwaAO
	 l2Kkmx42XbdU7DYuJoI2DjRCU++BemhZmuVzKciyKngSR7VTkSJ1StDuEbWTSIgX9Z
	 XP3yw/PwWrus9Au4Uvfh4EN/JH+ZT79ibkigxklu0nM9pWk3l2BmGvOnTTS6wSWWcQ
	 iIamuPya4d0jxGiGKyoWh0iLrvc7f+YivO5+NqPPGBj3OiKLUYuGNrZEMt7IGMz0W6
	 9utT6W06E+zqg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH4EkWX24070782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 12:14:46 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 12:14:44 +0800
Received: from RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8]) by
 RTKEXHMBS03.realtek.com.tw ([fe80::d2b4:cd25:1a3e:aca8%9]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 12:14:44 +0800
From: Zong-Zhe Yang <kevin_yang@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>, Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Topic: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when
 leaving idle on non-chanctx devices
Thread-Index: AQHdc8qsP3ErQ6YwO02QgdrypGLW6bcvjAgAgADEaQCAAVitMA==
Date: Tue, 17 Nov 2026 04:14:43 +0000
Message-ID: <4c7cb29ef6f442e6babe7dec989cbfbd@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
 <20261113235211.1911-11-owner@ph4ntom-rev.uz>
 <ef6d8d689d88443e993d667e7a75d538@realtek.com>
 <20261116152804.781-12-owner@ph4ntom-rev.uz>
In-Reply-To: <20261116152804.781-12-owner@ph4ntom-rev.uz>
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

RW52ZXIgSWtyb21vdiA8b3duZXJAcGg0bnRvbS1yZXYudXo+IHdyb3RlOg0KPiANCj4gT24gTW9u
LCBOb3YgMTYsIDIwMjYgYXQgMDM6NDU6MDRBTSArMDAwMCwgUGluZy1LZSBTaGloIHdyb3RlOg0K
PiA+IFRoZSBjb21taXQgbWVzc2FnZSBtYXkganVzdCBzYXkgdGhhdCBmaXggdGhlIGNoYW5uZWwg
aW4gbW9uaXRvcg0KPiA+IGRvZXNuJ3QgcmVzdG9yZSBhZnRlciBtb25pdG9yIGludGVyZmFjZSBk
b3duL3VwLg0KPiA+IFsuLi5dDQo+ID4gRGVjbGFyZSBhIGxvY2FsIHZhcmlhYmxlICdub19jaGFu
Y3R4ID0NCj4gPiAhcnR3ZGV2LT5vcHMtPmFzc2lnbl92aWZfY2hhbmN0eCc7DQoNClBlcmhhcHMg
YWRkIGEgc3VwcG9ydF9jaGFuY3R4IGZsYWcgaW4gcnR3ZGV2Lg0KKFlvdSBjYW4gcmVmZXIgdG8g
dGhlIHN1cHBvcnRfbWxvIGZsYWcuKQ0KVGhlbjoNCiAgICBub19jaGFuY3R4ID0gIXJ0d2Rldi0+
c3VwcG9ydF9jaGFuY3R4Ow0KDQo+ID4gTW92ZSB0aGlzIHVwd2FyZCBhZnRlciBydHc4OV9sZWF2
ZV9wc19tb2RlKCksIGFuZCB1cGRhdGUgdGhlICdjaGFuZ2VkJw0KPiA+DQo+ID4gICAgY2hhbmdl
ZCB8PSBJRUVFODAyMTFfQ09ORl9DSEFOR0VfQ0hBTk5FTDsNCj4gPg0KPiA+IHRvIHNoYXJlIGV4
aXN0aW5nIGNvZGUuDQo+IA0KPiBUZXN0ZWQgeW91ciBleGFjdCBzbmlwcGV0IG9uIFJUTDg4NTJB
RSBhY3Jvc3MgY29sZCBzdGFydCBhbmQgbW9uaXRvcg0KPiBkb3duL3VwIG9uIDUgR0h6ICg4MCBN
SHopLCBhbmQgUlggYW5kIFRYIHJlc3RvcmUgY2xlYW5seS4gSSB3aWxsIHVzZSB0aGlzDQo+IGFw
cHJvYWNoLCBzaG9ydGVuIHRoZSBjb21taXQgbWVzc2FnZSwgYW5kIHBsYWNlIHRoZSBwYXRjaCBi
ZWZvcmUgdGhlIGZlYXR1cmUNCj4gcGF0Y2hlcyBpbiB2NiBhcyBab25nLVpoZSBzdWdnZXN0ZWQu
DQo+IA0K
