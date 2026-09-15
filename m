Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013012.outbound.protection.outlook.com [52.101.127.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800184028C0;
	Tue, 15 Sep 2026 03:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442784; cv=fail; b=e89tF7B7Ah/qU66aPDJNd85zMkt/0zvo424b0xbcPZ2MgBIBOGGWA/bD6mW0sXk0rtx7P5oS7Ym/bTYvyZhyYSV928hPvDoqlATMTI5dV7uuKRm1v6CLjm7gt75mGYkbHMci49wIn0x/He9iuUMeyBZCuEGVCa98yWKXFnK4O3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442784; c=relaxed/simple;
	bh=bCbsJy3bEj2sCdQD8x8zml5TTfgeVQpi4nnljOOERfY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NJPzl0Faz8F2UppniH0SwfBlsxy0HjNFMIS38zaLYx8p//YcMVTM7bvUSy4ykd8V266FGGJBJzNihsBZSokb5s0WdxOB38FwUeAEJntFo6hopgB5Q1ZpX8OeL99Q07LrpmbKPF6fsT/ciCB+KAd4oNKvPxgSgdHBk8sCVLbtWOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cALErvFS; arc=fail smtp.client-ip=52.101.127.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cALErvFS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY2X1T2PS2ydkuoSgj2eNKJ4tpKtktnwyzxG4UXscGXKHyyB0VQAOJFoaYZcQLuUK22hqvmNuYomvYsxRZt6Bb6vNn3Ndf39nVcTXl9bG9qggQEFBIP6FWAT+Cd+JPh83MJFlskKrIASuHTXRZwkl6KqxuQ4/2qA7d2rxn3wmON/99r2XOLM+TtNvdJPMKSUSNCgr2nnF8+X0SrliWmruPASY/jExgyHiXoXl17AlVDdNGhyscXww+hzWxnZhkK3onRWF3alWL0fmExHTjBbJMbnOdYpMN07g80aO4UjSI0zagj4+H/inZdwrpoz1uBnMpt3un83jr6oFpMRSi8XmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCbsJy3bEj2sCdQD8x8zml5TTfgeVQpi4nnljOOERfY=;
 b=E6wsH3+fuSzAoVQe3e8xwC5SANVowVazR3OLkyfMft287YJconrguX9M2lBwKWT9aHgd/QH/QD9dq+hko1/eIHL4CixR3cm6EtyD6qxMArZ/PcZIjfoF7woY0Bq733JQv8TqAZgUFGVV+DDKI6PebeBNQD5YrPhutAUDEgkgpTV2hNlOQpDZ0m9ISnACLHqFc+PYs2lw8a3foVPFjP4I01lKM9qFAXX00NUBkmGNfR/2k+7b2cuKStoUYIa31ziJ34xBSIQaaMeMkBl7DCI6e5CmwKqCUwAlbU/EsIZMEARTZU/vodziTraV2QLGQifRoBOOHL1OtzBuq8qTbLcbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCbsJy3bEj2sCdQD8x8zml5TTfgeVQpi4nnljOOERfY=;
 b=cALErvFS2mhuNGwu8MIbj3VUB85OoGBAsqKL7GGiwrsfV0PsD0i+KTsUX58NlKLh20vv2h1Rmo7VlIdUaCOLt/8CGhFrTd4OhE8r47k+R9ZU93f2dREShWUS0JfM5vWSNlxdK8d3R4vBv6BlqIGtM9MIqQ2M8pCzq0Bb7nrKDweJNZX7IX/pY16AKmxm+Vvlk1qPLtp/L9Whtk4/TpGUdIsL10lV4jzePJXwyGGGmKZMOX3U67L/Awvwjw4i7dYGeloXzCBGZcFINZYnKEdtEJgf+h6b1IZsQoCBg3D01WjduF0hTUEt4wsby5/4yI1/Xbkg9ZEFezIyfMVngPkZFg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SE3PR06MB8358.apcprd06.prod.outlook.com (2603:1096:101:32b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 03:26:16 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 03:26:15 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Michal Pecio
	<michal.pecio@gmail.com>
CC: Selvarasu Ganesan <selvarasu.g@samsung.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "thiagu.r@samsung.com"
	<thiagu.r@samsung.com>
Subject:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0geGhjaTogc2lkZWJhbmQ6IGNoZWNr?=
 =?utf-8?B?IHZkZXYgbGl2ZW5lc3MgYmVmb3JlIHJlbW92aW5nIGVuZHBvaW50cyBvbiB1?=
 =?utf-8?Q?nregister?=
Thread-Topic:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5kOiBjaGVjayB2ZGV2IGxp?=
 =?utf-8?Q?veness_before_removing_endpoints_on_unregister?=
Thread-Index:
 AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADb5AIAABlEAgAAOSQCAAOQe8A==
Date: Tue, 15 Sep 2026 03:26:15 +0000
Message-ID:
 <TYUPR06MB6217720687E47CBA59F6703AD2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
 <20260912141837.06b2f3cf.michal.pecio@gmail.com>
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
 <852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
 <TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <6e2c9b03-4694-4f6b-8fc0-552c069de65f@linux.intel.com>
In-Reply-To: <6e2c9b03-4694-4f6b-8fc0-552c069de65f@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SE3PR06MB8358:EE_
x-ms-office365-filtering-correlation-id: 97a2f143-0a0d-4a4f-bdb8-08df12d919b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|366016|376014|1800799024|7416014|4143699003|6133799003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 kDEBhM634b21YFAymYBjnwJPVU2GwdCnO3IfjMu5etdzia4OxlFOHOSxaBoPtndmlO9JHz0eH60U4TCHnIu3waYkh83KCLDg19ItioOzq3emGQARF44HZNvJTvATGBKBJQRTqzMBrjRrO8/bYHHHj1NiaoCparwBtjYQcR4bPdOGRfykNWrcI3IXP65/YPsalcblkaTCul7oZA+memz9uDLm2N0HQyhdQpmnTS3z9jXOqPd8pxoLFNpTznVdo6zMAiXFr/ivqyDCVeuO0MoaVnREVLWmwMLt6sY1HKe/gIYRd9pYHTwPNNmk8hpRxz8QKl6zwTrzuI/1Cvn/3v5HBlnN/MhZ84acan8OMNz/Yb7A6m/FLE2UmAmSmFPOBG17p1PBtihrlfvuJ0IEPjpbIFL5/c2AGkEztcRKGbyIIW5F6aeEIc8eh3GzyCxhypQIgD3dc6mF+xGHqNPJkKMSy3osyR2ckqWHPAli3kpyt46MNR0NB9KZKIE52rZO6eK/P01Mkt26LrTItfkptMIxwKiZw+WHD6KIdWETKx1/YJ4+qXIbjau7/dI1X89ZMeDZ3WEHZ/BuqLzT1EM4RaOwl3M6I5aeSee8c3GZ6wxbhPMFQlaQruq83hQkXWVPYn6KCl+yHsS+1N0a52aIe9C94mgl90C/KnNdpnmQ9tL/EdHmoWxN49bj5C+U/+hXsDYr8SK8372iwHLf0EaLMkfA5O5Vd315FWsrtSO5zzAlpJc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(366016)(376014)(1800799024)(7416014)(4143699003)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHNHT0p4c3ppdFAxMk5Ldnc3VFNOdldRa29zelI2RTFKWmo4ZDNrU212SkxH?=
 =?utf-8?B?d0w4eG40Tm1TVGY3NHBiWmFaQlgwdm9pQTZMOEI2ZTA0NzVid3BUeFZDMmhF?=
 =?utf-8?B?M1NCWWM3NDdYNS9LbitabWJUemJIM3haS2t5WXljSmRENnkwOWFZSHZ1dWFi?=
 =?utf-8?B?a1ppdUJyVzJSL3llU0JBL0ZHVTN3M1FGV2xDKzlCRmlmVzhUb2Zka0Q5aEd5?=
 =?utf-8?B?V1JZVDN2am1XMUZxbUtsYTM0cXM0RXpKWnJQWnRjTVJncHdidEtvYnA5ejNk?=
 =?utf-8?B?bWFheGNreDJZakdLUEoyUGVKUitkMzBuaHN0UjF2MmJubU9KNGlOd3Z1MjZy?=
 =?utf-8?B?NWNQdGlzSlNwYTEzaUFkTWxuK2lwMUpaMkZkbVp3UWFhdklnL2Q1VSttczl5?=
 =?utf-8?B?aVNnQjJ0QllEVmdtYUx5czdFU2JMZUVzRjJrNDJhRVBzelpLdWdmOXo5NTNH?=
 =?utf-8?B?VzRVbVJPbEdwNVFHL0xXYit3N0p3am13TXllblVlVkJnTU1CWHpIaE8vd2NF?=
 =?utf-8?B?UTU0bkRQdSsrRUJRL3A3K2xOd3BuQ00yemMrL3RhU1JnR3E4UDZSclAxOUE1?=
 =?utf-8?B?ZStlY1pBVXFHZVdiZW1DdE15Z1kyT05Mb0hKN2VGWS9KeElkazFCL2R0Wlpk?=
 =?utf-8?B?SkNVQXdjdVhiT1l4US8xSFlOSlJ4bDJNOFRpTDhhQU81ZXo2VmtGZ2RFalhP?=
 =?utf-8?B?dGtJdnBiY3l3bGFHRTlwbjFWNDZGL0p3amlJOC9DY1VweExWaHFjU25MM0l4?=
 =?utf-8?B?QVlWNDNlNFUyZ2l6ZnVpOHdjUmhlaTh0NkhGSXZyTkJtdHQvQ1AxQWo3RGMw?=
 =?utf-8?B?eEtyRGp5QUJWb1ZoN2c0amN3WHNEZVNxUG9SR1BLdE9Vc2FKY1J3N01oZzRV?=
 =?utf-8?B?MkNBR0RLYTV0ekFBcjBWVHZUOWdtTWVScDNST1QxRmgzSjAxY3pRbmUweG5m?=
 =?utf-8?B?SVNOT0xGU0hYU2trMHdpKzkwTzJ6b1c0SVQ3UmtuM0JZWDhmRjY0R25aTzJs?=
 =?utf-8?B?V0FRa2pibEpGYjJWQTRLak1tenQwNllybTZla0dQMjRDMGU5WDJ0Z3hSenlQ?=
 =?utf-8?B?YkpldnhxZFVxd3U1eW9HODM0UDh1WGIwVUM2b2JkODVVVGlqaE8rVmh3ODNr?=
 =?utf-8?B?N3JYZnRDZStzV091SFg0RnREU1A3T3luelZPTGZKdnVjWG1TMU4yQUFrU3lp?=
 =?utf-8?B?dXBQMUJRbjUxTXN1WHR4ckRKRlhaYjJVZnVQbTZtTE5wdHA4ZXFxcEQwTUVH?=
 =?utf-8?B?bFdLdzFROEdPeTIrVXBPSGZpakhycG0wKzBkSWZTeXJrZW4vbjJHR01ieXhx?=
 =?utf-8?B?Nm9VZDBKdkgzcHhmQVg5S3ZRMlMwSWVrS3NKWjFCR0RTR3V4amJyZXBzOGZu?=
 =?utf-8?B?QTV2ZkgrMmRXNjY3QmxPTjJBYVVWNDFwY0dhNmppbWdKT21UV1daN0liWm5W?=
 =?utf-8?B?TXVuVFFQa2JjL0xXTU9RSkUvK28zZWRUdTdaeURhbDVMaTdJWG9rMTlKOVM4?=
 =?utf-8?B?UG55QS9YK2JkaURkNDNHdUgzZXlRc2lDOUpBaVVVcUpxaDBwQVgzSVd6ZHEv?=
 =?utf-8?B?em0wRWYwR0s5YS9VcTJLUXVwUkNpdmN6NGF5cytRa2hJV1l6MTIyT2NCYXQz?=
 =?utf-8?B?VGtYWHNWQmFOTlEyVEF4YVh1dG91Sk4wQWVKMDFYZCtMSTQzLzh6dUdudGtO?=
 =?utf-8?B?SXJpbTl1WjJ1MXNSL2NCV3FZblBIVnd3VFNhS2JsZnE5bUFzckpZUGVvSkM5?=
 =?utf-8?B?c3FrbXNQNEVBaTluekdFUzVFSHhOdDdUeFlBclF0NGdJQW5xb1FBSlNYbnhm?=
 =?utf-8?B?NzJhdmoxTEdoWmF1MWtqYnM5ZHEvY3NTV0JubTFuQWlkUFZrZ0dMYWZXTFg4?=
 =?utf-8?B?SFdtWEhJeCtUbGdSWTB2S1k3bEhkL3V4SVFKbjVVQTlDK2NrVnMxelJCR2V4?=
 =?utf-8?B?dDY0WXlYUHVFakdRZ3UwdFpUU3pQYU8ydHVhNUE4eFpEVDVuWVZYcmJZMTRC?=
 =?utf-8?B?QzhuSHUrYUp3NTAxaEFrbjBQMkxUeDJxRk16c04wdjdHNUNuOFd6SVhsZjQz?=
 =?utf-8?B?QXpyd05RSkpoMWhFRGVUcjhPM0R3NkZGcUlpTzdveGtYWEhaa3pzZkFSYzIx?=
 =?utf-8?B?UHBHbHVJYnFlTjJkMEpneFdWQmJGQ01tR2JGRVZqZlRGbW9QeEJ6UmJCU3Rw?=
 =?utf-8?B?WXo2QjFFTDVsdGpKaWN3RVRhNDFmQ1RvMDFaRHFxTEdSZUpnNXRGV0NqVjFW?=
 =?utf-8?Q?p8Qvn9grke7QOfAPwDUnxnmFJKDTDmCPNwJtjrvNSA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a2f143-0a0d-4a4f-bdb8-08df12d919b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 03:26:15.7553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7wGiVDrB82ZmvlGteWHaM2tknnn6/9W7FNBTvDEZgCDVo19flOfgIdGEWfZdwxv9VaMRtVNR1m/LQS+GHPfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8358

SGkgTWF0aGlhcywNCg0KPiA+PiBodWJfZXZlbnQoKQ0KPiA+PiAgICAgcG9ydF9ldmVudCgpDQo+
ID4+ICAgICAgIHVzYl9yZXNldF9kZXZpY2UodWRldikNCj4gPj4gICAgICAgICBpZiAoY29uZmln
KSAvL2FuZCBmb3IgZWFjaCBpbnRlcmZhY2UgaW4gdGhpcyBjb25maWc6ICwgZm9yIGVhY2ggaW50
ZXJmYWNlKQ0KPiA+PiAgICAgICAgICAgaWYgKGNpbnRmLT5kZXYuZHJpdmVyKSB7DQo+ID4+ICAg
ICAgICAgICAgIGRydiA9IHRvX3VzYl9kcml2ZXIoY2ludGYtPmRldi5kcml2ZXIpOw0KPiA+PiAg
ICAgICAgICAgICBpZiAoZHJ2LT5wcmVfcmVzZXQgJiYgZHJ2LT5wb3N0X3Jlc2V0KQ0KPiA+PiAg
ICAgICAgICAgICB1bmJpbmQgPSAoZHJ2LT5wcmVfcmVzZXQpKGNpbnRmKTsNCj4gPj4NCj4gPj4N
Cj4gPj4gQW55IGNoYW5jZSB5b3UgY291bGQgdHJhY2UgdGhlIHdob2xlIGNhbGwgcGF0aCBpbiBt
b3JlIGRldGFpbHMgYW5kIHNlZSBleGFjdGx5IHdoaWNoIHBhdGgNCj4gPj4gaXMgc3Rha2VuIGJl
Zm9yZSB0aGUgY3Jhc2guDQo+ID4+DQo+ID4+IHBvcnRfZXZlbnQoKSBzaG91bGQgb25seSBjYWxs
IHVzYl9yZXNldF9kZXZpY2UoKSBmb3IgdXNiMyBkZXZpY2VzIHdpdGggbGluayBzdHVjayBpbg0K
PiA+PiBzcy5pbmFjdGl2ZSBmb3IgbG9uZ2VyIHRoYW4gfjEwMG1zLiAgSXMgdGhpcyByZWFsbHkg
YSB1c2IzIGF1ZGlvIGRldmljZT8NCj4gPj4NCj4gPiBObywgaXQgaXMgbm90LiBUaGUgZGV2aWNl
IGlzIGEgZnVsbC1zcGVlZCBBcHBsZSBFYXJQb2RzDQo+ID4gKFVTQiAxLjEpOg0KPiA+DQo+ID4g
ICAgdXNiIDEtMTogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4aGNp
LWhjZA0KPiA+ICAgIHVzYiAxLTE6IFByb2R1Y3Q6IEVhclBvZHMNCj4gPiAgICB1c2IgMS0xOiBO
ZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDVhYywgaWRQcm9kdWN0PTExMGINCj4gPg0K
PiA+IFNvIHRoZSBwb3J0X2V2ZW50KCkg4oaSIHVzYl9yZXNldF9kZXZpY2UoKSB3YXJtLXJlc2V0
IHBhdGggZm9yDQo+ID4gU1MuSW5hY3RpdmUgZG9lcyBub3QgYXBwbHkgaGVyZS4NCj4gPiBUaGUg
YWN0dWFsIGNyYXNoIHBhdGggaXMgdGhyb3VnaCB1c2JfZGlzY29ubmVjdCgpLCBub3QNCj4gPiB1
c2JfcmVzZXRfZGV2aWNlKCkuIFRoZSBmdWxsIHNlcXVlbmNlIGZyb20gZG1lc2cgKyBjcmFzaCB0
cmFjZToNCj4gDQo+IFRoYW5rcyBmb3IgY2xhcmlmeWluZywgdGhlIGNyYXNoIHBhcnQgaXMgbm93
IGNsZWFyLg0KPiANCj4gV2hhdCBpcyBzdGlsbCB1bmNsZWFyIGlzIHRoZSBwYXJ0cyBiZWZvcmUg
dGhpcy4NCj4gSG93IGRvIHdlIGVuZCB1cCBpbiBhIHNpdHVhdGlvbiB3aGVyZSB3ZSBhcmUgcmVz
ZXR0aW5nIGFuZCBhZGRyZXNzaW5nDQo+IGEgZGV2aWNlIHdpdGggc2lkZWJhbmQgc3RpbGwgcmVn
aXN0ZXJlZC4NCj4gDQo+IFdoYXQgY29kZXBhdGggZW5kcyB1cCBjYWxsaW5nIHRoZSBmdXRpbGUN
Cj4gDQo+IGh1Yl9wb3J0X2luaXQoKQ0KPiAgICAtPmh1Yl9hZGRyZXNzX2RldmljZSgpDQo+IA0K
PiB0aGF0IGVuZHMgdXAgZnJlZWluZyBhbmQgcmVhbGxvY2F0aW5nIHRoZSB4aGNpIHZkZXY/DQo+
IA0KVGhlIHRyaWdnZXIgaXMgcmVzZXQtcmVzdW1lLCBub3Qgd2FybSByZXNldC4gRnJvbSBkbWVz
ZzoNCg0KICBbMTU4MDc3LjkwN10gdXNiIDEtMTogdXNiX2F1dG9yZXN1bWVfZGV2aWNlOiBjbnQg
MSAtPiAwDQogIFsxNTgwNzguMDE3XSB4aGNpLWhjZDogV0FSTiBTZXQgVFIgRGVxIFB0ciBjbWQg
ZmFpbGVkIGR1ZSB0byBpbmNvcnJlY3Qgc2xvdCBvciBlcCBzdGF0ZS4NCiAgWzE1ODA3OC4wMTdd
IHhoY2ktaGNkOiBXQVJOIHVyYiBzdWJtaXR0ZWQgdG8gZGlzYWJsZWQgZXANCiAgWzE1ODA3OC4w
MTddIHVzYiAxLTE6IHJlc2V0IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4
aGNpLWhjZA0KDQpUaGUgZGV2aWNlIHdhcyByZXN1bWluZyBmcm9tIGF1dG9zdXNwZW5kIGJ1dCB0
aGUgcG9ydCB3YXMgZGlzYWJsZWQuDQpJbiBodWJfcG9ydF9zdGF0dXNfY2hlY2soKSAoaHViLmM6
MzMyOSk6DQoNCiAgZWxzZSBpZiAoIShwb3J0c3RhdHVzICYgVVNCX1BPUlRfU1RBVF9FTkFCTEUp
ICYmICF1ZGV2LT5yZXNldF9yZXN1bWUpIHsNCiAgICAgIGlmICh1ZGV2LT5wZXJzaXN0X2VuYWJs
ZWQpDQogICAgICAgICAgdWRldi0+cmVzZXRfcmVzdW1lID0gMTsNCg0KVGhpcyBzZXRzIHJlc2V0
X3Jlc3VtZSA9IDEsIHRoZW4gZmluaXNoX3BvcnRfcmVzdW1lKCkgKGh1Yi5jOjM2NzgpDQpjYWxs
cyB1c2JfcmVzZXRfYW5kX3ZlcmlmeV9kZXZpY2UoKSDihpIgaHViX3BvcnRfaW5pdCgpIOKGkg0K
aHViX3NldF9hZGRyZXNzKCkg4oaSIHhoY2lfc2V0dXBfZGV2aWNlKCkuDQoNCj4gSXMgdGhlcmUg
YSB3YXkgKGxpa2UgZHJ2LT5wcmVfcmVzZXQgY2FsbCkgYW1vbmcgdGhhdCBwYXRoIHRvDQo+IGlu
Zm9ybSBhdWRpbyBkcml2ZXIgdG8gdW5yZWdpc3RlciBzaWRlYmFuZD8NCj4gDQpOby4gVGhlIHJl
c2V0LXJlc3VtZSBwYXRoIGdvZXMgdGhyb3VnaCBmaW5pc2hfcG9ydF9yZXN1bWUoKSDihpINCnVz
Yl9yZXNldF9hbmRfdmVyaWZ5X2RldmljZSgpIChodWIuYzozNjc4KSwgd2hpY2ggY2FsbHMNCnVz
Yl9yZXNldF9hbmRfdmVyaWZ5X2RldmljZSgpIGRpcmVjdGx5LCBieXBhc3NpbmcNCnVzYl9yZXNl
dF9kZXZpY2UoKS4gU28gZHJ2LT5wcmVfcmVzZXQoKSBpcyBuZXZlciBjYWxsZWQgaW4NCnRoaXMg
cGF0aCwgYW5kIHRoZSBpbnRlcmZhY2UgcmVtYWlucyBib3VuZCB0aHJvdWdob3V0IHRoZSByZXNl
dA0KYXR0ZW1wdC4NCg0KVGhpcyBpcyB3aHkgdGhlIGNyYXNoIHRyYWNlIHNob3dzIHVzYl91bmJp
bmRfaW50ZXJmYWNlKCkgYmVpbmcNCmNhbGxlZCBmcm9tIHVzYl9kaXNjb25uZWN0KCkg4oCUIHRo
ZSBpbnRlcmZhY2Ugd2FzIG5ldmVyIHVuYm91bmQNCmJlZm9yZSB0aGUgcmVzZXQuDQoNClRoZSBz
bmQtdXNiLWF1ZGlvIGRyaXZlciBkb2VzIGhhdmUgYSAucmVzZXRfcmVzdW1lIGNhbGxiYWNrDQoo
dXNiX2F1ZGlvX3Jlc3VtZSksIGJ1dCBpdCBoYW5kbGVzIHN0cmVhbSByZXN0YXJ0LCBub3Qgc2lk
ZWJhbmQNCnVucmVnaXN0cmF0aW9uLiBUaGVyZSBpcyBjdXJyZW50bHkgbm8gaG9vayBpbiB0aGUg
cmVzZXQtcmVzdW1lDQpwYXRoIGZvciB0aGUgYXVkaW8gZHJpdmVyIHRvIHVucmVnaXN0ZXIgc2lk
ZWJhbmQgYmVmb3JlDQp1c2JfcmVzZXRfYW5kX3ZlcmlmeV9kZXZpY2UoKSBiZWdpbnMuDQoNClJl
Z2FyZHMsDQpMaWFucWluDQo=
