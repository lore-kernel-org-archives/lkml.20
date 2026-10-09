Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192E1449EA4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530535; cv=none; b=DWLE64JM3J/mwLAALz2DKJ5QPzHNcNwfxpviFp4VxVLwO0sLEzjjC5g/eTY7SNpyJSB9/KJJFt7StW3akqLYIjNwAG7aucbKWBdFaujkgXwN4rSsyk9f+R8trhLvJviGBFV3mcUwLNp8swhamCyNAd7hwI1wXvBduqtCrMEtI7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530535; c=relaxed/simple;
	bh=nvoxoulYg1UqJ1k2GlwAmjUDCzzEa8tyiK62zRIfx7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AYAi0lEBk3tvdzeilIILVW45vYy2lIZ/I/MymAbO3jhpM5vi45GUiXiMK7Q1hLxe56VYIgC//Yn9KIkCT6BVXo+jWQXPfPdwGtpxNVbxFgg25La8SPDw+GQEeVY32BrQhnhM033PKL0eoC444MTbVw/MXIu26wGDHaCyTHGg8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4j1JFt3MzgzVbqb;
	Fri,  9 Oct 2026 15:21:54 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4j1JFr3P3zzTTKx;
	Fri,  9 Oct 2026 15:21:52 +0800 (CST)
