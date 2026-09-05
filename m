Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D632D0FC;
	Sat,  5 Sep 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613715; cv=none; b=LuynLqFIQel+MJQ6kgNYoMSbM09tELhqH3jOpo8W5Orz1I4K+HXen4rojNfMKQdx17AycJYbucuFkxDgllaRs5EEMGG5x0u6QZcMV3fIuegm/T3GqlogI6+mcb3ULDnwIvfsRghdOfI3yNNTf2516QPaCwH/gl2Gp3Bp+HdXxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613715; c=relaxed/simple;
	bh=n4Mm8tHC6wsUTWhOmuSeT9cOK1oAr8Su9sVm/NoChqA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dxMEzaZcGmcuyQdVjp2Qq9hcqMAK253VlR4tgVsEdBKHUF84BoTpznAtTkDzeHy5gr4sAkzVltpJqnCb0I1FDreRuGH//svNUa0tw9Xh1xK1qgvdyb6AJ3NRtYJcXIamOQf+86IHYJY1CgExXcsfaBoS37sfPc3UxZ9jfSVh8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DHMkISWZ; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DHMkISWZ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=n4Mm8tHC6wsUTWhOmuSeT9cOK1oAr8Su9sVm/NoChqA=;
	b=DHMkISWZyPqqyAJR7FOyzGXrcCb19NkmXBchjPv2lOWVtAgAQQ7lDFA7sWOEmvy2MyakedW9d
	DRTQH/HE9DPxQPKXUhjwQ0bbwTsN1m7dx2cYsw4njI4v+vncbdJsJzB+SnLW2nFG5MUQ9XbFS1l
	NNB36fxYZJrbkFwR562aOpE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hcYJl0sRnz1prLc;
	Sat,  5 Sep 2026 20:57:27 +0800 (CST)
