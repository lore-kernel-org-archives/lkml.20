Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C061F4ABBA4;
	Fri, 18 Sep 2026 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730388; cv=none; b=I2Ajnb8uTvIDshdWqYdXlTLKqwvQDsVY2RzW/5UuT40wG7wj42JmAJ4xfESnTTPzqBEx+3zqy6TRovxlaqVmSdlF/nVC7M7MeWUX5cV+O2b7sBm9ApS7/PPUNgEIc/z80zVJckCmeHKd/GcR93z887gKDIajBxa2tnSC80xv+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730388; c=relaxed/simple;
	bh=T8aUStlEhZh8FYeESGDdwzevaSu3/YhAiBDL7EQ84cg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E0yQVYlgYe47jrq3vWhoGcXB8fRubrSTxmNYmDYMI0Puo+cTA+LyW9kLZMHMXAB1RIh6iVKUDgebsNGjtSOzO2xFuv2LmhfLpR86Wl2ckZOSfMazzsbWITaHtQO2sSRO16Xyrd5SvfeqD+YgNU+tiAUdkaVdY/E2gHd0zGEAM2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=InXx+GTY; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="InXx+GTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T8aUStlEhZh8FYeESGDdwzevaSu3/YhAiBDL7EQ84cg=;
  b=InXx+GTY9nsgvs42wv6aX58nAcZZEkLgFkd6250pLLbAKYRScR0LQuJD
   Qi0IGBXCBgAgI9cQ7sSLixfdfRDy9g1N9Kye5ZsYzlHeXHo0Q0HM7prXx
   KbCRIqlPqmocbTabmjmYf5t7IyPIjsUCdpK3jqYLRLGM/u1s+VHik49+J
   zIEisF3KUdvAODZphx3qKjSNEkKwoNoj4CpAqI+vZ4zgPSVYWg/dCcBTM
   eZLpby5SQDlihqkVuPSeCQbfoHp7YieuUulxfaeO5cYn/wvkfNN/1wjYl
   enmFKJexW5pu3W+LRPiNxHJTYXG6UqUrlMa4KTs2CbJEhgLb5YFKAfw+6
   g==;
X-CSE-ConnectionGUID: D8BMDDYOSRuQOUtw2FV3iA==
X-CSE-MsgGUID: HpQARTkrSrOAP3D999ER6A==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 18 Sep 2026 19:19:42 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 68IBJdSM030931;
	Fri, 18 Sep 2026 19:19:39 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 19:19:38 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Fri, 18 Sep 2026 19:19:38 +0800
From: <Hermes.Wu@ite.com.tw>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 20/21] media: i2c: it6625: use centrally managed active
 state
Thread-Topic: [PATCH 20/21] media: i2c: it6625: use centrally managed active
 state
Thread-Index: AQHdR1f0JNOGacAb70SRmiTIS7Nox7bUME/g
Date: Fri, 18 Sep 2026 11:19:38 +0000
Message-ID: <69a3df11b37f466fbdca8be37a6cc378@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-20-78d72d7886a5@ite.com.tw>
 <aq0RaLPX5o0HU_yC@kekkonen.localdomain>
In-Reply-To: <aq0RaLPX5o0HU_yC@kekkonen.localdomain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: A6A5CD832C23351B08FBA5097B3C255EFD05E60C73A7A85E8E4B88BA57082D192002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 68IBJdSM030931

