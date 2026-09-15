Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013023.outbound.protection.outlook.com [40.107.44.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A673AF647;
	Tue, 15 Sep 2026 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461348; cv=fail; b=nHcHo+aTp680aQAzDWRyoOUEV5goBJZrN952GKyTtHoNk3luoKLmbflb1inEbPGXJCgVZ8amYieWi1FpBK2uydHpfROejPQIvbCx53fK9zt5BGdeKp/Qclc/WVZ+yvJ1TGVf1o7Q41mJx+RIw91Vg7MtPXau3umXM8sbs62wjQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461348; c=relaxed/simple;
	bh=fzrjhbqe6d7KZNV4IUBzPdFjzQTqn2uwGMbUxD6vjvo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lD3NXfm/9Es1BSLQNrlRBgVFQbH43YY4XJB2/RdUyaqr2cUIifteBYKFYKAzLRKIT9R4f3xxP3iwxUSTLyUBxhpzVqdPECMjc2dvrrkWd+hsJ6UhdBDW7UyGLOZgqilv75+8yfh5WVZMovE2La/mcXvyUeW0ZYE5r7W28UPQ2Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jr5KWIHe; arc=fail smtp.client-ip=40.107.44.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jr5KWIHe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4AYgVwcXCEVqC1ZAe1HE6C80s3tzPnkLH0kGu6X8pQ/ON4RGfiQYSLlWknZjWBa0xj6cYAFtF9Dzu6tw0NpyCRsbNRPX5azK2RFs149M3YhlEM0jOwBpRwfz8qHjTon+IvQTRSb2zoCCe4WPCNgcFgMQC/uw2L8Dhsob/8nQy+N84bw6f+N9Y6JxOaPrUeroIdhI2ofON8l2ztwU3Xjci3EzeHTGzA0Kq4QQRTwqcHvi2q7GhfFAiMIa5bo2/LisqbrEO4h9mDdbiBId6JbN+wmvMsNCNPugKpLg1fY0bhw4EwhBfIITpJjHepdtYYUXPoM1u0+lfmboQhS+3tEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzrjhbqe6d7KZNV4IUBzPdFjzQTqn2uwGMbUxD6vjvo=;
 b=w1xePLbx/yrdNm9zmkSR7zkZ5ti1/Z97jj018rm4DhlntndhDoVnKO48XLPRopaZVZgnRwpY+g2lq+dooyzcqmmqYxxcXlFp3ZAydY3CtD7sa/AplNk1yu3gkUKn7eFHEDQtg6GLCtTS26fj6WlhTNksxGleUrjIJvvpHgs8KS1hCpz2O+wI+CUlkJOiASJhxtTnKE2yJjKO5Grnz0lnL9S7AmJX4VloT1mmiLZAZd+RwMB9JcDCqKqIBCwRI5kpu4LDervuuZ5XR/ByZ/abCu1mWmtuXJxrL1a1RH9TJmEe7JUd/cDAXHTlCRG6CQZYeZ5dVDwRjzWp4gZLyM6xqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzrjhbqe6d7KZNV4IUBzPdFjzQTqn2uwGMbUxD6vjvo=;
 b=jr5KWIHe1GUdgQNiDbwNhQOkO5MeVZtOj3kYZOpQybK9bvMKhruceB+G9Kv9cLDApIN1remi6O786ONlicpQjpbaXQKW+o/nB/EuCny3vpL3RG7PEmn/mrKoeRVBz6x7GprT4GrPg/nECH8Lxs6ueSxBCL/Hwzwqv7NqsO8EYzBJJp/iNSe+qfr9klqf6B7yETkUs6Zt0ulMLuhBzFSbqMc0E6NWIn/hbx907VcDwkZbIxbt3sLwuadlNdGCowRUUYm7XONNMwvPOhwy5c4Ow2gtnZ8YNXwY3qSLnPUqbzboQnJnxhEDKJ3cXoA8dG9AfS4PnROWIZHNWttAAuAz5A==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYUPR06MB6123.apcprd06.prod.outlook.com (2603:1096:400:352::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 08:35:41 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 08:35:40 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
	<selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5kOiBjaGVjayB2ZGV2IGxp?=
 =?utf-8?Q?veness_before_removing_endpoints_on_unregister?=
Thread-Topic: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Thread-Index:
 AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADb5AIAABlEAgAAQIwCAASzQUIAABQkAgAAIPjA=
Date: Tue, 15 Sep 2026 08:35:40 +0000
Message-ID:
 <TYUPR06MB6217CD9B8231A5A7EBECEB53D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
	<20260914154656.56824fbd.michal.pecio@gmail.com>
	<TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260915100136.38b4c31f.michal.pecio@gmail.com>
In-Reply-To: <20260915100136.38b4c31f.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYUPR06MB6123:EE_
x-ms-office365-filtering-correlation-id: ffad838a-d698-4d25-3b3f-08df130452f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|42112799006|366016|376014|7416014|10067099003|4143699003|6133799003|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 /LdKNMJTHTYhABQ+9Dcm0S8BvvaAirzQVS1TwQ4Swm2z9wjtOMzEzrBUb4pvJGbqWkMtoVq/e3jRIurUQDGgeFEKzQirHOTJxKTd/0lNPdqqgmzXXGVQyv6ppi9oGaYqxlqT+M6O/ysg+5lSU4xqeHzIOsZrGIL2T8SXNC6msnbpc2dTHhW8uAsLLGDXkAGUp3H2eEtSu/4ZrleXe7ph70LMXXT+dpVpNzSomehrCJXa31AyQ4XmG/uJEdLUlp/15pk/I3zEbms0fqiQmdmAdqgyR+JIDpM16YREoSZ3TKlHgI/vTiqF6egBs4K6TwOLaqmlKepe1Nu6tEL6vBKDQypLbRHwVxPzdJriKnrVOjm+Rp4uSaLJT/xTUsApBzQ/lwKZTWTfRHyQ3rIk+2IdA/U5h/h4xILxBu747GGJhzP18sAXC4fWsHLI4d6y4AU55Z5qrwhSYBmlGD8O0kmqcOVV4X8vhfee0emsvXax305VUwmYZ0Q68wZq4G6jGXm2hdz5M+7mUF6MQtlADsG2TlEY3ETq9oAuMUPQiLScPf0wFY4URNtwrlbpUfDQGHKeXXCMl3wSTooih2EujfttbcGGBYFVIpcd3PvIff5oktVHXRK2W+qc60cXqab0l8NBG8Vv92fNbtvrWwCsXZhMbuKDvADXeyX009G2DS8M2FwCVFOSnUUmRMK3Dbw6Dy9XH1LTbzEvwIzn9E2Ox5KR64jhB/eDjwOslRi6uRlTeOY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(42112799006)(366016)(376014)(7416014)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHBjUHR4TVBRa29ubFlCR2YrckRCSnphM0MzZ0ZSOWx1UzRMSTBOdGJmLzMr?=
 =?utf-8?B?QVRPaEVsd0tzYkVvR2RSVm9hQmU3WTFDdE5vWWNnRWZCb3QvZ3dOQXR2QWti?=
 =?utf-8?B?cWt0NGdWWFp2UEpTY1pqZmJ5V1oxcDdyaERyZmRKZlJRQ1NZbmFmVEpRRWhS?=
 =?utf-8?B?MjcyTnJ6YitVdVRBZ1Q3ajYwaklxTTlnQ01yd0VJZ09DT0F4eEoyMlROM1Y2?=
 =?utf-8?B?YjlJL0VyUUxUS1QvVTZtaFVzbGNaRDI4SXd0dm9hbm1WNFp1L0tZZUlOT3Zt?=
 =?utf-8?B?L0YyYjhoQmVEMEZnRmFxQlUzZk5kajJteGlnUXM2NzQxd0VBRzM3VCtoU1RB?=
 =?utf-8?B?ZFg1V1V6OEg3LzcyanN0M1MvUUlUYmgrUDM3UW9rZGRuTUVYMXk4Vld0am8v?=
 =?utf-8?B?aW8vWExENGR4RXk4bTUxbGlQc0ZHUFFqZnc0aEpuWi9pNFNiK0NJbzhrNHVV?=
 =?utf-8?B?K3hGdFJLa1N0bkNCeGRXY0kraklaWXJaRTNpVmMrQzM0dU5HTlFDWlliNzJu?=
 =?utf-8?B?OGZEV1d4MlNDdEZ2KzZuYWNGYUJWcjF1VUI3SnEvTHhTKzByMHpGOWJoYkZh?=
 =?utf-8?B?VG1NTG0vYlNNSjJ0RENrdlI3Y0E5VnU2cTU4V2dnU3FHVEVGNXBHOVFDb2Vm?=
 =?utf-8?B?enRYQ2ZIMEVRN1VXc3h4dmZYM0tSM0RpYy9yOHpmckFDYXZEWExmZEhHRVp0?=
 =?utf-8?B?dVdlRlNYUTlUUyttemdiMWtKejJoUVR6VXFITGxXek1vQ2EvSnJ2eXpvOStB?=
 =?utf-8?B?Q1VTMXVFNHlFQXpGZGMrQ0orNkFRaXhZTE5GaXRRdUFtRFRyb0EyYXRyWUZ2?=
 =?utf-8?B?aHNhZVFEcGRvR1huT1ZwaVFLNk5lZkdFbXZUUnF6azdtSVdLNzVNUkh5ckNI?=
 =?utf-8?B?RXB3ZnNqK3NKTHZDaHYvSmo3M3MxNzgxQXg3QU42MXB3YkxEV1NnZ3JocndR?=
 =?utf-8?B?V3FmZmR6SkdYU3BWa2dQeWFmdGp4ODA5YkZFU3NjNTR2ZnVZWmhpOUJFNHNi?=
 =?utf-8?B?NTlYY3ovNGhyalRuaWxocmNJUnY4WStGODlaRUxmUXJaSEhxTFdpMHdWNG5Y?=
 =?utf-8?B?V2xzcytFanVsaXl5bmtNK1FNR2VUWG8wSVdXVmZRRi9UY0ZMU0NLTS9uang5?=
 =?utf-8?B?b1Rnbk5YQWZGdDF4M2IvanhycS8zRVRTYzVJRFhpZEZEVXk2ZlJ2eXVkY1hT?=
 =?utf-8?B?V3NoRlFBNk5LbVBMVHRrNmVoU2trZnpEMzBpdUQ1YWtWREdQWmgzRWJLL1h5?=
 =?utf-8?B?bWF0YlkraXZzWUJhRzlCY1Qxc0pFMnFrY25nRnNrMDVkbjdQVzN5M1hHamRh?=
 =?utf-8?B?eHRSdGtaT3c4b0hJOGtPUm5OYmJsdkYybmJRMHVxV3pjYlpVYy91WmdueW94?=
 =?utf-8?B?RUhpWEdPaEUwQ3JZamgzK3ZOTHRCSFVVMFRhaVNyMlR3L3dDR05tYWltREsy?=
 =?utf-8?B?a2FxcG95eWJsVmlXNk9ra2xEV2Z4OXJKWEdJWHhiNHV2a1NWZy9YMUxWeUhh?=
 =?utf-8?B?WEI1M2xkUWpIOXpXem05QnZYcUUvTmJtTmZ2T0MvVzc0aUJtQ3NvUmNhbTcr?=
 =?utf-8?B?b0VneGxuOGl1aFdOajc1T094QWM2SDVrVVRMdXlGM3hTcnhGdnNIcHZsNzAz?=
 =?utf-8?B?Y2lDWTNHMWE4c3M4ZDgxb04vVFdRc1FtUm1hZU44dEpsV0xpeFBGbmdFOE16?=
 =?utf-8?B?OEM3MFRLYkgrRkYyd09jemR3TlcyZVdodHNnRDYvQmR1YXRlOTQ0cUw0bGg3?=
 =?utf-8?B?N1RHVmZ4L0o1WnJhZDRONHpXQWhRTVFvSFB3eWdDaDZTRk9IckNLZnFiMncv?=
 =?utf-8?B?WXV1L1FLNjRJUk5CTjVBMW4yWGY0aG5pbXkvMEVhVXBualZ1cm9rQlQxenMr?=
 =?utf-8?B?Qzk3UEc5Snh2aFVsY2VabzV6Y3hDMkl6QjcvM1RKLzN2UUxpZmFOVERhZkdV?=
 =?utf-8?B?dDNKTDByQnpWSlpteW11Q1I0L3VzMi8vK1l3b2p3cnpUNU5PbENBTVluWllG?=
 =?utf-8?B?ZDhROWxiVHBaVDF2b2w3cXJ3enJzVlY4NXVXT2xsUFpHSytmNExGbncyNGFm?=
 =?utf-8?B?TWdTcnNrSHVoQ3ZBQWtHWWNPWk9DVnNTMkdSS05Uclkyd05aNVBZWUtXaWtl?=
 =?utf-8?B?SGpIc2NRSG9VdHA1N0NBVkZsL0twRjVxSTMwc2RZWnZNUHhhWU1FaXZBQmNa?=
 =?utf-8?B?eGN4eXV5cXk0MElySHRtbUkrSWw3c1VvSElTU3Ryd2oxb0xRRmJsWCszSWJv?=
 =?utf-8?Q?Smigx4Wl4ogdo90IZoUVrZpJC8YSJEwRGnB6zPJu3o=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffad838a-d698-4d25-3b3f-08df130452f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 08:35:40.2145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pg/VgEfsJBi1sQGZp70v6Eg9FKsmO0CVPOVJlb4xN+2/2wu6w9+6OImxLWdBhsks5DiyJ1YS61JE8/Ana/1/GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6123

SGkgTWljaGFsLA0KDQo+ID4gVW5mb3J0dW5hdGVseSwgbm8uIFRoZSByZXByb2R1Y3Rpb24gcmF0
ZSBpcyB2ZXJ5IGxvdywgYW5kIHdlIGhhdmUNCj4gPiBub3QgeWV0IGZvdW5kIGEgc3RhYmxlIHdh
eSB0byByZXByb2R1Y2UgaXQg4oCUIGl0IHJlcXVpcmVzIHRoZQ0KPiA+IGRldmljZSB0byBiZSBp
biBhIHNwZWNpZmljIHN0YXRlIHdoZXJlIHRoZSBwb3J0IGlzIGRpc2FibGVkIGFmdGVyDQo+ID4g
YXV0b3N1c3BlbmQgcmVzdW1lLCB3aGljaCBoYXBwZW5zIHJhcmVseSBpbiB0aGUgZmllbGQuDQo+
IA0KPiBXaHkgYXJlIG9mZmxvYWRlZCBkZXZpY2VzIGJlaW5nIHN1c3BlbmRlZCBhdCBhbGw/IE9i
dmlvdXNseSwgbm8NCj4gInNpZGViYW5kIGVudGl0eSIgY2FuIGJlIHVzaW5nIGEgc3VzcGVuZGVk
IGRldmljZSwgc28gaXQgc2VlbXMgdGhhdDoNCj4gDQo+IC0gaWYgdGhlIGRldmljZSBpcyB1bnVz
ZWQgYW5kIG1lYW50IHRvIGJlIHN1c3BlbmRlZCwgc2lkZWJhbmQgY2FuIGJlDQo+ICAgcmVtb3Zl
ZCBiZWZvcmUgc3VzcGVuZGluZw0KPiAtIGlmIHRoZSBkZXZpY2UgYmVjb21lcyBzdXNwZW5kZWQg
d2hpbGUgaW4gdXNlLCBvYnZpb3VzbHkgaXQncyBhIGJ1Zw0KPiANCg0KWW91IHJhaXNlIGEgdmFs
aWQgcG9pbnQuIExvb2tpbmcgYXQgdGhlIGNvZGU6DQoNClRoZSBzbmQtdXNiLWF1ZGlvIGRyaXZl
ciBzZXRzIHN1cHBvcnRzX2F1dG9zdXNwZW5kID0gMQ0KKGNhcmQuYzoxMzQ3KSwgc28gdGhlIGRl
dmljZSBjYW4gYXV0b3N1c3BlbmQgd2hlbiBubyBhdWRpbyBzdHJlYW0NCmlzIGFjdGl2ZS4NCg0K
RHVyaW5nIHN1c3BlbmQsIHVzYl9hdWRpb19zdXNwZW5kKCkgY2FsbHMNCnBsYXRmb3JtX29wcy0+
c3VzcGVuZF9jYiDihpIgcWNfdXNiX2F1ZGlvX29mZmxvYWRfc3VzcGVuZCgpLA0Kd2hpY2ggc2Vu
ZHMgYSBRTUkgZGlzY29ubmVjdCBpbmRpY2F0aW9uIHRvIHRoZSBBRFNQIGFuZCB3YWl0cyBmb3IN
CmRldi0+aW5fdXNlIHRvIGJlIGNsZWFyZWQuDQoNCkhvd2V2ZXIsIHFjX3VzYl9hdWRpb19vZmZs
b2FkX3N1c3BlbmQoKSBkb2VzIG5vdCBjYWxsDQp4aGNpX3NpZGViYW5kX3JlbW92ZV9lbmRwb2lu
dCgpIG9yIHhoY2lfc2lkZWJhbmRfdW5yZWdpc3RlcigpLg0KVGhlIHNpZGViYW5kIHJlZ2lzdHJh
dGlvbiBzdGF5cyBhY3RpdmUgZHVyaW5nIHN1c3BlbmQg4oCUIHRoZQ0KZW5kcG9pbnQgcG9pbnRl
cnMgdG8geEhDSSByaW5nIGJ1ZmZlcnMgcmVtYWluIGluIHBsYWNlLg0KDQpUaGlzIGlzIHRoZSBy
b290IGRlc2lnbiBpc3N1ZTogdGhlIHNpZGViYW5kIGNsaWVudCBhc3N1bWVzIHRoZQ0KeEhDSSBy
aW5nIGJ1ZmZlcnMgcmVtYWluIHZhbGlkIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMuIEJ1
dA0Kb24gcmVzZXQtcmVzdW1lLCB1c2JfcmVzZXRfYW5kX3ZlcmlmeV9kZXZpY2UoKSDihpIgaHVi
X3BvcnRfaW5pdCgpDQrihpIgeGhjaV9kaXNjb3Zlcl9vcl9yZXNldF9kZXZpY2UoKSBmcmVlcyBh
bmQgcmVhbGxvY2F0ZXMgdGhvc2UNCnJpbmdzLCBpbnZhbGlkYXRpbmcgdGhlIHNpZGViYW5kJ3Mg
cG9pbnRlcnMuDQoNCllvdXIgc3VnZ2VzdGlvbiBpcyBjb3JyZWN0IOKAlCB0aGUgcHJvcGVyIGZp
eCBpcyBmb3IgdGhlIGF1ZGlvDQpvZmZsb2FkIGRyaXZlciB0byByZW1vdmUgc2lkZWJhbmQgZW5k
cG9pbnRzIGR1cmluZyBzdXNwZW5kIGFuZA0KcmUtYWRkIHRoZW0gZHVyaW5nIHJlc3VtZSwgcmF0
aGVyIHRoYW4gbGVhdmluZyB0aGVtIHJlZ2lzdGVyZWQNCmFjcm9zcyBzdXNwZW5kL3Jlc3VtZSBj
eWNsZXMuDQoNClJlZ2FyZHMsDQpMaWFucWluDQo=
