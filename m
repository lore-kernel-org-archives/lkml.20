Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012045.outbound.protection.outlook.com [40.107.75.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656631ED7C;
	Thu,  8 Oct 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429846; cv=fail; b=l4Zhpqy4KhLokx+c6+lS7BBvRFOSWc6bK5YGawe+nupN58Csokr/lUUkZ1Y3OGgcapGQwAY8VizLUnFc17bcHRSDgVu2IySr81Rxbux4XO8WtifdK8mFC3NpoQqlsKVBW8G5x2ldlB3eJYCQKzyf9NEVc+UnKuCEbGJTI0+wEo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429846; c=relaxed/simple;
	bh=v9E/39gGpou7nes9Kc2+1cWvGE7P528X7zSbgvqxRq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KfOVdPxdRuS4qRL6i2fvOv/sCXWaoP81LkDhj1/UuTbz8ochlqGefHPaDkyDKoHUTINL2GAVPwCYTiWBe86TMaIUqZ9vtjaXn66/Hqi8nU1IucQPGgJYNLuNm6jeC1wuuS61NL6AoLJP8mltP5eVfII+XmHaer9LTP4xYPDPvMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QHSkGe0F; arc=fail smtp.client-ip=40.107.75.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QHSkGe0F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzg/KfzTGzC88CEKhoIMy4+HocOynWRJ76TEnqayDVEqy0BuQTe5DNc4Mu4gEFfnOK3a5K7CygYHG96s4QLm2ss7oOZjnVDrEwLN2JjmgGZkJsrk8J+N/np7ewZQpUOEbFr3+bug9Yg1szv2V34/t9IfsBYfkYPIKXdRG7nzgwA7/1m3Fzlr9cerDwD2UEQusa2CfezjeyhadQoST8YW/9yLJqbHgL/UIOctcjgvUDt7OYkwC6UpobDm+5MoGq7C5W8n1QYsNeW7IJF7Ml+OlySjE3oiNvaieYTaAZL4Hxd5NvgnOy66FDe+aUlF6KkVFr3q9HvCVxvebIG2DHjJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9E/39gGpou7nes9Kc2+1cWvGE7P528X7zSbgvqxRq8=;
 b=IXp3/qE0IkYdfBtzhD4I0dR8iRTPjSTiNauE4Ct9FfVp/kz5v4W0Rn2K5H8hQ1afnaZQi1OWoH+gKndn+yLfEGpC3KmrtScaZjHglog5mNp8fkbk/T8ltVWFdv+TN1uWd9t9/J5Py9jclMEtZl4gU/j3aOACOmTRiOzMkfHQo6fzdvmMkA0V1ez8RbIJaUBfsJHFUpUaIAcAB8wMJN0ds6vsxFlAJgH+Un8rg1QiUqrAdU3WAovIOHX7fb4GfPbyvDmpbM2OAS0XgbERpOnEBtG1wtODnNVQnOPE3C9uS88riPTKJdSTltYLWugW8Kr2ds8ECAFn8HTa72FWQ/GdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9E/39gGpou7nes9Kc2+1cWvGE7P528X7zSbgvqxRq8=;
 b=QHSkGe0FvQyARGNM/60TNK8UW5v/EfX8JUs0vGQzdpqU4QOCQu3tAUs3QI2DYmdgnq4xTb6CThyaKe9OeMK5LIQGXZKzulUmSjea0OXWwGUzSFGPB0AMtHIj9quS/6aJVIV4/cYvWvMkfNZesFz8osO2uKndR6QD1YAhHrFoykgovWgg7ZFmbU8U+QN3+2TzDH9nq3rmag4LHzqekV/FyYXftMlpzDHDSuH72pPfQZAUjmeJ2h/+iVyLfw8wKU3bqXgtCKl6/TQNxxwzOZac6/Ko6IjxDFKgoCfzTncr/TACYR68A2W2ITVUlPIvgedtH5AWaAPHvUTHgx1dYesYVA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB6406.apcprd06.prod.outlook.com (2603:1096:101:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 03:23:57 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 03:23:57 +0000
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
 =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFu?=
 =?utf-8?B?ZDogY2hlY2sgdmRldiBsaXZlbmVzcyBiZWZvcmUgcmVtb3ZpbmcgZW5kcG9p?=
 =?utf-8?Q?nts_on_unregister?=
Thread-Topic:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0geGhjaTogc2lkZWJhbmQ6IGNoZWNr?=
 =?utf-8?B?IHZkZXYgbGl2ZW5lc3MgYmVmb3JlIHJlbW92aW5nIGVuZHBvaW50cyBvbiB1?=
 =?utf-8?Q?nregister?=
Thread-Index:
 AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADMKMIAAD/GAgADmgsCAGyyvkIAG5DkAgAIcTNA=
Date: Thu, 8 Oct 2026 03:23:57 +0000
Message-ID:
 <TYUPR06MB621797396AD72C5F2D75A3F8D2932@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
 <TYUPR06MB621785D1597D55101A3D3767D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217188F67BFDD41E4917856D2892@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <5a9d577d-12c3-45dc-ba7d-6a4dd6326673@linux.intel.com>
In-Reply-To: <5a9d577d-12c3-45dc-ba7d-6a4dd6326673@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB6406:EE_
x-ms-office365-filtering-correlation-id: b8470437-1950-44da-15d8-08df24eb96ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|42112799006|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 deIQnWBBE902Gg9JzOKgn9BGhrNsF+YIRAoAR41o5+ODePK+H/+kxjtNryI0HsgcHtuhIHU7c7kNyjtJE1phc5wy5Y6XbZk16/CXdTcVp63NsH/gpRShGSH59mWzHvJQurskkhSSv87cklI0ufmJe9X4D5Zzf7ruiVk/bgvDUVW2u/2nQOCpVVo7j6HvsoShPOEzZC7vcRGmf+/QxwRRjnZsh7dWCbeolNM3tIBwwSX56VVfSiebVtPOdErYAuSzd5Q0H7OK1hQYdKe01I+AfBUBR2ecOVBXYJ90k+1kCHE/CVImpSN21C4jA9cYz+fez2oRh42q3Qk3vLTxPhdScNoKKUy+eRqiDblOcLi25Ewht3q6QEzfu67nLrKDd4fKML1i12qRdC8H8Q5i89F9wVMr+S4xJazRlv5sWdg7C6EytczwBQCPmdGHGXgrcW5N51brxgor73We2y9G48JXC1EMoMC92TVPRwamyL/90bLB8Qm4LOqIEeRdXxby5nxQl1MZf0SybxMoXeyHFhEKzeqQa6Akx5JCNLFcBIpdxM1MTKBEb4VChhbH23UN6jM1kfhWIqldDo+8aImRM41rWipxkS0rLUUoJNXCZsAGFGpjgYE/VSQZAWBGDAIVe2wHEJraomRDzQys2e8S9BWNf/wm8pKP+lMczEk/6Z3rTlotsqKfNCL1YtnRLO9JCbvP+JhOwZ9f4CtBu6e8Fsj61PqSsmZZUxrnDnl8B8gBQB4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(42112799006)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVA1T0VxVjBvQ3QrRnZib2tkTm50SGpPdEVSbWZIQzBGVnA1TXM1NTlUdFpZ?=
 =?utf-8?B?Ui9IcDU1SVJCTlNrSmZoWkF1TWJIQTFxM3RVOHUrUlhhK0ZMK3FiekE5MXJW?=
 =?utf-8?B?OWdvaFZqNW5QcWJjQWIrMHNTOHdoUjlHUG05TGZVQnhWcVdPY2hCWmVZVFNY?=
 =?utf-8?B?bDlLWWs3Uk9rd0RlcUNrZE45Q2IzdXlFcFBhMHpjdFd1ekNuUVE2MDFaeDFq?=
 =?utf-8?B?SUE1NW85Z1JpZTBlcWhhNzN2T0M1Qy90S1BDcnVjNDN1ek9CbzFkb2c1MTVl?=
 =?utf-8?B?aGNOMlFXTkJOdnFxNmNNZlpJTmVsdXVFSzdCVHRCUHo2WjF5S0VkejdCcEpB?=
 =?utf-8?B?MUlPMHV4QlZ4QTNNcEpFNkU4NnZIYkFheVl3eWRPalZPdVI3djJMVTFoMXRx?=
 =?utf-8?B?Z29kQnhwWU5qbE9WZUN5QmxiV01zTWhCUHJPcHJMNWg3R29WemZoaXFEY3Nh?=
 =?utf-8?B?SUpocTltM0VoRVJka1NvdDJHeXg5MGdEK2JwWnRGR05yTWV6MTVKbTJyNHB4?=
 =?utf-8?B?RnpLdCthb0pYbm9uNk1nYm9kdUNGRVAyWTk3RnBMOVVzT01uNzhsdHBuSEZR?=
 =?utf-8?B?TE4vZGh5ZDlYdFNlbzZUelRWbk1oeXJpeUEzTFZWRW1UWXFoWDNlbDlpSHNB?=
 =?utf-8?B?Z2MwbWhyTWFDZ0c3NDlBUnU5RmNIUHpJcUNub3RMVVlma25SNzBFVHJaeURs?=
 =?utf-8?B?RldKYU9KR1Bwa0duUnVpYlFJbk0rMlFEdzkwcHFrZ2V3dVpHUFI0dzdlSGtJ?=
 =?utf-8?B?U3ZpTm9yQjEwMzhrZmJDRVJVUHQyYWl4UXlUcnpHWm11bW1HSHZjTzdTb0dF?=
 =?utf-8?B?b2lHZ0NRY3ZaWVpwM2dMQ2REVUR2ZW9yN0NuWjBkdGhlYTAwcThmQmVCMmw5?=
 =?utf-8?B?STdmeW51OU5jTUE5M1ZwbjFtd25PSHkwYncxM0diaTZJQVZSTFNkSVB0YmlY?=
 =?utf-8?B?YytNT0pBQjRwcm1lVHkrMlFnU3lDeGNZb0trVW9QSG9tZ0t4c2grZmVoVDE2?=
 =?utf-8?B?MllodlVWTDFBT081bTdncmViclplaXNUclM1TmFoWWVpcFliM3pDZURac1No?=
 =?utf-8?B?dk1MRHg1eUJoelFTd3pUejRtalN3TkJ2SGZHSVU5VVZNUmhXdndFTzMyZitP?=
 =?utf-8?B?a01DRVo2RUVnNzZ2UVN5cWNMTjd5WHRPUkJyNmJ3QWFMTWFhazRzV1Zpazg0?=
 =?utf-8?B?MUtOaFhDMG9zUnYxVm5BclUrZEVBTjc4eFBuMTU5SGZ2S3M0QW5nemhZRXhz?=
 =?utf-8?B?VitLVkxvUW1INlNzV1F2L0U0UHhFSUxMZWs5bVVnV1BNUVlNb1p3Q0ZwQWJG?=
 =?utf-8?B?MllsaWN1a2Q1VWl3TjZZdHY5NDJTbU5SWGFVUkVZL3ZmaFB6SUNaRkp6MC9n?=
 =?utf-8?B?S2NONWxOaHNLeHAyaTFQdjZuYmFlNXRYcWVnZFd1d2JvbHQxUStWbkx4ZXJj?=
 =?utf-8?B?eXhLZWF3UW5Rd2hoWkpjLzNZT2haQVFYQU84T3orTHBhZVEvdFNCcFNkbytX?=
 =?utf-8?B?anh2am1QejMzeU1GSGJLak1zQ3Q3dzdmOHkrMWE1Qlo0ekgrNWRPZ2VUdVBw?=
 =?utf-8?B?aW0xL2xndnMwNDRjTTgrZmJMRnRGUlFnWVlQMkdrV1NuZ1lBMzFUbnNsd0dO?=
 =?utf-8?B?azlRVDZjU0hnZ2p0WUFHUmpyNGxQMXcwTFNXaWVHK2FLL3J0ZXhzR3hDMUcv?=
 =?utf-8?B?VzRQVnNxY05wblhCQ0hxTTdneURmc0NBdGtPeFk5cnplWjl1V2U3Wko5SkQ5?=
 =?utf-8?B?M2loSEp6Q085dzl2RU5KUjdmZVY3VzNBY3VybmxFbmRUczh1YTFDYTZtUUpz?=
 =?utf-8?B?T01ubUczeTRqb3Rqc2RseXB1RytaQkVROXNrSUMrODhsdWRmQjBzbFpJRU1E?=
 =?utf-8?B?MkNkZkExZ2UzUG53TXRlMFZqSG4zWjBEbHovNUNFcFFKTHMrZkM1NGEzL0d3?=
 =?utf-8?B?VXlXMjU2SWVtbnhTbXBOWlBrWGJFeWZTdUNISkxFZy8vclRQckN4dXBLTFVJ?=
 =?utf-8?B?d1ZkdWR1R3lJT0NoRkVyNStiQ0xYcUVVM1RWNkFnZE1SNFR2T1Nwd3BUMlhw?=
 =?utf-8?B?cThBWitrUG1rQ1NYYzdBSGZYTWg1QjFvOXBXRmJHOEFkUkxTYUFyRktUSjN5?=
 =?utf-8?B?WXhaQUl1ODNld0FpTEl1dG0vbUpDMzh1anJYSlJvSnduR3ZFRllzM05wOTR1?=
 =?utf-8?B?cWdMK2FWclFIZ2JSVkQxcTV2S3hQZ1BqWE1yN0hoaDhCVXpiWXl3c01MeDlC?=
 =?utf-8?B?cVBvY3lCQmM2N21ZNFhDd1VaUkJFMndJSFdlSnlGNFNTVDdQakVNMHI0b3ND?=
 =?utf-8?Q?gG5FVwxUKMkkYtyAYx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b8470437-1950-44da-15d8-08df24eb96ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 03:23:57.5539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FNxPRKXeh0u2LQDs9hyEZJhDKsf6lkTLHycEc4gY5mMETzNGg/c9TLoAA+M3tFs2QHEGoul1f3Wl86ciaY1QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6406

SGkgTWF0aGlhcywNCg0KPiBJJ2QgcHJvYmFibHkgc3RpbGwgZ28gd2l0aCAhdmlydF9kZXYtPnNp
ZGViYW5kDQo+IA0KPiAhdWRldi0+cmVzZXRfcmVzdW1lICYmICF1ZGV2LT5yZXNldF9pbl9wcm9n
cmVzcyB3aWxsIHByZXZlbnQgcmVjb3Zlcnkgb2YgJ2FkZHJlc3MNCj4gZGV2aWNlJyBmYWlsdXJl
IG9mIG9yZGluYXJ5LCBub24tc2lkZWJhbmQgdXNiIGRldmljZXMgdGhhdCBuZWVkIHRvIGJlIHJl
c2V0IGF0IHJlc3VtZS4NCj4gDQoNCllvdSdyZSByaWdodCwgIXJlc2V0X3Jlc3VtZSAmJiAhcmVz
ZXRfaW5fcHJvZ3Jlc3MgaXMgdG9vIGJyb2FkIOKAlCBpdA0Kd291bGQgYWxzbyBibG9jayByZWNv
dmVyeSBmb3Igbm9uLXNpZGViYW5kIGRldmljZXMgZHVyaW5nIHJlc3VtZS4NCg0KV2UnbGwgZ28g
d2l0aCAhdmlydF9kZXYtPnNpZGViYW5kLiBXZSd2ZSB0ZXN0ZWQgaXQgYW5kIGNvbmZpcm1lZCBp
dA0KY292ZXJzIGJvdGggcGF0aHMgZm9yIHNpZGViYW5kIGRldmljZXM6DQotIHVzYl9yZXNldF9k
ZXZpY2UoKTogcHJlX3Jlc2V0KCkgdW5yZWdpc3RlcnMgc2lkZWJhbmQgZmlyc3QsIHNvDQogICF2
aXJ0X2Rldi0+c2lkZWJhbmQgaXMgdHJ1ZSBhbmQgbm9ybWFsIHJlY292ZXJ5IHByb2NlZWRzIChz
YWZlKS4NCi0gZmluaXNoX3BvcnRfcmVzdW1lKCk6IHNpZGViYW5kIHN0aWxsIHJlZ2lzdGVyZWQs
IHNvIGZyZWVfc2xvdCBpcw0KICBza2lwcGVkLCBrZWVwaW5nIHZkZXYgdmFsaWQgZm9yIHhoY2lf
c2lkZWJhbmRfdW5yZWdpc3RlcigpLg0KDQpUaGFua3MgZm9yIHRoZSBmaXguDQoNClJlZ2FyZHMs
DQpMaWFucWluDQo=
