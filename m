Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634308;
	b=x1E5TlImp4GS1uOyhZrQmMdn09rz44BIHO9D/CFe+Ecr8+tyRkENxroQ+rk4gIINJPaQ
	 cVIMFoWZtOR/djRZBUDqpIz5jqwPL0FiZNYIT1lJvEElOj1bWC4Q5ar/pBaFCHVxOfiwU
	 NRT5EW5cp5GBQQpz9Z19ziOJFA/Cv33bFy3jGf1/gx02E/19ZS5tQpE/kSQRCx6DW9UQG
	 cntwT5Oe7yp1S467zW+MtXMDLc9Ey3J7W4j36xXvCTOM9brP7cpQGhdy9M0BxxCDI260C
	 e5Vn5swhpVoxlwjb9aZzEyvovnJaWrySFevlrtzd4LPG5YJLYOX/o1yWpl8/xieZQ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634308;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=DnopcSwUb/bweHu3ihzSfCyHrSkeN2Q/wJyvQ9VQBXk=;
	b=IHaeNjbAECnrjtCrVN/G+TsdmWw9OQuE/kKR2Vgq1Q7MYg8/tS2oW3K9z+hcJmERK0gU
	 OC0Ph5BAarjxdzuS/9CGCfsjJfwRQm5jETExOxwK9MCl1yMb7bqaCZKbihrSJZqke53+E
	 jSRm/pdR2++6KvkCCUUMDc4TcCRdB49/8E9ZymjPhcDGuRxh6Ay6l59VsEijgJ6N6Swex
	 hbJHhbX9Pc6CqckRnSwBJzXWUzM6NScmgGT7BrDRx9paRrT1XqVPamTIWkXayqo2usLyC
	 XFP4/1oW9kryofMypGpUdshF3lhFDjNjKSg0S0A+9XYBpYfiVDt8+HCcrRE5eZ/SuzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=bC8DYfqY;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B8CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=bC8DYfqY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=DnopcSwUb/bweHu3ihzSfCyHrSkeN2Q/wJyvQ9VQBXk=; b=b
	C8DYfqYw04fvBStFa7815FrakYjuFBfj9/vru51Z+g/B3XXMZH09u0/p79oyKltL
	FQSPY++ZuESVZa2gALz/IPtYE91cM1iSIiKFQxmP3nnfsRmBjkmbeKjI9j9HcZu4
	juA1XO5WFG19893617hQF9XmxNbaMWuul5iupu5EMk=
Date: Thu, 22 Oct 2026 09:57:45 +0800 (CST)
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
Subject: Re:Re: [PATCH v5 05/16] f2fs: support large folio writeback
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <36d24c53-25e0-45de-889b-f309ee6a0bdd@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-6-zhaonanzhe@xiaomi.com>
 <6be679d1-d8ab-41b3-9975-1f1bcd552579@kernel.org>
 <36d24c53-25e0-45de-889b-f309ee6a0bdd@kernel.org>
X-NTES-SC: AL_Qu2SAPqYu0ot4yeQZekdmEoVj+o8Xsaxs/8g2YJSc8gOtgfUwzsQWHZeElbTwO69ABq9sQGSYCZS08NTWLJTKWLh3xKMeYpfjV5kmQOYJQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <12edc14a.1662.1a1615420ba.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSkvCgDnj8CZbdlqaQRUAA--.33309W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoxmSYmrZbZksiQAA3o
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Cj4+PiArb3V0Ogo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IENsZWFyIHRoZSBkaXJ0eSBzdGF0ZSBvZiB0aGUgc3VicmFuZ2VzIHRoYXQgd2VyZSB3cml0dGVu
IGJhY2suCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIElmIHNvbWUgc3VicmFuZ2VzIGFyZSBzdGls
bCBkaXJ0eSAoZS5nLiB0aGUgZm9saW8gd2FzIG9ubHkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
cGFydGlhbGx5IHdyaXR0ZW4gYmFjayksIHRoZSBmb2xpbyBtdXN0IHN0YXkgZGlydHkgc28gdGhh
dAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiB0aGUgcmVtYWluaW5nIHN1YnJhbmdlcyBhcmUgd3Jp
dHRlbiBiYWNrIGxhdGVyLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoZjJmc19mZnNfY2xlYXJfc3VicmFuZ2VfZGlydHlfYW5kX3Rlc3QoZm9saW8sIDAs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGVyciA/IHBvcyA6
IGVuZF9wb3MpIC0gZm9saW9fcG9zKGZvbGlvKSkpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmb2xpb19yZWRpcnR5X2Zvcl93cml0ZXBhZ2Uod2JjLCBmb2xpbyk7Cj4KPkZvciBmb2xpbyBv
cmRlci0wLCBpZiBmMmZzX3dyaXRlX2ZvbGlvX2RpcnR5X3JhbmdlKCkgZmFpbGVkLCB3ZSBuZWVk
IHRvIHJlZGlydHkKPmZvbGlvIGFueXdheSwgcmlnaHQ/IHNvIGl0J3MgbmVlZCB0byBjaGVjayBl
cnIgYXMgd2VsbD8KPgo+VGhhbmtzLAo+CgpJbiBmMmZzOiBoYW5kbGUgcGFydGlhbCB0cnVuY2F0
ZSBvZiBsYXJnZSBmb2xpbyBkaXJ0eSBzdWJwYWdlcyBJIGhhdmUgdGhlIGZvbGxvd2luZyBodW5r
CkBAIC00NTE0LDkgKzQ1OTAsOSBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfY2FjaGVfZm9saW9z
KHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAogCQkgKiBSZWRpcnR5IHRoZSBmb2xpbyBp
ZiBkaXJ0eSBzdWJyYW5nZXMgcmVtYWluIGluIGEgbGFyZ2UKIAkJICogZm9saW8sIG9yIGlmIG9y
ZGVyLTAgd3JpdGViYWNrIGZhaWxzIGR1ZSB0byBhbiBlcnJvci4KIAkJICovCi0JCWlmIChmMmZz
X2Zmc19jbGVhcl9zdWJyYW5nZV9kaXJ0eV9hbmRfdGVzdChmb2xpbywgMCwKLQkJCQkJKGVyciA/
IHBvcyA6IGVuZF9wb3MpIC0gZm9saW9fcG9zKGZvbGlvKSkgfHwKLQkJCQkJZXJyKQorCQlkaXJ0
eSA9IGYyZnNfZmZzX2NsZWFyX3N1YnJhbmdlX2RpcnR5X2FuZF90ZXN0KGZvbGlvLCAwLAorCQkJ
CQkoZXJyID8gcG9zIDogZW5kX3BvcykgLSBmb2xpb19wb3MoZm9saW8pKTsKKwkJaWYgKGRpcnR5
IHx8IGVycikKIAkJCWZvbGlvX3JlZGlydHlfZm9yX3dyaXRlcGFnZSh3YmMsIGZvbGlvKTsKIAkJ
ZWxzZSBpZiAoIWYyZnNfZm9saW9faGFzX2Zmcyhmb2xpbykpCiAJCQlpbm9kZV9kZWNfZGlydHlf
YmxvY2soaW5vZGUpOwp0byBzb2x2ZSB0aGlzIHByb2JsZW0uIEJ1dCBpdCBzZWVtcyBJIGhhdmUg
cHV0IHRoaXMgaHVuayBpbiBhIHdyb25nIHBsYWNlLgpJdCBzaG91bGQgYmUgaW50cm9kdWNlZCBp
biB0aGlzIHBhdGNoIEkgdGhpbmsuCg==
