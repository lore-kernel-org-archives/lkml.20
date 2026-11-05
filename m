Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.10.52.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853851;
	b=z8f5VoIRyG/ucS42RAhMYARz+q64URV8Z6eEGFgjtFZUDoFrrnKjzXdP2tSzgiPo5vp0
	 tXu/+JbCoM23fOZhVHYdlGy8MhNofHla5ErVcT9lkBnW0UQR5V3apJWFxlevWaG1EK0eW
	 CX8PX9gCQO5tI11AtTzGdP0amRwAJutQqfD2SFc2jCBZQL1htuit/ygb7/mSXlPqh6Zb+
	 F4U8MWtfLzpZ4qNmQArKPY30FNUNAYbmvt8dB2ht19+pVuJ7h/S5sRMpk5w7H9Gu52Tr/
	 F8g8CnKlGFEPhfmsLDn9Bbg2qlJ59JvgTaNYwLkRtQ/itKQgHOXoyTgL4po9m12CI1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:X-Amp-Result:Received:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OLY+fK2buOemUlO1Z0CivAmC0sQIYBL6KveaXnqAsLg=;
	b=a0Ybqkqs0IKUjQoLDgCrM/87MjwBt33LHMH40zLOVCJsXUUgjFKmvPlQK0CnIjA36O+R
	 rcuI0EjuG3XRKu0WZ2zLUlTgOHOz/KbrnkyETlao3crWqi8xYjqtfsg1mJ53EG22Tp0Dr
	 IlDffJTlnEoDzD2IEltUIEpamZIJJxj7cmDnR5XdxKARkIkNmAVNKnb8UKz4ZkYx59617
	 vbPS4StV/Hne+aSNX7mdk0i5rnmaFWLy5+K+etMAjMT+/ldjQ+jUYfa6Dy37AYySKmddH
	 suKhmHRGXpyYG/3iIghK1zTYEy50P530kVIXrcXoZ9QxLtuurOMauDSoUEDqZiWVqqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infineon.com;
	spf=pass smtp.mailfrom=infineon.com;
	dkim=pass header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Q9cb7FPn;
	arc=none smtp.remote-ip=217.10.52.204
Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7485606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7485606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Q9cb7FPn
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1793853851; x=1825389851;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OLY+fK2buOemUlO1Z0CivAmC0sQIYBL6KveaXnqAsLg=;
  b=Q9cb7FPnMSiZHWa7M31BvtWisA5DRLnWA3ywEUMPVy3Nd1bFbippyCXF
   jZftHdNkyKHj3uwznPaAwIOFYys+X+f7fh1sQGe0GIYONcPW/Mdzgxpd2
   Z6mdD5s5ryK6PUmhvuQAieuU+RrtNb6NS9JIYngfIaaiFurCYAPqxfAri
   Y=;
