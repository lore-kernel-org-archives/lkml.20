Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE733DDDBC;
	Fri, 28 Aug 2026 20:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948793; cv=fail; b=ZApgp8ukv9/+APvRazVdCINvg/pHNzLMZIhlZhjg4rkdvb4oRWa0iIVBcSAc115SZ1lD4dZtiNOFP+zrkeflMWDgzKQ0a7X6rMkCMe+e7Nk8wBBcSukmOUWz1ipASVjI+wsUJMiwda7/3Ip7R1ehCosb+1znpQJYQ3423OPnXGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948793; c=relaxed/simple;
	bh=o8RwyFLZ6Bs70exYbzNEiIV6G+KWR21abxqt2OxgzNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eOsOibIdRifu1sJrPr9fFhVkRhwNzjFUJ6N+rQpTETnMsXnSchXl+MUXVDXOt+LI4KbDTDujDS7sLmQn2arD2MGX/etdvE4EdxvOwEa8BvH3GEDfax9GGGhj018ZKCczmf5U3P/c4X6h4868b9KMuQisuU1P62EsNr1OM+Pqo8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b6Xpgurz; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b6Xpgurz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwY5TjAGpVyaq8A7lpuRtisCAPy4w3tPl0doALj5WQOjeSy9eVo60prMAotrby2diDt3Y+WgtLTAYcyymdvOZXVrbqb99A7lxLRRaiiqNNppNMYbYWH9vD8mdg6srpXodEZkGTamCyOMdKmad2Z920iG7o88UtF5Fc+C1u1MWoJPFmU4hxbd15ffuMJARpL1UygiRzs1kyaMZ7Cl5hSMnYyFlUoHd8ejXZ5MgfyKf+KPMHaRWQiSyu+D5YhOFKDIw4TvjDRDeZFNonhaX4Q+PW9t2IpdPY40MAcHeavSF3dWqN5zWhJPMlNHgwAo019m8mYRlLfrHi1+6j3I9sO0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8RwyFLZ6Bs70exYbzNEiIV6G+KWR21abxqt2OxgzNw=;
 b=RR/jaRpLYCRL1qJB7k4mz0NnQQtGsjuBBZkOblx2zMXJOQYRcFPdDD49Mjj291SE9WhO4x4UPHnthKF1GbXWzi5KUlPcKpe+53Ew2AO4nw2BKSE2GcRzdkdvaB2vE/+/FwVgj6vwXdVTwhK1ZnmyuJgphFNtYmwDTXYXbyFiNEwLBDAj3JGyXwMGR90Z2hKC7gFY54L/sJMO6XM/OWaI1aAoAYKTvgFbXmfGjafjqCt20KF0uRwSIESdCb8YL5CBYlfK7A1v7nRWVo7XY1hj9jtyQXhQQXNpJOq+cY4V6anX+J4N4NzC7UpoKvrlBNQL1DS4UhYLkzPeihMe0EJstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8RwyFLZ6Bs70exYbzNEiIV6G+KWR21abxqt2OxgzNw=;
 b=b6Xpgurze1/yjEokL4lUdL17Oec0jHjcuaymx7NW5nPkFWpJifKvEts6/wHrCKKFfqch7lQqYl9ZBc3PWt1VDNIex/c9GBIjrt6PAxsy7jJq29gLcUm6ntQIpJE9aCxHXsNTTnZ9SWJEDccxioYby0PCQt5N4JUoxyOEf0L/FpOonsh3aefXL2J4mteQMyX3RHEkwPbpr2jxk89t6xvGs3KOTdosCBZ3Qg/kp5+HQTvVYT5IqSumsekWWgx61Xtsiw/qTkqoOagA3AECHqNtgPo2ZLuQQnF6UvUrIwfnTvtyF8i/o4DzyJue33sgVY/QzdHvz1pjHnAnQhVKl1KXGQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB8516.eurprd04.prod.outlook.com (2603:10a6:20b:343::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 20:26:27 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 20:26:27 +0000
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
Subject: RE: [EXT] Re: [PATCH v16 7/8] i3c: hub: p3h2x4x: Add support for NXP
 P3H2x4x I3C hub functionality
Thread-Topic: [EXT] Re: [PATCH v16 7/8] i3c: hub: p3h2x4x: Add support for NXP
 P3H2x4x I3C hub functionality
Thread-Index: AQHdNUcRD92nHiHFwUu9XYfDRdExMraxr8YAgAI5+KA=
Date: Fri, 28 Aug 2026 20:26:27 +0000
Message-ID:
 <AS4PR04MB93622991CDF793463E476702FBAC2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-8-lakshay.piplani@nxp.com>
 <91090730-b8b5-4346-a151-c11489abf2b3@kernel.org>
In-Reply-To: <91090730-b8b5-4346-a151-c11489abf2b3@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-08-28T20:16:49.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB8516:EE_
x-ms-office365-filtering-correlation-id: 9cbbccda-2468-4974-7e0d-08df0542a317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info:
 WsKHiCnzpqktOB3hUOddisko+bdiPJR/nWBSHOV4VW4OKx77rAql9bzXUGGaB9KsTtziXO7ylYr3uRoCVV6SyQu1cxwJ3aIW4RKmvJtu3xZOtMoiGPoq/V+nlrRTHof6vZgcVhawgWxJbjBC/uJtsmOvhK4FlL/Cd51HotCgrFjIqKr3hRSfrxoakTFOL/y7/L0Ulf0Y28UgjACpWDxVx7XRjOF1Mes2FhwWlCim6P002mh+qcMvtr3DvWMLuSVjmnMr3j+Z9TAeMmqb8Um+bo68jUUHL4S+McU95Ev7cLOXvwsCClPCfVlRN1BtUImYXPv04bL/vTedZrmz6L1ZDuaWotu2bk1OdTzk3gNKuo/SDhwsI0CbcbjsENmaC5jMTZ+ec7LD2BxVovHy5EJB5FYkqmqTcmPbXVpxVFA8DPXQgXsFYefKDvtVlV5dCh17+n1dJvnPepHWNdEH3FdFlNuop9/iiSc8FMoeEgWyBcM9IkFNq/mXkIX1j5DLM1jVUvSiSFHthr9NHbe8VTuSRqbIWiOWyoKRO+m31WkbC00YqN2goCcboWouzOgmS8kFPU8kocZGYgVoTKiVeXpaDfdtd27erP51KF0z8Igk/SRdG32Q8X6FYSbdi9yofCUFAUeKyOOfT+peLybk47BfzeLktuhO0iiuk3wzA7xztkbN/WO56euJznkyY2rO1RpxQec9wNXx5tZQvGFBCXyvWDZfuGa4j0JFbUexanrnOBI6ZrfBLKTOEUc0Z41gKVdn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eG1Qa1d1YUhKNXlNa0tyVCtXMENFT0hsVjA2bkxwYU9ONU1wY2xNZjJWK1Ay?=
 =?utf-8?B?dGJHS1I5dG5DbEZsU09JQ3NBZndRWVBnaHVENFg5Sk9KSnpZMEpRd2svbFpS?=
 =?utf-8?B?OVE4cnpxUHdNYkFJLzlDbDVzVnNwbE8rVkpjR0lZS3VLcGxuWjBtTzBMeHRw?=
 =?utf-8?B?MTFUUm4vRit2M2VwK2ZETmFJaVVUSms2UWpOM2ZqaWRGQnZnVjQ0SklTb2dT?=
 =?utf-8?B?VzVMNTRQN1hsejFxbVNOYkNIaWtSdmZLb0QrMWpSRHFhQ1dzUzFyL3FLREtp?=
 =?utf-8?B?dVhKRDBhM2FGSlNmNVBmc2ZtR0huUngrZkR2ZC9wcFUxenpDNEx1dERRNmQ2?=
 =?utf-8?B?UmNhd09WZjIybEVUbFE1eVZOUGpOamxjbHlKVk0rcnpMaThlMmQwM2djZXBM?=
 =?utf-8?B?ZmFGUjV5VDI1M2dlYlBVRk1CZThDemlpNFYxU1ZtM3JldUlVR01ITXpsdDVq?=
 =?utf-8?B?WExkQjFEYVVvYTBJbTNodXptbUM2aTVUcHE4K0JENGsyODJVQjN5dktnVENq?=
 =?utf-8?B?YlkwTmNnL1d2UUdRWHhuRGZsSWJ2WEswS3lTRGlIQnlmODEwTDd2a3JyZG9s?=
 =?utf-8?B?YTl3bFNwTFRnV25tbHdZRTFKMTUzRy9renFuaSt6Q203TGpFYUttZTk1YXZH?=
 =?utf-8?B?TUxEN2tWNndMVjY2NFRQUTgvVEc1Z3I3Vk5DbnN1M2lUWVFiaDZ6WjlVOThi?=
 =?utf-8?B?ZXlqdDB6V2pOckFMRllRN0FkZzF5ZWRhVHdmTGYyQ2M0bnVlcGZaSHNrN3Ev?=
 =?utf-8?B?cVMxdVRLdytkUTB1Rmc4Y3ZBSUVlVFVtOFFUZVZ5OGFtV0tKcUU4akhIOUFR?=
 =?utf-8?B?NWxXL3hhTU9CeWsrMWk3dHQ3dDVjOFNsWWlwTi96OUd2SUY3YVpNa1l4UkdH?=
 =?utf-8?B?UklaWHQ4RGNSK1MrOEJtUnBXWUtzOGhNV0lkcWlIRy9UaDJ1SHEvWmFHOG5F?=
 =?utf-8?B?VHNzb3h5MmMrSXFlWkkzMGduOGtvNWJ0Tk00dHJadTFMeWVxc2o5cUxsTVZN?=
 =?utf-8?B?MWN4L0VIMm44U2QwYU5tRW5QdExXOTlnOTJBRENyMkdsRFV3b0srbDQvTXNM?=
 =?utf-8?B?cXluLzJ2RWhvRUdoVDhNVHhMVDlNZDdqRGt6TUhBcUhQV2RLemNOaWg2VHpZ?=
 =?utf-8?B?UXpLL0RFNk43bkdjMDQ5RC9IdlpJYzZ5RlFwOGhXTTVaYmZYaElqRkgzQVkr?=
 =?utf-8?B?Rm1XMHJDT2dId3RuNkd4YWphSWRReWNJREVxZ2tDVm94dGRXa0Vwa1pNbzRW?=
 =?utf-8?B?cy85MkJWak54OTA1dkViRlI2T01CWW43TFBtV2VZWG0yZWw1Vld5SW9PTTcx?=
 =?utf-8?B?SmQxYWNpZlJSbVVtU3UzTGtGeldlVkNwai80dnVhZUt2WEp1ZDBkb1JUaU9G?=
 =?utf-8?B?THlrVHdiMGRMRUUveDFwSVlvUTROSUlQM1h4SUtpQ2djeFluLzVEUUxXTjkv?=
 =?utf-8?B?OTJYVTVpZFM5S1grWko2cU1EYlp6Mzk1SnRHSjJUM3RCQzV2MDh2ZkJlckhM?=
 =?utf-8?B?MVdFRDBTZEtHOVkreno2U1ROZ3FwZ3BWYnd6WUc1VDNVZElWOWJhL2doeVdZ?=
 =?utf-8?B?QytvZTI2VEFXMFJBZzVadWpVeE8zYXRGNFVnU0RDWTlSTHFscmVIYU00dzFH?=
 =?utf-8?B?VXMxV3l6MGp1TXcwd0lSNkM3R1BNUWRYcWs2bjROQnNVdjYyWEdrbXViaG1Q?=
 =?utf-8?B?NmYzNUFjYTZyQmlCUUU0dC9rSEowRXFvZTh5d3JrTTQ5a3MxZlNCQWFNalVw?=
 =?utf-8?B?cTZwRS9pb2VHaG9ra05FNnhGeU52d2c5bEF2OEQwY2MwQ1dzdzdLbVFSalVa?=
 =?utf-8?B?cE5VMjNpM3FTZkZrNVVUSHRPS0cvT0pCNmloWEdUaDFnalVlTW5EWjVwZC9x?=
 =?utf-8?B?Mm5ZVGZ0VkUvaGNwRkZtdUhDMzRrYTdDcTc0SHZkcVorbG82cFpiUDN3SkZv?=
 =?utf-8?B?dGorWEZvWVowczI5YTRKL3FPbVVnOXNpaVpBeXViVWdxRlNZZThtTzNScEw4?=
 =?utf-8?B?T2U2ODZLMEtKVkc0eERvcVB3bTBraTlvOXhXeThwL2xEM0lscWFaYkM5Rjdn?=
 =?utf-8?B?Q21PYTR2bGJJbE1iVmZmSVVjNVovOTlHWDZQZC9BK0ZHZU1hQkJ2czJMcGhw?=
 =?utf-8?B?cklVT3o0UGIreElEamRxOEtQRHhVaUF3WmxLOXdCSHpoSWJOK2s1YjdZUjRK?=
 =?utf-8?B?Q0F2QWJCNFJyNS9idVRPTWovWFhNajhINjlRWVBUY25yNlV4YU5NVGxDZmor?=
 =?utf-8?B?bldyT1pJK2Flek9abXBSeUJoQmpIVFowcCs4YURkNUZaVFN6OFRjbm9LUHJq?=
 =?utf-8?B?VngxS0EwaEo1VEh3WXJZM0tncWlhRCtqTlV5Nnpmck5BbXFHRHg2dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbbccda-2468-4974-7e0d-08df0542a317
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 20:26:27.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdWvjrzydTQrh87bsjBE0lj5DYQ2vAMmYBiu0lZX40az/nYStl61v1Yc2FMtlHe0lSnjNnGAlL9OQaJEpdTfNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8516

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gPiArc3RhdGljIHZv
aWQgcDNoMng0eF9nZXRfdGFyZ2V0X3BvcnRfZHRfY29uZihzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGRldmljZV9ub2RlDQo+ID4gKypub2RlKSB7DQo+ID4gKyAgICAgc3RydWN0IHAzaDJ4NHhfaTNj
X2h1Yl9kZXYgKnAzaDJ4NHhfaTNjX2h1YiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsg
ICAgIHN0cnVjdCBwM2gyeDR4ICpwM2gyeDR4ID0gZGV2X2dldF9kcnZkYXRhKGRldi0+cGFyZW50
KTsNCj4gPiArICAgICB1NjQgdHBfcG9ydDsNCj4gPiArDQo+ID4gKyAgICAgZm9yX2VhY2hfYXZh
aWxhYmxlX2NoaWxkX29mX25vZGVfc2NvcGVkKG5vZGUsIGRldl9ub2RlKSB7DQo+DQo+IFdoeSBk
byB5b3UgbmVlZCBzY29wZWQgbG9vcD8NCg0KSSB1c2VkIHRoZSBzY29wZWQgZm9ybSB0byBrZWVw
IHRoZSBpdGVyYXRvciBsb2NhbCB0byB0aGUgbG9vcCBhbmQNCmNvbnNpc3RlbnQgd2l0aCBwM2gy
eDR4X3BhcnNlX3RwX2R0X3NldHRpbmdzKCksIHdoZXJlIGl0IGhhbmRsZXMNCm5vZGUtcmVmZXJl
bmNlIGNsZWFudXAgb24gZWFybHkgcmV0dXJucy4gVGhpcyBsb29wIGhhcyBubw0KZWFybHkgZXhp
dHMsIHNvIHRoZSBvcmRpbmFyeSBpdGVyYXRvciB3b3VsZCBhbHNvIHdvcmsuIEknZCBwcmVmZXIg
dG8NCnJldGFpbiB0aGUgc2NvcGVkIGZvcm0gZm9yIGNvbnNpc3RlbmN5IGFjcm9zcyB0aGVzZSBo
ZWxwZXJzLg0KDQo+DQo+ID4gKyAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9yZWco
ZGV2X25vZGUsIDAsICZ0cF9wb3J0LCBOVUxMKSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgaWYgKHRwX3BvcnQgPCBwM2gyeDR4
LT5udW1fdGFyZ2V0X3BvcnRzKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChwM2gy
eDR4X2kzY19odWItPnRwX2J1c1t0cF9wb3J0XS5vZl9ub2RlKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAiRHVwbGljYXRlIHRhcmdldCBwb3J0ICVs
bHUgaW4gRFRcbiIsDQo+IHRwX3BvcnQpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBwM2gyeDR4X2kzY19odWItPnRwX2J1c1t0cF9wb3J0XS5vZl9u
b2RlID0NCj4gb2Zfbm9kZV9nZXQoZGV2X25vZGUpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBwM2gyeDR4X2kzY19odWItPnRwX2J1c1t0cF9wb3J0XS50cF9tYXNrID0NCj4gUDNIMlg0WF9T
RVRfQklUKHRwX3BvcnQpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBwM2gyeDR4X2kzY19o
dWItPnRwX2J1c1t0cF9wb3J0XS5wM2gyeDR4X2kzY19odWIgPQ0KPiBwM2gyeDR4X2kzY19odWI7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHAzaDJ4NHhfaTNjX2h1Yi0+dHBfYnVzW3RwX3Bv
cnRdLnRwX3BvcnQgPSB0cF9wb3J0Ow0KPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ICsgICAgIH0N
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Vf
aWQgcDNoMng0eF9pM2NfaHViX2lkW10gPSB7DQo+ID4gKyAgICAgeyAicDNoMng0eC1pM2MtaHVi
IiB9LA0KPg0KPiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzLiBJbiBldmVyeSBwYXRjaCBvZiB5b3Vy
cy4NCj4NCg0KSSdsbCBjb252ZXJ0IHRoZSByZW1haW5pbmcgcG9zaXRpb25hbCBkZXZpY2UtSUQg
aW5pdGlhbGl6ZXJzIGFjcm9zcw0KdGhlIHNlcmllcy4NCg0KPiA+ICsgICAgIHsgfQ0KPiA+ICt9
Ow0KPg0KPiAuLg0KPg0KPg0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHAzaDJ4NHhfdHBfaTNj
X2FsZ28gLSBSZWdpc3RlciBJM0MgdmlydHVhbCBtYXN0ZXJzIGZvciBJM0MgdGFyZ2V0IHBvcnRz
Lg0KPiA+ICsgKiBAcDNoMng0eF9odWI6IHAzaDJ4NHggZGV2aWNlIHN0cnVjdHVyZS4NCj4gPiAr
ICogUmV0dXJuOiAwIGluIGNhc2Ugb2Ygc3VjY2VzcywgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBm
YWlsdXJlLg0KPiA+ICsgKi8NCj4gPiAraW50IHAzaDJ4NHhfdHBfaTNjX2FsZ28oc3RydWN0IHAz
aDJ4NHhfaTNjX2h1Yl9kZXYgKnAzaDJ4NHhfaHViKSB7DQo+ID4gKyAgICAgc3RydWN0IGkzY19t
YXN0ZXJfY29udHJvbGxlciAqcGFyZW50ID0NCj4gaTNjX2Rldl9nZXRfbWFzdGVyKHAzaDJ4NHhf
aHViLT5pM2NkZXYtPmRlc2MpOw0KPiA+ICsgICAgIHN0cnVjdCBwM2gyeDR4ICpwM2gyeDR4ID0g
ZGV2X2dldF9kcnZkYXRhKHAzaDJ4NHhfaHViLT5kZXYtDQo+ID5wYXJlbnQpOw0KPiA+ICsgICAg
IHU4IHRwLCBudHdrX21hc2sgPSAwOw0KPiA+ICsgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsg
ICAgIHAzaDJ4NHhfaHViLT5odWIgPSBkZXZtX2t6YWxsb2MocDNoMng0eF9odWItPmRldiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZigqcDNoMng0eF9o
dWItPmh1YiksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBf
S0VSTkVMKTsNCj4gPiArDQo+DQo+IEluIG11bHRpcGxlIHBsYWNlcyB5b3UgYWRkZWQgYmxhbmsg
bGluZXMgYmV0d2VlbiB0aGUgY2FsbCBhbmQgaWYoKSBjaGVjay4gRG9uJ3QuDQo+DQoNCkknbGwg
cmVtb3ZlIHRob3NlIGdhcHMgdGhyb3VnaG91dCB0aGUgc2VyaWVzLg0KDQo+ID4gKyAgICAgaWYg
KCFwM2gyeDR4X2h1Yi0+aHViKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQoN
ClRoYW5rcywNCkxha3NoYXkNCg0KTlhQIFB1YmxpYw0K