SGkgU2FrYXJpLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIA0KDQo+IEkgZG9uJ3QgdGhp
bmsgYWxsIHRoZSBhYm92ZSBpcyByZWxldmFudCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCkFn
cmVlZCwgdHJpbW1lZC4NCg0KPiBUaGlzIHBhcmFncmFwaCBjb3VsZCBnbyB0byB0aGUgY292ZXIg
bGV0dGVyLg0KDQpBZ3JlZWQsIG1vdmVkIHRoZSBsb2NrLWF1ZGl0LXRyYWNlIHBhcmFncmFwaCB0
aGVyZS4NCg0KPiArCS8qDQo+ICsJICogUHJvdGVjdHMgY29uY3VycmVudCBhY2Nlc3MgdG8gdGhl
IGNoaXAncyByZWdpc3RlcnMgYW5kIHN0YXRlLg0KPiArCSAqIEFsc28gc2hhcmVkIGFzIHNkLnN0
YXRlX2xvY2sgYW5kIGhkbC5sb2NrIChzZWUNCj4gWy4uLl0NCj4NCj4gVGhpcyBkb2Vzbid0IGhv
bGQgYW55bW9yZSwgZG9lcyBpdD8gVHlwaWNhbGx5IGRyaXZlcnMgZG8gd2l0aG91dCBzdWNoDQo+
IGxvY2tzIGFzIHRoZSBzdWJkZXYgc3RhdGUgbG9jayBpcyB1c2VkIGluc3RlYWQgLS0gYXNzaWdu
aW5nIHlvdXIgb3duIGxvY2sNCj4gYWxzbyBoYXMgdGhlIGVmZmVjdCB0aGUgc2FtZSBsb2NrIGlz
IHVzZWQgZm9yIHRyeSBzdGF0ZXMsIHRvby4NCg0KWW91J3JlIHJpZ2h0LCBhbmQgb24gcmVmbGVj
dGlvbiBzaGFyaW5nIGl0IHdhcyB0aGUgd3JvbmcgY2FsbCwgbm90IGp1c3QNCmFuIHVuZGVyLWV4
cGxhaW5lZCBvbmUuIGl0NjYyNV9sb2NrIGlzIGFuIE1DVS9yZWdpc3RlciBsb2NrOiB0aGUNCmNo
aXAncyBpbnRlcm5hbCBNQ1UgZmlybXdhcmUgcHJvY2Vzc2VzIG9uZSByZWdpc3Rlci1kcml2ZW4g
Y29tbWFuZCBhdA0KYSB0aW1lLCBhbmQgc29tZSBjb21tYW5kcyBhcmUgbXVsdGktc3RlcCBJMkMg
dHJhbnNhY3Rpb25zICh3cml0ZSBhDQpjb25maWcgcmVnaXN0ZXIsIHRoZW4gcG9sbCBSRUdfSE9T
VF9DVFJMX0lOVC9CX0NPTkZJR19VUERBVEUgdmlhDQppdDY2MjVfd2FpdF9mb3Jfc3RhdHVzKCkp
IHRoYXQgbXVzdCBub3QgYmUgaW50ZXJsZWF2ZWQgd2l0aCBhbm90aGVyDQpzdWNoIGNvbW1hbmQu
IFRoYXQncyBhIHJlYWwsIHNlcGFyYXRlIGNvbnN0cmFpbnQsIGJ1dCBpdCBpc24ndCBhDQpyZWFz
b24gdG8gYWxzbyBtYWtlIGl0IHRoZSBzdWJkZXYgc3RhdGUgbG9jayBvciB0aGUgY29udHJvbCBo
YW5kbGVyJ3MNCmxvY2sgLS0gbmVpdGhlciB0aGUgcGFkIGZvcm1hdCBub3IgdGhlIGNvbnRyb2wg
aGFuZGxlciBpcyBjaGlwIHN0YXRlLg0KDQpEcm9wcGVkIGJvdGggYWxpYXNpbmcgYXNzaWdubWVu
dHMgKHNkLT5zdGF0ZV9sb2NrLCBoZGwtPmxvY2spIGFuZCBsZXQNCnRoZSBjb3JlIGdpdmUgdGhl
IHN1YmRldiBzdGF0ZSBhbmQgdGhlIGNvbnRyb2wgaGFuZGxlciB0aGVpciBvd24NCmluZGVwZW5k
ZW50IGxvY2tzLCBsaWtlIG1vc3QgZHJpdmVycyBkby4gaXQ2NjI1X2xvY2sgc3RheXMgZXhhY3Rs
eQ0Kd2hhdCBpdCBhbHdheXMgd2FzOiBhIHByaXZhdGUgbXV0ZXggdGFrZW4gZXhwbGljaXRseSBh
cm91bmQgTUNVLw0KcmVnaXN0ZXIgYWNjZXNzLiBUaGF0IGRpZCBtZWFuIHJlLWF1ZGl0aW5nIGV2
ZXJ5IGNhbGxlciB0aGF0IHVzZWQgdG8NCnJlYWNoIHRoZSBhY3RpdmUgcGFkIGZvcm1hdCB1bmRl
ciB0aGUgaW1wbGljaXQNCnN0YXRlX2xvY2sgPT0gaXQ2NjI1X2xvY2sgYXNzdW1wdGlvbiAtLSBp
dDY2MjVfaW5pdGlhbF9zZXR1cCgpLA0KaXQ2NjI1X2NsZWFyX3RpbWluZ3MoKSwgaXQ2NjI1X2xv
Z19zdGF0dXMoKSwgYW5kDQppdDY2MjVfdXBkYXRlX3RpbWluZ3NfaWZfY2hhbmdlZCgpIG5vdyB0
YWtlIHRoZSBhY3RpdmUgc3RhdGUncyBsb2NrDQpleHBsaWNpdGx5ICh0aGUgbGFzdCB0d28gYXJl
bid0IGNvcmUtbG9ja2VkIHRvIGJlZ2luIHdpdGg6DQpWSURJT0NfTE9HX1NUQVRVUyBhbmQgVklE
SU9DX1NVQkRFVl9TX0RWX1RJTUlOR1MgYXJlbid0IGluDQpzdWJkZXZfaW9jdGxfZ2V0X3N0YXRl
KCkncyBzd2l0Y2ggaW4gdjRsMi1zdWJkZXYuYyksIG5lc3RpbmcNCml0NjYyNV9sb2NrIGluc2lk
ZSB3aGVyZSB0aGV5IGFsc28gdG91Y2ggaXQ2NjI1LT50aW1pbmdzLiBUaGUgcnVsZQ0KZ29pbmcg
Zm9yd2FyZDogYSBzdWJkZXYgc3RhdGUgbG9jaywgd2hlbiBoZWxkLCBpcyBhbHdheXMgdGhlIG91
dGVyDQpsb2NrOyBpdDY2MjVfbG9jayBuZXN0cyBpbnNpZGUgaXQsIG5ldmVyIHRoZSByZXZlcnNl
Lg0KDQo+IENvdWxkIHlvdSByZXdvcmsgdGhlIGNvZGUgdG8ga2VlcCB0aGlzIGZvciBhY3RpdmUg
YW5kIHRyeSBwYXRocz8NCg0KQWdyZWVkLiBNb3ZlZCB0aGUgQUNUSVZFLW9ubHkgaGFyZHdhcmUg
cHJvZ3JhbW1pbmcgaW50byBpdHMgb3duIGd1YXJkZWQNCmJsb2NrIGFuZCBsZXQgYm90aCBUUlkg
YW5kIEFDVElWRSBmYWxsIHRocm91Z2ggdG8gb25lIHNoYXJlZCBjb21taXQgdGFpbA0KaW5zdGVh
ZCBvZiBkdXBsaWNhdGluZyBpdC4NCg0KPiBUaGVyZSBhcmUgYSBmZXcgbGluZXMgbG9uZ2VyIHRo
YW4gODA7IHBsZWFzZSBzcGxpdCB1bmxlc3MgdGhlcmUncyBhDQo+IHRhbmdpYmxlIHJlYXNvbiB0
byBkbyBvdGhlcndpc2UuDQoNCkFncmVlZC4gSG9pc3RlZCB0aGUgcmVwZWF0ZWQgaXQ2NjI1X2Zv
cm1hdHNbaWR4XS5jc2lfZm9ybWF0IGxvb2t1cCBpbnRvDQphIGxvY2FsIHZhcmlhYmxlLCB3aGlj
aCBnZXRzIHRoZSBpdDY2MjVfc2V0X21pcGlfY29uZmlnX2xvY2tlZCgpIGNhbGwNCihhbmQgdGhl
IG5laWdoYm9yaW5nIGNvbW1lbnQpIHVuZGVyIDgwIGNvbHVtbnMgd2l0aG91dCBhbiBhd2t3YXJk
IHdyYXAuDQoNCj4gKwlpZiAoYWN0aXZlKSB7DQo+ICsJCSpmbXQgPSAqdjRsMl9zdWJkZXZfc3Rh
dGVfZ2V0X2Zvcm1hdChhY3RpdmUsIDApOw0KPiArCQlyZXR1cm4gMDsNCj4gKwl9DQo+DQo+IFRo
aXMgZnVuY3Rpb24gc2hvdWxkIHdvcmsgdGhlIHNhbWUgd2F5IGluZGVwZW5kZW50bHkgb2Ygd2hl
dGhlciB0aGUNCj4gc3RhdGUgaXMgYWN0aXZlIG9yIG5vdC4NCg0KQWdyZWVkLiBJIHdhcyBzcGVj
aWFsLWNhc2luZyBvbiB3aGV0aGVyIHNkLT5hY3RpdmVfc3RhdGUgZXhpc3RlZCB5ZXQsIHRvDQpz
ZWVkIGEgbmV3IFRSWSBzdGF0ZSBmcm9tIHRoZSBjdXJyZW50IGFjdGl2ZSBmb3JtYXQgaW5zdGVh
ZCBvZiByZXZlcnRpbmcNCnRvIGJvb3QgZGVmYXVsdHMuIFJld29ya2VkIGl0IHRvIGFsd2F5cyBz
ZXQgdGhlIHNhbWUgZGVmYXVsdHMgcmVnYXJkbGVzcw0Kb2Ygd2hpY2ggc3RhdGUgaXQncyBpbml0
aWFsaXppbmcgLS0gaXQ2NjI1LT50aW1pbmdzIGFuZCB0aGUgZGVmYXVsdA0KZm9ybWF0IGluZGV4
IC0tIGZvbGxvd2luZyB0aGUgc2FtZSB1bmNvbmRpdGlvbmFsLWRlZmF1bHRzIHBhdHRlcm4NCmht
MTI0Nl9pbml0X3N0YXRlKCkgdXNlcyBmb3IgdGhlIHNhbWUgYWN0aXZlL1RSWSBkaXN0aW5jdGlv
bi4gVGhlDQpjb3JlIGFscmVhZHkgaG9sZHMgd2hpY2hldmVyIHN0YXRlIGluaXRfc3RhdGUoKSBp
cyBpbml0aWFsaXppbmcgYmVmb3JlDQpjYWxsaW5nIGluLCBzbyByZWFkaW5nIGl0NjYyNS0+dGlt
aW5ncyB1bmRlciBhIG5lc3RlZCBpdDY2MjVfbG9jayAoc2VlDQp0aGUgbG9ja2luZyByZXBseSBh
Ym92ZSkgaXMgc2FmZSB0aGVyZSB0b287IGEgVFJZIHN0YXRlIG9wZW5lZCBhZnRlcg0Kc2lnbmFs
IGRldGVjdGlvbiBzdGlsbCByZWZsZWN0cyB0aGUgbGl2ZSBkZXRlY3RlZCB3aWR0aC9oZWlnaHQv
ZmllbGQsDQphbmQgdGhlIGNvZGUgYWx3YXlzIHN0YXJ0cyBmcm9tIHRoZSBkZWZhdWx0IGZvcm1h
dCBpbmRleCwgc2FtZSBhcw0KaXQ2NjI1X2luaXRfZGF0YSgpIHNlZWRzIGl0IGF0IHByb2JlLg0K
DQo+IFRoaXMgY29tbWVudCBpcyBoYXJkbHkgdXNlZnVsOyB0aGUgc2FtZSBhcHBsaWVzIHRvIHBy
ZXR0eSBtdWNoIGFsbA0KPiBkcml2ZXJzIHVzaW5nIHN1Yi1kZXZpY2Ugc3RhdGUgYW5kIFY0TDIg
Y29udHJvbHMuDQoNCkFncmVlZCwgZHJvcHBlZCBpdC4NCg0KS2luZCByZWdhcmRzLA0KDQpIZXJt
ZXMNCg==