X-CSE-ConnectionGUID: Ugs3KXr0SXOtj5jyI359hQ==
X-CSE-MsgGUID: 2JryHZ1IRoCRR9jOD8PPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="116531502"
X-IronPort-AV: E=Sophos;i="6.27,196,1787004000"; 
   d="scan'208";a="116531502"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 05:44:02 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 05:44:02 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE815.infineon.com
 (172.23.29.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 05:44:02 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 5 Nov 2026 05:44:02 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <nuno.sa@analog.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
Subject: RE: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Thread-Topic: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Thread-Index: AQHdasSUzP6S2xaSGUGYHgMvhOFISrce4XNA
Date: Thu, 5 Nov 2026 04:44:01 +0000
Message-ID: <0cbfb61d062b437b8e860a9c93b13e4d@infineon.com>
References: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
In-Reply-To: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
Accept-Language: en-US
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

SGksDQoNCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRywgYSAxIEdiaXQgKDEy
OCBNaUIpIG9jdGFsIE5PUiBmbGFzaC4NCj4gVGhlIHBhcnQgaXMgZnVsbHkgZGVzY3JpYmVkIGJ5
IFNGRFAsIHNvIG9ubHkgdGhlIGZsYXNoIElEIGFuZCBhIHNtYWxsDQo+IHBvc3RfYmZwdCBmaXh1
cCBhcmUgbmVlZGVkLg0KPiANCj4gV1JJVEUgU1RBVFVTIFJFR0lTVEVSICgwMWgpIHRha2VzIGEg
c2luZ2xlIGRhdGEgYnl0ZSBhbmQgb25seSBhZmZlY3RzDQo+IHN0YXR1cyByZWdpc3RlciBiaXRz
IDc6Miwgc28gdGhlIGRlZmF1bHQgMTYtYml0IFdyaXRlIFN0YXR1cyBhc3N1bXB0aW9uDQo+IGRv
ZXMgbm90IGhvbGQuIENsZWFyIHdyaXRlX3NyMV9hbmRfc3IyIHNvIHRoYXQgdGhlIHNpbmdsZSBi
eXRlIHdyaXRlX3NyMQ0KPiBwYXRoIGlzIHRha2VuOyB3cml0ZV9zcjEgaXMgYWxyZWFkeSBzZXQg
dG8gMDFoIGJ5IHRoZSBCRlBUIHBhcnNpbmcuDQo+IA0KPiBUaGUgZmxhc2ggYWxzbyBoYXMgbm8g
U3RhdHVzIFJlZ2lzdGVyIDIuIENvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGFyZSByZWFkDQo+IHdp
dGggQjVoLzg1aCBhbmQgd3JpdHRlbiB3aXRoIEIxaC84MWgsIGFuZCB0aGUgMzVoIFJlYWQgQ29u
ZmlndXJhdGlvbg0KPiBSZWdpc3RlciBjb21tYW5kIGRvZXMgbm90IGV4aXN0LCBzbyBjbGVhciBy
ZWFkX3NyMiBhcyB3ZWxsLg0KPiANCj4gU29mdHdhcmUgd3JpdGUgcHJvdGVjdGlvbiBpcyBkb25l
IHRocm91Z2ggdGhlIGJsb2NrIHByb3RlY3QgYml0cyBpbiB0aGUNCj4gc3RhdHVzIHJlZ2lzdGVy
OiBCUDAtQlAyIGF0IGJpdHMgNDoyLCBCUDMgYXQgYml0IDYgYW5kIGEgVG9wL0JvdHRvbSBiaXQg
YXQNCj4gYml0IDUsIHdoaWNoIGlzIGV4YWN0bHkgd2hhdCBTUElfTk9SX0hBU19MT0NLLCBTUElf
Tk9SXzRCSVRfQlAsDQo+IFNQSV9OT1JfQlAzX1NSX0JJVDYgYW5kIFNQSV9OT1JfSEFTX1RCIGRl
c2NyaWJlLCBzbyBzZXQgdGhvc2UgZmxhZ3MgdG8gZ2V0DQo+IHRoZSBnZW5lcmljIGxvY2tpbmcg
c3VwcG9ydC4NCj4gDQo+IE5vdGUgdGhhdCBnaXZlbiB0aGF0IHRoZSBGbGFnIFN0YXR1cyBSZWdp
c3RlciAoRlNSKSBoYW5kbGluZyBpcyB0aGUgc2FtZQ0KPiBhcyBpbiBzb21lIG1pY3JvbiBkZXZp
Y2VzLCB3ZXJlJ3JlIGFkZGluZyB0aGUgaXNzaSBjaGlwIGRpcmVjdGx5IG9uIHRoZQ0KPiBtaWNy
b24tc3QgZHJpdmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4NCg0KUGxlYXNlIGFkZCBMaW5rOiB0YWcgYXMgTWljaGFlbCBtZW50aW9uZWQgaW4g
WzFdLg0KDQpbLi4uXQ0KDQo+IEBAIC02NTUsNiArNjgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzcGlfbm9yX2ZpeHVwcyBtaWNyb25fc3Rfbm9yX2ZpeHVwcyA9IHsNCj4gDQo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXAgbWljcm9uX2ZpeHVwc1tdID0gew0KPiAgICAgICAg
IHsgLmZpeHVwcyA9ICZtaWNyb25fc3Rfbm9yX2ZpeHVwcyB9LA0KPiArICAgICAgIHsgLmlkID0g
U05PUl9JRCgweDlkLCAweDViLCAweDFiKSwgLmZpeHVwcyA9ICZpczI1d3gwMWdfZml4dXBzIH0s
DQoNClNhc2hpa28ncyBjb21tZW50IFsyXSBsb29rcyB2YWxpZCB0byBtZSBhcyB0aGlzIGNoaXAg
c3VwcG9ydHMgOEQtOEQtOEQuDQpDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29rPw0KDQpUaGFu
a3MsDQpUYWthaGlybw0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL0RM
RVRSUlZSVVdFUC4xVlUxRUhBUkQzTVNIQGtlcm5lbC5vcmcvDQpbMl0gaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTAyLW10ZC1zcGktbm9yLW5ldy1pc3NpLWNoaXAtdjMtMS1m
NWUzOGUyMDBmYzglNDBhbmFsb2cuY29tDQoNCg==
