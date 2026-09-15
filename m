Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013024.outbound.protection.outlook.com [52.101.127.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1FC28033B;
	Tue, 15 Sep 2026 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441060; cv=fail; b=crAHnwwXqflC0VKGIF5XTnmZL8jDI2a+1GBrsPE28HdzSGkCG/YhDukSyU+8yg4klZKNKywIkZYk0/ew37DPZrLmOoJecc4ldAl674JLl7sgyLxMXJWeb5Gy89V4xxCSSsh4B99x4Qq/HqaeBVxliMQd5G7biGDkz5Np13+FcJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441060; c=relaxed/simple;
	bh=uf1j4K+enZ4iOpd0fgt3mTQvr17/xR+Qo3nPhfJiOzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dxDnZsyKEY6Kms6BVIQ2JvvN0mUMlTZ/L4v0LwGZ+zMgQPlJb8yh/lxp+6VvBrDsJEzJn/O66DpPs4FHShHR4em3hqFan9qiK8t3ReagcOoq7b4jm08jqOKxckfzzH2HlA4faYNmacm8oXLGvqFODSp5bODazqLlpa8pkbOmKAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZEJdRYdU; arc=fail smtp.client-ip=52.101.127.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZEJdRYdU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT4dgwazROPCrBRP0oQ2PWrVk4ZcRyybQXn+FehIX0IQkzLwfostOOyJVrWS828aF5xInDCY68LT/jbWYlAF0Rm05FvkB3PkVvbiupcaR3aOEZesK7L38LBR4zPli6qm6VFQ1ryetSOFQX/O6ZxAWWrn19hS3Euf+wZq5ppN3R6f5gZcwTs5MuGuAKvaBG9+l0SJw/sRbJP7MoFi7gydK24GlLkuBT5QFakpI6NyAgh8Mw21Lr6QZdIQSSrUjjaNdDgMQFvOpYR052lLFNwmIE8JSdPw3e8N5pDsHARFYttYYbGou0s7Dd3+PGLImsMlIKWctoDPnCKP9s8CosL6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf1j4K+enZ4iOpd0fgt3mTQvr17/xR+Qo3nPhfJiOzI=;
 b=hKlYS5f38p7UnbOFPRN9q7S0YuyHFdtvoeqjAJWagnqF9joC43fJiMgaPv7hlwQ9RDn0FhxozvjuzoqfhUkrnSSjioQDZ0R2h/3s0yzMSnRMwBs96DAtII4Y6gHeVT7Vbw3ehdFAZ9gvUf94Nyq3so0tpYxrtdZglJuQgXW5xk0TRE0Nsqnbwu+8w0Jiz7rhtvHnWsYvtbLa1MxgPfsFU7SNDa3rUZHkZRUmG064HN2JemsnTl/F4ebL8m6Lx6q6Tkbx21uqn4XAZGOtIC0mfrwrQyioIuAceaR7CN+dPjXw9MycD6s8fwWVLP3Mm/LQzAKHU/XHvRZ4CWN6ZFSujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uf1j4K+enZ4iOpd0fgt3mTQvr17/xR+Qo3nPhfJiOzI=;
 b=ZEJdRYdU3Q2yb0a7bm62iHYMo8c9C0kus2YdEgItjbNbutoYBLCLyrzfBH9euiwpnYG/ZUCglbjca8l5bqmTaRop8jdKQ8VomLWJGr8UQ9klN7KTOzofTdi/H9sMwuEMmnRGbROU1trwizQzvh0H4+KQjmVHsGdro3a2kaozfh3SBWe8Pq9Hzl2em5c5LsnukcTbpNWZWliLLtt0Yy39rsQIn6YkxJKo5yKFrJqmnjjQxQ+69DfFFekJFKXIWq7/v1xbG3Z3kfZqLJwJEKKF5b5cJn0F8wa1wKTtia78/8+mv59KCPk79cMxhL+mIwxEsjDceY+GfVqg1hvv0JEHtQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SI4PR06MB8472.apcprd06.prod.outlook.com (2603:1096:4:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:57:35 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:57:35 +0000
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
	<thiagu.r@samsung.com>, Niklas Neronin <niklas.neronin@linux.intel.com>
Subject:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0geGhjaTogc2lkZWJhbmQ6IGNoZWNr?=
 =?utf-8?B?IHZkZXYgbGl2ZW5lc3MgYmVmb3JlIHJlbW92aW5nIGVuZHBvaW50cyBvbiB1?=
 =?utf-8?Q?nregister?=
Thread-Topic:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5kOiBjaGVjayB2ZGV2IGxp?=
 =?utf-8?Q?veness_before_removing_endpoints_on_unregister?=
Thread-Index: AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADMKMIAAD/GAgADmgsA=
Date: Tue, 15 Sep 2026 02:57:34 +0000
Message-ID:
 <TYUPR06MB621785D1597D55101A3D3767D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
 <TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
In-Reply-To: <c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SI4PR06MB8472:EE_
x-ms-office365-filtering-correlation-id: a4e651ce-c0fe-461e-8c98-08df12d517fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|42112799006|366016|376014|7416014|22082099003|18002099003|38070700021|11063799006|56012099006|3023799007|4143699003|10067099003;
x-microsoft-antispam-message-info:
 9RC4XAuVI5WpFhu5HMZEVwZYE6HlCqX0qbK++wohFLYfHhI/oI4ucYrcBlM9ducIVss2FFC1S+9s2Wcqkgf6qdazbSInNDY9G8XFU0xk4JNxsBDAHvLW/166p0y5PzdXwpjIc/2/n4zxr6nH4gU1D5+X2tRD8ykxURjPVWAqcoH9wsf89sMzVTxLBHNBOcZz30wufdYgeGZ52XCKeNWcvm45XZ1S5T+EqeZxUkydtFJ3irJOoXgeHVd1OL0jaeLVhYxQBpY9h7N3iXuO1vHhBeG/XNAowHaeD4Gc+Cr4vaf7nOjim5yuutU9Z5bHBZsLjOn0UVqkO282AmHl+FJ1eWl57j7OE7/jYwPV6r/9Eem5WkK7fKKc5eYvrDnPVMPsF0wah/AMPc+0UOB1ZTVGcL9zGGNGKsdcgCh5s+/YLV7H7Imk0wBP0VnCEAR4I94ZIN3LKmGZBoLr6R+FO4Yzif26YTEjBJZC3cFY3qXwwPs55OGMggfpp1YCnBrUn/kNWK3u0nG+pJ06+mYFhGpuZC8RHQpN4wqG0xNbo0IRu8kbn8M+PVQPoliDTkln/7FHgxHQfw+b6gCEL/eeo/OVJKJhtuClqV6GXCSHZDB/y6rrE1ngPlbTtO/CXoH0KRNWh/B4NUl2y86X6vSjqO73qQNNRHdiclFSkPlu2BPDxEN0riNhHYV19/+kqbboOfB/inuu8xoeXW9FKvPntj0OlRPAseiWgzg4fs1wRS6/89k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(42112799006)(366016)(376014)(7416014)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVA5V1ZtRGRCdnpwbWp3NHR1UDZrWUxEQmowcFpzakdHY0NObnpFa3BGZmhs?=
 =?utf-8?B?MXpDTmFkeWxTM29iLzBub2tBUTJXMFZCaW4vKzVZd0lXRmFxVHpzcmI5aGpQ?=
 =?utf-8?B?WmNBcmFobU5EMGNPWlQ1S3FwMCtKaUpIUG1QM0pCNkRjTmlOekJVS3l6b3Zh?=
 =?utf-8?B?MHk4MlhZVkJMMERoWHRrdjFjWXA1QVZNMVFXZER0WmRHWjRBYk04aTZXdnBM?=
 =?utf-8?B?REMwaHJwaXBLVjhwSkFRZVVEeDdTRmZoZ295dklIZk9seWxObGtCM2swemor?=
 =?utf-8?B?TTQ4bVdJVHdkL3RaVHVCRXhzWE94dEtHRWNzelN5WTFZS0k1REMzOGVScXd6?=
 =?utf-8?B?OTNnMVFRWlZvMHhFYTNBa0pXOFRWeVZQcW53TTRQZmQxTE1MZTI4V2E0TDd0?=
 =?utf-8?B?YmpEZWNoa0w2K1RhOHM4M1ByWU1PVVRJbmhvUFBIZ25ma0JQb25yMWNVWmRY?=
 =?utf-8?B?WGtHblphS01VSmZMaUIvNTdIVXppRThtS1NobHIyYm5hL0EzQjFIQ2dONlVV?=
 =?utf-8?B?aEVQNXVTeGRMZkk3YjZZaCtwQ2UrZi9XaXdWMUJGeTFoUXdYUDBtM1JkN3FJ?=
 =?utf-8?B?Ym5kZFpaVGNTeURqbVhKR01iSGNUdTljTitxZHRPMThVVlJVTGphMkVWelpt?=
 =?utf-8?B?UVlhT2hxVHV4K0lYSGVMMkhzamFlVHE1WVBoOHRTK2FPcVUvTDhZTk51NUZL?=
 =?utf-8?B?K2ZyLzZZS0xrTDJmTXNRY01rTXNnZVBEeW11bFQyeVdCcDkreWFDcEFGWHlT?=
 =?utf-8?B?LzRSQ3RXem5jcHdIcnpaR0JiWHg4TFM1MkduMEFJZWFOWWRiU3lRbEZpTWR2?=
 =?utf-8?B?WUp2Ym8wWEQvemNBeFBDNVBsVVJvWklUdWFLQXRSMDJaWVJlV1lzYVZheTFi?=
 =?utf-8?B?TEhIZHNwQ3U3UUEwNHZRaUVYM09nMmlXWjRuV3lBUjRNNlhHYm5JenpMZHk1?=
 =?utf-8?B?dUZiWUxpY2dreDZRdUdkQm5LNFNiakFHZng5T2ZjY0NtT3VEdmVPYmhWSnNn?=
 =?utf-8?B?RzRIcVA3RmtLaVBmUlB6L2xTWVN5WDlKQjEyclY0WGJXS0M0enphdU5lL3Bp?=
 =?utf-8?B?MHdteXRYWGx4Zkh1TUZaZHlURGczbUlLaHg0aGJEUnFzdTNPRTJsc0hsK0I5?=
 =?utf-8?B?TW1xK3E0SmhvL2QwSXFPODNoUE5md2hNNUJHTzJkaHJtcGVQVk1hNERzaTla?=
 =?utf-8?B?QjhrclRSTzVDMVp3NWRTNUljT1krcnllK2hxSUtwQ2ViNmowWVFrN0JCb0k4?=
 =?utf-8?B?ckdGUytrYlBIRE1jTjdPRW9PNThrR3R3K0NPMktGUDdPdHRIUlNvcUdsU1dp?=
 =?utf-8?B?UjdjMlVXa1VUMkd3QWNYS1ljRG5FNC9FVUtkZHIrZkZYSHcwZ3hXdzBTdyti?=
 =?utf-8?B?NEJOdjhPQ1B0eHlVeHBLSFpmUGtYRnBweDJXVldnMThyR1pWUEFUb0V2VzNV?=
 =?utf-8?B?WmszSmJ5MThvWDU4bUllWHQralNmWjcxZzN2enhCVFEyRG1Td2hVRkQ5clpX?=
 =?utf-8?B?VVF3SEFBaUFmRytVeTNCcG9HcjdMZEkyaDl0ckM2TGtGY1B5ZlBrOHhscjFC?=
 =?utf-8?B?WU5UWnNZVE4zRERiTnRxMTBRZkhqeDdDMy9kS1J4MU0yRmVjZFQvSThVamtY?=
 =?utf-8?B?dHVqcWpWemI5eFpqWXAzY2RDRklHUy9DU092RkZpSVRKbDR2bDBDcnBpVlo0?=
 =?utf-8?B?MFUrOXBJOEQ5cDcvN3U4QlNTeTlwcCt2ZlNFR0NjVmZTZDF0QTFEa0ZYalJi?=
 =?utf-8?B?dzBZSHM2anF0YjNZbER4d2IxQzE1NGpXRWZSS2tiQ2I2M3NCbHFyL3RtWlla?=
 =?utf-8?B?Mko0MWZyNjZlcEc3Mm13a0toSzNlRlhlOVlwL3dvSmRWZ0hQNVZON2pPT1Ur?=
 =?utf-8?B?aTJ2U3pROWpiSTFWV05PSDR3Vm8wZ1RuUEhFbFV0NDgxcHlWeTB4OW9TSjM0?=
 =?utf-8?B?SjUrYjZvUXdhaFFOVkYzVWQvU2VETnU5R3MwZjQxaWVncUZlaWdudEpYc2ZN?=
 =?utf-8?B?aExibWFHd2pQaGxGNCt0TkZBb2IvNVdtdlZjVlRmZ3NxQWtnNmo1TFRlTFdB?=
 =?utf-8?B?OWViL3pXK2t3VHFCNWVDajhBeG8vN1pKa2Zadk5oaGNKcmduSHpYMjhrMnRQ?=
 =?utf-8?B?dUl6SDBWUHEzamhYWFBUMEZadTNHYUlzbFJmeko1K0tJQjRKMlh3QmdHM3g3?=
 =?utf-8?B?TGRxbXpxWDczaDJLeHE2VHlXZjR4a2JlZ2Z1Q2JTWEZzbEwwZ3dWenByNW9X?=
 =?utf-8?B?eURFM2lxZmd6NDZ2S1hLZWxFazlBclhTZk5yQ1hUMEUzV0t4K3p4WWlJc2Fz?=
 =?utf-8?Q?8N2l5r/no4csSJTX+V?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e651ce-c0fe-461e-8c98-08df12d517fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 02:57:34.9436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cZrUy/kl7XsCBZ8XaZ8hl7rF9PhjwWtF8DC+x55CTCgAs0tHmlsUoLPY1emhZ2NpyaNU3kP4CRAe9Uoq6yx4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8472

SGkgTWF0aGlhcywNCg0KPiA+IEJ5IHRoZSB0aW1lIHdlIHJlYWNoIHJlX2VudW1lcmF0ZSAoaHVi
LmM6NjIzNSksIHhoY2lfc2V0dXBfZGV2aWNlKCkNCj4gPiBoYXMgYWxyZWFkeSBmcmVlZCB2ZGV2
K3JpbmdzIHZpYSB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVfc2xvdCgpDQo+ID4gKHhoY2kuYzo0NDM4
KSB3aXRob3V0IG5vdGlmeWluZyBzaWRlYmFuZC4gVGhlIGxhdGVyIHhoY2lfZnJlZV9kZXYoKQ0K
PiA+IGlzIGEgbm8tb3AgYmVjYXVzZSB4aGNpLT5kZXZzW3Nsb3RfaWRdIGlzIGFscmVhZHkgTlVM
TC4gU28gdGhlDQo+ID4gZGFuZ2Vyb3VzIHdpbmRvdyBpcyBiZXR3ZWVuIHhoY2lfZGlzY292ZXJf
b3JfcmVzZXRfZGV2aWNlKCkgKHdpdGgNCj4gPiBjYWxsYmFjaykgYW5kIHhoY2lfc2V0dXBfZGV2
aWNlKCkgZmFpbHVyZSAod2l0aG91dCBjYWxsYmFjaykuDQo+ID4gR2l2ZW4gcHJlX3Jlc2V0KCkg
aXMgYXZhaWxhYmxlLCB0aGUgcHJvcG9zZWQgZml4Og0KPiA+DQo+ID4gMS4gU2lkZWJhbmQgY2xp
ZW50IGltcGxlbWVudHMgcHJlX3Jlc2V0KCkgdG8gdW5yZWdpc3RlciBhbmQgc3RvcA0KPiA+ICAg
ICAgcmluZyBhY2Nlc3MgYmVmb3JlIHJlc2V0Lg0KPiANCj4gU291bmRzIGdvb2QsIGNhbGwgeGhj
aV9zaWRlYmFuZF9yZW1vdmVfZW5kcG9pbnQoKSBmb3IgZXZlcnkgb2ZmbG9hZGVkIGVuZHBvaW50
Lg0KPiBJZiBwb3NzaWJsZSB0aGVuIG1heWJlIGV2ZW4gdW5yZWdpc3RlciBzaWRlYmFuZCBmb3Ig
dGhpcyBkZXZpY2UgY29tcGxldGVseSBoZXJlLg0KPiANCj4gDQo+ID4gMi4gQWRkIGEgc2lkZWJh
bmQgY2FsbGJhY2sgaW4geGhjaV9mcmVlX3ZpcnRfZGV2aWNlKCkgZm9yIGRlZmVuc2UNCj4gPiAg
ICAgIGluIGRlcHRoLg0KPiANCj4gU2VsdmFyYXN1IEdhbmVzYW4gcG9pbnRlZCBvdXQgdGhhdCB4
aGNpICdjb3JlJyBpbiBmYWN0IGRvZXNuJ3QgaW5jbHVkZQ0KPiB4aGNpLXNpZGViYW5kLmggeWV0
LiBJZiBwb3NzaWJsZSBJJ2QgbGlrZSB0byBrZWVwIGl0IHRoYXQgd2F5Lg0KPiANCj4gU2V0dGlu
ZyB4aGNpLT5zaWRlYmFuZC0+dmRldiB0byBOVUxMLCBvciBjYWxsaW5nIGEgY2FsbGJhY2sgaGVy
ZSBjaGFuZ2VzIHRoaXMNCj4gYW5kIGlzIHRoZSBmaXJzdCB0aW1lIHdlIHRoZW4gaW50ZXJ0d2lu
ZSB4aGNpIGNvcmUgd2l0aCBzaWRlYmFuZC4NCj4gDQo+IExvbmcgdGVybSBzb2x1dGlvbiBpcyB0
byBub3QgcmVhbGxvY2F0ZSB2ZGV2IGp1c3QgYmVjYXVzZSB3ZSB0cnkgdG8gZGlzYWJsZSBhbmQN
Cj4gcmUtZW5hYmxlIHRoZSBzbG90IHRvIHJlY292ZXIgZnJvbSBhIGZhaWxlZCBhZGRyZXNzIGRl
dmljZSBjb21tYW5kLg0KPiBVc2IgY29yZSBkb2Vzbid0IGZyZWUgYW5kIHJlYWxsb2NhdGUgdWRl
diBkdXJpbmcgZGV2aWNlIHJlc2V0IGVpdGhlci4NCj4gDQo+IE5pa2xhcyBqdXN0IHN0YXJ0ZWQg
bG9va2luZyBhdCBkZWNvdXBsaW5nIHZkZXYgYWxsb2NhdGlvbiBhbmQgaW5pdGFsaXphdGlvbi4N
Cj4gTWVhbndoaWxlIHdlIGNvdWxkIHRyeSBhIGJhbmRhaWQgbGlrZToNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+
IGluZGV4IGE5ZTQ3ZTE3OGMyOC4uMGI1MTUyYTFhMzAxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9ob3N0L3hoY2kuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYw0KPiBAQCAt
NDQzNSwxMSArNDQzNSwxNSBAQCBzdGF0aWMgaW50IHhoY2lfc2V0dXBfZGV2aWNlKHN0cnVjdCB1
c2JfaGNkICpoY2QsIHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0KPiAgIAkJZGV2X3dhcm4oJnVk
ZXYtPmRldiwgIkRldmljZSBub3QgcmVzcG9uZGluZyB0byBzZXR1cCAlcy5cbiIsIGFjdCk7DQo+
IA0KPiAgIAkJbXV0ZXhfdW5sb2NrKCZ4aGNpLT5tdXRleCk7DQo+IC0JCXJldCA9IHhoY2lfZGlz
YWJsZV9hbmRfZnJlZV9zbG90KHhoY2ksIHVkZXYtPnNsb3RfaWQpOw0KPiAtCQlpZiAoIXJldCkg
ew0KPiAtCQkJaWYgKHhoY2lfYWxsb2NfZGV2KGhjZCwgdWRldikgPT0gMSkNCj4gLQkJCQl4aGNp
X3NldHVwX2FkZHJlc3NhYmxlX3ZpcnRfZGV2KHhoY2ksIHVkZXYpOw0KPiArDQo+ICsJCWlmICgh
dmlydF9kZXYtPnNpZGViYW5kKSB7DQo+ICsJCQlyZXQgPSB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVf
c2xvdCh4aGNpLCB1ZGV2LT5zbG90X2lkKTsNCj4gKwkJCWlmICghcmV0KSB7DQo+ICsJCQkJaWYg
KHhoY2lfYWxsb2NfZGV2KGhjZCwgdWRldikgPT0gMSkNCj4gKwkJCQkJeGhjaV9zZXR1cF9hZGRy
ZXNzYWJsZV92aXJ0X2Rldih4aGNpLCB1ZGV2KTsNCj4gKwkJCX0NCj4gICAJCX0NCj4gKw0KPiAg
IAkJa2ZyZWUoY29tbWFuZC0+Y29tcGxldGlvbik7DQo+ICAgCQlrZnJlZShjb21tYW5kKTsNCj4g
ICAJCXJldHVybiAtRVBST1RPOw0KPiANCj4gRG9lcyB0aGlzIHdvcmsgaW4geW91ciBjYXNlPw0K
PiBDYW4geW91IHNlZSBhbnkgbmVnYXRpdmUgc2lkZS1lZmZlY3RzIHdpdGggdGhpcyBzb2x1dGlv
biBsaWtlIG5ldmVyIHJlLWVudW1lcmF0aW5nIGFuZA0KPiByZWNvdmVyaW5nIGFmdGVyIGEgZmFp
bGVkIGFkZHJlc3MgZGV2aWNlIGNvbW1hbmQ/DQo+IA0KDQpUaGFua3MgZm9yIHRoZSBiYW5kYWlk
LiBCYXNlZCBvbiBteSBhbmFseXNpcyBvZiB0aGUgY3Jhc2ggcGF0aCwgaXQNCnNob3VsZCB3b3Jr
IOKAlCBza2lwcGluZyB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVfc2xvdCgpIHdoZW4gc2lkZWJhbmQN
CmlzIHNldCBrZWVwcyB2ZGV2IHZhbGlkLCBzbyB0aGUgc3Vic2VxdWVudA0KeGhjaV9zaWRlYmFu
ZF91bnJlZ2lzdGVyKCkgaW4gdGhlIGRpc2Nvbm5lY3QgcGF0aCB3b24ndA0KZGVyZWZlcmVuY2Ug
ZnJlZWQgbWVtb3J5LiBUaGUgZXZlbnR1YWwgeGhjaV9mcmVlX2RldigpIOKGkg0KeGhjaV9mcmVl
X3ZpcnRfZGV2aWNlKCkgc3RpbGwgY2xlYW5zIHVwIGNvcnJlY3RseSBzaW5jZSB2ZGV2DQpyZW1h
aW5zIGludGFjdC4NCg0KSSBkb24ndCBzZWUgb2J2aW91cyBuZWdhdGl2ZSBzaWRlLWVmZmVjdHMu
IFRoZSBzbG90IHN0YXlzIGVuYWJsZWQNCmZvciByZXRyaWVzLCBidXQgeGhjaV9zZXR1cF9kZXZp
Y2UoKSBoYW5kbGVzIHRoZSByZS1hZGRyZXNzIGNhc2UNCmF0IHhoY2kuYzo0MzkxLiBGb3IgdHJ1
bHkgYnJva2VuIGRldmljZXMsIHJlX2VudW1lcmF0ZSDihpINCmRpc2Nvbm5lY3Qgc3RpbGwgd29y
a3Mgc2luY2UgdmRldiBpcyB2YWxpZC4NCg0KSSdsbCBhcHBseSB5b3VyIHBhdGNoIGFuZCB0ZXN0
IGl0IHdpdGggdGhlIGNyYXNoIHNjZW5hcmlvLiBXaWxsDQpyZXBvcnQgYmFjayB3aXRoIHRoZSBy
ZXN1bHRzLg0KDQpSZWdhcmRzLA0KTGlhbnFpbg0KDQo=
