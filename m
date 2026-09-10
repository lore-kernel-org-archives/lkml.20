Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC5134CCF;
	Thu, 10 Sep 2026 04:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015630; cv=fail; b=mLmlOM+oHlCm93oh4WOyM5ufm2sGN/3QQ/yLUW/w9LBivd8JFwkMpY3yYwm1savOZ3AKLZW7+sF6vWPnpSMwcYiQ8voc8e4NlGfvZEOADwMRoHTZTOw+m5yH6vFh5u2bkQ2PeGvYB08dXhIeVbPOzmezIw4nD8mJ96QewQW5bV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015630; c=relaxed/simple;
	bh=Xh6AadJxDwuff/ULoxmbCRFf2qFcYITa5bm3AOtoybU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7iTmq8bLuvDaxeuqOkkyVcu23GfBTqkj1kvznqk37Kpg1OsaNg+1FE0MZIcS9zlE+hZrg8rlf0AQSrnkTU5ec0OMdBZ+wLpe7W9FVG4mSboF0nitg4in4bKBL9LJA6hFKlcmBTAk9FNEq9feswRG9dfuvzIbpUd+cHC/6ZFT/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DzDRERJt; arc=fail smtp.client-ip=52.101.46.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DzDRERJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdUAf/ZlViVUQXqXKmLo4fjBN8mpvgg/56kFoC+bQqp8iRPqn5UsARWtTvsshcTUCPurkdSdARgIne/KgI5E98InUA8ukLU5c/C9QFM4DI1JWLv41snT6/ftWV7VKdBbjAIPn+CN4iyHgXMrZrQY9nqlTN/RyWzlmAC6iu1S9xg7M9VYCIzEiXQJu/Fth2zQeUVCyKwtQ2/aqc26LeX4SoSP1upeB3IFaS/UjLL4PtgYEFij4VdJn6/U6nNRnZ7s4yh3Vzeyk9FW/fT4tlwz63weZzERrG1RHGuvI47qDj+5cawG/DCx+aT2SsxEEbSaVpfIHtRXJR2RNECMPPAOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh6AadJxDwuff/ULoxmbCRFf2qFcYITa5bm3AOtoybU=;
 b=UqcjgVcPKc6dfPWGp7iyuKFOKCwmPV7bZPWsDi80BcV5EkpuKrvoofr7TPLo9b13jWCit7IK7h46m72iyX9Cq2FmSfYc1PdsV9kCgMtWp5CFIrBF5lMuled6KrNPfo3EIyg6lhzV8A+f6jIRaHikZXTG8dQ8QHC42vdPUuubbOoXoea45J4r8PlZ3woIKHx1kHdloTwD5hM1ZgUoXGuxeDH6Q3pU3maZ/XMACXAWxmfyQLkq520UDteyEWzzTjacaCAaAFUZgUcnocDkfhgGVgajNArpx/VG3vZXZ2N+ZTNsfBVn0c906P+pYfRA+Y4OsWl71ffKzhe/EswVKhISvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh6AadJxDwuff/ULoxmbCRFf2qFcYITa5bm3AOtoybU=;
 b=DzDRERJta7lhSoiKofzEZasMKomdAg/h0QZOLhWKA7x/mCdQC5vnPU+RN3Wx4mC97+j5b66y4C3r2gK8pIN2BoDrYw+oulvCn3dLAxcJWIxkJXCfxP8phQMSpnb+/WszKvC1/7DOfs2tF/LaqKJlg/RNlRSrgFUT2FnUC50VUP45eK42yN4aQHbjqLNTC+BfIA+sdfi+0PKQGdlOMwr8kR+ctcm8mkopRupvfry3/IVIfSuqvrrFuc2Y1MeWUYiFu4+wC69h7BJJneWOG4AriTzYeKAlMJ2PtlOSxf9UEYZvJavIZYlVappEWEanep+nv2DgmG873KFIZxURcoLwUg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by DS6PR12MB159332.namprd12.prod.outlook.com (2603:10b6:8:4a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 04:47:06 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 04:47:05 +0000
From: Qiuxu Zhuo <qzhuo@nvidia.com>
To: Borislav Petkov <bp@alien8.de>
CC: Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Index: AQHdQG4oBWj+KZ5gc0ajhRCUEVZKirbGhmyAgAC2M/A=
Date: Thu, 10 Sep 2026 04:47:05 +0000
Message-ID:
 <CY8PR12MB7290F0B20CB72D255AD77C35D1BF2@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20260909151531.69074-1-qzhuo@nvidia.com>
 <20260909175003.GBaqGcS96zIUbWmIJ0@fat_crate.local>
In-Reply-To: <20260909175003.GBaqGcS96zIUbWmIJ0@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|DS6PR12MB159332:EE_
x-ms-office365-filtering-correlation-id: 8e05ecb8-9095-46a4-1f8f-08df0ef6907c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 tBX/HdMbna4J/zbteloIW1moJn+2BxmZivFcvGQGWa9igxGj+HnZ3ASH8Sx2xBNpUCgYOJjhI1UA3FhfBEGdfriFfqz0ELv1qeEI2mhNyxn3L8+Cp0QbR7ehTjUB3SlaNJMhiOTq21HtG6FXJJ11ERBCsbSzZnSx2sReswtAsl3sp/fCiST9d6q9yx3+iPPxwCLPvigA4w1SEAi0bsKl1IMfqq9FlncepGlUcD7nf7Ui6nC1oHBf5YmHKrEzpP2luMsby8I/jlPL9/Zr9GjHNa2+kWNOpEtUJsR4bF4YGoPgVnJLJQYkpr8uns9iy0FBsciAiE7nzDpZwaMbAOTxsVdNOfKjz4lwm2O6Ihur0vHnup5M8s1qnc/iwO4fGfpRy9lmMzcO7WcOdKby5QfboQ7N0xfYR1APZPHy+Yx2g1gdQ3t7UGNFaJdSn5fkNhROXMs/xPEjlTutBGawH56hpkbyvtdCP5hBNTIp+Jkn8A0XqrEKNIQ9Soc3U4aqb7O7xn28v7iNkpEnV1n+mQhFHQcFFtEyG+6HLuZUdnDZCban86gigpqVeqaqzhSICtjqWUnY77G67g3YNUUl06Udn86RpNSLJI4v/JZnDS+qdx9huscIRwrwDZ0Q93BxPPHJ3gU8kNz0vPJJ975MapT0M93+GnjDmJ+sf1tXSbMlQdFzY1J4/sVL/UjURGyfVqeALnJAHmbKZ3LlOp5/7VeHG3jaD+Im71AT46iMSARQ0hI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkNBdmVacTJMdTY4QjBWMGFhSjFQdUFibUQwSi9lazhWSUZUN2hVczZtTGdW?=
 =?utf-8?B?eC9sQlVFbGc0emdmeFFpa2VZaUJuL0hicExsT2cyRysyc2FPSS8zTC9tWGly?=
 =?utf-8?B?bW9WZzdSWlByN1BWdEREaTZUd2t6T3ZndmhrTnQzWWVpZVJuRGhGcFF1bUht?=
 =?utf-8?B?UmQxKyt0Zk9sK3NycGdxbGRkSzFuSk02TU9CUk1CR1hKL3ZGOFp3SWx5azBO?=
 =?utf-8?B?UjNYbUg1TFZjUGExeUhrWVM2b1R5UnMwNGErZTFSa1IwQ2tZaEx2M0FDWGxI?=
 =?utf-8?B?QVVHVGM3dWNDQU9tSWg4V1ErVFE0UGtQRksyQmhvbmlQSVdSd1lKRGVIaTYv?=
 =?utf-8?B?VlZpcGdTeVZsVUVKanpDU1dNQ0xJUTQ1SUVIU0NrUmtIRElWM3kreDZLeXVP?=
 =?utf-8?B?bFNSbWxicU5rUVZTRjBYb29sc3IrejJ2eElZbUdPM0RwVE9MVlBuaEJiR0FB?=
 =?utf-8?B?YUU5dmNhaU95dUgvUk1QNURYUEFrUUtUS2w2ZWdpRzIya3QrSzM5eXlMalN0?=
 =?utf-8?B?REZ0TXYzRU15WnVvYUEwaUZKUk1ySzM5R0IrTEhTVHovdjZ4NDBPZzZqMEVO?=
 =?utf-8?B?b2ZJWmx4TE4yc29hTHRSUDZXdlFCZXpXeVYxRkpNOEZXdnhEUWtCbUsxN3hp?=
 =?utf-8?B?cWRQTTRQS2pMSUlrNnhvSkRUSDE2dndYSHZud1ViTjdZWkhtbDNIMjcxNzc1?=
 =?utf-8?B?cmFwcmJNQkQwNnRlTTVOdW5XY1JKbjJIMm5LU2d6ZGlGTkVIOTNZblFvY2xU?=
 =?utf-8?B?QSt3VlRrUlI3TzZleVBhZnBJYlJmbTh6NWhDWmt2SWFDZXRVaDhONGVWR3c3?=
 =?utf-8?B?dWlBYU1zVjZwQVJQZUFlamU4RmovZlA2TVdBMEI4QkpoZHd1TVJUckZuekIw?=
 =?utf-8?B?SUYxODd0ak1oMUFFdkZzbTcxNkszSGVSTE0za2UrOFJsMG03S2VTRndRaGM1?=
 =?utf-8?B?OXpNZW9DS05VSTdOcjN5RHZZZVZ0WCtqVk4zQWpHdTFRQVdNQU9vZ01WQ2dR?=
 =?utf-8?B?a0xTV1E4am02NzR3VWFnUUJDQ2wyUWxmVWY1aHkxUmRPYStvSkszUDFkVVUr?=
 =?utf-8?B?T1NwQS95dGZKZWVMaXBHTXp6TnJOM0VSa2MwOVpCenBxNjRNVzZZQWd3Tm82?=
 =?utf-8?B?QmlXUFBkc3p5RkREVTg2OEVQdlF5dkdpNVo5SWh6K2pkWWJQd2RNK01kdHZR?=
 =?utf-8?B?SUpJYndpb253ZnIrdzhiT1RPY3JaMGZyVkNiRHo4THFBOVZlSHhwajNkaVpj?=
 =?utf-8?B?TW1wTm93WmJzbGIzUmlQOEVJOE5VZlpiejI1c0JwbGMrVUtUMG5EQW9vOTZv?=
 =?utf-8?B?ZERWZ2pwT1hjYk9nclorQjBzdlRNeHhqYkc2YTlhd1J0SHUzQSt4dUhaeldi?=
 =?utf-8?B?VHI2Zm1MZTNSVnY4MDFWdFMxdE04eDhvWHYyS04rTUp4WGZRd3dSS2E1dU9p?=
 =?utf-8?B?SzdoTlI0dnYyTjFmQ1c5ckJhZHN6M2U1c01QYnR5YjNqYWpTbEdvQ0Vud2pH?=
 =?utf-8?B?Q3MwY1laSFBtRm5ZQjlyNlhFd0E2RVZZZnU3VEZDcUEvVEUyUUEwUXFLakNL?=
 =?utf-8?B?WGhtQ2tOY3A4Zm5MbXA4cjZCTVBjeHRBMUdDR1dHZGF0TXBJY1dnby82aG91?=
 =?utf-8?B?Z3RiV2pGMWg0U3pIaXR6S0hCQXh3KzFsT1lSaG9oVGRZSVMvcmRGVHJEMTlk?=
 =?utf-8?B?RFpyNGFoeisvQkYwaEtRUjVNZ21aOFd4cnIrMHc2bkMzVUpadUJZV3JpSE5I?=
 =?utf-8?B?MmpMMU1HYzEzMHoxSHFxek5HblNNbk0rZWNXdmhGUjFBNk00QUxpcTRZdFhx?=
 =?utf-8?B?R2pMTGsxRk5Qb3BnbGJjcTJBS2R6dXdLNEdjY3lmeDhzMkNSaStEK013VDRh?=
 =?utf-8?B?QW5LUi8xcVZmTGk0YmFocE5ZU0RmK3ZzU1cyREppUkRNUHU2eW5yVDdGM3Rx?=
 =?utf-8?B?cFd6c254ZFRnelhQN0hZaEtZOStBcjlERnhucUZKTEtZb3BCU3NCQzllWnRu?=
 =?utf-8?B?czY5VHQ4R0VhcGFpbVAwTER6dDlpUXYrVDBUejhKSG42c05JUVppZjVSRDg3?=
 =?utf-8?B?VUdsRmFYczhBTEVSSFhKY21WbHpKdktrbDNGd3Y4ZlJteHd2SGkzY3FhbnBX?=
 =?utf-8?B?bEtZSTRnaHAwTXJrRFZUcGlxWTl6UzRGQjBBR3FKVE5rK0lPLzhYMWI5VlBp?=
 =?utf-8?B?Slo0N1Fkd3R5UTF4Q1pSQkt0bDFtTHcyY0NJdnZrMG1yNGNjMGZKS1h0QWw3?=
 =?utf-8?B?Q3Rqc3VGa2hLNVFycWZzZ1UzaGVUT3k5Tkp6ZEEydSsyaGlCSU4xanA5a0Nn?=
 =?utf-8?Q?QbHtIe1kX7xXtUymwv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e05ecb8-9095-46a4-1f8f-08df0ef6907c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 04:47:05.8615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gA/MMesG/hpxN1UccQeB64ZN4rN0mL64aKSdkkJTbkL53jxm7lkY+GhTlITqNJ4RY3MlianH7hzJpE0iFfhsYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB159332

SGkgQm9yaXMsDQoNCj4gRnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+IFsu
Li5dDQo+IEZyb206IExlbyBaaHVvIDxxemh1b0BudmlkaWEuY29tPg0KPiANCj4gRG8geW91IHdh
bm5hIHN0aWxsIHVzZSBRaXV4dSBvciBzd2l0Y2ggdG8gTGVvIG5vdyBiZWNhdXNlIGxhdHRlciB3
aWxsIGNyZWF0ZSBzb21lDQo+IGF1dGhvcnNoaXAgY29uZnVzaW9uIGluIGdpdD8NCj4gDQo+IEkn
bSBmaW5lIGVpdGhlciB3YXkgLSBqdXN0IG1ha2luZyBzdXJlIHlvdSByZWFsbHkgbWVhbnQgaXQu
DQo+IA0KDQpJ4oCZZCBzdGlsbCBwcmVmZXIgdG8gdXNlIOKAnFFpdXh1IFpodW8u4oCdIFRoZSBw
YXRjaCBJIGdlbmVyYXRlZCBsb2NhbGx5IGRvZXMgY29udGFpbiB0aGUgY29ycmVjdCBGcm9tOiBs
aW5lOg0KDQogICAgJCBnaXQgZm9ybWF0LXBhdGNoIC0xIC0tc3Rkb3V0IEhFQUQgfCBoZWFkIC1u
Mw0KICAgICAgIEZyb20gZDI3MDhkMTFkMzY2MGQ0YzZjNGM0ODk5NDQ3MTJkZDU0OGEzMDA4YSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCiAgICAgICBGcm9tOiBRaXV4dSBaaHVvIDxxemh1b0Bu
dmlkaWEuY29tPg0KICAgICAgIERhdGU6IFdlZCwgOSBTZXAgMjAyNiAxNDowMzowNCArMDAwMA0K
DQpJdCBsb29rcyBsaWtlIG91ciBtYWlsIHNlcnZlciByZXdyb3RlIHRoZSBGcm9tIGFzIOKAnExl
byBaaHVv4oCdIChpbnRlcm5hbGx5IHNldCBmb3IgcHJlZmVycmVkIG5hbWUpIHdoZW4gcnVubmlu
ZyBnaXQgc2VuZC1lbWFpbC4NCg0KRG8gSSBuZWVkIHRvIHJlc2VuZCB0aGUgcGF0Y2ggdG8gZW5z
dXJlIHRoYXQgc2hvd3Mgd2l0aCDigJxGcm9tOiBRaXV4dSBaaHVv4oCdPw0KDQpUaGFua3MgZm9y
IGNoZWNraW5nLg0KDQotICBRaXV4dQ0K
