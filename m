Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857837;
	b=V9iIhExzyHbeaiQP3/dWIi+bkeRgXQXYUPe0UFs8Nxf+BgiAckUSmvC5diGLO4xn0iA2
	 NZ/jIrszAy2yummtM/U6LrJMMbi+ZSvb8xanMO2hhp8CLBmyKDojJEOnZGfT6XuN3kVsq
	 3pTW0MeDnbWlD5bbdB2XeymqVdMSWSIhI72HweZ2/dN2BgHP9l+oCiSfsHgc5VPrxtkdn
	 Af626MLI1bzj7bBPvhVfKvFOhBxytx7ZeyJEYOxFviyAC+QZRS/5bM5mJo6hhmIJg4iGM
	 A+hf/4MFqV0i2ORpEE/PEg8PYnsb1MgyW9U0l+Re5mXPrGC6JBHEBFEoY1XhjpxEJkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857837;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Date:From:To:Cc:Reply-To:
	 Message-ID:Subject:X-Mailer:MIME-Version:x-aliyun-im-through:
	 References:x-aliyun-mail-creator:In-Reply-To:x-aliyun-mailtrack:
	 Content-Type:Content-Transfer-Encoding;
	bh=+nIQo6SJcvZDib3A+NhZjHGX96S244Rb7zbwdwutnkg=;
	b=ftDMGn2+FDaE91iAMWBakWDzchZMqDy+464hOEE2LdocjJknftIEB2If9DQ3m7+Sq+X5
	 hwx41KfnnFiZhTXQdYDF26InEtAv7ukiexpoleTh9rTzLRS35ZUmB7UPGvAkN9ygqBW8L
	 DPqOqk5UiE35a5rKokDez6eCyqT0Pm3rAiiZN9TirF4SxGS7dVnCxD4FS0v0sNF5L4tKt
	 pAbCNpMIFbONPkXpIYpum6bFP62acGpBzt5MBsGEg0BTRajbxWAbZJiIwbWcCsufrYUxQ
	 nplfEMcFcxTkOYI1nR4VdogDexmDBI7JBnvgoSGnBJjNk9DyetahuD8BnjVfuCnUzRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.170
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F580606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F580606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.7356054|0.6548271;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_social|0.00726536-0.000343484-0.992391;FP=5296112782220841970|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032065030;MF=liaoxuan@open-hieco.net;NM=1;PH=DW;RN=7;RT=7;SR=0;TI=W4_0.2.3_v5ForWebDing_21251644_1793857779938_o7001c47r;
Received: from WS-web (liaoxuan@open-hieco.net[W4_0.2.3_v5ForWebDing_21251644_1793857779938_o7001c47r] cluster:ay29) at Thu, 05 Nov 2026 13:50:21 +0800
Date: Thu, 05 Nov 2026 13:50:21 +0800
From: "=?UTF-8?B?5buW54WK?=" <liaoxuan@open-hieco.net>
To: "Keith Busch" <kbusch@kernel.org>
Cc: "axboe" <axboe@kernel.dk>,
  "hch" <hch@lst.de>,
  "sagi" <sagi@grimberg.me>,
  "linux-nvme" <linux-nvme@lists.infradead.org>,
  "linux-kernel" <linux-kernel@vger.kernel.org>,
  "default avatarZheng Tan" <tanzheng@kylinos.cn>
Reply-To: "=?UTF-8?B?5buW54WK?=" <liaoxuan@open-hieco.net>
Message-ID: <34801e0a-5d66-47c4-9844-7844363072fe.liaoxuan@open-hieco.net>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIIDEvM10gbnZtZTogQWRkIGFkYXB0aXZlIFBDSWUgbGluayByYXRl?=
  =?UTF-8?B?IHN3aXRjaGluZyBmdW5jdGlvbg==?=
