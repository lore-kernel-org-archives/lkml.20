Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023135.outbound.protection.outlook.com [40.107.44.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4523ED60
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424419; cv=fail; b=U1a52aYMt4njIgOkSlVQkaNxvi2Z7psk1/jIHO5WUyLghth1Vyfu0aBX+DvH5mObIW6ia/Z4qELUoYFXuO9Zf3s2RHDI5NHZ2SRVgyhjnd6SedstWaG0DcZhjEfGjOw1FDSHJsRkjb+dtZug6Al/C9QCi3KhIUn2VRtDU1ZNWdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424419; c=relaxed/simple;
	bh=/NkAjHB+tyxF3hRDzinFEY12ZKy971HTj8teZP+ngo8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fm+megSckqS+DVetmXs0b6MYXl7lKmvrtrSk7LnO6guwOtbvK5dqsBqXpNTvZIKrqq/9GiFGMarUnBHDxVOg5VO2CCfJVMqN4DTlZNPcp2gPsjLwZR6V+G9x9Iqvdk5FDpqeS4OIaAcnjHEcFRHU0ax9ApQvQ4H2LaIswIpNNkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=e+gt6GNP; arc=fail smtp.client-ip=40.107.44.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="e+gt6GNP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/DXLJR1mEEVTkXCGUgwdkvnKq3BustejunJNepi60ge7UK2YGMsqVsUutvYbQ8KGKTEccaD6BCp6cJKP4XOx0Nxj4ryIPQzcCulbHTXp7zmr28hUYWiZystn0oZqDJyfZkjQJAabtDbVzRzK8PoNQOevkwXON2GXR4sA1Ce4MFQ1l3NYVBNyo6GWUUyR72l2bgVIhFAaL6yZ6dBek+C6yzqo0SpMAssso1a6wzINTPJy837Tt6Ci6TTRsSRW40SUMmq49B9LooZC5Ge33ktotLCeVEHKMe6PMgEs/lT8zEXma9eM0zdc0AREceIingvrjWG5tGklnAjG1mIAUWEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NkAjHB+tyxF3hRDzinFEY12ZKy971HTj8teZP+ngo8=;
 b=HUg+z2rlzBzdRBrlKkLgfvTIoRpoXEq8ijtKxf1nW0k7qTpwg1IXmLDwd6+WP1uH1pBsm0tMXKMVLN1vZQnS2KVvu5FS83CRxW7kZ3pbkFD9wYe22mAx5kTtsTo/RsaAn6HT4o3jqbRQvbxUZ+MuXyr/eJ9YX3x28M5Fzy1JNrv+I0tQ9wueT5tTWz+Tfxdg7EqMgMnE1O3RiJo6jsauG20shBVhSmZ6DJxYQ6SeRSRJMnQA5H+cn0bWOmRrSoXlFCZH3Q+/IdiX34A8/CyPtVYcrxpdg6orZedW+xl4nQulTcfXxx+xY5pGGis0ShdwEB3hJa7/x/1gvkjVcMLZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NkAjHB+tyxF3hRDzinFEY12ZKy971HTj8teZP+ngo8=;
 b=e+gt6GNP1YBxd3QhFwnuuPRwelO3b2W8nhzYxtJVJScKAeFtcgFlbnJe7MOVHxNkwHY/f+E8bcdmQDFiIjskm4HLkNkkdUHmFmuPu1Ibuc9PeuQLFy9/nnKEgvV8zKEqSzLoiDU15KtAZ+k687RABQUwucsgxtxkZOYeNN2azb8=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY0PR04MB5635.apcprd04.prod.outlook.com
 (2603:1096:400:1ac::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 01:53:34 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 01:53:33 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Valentin Schneider <vschneid@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, K Prateek Nayak
	<kprateek.nayak@amd.com>
CC: Jiazi Li <jiazi.li@transsion.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched: Convert last bits of deprecated static key
 usage
Thread-Topic: [PATCH v2] sched: Convert last bits of deprecated static key
 usage
Thread-Index: AQHdO5to2npikgiau0Ogb4Mq2LQMJbbwibuAgAKOgwA=
Date: Thu, 8 Oct 2026 01:53:33 +0000
Message-ID: <cd340d0b-31b0-490a-9961-78c5de117e70@transsion.com>
References: <20260903115728.11864-1-hongyan.xia@transsion.com>
 <xhsmhh5izyufq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmhh5izyufq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|TY0PR04MB5635:EE_
x-ms-office365-filtering-correlation-id: 9922a55f-c67b-4363-b3e2-08df24def5f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|921020|38070700021|56012099006|11063799006|10067099003|6133799003|22082099003|4143699003|18002099003;
x-microsoft-antispam-message-info:
 4vAXPcCWgMLInFfT3XMlbLqdCERQbPz9bL8o5e4C7N1h6co4fX5QD11S7MWwyR0ahMwnx1vrKYlrib9pwYmtpTPGwOhzXipMLVQcKunrTyJPh9cioFzkCU1y2UQxIEjukJu4eTlpw0TyYPkAbS8GIKqphnSAHm/FXcfWUVvRPNVayVaohBdGqVA5A4mBEOb95oRqk/U3AQINDFT/qcu9YcUitUIqkIrTPcpaRPul9UwLkHR91pIIiXMZq4VcQQx3RlgFWPd9M8VTH+XhWCjH42SBdAgGgcZgL2xZVrpo4ILO0dlOSxKQ/qCgI99dZmAQP74BsU0ixzYwAZ35FKE+RCsFFioTWs7sNoylSOGF37F9Qs45ta6RCHqc6mM3T1AGsG3KU/kDM2dks2nh2w+/MJ6eWYFSZA926CNrhuxO9bLbjg1Z6z+pXP1VuLg6siSD8Aj/yMe8F3v13tOoZBDnmPrwGQ5/nhbwcVLPOvo3Zt1LtvTfOoBO3n38euNEKZ2LEWBSXQY76Q9o4iUhM6NlSbPK/3+LOEG8TPSp0lrQhtaoDjTI34/4tkLETngOnDLFgpiic6/xcN0x4/ogS96tFjlRMC4dQxCL1r/PmGCj4C/VQSQ6ckV6k+3fRBnhyMaghfmXAHuwe6tFgU1PBJo/PUMaf6pB1vwYHugWpemnAIqjeG3AXKp0/GccmOzzkdNVDJc6E3UEzgf7z+655W62wcTdvVREaIXxcd8pM/T+gtGKiN+6Qi5/upNdXmqc3uZm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(921020)(38070700021)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nk1GeEFlVzI4eVFoZFB3MnBuY0RrV1IvMDdZaGI5ZWx4V0l0WDVIME5Ubllt?=
 =?utf-8?B?YVlnWUozRFFxRG5TZ2wzNnF0UDZvNDJYVmptUitwd2IyOUs3dC9rbzRPRXFy?=
 =?utf-8?B?bGxVT0RVUmNsaUtoV05kVnRSRmxiOHFKU1plL0I4a3I2dGxIdS9aelV3WFN4?=
 =?utf-8?B?aHROZldVSE1ZdTJ3UjI1Uk5sb09ORHNIQWdjUnRDMndQcEx2akNEZEVDSjZs?=
 =?utf-8?B?dTRqMWpNSXlybmJvaUsvK0V6MTRNaFNIMWRPN2poVDJncUtMcmVtMEh5OGw3?=
 =?utf-8?B?VGtFcW5DQ09vN2dQazZsQzBteGI1MUNYZEdBN3hROXBHTWcrYVhsb2hhU212?=
 =?utf-8?B?dnFvays0NUk5VXlDZGJmUTVScDBwaUhkeUJHcUZvZVFLaWUrWWJUU2Y1Wjd4?=
 =?utf-8?B?NkdBa0FCZmtQelRoS01YUkFUQUt6WlhPa01jVjRDQXJWRm02R0wwVTlaTnlP?=
 =?utf-8?B?d3hlRmNnM1JnbVp5QzFjT2YzZm9NMzB6VjFKTDJEVXpzL0x2LzdvUWhGMEs3?=
 =?utf-8?B?eTgyR1ZrMTBVY0lRb050eVN5Zmc2SHdWTlpId0hXNHF5dTh5RG9BdjBpZEVl?=
 =?utf-8?B?bUNHMEtVS083MkI3S2REcHFlZlgxd1M0ak02bnI2NisxTThuMEV0bDNjSVRV?=
 =?utf-8?B?VHVkU2lubDNEbGFsMTkrc3dZZHJ0RWhxY1VReVlKZUNVWFhENkwwZFd2RVh0?=
 =?utf-8?B?LzJwRGdpaUxXa3dYU3o2TmMwUWh4VnNYbE5xK09kUC9tRkFCWlcxdnVHc3Ft?=
 =?utf-8?B?U0NJMnRaTUZ2WG5oRytqZW1ZOXJrQ2VyclIvcVZ3dkdMNFQrc1FtVlgyNGxr?=
 =?utf-8?B?cFk0TFlhN05XUzlxUmlrUms4aDFESHVPV0p4dUtLS3ZTR2RlR3E2NkpoaHAv?=
 =?utf-8?B?eUM2Y2xZZUVWd1J5QlV2bHRjeWlOTVduMm15ak4vZVhVK3RHaVExUzRMNlcz?=
 =?utf-8?B?K2p5ak4ralRzNmljNWQ4T2NaSUZKSEhPdW5sYkl2Q1pyY2pWRFl2UXI2cS9B?=
 =?utf-8?B?TndsUm4rM0RvR09kcEN4MVJIbDc5b0hCRHM5MW1qNWR5RkV2YVZHcTl1VWJE?=
 =?utf-8?B?bHlxaldDdlNyQkhzVklLazVlQnVweGRRVy94Vzg2RlQ2cy9JRWRxQWZtSUl4?=
 =?utf-8?B?MURhdWR5QXhSVThGTGQ1MEl2akM5UzR6UnhMWnNjRERTR2hGdnV1UlIwU1Ni?=
 =?utf-8?B?SnRIam5kcWg1Ymk3M2VHbkpMMFl3cnJ1azhqdklkUnpUanBET1ZKaHJjZE1H?=
 =?utf-8?B?VUgwc2p2dkhNcmFpV2tMTUNpanRHRURDellnL0o2TFhndWpyYzlNdStKc3JI?=
 =?utf-8?B?eE9VTUJpZ2Q1N25tVldEM2dvVWw2VWVuaHNveTlEMFlwYXFnZGR2eFdiNFp2?=
 =?utf-8?B?UkJXeG9mb0hsRHdFaUw4cEM4UnMvZGR6TFAzODEraFM5dWtuY3h3TWpNdGRM?=
 =?utf-8?B?SzdwbU9malRzc1U4dXlkME5MbkZFVDdnZ1gyQzFzZjI1ZUhhNFZQQWRuZ1Qv?=
 =?utf-8?B?dmQxMXMzYVlENDFqN2pTMGs2OHpuYkpMekhEY1pjcjBUV3VxdHdFOGV5T1Vn?=
 =?utf-8?B?TDFKT2NoNHNHUjlRR3lQbWFoZEwrS0QxQkZib2RIMjM1VGtWNnB1ZzVEMG9q?=
 =?utf-8?B?Mis0WURjSzdyQVdXRUxHeEFta3FHTVZNVlNPU0NaNmFQZWJ1SkJwVFFOSHdm?=
 =?utf-8?B?OTZxUlg4dmhnOHRHU1FCY1NuUXowRU82NGF3NlY0RGhrTThKQUw0M2RrWHNT?=
 =?utf-8?B?Wk9xZWRmL1ZNMDUrUlZIV3d5QStSeC9DQlhJYVA2eHAvcHM3cGQ3dDNpamdJ?=
 =?utf-8?B?VzFOT1E2RlAwYzB2VnI0SlBUSlRtazJ1N3dsR1N4U1FNY21RWmFHUUdNSmR3?=
 =?utf-8?B?cW83TVVDM0FURnIrUVE3VFJlbmJiSWtUNFB5UmRDVHR1OXJJV2EvbGE2SVFm?=
 =?utf-8?B?K2YrUXU2Ni83ZndYYjQzZENYaGxwZDl1WEo3UkFyb1hBQmJkV2NHejdjM2xS?=
 =?utf-8?B?QXJJSGloMEZ4ZEJNY3ZHZ3JXNXErbU1ZRWVCd0cvM2dYblBvdUkyTkxEalBy?=
 =?utf-8?B?SE5DeU5oWmdZL1lqL0NDMXhTTjJRSnZsQUxubDlMWUZRVkMxRnNVemtJcUpv?=
 =?utf-8?B?MkZQRysyTGhjelBlb0NWUDVGSExCa0pCTWoyZnJQalI5WVVtZ1dRQXljSW1Z?=
 =?utf-8?B?cmRNT2JraUJzVnFnVlQ3ZDBhbVdmUWpIVTBZNkJIY0Fjbkt0UlpIa2c3bHBp?=
 =?utf-8?B?VC94eDNwMklnMDJWbHNkMitPQ3F1TEJ6dlVaLzFYbE5oTGlwZUVyVW9NQ1ZK?=
 =?utf-8?B?cGhHZFo0TjlYY0w0UXo0WFZteUxOOS96cnNqQ2Q3akp2cFUxcnFlektaUE4v?=
 =?utf-8?Q?2CVjoatYY887LJyc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE586EF0AAF3924EA973BB4E7FB5A4C1@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9922a55f-c67b-4363-b3e2-08df24def5f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 01:53:33.7144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+t5k4WKw9ekgsgoCiXw+MCl6sMsJTICEC/lFUAp7hZIhtRSMrHxLi0Xd/4ohBp15A0E5KzX1t4N7KC7Us98oXAw5jckKopvnUwpzO+DANI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5635

T24gMTAvNi8yMDI2IDY6NTAgUE0sIFZhbGVudGluIFNjaG5laWRlciB3cm90ZToNCj4gT24gMDMv
MDkvMjYgMTE6NTcsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPj4gRnJvbTogSG9uZ3lhbiBYaWEgPGhv
bmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+DQo+Pg0KPj4gUmF3IHN0YXRpYyBrZXlzIGhhdmUgbm8g
dHlwZSBpbmZvcm1hdGlvbiBhbmQgZG8gbm90IHByZXZlbnQgbWlzLW1hdGNoZXMNCj4+IChsaWtl
IHN0YXRpY19rZXlfZmFsc2UoKSBvbiBhIGRlZmF1bHQgVFJVRSBrZXkpLiBUaGUgaGVscGVyIG5h
bWVzDQo+PiBzdGF0aWNfa2V5X3t0cnVlL2ZhbHNlfSgpIGFyZSBhbHNvIGNvbmZ1c2luZywgaGVu
Y2UgdGhlIGRlcHJlY2F0aW9uLg0KPj4NCj4+IFdlIGhhdmUgYWxyZWFkeSBjb252ZXJ0ZWQgb3Ro
ZXIgc2l0ZXMgaW4gcHJldmlvdXMgcGF0Y2hlcy4gQ29udmVydCB0aGUNCj4+IGxhc3Qgc2l0ZXMg
b2YgZGVwcmVjYXRlZCBzdGF0aWMga2V5IEFQSXMuIEFmdGVyIHRoaXMgZml4LCBzY2hlZHVsZXIg
Y29kZQ0KPj4gaGFzIHplcm8gZGVwcmVjYXRlZCBzdGF0aWMga2V5IEFQSXMgbm93Lg0KPj4NCj4+
IHNrX2R5bmFtaWNfKiB1c2VzIHN0YXRpY19rZXlfe2VuYWJsZS9kaXNhYmxlfSgpLCB3aGljaCBh
cmVuJ3QgcmVhbGx5DQo+PiBkZXByZWNhdGVkLCBidXQgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
bW92ZSB0byB0aGUgbmV3IHN0YXRpY19icmFuY2hfKg0KPj4gQVBJcyB0byBiZSBjb25zaXN0ZW50
Lg0KPj4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWFuLnhpYUB0cmFuc3Npb24uY29tPg0KPiANCj4gU29tZSBjb21wcmVo
ZW5zaW9uL2NoYW5nZWxvZyBleHBsYW5hdGlvbiBuaXQgYmVsb3csIG90aGVyd2lzZToNCj4gDQo+
IFJldmlld2VkLWJ5OiBWYWxlbnRpbiBTY2huZWlkZXIgPHZzY2huZWlkQHJlZGhhdC5jb20+DQo+
IA0KPj4gQEAgLTY1NzUsMjEgKzY1NzUsMjEgQEAgZW50aXR5X3RpY2soc3RydWN0IGNmc19ycSAq
Y2ZzX3JxLCBzdHJ1Y3Qgc2NoZWRfZW50aXR5ICpjdXJyLCBpbnQgcXVldWVkKQ0KPj4gICAjaWZk
ZWYgQ09ORklHX0NGU19CQU5EV0lEVEgNCj4+DQo+PiAgICNpZmRlZiBDT05GSUdfSlVNUF9MQUJF
TA0KPj4gLXN0YXRpYyBzdHJ1Y3Qgc3RhdGljX2tleSBfX2Nmc19iYW5kd2lkdGhfdXNlZDsNCj4+
ICtzdGF0aWMgREVGSU5FX1NUQVRJQ19LRVlfRkFMU0UoX19jZnNfYmFuZHdpZHRoX3VzZWQpOw0K
Pj4NCj4+ICAgc3RhdGljIGlubGluZSBib29sIGNmc19iYW5kd2lkdGhfdXNlZCh2b2lkKQ0KPj4g
ICB7DQo+PiAtCXJldHVybiBzdGF0aWNfa2V5X2ZhbHNlKCZfX2Nmc19iYW5kd2lkdGhfdXNlZCk7
DQo+PiArCXJldHVybiBzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZfX2Nmc19iYW5kd2lkdGhfdXNl
ZCk7DQo+PiAgIH0NCj4gDQo+IFVzdWFsIGxpa2VseS91bmxpa2VseS90cnVlL2ZhbHNlIHN0YXRp
YyBrZXkgY29uZnVzaW9uIGZvciBtZSBoZXJlOw0KPiANCj4gVGhlIHByZXZpb3VzIGRlZmluaXRp
b24gd2FzIHByZXR0eSBtdWNoDQo+ICAgPSBTVEFUSUNfS0VZX0lOSVRfRkFMU0UNCj4gZHVlIHRv
IHN0YXRpYyBzdG9yYWdlIGluaXRpYWxpemF0aW9uLg0KPiANCj4gQW5kIHRoZW4gZm9yIHRoZSBz
dGF0aWNfa2V5XyooKSBuYW1pbmcsIGZhbHNlID09IHVubGlrZWx5Lg0KPiANCj4gQmVjYXVzZSBp
dCdzIGFsbCAjZGVmaW5lIG1hZ2ljIEkgYXNzdW1lIHRoZSBjb21waWxhdGlvbiBkZWx0YSB3aWxs
IGJlIHplcm8sDQo+IGJ1dCBJIGNhbid0IGJlIGJvdGhlcmVkIGdpdmVuIEknbSBvbiBhIGxhcHRv
cCBydW5uaW5nIHBvd2VyIHNhdmVyIG1vZGUuDQoNClRoaXMgaXMgZXhhY3RseSB3aGF0IEkgY2hl
Y2tlZCBiZWZvcmUgc2VuZGluZyB0aGlzIHBhdGNoLiBUaGUgZ29vZCBuZXdzIA0KaXMgdGhhdCBh
dCBsZWFzdCBvbiBteSBtYWNoaW5lLCB0aGUgZGVsdGEgaW4gdGhlIG1hY2hpbmUgY29kZSBpcyB6
ZXJvIA0KdW5kZXIgYWFyY2g2NCBhbmQgeDg2Lg0K
