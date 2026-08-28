Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20C6374A0C;
	Fri, 28 Aug 2026 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948202; cv=fail; b=ZAQ6RDJVnRJVx/WonLvNNikIr9VX1abDEXW0Bp8ZzFvByZfFpcLozcDenkqZW5ZRQ6L26hnUK7/NGMwMJ8578yuNA9+vbH2lpoQwDpBkjA5x7JLqPoEb1UHX2HfwqtwDQAV2NY2SJsynHxpBDHXbqx0RXHcacYIepLA+4LUepB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948202; c=relaxed/simple;
	bh=8uBE2sQGOpIeETdQ5sUpbxvKBgv09NA8VLNcXK7oVcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hQIQ5HLancZD9cM28X0fjXNjUX99TfmnJNaIn2C+tKBEYQXaeG1yeLP38WiUxhXoOwlQC4SKQ/dOjPrTKQIWx+O1+AiSMv9whOuWeiqoGIi1iN+Jop+Miml+RavXKGCK8xnDAUz4OiUlfNYdRYLTQajI80Z8yCqTKMFwFuYyseE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MJuh8NvT; arc=fail smtp.client-ip=52.101.72.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MJuh8NvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOLS0io0Z9eaWhrXCJR/Sy+LTXRc6sRk1xt4eUhofX4tMXzF+FQZEIuypqrd1jhg99CN5PNqhAx35cmz+CaHmU27cNOV1NmEBhkI345Xlmm6l93/TiuXiUHlX6dPJnFhgtsLyhgDoCIz1xO1k8vGyL8PEQZNViG6/WM+x9kV5ljYjex60WUtK4IjVuMXQ6rgBXmFyZv5J9ylbK9pQ0HfAuGKF0eD+PjOCQO53UvQl4lIimuPrv4vZX99v+qRjyOL1wZeveXWtKHPOP+H+zO39gYyiyzQjLGb5Z2InkkEOunusJMsCaqxpRxU6A3oFPNRT/zLIyYyTQGL6vWRTnXp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uBE2sQGOpIeETdQ5sUpbxvKBgv09NA8VLNcXK7oVcg=;
 b=KADPuYePsEEKwhJgOS8pKlAI91TyTUXyfxvzqpKTIT1RxYkDmhQxKks9q20fWo+JPdhiQifY5IUlCViMYGY5QWmIufPFJvX4drLAyW513hf5Y/Ma2kneEyIPlicaAQKUmnkRhyVPhw/3PftoycdjYomTUX+ewI1UV6yx9cWl00xGE0vLIJAWJKxbjMMWkzf+NPM2bZdrUxKbqBy5Cb13Lxg/1hRw0L7uUROyqWdwMq5MOfepP1h/PO9Py/QkTw8I+XFA5v8YlCMMWh5SQ34TV7ZaKmaC3su6oIedTmIusIdmO++IPRTAOjHjOu9iwxuFKqdJ6YoHNLXh6myf3hsFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uBE2sQGOpIeETdQ5sUpbxvKBgv09NA8VLNcXK7oVcg=;
 b=MJuh8NvTQCsJUS/uN/tbZ2mASrtJI2fALl7nw6OZzfs43F0CyKome6+ZVxEm9CgJE9edP0NN45dxeE5C+XKsexxWZR7pfkoc2JA0zkhfV3l8G3t2v8xBRRRfolLhBHnc3D/dnq/4DRoVdwiC0J393lhSzaZT6m3GCE3o/SYm3QPegvmMyM05MX4zC/nN85HdVcp4wTIiBtJea1mSFX95Dd1IA0nvGjGC/zO1HZ/MK1mCCJpFK1HMvEVffJB9xP5hbAvyPMgf3jP+mrw67Xu0DwTWdgujA70lrt0MgpOtj5rq56s0VAjiYeZiNznU73Wf6hlzk4gPcYcwbR76JBiv5Q==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB9012.eurprd04.prod.outlook.com (2603:10a6:20b:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 20:16:36 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 20:16:36 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C
 interface in the I3C hub
Thread-Topic: [EXT] Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C
 interface in the I3C hub
Thread-Index: AQHdNUcSs1wsbcvQY0WlYGU50vgFqLaxra0AgAI6ZoA=
Date: Fri, 28 Aug 2026 20:16:36 +0000
Message-ID:
 <AS4PR04MB9362CDEAE312F232E037B51EFBAC2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-7-lakshay.piplani@nxp.com>
 <b2d596af-ec24-406f-bcd7-813db0aebeb5@kernel.org>
In-Reply-To: <b2d596af-ec24-406f-bcd7-813db0aebeb5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-08-28T20:13:29.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB9012:EE_
x-ms-office365-filtering-correlation-id: 1bce7fe6-de0f-442a-a05b-08df054142ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|921020|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Rd25EfNiDNlrY4Ovrp/Axngh2NYWE/9wNbwSp8ScXzatfD27ARwkf0zKYrTZt9vyDNk8oOAWYLpgEBIYYG6+xOlEcSg0Q5iuOQajjZByzmh1PlViEYCEZBshfegy1PJfKNAFGqA8Y3f5Rcq14qabOn+ysvc2ggXf+IXVG3Te5irpk0LlzG6nCcqN2yLbWe7z9kOl5YUNS/YFC0FMLdnCyfUmx1OoViTKAtJA5yDj2gScuT1QPk9QmgxR9klYGQhXF7++Jo+tLdEUPv4md7tvMynUuxHnDACzRXKf48uNl0efP+U3LIl30ZHh+oY1z0vrLzlMHoMLKNzkAyNuKwQic0a7HjhclIpQ3IpWAiJSGq59LG42oWpAG5j8/fu1coXjl+ZUEeDfBXmZsDunWVfTAZlsqCTjJe7h0kaDX4MgcpA/iUxInxj59b6O/8mrWA4uBELTbezNcpr8t6IchxSAYE/uzF2zbWWtPEqmkoDps4L+XGdkiQ+msGT+ACn15dbBN+5yzxBsN8V6erb29hUPRnKHL+zY0PsFI1R5rjYmCZSJRjGXXgcmPT0Mdj2MV8U1UTVTgUM8NoVHJbgqkroT19INHjbKTqaxq5JJ633gH1C0PpOq2eFuPbitI53IKJrAJxfv1zeyaKTLF6SorV6amkoPSCoVmrcWaKuWUsbi+aUWv4E5IUMS0W/kUWUfstVx63o0X67quy1+276HQLFe2g3mKwFAaN0gRQco3PWkHVJ+iY1WdeIAP6MdCSgrgBVf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(921020)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZU9kLzIzSTBkc0Z2bkFENmhzcUhXZ3Y4dDhob3lhTW8zcWMvMFVnakxBWmJj?=
 =?utf-8?B?eFJGclAzSHVrempjTUhsM0pkNWZWRHVyTnhlQ3FBUzR6Y2pXN2tKT2xWUUlW?=
 =?utf-8?B?c3NDWFh6b1lIRXhtbWJNbzdPcWpzTFcxRmNXVklYRS9hS1lvWTRZYnFoeEc0?=
 =?utf-8?B?c29PNnFBMkFuTEVqWi9GbFB4d2Zqc1BDSERRZWpzUnBBZXJuYVlhcHpnL1c0?=
 =?utf-8?B?MDYrbTRrc205Y1FQYTNiYUhoVWNrZ1VRODh3T21ZTnVkQlF2YlZ2OUhkQTh0?=
 =?utf-8?B?OXBFdXRjN1pGRXo2azIybkZvUWFRMXZ4OWQ5M0dQV1RmcGRuR1VFaVNqNG5Q?=
 =?utf-8?B?MDZJRGtSeStkc21qQW1HMVhPUUtXU28xV2VFR04xRkZXTGNuRHdMamczTUZP?=
 =?utf-8?B?QUlJNE9DQThxcDZOaGFPT3U3aS9VaGNLMFJNbHJ4VFJCd2JaTE91WmV3NTNS?=
 =?utf-8?B?UFd5ZUtVQ2JyNGM1Qk5BR3kxc1E5OXdndGN4emtreGk5V0FOWHJMc0ZIb25a?=
 =?utf-8?B?a0NnUnhyMEJRclRSb2MrQnpmSFljZ1ByTThRdVNsNHZNTmM3MjJpOTJEMU1E?=
 =?utf-8?B?UTZ2U3BGMjdta3owQU8zcnNWcG04ak1tbEo5UloxWWNvcUN4OHRzVWVDaEx1?=
 =?utf-8?B?dDRQQVY2NHhUOHE1OTRXaXdoVXY0OW9XUldIa0JEUkwrbmk3K1BIYzFLNVo3?=
 =?utf-8?B?Y1VXdHh1U1dlOVEyZjllR2JlK1kxWWJSSEdibEtzZ1dXREF3ZGc4eDl1dnYr?=
 =?utf-8?B?RjFpZmF3d1ZTdElib2dFZittaDNXeHc2TTcrM3ZoMEpOQmpVK1l0SWFkUnFW?=
 =?utf-8?B?ejltUzV5QllidUtZaVFFVDdYWjVuRzhpRDlaemsvNHBnWmozLzkrYTRobG42?=
 =?utf-8?B?cjh6aUgxL2JWOVRHeXdINndWMk1vMGl6SnB6Q0ZVRCsyYkZuVWVMcEdkUFIw?=
 =?utf-8?B?dkwrelJaK05QNWJIOThoSU5qcHFwUkxDOEJFNVMrWTI1SUNMc090ZzNvSzQv?=
 =?utf-8?B?Nkp3bWc1Q25yQUpSSlc4U0tMbnNsNndtdWZsUk1BZjV5b205ak9oUWRRZWFu?=
 =?utf-8?B?THlkVG1zVUdjOE1XQmRnREQvdWlLN1VqYkhOZkRQMENIdFV0L2lWQXJ2a1Rq?=
 =?utf-8?B?cDdnemU1NWQ1RGFxMVhjU3k5VEtHd1R0eHVSV0YyZUh4YTFPL0ZXWTlkNDVv?=
 =?utf-8?B?RUExNDJ6MHRVd2puN0V2N1JkeVBiSEpUU3l0UWh5NUNHalY0WGhVYW8xUk1H?=
 =?utf-8?B?MzZOR1ZxNlBIdWF0ci9aTExNME9oUUZSdi9IZCtONUs5WUN2SHVhUk5ZTG8w?=
 =?utf-8?B?Y3VSdGRodFRvZHlnNGxoMWRJMzFOT1dicUdDNkJBNDZSTEVjS0w1WWVPOTgy?=
 =?utf-8?B?WnQzK25yeWZLdzlIbnVxdGl2ZmpUVkpBWlZqVGxqQ2dUbUk1TDAxOEJ4dUtH?=
 =?utf-8?B?Sk9KeVlGMHNMSnJDYW5Cak5YclE3RGhyRzIyNytRWjdka0VRN2NsWDhxMEln?=
 =?utf-8?B?UFBKT2p3aUIxRzJSbGROWG9tRUR1emVid0RPTDI1Q1FYbUk3bUI5YWo2NTBY?=
 =?utf-8?B?aFdCbkdzanFNZVljclE2TEc3dVFjYVlNSDlYK1NtdTZYMVRYOTlsZGsvWi95?=
 =?utf-8?B?Tkd0Ky9CZDBMY1poNEJpeE90YmdBekFaN3hWNGxHZk1MQXluRXVyRmlqL3U5?=
 =?utf-8?B?VFYybXN3ZkVUNG9MQm11WEZpS0l3cU5LZ2NwcVp4cldhbjJDcmZSaTRnTnU4?=
 =?utf-8?B?Q3I3WVBoQ1Y1My9KdnBzUnR3V0h2S3o3WFpocEpJQmJnVkU4ZW1mM0kvMVY1?=
 =?utf-8?B?K2pESnJlVWhobVNPUEJCc2hMb0N4cFlGNnZhTFJYdUVTWXVBWVpidzcwbEcz?=
 =?utf-8?B?WnFOYXh4a0lMVk1aS1FwSk52RGhqajNheCszWFpTK0w4N1dDam1xcUk5NGt0?=
 =?utf-8?B?OFIvcnNxQVJUdlJkZkF4S3ZoMFdzODd5cU1vRVpsRzhYSDNQU2xSd08yaE1u?=
 =?utf-8?B?VkF4UmljUysvU1JrUjU4V0RLVCtXWW1Cc0N0QjZIYXRwUUxOajZFeXlTZ2M5?=
 =?utf-8?B?SkdoTlUzL3NGSUkxclN4SWRZSlhKY0xjMFdXM1JpTm9OY09icWoxUWZXc3lL?=
 =?utf-8?B?ai8xZjBrWFZOdWpsa0xwRTI0WVgxUTdSOUplV0lBMlBQei9lc1A5NDFHNGtN?=
 =?utf-8?B?YjhOYi9LWTB4a2poUWlRKytnMXE0V2E3MmhaaThob2lpcXNEQVJUYzBHaDlj?=
 =?utf-8?B?cjZpZ09oT1hxRWgxeW1hRFNWaDJUcHh6ZW4ycURPTWJTTkRrcHRpUWZnOG1S?=
 =?utf-8?B?RVh3V25xalBvWTdhbjdhQVk0TVBJWGZ4eDgzSU1LQ1d3bll2b0UxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bce7fe6-de0f-442a-a05b-08df054142ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 20:16:36.3478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9qe6ktvP4I0JhEv53FnIDjI96Oyr7nkBahTdHa4XGrgMSgjJO/GNWjzaaWuioP1jkLgrI95QvLFAV/XF80Cyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9012

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gPiArICogaTNjX2h1
Yl9pbml0KCkgLSBJbml0aWFsaXplIGh1YiBjb250ZXh0DQo+ID4gKyAqIEBodWI6IEh1YiBpbnN0
YW5jZQ0KPiA+ICsgKiBAb3BzOiBWZW5kb3IgY2FsbGJhY2tzDQo+ID4gKyAqIEBodWJfZGV2OiBJ
M0MgaHViIGRldmljZQ0KPiA+ICsgKi8NCj4gPiArdm9pZCBpM2NfaHViX2luaXQoc3RydWN0IGkz
Y19odWIgKmh1YiwNCj4gPiArICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGkzY19odWJfb3Bz
ICpvcHMsDQo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBpM2NfZGV2aWNlICpodWJfZGV2KSB7
DQo+ID4gKyAgICAgc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqcGFyZW50Ow0KPiA+ICsg
ICAgIHVuc2lnbmVkIGludCBkZXB0aDsNCj4gPiArDQo+ID4gKyAgICAgaHViLT5vcHMgPSBvcHM7
DQo+ID4gKyAgICAgaHViLT5odWJfZGV2ID0gaHViX2RldjsNCj4gPiArICAgICBtdXRleF9pbml0
KCZodWItPmxvY2spOw0KPiA+ICsNCj4gPiArICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0xP
Q0tERVApKQ0KPg0KPiBTbyB3aXRob3V0IGxvY2tkZXAgeW91IGRvIG5vdCBpbml0aWFsaXplPyBI
b25lc3RseSwga2VybmVsZG9jIGlzIHVzZWxlc3MgaGVyZQ0KPiBhbmQgZXhwbGFpbnMgbm90aGlu
Zy4gS2VybmVsZG9jIGlzIHByZXR0eSBjbGVhciAtIHlvdSBpbml0aWFsaXplIGh1YiBjb250ZXh0
IHRodXMNCj4gd2h5IGh1YiBjb250ZXh0IHNob3VsZCBiZSB1bmluaXRpYWxpemVkIHdpdGhvdXQg
bG9ja2RlcD8NCj4NCg0KVGhlIGh1YiBmaWVsZHMgYW5kIG11dGV4IGFyZSBpbml0aWFsaXplZCBi
ZWZvcmUgdGhpcyBjaGVjazsgb25seSB0aGUNCmxvY2tkZXAgc2V0dXAgaXMgY29uZGl0aW9uYWwu
IEknbGwgY2xhcmlmeSB0aGF0IGluIGtlcm5lbC1kb2MuDQoNCj4gPiArICAgICAgICAgICAgIHJl
dHVybjsNCj4gPiArDQo+ID4gKyAgICAgaWYgKFdBUk5fT05fT05DRSghaHViX2RldiB8fCAhaHVi
X2Rldi0+ZGVzYykpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+DQo+IEhvdyBpcyB0aGlz
IHBvc3NpYmxlPyBXaHkgcGFuaWNraW5nIHRoZSBtYWNoaW5lPw0KPg0KDQpUaGUgY2FsbGVyIGFs
cmVhZHkgc3VwcGxpZXMgYSB2YWxpZCBodWIgZGV2aWNlIGFuZCBkZXNjcmlwdG9yLiBJJ2xsDQpk
b2N1bWVudCB0aGF0IHJlcXVpcmVtZW50IGFuZCByZW1vdmUgdGhlIGNoZWNrLg0KDQo+ID4gKw0K
PiA+ICsgICAgIHBhcmVudCA9IGkzY19kZXZfZ2V0X21hc3RlcihodWJfZGV2LT5kZXNjKTsNCj4g
PiArICAgICBpZiAoV0FSTl9PTl9PTkNFKCFwYXJlbnQpKQ0KPiA+ICsgICAgICAgICAgICAgcmV0
dXJuOw0KPg0KPiBXaHkgcGFuaWNraW5nIGhlcmUgKFdBUk4gb24gcGFuaWMpPw0KPg0KDQpUaGUg
cGFyZW50IGNvbnRyb2xsZXIgaXMgYWxzbyBndWFyYW50ZWVkIGF0IHRoaXMgY2FsbCBzaXRlLiBJ
J2xsDQpyZW1vdmUgdGhpcyBjaGVjayBhcyB3ZWxsLg0KDQo+ID4gKw0KPiA+ICsgICAgIC8qDQo+
ID4gKyAgICAgICogVGhlIHJvdXRpbmcgbXV0ZXggaGFzIHRoZSBzYW1lIGh1YiBuZXN0aW5nIGRl
cHRoIGFzIHRoZSB2aXJ0dWFsDQo+ID4gKyAgICAgICogY29udHJvbGxlcnMgdGhpcyBodWIgZXhw
b3Nlcywgc28gdGhlIHBhcmVudCBjb250cm9sbGVyIGlzIG9uZSBsZXZlbA0KPiA+ICsgICAgICAq
IHNoYWxsb3dlci4gS2V5aW5nIGl0IG9uY2UgaGVyZSwgcmF0aGVyIHRoYW4gcGVyIHBvcnQsIGF2
b2lkcw0KPiA+ICsgICAgICAqIHJlY2xhc3NpZnlpbmcgdGhlIHNpbmdsZSBzaGFyZWQgcm91dGlu
ZyBtdXRleCBmcm9tIGEgbGF0ZXIgcG9ydCB0aGF0DQo+ID4gKyAgICAgICogbWF5IGFscmVhZHkg
aGF2ZSB1c2VkIGl0Lg0KPiA+ICsgICAgICAqLw0KPiA+ICsgICAgIGRlcHRoID0gaTNjX2h1Yl9j
b250cm9sbGVyX2RlcHRoKHBhcmVudCkgKyAxOw0KPiA+ICsgICAgIGlmIChXQVJOX09OQ0UoZGVw
dGggPiBJM0NfSFVCX01BWF9MT0NLX0RFUFRILA0KPiA+ICsgICAgICAgICAgICAgICAgICAgImkz
Yy1odWI6IHJvdXRpbmcgbG9jayBkZXB0aCAldSBleGNlZWRzIGxvY2tkZXAgc3VwcG9ydFxuIiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgIGRlcHRoKSkNCj4NCj4NCj4gPiArICAgICAgICAgICAg
IGRlcHRoID0gSTNDX0hVQl9NQVhfTE9DS19ERVBUSDsNCj4gPiArDQo+ID4gKyAgICAgbG9ja2Rl
cF9zZXRfY2xhc3MoJmh1Yi0+bG9jaywgJmkzY19odWJfcm91dGluZ19sb2NrX2tleXNbZGVwdGgg
LQ0KPiA+ICsxXSk7IH0gRVhQT1JUX1NZTUJPTF9HUEwoaTNjX2h1Yl9pbml0KTsNCj4gPiArDQo+
ID4gK2NvbnN0IHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzICppM2NfaHViX21hc3Rl
cl9vcHModm9pZCkgew0KPiA+ICsgICAgIHJldHVybiAmaTNjX2h1Yl9tYXN0ZXJfb3BzX2RhdGE7
IH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX2h1Yl9tYXN0ZXJfb3BzKTsNCj4NCj4gRG8g
eW91IHJlYWxseSBuZWVkIGEgd3JhcHBlciBjYWxsIG92ZXIgc2luZ2xlIHZhcmlhYmxlPyBDYW4g
dGhlIGkzYyBodWIgY29yZQ0KPiBjb2RlIGJlIE5PVCBwcmVzZW50IHdoZW4geW91ciBJM0MgaHVi
IGRyaXZlciBpcyBidWlsbGluPw0KPg0KDQpQM0gyWDRYX0kzQ19IVUIgc2VsZWN0cyBJM0NfSFVC
LCBzbyB0aGUgY29yZSBpcyBidWlsdCB3aGVuZXZlciB0aGlzDQpkcml2ZXIgaXMgZW5hYmxlZC4g
SSdsbCBleHBvcnQgdGhlIGNvbnN0IG9wcyBvYmplY3QgZGlyZWN0bHkgYW5kDQpyZW1vdmUgdGhl
IGFjY2Vzc29yLg0KDQpUaGFua3MsDQpMYWtzaGF5DQoNCk5YUCBQdWJsaWMNCg==
