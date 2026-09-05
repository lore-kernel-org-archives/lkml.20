Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319C34F27F;
	Sat,  5 Sep 2026 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613895; cv=none; b=e02vvY7e0EjychAL2GkLiTknpRBsTYLH0xlpWYgzg7aXUxZI5FBLiPl6XxcnWmxT8zj/npJh/VTL+vzLzRuWvnyNZw38GB3RJ0mgXvzMYb9iXvec4QJjQ7sH2pI3+55Zy0RZ79cVD6CtSeZzo1cHIIh9j7AA+E0zAx92PFQXL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613895; c=relaxed/simple;
	bh=ouuQDnhIcQQEkPVuOMmCU6hYEUBWig59IOBScRSPCbw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Qq5XgfMZ0EEvYgIsJWkgZ2MT/q7kDv4qCbNAb62Zq0bJgK3lC1+pbOSnkJ6DUNC158roFgs6pinyAeMEZrlHDxS9H30rQ7fIpt4h5pumBLqhmVTcOCpA1/2bNmo6OaYOzU6wseZQ2wRWzVEUqNyNC/UX/secq2H4f4JlEaooTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1ohATTfd; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1ohATTfd"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ouuQDnhIcQQEkPVuOMmCU6hYEUBWig59IOBScRSPCbw=;
	b=1ohATTfdUrQ5jv9gOmWXK3ykaE1kAHcQqmEdF9Ve+p/7YNJUw3XYX+e9Entl4GRZg79QFL0Ug
	IpZX3oom/4y/sVJlyq0P8LqBhEQSuZBYE6LnbdDuHXoD8xCNHieOZkQ058Br5NmKHL1+Yqj+XhL
	9DGSK46Z3H0J3EVo2+xppfM=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hcYNG3kYRz1cyPY;
	Sat,  5 Sep 2026 21:00:30 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id CC06F4055B;
	Sat,  5 Sep 2026 21:11:21 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (7.202.181.14) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 5 Sep 2026 21:11:21 +0800
Received: from kwepemf100015.china.huawei.com ([7.202.181.14]) by
 kwepemf100015.china.huawei.com ([7.202.181.14]) with mapi id 15.02.2562.045;
 Sat, 5 Sep 2026 21:11:21 +0800
From: "Liuwenliang (Abbott Liu)" <liuwenliang@huawei.com>
To: "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>, "jic23@kernel.org"
	<jic23@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
	"mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>, luoshengwei
	<luoshengwei@huawei.com>, "jason@os.amperecomputing.com"
	<jason@os.amperecomputing.com>, "danielf@os.amperecomputing.com"
	<danielf@os.amperecomputing.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "yangzhuohao (A)" <yangzhuohao1@huawei.com>, douzhaolei
	<douzhaolei@huawei.com>, zouyipeng <zouyipeng@huawei.com>, Wangbing
	<wangbing6@huawei.com>, Nixiaoming <nixiaoming@huawei.com>
Subject: Re: [PATCH v2 1/2] RAS: Fix inverted context info bounds check in ARM
 processor errors
Thread-Topic: [PATCH v2 1/2] RAS: Fix inverted context info bounds check in
 ARM processor errors