X-Mailer: [Alimail-Mailagent][W4_0.2.3][v5ForWebDing][Chrome]
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
x-aliyun-im-through: {"version":"v1.0"}
References: <cover.1790134954.git.liaoxuan@open-hieco.net> <85a11a4085d04a2823c04059702630cf34abf6d4.1790134954.git.liaoxuan@open-hieco.net>,<auoxH197kQfUJGaE@kbusch-mbp>
x-aliyun-mail-creator: W4_0.2.3_v5ForWebDing_SFRTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzE1Ni4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xNTYuMC4wLjA=Ch
In-Reply-To: <auoxH197kQfUJGaE@kbusch-mbp>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGksS2VpdGgKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldyBhbmQgZm9yIHJhaXNpbmcgdGhlIEFT
UE0gTDEgcG9pbnQuIEkgYWdyZWUgdGhhdCBBU1BNIEwxIGlzIHZlcnkgZWZmZWN0aXZlIGZvciBw
b3dlciBzYXZpbmcuCkhvd2V2ZXIsIEwxIGlzIGVudGVyZWQgb25seSB3aGVuIHRoZSBsaW5rIGlz
IGNvbXBsZXRlbHkgaWRsZSAobm8gcGVuZGluZyB0cmFuc2FjdGlvbnMpLiBEdXJpbmcgYWN0aXZl
IGJ1dCBsb3ctdXRpbGl6YXRpb24gSS9PLCB0aGUgbGluayBjYW5ub3QgZW50ZXIgTDEgYW5kIHR5
cGljYWxseSBzdGF5cyB0cmFpbmVkIGF0IGl0cyBtYXhpbXVtIHJhdGUuIFRoaXMgcGF0Y2ggdGFy
Z2V0cyBleGFjdGx5IHRoYXQgd2luZG93OiBpdCBkeW5hbWljYWxseSBkb3duZ3JhZGVzIHRoZSBs
aW5rIHJhdGUgdG8gdGhlIG1pbmltdW0gc3VmZmljaWVudCBmb3IgdGhlIGN1cnJlbnQgdHJhZmZp
YywgYW5kIHVwZ3JhZGVzIGJhY2sgdG8gbWF4aW11bSB3aGVuIGxvYWQgcmlzZXMuClNvIHRoZSB0
d28gbWVjaGFuaXNtcyBjb3ZlciBkaWZmZXJlbnQgbGluayBjb25kaXRpb25zIGFuZCBhcmUgY29t
cGxlbWVudGFyeSByYXRoZXIgdGhhbiBjb25mbGljdGluZzogQVNQTSBMMSBoYW5kbGVzIHRoZSBp
ZGxlIGxpbmssIHdoaWxlIHRoaXMgcGF0Y2ggaGFuZGxlcyB0aGUgYWN0aXZlLWJ1dC11bmRlcnV0
aWxpemVkIGxpbmsuCgpCZXN0IHJlZ2FyZHMsCkxpYW8gWHVhbgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCuWPkeS7tuS6
uu+8mktlaXRoIEJ1c2NoIDxrYnVzY2hAa2VybmVsLm9yZz4K5Y+R6YCB5pe26Ze077yaMjAyNuW5
tDEx5pyINOaXpSjlkajkuIkpIDAzOjA4CuaUtuS7tuS6uu+8miLlu5bnhYoiPGxpYW94dWFuQG9w
ZW4taGllY28ubmV0PgrmioTjgIDpgIHvvJpheGJvZTxheGJvZUBrZXJuZWwuZGs+OyBoY2g8aGNo
QGxzdC5kZT47IHNhZ2k8c2FnaUBncmltYmVyZy5tZT47ICJsaW51eC1udm1lIjxsaW51eC1udm1l
QGxpc3RzLmluZnJhZGVhZC5vcmc+OyAibGludXgta2VybmVsIjxsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnPjsgZGVmYXVsdCBhdmF0YXJaaGVuZyBUYW48dGFuemhlbmdAa3lsaW5vcy5jbj4K
5Li744CA6aKY77yaUmU6IFtQQVRDSCAxLzNdIG52bWU6IEFkZCBhZGFwdGl2ZSBQQ0llIGxpbmsg
cmF0ZSBzd2l0Y2hpbmcgZnVuY3Rpb24KCgpPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAwMjoyNTo0
M1BNICswODAwLCBMaWFvIFh1YW4gd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIGR5bmFtaWNhbGx5
IGFkanVzdGluZyB0aGUgUENJZSBsaW5rIHJhdGUgb2YgTlZNZQo+IGRldmljZXMgYmFzZWQgb24g
SS9PIGFjdGl2aXR5LiBUaGUgbGluayBpcyBkb3duZ3JhZGVkIHRvIGEKPiBjb25maWd1cmFibGUg
bWluaW11bSByYXRlIGR1cmluZyBwZXJpb2RzIG9mIGxvdyBhY3Rpdml0eSB0byBzYXZlCj4gcG93
ZXIsIGFuZCB1cGdyYWRlZCB0byB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgcmF0ZSBhcyBzb29uIGFz
IHRoZQo+IHdvcmtsb2FkIGV4Y2VlZHMgYSBjb21wdXRlZCB0aHJlc2hvbGQsIHNvIHRoYXQgcGVh
ayBwZXJmb3JtYW5jZSBpcwo+IG1haW50YWluZWQgdW5kZXIgbG9hZC4KClByZXR0eSBzdXJlIFBD
SWUgQVNQTSBMMSBzdGF0ZXMgd291bGQgc2F2ZSBtb3JlIHBvd2VyIHRoYW4gZG93bmdyYWRpbmcK
dGhlIGxpbmsgcmF0ZSwgYXMgd2VsbCBhcyBoYXZlIGJldHRlciBlbnRyeS9leGl0IGxhdGVuY3kg
dGhhbiBhIHNvZnR3YXJlCmRyaXZlbiBtb25pdG9yIGFuZCBsaW5rIHJldHJhaW4uCg==
