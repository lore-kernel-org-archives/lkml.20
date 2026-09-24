Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022097.outbound.protection.outlook.com [40.107.75.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0F4503E1;
	Thu, 24 Sep 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246480; cv=fail; b=b1knK5JFnhyzNho/ID2T04ugR+K6owNXjsj4HNCma5vkmN8SYDsdNkyTXwSRTGOVWF0HNqWlSKX//amvuvr85dYZlSUF+sRb+z4PgjY2e7u7VIFnNB1SBilnVYSg3kV2aLUTNhQSN25nhTDOKewCSepyu5vvJtWHP2XQNM5dpuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246480; c=relaxed/simple;
	bh=H/f3yeKklj1mHC+oaN56fJ1vouPDtaeqc9ftH8u2/6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QFofZt33Blzz9hTbulhL1wP/iFnzWf/7meRSLaIL3XR7FXZcHv1MAZWyz2g8s5XMWHRJD61yvMBDr6p+Sp7Bo9d7HiQ1UPxtt7/yMdaf26sEv4oTfndm1An5jrxcvfxroJYkAfxMiVK5d7+tlT+zS3VGInwfW/1oyCCRjsSrpH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFG2ivf6pcTtCAL6JIM1Q8cBnU8dSVB0pdqQbSiPZaQEEnGIoxbMwNx8rLsUX0mFzgij3bCWgIDNy4djtfq4yYly9UBsoIIKG5w2Ljle2CZgEJPZbFfPUQubI77th52OFSIe5q/Ql0/wTI8vJJCrKsDItphHlve+QCJE3VItD5AKB201Hf9YPxyTQLDrfCMvei6JdRNWfw2XdGV5xvERZimtE/Fe16+FpvzGkZozvJ+25WcakaNxU9AfoYKe2ysUHKkBL52KgkYcKaSNlD57jTUzblp9zdy+JfvW7R8aYUbFXV8ktKOvPjzWv4Gwuz62KICkhViQwL+sI4ch24Qh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/f3yeKklj1mHC+oaN56fJ1vouPDtaeqc9ftH8u2/6k=;
 b=L1+jC/LQLClQEyFmMuynR4erVNwoFKgtktL8Y3TNFcQo5qGHBlltmji9H1Urt/dQCbqDOC1YB2m+z9S6pK1FRMGILTc7RieYag9WFw0nJyAkGH9MyVaDOXwIT1ndyXz7TZ9sSlT0hPKR72QNsxgkB99B2IU97KgRZMQj0VcvHzIU5hKaPyUmp3PGrocdMwnPyeveAP1r9rQSsehI+1FbAK4V0d0A+/HmmUSj5mCL07nwSIO4tbD4lz40+XOZJGHcAVtemffuNbH45CeaVmglRKvFszk3EI6O/RVHz9m7471REAgxOYCWryFvm8sdZRp7sry3FqNf7nFGFuy90F1Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from OSNPR06MB8686.apcprd06.prod.outlook.com (2603:1096:604:498::15)
 by PUZPR06MB5498.apcprd06.prod.outlook.com (2603:1096:301:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Thu, 24 Sep
 2026 10:41:07 +0000
Received: from OSNPR06MB8686.apcprd06.prod.outlook.com
 ([fe80::917f:53b:e702:5918]) by OSNPR06MB8686.apcprd06.prod.outlook.com
 ([fe80::917f:53b:e702:5918%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:41:07 +0000
From: =?gb2312?B?Sm9ha2ltICBaaGFuZyAo1cXHv8fsKQ==?= <joakim.zhang@cixtech.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Thread-Topic: [PATCH 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
Thread-Index: AQHdSoSU/8MOWdbQKUulyhJasr/GNLbaqesAgALjc4A=
Date: Thu, 24 Sep 2026 10:41:07 +0000
Message-ID:
 <OSNPR06MB868686E87BEA4632F003D50F82812@OSNPR06MB8686.apcprd06.prod.outlook.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-3-joakim.zhang@cixtech.com>
 <arKR9oIjbrTM9fTS@sirena.co.uk>
In-Reply-To: <arKR9oIjbrTM9fTS@sirena.co.uk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR06MB8686:EE_|PUZPR06MB5498:EE_
x-ms-office365-filtering-correlation-id: 841e9753-b95e-45c1-3392-08df1a28575d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|4143699003|10067099003|56012099006|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 PdrVvNsbBUMjYj0Wr7CExRG6rQ4mWnLpijY7QR8OdcHIhkA0YZATnXIUnzuGMAVI89kQjVxRep4V4a94RdPJfADRCg+3stwKmzs1/5Nw0ysq0XlPgYcgWuwPZ+EE0cbShFj0B/0qbCJEliT/v0xiwHU81al/1ZwS9g0zF04xgOrj5wiILzm/rrcI59nA8C4T7vaspukok+sNyiErtQildbrtvpoWAsA0ro5RD89GqLEgubWJjunKlvABbb/F2pu1JCycaDUSSUu5kQZulPNTuhnoYzPXvQ4KyNKKjkM+95E4VJ3zsKAQiEj8u+JX7QpOUq2ACS+Wv1pScciI6nyfDqbwk3IDGfxaL79+91K/VFPygXN1I3gwjOyDvBwBIL1jJMFov3+DsXfws4dXMNzAh4hxHbYyK879AGyEhQdt8pypDGP7CSZWFWN2ehFfIJLekCHAMuMrbBg2kMKwNP+EUEDD4nqXPWA7iv8fc6w3pgONBhrAHEcntIKtHFervTyRR7iPD/7EMwcfzOUy+uqAGYt2Zdg0LBw37A3JM56oTWD0yagi07pk/4JhZqaxaKJ0GvrvX/hFHuoxsILg2O5afqQhj61SpXwTG1xzAypy10DMLuj0Saxl4owYQCbr2V32C3puxd6OJZ+vIC8s48wWMyCfJH4CMaDo4HLXdiWp3fs8f1F5h/Pt6aYEI3G4jnFEUWKRZhnzsZ5A63mJIg9DgA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR06MB8686.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?b2QxWTIwZWN5cmhqcjRBaURsMk52TmI5YUQ1US9iVjVTSXgvZkM5TDlkY0NT?=
 =?gb2312?B?a3hNV0xSaUhxWUdxRTJTRHROV3BaSEcyWG1MYStqeDFwRnNaWDhDdms4L1Vv?=
 =?gb2312?B?bllSSUdoNDI3cXR3M2E0eVdKcU9mUmE5clo5alE5Rmd6TUk1aS9oMGNJTk8w?=
 =?gb2312?B?MDJpYVQ2TVNaYU5DeldWYzJ3NS9maEc4djRJTnFwZmhJWWx0MVlRVk5taFdI?=
 =?gb2312?B?WnQwT1RCYno3V0thZFd5enJ1NHZrUEVmR1Foc3F4VU5QZGtvdGl4cmwyQzY1?=
 =?gb2312?B?L1lBT1piR2swK3dKS1g2K3VJd204U0JkNWY0WW03M1dYUHdVSE0ydEpzUlVx?=
 =?gb2312?B?L3VkcGtFNHB1L0NPMWlmdlVxU1djQmszbjdTT0RIelNYZlhpaVphbEFEUGd5?=
 =?gb2312?B?aGdPWGNpbW1LTHRKczV3aHVnTjQ2U0p4cGJlVGY0cENPYzhtWTRiaml4SFR2?=
 =?gb2312?B?dzR6SFZNZDRoS3FYK0VLR3c5T2k0ejhWYktPNWlydW02SlNPdmJIaEMwL2Vl?=
 =?gb2312?B?V0kvdUxkeGN5VDZhRXBXWXdiVWFBb1Z5S0dLWEFJQkIxUkhJdklnbi9Za3ls?=
 =?gb2312?B?VDl6c0NwczhjNGl0NUdyZzFIZDhBYWd3Uk5QbGUzZ2NrajVhc2gxRlhnbTVs?=
 =?gb2312?B?YURXM042Z3MwWWpnUVZLL29yQXg3bTh0ME53Uksya1ZiYUptWUdDTTVDZ29j?=
 =?gb2312?B?UGZ4VUR2VnhMbXpOVmNMeUlmU1Z1ZThTTHNLZWE4bWdlK3MxdlRXYWRUNHJK?=
 =?gb2312?B?SlhYZ1krS1pWZFRXREUwOWdvSm9OU0txczFhYi9zU0Q4VXpzR0lxQjVTRGFT?=
 =?gb2312?B?ZktKTmt0ZUZ0V3NoVGxpTCtsMXdvSU8vMW9HeitaNzNGWjFaYmQ2b1NMbEkx?=
 =?gb2312?B?ZzM2bExvTnNUMGIvU2JUREdKK29EdkJlQjJhcEZZNlRDbDRtV3hVL2RkQ2pK?=
 =?gb2312?B?L2xlK0VlcVAxWFl1SWpCRmZPQ3FxR2V0dDFNRzBoRFFseHhpb2htbHJJV0h6?=
 =?gb2312?B?ZDVsNTZZaFA2SUR6N3cyWHJQcFpEMnNaY0grYWd4WEFYYWRHWnc4ak10NGEr?=
 =?gb2312?B?VzhIR0Y3UllYWUlXSXg1Z2l4QWF1Y2VXZDZjbjZjbzhZOXhHSEZFeTN6QlQz?=
 =?gb2312?B?bGxFcG9pZ1pFbHMvbExGZ09UTXBPK0tvMDZYalYyeUV4QWxndG5aOGlQa2xC?=
 =?gb2312?B?Z3U5dWxJREpjamlzbUJyUTlzc2p6RDRCZHlrUHpmMDRodlJGQ09qSnFWSkpF?=
 =?gb2312?B?T2ZvRHZsWnRBTFRWOElsSmFreHl3WjN5ZS9uU1J5bFFiaDd6YVhEV3VjNmR3?=
 =?gb2312?B?Y21FbXljSVpEVjZBTnBnWDVqREdNTk80Z1Z2S1JkdlV1YURBSmk5NDRTbHYx?=
 =?gb2312?B?d1hKNFF5SHplajdPclZYdlYxb1YrNGFpT1RXcmhNeUlOQ245K3hGaE1kaWJn?=
 =?gb2312?B?SUllRjRtRyttQUtNeEIrN2pPeEU3eU5SNUhPRmlkb1lSWFl5ZDQrTy8vUU1n?=
 =?gb2312?B?UGJPSHJJb2ZsUmt5RDdOM3IveVFkZFVCQklKWGI1MXg0MmpsWGYrOGlwcllJ?=
 =?gb2312?B?S2xZWlpRODAyMlB4ODlBSU9XUGpVMFJIVW1RVUZLZEh6b2Zlc25kdG8yRXV6?=
 =?gb2312?B?eVViMTN4aWQ4eGN5bnJPM2dpa0xFeXh6dU9XaG1UMGpiZjdKYU1PazZoYlhk?=
 =?gb2312?B?VnVhM2lsWHlrdmprU0RsTUQzdEsyZi9NTWpFVjJKbjl0eXVNZmlsZ2tkZlFG?=
 =?gb2312?B?dC91ZkpEQXFFdWxtRHQwT0Q1aldwcmlNczFrT2dUZ0FSRzd4dytVOXRHMTR0?=
 =?gb2312?B?K1RrWVd4M213Wm5UdGczMWZSNS9qa3FBZkpqbEprVVdab3QwLzFVbVoySVo1?=
 =?gb2312?B?SVQzeXNNZ2IwVnpmRmZLVG5RMUgxSVJQNUQxd2Y2YkhWODN1cDJSbGtJc21P?=
 =?gb2312?B?UVVwSmdMR1pYb05iTmw1SkswVTNERUV5eUVJRTI1NWR3eGlTQUFWaVBxNjVo?=
 =?gb2312?B?RENNaDNxUVVHWXN4NkN6RHFxem1kRXVZa3Z2bVkycDRCR0hmVm8zMnNzNGM2?=
 =?gb2312?B?ZTBJcXlmT2REck85K1hwZi9pWjUrT3RnQmRIUndRUXNnSCtIdytIQjlOeUFS?=
 =?gb2312?B?RFZHL3c1THh5N1RMbzhhTGVLVmhnemRQMVA1MnBibHlvTzErakl6Nm5jejlG?=
 =?gb2312?B?YVc0VGxoMHRuMXNSKzlIcHIwUVFTNmlMS1JZUVZscEpUdG1nc3lJb2FKVTVs?=
 =?gb2312?B?Qi9HQTRvaHRGV0ZsL3hyWmFGTWcxZFZsKzBTNm1QYlp1YlpCT2ZockQ3dTFV?=
 =?gb2312?B?NzQ3dGcxVmhhZ3hUQ1ZaNFRrbnpDbHRyTVNvbUIreWtOeGJremNuQT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR06MB8686.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841e9753-b95e-45c1-3392-08df1a28575d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 10:41:07.6209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQjF73yd31zMes7QXUEbDgvnGCINbJTtx+/ukNwrI3CpfSIdL4aDp9YLqi3HwZK/3x+3glXG43cVI0wpqnWJn5CQtpHREaVDa+guWtJhQFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5498

DQpIZWxsbyBNYXJrLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
cmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVy
IDIyLCAyMDI2IDEwOjM1IFBNDQo+IFRvOiBKb2FraW0gWmhhbmcgKNXFx7/H7CkgPGpvYWtpbS56
aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gQ2M6IGxnaXJkd29vZEBnbWFpbC5jb207IHJvYmhAa2VybmVs
Lm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBwZXJleEBw
ZXJleC5jejsgdGl3YWlAc3VzZS5jb207IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGNpeC1r
ZXJuZWwtdXBzdHJlYW0gPGNpeC1rZXJuZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+OyBsaW51eC0N
Cj4gc291bmRAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi80XSBBU29DOiBjZG5zOiBBZGQgQ2Fk
ZW5jZSBJMlMtU0MgY29udHJvbGxlciBkcml2ZXINCj4gDQo+IE9uIFR1ZSwgU2VwIDIyLCAyMDI2
IGF0IDA3OjIxOjMyUE0gKzA4MDAsIGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbSB3cm90ZToNCj4g
PiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPg0KPiA+
IEFkZCBzdXBwb3J0IGZvciB0aGUgQ2FkZW5jZSBJMlMtU0MgY29udHJvbGxlciBmb3VuZCBpbiB0
aGUgQ0lYIFNLWTENCj4gPiBhdWRpbyBzdWJzeXN0ZW0uDQo+IA0KPiA+DQo+ID4gIG9iai0kKENP
TkZJR19TTkRfU09DKQkrPSBzbmQtc29jLWNvcmUubw0KPiA+ICtvYmotJChDT05GSUdfU05EX1NP
QykJKz0gY2Rucy8NCj4gPiAgb2JqLSQoQ09ORklHX1NORF9TT0MpCSs9IGNvZGVjcy8NCj4gDQo+
IFRoaXMgc2hvdWxkIGJlIHNvcnRlZCBpbiB3aXRoIHRoZSB2ZW5kb3JzLCBhZnRlciBiY20uDQpP
Sy4NCg0KPiA+ICsrKyBiL3NvdW5kL3NvYy9jZG5zL01ha2VmaWxlDQo+ID4gQEAgLTAsMCArMSw0
IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArDQo+ID4g
K29iai0kKENPTkZJR19TTkRfU09DX0NETlNfSTJTX1NDKSArPSBzbmQtc29jLWNkbnMtaTJzLXNj
Lm8NCj4gPiArc25kLXNvYy1jZG5zLWkycy1zYy1vYmpzIDo9IGNkbnMtaTJzLXNjLm8NCj4gDQo+
IFdlJ3ZlIG1vdmVkIHRvIG1vZHVsZS15IGZvciBtb2R1bGUgb2JqZWN0cy4NCk9LLg0KDQo+ID4g
K3N0YXRpYyBpbnQgY2Ruc19pMnNfc2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikgew0KPiA+ICsJc3RydWN0IGNkbnNfaTJzX3NjX3ByaXYgKmkyc19zY19wcml2Ow0KPiA+ICsJ
c3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gKwl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ID4gKwlp
bnQgaSwgaXJxLCByZXQ7DQo+IA0KPiA+ICsJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+
ZGV2LCBpcnEsIGNkbnNfaTJzX3NjX2lzciwgMCwNCj4gPiArCQkJICAgICAgIGRldl9uYW1lKCZw
ZGV2LT5kZXYpLCBpMnNfc2NfcHJpdik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgaXJxOiAlZFxuIiwgcmV0KTsNCj4gPiAr
CQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4gV2UgcmVxdWVzdCB0aGUgaW50ZXJydXB0IGJl
Zm9yZSB3ZSBlbmFibGUgY2xvY2tzIG9yIGFueXRoaW5nLCBhbiBpbnRlcnJ1cHQgY291bGQgYmUN
Cj4gZGVsaXZlcmVkIGFzIHNvb24gYXMgd2UgZG8gdGhlIHJlcXVlc3QgYW5kIHRoZSBoYW5kbGVy
IHdpbGwgdHJ5IHRvIGludGVyYWN0IHdpdGggdGhlDQo+IGhhcmR3YXJlIHdoaWNoIEkgaW1hZ2lu
ZSBtaWdodCBnbyBiYWRseSBpZiBpdCdzIHVuY2xvY2tlZCBvciBpbiByZXNldCAoYXQgbGVhc3Qg
Zm9yDQo+IHNvbWUgaW50ZWdyYXRpb25zKS4NCj4gSXQncyBnZW5lcmFsbHkgZWFzaWVyIHRvIG1h
a2UgdGhpcyBvbmUgb2YgdGhlIGxhc3QgdGhpbmcgd2UgZG8gaW4gcHJvYmUsIG9uY2UgbW9zdA0K
PiB0aGluZ3MgYXJlIHJlYWR5Lg0KTWFrZSBzZW5zZS4NCg0KPiA+ICtzdGF0aWMgdm9pZCBjZG5z
X2kyc19zY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+ICsJaWYg
KCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoJnBkZXYtPmRldikpDQo+ID4gKwkJcG1fcnVu
dGltZV9mb3JjZV9zdXNwZW5kKCZwZGV2LT5kZXYpOw0KPiA+ICsJcG1fcnVudGltZV9kaXNhYmxl
KCZwZGV2LT5kZXYpOw0KPiA+ICt9DQo+IA0KPiBGb3IgQ09ORklHX1BNPW4gZm9yY2luZyBzdXNw
ZW5kIHdvbid0IGRvIHdoYXQgeW91IHdhbnQsIGFuZCB3aGVuIGl0J3MgZW5hYmxlZA0KPiBpdCds
bCBhbHNvIGRpc2FibGUuICBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkgbWlnaHQgYmUgZWFzaWVy
Lg0KV2lsbCB1cGRhdGUgdG8gZGV2bV9wbV9ydW50aW1lX2VuYWJsZSgpLg0KDQo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBjZG5zX2kyc19zY19wbV9vcHMgPSB7DQo+ID4gKwlT
RVRfUlVOVElNRV9QTV9PUFMoY2Ruc19pMnNfc2NfcnVudGltZV9zdXNwZW5kLA0KPiA+ICsJCQkg
ICBjZG5zX2kyc19zY19ydW50aW1lX3Jlc3VtZSwgTlVMTCkNCj4gPiArCVNFVF9TWVNURU1fU0xF
RVBfUE1fT1BTKGNkbnNfaTJzX3NjX3N5c3RlbV9zdXNwZW5kLA0KPiA+ICsJCQkJY2Ruc19pMnNf
c2Nfc3lzdGVtX3Jlc3VtZSkNCj4gPiArfTsNCj4gDQo+IA0KPiBSVU5USU1FX1BNX09QUygpIGFu
ZCBTWVNURU1fU0xFRVBfUE1fT1BTKCkgYXJlIHRoZSBtb3JlIG1vZGVybiB0aGluZ3MsDQo+IGFu
ZCBhdm9pZCB0aGUgbmVlZCBmb3IgX19tYXliZV91bnVzZWQuDQpZZXMuDQoNClRoYW5rcywNCkpv
YWtpbQ0K
