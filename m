Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379488;
	b=d5BLKP0uW35AHsZRg05rXUrWqCwmbIsqCMwGDLyhWsUMEpiVXzJ5BtpPFGru2TdizQ7n
	 FKw8R62BtgeqQVkKnXW++XasIqkjLZCHhNUlbYBhnmBFXh/7pAaRRC/pnFUi80Fxtdlee
	 G+OIgsYnUJsnnCbL8GgPEHDZ9gHTcLDxvhtMFnJq91dWHNbJHk4pZXFG218qyl3pljQs3
	 xBNNP+o0bUc5X0TXZYKk/30f2G9Ldt84ta6nzQN+O6toNSdlYHV2y/okwF7QnqiDMARIb
	 B0iMPf9gpv3mNYCI47gCXUErquH6+92RkKK8VhHjdxllIdZ4vDSJpm+H5wqD+NG6aYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379488;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zExPux9rD59uZO1jLE/eqb5aN7jV2MIkvRdrLJvZscs=;
	b=WYN5eE8FsF7I+kVJaHvDhU/qhyYMlIx7Wei2npxCqgf+khx6FRQrPDOS3ZvQ0uKjE9Ex
	 TFbE8+TjZ8OmMmnv2C6QgzLIY0bIOr67Vyp7Uckw11LixXg9UDlz3U83amrp8VuHx5BGL
	 i1zRbC2JejuwgTP2qI4QH+3eIvfWokfz0ibPRcn9om34p0JDlbu6UFa69netgIHIvIo3d
	 e2bPYYqAzWhPshxpy01DWeu/6Xg0mYufLdmDt4jId8lf0oYCg7h25xGvKZhC9T4MBpEwR
	 1ATw9emJ7eW/AYCa7W87BUrGy8v8lrMHT47Ih1V5HERrI2RWCfG0wXydDdkU5BKm+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=F7fZL4yn;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99F60A2602;
	Wed, 11 Nov 2026 06:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE99F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=F7fZL4yn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB6iX0u92171343, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794379473; bh=zExPux9rD59uZO1jLE/eqb5aN7jV2MIkvRdrLJvZscs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=F7fZL4yn1aWr+apUAjtNDY4DLOWqXMqfQmuYGtuW06UGgpZdMNnHOOagZL12cxKKw
	 cOQ10hUrmgI+5/60hs1Tm6ty7CD8N7kUItYzId9q7Hk1F22mF/lRtadzYTJprDeiDE
	 6gq941QPSDlC6IGzcHBjkmWEYbpPvINBmhcI/LbzGVO5aV2RjZxdX1hcFCJGSsn4TJ
	 5EjHRkBGuxiWyzTWe3mbW8GhQ/JCBTJ+i1vQjmXqYeCe+0+tw1d5yGrrtcp9rcdh4v
	 LbILsFyzV3tgm7qETnNjN6/ZAJc5+fJQqKcZD41ES8n7tjBaVDie0JqV+lcIBxiwy2
	 I2K3o3I/FqEng==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB6iX0u92171343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 14:44:33 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 14:44:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 14:44:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 14:44:33 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/3] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Topic: [PATCH v4 0/3] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Index: AQHdb41QSnErllZH10GRoAb+TdNRY7coPI/g//+p8wCAAIpfwA==
Date: Wed, 11 Nov 2026 06:44:33 +0000
Message-ID: <ed7480720b82467b881bb3f23da8017b@realtek.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com>
 <3fa52468b46142639eb6800cb52b146c@realtek.com>
 <7243D84A-CB81-477E-9A87-05AA4B3D0892@linux.dev>
In-Reply-To: <7243D84A-CB81-477E-9A87-05AA4B3D0892@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBPbiBOb3ZlbWJlciAx
MSwgMjAyNiA0OjM3OjE4IEFNIEdNVCswMTowMCwgUGluZy1LZSBTaGloDQo+IDxwa3NoaWhAcmVh
bHRlay5jb20+IHdyb3RlOg0KPiA+S2FscGVzaCBTb2xhbmtpIDxza2FscGVzaDk0MkBnbWFpbC5j
b20+IHdyb3RlOg0KPiA+PiBDaGFuZ2VzIGluIHY0Og0KPiA+PiAtIEluIHBhdGNoIDEvMzogQWxz
byBjbGVhciBSVFdfRkxBR19SRVNUQVJUSU5HIGluIHJ0d19vcHNfc3RhcnQoKSBpZg0KPiA+PiAg
IHJ0d19jb3JlX3N0YXJ0KCkgZmFpbHMuDQo+ID4+IC0gQWRkIHBhdGNoIDIvMzogUHJldmVudCBk
b3VibGUgZnJlZSBhbmQgc3RhX2NudCB1bmRlcmZsb3cgaW4NCj4gPj4gICBydHdfc3RhX3JlbW92
ZSgpIHdoZW4gcmVjb3ZlcnkgcmFjZXMgd2l0aCBzdGF0aW9uIGRpc2Nvbm5lY3QuDQo+ID4+IC0g
SW4gcGF0Y2ggMy8zOg0KPiA+PiAgIC0gS2VlcCBydHdfZndfZHVtcF9kYmdfaW5mbygpIGluIHBs
YWNlIG9uIGZpcnN0IGZhaWx1cmUuDQo+ID4+ICAgLSBSZXN0cmljdCBmaXJtd2FyZSByZWNvdmVy
eSBpbnZvY2F0aW9uIHRvIFBDSWUgZGV2aWNlcyB0byBwcmV2ZW50DQo+ID4+ICAgICBzY2hlZHVs
aW5nIHdoaWxlIGF0b21pYyBwYW5pYyBvbiBVU0IgYW5kIFNESU8uDQo+ID4+ICAgLSBFeHBsaWNp
dGx5IGNoZWNrIHJ0d19oY2lfdHlwZSgpIGluIHJ0d19md19yZWNvdmVyeSgpLg0KPiA+DQo+ID5J
IGNhbid0IHNlZSB2NCBpbiBsb3JlIG5vciBwYXRjaHdvcmsuIFBsZWFzZSBzZW5kIHY1IChpZGVu
dGljYWwgdG8gdjQpLg0KPiA+DQo+ID4NCj4gDQo+IFNob3VsZG4ndCBLYWxwZXNoIGFkZHJlc3Mg
dGhlIHJldmlldyBjb21tZW50cyBiZWZvcmUgcHVzaGluZyB2NSBzbyB3ZSBkb24ndA0KPiB3YXN0
ZSBhIHZlcnNpb24gY3ljbGU/IEhlIG1lbnRpb25lZCBoZSdkIGZvbGxvdyB1cCBpbiBhIGZldyBk
YXlzIHdpdGggdjUgdG8NCj4gYWRkcmVzcyB0aGUgdjQgZmVlZGJhY2suDQoNCk9rLiBJIGp1c3Qg
bm90ZWQgdGhhdCB2NCB3YXMgbWlzc2luZy4gDQoNCg0K
