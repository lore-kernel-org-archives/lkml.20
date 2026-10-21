Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549306;
	b=3FfqxtVd5omNr+tP7FZHjXoNsmhrAYrvMUnX7od5+PHeqAGLK9R8hlSpQW1uYuZHYBEl
	 WFV0VY8hychBsfUHSv2AL+HYVbpaQMpDI2IRfv0jEQQ85fD6Ijlkn+rwrlWz0nrsdasED
	 tvB37n2XAMm1Vc9qyXZpzuFU5tVpMrwNHScuXpVUt6aCsjNKMUIVREbSOEWMCKcE0JJJM
	 5a0DL7gOZiI8XiRvwVvNS+o3Z73xcoT8OwvS0dN+7prhaOx1yPLkkgAIQX9hi0EegTLPK
	 RAX1gzBlz7WnhceZy/5NbBjicTJ+HFeME2IuWoLVE5HQEOHdevoh9FEVoH2xbPol5ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549306;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=f2f/DE7rBbbBr7j9N3OA+8cSnX5Eq7fX8UFsngC2WQs=;
	b=gC0hXyVNSe1SnDuD6AsrFZx8sQA0GGimFCuB1HqoF1YTFvqxnq/xr/lg1HGpv153WDZl
	 A2WGkvDw9xGNZewxd7ib3sUOLGj+4zih4n2FHwDRIE3oFChpMgsaOiDCvRYsawfjAfTtX
	 vmqE3ZtGv2KAUNHF9BbheJFpjvrQ3nTJt9m/hL3qEB/kHmRFRJ7tplx6nAa940MX34ZUE
	 aWkHej8FTNx1Qnongewj3vl63ox7NHplksY4PzhbXaaL74K/vBH93vLJmqEzumxrKMEo7
	 wX90D2uWDlZDY19Nwf1Da2XxBoPR4hYrTmm6JCa3zkp0/BvBN7DfZHh+mXxgjccdmWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=h04gbxTp;
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=h04gbxTp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=f2f/DE7rBbbBr7j9N3OA+8cSnX5Eq7fX8UFsngC2WQs=; b=h
	04gbxTpgcWnmROt5d2/ZAiiAyU6ifuXr6grluqWtUcxeoRkwgeH5Hdwv6WoP7zPz
	WuB3C0cfh+GK/9WWmn+SY6X4K3KYzxIgfuAz7encjWqqTRIQ8iPjQqmqEISpVeOZ
	ikqIc0OljP5E96sAZkeCjiPvoMYGEMeydGNUcocucI=
Date: Wed, 21 Oct 2026 10:20:58 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
Cc: "Nanzhe Zhao" <nzzhao.sigma@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	"Jaegeuk Kim" <jaegeuk@kernel.org>, "Barry Song" <baohua@kernel.org>,
	"Nanzhe Zhao" <zhaonanzhe@xiaomi.com>,
	"Juan Yescas" <jyescas@google.com>,
	"Daeho Jeong" <daehojeong@google.com>, "Dev Jain" <Dev.Jain@arm.com>,
	"David Hildenbrand" <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org, "Bo Zhang" <zhangbo56@xiaomi.com>,
	"Kalesh Singh" <kaleshsingh@google.com>,
	"Pengfei Li" <lipengfei28@xiaomi.com>,
	"Ryan Roberts" <Ryan.Roberts@arm.com>
Subject: Re:Re: [PATCH v5 09/16] f2fs: optimize small block size large folio
 read
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <5c409e48-a6ff-4572-83ea-8e63d8e3552a@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-10-zhaonanzhe@xiaomi.com>
 <5c409e48-a6ff-4572-83ea-8e63d8e3552a@kernel.org>
X-NTES-SC: AL_Qu2SAPmftkou7iCQZOkdmEoVj+o8Xsaxs/8g2YJSc8gOtgfUwzsQWHZeElbTwO69ABq9sQGSYCZS08NTWLJTJrDPy4rZ03qSm89gCKAVuw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <3cdc6e34.1d0f.1a15c430367.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSkvCgD3V6uKIdhq5VBTAA--.54450W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsAo7C2rYIYoDagAA36
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Cj4KPk9vcHMsIHNvcnJ5LCBJIGRpZG4ndCBub3RpY2UgdGhlcmUgaXMgdW5uZWNlc3NhcnkgZjJm
c190cnVuY2F0ZV9tZXRhX2NhY2hlcygpCj5pbiBmMmZzX3dhaXRfb25fYmxvY2tfd3JpdGViYWNr
X3JhbmdlKCksIHNvIHN0aWxsIHdlJ2QgYmV0dGVyIGp1c3QgdXNlCj5mMmZzX3dhaXRfb25fYmxv
Y2tfd3JpdGViYWNrIGhlcmU/Cj4KPiAgICB2b2lkIGYyZnNfd2FpdF9vbl9ibG9ja193cml0ZWJh
Y2tfcmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwgYmxvY2tfdCBibGthZGRyLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBsZW4pCj4gICAgewo+ICAgICAgICBz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ICAgICAgICBibG9j
a190IGk7Cj4KPiAgICAgICAgaWYgKCFmMmZzX21ldGFfaW5vZGVfZ2NfcmVxdWlyZWQoaW5vZGUp
KQo+ICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAgIGZvciAoaSA9IDA7IGkgPCBsZW47IGkr
KykKPiAgICAgICAgICAgIGYyZnNfd2FpdF9vbl9ibG9ja193cml0ZWJhY2soaW5vZGUsIGJsa2Fk
ZHIgKyBpKTsKPgo+ICAgICAgICBmMmZzX3RydW5jYXRlX21ldGFfY2FjaGVzKHNiaSwgYmxrYWRk
ciwgbGVuKTsgIDwtLS0tLS0tLS0tLS0KPiAgICB9Cj4KPlRoYW5rcywKPgpJIGhhdmUgY2hlY2tl
ZCB0aGUgY29tbWl0IGhpc3Rvcnkgb2YgZjJmc193YWl0X29uX2Jsb2NrX3dyaXRlYmFja19yYW5n
ZS4uLi4KSXQgc2VlbXMgZjJmc190cnVuY2F0ZV9tZXRhX2NhY2hlcyBpcyB1c2VkIHRvIGludmFs
aWRhdGUgb2xkIGRpcnR5IG1ldGEgZGF0YSB0bwpwcmV2ZW50IGRhdGEgY29ycnVwdGlvbiBmb3Ig
RElPIGNhc2UuIEJ1dCBJIHRoaW5rIG5vdyB0aGUgaGVscGVyJ3MgbmFtZSBpcyBxdWl0ZQptaXNs
ZWFkaW5nIGhlcmUuLi4uLi4uLi4uLi4uLi4uLi4gV2UgbWF5IG5lZWQgYSBjbGVhbnVwIHBhdGNo
IGZvciB0aGlzIGZ1dHVyZS4K
