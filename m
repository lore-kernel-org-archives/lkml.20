Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793980749;
	b=x0LbhNVry2GB3Tz1y1cYHufB8V1zn+aHo16+TvSiqrNijMpz7JpPpoXkfHNnLQx5krTf
	 +oo2f0+HGd812ElOTRL2TtXZWfE25ltbeBh7t5D+eXQ9dgubDHRZg30+qrEdiAFaN2mkO
	 N+HbrMTK3Di0RtIhnJJttusPeUvnUZVPwFyTfSQkQPhd1nyWF+dZudM9MgqHYsjbKv6tK
	 4CMVoCGu9bP5yL8qY4HZ0L2Gs8Uxq79ED+KzFA5LIddxaRW0NcfPFny3slmngTuSJy2TS
	 wvQsF/O+6NduYoGyLC8y4DluVth9dxAZpXSbZ5SgCF+hIjf2ZL8eX87PAVxvFy5QL6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980749;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xxrVxEIlXSSpw5OA8VISAl6h2wSDNS4+/iyZA4/2NXk=;
	b=GaJiM+kVNfoLHnOC+7sJ/8DTz/xxFfKA+0XBbGcCO2iQS52bPQazqTZ4BhqEYbu7pj6b
	 QhCTWpt6cHiG0058xlLSLltgJtVziFeNZlvOZue4LZ5vFhfPupai2cqmwscH1JOUm99WV
	 /QrzEHeLhR5aC/nl1TNRsmIQhZeqbJE4luXlyehOU4XZ/yOXmEypudh6OHbhW125VKlWK
	 KGbY1jgkgH7wmDaygU7lNIO5RQIbIthTKUhBQpYmT2b8ASOiOwbMYFV4DEg7H0P8oiqqg
	 bwsYiN4+KdptQ/YiBCeabphQjo5ZRD0Jy3qn3HEWO69QEkbGCLeIsMZMruv8sNJUKQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CDKzNdt9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.86
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013086.outbound.protection.outlook.com [52.103.14.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713A606A329;
	Fri,  6 Nov 2026 15:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3713A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CDKzNdt9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vg+nCZDDbVyi4CXe/SyveVdU7C/W/dSyYZtedVmgmPWDoqbomuLuI/1ONmxWhUsFjIYnaa9kem5I0+93p9uNo3pblTjh+YXd5ukiRah22kXTvjMumc4t3bIUjE9YLy4nJZLBTZMeJ9MtfxqvIPM0etkvsqQbiMEDDFh1LWo5NgQjv5SwgmDXRkRa8x2HhFCCMzJPaoCR+HX60eoQCCOa/51/6glL+wkD4/vwuiIVxmbZ0fJX++IcSjC9EFrcfWriVW1kMHzAMNvXB16Fosy7vcuqF+TXkOVChdM86rPRppKAAWyGHmYRkqh5hXrIwaYAcqwXvVW26n9L/zFbw7+7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=xxrVxEIlXSSpw5OA8VISAl6h2wSDNS4+/iyZA4/2NXk=;
 b=R9jilPd6iItJUcxhSkWMpUKtevdkzpd9Tc3je59Hw62bgY8FCZCaBTmObLwhgFphJazBtLZgdwmsR5ayvTUUss6S3QTuGVL4nmDKN3kUAUaFTYiIKNytcXR1PuSleJ5pJPzpELyZr64aClmezpiJ0Z01Uq4axv2GT6r1MF7NQCwSDFlH8J3Tj/LABH2zkHGmpAqiQ+gd8Wvg+iojy5Y15TVYEjKJs2MEeuhSUT04DfOgLERsuKiQ+HgXaCt1EwSImcppUbM356PC2utoZfjwFlo84jBzu3EGUvWOqfmeefCP2BmRPgY9fxnPjWOl45V0Syp8gMcrCm2NSG7IlfoB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxrVxEIlXSSpw5OA8VISAl6h2wSDNS4+/iyZA4/2NXk=;
 b=CDKzNdt9ObtN93YmKtSsp2NFPz3Z6KXZeXksvkbGVI/qByyGpogRJuM43JKqBDE26v0OMpz5wKywPRH8Qyxa2XRLcDz5Jjf6PUgSwsEuHtmrv4YCguWNraP6zcVRjwX+zHYRaK7ky1GbmWVnaLWwNpCEUPhILd1n36petQKemEkJAJHkeRyWqmJdt2XhQabc0pLERRvRKkvAhrNo4bKWFCka7eQQropTMqbmKC7gLR5XeNiOlXhPBJOLsJQY6YfMgDODubNiQXYsgINQHEXxUl0VYjDtQ4sYzo0DOifNPHOrSxlSHWjaOfSjDTY1fW8dI7VOqFKCBjbCCwvtPZFE2w==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by CH3PR05MB9457.namprd05.prod.outlook.com
 (2603:10b6:610:146::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 15:59:07 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 15:59:06 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: midi2: copy configfs strings for live functions
Thread-Topic: [PATCH] usb: gadget: midi2: copy configfs strings for live
 functions
Thread-Index: AQHdbgfASwPl4p5AsEyV6ATtneB4gw==
Date: Fri, 6 Nov 2026 15:59:06 +0000
Message-ID:
 <e638dc9ab93c4b90c263d7ec836735eb17335cda.1793980732.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|CH3PR05MB9457:EE_
x-ms-office365-filtering-correlation-id: 6aad3b1a-a876-4da3-376b-08df3c1ee321
x-microsoft-antispam:
 BCL:0;ARA:14566002|4140399003|22091999003|38102599003|19110799012|25010399006|8060799015|8062599012|31061999003|15080799012|24121999003|24021099003|41001999006|12091999003|40105399003|52005399003|26121999007|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?utf-8?B?MkdVUDRrT1V5ZGt6L1gzNnBCeWpCcEd6R04ySWZoSG8zeVN1bE9CVGphTDBm?=
 =?utf-8?B?cUVEZjl4N2tob3FzdDMxd0xDSDFUTmZlbnovUCtOMmVPcmY1a1JEbmo0d1R3?=
 =?utf-8?B?UmF4Y3lrdE5KdmZQbnkxclljWEV0V29YbmNuc0t4TzY1THdoais1Y09iTDV3?=
 =?utf-8?B?cDBCQ3A4bEJUK0xHVWEyY0g4RmdINlZVVHA5MzNCN1YxL2VGSEs4MzFOSURz?=
 =?utf-8?B?a1d1Rm5QeDJsbURkMUJPdUlJU0dsOGRyeUxDcSs3enFmcExzSERseFhmR2tD?=
 =?utf-8?B?RUlRNTg5RkdOc3Z1MHJDNWh6UUllaUxOYXVBQTJTdGh4dktjTHFqKzNSNnNm?=
 =?utf-8?B?U3NOb2pOTXUreFBDck84R0s3ZFg5M0hXdXpSNlJpMk13cnVXS0I1WUxFVmJs?=
 =?utf-8?B?QStPbmVZVFZIcG9ZREVGZEYzNk12bGtUa2NZNEZFdmN4V0wraHNONmxOcDVF?=
 =?utf-8?B?WDVMKzBUVlJ1SWdoRmd1NkphOVVqemlyRFNNT1pwNWFqdUxnTDlDZnZEMTN2?=
 =?utf-8?B?NTZiM1FDaDRPWDZVN0puRXR2eUg5b0preENNUmNmTXNMYlBhNjk0Tndaekpw?=
 =?utf-8?B?REh4Mjk5OVUyejJ3T3pnUmppbFZaeFpjZWt0b05JL2RRWjd3cDZiL3hic3ls?=
 =?utf-8?B?MjY2Ymh6MVc4KzIzL2NLTUVVV0ppazhEanZDb2l3M2FGdHh2Sm11OU1DWjFO?=
 =?utf-8?B?RU9qMkIyLzFvZ05CTUlpWHhtYldFS0JWRnFDL0Q0cERQSjgyZUhuNm52UHJR?=
 =?utf-8?B?TXNsQytFeVVGWUI5NzFlVWluUHliby9FdVNHU2dzbXhzYlp3eXFMVjJDeXpB?=
 =?utf-8?B?NUdCZ0tYZmxBUUZTLzlzenFLZFh2TWp3Rlh4amdXeFJBakZXZ3ZNbG80amlD?=
 =?utf-8?B?Y1pmZTR6QkdPRmhpQWdoSHpnZ3lxS2hieklsc1N3QWhaeGtueHpTQ0dSMWYz?=
 =?utf-8?B?UTU4RkNzNlNHVlozR1BLYnA1RHBXYU5JSWtSSUhTOGlaUzZTWVk4UVZoRCtC?=
 =?utf-8?B?bDE5RHhkNkdJQzVUenl1VUUvcDlKVVdBNlVpZVZKTVBtM1krVGVEK0syZ2d6?=
 =?utf-8?B?NHorZEJFZHFlMTZqZFBvV1UrVzR5UW5TY09uMktIcVhIVEw2YjU0N0o3cEVm?=
 =?utf-8?B?NDNncTVITit3dnM1MU1GdUFVajR3bzh2V09QUU05VjNVOUpvT2hxMldkM0Ja?=
 =?utf-8?B?b1l6amIyUStUaWk3NUlZMWZybXRXSlYrL2RDWm5IYVZlNEE3QkdTM1IydXhW?=
 =?utf-8?B?ekNvd1dtMTcxeXUra3B6bDgrZ3RkcGZCZ1lKRXRkcEMyU2c0RmxxTVFrbWx0?=
 =?utf-8?B?RkQ2TmNKc2FTOWxrRndKdE85L0tFNDZjdURHNnhTT1V1QmJJUWc3Qkp6WEhY?=
 =?utf-8?B?WnlOblNTUDgvMlJtQis1WGJJSWFzNElyUUI2V3hzY2tMV3dmeVVCb0M0T2RN?=
 =?utf-8?B?OEZoajc1NStQTmFhRHh3aEYzVDE2cDVMSWFVR2lSU2l2MFBmNHR0eUVaNGw2?=
 =?utf-8?Q?C9o4ihghDFwlrd8T3nvsk1rL7DK?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y041QXJkc2dYc3hZYVpNYlozQ0RyT2Y3eW9WZEZUVkoxZE5lYlNuM2NzUmgr?=
 =?utf-8?B?ejNmc0Y0Sng4NlduS2xZak1hZWlUL1RoZy8yZy9rR1ZrZWFqMGR1OFRUZngr?=
 =?utf-8?B?QkxjUW5NRURwL1VnMUZtOVJueVd5RDZpTHF0VWwzb3h4anRlOFZrVjE5ZDd4?=
 =?utf-8?B?UElYU2g1cmtSNUh5ZU5OblVsdXVvZXQ5NG5EY3FhbGdJTE8vR0pWbnVqMURB?=
 =?utf-8?B?THRkcHpGSTFJMG02Q2d3aGVwS29GdHNRT1NtR1lZYjFRQkZPSVlGTno3YjEx?=
 =?utf-8?B?c2hJamhMWnlwTFdWZUh6YjZaZzNrZ3FGck0zRzZIeHR5dmpyR2hkbkJCQnV5?=
 =?utf-8?B?RVNiOW5pbGFXWC80QUhkN1IyUzEvMnZJZUwwU0taUFF4ZEJSdG16c05XaUhy?=
 =?utf-8?B?WE1IYW5URUMvaG1NWXFkQURlUUM1dzdFNjBEcjlkOUkwMXhGc2tObmhzaU9i?=
 =?utf-8?B?V2JzMENNa04zQS9XWm4wU1lVY1pPNHJWbC9hdHU2dzQvVmpWeXl1d0Ewd09v?=
 =?utf-8?B?ZkU3eE4xeW42bU02bEZXU3Z6NlNsY05oWXZQNllEc0tjMkF6cmltNm9Jdnc2?=
 =?utf-8?B?OXZtYlJpT0FKci95RGM2SWFWQ2ZxN243MWt6ZWtVMkZheG52UkIwN25VSVFR?=
 =?utf-8?B?L2dheW5wcFJsdmtPa2hEOXNUNkozT3d5U1dFZVc2TmZ3MUhTZW8vL2VTNFV1?=
 =?utf-8?B?SmNpUjFjSnoydGZ1SG9rY1d4RnFZVDFkb0swQk1mcHZKSGRCbW1LL3MxVno3?=
 =?utf-8?B?RStzN2h5Z0lxVzFGR05sYll1YWZZSVM5ZkdyWEhwM1QyVGJjaHh0d0dxa0sv?=
 =?utf-8?B?NTlpbjFndHRnRGY5L3p3RzJLRU5iR2RsTVFQODgzck5xVGdYT3ptMGpVYVhv?=
 =?utf-8?B?RXk2UWEwNmgxZ0pLZ0xXcXVjS1ZpaDYxUW1EM0x6U1pmVU1zZmZPek9uTm5O?=
 =?utf-8?B?ZzR2QjdzTFFZS0NxcHlvbk1ia2JPZ3hOOTMrbm9WL00zc0FkNXJ3Smhiemcr?=
 =?utf-8?B?NTlxWXhEMTJ5UEgwR1ZsYTM0WEdWajBwNzZrNWVreko3RndMQUlmeGFEdldF?=
 =?utf-8?B?NS92NHFtellwSlNCZHlEUFZ1RE14dWFBR2psNGdmVW9XQkc3RlUyTEtNaU1N?=
 =?utf-8?B?RklCelB5bW0zNlp6bC82eVdYLzJSN0xiWlQ4Z005eG9FdFJFNFMwTHBiRmxG?=
 =?utf-8?B?am15RnU1TUptbXFJMEphUkN1dXJGV2luQmtua21sc05MWnRLcWpUdjJ2TDJ6?=
 =?utf-8?B?SmhDR3lUMm9KQlQ4aDB5T0x6UDFOQ3RqL1p0YzczNnFjaHBxRnRzL1hwMmtG?=
 =?utf-8?B?NVlnOExSZHRhVjQySGJ5d2QrUGhVWk53alpuSEQrV1E2ZzJjL3lMZnpXTzRR?=
 =?utf-8?B?aUpqcHpzN3pQdExMdUNRTmc5M0llbkFJSHJWQWZKTUw0ejdjVFExL25DVm5N?=
 =?utf-8?B?czNoUzVZNFFZaWNKbUY1VzBISWZBZ0VtenlyN2JxeUpjQlp6TUtqZG4xK0Vj?=
 =?utf-8?B?WVZLZmE4S2xpZlZGWHBuaGdkU2EyK25mVDFSVzV5Y2lScWV0Ull6ZExLYXFy?=
 =?utf-8?B?ZEtxSXhPckFMRXNVTno0ZkdEWGNNblZuTHJKUUNmVWNoYmc3OWYzUEI3RDZV?=
 =?utf-8?B?NGMxSTZ5Y001dU5FSmM5SGJwd3RkUFhDRncxaGRWajhUZWJTRE1QL3hlZThY?=
 =?utf-8?B?d2owNUIxQ2pGWGYxVGxaY2ttdHdTQUU3alBQdjFFZXpJNlJhZktGamc3Qmkz?=
 =?utf-8?B?ZVJoL3hxVUcrSUNvbDNlUU84WVVMYXhwSWdOVkpIKzhYSFoxWWZmZjZJdkVB?=
 =?utf-8?B?TFhoWEsrTEFHQzlKYUQwblpxd1hvYWIwczNJd1k5Skx2dStkVi8rV1RXVDZH?=
 =?utf-8?Q?xwDdv7PbbtWmF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR05MB10385.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aad3b1a-a876-4da3-376b-08df3c1ee321
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 15:59:06.7112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR05MB9457

Zl9taWRpMl9hbGxvYygpIHNoYWxsb3ctY29waWVzIHRoZSBjYXJkLCBlbmRwb2ludCwgYW5kIGJs
b2NrIHN0cmluZwpwb2ludGVycyBmcm9tIGNvbmZpZ2ZzLiAgRHluYW1pYyBlcC4qIGFuZCBibG9j
ay4qIGdyb3VwcyBtYXkgYmUgcmVtb3ZlZAphZnRlciB0aGUgZnVuY3Rpb24gaGFzIGJlZW4gYWxs
b2NhdGVkLiAgVGhlaXIgcmVsZWFzZSBjYWxsYmFja3MgdGhlbiBmcmVlCnN0cmluZ3Mgc3RpbGwg
dXNlZCBieSBsaXZlIFVTQiBzdHJpbmcgZGVzY3JpcHRvcnMgYW5kIFVNUCBkaXNjb3ZlcnkKcmVw
bGllcy4KCkNvcHkgdGhlIG9wdGlvbmFsIHN0cmluZ3Mgd2hpbGUgb3B0cy0+bG9jayBpcyBoZWxk
LCBzbyBjb25maWdmcyByZWxlYXNlCmNhbm5vdCBmcmVlIHRoZSBzb3VyY2Ugc3RyaW5ncyBkdXJp
bmcgdGhlIGNvcHkuICBGcmVlIHRoZSBwcml2YXRlIGNvcGllcwp3aXRoIHRoZSBsaXZlIGZ1bmN0
aW9uIGFuZCBidWlsZCB0aGUgVVNCIHN0cmluZyB0YWJsZSBmcm9tIHRob3NlIGNvcGllcy4KCkZp
eGVzOiAyOWVlN2E0ZGRkZDUgKCJ1c2I6IGdhZGdldDogbWlkaTI6IEFkZCBjb25maWdmcyBzdXBw
b3J0IikKClRlc3RlZDoKICB4ODZfNjQgS0FTQU4gZHVtbXlfaGNkOiB0aGUgYmFzZSBrZXJuZWwg
cmVwb3J0cyB0d28gc2xhYi11c2UtYWZ0ZXItZnJlZQogIGVycm9ycyBhZnRlciByZW1vdmluZyBh
IGR5bmFtaWMgYmxvY2sgYW5kIGVuZHBvaW50OyB0aGUgZml4ZWQga2VybmVsCiAgY29tcGxldGVz
IHRoZSBzYW1lIGRlc2NyaXB0b3IgcmVxdWVzdHMgd2l0aG91dCBhIEtBU0FOIHJlcG9ydC4KICB4
ODZfNjQgYW5kIGFybTY0IE1JREkyIGZ1bmN0aW9uIG9iamVjdCBidWlsZHMgd2l0aCBXPTEuClNp
Z25lZC1vZmYtYnk6IFlpbmdqaWUgV2FuZyA8eC1wcm9mZXNzb3JAb3V0bG9vay5jb20+Ci0tLQog
ZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfbWlkaTIuYyB8IDU3ICsrKysrKysrKysrKysr
KysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfbWlkaTIu
YyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX21pZGkyLmMKaW5kZXggZDY5M2RlNDI3
NjQxLi5jMDJkNmYxMWJlMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi9mX21pZGkyLmMKKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfbWlkaTIuYwpA
QCAtMTcxLDYgKzE3MSwzMSBAQCBzdGF0aWMgY29uc3QgY2hhciAqdW1wX2ZiX25hbWUoY29uc3Qg
c3RydWN0IGZfbWlkaTJfYmxvY2tfaW5mbyAqaW5mbykKIAlyZXR1cm4gaW5mby0+bmFtZSA/IGlu
Zm8tPm5hbWUgOiAiTUlESSAyLjAgR2FkZ2V0IEkvTyI7CiB9CiAKK3N0YXRpYyBpbnQgZl9taWRp
Ml9jb3B5X3N0cmluZyhjb25zdCBjaGFyICoqZHN0LCBjb25zdCBjaGFyICpzcmMpCit7CisJKmRz
dCA9IE5VTEw7CisJaWYgKCFzcmMpCisJCXJldHVybiAwOworCisJKmRzdCA9IGtzdHJkdXAoc3Jj
LCBHRlBfS0VSTkVMKTsKKwlyZXR1cm4gKmRzdCA/IDAgOiAtRU5PTUVNOworfQorCitzdGF0aWMg
dm9pZCBmX21pZGkyX2ZyZWVfc3RyaW5ncyhzdHJ1Y3QgZl9taWRpMiAqbWlkaTIpCit7CisJaW50
IGksIGJsazsKKworCWtmcmVlKG1pZGkyLT5pbmZvLmlmYWNlX25hbWUpOworCWZvciAoaSA9IDA7
IGkgPCBtaWRpMi0+bnVtX2VwczsgaSsrKSB7CisJCXN0cnVjdCBmX21pZGkyX2VwICplcCA9ICZt
aWRpMi0+bWlkaTJfZXBzW2ldOworCisJCWtmcmVlKGVwLT5pbmZvLmVwX25hbWUpOworCQlrZnJl
ZShlcC0+aW5mby5wcm9kdWN0X2lkKTsKKwkJZm9yIChibGsgPSAwOyBibGsgPCBlcC0+bnVtX2Js
a3M7IGJsaysrKQorCQkJa2ZyZWUoZXAtPmJsa3NbYmxrXS5pbmZvLm5hbWUpOworCX0KK30KKwog
LyoKICAqIFVTQiBEZXNjcmlwdG9yIERlZmluaXRpb25zCiAgKi8KQEAgLTI3MDEsNiArMjcyNiw3
IEBAIHN0YXRpYyB2b2lkIGRvX2ZfbWlkaTJfZnJlZShzdHJ1Y3QgZl9taWRpMiAqbWlkaTIsIHN0
cnVjdCBmX21pZGkyX29wdHMgKm9wdHMpCiAJLS1vcHRzLT5yZWZjbnQ7CiAJbXV0ZXhfdW5sb2Nr
KCZvcHRzLT5sb2NrKTsKIAlrZnJlZShtaWRpMi0+c3RyaW5nX2RlZnMpOworCWZfbWlkaTJfZnJl
ZV9zdHJpbmdzKG1pZGkyKTsKIAlrZnJlZShtaWRpMik7CiB9CiAKQEAgLTI4MTEsNyArMjgzNyw3
IEBAIHN0YXRpYyBzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmX21pZGkyX2FsbG9jKHN0cnVjdCB1c2Jf
ZnVuY3Rpb25faW5zdGFuY2UgKmZpKQogCXN0cnVjdCBmX21pZGkyX29wdHMgKm9wdHM7CiAJc3Ry
dWN0IGZfbWlkaTJfZXAgKmVwOwogCXN0cnVjdCBmX21pZGkyX2Jsb2NrICpicDsKLQlpbnQgaSwg
bnVtX2VwcywgYmxrOworCWludCBpLCBudW1fZXBzLCBibGssIHJldDsKIAogCW1pZGkyID0ga3ph
bGxvY19vYmooKm1pZGkyKTsKIAlpZiAoIW1pZGkyKQpAQCAtMjgyNiw3ICsyODUyLDYgQEAgc3Rh
dGljIHN0cnVjdCB1c2JfZnVuY3Rpb24gKmZfbWlkaTJfYWxsb2Moc3RydWN0IHVzYl9mdW5jdGlv
bl9pbnN0YW5jZSAqZmkpCiAJCXJldHVybiBFUlJfUFRSKG51bV9lcHMpOwogCX0KIAkrK29wdHMt
PnJlZmNudDsKLQltdXRleF91bmxvY2soJm9wdHMtPmxvY2spOwogCiAJc3Bpbl9sb2NrX2luaXQo
Jm1pZGkyLT5xdWV1ZV9sb2NrKTsKIApAQCAtMjg0MSwxOSArMjg2NiwzOCBAQCBzdGF0aWMgc3Ry
dWN0IHVzYl9mdW5jdGlvbiAqZl9taWRpMl9hbGxvYyhzdHJ1Y3QgdXNiX2Z1bmN0aW9uX2luc3Rh
bmNlICpmaSkKIAogCW1pZGkyLT5pbmZvID0gb3B0cy0+aW5mbzsKIAltaWRpMi0+bnVtX2VwcyA9
IG51bV9lcHM7CisJcmV0ID0gZl9taWRpMl9jb3B5X3N0cmluZygmbWlkaTItPmluZm8uaWZhY2Vf
bmFtZSwKKwkJCQkgIG9wdHMtPmluZm8uaWZhY2VfbmFtZSk7CisJaWYgKHJldCkKKwkJZ290byBl
cnJfdW5sb2NrOwogCiAJZm9yIChpID0gMDsgaSA8IG51bV9lcHM7IGkrKykgewogCQllcCA9ICZt
aWRpMi0+bWlkaTJfZXBzW2ldOwogCQllcC0+aW5mbyA9IG9wdHMtPmVwc1tpXS0+aW5mbzsKKwkJ
ZXAtPmluZm8uZXBfbmFtZSA9IE5VTEw7CisJCWVwLT5pbmZvLnByb2R1Y3RfaWQgPSBOVUxMOwor
CQlyZXQgPSBmX21pZGkyX2NvcHlfc3RyaW5nKCZlcC0+aW5mby5lcF9uYW1lLAorCQkJCQkgIG9w
dHMtPmVwc1tpXS0+aW5mby5lcF9uYW1lKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyX3VubG9j
azsKKwkJcmV0ID0gZl9taWRpMl9jb3B5X3N0cmluZygmZXAtPmluZm8ucHJvZHVjdF9pZCwKKwkJ
CQkJICBvcHRzLT5lcHNbaV0tPmluZm8ucHJvZHVjdF9pZCk7CisJCWlmIChyZXQpCisJCQlnb3Rv
IGVycl91bmxvY2s7CiAJCWVwLT5jYXJkID0gbWlkaTI7CiAJCWZvciAoYmxrID0gMDsgYmxrIDwg
U05EUlZfVU1QX01BWF9CTE9DS1MgJiYKIAkJCSAgICAgb3B0cy0+ZXBzW2ldLT5ibGtzW2Jsa107
IGJsaysrKSB7CiAJCQlicCA9ICZlcC0+Ymxrc1tibGtdOwogCQkJZXAtPm51bV9ibGtzKys7CiAJ
CQlicC0+aW5mbyA9IG9wdHMtPmVwc1tpXS0+Ymxrc1tibGtdLT5pbmZvOworCQkJcmV0ID0gZl9t
aWRpMl9jb3B5X3N0cmluZygmYnAtPmluZm8ubmFtZSwKKwkJCQkJCSAgb3B0cy0+ZXBzW2ldLT5i
bGtzW2Jsa10tPmluZm8ubmFtZSk7CisJCQlpZiAocmV0KQorCQkJCWdvdG8gZXJyX3VubG9jazsK
IAkJCWJwLT5ndGJfaWQgPSArK21pZGkyLT50b3RhbF9ibG9ja3M7CiAJCX0KIAl9CisJbXV0ZXhf
dW5sb2NrKCZvcHRzLT5sb2NrKTsKIAogCW1pZGkyLT5zdHJpbmdfZGVmcyA9IGt6YWxsb2Nfb2Jq
cygqbWlkaTItPnN0cmluZ19kZWZzLAogCQkJCQkgIG1pZGkyLT50b3RhbF9ibG9ja3MgKyAxKTsK
QEAgLTI4NjIsOCArMjkwNiw4IEBAIHN0YXRpYyBzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmX21pZGky
X2FsbG9jKHN0cnVjdCB1c2JfZnVuY3Rpb25faW5zdGFuY2UgKmZpKQogCQlyZXR1cm4gRVJSX1BU
UigtRU5PTUVNKTsKIAl9CiAKLQlpZiAob3B0cy0+aW5mby5pZmFjZV9uYW1lICYmICpvcHRzLT5p
bmZvLmlmYWNlX25hbWUpCi0JCW1pZGkyLT5zdHJpbmdfZGVmc1tTVFJfSUZBQ0VdLnMgPSBvcHRz
LT5pbmZvLmlmYWNlX25hbWU7CisJaWYgKG1pZGkyLT5pbmZvLmlmYWNlX25hbWUgJiYgKm1pZGky
LT5pbmZvLmlmYWNlX25hbWUpCisJCW1pZGkyLT5zdHJpbmdfZGVmc1tTVFJfSUZBQ0VdLnMgPSBt
aWRpMi0+aW5mby5pZmFjZV9uYW1lOwogCWVsc2UKIAkJbWlkaTItPnN0cmluZ19kZWZzW1NUUl9J
RkFDRV0ucyA9IHVtcF9lcF9uYW1lKCZtaWRpMi0+bWlkaTJfZXBzWzBdKTsKIApAQCAtMjg4NSw2
ICsyOTI5LDExIEBAIHN0YXRpYyBzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmX21pZGkyX2FsbG9jKHN0
cnVjdCB1c2JfZnVuY3Rpb25faW5zdGFuY2UgKmZpKQogCX0KIAogCXJldHVybiAmbWlkaTItPmZ1
bmM7CisKK2Vycl91bmxvY2s6CisJbXV0ZXhfdW5sb2NrKCZvcHRzLT5sb2NrKTsKKwlkb19mX21p
ZGkyX2ZyZWUobWlkaTIsIG9wdHMpOworCXJldHVybiBFUlJfUFRSKHJldCk7CiB9CiAKIERFQ0xB
UkVfVVNCX0ZVTkNUSU9OX0lOSVQobWlkaTIsIGZfbWlkaTJfYWxsb2NfaW5zdCwgZl9taWRpMl9h
bGxvYyk7CgpiYXNlLWNvbW1pdDogMzE0OWU4YjMyMzdmNThkNGRkNDQwZmM2NGM0NWM5MzQwNGM0
YjA2NAotLSAKMi40My4wCgo=
