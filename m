Received: from ironport.ite.com.tw (itemail.ite.com.tw [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163202571A0;
	Mon, 21 Sep 2026 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957487; cv=none; b=FXl1xv9FQGIImglEGJ/0OQYf67zbEPhle2k4K/AMn5sHtJT08BXA7abW1LtfT7r6pbLlYbt79/tiQqKncprjZMogvVY9Cb4OifOwF/C3gU0CXIRyOWAkn4+Rjsl7CPfCbgo0h/GM7DNi6mchZD6CqHXJNA2zsEt3V5urZ+Fv8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957487; c=relaxed/simple;
	bh=Bx3bVDSoEaUOQGKKulxNrXFCUXbXQIBNeBlIAuHrhzs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=biesGt43/ozmeQPx4vnLDtQmKKLKq+tglNa1s4UK5pkd49EtcLbuwx2PPWPg59eXl9pqqMW2YYTWNE4ze0FlAN42A3UFLULnNMCs9Gu3l1p/V4gPj+tAUJaJTOeZCdJwLsinMKW6uLiulj4w69wksLLnK9Rc+luzUlykbnLN2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=OxqAJFmU; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="OxqAJFmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bx3bVDSoEaUOQGKKulxNrXFCUXbXQIBNeBlIAuHrhzs=;
  b=OxqAJFmUEpfFU85mx+KtQpkPenU4TzI+wxFveMv3qAZ0y2k68B6Tdefw
   P3ZjiV2gRE9FesKZ2FlJV/HnOEVmB2+VAS/1SjnHxw3cI2Z1QTPhZUgK1
   A4GZUJwOOmPrmXVcj6Ag6JW4A6DlyQRX7oUXaXprYNglRoZN2A/DMdZcU
   BVJ5CjdkGO7ljybuy0KsQnlE9CMucBwIG6vhlWnmHIHWQ5WDNrcbL4Nz2
   bDVokyi5yILIeziLvsimw2xNQ9EnBjPOfbX2NeacWre9BnQvMfilMpZF3
   tGFlK/yS57lV1I3rmLoHkF3LTtrqwN7XPvOJn/iPo09QoE1EEl0tpSP+O
   w==;
X-CSE-ConnectionGUID: OrqzpHi9TKmaZx4Xmrf9MQ==
X-CSE-MsgGUID: VqIqdJifRHCrt+prwNmnRQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 21 Sep 2026 10:24:35 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 68L2OUNj055813;
	Mon, 21 Sep 2026 10:24:30 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:24:29 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Mon, 21 Sep 2026 10:24:29 +0800
From: <Hermes.Wu@ite.com.tw>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 20/21] media: i2c: it6625: use centrally managed active
 state
Thread-Topic: [PATCH 20/21] media: i2c: it6625: use centrally managed active
 state
Thread-Index: AQHdR1f0JNOGacAb70SRmiTIS7Nox7bUME/g//+/pQCABF7e0A==
Date: Mon, 21 Sep 2026 02:24:29 +0000
Message-ID: <f2c5479e4d0d4d89a030698f34a277e3@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-20-78d72d7886a5@ite.com.tw>
 <aq0RaLPX5o0HU_yC@kekkonen.localdomain>
 <69a3df11b37f466fbdca8be37a6cc378@ite.com.tw>
 <aq1Yps6g7m7TQJvd@kekkonen.localdomain>
In-Reply-To: <aq1Yps6g7m7TQJvd@kekkonen.localdomain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 6CF4E9D0941117F4C5CE57440F963E5C40A890500F52DAF2A694B800A3650CF72002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 68L2OUNj055813

SGkgU2FrYXJpLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KDQo+IElzIHRo
aXMgQUktZ2VuZXJhdGVkPw0KDQpJIHVzZWQgQUkgYXNzaXN0YW5jZSB0byBoZWxwIHVuZGVyc3Rh
bmQgdGhpcyByZXZpZXcgY29tbWVudCBhbmQgZHJhZnQgcGFydHMNCm9mIHBhdGNoZXMgMjAvMjEg
YmVjYXVzZSBJIHdhcyBub3QgY2VydGFpbiBhYm91dCB0aGUgZXhwZWN0ZWQgbG9ja2luZyBtb2Rl
bC4NCkkgcmV2aWV3ZWQgdGhlIHJlc3VsdCBiZWZvcmUgc2VuZGluZyBpdCwgYnV0IG15IGNvbmNs
dXNpb24gYWJvdXQgdGhlIHN0YXRlDQpsb2NrIHdhcyBpbmNvcnJlY3QuIEkgc2hvdWxkIGhhdmUg
YXNrZWQgZm9yIGNsYXJpZmljYXRpb24gaW5zdGVhZCBvZiBtYWtpbmcNCnRoZSBjbGFpbSBhYm91
dCB3aGF0IG1vc3QgZHJpdmVycyBkby4gU29ycnkgYWJvdXQgdGhhdC4NCg0KPiBQbGVhc2UgdXNl
IHRoZSBjb250cm9sIGhhbmRsZXIncyBsb2NrIGFzIHRoZSBzdGF0ZSBsb2NrLCB0b28uIFRoaXMg
aXMNCj4gd2hhdCBtb3N0IG1vZGVybiBkcml2ZXJzIGRvLCB0b28uDQoNCkRvIHlvdSBtZWFuIHRo
YXQgSSBzaG91bGQgbGVhdmUgdGhlIGNvbnRyb2wgaGFuZGxlciB1c2luZyBpdHMgb3duIGludGVy
bmFsDQpsb2NrIGFuZCBhc3NpZ24gdGhhdCBsb2NrIHRvIHRoZSBzdWJkZXYgc3RhdGUgYmVmb3Jl
IGNhbGxpbmcNCnY0bDJfc3ViZGV2X2luaXRfZmluYWxpemUoKSwgYXMgZm9sbG93cz8NCg0KCXNk
LT5zdGF0ZV9sb2NrID0gc2QtPmN0cmxfaGFuZGxlci0+bG9jazsNCg0KSSBhbSBhbHNvIHN0aWxs
IHVuc3VyZSBhYm91dCB0aGUgc2VwYXJhdGUgaXQ2NjI1X2xvY2suIFRoZSBjaGlwJ3MgTUNVDQpw
cm9jZXNzZXMgb25lIHJlZ2lzdGVyLWRyaXZlbiBjb21tYW5kIGF0IGEgdGltZSwgYW5kIG9wZXJh
dGlvbnMgc3VjaCBhcw0KaXNzdWluZyBhIGNvbW1hbmQgZm9sbG93ZWQgYnkgcG9sbGluZyBmb3Ig
Y29tcGxldGlvbiBtdXN0IG5vdCBiZQ0KaW50ZXJsZWF2ZWQuIFRoaXMgbG9jayBhbHNvIHNlcmlh
bGl6ZXMgQ0VDLCBJUlEvcG9sbGluZywgRURJRCBhbmQgZGVidWdmcw0KcGF0aHMgdGhhdCBkbyBu
b3QgcnVuIHVuZGVyIHRoZSBjb250cm9sL3N0YXRlIGxvY2suDQoNClNob3VsZCBpdDY2MjVfbG9j
ayB0aGVyZWZvcmUgcmVtYWluIGFzIGEgc2VwYXJhdGUgTUNVIHRyYW5zYWN0aW9uIGxvY2ssIHdp
dGgNCnRoZSBjb250cm9sL3N0YXRlIGxvY2sgYWNxdWlyZWQgZmlyc3Qgd2hlbmV2ZXIgYm90aCBs
b2NrcyBhcmUgbmVlZGVkPw0KDQpSZWdhcmRzLA0KSGVybWVzDQo=
