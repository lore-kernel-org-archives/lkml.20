Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846925;
	b=P2Oq9fBfH6RbPJZsKu+5JuvzDNytTUmDA6DI6UNSrkawDU1asJWkQER/NK8FPXhFMnL2
	 y7z7SPkHXU4Xr7mdbH0br+uz32SwBu73hnOvvpwzKLHpY0Zu6qqu8fQ+cpzyMGOtmNJkL
	 QTeP0hA/4q8USnlrsox/iA3t4Noregea21/RHbtjp2w1w3iDsZTIoQO1xQs6pxvwTuSRr
	 MXrLVUrMGoGAYNWifeGlc6N7mPH9ptFX7jkCrG63FLV/Z4KvImYQ0eAq2lTSJRGWP7rXY
	 5zl1mjjcWykAA6I4QsJHkx55Wlxy0tzoW3R3TFONQ+KOjlhJZEW1tmOAD2Dy0LmZj5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846925;
	h=DMARC-Filter:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/R87Y7j7RSmk90i3y3GMKFMfxpSimboac2EppkIAbuA=;
	b=M9zsOJYQi9B8awl1MRBs8TD/mG9GndQzPanvx4/3J1N53JeU0cMStBaz2jHSjxZYwThm
	 hSZQPhTNV+oiCBDIRZLj1yrq5v0Pz+prusSitDWkdzVROxmw5FdAM8dUaK8Sa/pTJ5868
	 LLKXLzkdgMR04jHxSOYMCV5bJOZaOdezuAMXBFAL7fWDfk6mJywFtl8KPmNN4jvij+Tw/
	 8/H465fRWGGReMJnBMzjKRi8zZIMR16mOk1GnSPrmYMJa5euHoU8BXXK7VckV83H0EEx+
	 YhCtuSfMCR0YbPlPZ9oYRAI0ASwekEAsk5iRFQcHwOgv6skvEH1qitHg57HsvHYx7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC93606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC93606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jKmvv58mGzwVJS;
	Thu,  5 Nov 2026 10:48:27 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jKmvt6VQjzwVJS;
	Thu,  5 Nov 2026 10:48:26 +0800 (CST)
