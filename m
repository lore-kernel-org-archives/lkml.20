Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913494E36D2;
	Fri, 18 Sep 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729579; cv=none; b=n/y6WZJdhlizUBI40AUEjvjnf0ypMlYl2GEFnDjybMNSfZhD9G02is34S+3n2p0XDNPL46bnc7+HkpyUS2EiMu1LVev/ifwtcYDAtcU7t1esOvXXxQqIQzZqpIpm49ae3ey1l8coja9vsyrjP/1OZzrt3glgnYQfTJI5AiAhBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729579; c=relaxed/simple;
	bh=OIJ/fdYmnkAjxvICv2DhvOC1qAPdBabjJ0a4nvAYuDY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lXRrsXO68zGEC14MnAawJwgh8Bk4GjSB34vLqFOuGVNYDFZomHq4BX16N/OuXJwatGvEsxWOUZhmc9ukPVHiPvBZetwRFpZ20WSPlaAKd+hJ9bEKLqk+ZqQv1b/UojUBT+uGMUoFGNeHk4whMf6uKPGx5QnUJbS1aKRnQBZUSYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=Sn3QUKW1; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="Sn3QUKW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OIJ/fdYmnkAjxvICv2DhvOC1qAPdBabjJ0a4nvAYuDY=;
  b=Sn3QUKW1B94HLRtNfM63QsDcvE3XnoN9wcvuXF73Z6a9qZwhrCSPUVR8
   lnrbuyQFEGRnCM4OpwRbJH+OOe/+KNxQ8AC8UwBQlJpJ1C5uJC3t0GRC8
   iMDu3R1rwIGgwOgA5IWvkmrO6p7kLBPUZOSgYT68p8VKf3IaQy3XL/1o9
   g2z4LCFYzOxBVrW1aFCyfOgS1navJT+rMTOpv5l7UhRDQHbVaFU5rb+A5
   wzR48+PtHQJ1Yf4Ygzlmb1/UhitTXZ/K2RytpXy1TGX2d/hvPuTp/arhg
   n+WbmC1JKqlAyBBqDZiRZ8EiX22UHC5KJfodPfn7IYCGs/TsffsFKSTvk
   g==;
X-CSE-ConnectionGUID: Rwp5urkkQgCy7lS/mkqv1Q==
X-CSE-MsgGUID: zd0HlQt0R52/Zh+zrCh03w==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 18 Sep 2026 19:06:02 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 68IB60j0025803;
	Fri, 18 Sep 2026 19:06:00 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 19:05:59 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Fri, 18 Sep 2026 19:05:59 +0800
From: <Hermes.Wu@ite.com.tw>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 02/21] media: i2c: it6625: propagate control-update errors
Thread-Topic: [PATCH 02/21] media: i2c: it6625: propagate control-update
 errors
Thread-Index: AQHdR1VJZFJnA5YaVEegIbO9wBw/OLbULHHg
Date: Fri, 18 Sep 2026 11:05:59 +0000
Message-ID: <d25be49aa66e49d7a7d58fd2a00e4cf6@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-2-78d72d7886a5@ite.com.tw>
 <aq0M7AO3k8Q8CFuo@kekkonen.localdomain>
In-Reply-To: <aq0M7AO3k8Q8CFuo@kekkonen.localdomain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 6CA32D0E7B36A780CF54B26B7A9DCEA2041CC6C23C427BC5C307A65ABDC211052002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 68IB60j0025803