Received: from cncheex03.Hygon.cn (unknown [172.23.18.113])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id AB68C30004E1;
	Fri,  9 Oct 2026 15:16:52 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex03.Hygon.cn
 (172.23.18.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 9 Oct
 2026 15:21:52 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Fri, 9 Oct 2026 15:21:52 +0800
From: Fengyu Wang <wangfengyu@hygon.cn>
To: Valentin Schneider <vschneid@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, K Prateek Nayak <kprateek.nayak@amd.com>, Chen Yu
	<yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>, Shrikanth Hegde
	<sshegde@linux.ibm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jianyong Wu <wujianyong@hygon.cn>, Yuan Zhong
	<zhongyuan@hygon.cn>, Huangsj <huangsj@hygon.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjJdIHNjaGVkL3RvcG9sb2d5OiBGcmVlIE5VTUEg?=
 =?utf-8?Q?masks_on_topology_allocation_failure?=
Thread-Topic: [PATCH v2] sched/topology: Free NUMA masks on topology
 allocation failure
Thread-Index: AQHdKiMVu/v0DiGyGkqC+GFCUWfsv7adL/8AgFf41wA=
Date: Fri, 9 Oct 2026 07:21:52 +0000
Message-ID: <dfb0cb72eb1a483791dd72fc0f14116d@hygon.cn>
References: <20260812062206.82410-1-wangfengyu@hygon.cn>
 <xhsmhik5c7l55.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmhik5c7l55.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Accept-Language: zh-CN, en-US
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

SGksDQoNCkEgZ2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4gVGhhbmtzIHRvIFRpbSBhbmQgVmFs
ZW50aW4gZm9yIHRoZSByZXZpZXdzLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgYXJlIGFu
eSBmdXJ0aGVyIGNvbW1lbnRzIG9yIGNoYW5nZXMgbmVlZGVkLg0KDQpUaGFua3MsDQpGZW5neXUN
Cg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBWYWxlbnRpbiBTY2huZWlkZXIg
PHZzY2huZWlkQHJlZGhhdC5jb20+IA0K5Y+R6YCB5pe26Ze0OiAyMDI25bm0OOaciDE05pelIDIz
OjU1DQrmlLbku7bkuro6IEZlbmd5dSBXYW5nIDx3YW5nZmVuZ3l1QGh5Z29uLmNuPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVh
ZC5vcmc+OyBKdXJpIExlbGxpIDxqdXJpLmxlbGxpQHJlZGhhdC5jb20+OyBWaW5jZW50IEd1aXR0
b3QgPHZpbmNlbnQuZ3VpdHRvdEBsaW5hcm8ub3JnPg0K5oqE6YCBOiBEaWV0bWFyIEVnZ2VtYW5u
IDxkaWV0bWFyLmVnZ2VtYW5uQGFybS5jb20+OyBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29k
bWlzLm9yZz47IEJlbiBTZWdhbGwgPGJzZWdhbGxAZ29vZ2xlLmNvbT47IE1lbCBHb3JtYW4gPG1n
b3JtYW5Ac3VzZS5kZT47IEsgUHJhdGVlayBOYXlhayA8a3ByYXRlZWsubmF5YWtAYW1kLmNvbT47
IENoZW4gWXUgPHl1LmMuY2hlbkBpbnRlbC5jb20+OyBUaW0gQ2hlbiA8dGltLmMuY2hlbkBsaW51
eC5pbnRlbC5jb20+OyBTaHJpa2FudGggSGVnZGUgPHNzaGVnZGVAbGludXguaWJtLmNvbT47IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEppYW55b25nIFd1IDx3dWppYW55b25nQGh5Z29u
LmNuPjsgWXVhbiBaaG9uZyA8emhvbmd5dWFuQGh5Z29uLmNuPjsgSHVhbmdzaiA8aHVhbmdzakBo
eWdvbi5jbj47IEZlbmd5dSBXYW5nIDx3YW5nZmVuZ3l1QGh5Z29uLmNuPg0K5Li76aKYOiBSZTog
W1BBVENIIHYyXSBzY2hlZC90b3BvbG9neTogRnJlZSBOVU1BIG1hc2tzIG9uIHRvcG9sb2d5IGFs
bG9jYXRpb24gZmFpbHVyZQ0KDQpPbiAxMi8wOC8yNiAxNDoyMiwgRmVuZ3l1IFdhbmcgd3JvdGU6
DQo+IHNjaGVkX2luaXRfbnVtYSgpIHB1Ymxpc2hlcyBzY2hlZF9kb21haW5zX251bWFfbWFza3Mg
YmVmb3JlIGl0IA0KPiBhbGxvY2F0ZXMgdGhlIHRvcG9sb2d5IGFycmF5LiAgV2hlbiB0aGF0IGFs
bG9jYXRpb24gZmFpbHMsIHRoZSBlYXJseSANCj4gcmV0dXJuIGxlYXZlcyB0aGUgbWFza3MgcHVi
bGlzaGVkIHdoaWxlIHNjaGVkX2RvbWFpbnNfbnVtYV9sZXZlbHMgaXMgDQo+IHN0aWxsIHplcm86
IG5vdGhpbmcgZGVyZWZlcmVuY2VzIHRoZW0sIGJ1dCBub3RoaW5nIGNhbiBmcmVlIHRoZW0gDQo+
IGVpdGhlciwgYW5kIHRoZSB0b3BvbG9neSB0aGV5IHdlcmUgYnVpbHQgZm9yIGlzIG5ldmVyIGlu
c3RhbGxlZC4NCj4NCj4gRnJlZSB0aGUgbWFza3Mgb24gdGhhdCBwYXRoLCBhbmQgcHVibGlzaCB0
aGVtIG9ubHkgb25jZSB0aGUgdG9wb2xvZ3kgDQo+IGFycmF5IHRoZXkgd2VyZSBidWlsdCBmb3Ig
aGFzIGJlZW4gYWxsb2NhdGVkLg0KPg0KDQpzY2hlZF9pbml0X251bWEoKSBzdGlsbCByZXR1cm5z
IG5vdGhpbmcsIGFuZCBhbiBhbGxvY2F0aW9uIGZhaWx1cmUgaW4gc2NoZWR1bGVyIHRvcG9sb2d5
IGNvZGUgaXMgcHJldHR5IG11Y2ggYWx3YXlzIHBhaXJlZCB3aXRoIGEgZHVtcHN0ZXIgZmlyZSwg
YnV0IEkgZ3Vlc3MgdGhpcyBtYXkgaGVscCB5b3UgZ2V0IGZ1cnRoZXIgaW4gdGhlIGJvb3Rpbmcg
cHJvY2VzcyBvZiBhIGJvcmtlZCBrZXJuZWwuLi4NCg0KPiBGaXhlczogY2I4M2I2MjliYWUwICgi
c2NoZWQvbnVtYTogUmV3cml0ZSB0aGUgQ09ORklHX05VTUEgc2NoZWQgZG9tYWluIA0KPiBzdXBw
b3J0IikNCj4gU2lnbmVkLW9mZi1ieTogRmVuZ3l1IFdhbmcgPHdhbmdmZW5neXVAaHlnb24uY24+
DQoNClJldmlld2VkLWJ5OiBWYWxlbnRpbiBTY2huZWlkZXIgPHZzY2huZWlkQHJlZGhhdC5jb20+
DQoNCg0K