Thread-Index: Ad09N7nNJCAgvZn3XEGWaEsrLCcgZQ==
Date: Sat, 5 Sep 2026 13:11:21 +0000
Message-ID: <7b4b9527a97b4f038009b18360fd7565@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgSGFuanVuLCB0aGlua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPkhpIEFiYm90dCwNCj4NCj5PbiAy
MDI2LzgvMjUgMjE6NDMsIEFiYm90dCBMaXUgd3JvdGU6DQo+PiBDb21taXQgODc4ODBhZjJkMjRl
ICgiQVBFSS9HSEVTOiBBUk0gcHJvY2Vzc29yIEVycm9yOiBkb24ndCBnbyBwYXN0DQo+PiBhbGxv
Y2F0ZWQgbWVtb3J5IikgYWRkZWQgYm91bmRzIGNoZWNrcyBmb3IgbWFsZm9ybWVkIEFSTSBwcm9j
ZXNzb3INCj4+IGVycm9yIHJlY29yZHMgYnV0IGNvbnRhaW5lZCBhIGJ1ZzoNCj4+IA0KPj4gICAg
SW4gbG9nX2FybV9od19lcnJvcigpLCB0aGUgY3R4X2luZm8gYm91bmRzIGNoZWNrIGlzIGludmVy
dGVkLiBUaGUNCj4+ICAgIGNvbmRpdGlvbiBgc3ogKyAobG9uZyljdHhfaW5mbyAtIChsb25nKWVy
ciA+PSBlcnItPnNlY3Rpb25fbGVuZ3RoYA0KPj4gICAgYWRkcyBjdHhfaW5mby0+c2l6ZSB3aGVu
IHRoZSBjb250ZXh0IGhlYWRlciBpcyBhbHJlYWR5IHBhc3QgdGhlIGVuZA0KPj4gICAgb2YgdGhl
IHNlY3Rpb24gaW5zdGVhZCBvZiB3aGVuIGl0IGlzIHdpdGhpbiBib3VuZHMuIFNvIGNoYW5nZSB0
aGUNCj4+ICAgIGNvbXBhcmlzb24gdG8gPD0uDQo+PiANCj4+IEZpeGVzOiA4Nzg4MGFmMmQyNGUg
KCJBUEVJL0dIRVM6IEFSTSBwcm9jZXNzb3IgRXJyb3I6IGRvbid0IGdvIHBhc3QgYWxsb2NhdGVk
IG1lbW9yeSIpDQo+PiANCj4NCj5UaGlzIGVtcHR5IGxpbmUgaXMgbm90IG5lZWRlZC4NCg0KSSBh
bSB2ZXJ5IHNvcnJ5IGZvciBtYWtpbmcgc3VjaCBhIGJhc2ljIG1pc3Rha2U7IHRoaXMgaXNzdWUg
d2lsbCBiZSByZXNvbHZlZA0KaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPg0KPj4gU2lnbmVkLW9m
Zi1ieTogQWJib3R0IExpdSA8bGl1d2VubGlhbmdAaHVhd2VpLmNvbT4NCj4+IC0tLQ0KPj4gICBk
cml2ZXJzL3Jhcy9yYXMuYyB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jhcy9yYXMu
YyBiL2RyaXZlcnMvcmFzL3Jhcy5jDQo+PiBpbmRleCAwM2RmM2RiNjIzMzQuLjI1NDA1MzhhMTZh
OCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvcmFzL3Jhcy5jDQo+PiArKysgYi9kcml2ZXJzL3Jh
cy9yYXMuYw0KPj4gQEAgLTc0LDcgKzc0LDcgQEAgdm9pZCBsb2dfYXJtX2h3X2Vycm9yKHN0cnVj
dCBjcGVyX3NlY19wcm9jX2FybSAqZXJyLCBjb25zdCB1OCBzZXYpDQo+PiAgIAlmb3IgKG4gPSAw
OyBuIDwgZXJyLT5jb250ZXh0X2luZm9fbnVtOyBuKyspIHsNCj4+ICAgCQlzeiA9IHNpemVvZihz
dHJ1Y3QgY3Blcl9hcm1fY3R4X2luZm8pOw0KPj4gICANCj4+IC0JCWlmIChzeiArIChsb25nKWN0
eF9pbmZvIC0gKGxvbmcpZXJyID49IGVyci0+c2VjdGlvbl9sZW5ndGgpDQo+PiArCQlpZiAoc3og
KyAobG9uZyljdHhfaW5mbyAtIChsb25nKWVyciA8PSBlcnItPnNlY3Rpb25fbGVuZ3RoKQ0KPj4g
ICAJCQlzeiArPSBjdHhfaW5mby0+c2l6ZTsNCj4NCj5zeiBpcyBhbiBpbnQgYW5kIGN0eF9pbmZv
LT5zaXplIGlzIHUzMiwgaWYgY3R4X2luZm8tPnNpemUgaXMgYmlnIGVub3VnaA0KPmZvciBleGFt
cGxlIG92ZXIgMHg3ZmZmZmZmZiwgdGhlIHN6IHdpbGwgYmUgbmVnYXRpdmUuDQo+DQo+PiAgIA0K
Pj4gICAJCWN0eF9pbmZvID0gKHN0cnVjdCBjcGVyX2FybV9jdHhfaW5mbyAqKSgobG9uZyljdHhf
aW5mbyArIHN6KTsNCj4NCj5pZiB0aGUgc3ogaXMgbmVnYXRpdmUsIHRoZSBjdHhfaW5mbyBtYXkg
cG9pbnRlciB0byBhIHdyb25nIHBsYWNlLg0KPg0KPmN0eF9pbmZvLT5zaXplIHdpbGwgbm90IG92
ZXIgMHg3ZmZmZmZmZiBpbiBwcmFjdGljYWwgYnV0IHNob3VsZCB3ZQ0KPmNvbnNpZGVyIHRoZSBv
dmVyZmxvd3M/DQoNCkkgYWxzbyB0aGluayB0aGF0IGl0IHdvbid0IGFjdHVhbGx5IGhhcHBlbiBp
biBwcmFjdGljZSwgc28gdGhlcmUNCmlzbid0IG11Y2ggbmVlZCB0byBjb25zaWRlciB0aGlzIG92
ZXJmbG93IGlzc3VlLiBCdXQgZXZlbiBpZiB3ZSBkbw0KY29uc2lkZXIgaXQsIHRoZSBjb2RlIG1v
ZGlmaWNhdGlvbnMgd291bGRuJ3QgYmUgdG9vIGNvbXBsZXguIEkgcGxhbg0KdG8gZml4IGl0IGlu
IHRoZSBuZXh0IHZlcnNpb24uDQoNCj4NCj5UaGFua3MNCj5IYW5qdW4NCj4NCj4+IA0KPg0K
