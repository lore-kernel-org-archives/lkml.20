Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023119.outbound.protection.outlook.com [40.107.44.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2448665E;
	Mon, 12 Oct 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807443; cv=fail; b=YNqdGQBejyMqqJWoGj0nNpXwqbnhs9V/6Q7FDOLB4uM+pnS6skK8rC9pPiHQC7GgzqdKJkbcvqEyqLEsLphgoqup8UoVI+dUpub/cQwNcf+LLfYQENJJEMaB0fjVzIRlpUehRLhjG/sHjYKIoATa5swS/+2NDYcA7GXiKvUlJ2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807443; c=relaxed/simple;
	bh=/zsuF0dFsXiOeYHLwF8nmoMjSEdbx05Zqeoht4VcOOo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QKZ/DeUoHh4+dBmOzVXlOT/YqlR54jl2VP+H5n+TBAz4zAINZrPzedQwzt9ibYBJ9GdwNRMx75GUYdglBXuZ7zHcedWdjFtC/T2TsbeWHqqEDTN7BAWD8LNXs//tWs990aui+CbqJVY+aIlHOMP/UmrjwPq3m8jDlVtp273IEdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=lpTsRVAR; arc=fail smtp.client-ip=40.107.44.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="lpTsRVAR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyV8BPCyZ2pw7eV+2hcUJM0YyUU86gs4x8HzNhZxn94FvxK9Y69JxeO4pIbaoGBqcxCc2uTVGEkbEOkobkpAFiqre7gJ3wmMh7u0+pu/hYeufFTOGDtfiqtVZvdV0npjNix1gKcjFgRYXm0Aai0I6VSYe7A3MV+TMDrldkh4wxteD+rFVslGyImNsRFxRQnEopb5aazTKLTAS7ndi+TVqZQnMhV3oa++0PjXKlGqJHjKKbUCsfN64q/RCc5xul195WqrufkjUolrQC9I/8tyw1o3WVyLR+ANDfvppawxyHK77YkeLLeyfLUcl1U79TTM/cFrd0k+Gb7R2lhFRLCG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBn9xMEd7nl4v8mIBfhuQucdIoRf1k4cWjKiIqvp+8M=;
 b=cwCYHXEm5S20V4KBES3HF9/bdpJcdLONRkIhEhfuiST86Qb00b0+aaXj4fGohO//0qEDP07aMqPSBGMpfBGxX4aYdcRjFbomdJRHIwRrzZk0jjRdzaREGyjipRlHL5FYnSY8Kvy35K4ZpI7vLXuIiUP3eta9qhG7uzIMnx/P3LDMQSLXU4x7qhe7/qaLoqthEZd+PYR5OfFHvyylH5VNhUh/SDy6H3JbTNI9NbMTdauHppJvEa25PPwMWjKFpVNfKoR2IarAnl+JqUd+F3oucrBk6mBU3TPZLPFrnEiMkOSqktnsQ7vI5SHK8YL5FEg7ZlaQOXpKEVYCINZQtEzIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBn9xMEd7nl4v8mIBfhuQucdIoRf1k4cWjKiIqvp+8M=;
 b=lpTsRVARhkyKmJjOvhEwoSGbdsvQ2HF4A0du70PFDKbo3nkZnFnY3Rn0NKme8K/XhfY5nmXu0eQYgPVTS1LsG6xS/GKOT3/PIjiA3lJGGIctmL8kCSBFfnk34MgumT51/nmpk6Allj0u4HI1Rexs8Y0recus8rt40O+dDyx4rALYj0oDdNFInqpThZBcH/ovxR00T6BRXsW1idIG7GD/O6YvWUyAcJh9b1f7uziugXOLwnZbxsTcIr9/d9T87KefO7uKUhSi1zM3Q/YFOdIRc4a5QvzTwtmLqlKu3ya4XO3u9/qobjHtsGjkUaUBBhevLeG5e/8xtM1AKZJn5KrvHQ==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by TY2PPF1753F85B8.apcprd01.prod.exchangelabs.com
 (2603:1096:408::389) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:17:18 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:17:17 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "broonie@kernel.org" <broonie@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH v2 0/1] Enable audio on UNIHIKER M10 V1.2