SGkgU2FrYXJpDQoNClRoYW5rcyBmb3IgcmV2aWV3Lg0KDQo+SGkgSGVybWVzLA0KPg0KPk9uIEZy
aSwgU2VwIDE4LCAyMDI2IGF0IDA0OjU3OjE3UE0gKzA4MDAsIEhlcm1lcyBXdSB2aWEgQjQgUmVs
YXkgd3JvdGU6DQo+PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4g
DQo+PiBpdDY2MjVfdjRsMl9zZF9jdHJsX3VwZGF0ZSgpIGRpc2NhcmRlZCB0aGUgcmV0dXJuIHZh
bHVlIG9mIGFsbCB0aHJlZQ0KPj4gdjRsMl9jdHJsX3NfY3RybCgpIGNhbGxzIGl0IG1ha2VzLiBN
YWtlIGl0IHJldHVybiBpbnQsIHJ1biB0aGUgdXBkYXRlcyANCj4+IHNlcXVlbnRpYWxseSwgYW5k
IHJldHVybiB0aGUgZmlyc3QgZXJyb3I7IGJvdGggY2FsbCBzaXRlcyBub3cgY2hlY2sgDQo+PiBh
bmQgbG9nIGl0Lg0KPj4gDQo+PiBOb25lIG9mIHRoZSB0aHJlZSBjb250cm9scyBoYXMgYSBkcml2
ZXIgLm9wcywgc28gdGhlIG9ubHkgZmFpbHVyZSBwYXRoIA0KPj4gaW4gdjRsMl9jdHJsX3NfY3Ry
bCgpIGlzIHJhbmdlIHZhbGlkYXRpb24sIGFuZCBldmVyeSB2YWx1ZSB0aGlzIGRyaXZlciANCj4+
IHBhc3NlcyBpcyBhbHdheXMgaW4gcmFuZ2UgLS0gdGhpcyBpcyBhbiBlcnJvci1oYW5kbGluZyBj
b3JyZWN0bmVzcyBmaXggDQo+PiByZXNwb25zaXZlIHRvIHJldmlldywgbm90IGEgZml4IGZvciBh
biBvYnNlcnZlZCBydW50aW1lIGZhaWx1cmUuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEhlcm1l
cyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL21lZGlhL2ky
Yy9pdDY2MjUuYyB8IDI1ICsrKysrKysrKysrKysrKysrKystLS0tLS0NCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvaTJjL2l0NjYyNS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaXQ2NjI1
LmMgDQo+PiBpbmRleCANCj4+IGRhMTdlNWQ1Y2U5ZTJkZDEwNjBhYmJhMTU5OGIwZTNmNzg4NTdl
OWMuLjVkMjY3Njc2NjA2ZTM0MGFkMGVlNWFkMmI3OGUNCj4+IDVhY2I1MGEzMjk4MCAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2l0NjYyNS5jDQo+PiArKysgYi9kcml2ZXJzL21l
ZGlhL2kyYy9pdDY2MjUuYw0KPj4gQEAgLTg4OSwxMSArODg5LDE5IEBAIHN0YXRpYyBpbnQgaXQ2
NjI1X3NfY3RybF9hdWRpb19wcmVzZW50KHN0cnVjdCB2NGwyX3N1YmRldiAqc2QpDQo+PiAgCQkJ
CWF1ZGlvX3ByZXNlbnQoaXQ2NjI1KSk7DQo+PiAgfQ0KPj4gIA0KPj4gLXN0YXRpYyB2b2lkIGl0
NjYyNV92NGwyX3NkX2N0cmxfdXBkYXRlKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QpDQo+PiArc3Rh
dGljIGludCBpdDY2MjVfdjRsMl9zZF9jdHJsX3VwZGF0ZShzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNk
KQ0KPj4gIHsNCj4+IC0JaXQ2NjI1X3NfY3RybF9kZXRlY3RfaGRtaV81dihzZCk7DQo+PiAtCWl0
NjYyNV9zX2N0cmxfYXVkaW9fc2FtcGxpbmdfcmF0ZShzZCk7DQo+PiAtCWl0NjYyNV9zX2N0cmxf
YXVkaW9fcHJlc2VudChzZCk7DQo+PiArCWludCByZXQ7DQo+PiArDQo+PiArCXJldCA9IGl0NjYy
NV9zX2N0cmxfZGV0ZWN0X2hkbWlfNXYoc2QpOw0KPj4gKwlpZiAocmV0KQ0KPj4gKwkJcmV0dXJu
IHJldDsNCj4+ICsNCj4+ICsJcmV0ID0gaXQ2NjI1X3NfY3RybF9hdWRpb19zYW1wbGluZ19yYXRl
KHNkKTsNCj4+ICsJaWYgKHJldCkNCj4+ICsJCXJldHVybiByZXQ7DQo+PiArDQo+PiArCXJldHVy
biBpdDY2MjVfc19jdHJsX2F1ZGlvX3ByZXNlbnQoc2QpOw0KPj4gIH0NCj4+ICANCj4+ICBzdGF0
aWMgdm9pZCBpdDY2MjVfZW5hYmxlX3N0cmVhbV9sb2NrZWQoc3RydWN0IGl0NjYyNSAqaXQ2NjI1
LCBib29sIA0KPj4gZW5hYmxlKSBAQCAtMTEzNiw5ICsxMTQ0LDEyIEBAIHN0YXRpYyB2b2lkIGl0
NjYyNV9jbGVhcl90aW1pbmdzKHN0cnVjdCANCj4+IGl0NjYyNSAqaXQ2NjI1KSAgc3RhdGljIHZv
aWQgaXQ2NjI1X2lycV9oZG1pXzV2X2NoYW5nZShzdHJ1Y3QgaXQ2NjI1IA0KPj4gKml0NjYyNSkg
IHsNCj4+ICAJc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9ICZpdDY2MjUtPnNkOw0KPj4gKwlpbnQg
cmV0Ow0KPj4gIA0KPj4gIAlpdDY2MjVfY2xlYXJfdGltaW5ncyhpdDY2MjUpOw0KPj4gLQlpdDY2
MjVfdjRsMl9zZF9jdHJsX3VwZGF0ZShzZCk7DQo+PiArCXJldCA9IGl0NjYyNV92NGwyX3NkX2N0
cmxfdXBkYXRlKHNkKTsNCj4+ICsJaWYgKHJldCkNCj4+ICsJCWRldl9lcnIoaXQ2NjI1LT5kZXYs
ICIlczogZmFpbGVkIHRvIHVwZGF0ZSBjb250cm9sczogJWQiLCBfX2Z1bmNfXywgDQo+PiArcmV0
KTsNCj4+ICB9DQo+PiAgDQo+PiAgc3RhdGljIHZvaWQgaXQ2NjI1X2lycV9oZGNwX2NoYW5nZShz
dHJ1Y3QgaXQ2NjI1ICppdDY2MjUpIEBAIC0yMjk3LDcgDQo+PiArMjMwOCw5IEBAIHN0YXRpYyBp
bnQgaXQ2NjI1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+PiAgCWl0NjYyNV9k
ZWJ1Z2ZzX2luaXQoaXQ2NjI1LCBjbGllbnQpOw0KPj4gIA0KPj4gIAlpdDY2MjVfaW5pdGlhbF9z
ZXR1cChpdDY2MjUpOw0KPg0KPldoYXQgaWYgdGhpcyBmYWlscz8NCg0Kd2lsbCBmaXggaW4gdjIN
Cj4+IC0JaXQ2NjI1X3Y0bDJfc2RfY3RybF91cGRhdGUoc2QpOw0KPj4gKwllcnIgPSBpdDY2MjVf
djRsMl9zZF9jdHJsX3VwZGF0ZShzZCk7DQo+PiArCWlmIChlcnIpDQo+PiArCQlkZXZfZXJyKGl0
NjYyNS0+ZGV2LCAiJXM6IGZhaWxlZCB0byB1cGRhdGUgY29udHJvbHM6ICVkIiwgX19mdW5jX18s
IA0KPj4gK2Vycik7DQo+DQo+U2hvdWxkbid0IHlvdSByZXR1cm4gYW4gZXJyb3IgaW4gdGhpcyBj
YXNlPw0KPg0Kd2lsbCBmaXggaW4gdjINCg0KPmRldl9lcnJfcHJvYmUoKSBtaWdodCBiZSBiZXR0
ZXIgaGVyZSwgdG9vLg0KPg0KPj4gIA0KPj4gIAllcnIgPSB2NGwyX2FzeW5jX3JlZ2lzdGVyX3N1
YmRldihzZCk7DQo+PiAgCWlmIChlcnIgPCAwKSB7DQo+PiANCj4NCj4tLQ0KPlJlZ2FyZHMsDQo+
DQo+U2FrYXJpIEFpbHVzDQo+DQo=
