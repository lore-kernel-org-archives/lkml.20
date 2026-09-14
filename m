Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013031.outbound.protection.outlook.com [52.101.127.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51F4734EC;
	Mon, 14 Sep 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390848; cv=fail; b=UFaljroC8FGKdnY2D94/Lp79j9KyULk/xOt7s9GqEyDdhUrTTDnkEBTo2gn2HaemxCLcLlGa+fs9r8KFD0L7wDapz3HfMQRz7///HxX1JE56ciZT1vQgsxY4tmE1nf1LOyDHy4MoGHtszPgs3ke8ZaBQgePCubCQNQz8NWBU95c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390848; c=relaxed/simple;
	bh=k2oL5koyVM9sgu+ebTfpKCXMqZS3o7u5T+9p9JdUgyA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SzMoZYIL2eNGEuoiuIl+2fHm+CVmEK8WTmuWeosuUDq6eQ6GomyUJ5Kj5yjCvZFSbeRlF6LL7VD53kvcgn3tW1zDSjSusLXjqfC/74ymw8pq0Gml20YJJLNKrrEC4uFU+Y1fy5ztkfZ2xN3fan3zhqhNWxgnxUhvhrjRCXjkcbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=T+UveuCM; arc=fail smtp.client-ip=52.101.127.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="T+UveuCM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYrEdSNkyRgWQyZ3Kft4KvXp3WpcN+ml8lE3l319dgOkP5vJuhDQ5nUqOplyJbKDXWp46tCyUniUFMJ8ZqS4P5IXq54gc05hPwinp9oXraUjA8T0nYFSCyiIY55cLH5VmBt2V9ogFBHtkaPzy3QOQPLsJRJjLvpnU52TpibxCYrdYWcDFWka1QasX519XmKAz2/ydwDlUhyBtiJZznow9CaQKIsl7lNVt5lLn3eN8Wk9YahFrbvOIUyGBOy37n4wiXd5dWarHnZlSvoL97340Ryy/GmNT6f+3dGQW6Is448fmpszesmtQgR9gazzzzoEpowOVlYxzVdec4BZaEDoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2oL5koyVM9sgu+ebTfpKCXMqZS3o7u5T+9p9JdUgyA=;
 b=kM6iaYatahmUZvwRzZnH4LCSZkBP1KePzskMrNUyjuEaNbehC7ftO3iOtuztYHy5wKuVTeZ6nLam7dNiJbBiKp1fQwCgVfHJCCL9Ah+E8PDl+0C/muNUBKWfzRIQFX2v1F16l0J79zK0H3oMPXDuIGK5MwB0VSavc+r624Pf3fAL3p5Gx1RNs1vFfH6cjLXIeijzVfkNiOmZt3TLOd3C1Gw8YNyspbGrI7uK6VbMgLlX6maG0t79XGYWv1LpNK4ECeKeC3qjZiIr/GUBOIaeX/r5jgCbfo9/8L0RbYRHZjAj/7DCBvNHCldUHUcfkCODfMjebJhhLzZSPpgDokLPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2oL5koyVM9sgu+ebTfpKCXMqZS3o7u5T+9p9JdUgyA=;
 b=T+UveuCM4EUyioYJuH+LWyL+hXc5A/NMnW00+Isec03SwNuTarIwJqeIuyN0HVwq1SWDBVzSoBjTcl4Y0Ncrypaaaiz5F1+cIjB0YlpIFfXPaq2aJrVmPPe+DVAh8nMXfskP+sM40S06zqakXVF7WxYIYZsvERogdBSBPcWtLIttiFaiNuS/aZOjTduPr1NvJfl4usX5gMiSKk9Jxj213bRQI0fCy+xZ+aqeijjfFnOdgUA1PsMsZ/AS+eOoXnCa/fJUacNjqqyqD/JDtceutemCuqJpiukM0peJ4ev8qfHl2CEGxLIgCtqDN+Z7pAC2Jwn4JJoyPHVjlaCFSxrrlw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB6599.apcprd06.prod.outlook.com (2603:1096:101:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:00:41 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:00:40 +0000
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
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5kOiBjaGVjayB2ZGV2IGxp?=
 =?utf-8?Q?veness_before_removing_endpoints_on_unregister?=
Thread-Topic: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Thread-Index: AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADb5AIAABlEA
Date: Mon, 14 Sep 2026 13:00:40 +0000
Message-ID:
 <TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
In-Reply-To: <852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB6599:EE_
x-ms-office365-filtering-correlation-id: 36d0d8ec-ef81-4f5e-0e9c-08df12602db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|42112799006|6133799003|22082099003|18002099003|3023799007|38070700021|4143699003|10067099003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info:
 cPdQ9mFwBDoEMALtIAjBxWwE/R3L1IpgBEEp/tTr3/HGs4Dk5EhUwEDZFVFxTP5q5LRAoICCc/OwKYnqluALm3Bs/dz6T8+vYEYjRpmwgIkcACirkZ5a2vG7ZkAdnEOK14EB2T8hryYD/h54GJpDHMXiukiO0IlltsFjsEVx3Iqu2mEwt0CI83gqP5T/OmAoVGm5LuePeC9Yf0IoNb24+OPtkNqt+qiiiLuqakHIaK4Lifs7/JkNIqeTYkgy1G+AB2yvH8gFX5fHeE/LtIToj7o1+fhggIkBnni6a2VkQfqtMudrSqcWfSUKgj6pDeL2hGl4AFGMIACDoyj3UOLpRKtSAgOFmxBe8TjLFSIAseKoCxE+wwollk+wBX6EInts47b6ciYyJa0VCs/NQVoVMpM7BAFwLUuMsMZxx54b9KUyQXF+8KSWuTfIl83B/AzL3qXIyAWQxin3J3NTMT56H1A9Um4MxnvotAhz63eOEetxnwvCkLhO16S0UaxRSCOQO65Y/UuUJbXGkHk+Ag3AkLA+ycFmt3nvKSTV1KrrvPEoqKqiODpadm7j7XvYYnRz+j90iEtCjU6EI34Q8IkvT6skrJcovDGn+VtQB9sLdeJyVXmePIxgzYMvh3nB62SgXT1gd/1IrXWsBgH6H1S2qP0keZgKBCOM0ebrydiqv40fgHF40V7T6W7pzOLlnnxcKa1/dpgWuc/sQPtD5mzWwfNl9LS26cuhmXc32007za0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(42112799006)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0t5dVBLWnFBNFhyMWxCV0kxN0ZUTDlWZHM4U2JiL3N6cWU3dHdIaEdPcFpU?=
 =?utf-8?B?czZRdkRzREpqNS9LaE56Z29vZ2x5dTJHcHA1L3hqQStVT2JmOS9nSXNpV2kv?=
 =?utf-8?B?RUFIWUZUclR0d05vZ2FYWUVYazUzQlI3RUJ0VGNIbHEyZ0lvMFhsSUhaQlYr?=
 =?utf-8?B?aTNhUkc1dFRoZzNCYUpWTk5wU0hMeWJPN0N6RXRwakNrcFhYem9XOEdpTG5U?=
 =?utf-8?B?cXdXUS9yNHYzbTBXOGpmdG5KOXJ2Zy91N05jL0FSblgwMTk5Y2FTYnJoUmN3?=
 =?utf-8?B?dCtab2RlU1p4MmdIcHhiZEthZDZSWTZrL3h5RFlYWDk3V0F1aFVtL0htSTk3?=
 =?utf-8?B?UmxoYTN1dERvNC91ckJsWGh5YkEyY3A2VytINFZ1dUplN2lYaU4yQjYxUE1l?=
 =?utf-8?B?TU8vM0F1WW5EZWdFMEo4Y1FRWURETGFzTWtFeUpGb1Y3aXZsSTNqYUluNzVh?=
 =?utf-8?B?SU1uYjVLdkJDZ3JrK3JTVW1Ja2Fsb2pIb3V5TG1pdEw3Nno3cTEyWHpoVVZi?=
 =?utf-8?B?S1ppVjVmaDhVRU5qanYrWGVDTGZrd3ZUd0xQQmlISmh0ck1jSDdzd1hBQkxB?=
 =?utf-8?B?MDhQRFRobDRiKzROemRlZWd5Z2ttMHR3bm5LdW50OXN1bHYzVDBlTzRzTzE4?=
 =?utf-8?B?NnlESHhEQm5lczhHNllwWlhiZjczSTFoaElTQjhLd0xWSG1uVkk4TVZQRWRC?=
 =?utf-8?B?cmdGRU9sU01ySGhJb3dSMHdvUlFnYVhxTlpZdllvKzZuV2ZhZ01pa1EvT2RM?=
 =?utf-8?B?MXFXQmZmb1JDM01wMjhyeTIyZ1BhK2tmclRKTzNrbkNhWnpTSS9wNlpKaDlw?=
 =?utf-8?B?V0hvUVVNQ1ZOTGVabkFMYVBBNmsyeUppZkEyWnk1UVZnRURJZkRmQW5JOFFj?=
 =?utf-8?B?R2xBSkRneVNlR0JtamlnNzhyUmdEUThWM1lYaXFVTm5ad2RIVlRzeEM2Njky?=
 =?utf-8?B?R2ZGZmc5akxMcG90UGNXazVicllJbm1hL1I3VWVVZlNxRXFxS3NMNG9NTEVT?=
 =?utf-8?B?OW80bVhhb2pPRHRqYkZJKzZSVVQwUEZCU20ySHovVG5ZdGI0UmljVGNsZGJ6?=
 =?utf-8?B?bXdkbnhGTXIrYlZCcDRJRk1JZFpmNmEwS2Y0T3N5T244Z1JCZ3pjOEptQm92?=
 =?utf-8?B?bkorZmxLQnFoZVdNdTdSb2dvNllFakdZMS9zSDZPWmJiYTc5WER3cXp6Wits?=
 =?utf-8?B?OGNXQW1LbkZPVkkvV1J3dUNPUEdIaUxIT2NaVnVFUW5MNWNUaW53QWhsQzN4?=
 =?utf-8?B?alA2WGtVVktZQ0VWNHJwZjh4OU90bmw4YVY2ck10d1AyN2psSGd1cHVMMnFr?=
 =?utf-8?B?cGR2ZzBrcnR0a1ZvU3NhNTgwcDdLcFVab0dWci8zS3BLM1dwQjlSQ3hidlZW?=
 =?utf-8?B?RmNQaEJLM2srVHdWQjZ6bHhtVWxicno2dEFMditlTHFwVnFraGh0dllEeWZE?=
 =?utf-8?B?UnJudWN3bkJrbk9XM3JwTFd2NUE3ek8xby9BbEtMcWY3dkdRdEFLQ2xmb1JB?=
 =?utf-8?B?UVRGejJwNGxUbDV3bGN0UW92OU51V0RacjExM1k4aEd5VG03TzZncytDYXF3?=
 =?utf-8?B?MFViYXpLZFNwaW9yTkVWeGNRR1g1VWlrWEtnbUczZ0dMaWZURkZKamdCZ2Vk?=
 =?utf-8?B?K05jRHlUbUdzUkh3VWpOTmZ2NEdOMXF3YlV5S2tSdFhoZWdRaVZwcldMbnlT?=
 =?utf-8?B?dlJiWjM0dGhGa2JHSk9WcXFsS3ZrNjRNb3pJVE1zbmY5V2V6WGZoNjZmUE91?=
 =?utf-8?B?V0wvWGUzWVFEK2ZGcXIwTVNiNXZZZTdFa3ZtOHFrY1A2UVlwaHc0WkJDYkZp?=
 =?utf-8?B?WHl6djd1aXpHK0Y1eHRucXZtM0VNZGZ1aklCMGtUeHFYZk9xNkQ2MUk5MEI3?=
 =?utf-8?B?UWpJWENveWVwdUszRkVzRHljc1djbHdaY1I0WjhFN0N0UFpjUm5OL2JFV3Jp?=
 =?utf-8?B?KzUzdlVHc09nZDZhRHZjV29tbEl2MHVXeDJqeDliMm90NjBUV2RVN0VLU0Vh?=
 =?utf-8?B?Zy9nVXBsSExGSHc5bDc5ZENZekRjQXBSTWQxOFJxUkx5VmlxMzEzZGo2T2R3?=
 =?utf-8?B?SW9YTjJLTERBVTgyblVaQXEvcHlXNHZTemp3SitUK0t2N1pNTVhyQ1FyS3Zr?=
 =?utf-8?B?YWpya293SVdxZ0Z1KzBxYzZFMlRzdDVscG5OR3JnczdPV29YdnpsaDVFV3RV?=
 =?utf-8?B?QkZnZ01xb3VEeEJkZkxSRkhHTUFCS1NrSnRnR0pzcm9XaitSeU0yUUl2V0F1?=
 =?utf-8?Q?kvJ/WqNDM/S0oM2wcLTREiWRdB7mSJ1jL3MA3riMa4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d0d8ec-ef81-4f5e-0e9c-08df12602db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 13:00:40.2045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpcdFVA8lGqYCPp/23KCgXm7+QPTs5XNdT05OHEjlJOOm8EFKS2aaqsXyf+HRh7dXjSOp5H4pHcR1+0Beby70g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6599

SGkgTWF0aGlhcywNCg0KPiA+DQo+ID4gQnV0IHhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNl
KCkgaXMgY2FsbGVkOiBiZWZvcmUgaHViX3BvcnRfaW5pdCgpDQo+ID4gY2FsbHMgcHJvYmxlbWF0
aWMgaHViX2VuYWJsZV9kZXZpY2UoKSAvIGh1Yl9hZGRyZXNzX2RldmljZSgpIGZ1bmN0aW9ucywN
Cj4gPiBpdCBjYWxscyBodWJfcG9ydF9yZXNldCgpLCB3aGljaCBjYWxscyBoY2QtPmRyaXZlci0+
cmVzZXRfZGV2aWNlKCkuDQo+IA0KPiBUbyBtZSBpdCBsb29rcyBsaWtlIGJvdGggZHJ2LT5wcmVf
cmVzZXQgYW5kIHhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCkNCj4gYXJlIGNhbGxlZCBp
biB0aGlzIHBhdGguDQo+IA0KWW91ciBjb2RlIHRyYWNpbmcgaXMgY29ycmVjdC4gZHJ2LT5wcmVf
cmVzZXQoKSBJUyBjYWxsZWQgYXQNCmh1Yi5jOjY0MTIgYmVmb3JlIHVzYl9yZXNldF9hbmRfdmVy
aWZ5X2RldmljZSgpLCBhbmQNCnhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCkgSVMgY2Fs
bGVkIHZpYSBodWJfcG9ydF9yZXNldCgpIOKGkg0KaGNkLT5kcml2ZXItPnJlc2V0X2RldmljZSgp
IGluc2lkZSBodWJfcG9ydF9pbml0KCkuDQoNCkhvd2V2ZXIsIHRoaXMgcGF0aCBpcyBub3QgdGhl
IGFjdHVhbCBjcmFzaCBwYXRoLiBJIGFwb2xvZ2l6ZSDigJQNCm15IGVhcmxpZXIgY2FsbCBjaGFp
biByZWZlcmVuY2luZyB1c2JfcmVzZXRfZGV2aWNlKCkgd2FzIGFuDQphc3N1bXB0aW9uLCBub3Qg
ZnJvbSB0aGUgYWN0dWFsIGNyYXNoIGR1bXAuDQoNCg0KPiBodWJfZXZlbnQoKQ0KPiAgICBwb3J0
X2V2ZW50KCkNCj4gICAgICB1c2JfcmVzZXRfZGV2aWNlKHVkZXYpDQo+ICAgICAgICBpZiAoY29u
ZmlnKSAvL2FuZCBmb3IgZWFjaCBpbnRlcmZhY2UgaW4gdGhpcyBjb25maWc6ICwgZm9yIGVhY2gg
aW50ZXJmYWNlKQ0KPiAgICAgICAgICBpZiAoY2ludGYtPmRldi5kcml2ZXIpIHsNCj4gICAgICAg
ICAgICBkcnYgPSB0b191c2JfZHJpdmVyKGNpbnRmLT5kZXYuZHJpdmVyKTsNCj4gICAgICAgICAg
ICBpZiAoZHJ2LT5wcmVfcmVzZXQgJiYgZHJ2LT5wb3N0X3Jlc2V0KQ0KPiAgICAgICAgICAgIHVu
YmluZCA9IChkcnYtPnByZV9yZXNldCkoY2ludGYpOw0KPiANCj4gDQo+IEFueSBjaGFuY2UgeW91
IGNvdWxkIHRyYWNlIHRoZSB3aG9sZSBjYWxsIHBhdGggaW4gbW9yZSBkZXRhaWxzIGFuZCBzZWUg
ZXhhY3RseSB3aGljaCBwYXRoDQo+IGlzIHN0YWtlbiBiZWZvcmUgdGhlIGNyYXNoLg0KPiANCj4g
cG9ydF9ldmVudCgpIHNob3VsZCBvbmx5IGNhbGwgdXNiX3Jlc2V0X2RldmljZSgpIGZvciB1c2Iz
IGRldmljZXMgd2l0aCBsaW5rIHN0dWNrIGluDQo+IHNzLmluYWN0aXZlIGZvciBsb25nZXIgdGhh
biB+MTAwbXMuICBJcyB0aGlzIHJlYWxseSBhIHVzYjMgYXVkaW8gZGV2aWNlPw0KPg0KTm8sIGl0
IGlzIG5vdC4gVGhlIGRldmljZSBpcyBhIGZ1bGwtc3BlZWQgQXBwbGUgRWFyUG9kcw0KKFVTQiAx
LjEpOg0KDQogIHVzYiAxLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIgdXNp
bmcgeGhjaS1oY2QNCiAgdXNiIDEtMTogUHJvZHVjdDogRWFyUG9kcw0KICB1c2IgMS0xOiBOZXcg
VVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDVhYywgaWRQcm9kdWN0PTExMGINCg0KU28gdGhl
IHBvcnRfZXZlbnQoKSDihpIgdXNiX3Jlc2V0X2RldmljZSgpIHdhcm0tcmVzZXQgcGF0aCBmb3IN
ClNTLkluYWN0aXZlIGRvZXMgbm90IGFwcGx5IGhlcmUuDQpUaGUgYWN0dWFsIGNyYXNoIHBhdGgg
aXMgdGhyb3VnaCB1c2JfZGlzY29ubmVjdCgpLCBub3QNCnVzYl9yZXNldF9kZXZpY2UoKS4gVGhl
IGZ1bGwgc2VxdWVuY2UgZnJvbSBkbWVzZyArIGNyYXNoIHRyYWNlOg0KDQoxLiB4aGNpX3NldHVw
X2RldmljZSgpIGdldHMgQ09NUF9VU0JfVFJBTlNBQ1RJT05fRVJST1INCigiRGV2aWNlIG5vdCBy
ZXNwb25kaW5nIHRvIHNldHVwIGFkZHJlc3MiKQ0KDQoyLiB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVf
c2xvdCgpIOKGkiB4aGNpX2ZyZWVfdmlydF9kZXZpY2UoKQ0KZnJlZXMgdGhlIGVudGlyZSB2ZGV2
IHN0cnVjdCAoc3Vic2VxdWVudGx5IFNMQUItcG9pc29uZWQpLA0KYnV0IGRvZXMgTk9UIGNsZWFy
IHNiLT52ZGV2DQoNCjMuIExhdGVyOiB1c2JfZGlzY29ubmVjdCgpIOKGkiB1c2JfYXVkaW9fZGlz
Y29ubmVjdCgpDQrihpIgdWF1ZGlvX2Rpc2Nvbm5lY3QoKSDihpIgeGhjaV9zaWRlYmFuZF91bnJl
Z2lzdGVyKCkNCuKGkiB4aGNpX3N0b3BfZW5kcG9pbnRfc3luYygpIOKGkiB4aGNpX2dldF9lcF9j
dHgoKQ0K4oaQIENSQVNIOiBkZXJlZmVyZW5jZXMgdmRldi0+b3V0X2N0eCwgcmVhZHMgU0xBQiBw
b2lzb24NCnZhbHVlIDB4ZGVhZDAwMDAwMDAwMDEyMg0KKDB4MTAwID0gU0xBQl9QT0lTT04gYmFz
ZSwgMHgyMiA9IG91dF9jdHggZmllbGQgb2Zmc2V0KQ0KDQpDcmFzaCBjYWxsIHRyYWNlOg0KICB4
aGNpX2dldF9lcF9jdHgrMHgwLzB4MzgNCiAgeGhjaV9zaWRlYmFuZF91bnJlZ2lzdGVyKzB4Njgv
MHhmMA0KICB1YXVkaW9fZGlzY29ubmVjdCsweDcwLzB4MTQ0DQogIHVzYl9hdWRpb19kaXNjb25u
ZWN0KzB4N2MvMHgyNjgNCiAgdXNiX3VuYmluZF9pbnRlcmZhY2UrMHgxM2MvMHgzNDANCiAgZGV2
aWNlX3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MWM0LzB4MmJjDQogIGRldmljZV9yZWxlYXNl
X2RyaXZlcisweDE4LzB4MjgNCiAgYnVzX3JlbW92ZV9kZXZpY2UrMHgxNTgvMHgxNzANCiAgZGV2
aWNlX2RlbCsweDFjOC8weDMyMA0KICB1c2JfZGlzYWJsZV9kZXZpY2UrMHg4NC8weDE5MA0KICB1
c2JfZGlzY29ubmVjdCsweGU4LzB4MzM4DQogIGh1Yl9ldmVudCsweGJkOC8weDE5YWMNCg0KU28g
Ym90aCBkcnYtPnByZV9yZXNldCBhbmQgeGhjaV9kaXNjb3Zlcl9vcl9yZXNldF9kZXZpY2UoKSBh
cmUNCmNhbGxlZCBhcyB5b3UgdHJhY2VkLCBidXQgdGhleSBhcmUgb24gdGhlIHJlc2V0IHBhdGgg
4oCUIHRoZSBjcmFzaA0KaGFwcGVucyBvbiB0aGUgZGlzY29ubmVjdCBwYXRoLg0KDQpUaGUgcm9v
dCBjYXVzZSBpcyB0aGF0IHhoY2lfZnJlZV92aXJ0X2RldmljZSgpIGZyZWVzIHZkZXYgd2l0aG91
dA0KY2xlYXJpbmcgdGhlIHNpZGViYW5kJ3MgZGFuZ2xpbmcgcG9pbnRlci4gVGhlIGZpeCAocGF0
Y2gNCjI0ODJkNzhhNzgxMykgY2xlYXJzIHNiLT52ZGV2ID0gTlVMTCBpbiB4aGNpX2ZyZWVfdmly
dF9kZXZpY2UoKQ0KYmVmb3JlIGZyZWVpbmcgdmRldiwgc28geGhjaV9zaWRlYmFuZF91bnJlZ2lz
dGVyKCkgY2FuIGRldGVjdCB0aGUNCmFscmVhZHktZnJlZWQgdmRldiBhbmQgc2tpcCBlbmRwb2lu
dCBjbGVhbnVwLg0KDQpSZWdhcmRzLA0KTGlhbnFpbg0K
