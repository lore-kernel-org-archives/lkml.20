Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785343F4A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452848; cv=none; b=njw5zh3GFstQFysDPNz9YMLaA7xaigw4Lemrc/t7+LD4N8v2905ZKwKSTrJ5upxdIwKs4yl9leK/OpopT8PRs0UmqYdIYRWthidD1RpPN5rOhiH/ztUYfOSZu2/94/f17ZHJqAbtK1AmQRRDg6NQ8JH5jTY04rlD7qC6QcPM9kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452848; c=relaxed/simple;
	bh=Iozr+iVqFM+0mU78oV100tjTbmjOLgKxjCBYX13fizk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GxW9BX5PJyKrvJn6/yTO9SLujuI6kSb5WwfDSakbofKI9DTYiCRUzzYtOten/5rjEqA2GDgFNsku3y51Z5qe32VRETUSrFl39C7BrOCTyI1uCRrHLziuCeVihuQAVdE7aLKTgtPBHCN+wyDnL7g/DZx+E1OqHsPDV2a3/hJ1pQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=SGBSp3UC; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="SGBSp3UC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1789452847; x=1820988847;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Iozr+iVqFM+0mU78oV100tjTbmjOLgKxjCBYX13fizk=;
  b=SGBSp3UCtYKTaCAr1XWo3xu0xDYunmIdLzusfDyr7UzfsHI1SXhzx57Z
   1mu0h8bBGTMS4M1rHZnuEhbYdHQzJAHNvp22KyR1X2bdVCj+jXH6pXuGK
   jVvCHgllg6z7TUu7r7CgmpQIrkT2GcMOukkxPRrlXFw0i+MT6BSi3ssRQ
   g=;
X-CSE-ConnectionGUID: qnCh4kfCRdWxKBR6gOLfgA==
X-CSE-MsgGUID: pFN8NOrMQ4OYyqrW4l8tIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="147058621"
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; 
   d="scan'208";a="147058621"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:13:58 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 08:13:57 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 08:13:57 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Tue, 15 Sep 2026 08:13:57 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>,
	<alex@sverdlin.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Topic: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Index: AQHdRASdQI/rAfbWgkienan9hYKZEbbNfGoAgAAmnTCAAAyXAIABdAOQ
Date: Tue, 15 Sep 2026 06:13:57 +0000
Message-ID: <e15daee278f346cd8dae030e2409445e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
 <fb4398e88939472eaa86cdc098a3d265@infineon.com>
 <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
In-Reply-To: <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
Accept-Language: en-US
Content-Language: en-US
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