Received: from kwepemf100009.china.huawei.com (unknown [7.202.181.223])
	by mail.maildlp.com (Postfix) with ESMTPS id B5CCD40538;
	Sat,  5 Sep 2026 21:08:20 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (7.202.181.14) by
 kwepemf100009.china.huawei.com (7.202.181.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 5 Sep 2026 21:08:20 +0800
Received: from kwepemf100015.china.huawei.com ([7.202.181.14]) by
 kwepemf100015.china.huawei.com ([7.202.181.14]) with mapi id 15.02.2562.045;
 Sat, 5 Sep 2026 21:08:10 +0800
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
Subject: Re: [PATCH v2 2/2] RAS: Fix out-of-bounds read when tracing arm_event
Thread-Topic: [PATCH v2 2/2] RAS: Fix out-of-bounds read when tracing
 arm_event
Thread-Index: Ad09N5bgehyYCm2z8U2qaWmGa/Ik4Q==
Date: Sat, 5 Sep 2026 13:08:10 +0000
Message-ID: <ac6a751396b2477296f8567280e8a577@huawei.com>
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

SGkgSGFuanVuLCBUaGlua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+T24gMjAyNi84LzI1IDIxOjQz
LCBBYmJvdHQgTGl1IHdyb3RlOg0KPj4gVGhlIHZzZWlfbGVuIDwgMCBlcnJvciBwYXRoIGRpZCBu
b3QgdmVyaWZ5IHRoZSBwZWlfbGVuIGFuZCBjdHhfbGVuLg0KPj4gV2hlbiB2c2VpX2xlbiBpcyBu
ZWdhdGl2ZSwgc2VjdGlvbl9sZW5ndGggaXMgdG9vIHNtYWxsIHRvIGhvbGQgdGhlIA0KPj4gZnVs
bCByZWNvcmQsIHlldCBwZWlfbGVuIGFuZCBjdHhfbGVuIHdlcmUgZGVyaXZlZCBmcm9tIA0KPj4g
ZXJyX2luZm9fbnVtL2NvbnRleHRfaW5mb19udW0gYW5kIG1heSBkZXNjcmliZSByZWdpb25zIGJl
eW9uZCB0aGUgDQo+PiAobG9uZyllcnIgLi4gZXJyICsgc2VjdGlvbl9sZW5ndGggYnVmZmVyLiBU
byBwcmV2ZW50IHRyYWNlX2FybV9ldmVudCANCj4+IGZyb20gcmVhZGluZyBwYXN0IHRoZSBhbGxv
Y2F0ZWQgcmVjb3JkLCBzYW5pdGl6ZSB0aGUgcGFyYW1ldGVyczoNCj4+IG1vdmUgdGhlIGNwdSBs
b29rdXAgYWJvdmUgdGhpcyBwYXRoIHNvIGl0IGlzIGF2YWlsYWJsZSBmb3IgdHJhY2luZywgDQo+
PiByZWNhbGN1bGF0ZSBjdHhfbGVuIGFuZCBwZWlfbGVuIGJhc2VkIG9uIHNlY3Rpb25fbGVuZ3Ro
LCBsaW1pdCB0aGVtLCANCj4+IHNldCB0aGUgY29ycmVzcG9uZGluZyBwb2ludGVycyB0byBOVUxM
IGFuZCBsZW5ndGhzIHRvIDAgIHdoZW4gdGhlcmUgaXMgDQo+PiBubyByZW1haW5pbmcgc3BhY2Uu
DQo+PiANCj4+IHBlaV9sZW4gYW5kIGN0eF9sZW4gYmVjb21lIHMzMiBzbyB0aGF0IHRoZSByZWNh
bGN1bGF0ZWQgbGVuZ3RocyBjYW4gYmUgDQo+PiBjaGVja2VkIGZvciBuZWdhdGl2ZSB2YWx1ZXMs
IGFuZCB0aGUgY3B1IGxvb2t1cCBpcyBtb3ZlZCBhYm92ZSB0aGUgDQo+PiBzZWN0aW9uIGxlbmd0
aCBjaGVja3Mgc28gdGhhdCBib3RoIHBhdGhzIGNhbiBzaGFyZSB0aGUgZmluYWwNCj4+IHRyYWNl
X2FybV9ldmVudCgpIGNhbGwuDQo+PiANCj4+IEZpeGVzOiAwNTk1NDUxMWI3M2UgKCJSQVM6IFJl
cG9ydCBhbGwgQVJNIHByb2Nlc3NvciBDUEVSIGluZm9ybWF0aW9uIA0KPj4gdG8gdXNlcnNwYWNl
IikNCj4+IA0KPg0KPlNhbWUgaGVyZSwgbm8gZW1wdHkgbGluZSBiZXR3ZWVuIEZpeGVzIGFuZCBT
aWduZWQtb2ZmLWJ5Lg0KDQpJIGFtIHZlcnkgc29ycnkgZm9yIG1ha2luZyBzdWNoIGEgYmFzaWMg
bWlzdGFrZTsgdGhpcyBpc3N1ZSB3aWxsIGJlIHJlc29sdmVkDQppbiB0aGUgbmV4dCB2ZXJzaW9u
Lg0KDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBYmJvdHQgTGl1IDxsaXV3ZW5saWFuZ0BodWF3ZWku
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvcmFzL3Jhcy5jIHwgMzEgKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jhcy9yYXMuYyBi
L2RyaXZlcnMvcmFzL3Jhcy5jIGluZGV4IA0KPj4gMjU0MDUzOGExNmE4Li40YTQ4YTg5N2Y2MTYg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3Jhcy9yYXMuYw0KPj4gKysrIGIvZHJpdmVycy9yYXMv
cmFzLmMNCj4+IEBAIC01OCwxMCArNTgsMTAgQEAgdm9pZCBsb2dfYXJtX2h3X2Vycm9yKHN0cnVj
dCBjcGVyX3NlY19wcm9jX2FybSAqZXJyLCBjb25zdCB1OCBzZXYpDQo+PiAgIAlzdHJ1Y3QgY3Bl
cl9hcm1fZXJyX2luZm8gKmVycl9pbmZvOw0KPj4gICAJc3RydWN0IGNwZXJfYXJtX2N0eF9pbmZv
ICpjdHhfaW5mbzsNCj4+ICAgCXU4ICp2ZW5fZXJyX2RhdGE7DQo+PiAtCXUzMiBjdHhfbGVuID0g
MDsNCj4+ICsJczMyIGN0eF9sZW4gPSAwOw0KPj4gICAJaW50IG4sIHN6LCBjcHU7DQo+PiAgIAlz
MzIgdnNlaV9sZW47DQo+PiAtCXUzMiBwZWlfbGVuOw0KPj4gKwlzMzIgcGVpX2xlbjsNCj4+ICAg
CXU4ICpwZWlfZXJyLCAqY3R4X2VycjsNCj4+ICAgDQo+PiAgIAlwZWlfbGVuID0gc2l6ZW9mKHN0
cnVjdCBjcGVyX2FybV9lcnJfaW5mbykgKiBlcnItPmVycl9pbmZvX251bTsgQEAgDQo+PiAtODEs
MjAgKzgxLDMxIEBAIHZvaWQgbG9nX2FybV9od19lcnJvcihzdHJ1Y3QgY3Blcl9zZWNfcHJvY19h
cm0gKmVyciwgY29uc3QgdTggc2V2KQ0KPj4gICAJCWN0eF9sZW4gKz0gc3o7DQo+PiAgIAl9DQo+
PiAgIA0KPj4gKwljcHUgPSBHRVRfTE9HSUNBTF9JTkRFWChlcnItPm1waWRyKTsNCj4+ICsJaWYg
KGNwdSA8IDApDQo+PiArCQljcHUgPSAtMTsNCj4+ICsNCj4+ICAgCXZzZWlfbGVuID0gZXJyLT5z
ZWN0aW9uX2xlbmd0aCAtIChzaXplb2Yoc3RydWN0IGNwZXJfc2VjX3Byb2NfYXJtKSArIHBlaV9s
ZW4gKyBjdHhfbGVuKTsNCj4+ICAgCWlmICh2c2VpX2xlbiA8IDApIHsNCj4+ICAgCQlwcl93YXJu
KEZXX0JVRyAic2VjdGlvbiBsZW5ndGg6ICVkXG4iLCBlcnItPnNlY3Rpb25fbGVuZ3RoKTsNCj4+
ICAgCQlwcl93YXJuKEZXX0JVRyAic2VjdGlvbiBsZW5ndGggaXMgdG9vIHNtYWxsXG4iKTsNCj4+
ICAgCQlwcl93YXJuKEZXX0JVRyAiZmlybXdhcmUtZ2VuZXJhdGVkIGVycm9yIHJlY29yZCBpcyBp
bmNvcnJlY3RcbiIpOw0KPj4gICAJCXZzZWlfbGVuID0gMDsNCj4+IC0JfQ0KPj4gLQl2ZW5fZXJy
X2RhdGEgPSAodTggKiljdHhfaW5mbzsNCj4+IC0NCj4+IC0JY3B1ID0gR0VUX0xPR0lDQUxfSU5E
RVgoZXJyLT5tcGlkcik7DQo+PiAtCWlmIChjcHUgPCAwKQ0KPj4gLQkJY3B1ID0gLTE7DQo+PiAt
DQo+PiAtCXRyYWNlX2FybV9ldmVudChlcnIsIHBlaV9lcnIsIHBlaV9sZW4sIGN0eF9lcnIsIGN0
eF9sZW4sDQo+PiArCQl2ZW5fZXJyX2RhdGEgPSBOVUxMOw0KPj4gKwkJY3R4X2xlbiA9IGVyci0+
c2VjdGlvbl9sZW5ndGggLSAoc2l6ZW9mKHN0cnVjdCBjcGVyX3NlY19wcm9jX2FybSkgKyBwZWlf
bGVuKTsNCj4+ICsJCWlmIChjdHhfbGVuIDwgMCkgew0KPj4gKwkJCWN0eF9sZW4gPSAwOw0KPj4g
KwkJCWN0eF9lcnIgPSBOVUxMOw0KPj4gKwkJCXBlaV9sZW4gPSBlcnItPnNlY3Rpb25fbGVuZ3Ro
IC0gc2l6ZW9mKHN0cnVjdCBjcGVyX3NlY19wcm9jX2FybSk7DQo+PiArCQkJaWYgKHBlaV9sZW4g
PCAwKSB7DQo+PiArCQkJCXBlaV9sZW4gPSAwOw0KPj4gKwkJCQlwZWlfZXJyID0gTlVMTDsNCj4+
ICsJCQl9DQo+PiArCQl9DQo+PiArCX0gZWxzZQ0KPj4gKwkJdmVuX2Vycl9kYXRhID0gKHU4ICop
Y3R4X2luZm87DQo+DQo+ZWxzZSB7DQo+CXZlbl9lcnJfZGF0YSA9ICh1OCAqKWN0eF9pbmZvOw0K
Pn0NCj4NCg0KVGhpcyBpc3N1ZSB3aWxsIGJlIHJlc29sdmVkIGluIG5leHQgdmVyc2lvbi4NCg0K
PlRoYW5rcw0KPkhhbmp1bg0KPg0K