Thread-Topic: [PATCH v2 0/1] Enable audio on UNIHIKER M10 V1.2
Thread-Index: AQHdWkOfvy0wg5W0UEG0uss1FK2C2g==
Date: Mon, 12 Oct 2026 12:17:17 +0000
Message-ID: <20261012121709.53418-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|TY2PPF1753F85B8:EE_
x-ms-office365-filtering-correlation-id: 3df6c7bc-ff8f-418e-dd06-08df285ac1be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|38070700021|56012099006|261009223027099003|10067099003|18002099003;
x-microsoft-antispam-message-info:
 5rGTkNlJqb7P7oqGx2o5/7c/yriBqcNAfJpCPaupVQCsxx/rS1ruEmdDkA0GC1xH2NOWJJeM8+LUTzuF+B5B38l2HmhTPDyvKrgQeFLpd0V5pZCtPXoZ0R4oBCqpOaBmMc5KBd85MonK641t3DaAY4Ywna/sYrSX2d1xqzbmxBe/9xEVQYcHFVwEYm1hBgtsyupEqEXZUsETG5lSQi2rnDmPlzn4ahIZCcmuNs3TQsxUomYQr/NXmu0mJkRIG1O9R38HBB2/wGRa/iJCGTekfsGtDPJFGcBIMP7+wfaOPqEuqzsDsPOh/dkbG2alEA3OKC9doO1n5r0LLAdLhUVlGgjOmMgRUoZYnRs/fNA4eyUkF7PxEJNcegD9gtT7+lnIzeP+2pmIRDqX016PRiQU+wslfBSkCPTEM9cr7OLK6hfCAC8lcX9fpN9IXMK20yVlCn9V9rbk/0bqZNTPoehn+t5AY3HQI+GFLv9fba6vJ8GgYZJvz7B9jJHsf8SkKXoozkj5+Ss/3rsSAfEfJLpfxjt33SSLxsHGmNi9mDRfdGA7X3+sRGP3fS2Gl/K5vBQH9yELnFIoXq6y7l7WubjXyeOX7CFxmTBl581b2pFfibo7y/jQ96upBQkk44TdhDk3HpEJNfy1/duc474/U4y0p88AXS/2XeWJeW3gDaF0CzrKnEXTH5qBR1+muYx3Qq6iJtEZ942w0yyQf+WQ4Q2m0g2OxD86NYEeyuvm4G0ySTo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(38070700021)(56012099006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EsOJA4xLhSHU2l48HSyePjF2ZLjpZBc2WhkWkyig4kajLtv8L7rHiHfNyV?=
 =?iso-8859-1?Q?MpWlcmL+BVDp+zhLuELBMXvKHXMICACMVH2eBSmmaTTp6ToF4apZc4KQ2z?=
 =?iso-8859-1?Q?MX3r42XcXIqzbhQ1mWEiYdM3Ujt7KMP5jYOsxYo650DyK/kpL/P5JIdpjD?=
 =?iso-8859-1?Q?uQGIf9/c6L5Moi+d3ARkmG9d+xWzhdrwJGR7fMXpwD2mZmoi6U/2bk+1co?=
 =?iso-8859-1?Q?cdUwCeMF4LZ2jDRYDErODtM8RjZ6/DNJlNLEzdG1FRGhm1AT+ROwWj+qi2?=
 =?iso-8859-1?Q?lWdjJB3Fp0HXAbszNy77fZD1fdrgd3SVTZ7zJg9PxzVz5ukJuNQU9AzFy0?=
 =?iso-8859-1?Q?LR/7o0c5t7qIfS4A9/qlwex5YOfEqebMp0Pm5vdUUJ/CGg/Fxnk2uT9P8t?=
 =?iso-8859-1?Q?0+XgWBJ/sBjeibcOR5RYMyUO3SE06cmPvz+zx5xVK2uIvCgamcgIXL3Xx8?=
 =?iso-8859-1?Q?ItYGMQ7M7wxg63BLjk06aFkEw7b0DbZywwoadi+escXdLzOITVxhKaAkDn?=
 =?iso-8859-1?Q?rIgYrytW8hNdYUQKm+WxiguWTrEsZu0tAjIABAnqIEDom4eDRD80uCblTf?=
 =?iso-8859-1?Q?Wm4PgqcM7XDxVZ2KzSxhlek4V0Ehiy4g28eX+WLY5k1mgdNULlF51dIQ1G?=
 =?iso-8859-1?Q?L7cioGC7tARd0mHlYv+ucwEWu2nCWNxywj1ylo9DRUpb80XWk1shQMBpr8?=
 =?iso-8859-1?Q?1rHXkUgUnTHzgeux5XYy4bQx6/DvYmfMzG4ucgWtgdOWKcVOvZ69pTWbFa?=
 =?iso-8859-1?Q?kr88Eg3zyWJ6EE/dPjXbksXo5wtVTHWu03nhBNeDwPo7kKFX/H9+SbfcYt?=
 =?iso-8859-1?Q?wPaZOXm7MS52aDBzcEK37yNNKIV9KdG9Zqsgbj8w6HSNJJXCcfeM/50wcQ?=
 =?iso-8859-1?Q?FT1EuhKkacHBoz2OGw7vLb5LXdPNp7Qsncazy/UR3eCSos5L6Y7V6B2ki+?=
 =?iso-8859-1?Q?KJC7w6gXTsrFQukT+DPOcWPQeA9NOxqbu+KsTEUlulLfdvkdylPAav9Fb/?=
 =?iso-8859-1?Q?7uYnsZPlsq2wMaBOpQ7I/X7LSsmnU5kBUYFTTW9gJfzqZqBxnbAxYnyQ0E?=
 =?iso-8859-1?Q?trr4oBpA4twYRDI+ML0/rReZ2bzifI8cC3X9iBS4ENTztka/w5fOt/CgC3?=
 =?iso-8859-1?Q?WMDzKjX3rYwbAWlOW1InSWC8ob/L5HESNAsP556u4y0yCcYI1J+9Tyhsoe?=
 =?iso-8859-1?Q?3ABs1S+fcKjQZdRXor6v9VCII+WSTKpwPtUSkLmaouvGFiOpvPLXvXCtOR?=
 =?iso-8859-1?Q?NWrGiAOrqTeJyU/PNWcDMWVOqBbwvtrTLyhWMmnOqGgn2xba207e+WnjiM?=
 =?iso-8859-1?Q?+rqOtNuksl/+MkodL1lS46t34kC0n9cCgc8TB9QKIW0GF/wJnYNR/cNapn?=
 =?iso-8859-1?Q?pdpVY2RW+/tFEPkG1neweFZPPBP8Gn/Bhc/9cVfXvpqVoa0GCXXVhkTnP4?=
 =?iso-8859-1?Q?wj4ZncBbKPUvbSAhVSX9OtE6mUN1+Zc2kNWWcjBLWXV8dGPfeIOTs0cTx5?=
 =?iso-8859-1?Q?aHyFhDwkPH4jwtwhdmC/wusvwb4MwGdSLvR6lqd8ieWY7/oK7G7IZ4Zw66?=
 =?iso-8859-1?Q?ldXs407FOpnC5mEYK602yyuH1JmS6L1h1/u/6J5giN4zV8QkKalZZ18mUb?=
 =?iso-8859-1?Q?0ZeQ1m4T9mH+ScOCTCE5FpZDyKfi5ZlKvkJ43Zevea5YP/sstWWdpW9P5o?=
 =?iso-8859-1?Q?o7jyMmD1tHg0sXNPRmScfM7HNOoBZTeBB/6jxqiMYjiNq1VLJcor7Ex7Nj?=
 =?iso-8859-1?Q?2E1QR6u275UtYv5abpdpnyZGqwtmSeI0wvDi+pJxgKrN38?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR01MB8186.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df6c7bc-ff8f-418e-dd06-08df285ac1be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 12:17:17.2059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfvzRGymbUhdEdy8K3MqkRuhRTAmikOb3HjFaRgqZ3ucmKJiNRY2Ol/w+tX719MFyTlhd+8bpCtKPXlbl8d8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF1753F85B8

Enable the internal codec, I2S2 and onboard microphone route. The board=0A=
uses codec revision B; that driver support is already accepted in the=0A=
ASoC for-7.4 tree as commit 157f7cba77a9. It is a runtime dependency,=0A=
not a change to the existing codec binding.=0A=
=0A=
Changes since v1:=0A=
- Normalize author/sender identity and preserve it in the patch body.=0A=
- Recheck ordinary and strict checkpatch in the actual Git repository.=0A=
=0A=
Mizuno Miotsuki (1):=0A=
  arm64: dts: rockchip: Enable audio on DFRobot UNIHIKER M10 V1.2=0A=
=0A=
 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 30 +++++++++++++++++++=0A=
 1 file changed, 30 insertions(+)=0A=
=0A=
=0A=
base-commit: ae965b9856f033145e292b0c29082a26bcc45efd=0A=
-- =0A=
2.56.0=0A=
=0A=
