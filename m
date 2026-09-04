Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138241D624;
	Fri,  4 Sep 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512855; cv=none; b=Jpi9YCI4+h21uBbM+wNqZrsbEG/S3NiWWFnvL/TbE2eWBJ0A8e0zq7ovcGcKSK7bh8S/oEgecjngYd08lvOO/d8wKNl7flRcatLpz1Vm3QGcdLTQA68I9z+QpB7SWcx7ExCHpqnLmDzGQB+uSffxYLrgKyEDrl2b/QImSNvTgB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512855; c=relaxed/simple;
	bh=7MoKXvC6968eejIFP7iCwt2T4ExB49oBcRo4K3eSCKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VQA6bIX5btUOUWgvsD0ve/oeiwrFwiRUY0bOH9YL0dsbK1sBGGpFH99jyY91pY/QufpxTnmbB4T6yjScjta7I72BfteL2uszV5+3tGLIA0Rz0MbILhCwgoxCRqjVKLuMHvWLOcgyQKzH9RioMTeLbwrdsXm6RkC7VUT5U6uq4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=SQpqb2Sr; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="SQpqb2Sr"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1788512853; x=1820048853;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7MoKXvC6968eejIFP7iCwt2T4ExB49oBcRo4K3eSCKI=;
  b=SQpqb2SrCHPDa/2N0vswPvg7qoh8RZ9wvoflb1GS955sFMxnn3SzmYKn
   J7KasPS4shFrh8l33h+zhTKIQEbs6Qbhg31Aqy00Htq0OC0pBSFZnO2ku
   TeR8q0DvyM0Ys/V6gGwZq9jEct/WxAVm1Lt3X+IPoS1FmcCYgsvJ0WPRT
   E=;
X-CSE-ConnectionGUID: uJTRJ/DhRNev+wUkTRcQKg==
X-CSE-MsgGUID: 9jXa/FKoS4qX45ndJbitBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="145631225"
X-IronPort-AV: E=Sophos;i="6.25,260,1779141600"; 
   d="scan'208";a="145631225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:07:25 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 11:07:24 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Fri, 4 Sep 2026 11:07:24 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Topic: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Index: AQHdOvyPDTQdnozUAk+qARRuXX3Ydba+Hwgw
Date: Fri, 4 Sep 2026 09:07:24 +0000
Message-ID: <a6f90df0e0f742ddbbaea48ec5c0cc59@infineon.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
 <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
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

SGkgTWlxdWVsLA0KDQo+IFRoZXJlIGlzIGFuIElEIGNvbGxpc2lvbiB3aXRoIHRoZSBjaGlwIG9m
IHNhbWUgZGVuc2l0eSBmcm9tIHRoZSBKVg0KPiBmYW1pbHkuIEJvdGggY2hpcHMgYXJlIHZlcnkg
c2ltaWxhciBpbiBwcmFjdGljZSwgaXQgaXMgbW9zdGx5IGEgbWF0dGVyDQo+IG9mIGVsZWN0cmlj
YWwgZGlmZmVyZW5jZXMgKG1vc3RseSBwb3dlciBjb25zdW1wdGlvbiBiZWluZyBsb3dlcikuDQo+
IA0KPiBBcyBhIHNpZ25pZmljYW50IGRpZmZlcmVuY2UsIFJWIGNoaXBzIGlkZW50aWZ5IHRoZW1z
ZWx2ZXMgYXMgc3VwcG9ydGluZw0KPiB0aGUgbmV3IFNGRFAgKHJldiBGKSBmaWVsZCB3aGljaCBm
b3JjZXMgYW4gYWx0ZXJuYXRlIHdyaXRlIFNSMg0KPiBvcGNvZGUgKDB4MzEpLg0KPiANCj4gVGhp
cyBkZW5zaXR5IHdyb25seSBhZHZlcnRpemVzIGl0cyBzaXplIGFuZCByZXF1aXJlcyBhIGZpeHVw
IGZvcg0KDQpUeXBvPyAnd3JvbmdseScNClNhbWUgaW4gcGF0Y2ggIzIwLg0KDQo+IFsuLi5dDQo+
ICsgbXRkX2RlYnVnIGluZm8gL2Rldi9tdGQwDQo+IG10ZC50eXBlID0gTVREX05PUkZMQVNIDQo+
IG10ZC5mbGFncyA9IE1URF9DQVBfTk9SRkxBU0gNCj4gbXRkLnNpemUgPSA4Mzg4NjA4ICg4TSkN
Cg0KSXMgbXRkMCBhIDhNQiBwYXJ0aXRpb24/DQoNClRoYW5rcywNClRha2FoaXJvDQoNCg==