SGkgTWljaGFlbCwNCg0KPiBIaSBUYWthaGlybywNCj4gDQo+IE9uIE1vbiBTZXAgMTQsIDIwMjYg
YXQgOToxMSBBTSBDRVNULCBUYWthaGlyby5LdXdhbm8gd3JvdGU6DQo+ID4gSGkgTWljaGFlbCwN
Cj4gPg0KPiA+PiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDY6NTAgQU0gQ0VTVCwgVGFrYWhpcm8g
S3V3YW5vIHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPj4gPiBGcm9tOiBUYWthaGlybyBLdXdhbm8g
PHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQo+ID4+ID4NCj4gPj4gPiBzMjVmczI1NnMx
IGhhcyBpbmNvcnJlY3QgU0ZEUCBlbnRyaWVzLCBsaWtlIHMyNWZzNTEycyBhbmQgczI1ZnMxMjhz
MS4NCj4gPj4gPiBBc3NpZ24gdGhlIGNvbW1vbiBzMjVmc19zX25vcl9maXh1cHMgdG8gczI1ZnMy
NTZzMSB0byBmaXggaXRzIHBhZ2Ugc2l6ZQ0KPiA+PiA+IGFuZCBzZWN0b3IgbWFwLg0KPiA+Pg0K
PiA+PiBEbyB5b3UgaGF2ZSBhbiBTRkRQIGR1bXAgYnkgY2hhbmNlPyBJIGhhdmVuJ3QgZm91bmQg
b25lIG9uIHRoZSBsaXN0DQo+ID4+IGZvciB0aGlzIGZsYXNoLg0KPiA+Pg0KPiA+DQo+ID4gWWVz
LCBidXQgcGFyYW0gdGFibGVzIGFyZSBsb2NhdGVkIGJleW9uZCBQQUdFX1NJWkUoMTAwMGgpLi4u
DQo+IA0KPiBDb3VsZCB5b3UgdGVzdCB0aGUgZm9sbG93aW5nIHBhdGNoIGlmIHRoYXQgaGVscHM/
DQo+IA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3N5c2ZzLmMNCj4gKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9zeXNmcy5jDQo+IEBAIC05OSwxMCArOTksMjYgQEAgc3RhdGljIHVtb2Rl
X3Qgc3BpX25vcl9zeXNmc19pc19iaW5fdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwNCj4g
IAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgc2l6ZV90IHNwaV9ub3Jfc3lzZnNfYmlu
X3NpemUoc3RydWN0IGtvYmplY3QgKmtvYmosIGNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICph
dHRyLCBpbnQgbikNCj4gK3sNCj4gKwlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpID0gdG9fc3BpX2Rl
dmljZShrb2JqX3RvX2Rldihrb2JqKSk7DQo+ICsJc3RydWN0IHNwaV9tZW0gKnNwaW1lbSA9IHNw
aV9nZXRfZHJ2ZGF0YShzcGkpOw0KPiArCXN0cnVjdCBzcGlfbm9yICpub3IgPSBzcGlfbWVtX2dl
dF9kcnZkYXRhKHNwaW1lbSk7DQo+ICsJc3RydWN0IHNmZHAgKnNmZHAgPSBub3ItPnNmZHA7DQo+
ICsJc2l6ZV90IHNmZHBfc2l6ZSA9IHNmZHAtPm51bV9kd29yZHMgKiBzaXplb2YoKnNmZHAtPmR3
b3Jkcyk7DQo+ICsNCj4gKwlpZiAoYXR0ciA9PSAmYmluX2F0dHJfc2ZkcCkNCj4gKwkJcmV0dXJu
IHNmZHBfc2l6ZTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICsNCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIHNwaV9ub3Jfc3lzZnNfZ3JvdXAgPSB7DQo+
ICAJLm5hbWUJCT0gInNwaS1ub3IiLA0KPiAgCS5pc192aXNpYmxlCT0gc3BpX25vcl9zeXNmc19p
c192aXNpYmxlLA0KPiAgCS5pc19iaW5fdmlzaWJsZQk9IHNwaV9ub3Jfc3lzZnNfaXNfYmluX3Zp
c2libGUsDQo+ICsJLmJpbl9zaXplCT0gc3BpX25vcl9zeXNmc19iaW5fc2l6ZSwNCj4gIAkuYXR0
cnMJCT0gc3BpX25vcl9zeXNmc19lbnRyaWVzLA0KPiAgCS5iaW5fYXR0cnMJPSBzcGlfbm9yX3N5
c2ZzX2Jpbl9lbnRyaWVzLA0KPiAgfTsNCg0KVGhpcyBkaWRuJ3QgaGVscCBhcyBTRkRQIGNhY2hl
IHNpemUgaXMgdHJ1bmNhdGVkIHRvIFBBR0VfU0laRSBpbiBzZmRwLmM6DQoNCgkvKg0KCSAqIExp
bWl0IHRoZSB0b3RhbCBzaXplIHRvIGEgcmVhc29uYWJsZSB2YWx1ZSB0byBhdm9pZCBhbGxvY2F0
aW5nIHRvbw0KCSAqIG11Y2ggbWVtb3J5IGp1c3Qgb2YgYmVjYXVzZSB0aGUgZmxhc2ggcmV0dXJu
ZWQgc29tZSBpbnNhbmUgdmFsdWVzLg0KCSAqLw0KCWlmIChzZmRwX3NpemUgPiBQQUdFX1NJWkUp
IHsNCgkJZGV2X2RiZyhkZXYsICJTRkRQIGRhdGEgKCV6dSkgdG9vIGJpZywgdHJ1bmNhdGluZ1xu
IiwNCgkJCSBzZmRwX3NpemUpOw0KCQlzZmRwX3NpemUgPSBQQUdFX1NJWkU7DQoJfQ0KDQpXaXRo
IHNraXBwaW5nIGFib3ZlIHBhcnQsDQoNCnp5bnE+IGhleGR1bXAgL3N5cy9idXMvc3BpL2Rldmlj
ZXMvc3BpMC4wL3NwaS1ub3Ivc2ZkcA0KMDAwMDAwMCA0NjUzIDUwNDQgMDEwNiBmZjA1IDAwMDAg
MDkwMSAxMDkwIGZmMDANCjAwMDAwMTAgMDUwMCAxMDAxIDEwOTAgZmYwMCAwNjAwIDEwMDEgMTA5
MCBmZjAwDQowMDAwMDIwIDAwODEgMWEwMSAxMGQ4IGZmMDAgMDA4NCAwMjAxIDEwZDAgZmYwMA0K
MDAwMDAzMCAwMTAxIDUwMDEgMTAwMCAwMTAwIGZmZmYgZmZmZiBmZmZmIGZmZmYNCjAwMDAwNDAg
ZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmDQoqDQowMDAxMDAwIDAyMDEg
NGQxOSA4MTAxIDMwMzAgZmY4NCBmZmZmIGZmZmYgZmZmZg0KMDAwMTAxMCA1MjUxIDAyNTkgNDAw
MCA1MzAwIDUxNDYgMTcwMCAwMDE5IDA5MDANCjAwMDEwMjAgMDgwOSAwMjExIDA1MDIgMTkwMyAw
MTAyIDAwMDggMDcwMyAxMDAwDQowMDAxMDMwIDAwMDAgODAwMCBmZTAwIDAwMDEgZmYwMSBmZmZm
IGZmZmYgZmZmZg0KMDAwMTA0MCA1MjUwIDMxNDkgMjEzMyAwMTAyIDA4MDAgMDEwMCAwMDAzIDA3
MDANCjAwMDEwNTAgNDEwMSA1NDRjIDMwMzIgMTAwMCAzMjUzIDQ2MzUgMzI1MyAzNjM1DQowMDAx
MDYwIGZmNTMgZmZmZiBmZmZmIDMwMzAgMDE4MCA4NGViIDc1MDggN2EyOA0KMDAwMTA3MCA3NTY0
IDdhMjggODg2NCAwYTA0IDAwMDEgOGMwMSA5NjA2IDIzMDENCjAwMDEwODAgMjMwMCBmMDAwIGZm
MDkgZmZmZiBmZmZmIGZmZmYgZmZmZiBiMGE1DQowMDAxMDkwIGZmZTcgZmZiMiBmZmZmIDBmZmYg
ZWI0OCBmZmZmIGZmZmYgYmI4OA0KMDAwMTBhMCBmZmZlIGZmZmYgZmZmZiBmZmZmIGZmZmYgZWI0
OCAyMDBjIGQ4MTANCjAwMDEwYjAgZDgxMiBmZjAwIDcyZTIgZmYxZCAyNjkxIGRkMDcgODNlYyA0
NDE4DQowMDAxMGMwIDg1OGEgNzU3YSBiZGY3IDVjZDUgZjY4YyBmZjVkIDMwZjAgYTFmOA0KMDAw
MTBkMCA4ZTZiIGZmZmYgZGMyMSBmZmRjIDY1ZmMgMDhmZiAwMDA0IDAwMDANCjAwMDEwZTAgNjVm
YyAwNGZmIDAwMDIgMDAwMCA2NWZkIDAyZmYgMDAwNCAwMDAwDQowMDAxMGYwIDAwZmUgZmYwMiA3
ZmYxIDAwMDAgN2ZmMiAwMDAwIGZmZjIgMDFmZQ0KMDAwMTEwMCAwMmZlIGZmMDIgZmZmMiAwMWZl
IDdmZjIgMDAwMCA3ZmYxIDAwMDANCjAwMDExMTAgMDFmZSBmZjAyIDdmZjEgMDAwMCA3ZmY0IDAw
MDMgZmZmNCAwMWZiDQowMDAxMTIwIDAzZmUgZmYwMiBmZmY0IDAxZmIgN2ZmNCAwMDAzIDdmZjEg
MDAwMA0KMDAwMTEzMCAwNGZlIGZmMDAgZmZmMiAwMWZmIDA1ZmYgZmYwMCBmZmY0IDAxZmYNCjAw
MDExNDANCg0KVGhhbmtzLA0KVGFrYWhpcm8NCg0K