Received: from cncheex03.Hygon.cn (unknown [172.23.18.113])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 1F4CD301C0DA;
	Thu,  5 Nov 2026 10:47:50 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex03.Hygon.cn
 (172.23.18.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 5 Nov
 2026 10:48:26 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Thu, 5 Nov 2026 10:48:26 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Tim Chen <tim.c.chen@linux.intel.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "yu.c.chen@intel.com" <yu.c.chen@intel.com>
CC: "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "bsegall@google.com"
	<bsegall@google.com>, "mgorman@suse.de" <mgorman@suse.de>,
	"vschneid@redhat.com" <vschneid@redhat.com>, "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jianyong.wu@outlook.com"
	<jianyong.wu@outlook.com>, Yibin Liu <liuyibin@hygon.cn>, Yuan Zhong
	<zhongyuan@hygon.cn>
Subject: RE: [PATCH] sched/cache: Fix group_llc_balance being unreachable
 above the first NUMA level
Thread-Topic: [PATCH] sched/cache: Fix group_llc_balance being unreachable
 above the first NUMA level
Thread-Index: AQHdbGdEfgKK63ccNEKIGUO+lEtYvrcdvzuAgAD7C0A=
Date: Thu, 5 Nov 2026 02:48:26 +0000
Message-ID: <e2c8b992aa8d4437b57d11f77c6465fe@hygon.cn>
References: <20261104141313.185433-1-wujianyong@hygon.cn>
 <5b9e949a64935bc280ae72b3acea80745a5600f3.camel@linux.intel.com>
In-Reply-To: <5b9e949a64935bc280ae72b3acea80745a5600f3.camel@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
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

SGkgVGltLA0KDQoNCj4gU28gd2UgZG8gbm90IGRvIHRoZSBsbGNfYmFsYW5jZSBjaGVjayBmb3Ig
bm9uIGNhY2hlIGF3YXJlIHNjaGVkdWxpbmcNCj4gY2FzZS4NCj4NCg0KVGhhbmtzLCB0aGlzIGlz
IGNsZWFyZXIgdGhhbiBteSB2ZXJzaW9uLCBhbmQgY2hlYXBlciB0b286IHdoZW4gY2FjaGUgYXdh
cmUNCnNjaGVkdWxpbmcgaXMgZGlzYWJsZWQgdGhlIGdyb3VwIHR5cGUgY2hlY2sgaXMgZWl0aGVy
IGNvbXBpbGVkIG91dCBvciBza2lwcGVkDQpieSB0aGUgc3RhdGljIGJyYW5jaC4NCg0KVGhpcyBw
YXRjaCBjb21lcyBmcm9tIG15IGVhcmxpZXIgc2VyaWVzIHRoYXQgc2NhbGVzIGNhY2hlIGF3YXJl
IHNjaGVkdWxpbmcgYXQNCkxMQyBncmFudWxhcml0eS4gIFlpYmluIGZvdW5kIHRoYXQgd2l0aG91
dCBpdCBtYWlubGluZSBkb2VzIG5vdCBwdWxsIGEgdGFzaw0KYmFjayBpbnRvIGl0cyBwcmVmZXJy
ZWQgTExDIG9uY2UgdGhlIHRhc2sgc2l0cyBiZXlvbmQgdGhlIGZpcnN0IE5VTUEgbGV2ZWwsIHNv
DQpJIHBpY2tlZCBpdCBvdXQgYW5kIHNlbnQgaXQgYXMgYSBzdGFuZGFsb25lIGZpeC4NCg0KSSds
bCBpbmNsdWRlIHlvdXIgdmVyc2lvbiBpbiB2Mi4NCg0KVGhhbmtzDQpKaWFueW9uZw0KDQoNCj4g
VGltDQo+IA0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL2ZhaXIuYyBiL2tlcm5lbC9zY2hl
ZC9mYWlyLmMNCj4gaW5kZXggY2ZjOTgyMjA1Yjk4Li44YTc0NDIxODlhM2IgMTAwNjQ0DQo+IC0t
LSBhL2tlcm5lbC9zY2hlZC9mYWlyLmMNCj4gKysrIGIva2VybmVsL3NjaGVkL2ZhaXIuYw0KPiBA
QCAtMTIxOTIsNiArMTIxOTIsMTYgQEAgc3RhdGljIGJvb2wgdXBkYXRlX2xsY19idXNpZXN0KHN0
cnVjdCBsYl9lbnYNCj4gKmVudiwNCj4gICAgICAgICAgKi8NCj4gICAgICAgICByZXR1cm4gc2dz
LT5ucl9wcmVmX2RzdF9sbGMgPiBidXNpZXN0LT5ucl9wcmVmX2RzdF9sbGM7DQo+ICB9DQo+ICsN
Cj4gKy8qDQo+ICsgKiBUaGUgYnVzaWVzdCBncm91cCBoYXMgdGFza3MgdGhhdCBwcmVmZXIgdGhl
IGRlc3RpbmF0aW9uIExMQyBhbmQNCj4gKyAqIGNhY2hlIGF3YXJlIHNjaGVkdWxpbmcgaXMgZW5h
YmxlZC4NCj4gKyAqLw0KPiArc3RhdGljIGlubGluZSBib29sIGJ1c2llc3RfbGxjX2JhbGFuY2Uo
c3RydWN0IHNnX2xiX3N0YXRzICpidXNpZXN0KQ0KPiArew0KPiArICAgICAgIHJldHVybiBzY2hl
ZF9jYWNoZV9lbmFibGVkKCkgJiYNCj4gKyAgICAgICAgICAgICAgYnVzaWVzdC0+Z3JvdXBfdHlw
ZSA9PSBncm91cF9sbGNfYmFsYW5jZTsNCj4gK30NCj4gICNlbHNlDQo+ICBzdGF0aWMgaW5saW5l
IHZvaWQgcmVjb3JkX3NnX2xsY19zdGF0cyhzdHJ1Y3QgbGJfZW52ICplbnYsIHN0cnVjdCBzZ19s
Yl9zdGF0cw0KPiAqc2dzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgc2NoZWRfZ3JvdXAgKmdyb3VwKQ0KPiBAQCAtMTIyMTAsNiArMTIyMjAsMTEgQEAg
c3RhdGljIGJvb2wgdXBkYXRlX2xsY19idXNpZXN0KHN0cnVjdCBsYl9lbnYNCj4gKmVudiwNCj4g
IHsNCj4gICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICB9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBidXNpZXN0X2xsY19iYWxhbmNlKHN0cnVjdCBzZ19sYl9zdGF0cyAqYnVzaWVzdCkNCj4g
K3sNCj4gKyAgICAgICByZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICAjZW5kaWYNCj4gDQo+ICAvKioN
Cj4gQEAgLTEzMzAzLDE0ICsxMzMxOCwyNSBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX2dyb3VwDQo+
ICpzY2hlZF9iYWxhbmNlX2ZpbmRfc3JjX2dyb3VwKHN0cnVjdCBsYl9lbnYgKmVudikNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfYmFsYW5jZWQ7DQo+ICAgICAgICAgfQ0KPiAN
Cj4gLSAgICAgICAvKg0KPiAtICAgICAgICAqIFRyeSB0byBtb3ZlIGFsbCBleGNlc3MgdGFza3Mg
dG8gYSBzaWJsaW5nIGRvbWFpbiBvZiB0aGUgYnVzaWVzdA0KPiAtICAgICAgICAqIGdyb3VwJ3Mg
Y2hpbGQgZG9tYWluLg0KPiAtICAgICAgICAqLw0KPiAtICAgICAgIGlmIChzZHMucHJlZmVyX3Np
YmxpbmcgJiYgbG9jYWwtPmdyb3VwX3R5cGUgPT0gZ3JvdXBfaGFzX3NwYXJlDQo+ICYmDQo+IC0g
ICAgICAgICAgIChidXNpZXN0LT5ncm91cF90eXBlID09IGdyb3VwX2xsY19iYWxhbmNlIHx8DQo+
IC0gICAgICAgICAgIHNpYmxpbmdfaW1iYWxhbmNlKGVudiwgJnNkcywgYnVzaWVzdCwgbG9jYWwp
ID4gMSkpDQo+IC0gICAgICAgICAgICAgICBnb3RvIGZvcmNlX2JhbGFuY2U7DQo+ICsgICAgICAg
aWYgKGxvY2FsLT5ncm91cF90eXBlID09IGdyb3VwX2hhc19zcGFyZSkgew0KPiArDQo+ICsgICAg
ICAgICAgICAgICBpZiAoYnVzaWVzdF9sbGNfYmFsYW5jZShidXNpZXN0KSkNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBmb3JjZV9iYWxhbmNlOw0KPiArDQo+ICsgICAgICAgICAgICAg
ICAvKg0KPiArICAgICAgICAgICAgICAgICogVHJ5IHRvIG1vdmUgYWxsIGV4Y2VzcyB0YXNrcyB0
byBhIHNpYmxpbmcgZG9tYWluIG9mDQo+IHRoZQ0KPiArICAgICAgICAgICAgICAgICogYnVzaWVz
dCBncm91cCdzIGNoaWxkIGRvbWFpbi4NCj4gKyAgICAgICAgICAgICAgICAqLw0KPiArICAgICAg
ICAgICAgICAgaWYgKHNkcy5wcmVmZXJfc2libGluZyAmJg0KPiArICAgICAgICAgICAgICAgICAg
IHNpYmxpbmdfaW1iYWxhbmNlKGVudiwgJnNkcywgYnVzaWVzdCwgbG9jYWwpID4gMSkNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBmb3JjZV9iYWxhbmNlOw0KPiArICAgICAgIH0NCj4g
DQo+IA0KPiA+DQo+ID4gRml4ZXM6IGYzOGNjMmYwZDhhMyAoInNjaGVkL2NhY2hlOiBQcmlvcml0
aXplIHRhc2tzIHByZWZlcnJpbmcgZGVzdGluYXRpb24NCj4gTExDIGR1cmluZyBiYWxhbmNpbmci
KQ0KPiA+IFJlcG9ydGVkLWJ5OiBZaWJpbiBMaXUgPGxpdXlpYmluQGh5Z29uLmNuPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEppYW55b25nIFd1IDx3dWppYW55b25nQGh5Z29uLmNuPg0KPiA+IC0tLQ0K
PiA+ICBrZXJuZWwvc2NoZWQvZmFpci5jIHwgNSArKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9zY2hlZC9mYWlyLmMgYi9rZXJuZWwvc2NoZWQvZmFpci5jDQo+ID4gaW5kZXggNTczNjBm
NWNkZGU0Li4yMDVhMDg5MWIwYTAgMTAwNjQ0DQo+ID4gLS0tIGEva2VybmVsL3NjaGVkL2ZhaXIu
Yw0KPiA+ICsrKyBiL2tlcm5lbC9zY2hlZC9mYWlyLmMNCj4gPiBAQCAtMTMyOTQsOSArMTMyOTQs
MTAgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF9ncm91cA0KPiAqc2NoZWRfYmFsYW5jZV9maW5kX3Ny
Y19ncm91cChzdHJ1Y3QgbGJfZW52ICplbnYpDQo+ID4gIAkgKiBUcnkgdG8gbW92ZSBhbGwgZXhj
ZXNzIHRhc2tzIHRvIGEgc2libGluZyBkb21haW4gb2YgdGhlIGJ1c2llc3QNCj4gPiAgCSAqIGdy
b3VwJ3MgY2hpbGQgZG9tYWluLg0KPiA+ICAJICovDQo+ID4gLQlpZiAoc2RzLnByZWZlcl9zaWJs
aW5nICYmIGxvY2FsLT5ncm91cF90eXBlID09IGdyb3VwX2hhc19zcGFyZSAmJg0KPiA+ICsJaWYg
KGxvY2FsLT5ncm91cF90eXBlID09IGdyb3VwX2hhc19zcGFyZSAmJg0KPiA+ICAJICAgIChidXNp
ZXN0LT5ncm91cF90eXBlID09IGdyb3VwX2xsY19iYWxhbmNlIHx8DQo+ID4gLQkgICAgc2libGlu
Z19pbWJhbGFuY2UoZW52LCAmc2RzLCBidXNpZXN0LCBsb2NhbCkgPiAxKSkNCj4gPiArCSAgICAg
KHNkcy5wcmVmZXJfc2libGluZyAmJg0KPiA+ICsJICAgICAgc2libGluZ19pbWJhbGFuY2UoZW52
LCAmc2RzLCBidXNpZXN0LCBsb2NhbCkgPiAxKSkpDQo+ID4gIAkJZ290byBmb3JjZV9iYWxhbmNl
Ow0KPiA+DQo+ID4gIAlpZiAoYnVzaWVzdC0+Z3JvdXBfdHlwZSAhPSBncm91cF9vdmVybG9hZGVk
KSB7DQoNCg==

