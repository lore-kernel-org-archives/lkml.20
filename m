Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.191.123.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605263;
	b=mGzCk379IXahgXqHb/r1t+HoggxOLZ/z5IFoH5rgC4RCeqc2ru3bM3kv50Lpj/waWq7t
	 raWHcSYlcoQyOC88LPULE/jQQSSJN63lmU1dEyJuBWFewhVpCdRYwUWz5TFqozD6cVgW4
	 tdUm2Y9BraX8D7Kpe/COLgTQX5ALoPgxdv7FpqdI4uTit4tGVWHl+/7o5t+fNoQ94CgVk
	 wiK2nc/gM0xMqTOfWBTCOBiptxfzYyNQfYa2Ky+Wi1azYZcysaCWElz+IJbBHGczOkFLo
	 EkGxu341i7b3UJ8kvrEg0nPYxMHsFmQV5dkyBmgULWQoMnAW7YXnKv3tNlguEBp5k/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605263;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:x-sender-location:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-DNSRBL:X-SPAM-SOURCE-CHECK:
	 X-MAIL;
	bh=zokA3kCnd7q/YLidm6HMj7XTXITItvmDOADP+dLOBJc=;
	b=XogdW0KbvpJCkY+KUd6vWu306aFQnISfydT4ZVy1Cwb+u2ZMO8pwS75hzN9BgKNtg6jo
	 DtODY5gho1Nrlzzbtmhs3RrE+LrLVc3dy6iLFJK9qJzxNWuVYS+k4gLjfAqpyEBs4Y1iR
	 ubXfrJBnQIOsaLoR5kK0adijLfBFmVvTfJmTCvP2+bKzdnKM8nYbQvM0IBg4OZQG1ZrCH
	 +seq6iJ2vXjTmo3mQeHK/os93sItnLvcrhrzeBLW/SCmXR3RXKRMRSsoL4SJVulAN3KrN
	 LcKa94B9nr9I4BiVyySEH7zacO5Yxe+XR8ZV8QiQeXv6CHhtvuVksW1ox0BK/OhxXsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=h3c.com;
	spf=pass smtp.mailfrom=h3c.com;
	arc=none smtp.remote-ip=60.191.123.56
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BFA606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BFA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 6A27erRG045841
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:40:53 +0800 (+08)
	(envelope-from YS.cuishuangjin@h3c.com)
Received: from DAG6EX12-BJD.srv.huawei-3com.com (unknown [10.153.34.14])
	by mail.maildlp.com (Postfix) with ESMTP id F08CD201172F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:44:17 +0800 (CST)
Received: from DAG6EX11-BJD.srv.huawei-3com.com (10.153.34.13) by
 DAG6EX12-BJD.srv.huawei-3com.com (10.153.34.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Mon, 2 Nov 2026 15:40:43 +0800
Received: from DAG6EX11-BJD.srv.huawei-3com.com ([fe80::d89c:ca51:f097:35ef])
 by DAG6EX11-BJD.srv.huawei-3com.com ([fe80::d89c:ca51:f097:35ef%17]) with
 mapi id 15.02.1258.027; Mon, 2 Nov 2026 15:40:43 +0800
From: Cuishuangjin <YS.cuishuangjin@h3c.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Zhangchun <zhang.chunA@h3c.com>
Subject: [PATCH] scripts/recordmcount: Fix uninitialized memory in file_append
 realloc
Thread-Topic: [PATCH] scripts/recordmcount: Fix uninitialized memory in
 file_append realloc
Thread-Index: Ad1qnWkSBXzw20jjRyW5UjRc4b3fYA==
Date: Mon, 2 Nov 2026 07:40:43 +0000
Message-ID: <4129294f3fcf42bfb47bea9066a9a8b2@h3c.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-sender-location: DAG2
Content-Type: text/plain; charset="gb2312"
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
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam01-ex.h3c.com 6A27erRG045841

VGhlIGZpbGVfYXBwZW5kKCkgZnVuY3Rpb24gdXNlcyByZWFsbG9jKCkgdG8gZ3JvdyB0aGUgYnVm
ZmVyLCBidXQNCnJlYWxsb2MoKSBkb2Vzbid0IHplcm8gdGhlIG5ld2x5IGFsbG9jYXRlZCBtZW1v
cnkuIFRoaXMgY2FuIGxlYWQgdG8NCnVuaW5pdGlhbGl6ZWQgZGF0YSBiZWluZyB3cml0dGVuIHRv
IHRoZSBvdXRwdXQgZmlsZS4NCg0KRml4IHRoaXMgYnk6DQoxLiBDaGVja2luZyB0aGUgcmVhbGxv
YygpIHJldHVybiB2YWx1ZSBmb3IgZXJyb3JzDQoyLiBaZXJvaW5nIHRoZSBuZXdseSBhbGxvY2F0
ZWQgbWVtb3J5IHdpdGggbWVtc2V0KCkNCg0KU2lnbmVkLW9mZi1ieTogY3lzNDM0MDUgPFlTLmN1
aXNodWFuZ2ppbkBoM2MuY29tPg0KLS0tDQpzY3JpcHRzL3JlY29yZG1jb3VudC5jIHwgMTcgKysr
KysrKysrKy0tLS0tLS0NCjEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9yZWNvcmRtY291bnQuYyBiL3NjcmlwdHMv
cmVjb3JkbWNvdW50LmMNCmluZGV4IDNlNGY1NDc5OWNjMC4uNzU0NjkwODg3ZjY2IDEwMDY0NA0K
LS0tIGEvc2NyaXB0cy9yZWNvcmRtY291bnQuYw0KKysrIGIvc2NyaXB0cy9yZWNvcmRtY291bnQu
Yw0KQEAgLTExMSw2ICsxMTEsNyBAQCBzdGF0aWMgc3NpemVfdCB1d3JpdGUodm9pZCBjb25zdCAq
Y29uc3QgYnVmLCBzaXplX3QgY29uc3QgY291bnQpDQogICAgICAgIHNpemVfdCBjbnQgPSBjb3Vu
dDsNCiAgICAgICAgb2ZmX3QgaWR4ID0gMDsNCiAgICAgICAgdm9pZCAqcCA9IE5VTEw7DQorICAg
ICAgIG9mZl90IG9sZF9zaXplID0gMDsNCg0KICAgICAgICBmaWxlX3VwZGF0ZWQgPSAxOw0KDQpA
QCAtMTE4LDE4ICsxMTksMjAgQEAgc3RhdGljIHNzaXplX3QgdXdyaXRlKHZvaWQgY29uc3QgKmNv
bnN0IGJ1Ziwgc2l6ZV90IGNvbnN0IGNvdW50KQ0KICAgICAgICAgICAgICAgIG9mZl90IGFvZmZz
ZXQgPSAoZmlsZV9wdHIgKyBjb3VudCkgLSBmaWxlX2VuZDsNCg0KICAgICAgICAgICAgICAgIGlm
IChhb2Zmc2V0ID4gZmlsZV9hcHBlbmRfc2l6ZSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAg
b2xkX3NpemUgPSBmaWxlX2FwcGVuZF9zaXplOw0KICAgICAgICAgICAgICAgICAgICAgICAgcCA9
IHJlYWxsb2MoZmlsZV9hcHBlbmQsIGFvZmZzZXQpOw0KLSAgICAgICAgICAgICAgICAgICAgICAg
aWYgKCFwKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFwKSB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZyZWUoZmlsZV9hcHBlbmQpOw0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwZXJyb3IoIndyaXRlIik7DQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZpbGVfYXBwZW5kX2NsZWFudXAoKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbW1hcF9jbGVhbnVwKCk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtMTsNCisgICAgICAgICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICAgICAg
ICAgIGZpbGVfYXBwZW5kID0gcDsNCiAgICAgICAgICAgICAgICAgICAgICAgIGZpbGVfYXBwZW5k
X3NpemUgPSBhb2Zmc2V0Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgbWVtc2V0KGZpbGVfYXBw
ZW5kICsgb2xkX3NpemUsIDAsIGFvZmZzZXQgLSBvbGRfc2l6ZSk7DQogICAgICAgICAgICAgICAg
fQ0KLSAgICAgICAgICAgICAgIGlmICghZmlsZV9hcHBlbmQpIHsNCi0gICAgICAgICAgICAgICAg
ICAgICAgIHBlcnJvcigid3JpdGUiKTsNCi0gICAgICAgICAgICAgICAgICAgICAgIGZpbGVfYXBw
ZW5kX2NsZWFudXAoKTsNCi0gICAgICAgICAgICAgICAgICAgICAgIG1tYXBfY2xlYW51cCgpOw0K
LSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOw0KLSAgICAgICAgICAgICAgIH0NCisN
CiAgICAgICAgICAgICAgICBpZiAoZmlsZV9wdHIgPCBmaWxlX2VuZCkgew0KICAgICAgICAgICAg
ICAgICAgICAgICAgY250ID0gZmlsZV9lbmQgLSBmaWxlX3B0cjsNCiAgICAgICAgICAgICAgICB9
IGVsc2Ugew0KLS0NCjIuMzMuMA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Ksb7Tyrz+vLDG5Li9vP66
rNPQ0MK7qsj9vK/NxbXEsaPD3NDFz6KjrL32z97T2reiy824+MnPw+a12Na31tDB0LP2tcS49sjL
u/LIutfpoaMNCr371rnIzrrOxuTL+8jL0tTIzrrO0M7Kvcq508OjqLD8wKi1q7K7z97T2sirsr+7
8rK/t9a12NC5wrahori01sahorvyyaK3oqOpsb7Tyrz+1tC1xNDFz6Khow0KyOe5+8T6tO3K1cHL
sb7Tyrz+o6zH68T6waK8tLXnu7C78tPKvP7NqNaqt6K8/sjLsqLJvrP9sb7Tyrz+o6ENClRoaXMg
ZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRp
b24gZnJvbSBOZXcgSDNDLCB3aGljaCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29uIG9y
IGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92ZS4NCkFueSB1c2Ugb2YgdGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90
IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBv
ciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBwcm9oaWJpdGVkLg0KSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBwaG9uZSBvciBlbWFpbCBpbW1lZGlhdGVs
eSBhbmQgZGVsZXRlIGl0IQ0K
