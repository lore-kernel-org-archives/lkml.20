Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012037.outbound.protection.outlook.com [52.101.126.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A8393DEB;
	Mon, 14 Sep 2026 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369466; cv=fail; b=prnol0gCQZpcwVPF3wznAuCRc77+OaMy5jzWS1oqlBH73LE4G/weGKbRqGZ/OSTQNPcse7oi0HGPhPZGRlhzmntXq0niywtPZQ4W4UP7IgEr7jn69Ngjd2M44VeEnB18GEpZ0VErrEzbnMwJyRRnTHfPeSNJdcM/iwZWyJaK54E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369466; c=relaxed/simple;
	bh=sNQ3IMMJnWy9DigNlG/bWyva3ewNU2SKFV6qtt9voqw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tCOIUYlsPLUEKD+roP62CfKB8bwV4aqMbGIZ3w3BDpiyeIJABqU7FSI7SGalvRhQVwtfd8fBRFkovJcQLrn4vtoqX++dRktaESnupZy9+fOMQcUGzIrzr0fF3QHQljXeq0/x6JGP1RQiqjwctv3gfem0wc1KkP+wkVKs5atM6FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=arhUl2a4; arc=fail smtp.client-ip=52.101.126.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="arhUl2a4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8INAD0U+j2xvnLdZSb89M0pxg80+kUeKnMjPAWDVdzfvp8lWUB34PZKBP8HZjfcXcCcMaXdQjrWFVxxlodrqxuJ3WFESdQlHI0S/dw4M1GdjDD++nKnDy3jWzxqdQPlz7Cy5qFKQ2UuVjuEulB5XeqRUtKgsl4m/Rcxv4n6xo/kXq07Oj7HGIULqSysjT3lP51061asXMcWgMWyf3OuAWB2i49AqeX+rPIbiLpxXLeGqQYhVKWL5EP0iCxN+z+XhaySGH1+DiXC76oQ7QxEaX04KEHHT2rVbwZZfiu8aPCZFPZ6qHvZFNkbifJSX4kH4of1t5IicEuFeCm3J11S5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNQ3IMMJnWy9DigNlG/bWyva3ewNU2SKFV6qtt9voqw=;
 b=m1QlYpsMNRFk+4uSH27Pyg/djfk4SjWl4oKvHTatDH3cnEpf4dp4s+sbx7iaqgeeGWU8wLFbT6UOetvAML3jjalYvPcfJ/b36uHXqEfX/SPdpnOuEVjWcvXrjSWeGLmJtI4H+sHB7/hTpt5arBp5hs9kn5nkuyutgUBoSj3NTGtKJVjmoCDXRfON9AKmWYSjevepa+VkuISBAIVROnq0QOUyTbRKO7urfLVV+LXHWabBzhU463MrV9AbHZHVk4J80QXC7yGOd/Mor1lIuPmXfZGRHvI/ofVHC4cYCdcoFDnG1XgYr1tmZxdWR5Fiz4sNeckmDrnoJFDHPSWn75oieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNQ3IMMJnWy9DigNlG/bWyva3ewNU2SKFV6qtt9voqw=;
 b=arhUl2a4yyIiagAxJujqqcOaCv65aQ7tcTO7kEmv8mo2WuctiieY+ohGpF/Rrz0OE+tcS8zO5cSS8qAkQWIgebudR7iLp7KH2vPKymkYDSubuRyBmDaLlQtMhav4+lI4cl1qFGr5IQE9LSMVC4dt0i/i/E7BOXgRZQ4aB7QE16IblKVFRTMg9qDMJCnGB1DN7EagykOQkOrdcHnR3l5wBHY0k7NZcrjmRbGvneOUkDONnLbmWhRbPvdbrkWmyvbkSNv/Uk7vpYaXHDvAcIh5OPj0+e24Z6YmYvr1L+FTkn1XhwCv07NfHmL8SCpu2t3t9NKjNL4okGmBGfMukXrXvA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB6763.apcprd06.prod.outlook.com (2603:1096:101:180::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:04:18 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 07:04:18 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>, Mathias Nyman
	<mathias.nyman@linux.intel.com>
CC: Selvarasu Ganesan <selvarasu.g@samsung.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "thiagu.r@samsung.com"
	<thiagu.r@samsung.com>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIXSB4aGNpOiBzaWRlYmFuZDogY2hlY2sgdmRldiBsaXZl?=
 =?gb2312?Q?ness_before_removing_endpoints_on_unregister?=
Thread-Topic: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Thread-Index: AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxA
Date: Mon, 14 Sep 2026 07:04:17 +0000
Message-ID:
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
In-Reply-To: <20260912141837.06b2f3cf.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB6763:EE_
x-ms-office365-filtering-correlation-id: a4e0d207-8eb4-42e2-f884-08df122e64e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|42112799006|6133799003|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 AvBPnH2E0ogOzio8AymPcL52zuBOH444WNtdb1H26UiSI5r/mA55hYEomIEFKJKPxOEqcDKY82qUFKy2nR+82YhItHwlTpOiAe/aD/nMTtxB1lhddXGw8o/OVjfbRXxypX3s6Ct3tXoqaNEx7fg98a1iwSTguz7Di7ttQ+fc3ILdbSLrl3wIXo69Jqa8VdXJ36FSK4h0oYBCHj65tdAGkeiAQn4/wm9ln3CspeinHFJicGsKqGvOJwCI4YOozG129Y+fcB6PTdM1eTveviT1+khwh181NYJrwKeLrhjH6Bj3afDTH2D3ptFFrcRnorQb0LrXcG/3t8H+F6MHLmm94wqztt2hNrNfDttaXVbmRKK5NdyseZ5UCfphl9fC8RCf1LI68QJAEyOC3SVBxgXIGzWVdxQ5ChI7D0x/eZ5kF6VEXQhXjOr37hrsY999Tqc3vJCD0T2MezSM4qGGC8Np+M+ngtTC21Lx90vQ+DMVpr7TgC1j/0BOT2ELpdnuRT3Rl6pnIaP25gRAFjXiq4LYZqb7jAtw8oD+KaroGIJuykM29mqu5HnUesT8FJr2YuzV+O6fYaeSGwkJHFQ56OiTlEckmFVZ8WL98fomPlY1I/FIJEM/jBfTQC2idIn3bu5T0lL4Cchps03wAPdyhFmaAz2gcNp4pEdoflWD+AsWgDvKXMNpHMlFUbUkZrvvw9YD00BprhqPgb+UGvUGmrHSi+h7gJf7ZsRFuvdx69h6eW8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(42112799006)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?elZFRGgyM1lyUUcwdzlESzVRNlYyamNhZlRBWW9RRW40ODF6YldNWlpqb0E3?=
 =?gb2312?B?b3VlQnBUOGZ5aEV2UU9tLzVVVy83MWhuMDErNUlpbFRyZ3M2OWhKY2NRNFBT?=
 =?gb2312?B?UFRpWmpwdW5iemNQUUt3S0Izd2NTaGhQQTNOSXg1cEs4QVhEV2NuUFoxMkQv?=
 =?gb2312?B?U3FYajhpOFZMUjFMOVR4YXZSWE1WbGxvZHlSbkozZFJsUXU3NFpTUmZ6MENi?=
 =?gb2312?B?WUlpZHJXaE5XTVRGQlp0eTdXaWRpR1J3aDFWcU9FTi9iTjZLejBka2hSTUpL?=
 =?gb2312?B?THk3NG5tcU9sTUdxL1FsUmM1REVIdVVwTVova1Y4RENsY2RsT1I4bDB2ZnFw?=
 =?gb2312?B?N0pwYUhDbnRxQlNzTkxBL3UrSm5IbEVnTjlzYVBpMmhrNTI5ZFZoaERvTzdk?=
 =?gb2312?B?ZFdGLzlQaHVqUit4R1pKRFQrM2duMHBKeE83OUpLc3ZPZFpJMktkd0ljN25a?=
 =?gb2312?B?dEV5RG9MT3d4SFZWS2ZhZExwMFFuZE1jSk1OcjI1dTY1S3VpY2VhVjNacFFZ?=
 =?gb2312?B?TzBzcXJhY202TWYwWmZFMzNhdHBaaUdnU0daWldEUURsQWJKWG45N0FtUFhT?=
 =?gb2312?B?WWp1QUJZVlhvcjhoOXNuL3dvaVhQMHFralU5YkZGU2R5QmxjQ0ZLNmNxRDBO?=
 =?gb2312?B?eUFLUDAvL2ljNmJUcmpaSkt5Nkg5YlREUEVnVzhKb0JaOG5zVHZBNkl0UXB0?=
 =?gb2312?B?TlhNdkhHWUcyWUc0Ulp6SVpFaVpZV0JpTUJvaCtZYWhnbnFTeUxwazY3eDF3?=
 =?gb2312?B?VGU4UVFpaWVwRnJRLzFMWis3bWRVVGFlZHJrOHF3OTFVR2xoMjZKRlg3TEo2?=
 =?gb2312?B?ZlArSnhZZ1pLVmtvM09jVW43VFUvVFNXSjM3NE1rZDdOZWJTWlpNUXBmbnRV?=
 =?gb2312?B?N0pVN0lLTVVTK3dqcGNDL2hEdklBeVhncG8zOGhJMXRwSDRUTjJYUzJ6aVA2?=
 =?gb2312?B?a1JjQjV6cDFmWlBMUHp5NFF6TXkrTUdmMCtKc05VZElUSjBIMnVwU0tFQzN1?=
 =?gb2312?B?dFFXUVVkaytBQkJkYytvVTA5THUvSy9lQSs2dHRjRmNvemJSVkZmeEc2bzZD?=
 =?gb2312?B?MHoxWC9kMEJDeGoxTE5QandIQ000UjYyNzcxdEtMZVM3bDZKbHpLamhjcmc5?=
 =?gb2312?B?Z3F2WjhSWTd6QTZ4dWdsdTE3RkE1TWt0QnBpUGFGMFFvNit5TXhFK0Z2clNN?=
 =?gb2312?B?dHNxeDlWZkMwTDBGWjd4N3NINC9wTHk2RUhxZ29NNStKL3czTXR2MTJ6WGlG?=
 =?gb2312?B?WUVqWGRRNDF6WDY1N2JkNllCaUdOVUJ4Y1A5M1dKSGY3WjNjeHc1L1Nrb0RU?=
 =?gb2312?B?aS9JZ0EvWHRvNFQ3bHBQa2V3Y0VUelIxMkJCaGZPckI5UE81S3VVZ09BVE1I?=
 =?gb2312?B?eWM0RmNmZzdQZU81RmNjaDNHVmZPNDZlaFFUaTUwa3RoYmpDa2lZUkxqQWds?=
 =?gb2312?B?bTNFZm50dW9RZ1VKNGJFTGs3UXpyRnVnYWwyZEkreUxmUU1wQXpnVGY5YURp?=
 =?gb2312?B?TUxzQzlEazhRKzUzaERnSFEzSUpQYmdjZmRhSm42ZWRtUzhacE5wWkIzc0RR?=
 =?gb2312?B?U2VqSkx1bTJFOXFhVkNuZkt0Y0tWdlBxVnN3WldId2pzRXJ0MDliaENjbmsw?=
 =?gb2312?B?YSs0NjgyZmJER0x2Z2RSbkNJc1hvWmtTeGc0RC9FcElsR2taMjkxQThRZmxj?=
 =?gb2312?B?Z3hwQUJvejZsaHpQZHVNRTRnYWZ1N1g1aUR5SGdHaXRaTGxSWThmOTVPUWV5?=
 =?gb2312?B?UFhxblhYVmt4dGhmVm5CYmV4UVUvNmptdUoxR1ZHckR5TVpEbFBBa2ZBL1M2?=
 =?gb2312?B?QkNaTHF4amFMUUcwK3hjZkt4dVdoZUh5T1FUMmdUb0lZMEcxNi9oY2pDKytX?=
 =?gb2312?B?L3pJVm1TSXRML0lRcUM4SHgrRTk0SXdqVVVSS25ocEdBbmZvQVl4OUJ6MUJW?=
 =?gb2312?B?TEtjVisyemtXMEVvcTJwTlQxTnNMeGIraUI3SXlNNmphUVNXRjExNGVYMld0?=
 =?gb2312?B?THVheEFvV25WMUllZDBOU2krenlKYUR1S3c0TUpha3psUFdCMEExRUR1Z0hw?=
 =?gb2312?B?a3E5c1NhNHpSV0U4RW9oRCtGQm44UnBBZHFxS0p3ZExYVkVPNEtKUUc0Q0px?=
 =?gb2312?B?QzhHdXgxeVVmODRBWlBLbExZTHdMcklmWWh4VEphSDM0M3E0T2twc0tReXow?=
 =?gb2312?B?dDA1V2xwbkhhRS9sMC9ZTHlIS1I2QnpwczY5WUVGcXppdFlGdUJOVzQxT292?=
 =?gb2312?Q?g1jAgkwxXZXOqAI4lOaM/1ADkUts9Jq2Lw6s5d5H1c=3D?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e0d207-8eb4-42e2-f884-08df122e64e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 07:04:18.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TddPi6pqcs2ydYkPDnfW3XFqWqIRPretJxO3WAN8hONT8d0WdZmSUbrAEL8vy5zUmisJnq9YHKb6sbU3Ml6F5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6763

SGkgTWljaGFsLA0KDQo+IE9uIEZyaSwgMTEgU2VwIDIwMjYgMTY6MTA6MDQgKzAzMDAsIE1hdGhp
YXMgTnltYW4gd3JvdGU6DQo+ID4gR29vZCBwb2ludCwgZW5kcG9pbnQgdXNlIGFmdGVyIGZyZWUg
aXMgYSBtdWNoIGJpZ2dlciBhbmQgZWFybGllcg0KPiA+IGlzc3VlIGhlcmUuDQo+ID4NCj4gPiBU
aGUgZW5kcG9pbnQgcmluZ3MgdGhhdCBhdWRpbyBkcml2ZXIgaXMgYWNjZXNzaW5nIHZpYSBzaWRl
YmFuZCBhcmUNCj4gPiBmcmVlZCBhbmQgcmVhbGxvY2F0ZWQgbXVjaCBlYXJsaWVyLiBBdWRpbyBk
cml2ZXIgaXMgdW5hd2FyZSBvZiB0aGlzDQo+ID4gcmVzZXQsIGFuZCBtYXkgc3RpbGwgdHJ5IHRv
IGFjY2VzcyB0aGUgZnJlZWQgcmluZyBidWZmZXJzLg0KPiA+IFRoaXMgaXMgYW4gaXNzdWUgbG9u
ZyBiZWZvcmUgeGhjaV9zaWRlYmFuZF91bnJlZ2lzdGVyKCkgaXMgY2FsbGVkLg0KPiA+DQo+ID4g
dXNiX3Jlc2V0X2FuZF92ZXJpZnlfZGV2aWNlKCkNCj4gPiAgICBodWJfcG9ydF9pbml0KCkgIC8v
IHJlc2V0cyBwb3J0DQo+ID4gICAgdXNiX2hjZF9hbGxvY19iYW5kd2lkdGgodWRldiwgdWRldi0+
YWN0Y29uZmlnLCBOVUxMLCBOVUxMKTsNCj4gPiAgICAgIGhjZC0+ZHJpdmVyLT5kcm9wX2VuZHBv
aW50KCkgIC8vIGZvciBhbGwgZW5kcG9pbnRzLCB4aGNpIHRhZ3MgZXAgdG8gYmUgZHJvcHBlZA0K
PiA+ICAgICAgaGNkLT5kcml2ZXItPmFkZF9lbmRwb2ludCgpICAgLy8gZm9yIGFjdGl2ZSBlbmRw
b2ludHMuIHhoY2kgYWxsb2NzIG5ldyByaW5nIGZvciBlcA0KPiA+ICAgICAgaGNkLT5kcml2ZXIt
PmNoZWNrX2JhbmR3aWR0aChoY2QsIHVkZXYpIC8vIHhoY2kgZnJlZXMgb2xkIHJpbmcgYW5kIHRh
a2VzIG5ldyByaW5nIGludG8gdXNlDQo+ID4NCj4gPiBTbyB0dXJucyBvdXQgc2V0dGluZyB2ZGV2
LT5zaWRlYmFuZC0+dmRldiB0byBOVUxMIGluDQo+ID4geGhjaV9mcmVlX3ZpcnRfZGV2KCksIGFu
ZCByZWFjdGluZyB0byBpdCBpbg0KPiA+IHhoY2lfc2lkZWJhbmRfdW5yZWdpc3RlcigpIGlzIHRv
byBsaXR0bGUgdG9vIGxhdGUuDQo+IA0KPiBUbyBiZSBleGFjdCwgc3VjaCByZXNldCBvZiBjdXJy
ZW50IGNvbmZpZ3VyYXRpb24gb25seSBoYXBwZW5zIGFmdGVyDQo+IHN1Y2Nlc3NmdWwgaHViX3Bv
cnRfaW5pdCgpLCB3aGljaCByZXF1aXJlcyBzdWNjZXNzZnVsIGh1Yl9wb3J0X3Jlc2V0KCksDQo+
IHdoaWNoIGF0IGxlYXN0IGF0dGVtcHRzIHRvIGNhbGwgaGNkLT5kcml2ZXItPnJlc2V0X2Rldmlj
ZSgpLCB3aGljaCBpcw0KPiB4aGNpX2Rpc2NvdmVyX29yX3Jlc2V0X2RldmljZSgpLg0KPiANCj4g
VGhpcyBhbHJlYWR5IGRlYWxsb2NhdGVzIHRyYW5zZmVyIHJpbmdzIGFuZCBpbmNsdWRlcyBhIGNh
bGxiYWNrIHRvDQo+IHNpZGViYW5kIGNsaWVudCB0byBzeW5jaHJvbml6ZS4gQ3VycmVudCBpbXBs
ZW1lbnRhdGlvbiBpbiBRQyBzZWVtcyB0bw0KPiBjb21tYW5kIHRoZSBIVyB0byBzdG9wIHVzaW5n
IGFmZmVjdGVkIGVuZHBvaW50KHMpLCBzbyB0aGUgbW9zdCBvYnZpb3VzDQo+IGFuZCBibGF0YW50
IGtpbmQgb2YgVUFGIGlzIG1lYW50IG5vdCB0byBoYXBwZW4uDQo+IA0KPiBNYXliZSB0aGlzIGNv
dWxkIGJlIGV4dGVuZGVkIHRvIHVucmVnaXN0ZXIgdGhlIHNpZGViYW5kIHJpZ2h0IHRoZXJlLA0K
PiBidXQgbm90IHN1cmUgd2hhdCBoYXBwZW5zIGlmIGh1Yl9wb3J0X2luaXQoKSBmYWlscyB3aXRo
b3V0IHVzIGtub3dpbmcuDQo+IA0KPiA+IEkgdGhpbmsgd2VlIG5lZWQgdG8gbG9vayBhdCB1c2lu
ZyBkcnYtPnByZV9yZXNldCBhbmQgZHJ2LT5wb3N0X3Jlc2V0DQo+ID4gdG8gdW5yZWdpc3RlciBh
bmQgcmUtcmVnaXN0ZXIgc2lkZWJhbmQsIG9yIG9wdGlvbmFsbHkgdG8gdW5iaW5kIGFuZA0KPiA+
IHJlYmluZCB0aGUgd2hvbGUgaW50ZXJmYWNlLg0KPiANCj4gVGhhdCdzIGFub3RoZXIgb3Bwb3J0
dW5pdHkgdG8gZ2V0IHJpZCBvZiBzaWRlYmFuZCB1c2Vycy4NCj4gDQo+IEl0IGRvZXNuJ3QgY292
ZXIgdXNiX3Jlc2V0X2FuZF92ZXJpZnlfZGV2aWNlKCkgY2FsbGVkIGluIHJlc2V0LXJlc3VtZSwN
Cj4gYnV0IGNsaWVudHMgc2hvdWxkIHVzYl9vZmZsb2FkX2dldCgpIHRvIHByZXZlbnQgc3VzcGVu
ZC4NCj4gDQo+IEl0IGRvZXNuJ3QgY292ZXIgaHViX3BvcnRfcmVzZXQoKSBjYWxsZWQgYnkgcG9y
dF9ldmVudCgpIGZvciBTdXBlclNwZWVkDQo+IGRldmljZXMsIG5vdCBzdXJlIHdoYXQgdGhhdCBp
cyBhbmQgd2hldGhlciBpdCdzIGRhbmdlcm91cy4gSSBub3RlZCB0aGF0DQo+IHRoZSBvcmlnaW5h
bCBwYXRjaCB0YWxrcyBhYm91dCBodWJfZXZlbnQoKSwgYnV0IG1heWJlIGl0J3MgYSBtaXN0YWtl
Pw0KPiANCg0KVGhhbmtzIGZvciB0aGUgYW5hbHlzaXMuIEEgY2xhcmlmaWNhdGlvbiBvbiB0aGUg
aHViX2V2ZW50KCkgcmVmZXJlbmNlDQppbiBteSBwYXRjaDoNCg0KVGhlIGNyYXNoIHRyYWNlIHNo
b3dzIGh1Yl9ldmVudCgpIGF0IHRoZSB0b3AgYmVjYXVzZSB0aGF0J3MgdGhlIGFjdHVhbA0KY3Jh
c2ggY2FsbCBzdGFjayBmcm9tIHRoZSBmYWlsaW5nIGRldmljZS4gVGhlIGZ1bGwgc2VxdWVuY2Ug
aXM6DQoNCiAgaHViX2V2ZW50KCkNCiAgICAtPiBwb3J0X2V2ZW50KCkgICAgICAgICAgICAgICAg
ICAgICAgICAgICBbaHViLmM6NTk2Nl0NCiAgICAgICAtPiB1c2JfcmVzZXRfZGV2aWNlKHVkZXYp
ICAgICAgICAgICAgICBbaHViLmM6NTg3NV0NCiAgICAgICAgICAtPiB1c2JfcmVzZXRfYW5kX3Zl
cmlmeV9kZXZpY2UoKSAgICBbaHViLmM6NjE4M10NCiAgICAgICAgICAgICAtPiBodWJfcG9ydF9p
bml0KCkgICAgICAgICAgICAgICBbaHViLmM6NjIyOF0NCiAgICAgICAgICAgICAgICAtPiBoY2Qt
PmRyaXZlci0+YWRkcmVzc19kZXZpY2UoKSAgW2h1Yi5jOjQ3ODFdDQogICAgICAgICAgICAgICAg
ICAgLT4geGhjaV9zZXR1cF9kZXZpY2UoKSAgICAgPC0tIENPTVBfVVNCX1RSQU5TQUNUSU9OX0VS
Uk9SDQogICAgICAgICAgICAgICAgICAgICAgLT4geGhjaV9kaXNhYmxlX2FuZF9mcmVlX3Nsb3Qo
KSAgW3hoY2kuYzo0NDM4XQ0KICAgICAgICAgICAgICAgICAgICAgICAgIC0+IHhoY2lfZnJlZV92
aXJ0X2RldmljZSgpICAgPC0tIGZyZWVzIHZkZXYgaGVyZQ0KDQpUaGlzIGlzIHRoZSAiZG8gd2Fy
bSByZXNldCwgZnVsbCBkZXZpY2UiIGJyYW5jaCBpbiBwb3J0X2V2ZW50KCkNCihodWIuYzo1ODc1
KSwgd2hpY2ggY2FsbHMgdXNiX3Jlc2V0X2RldmljZSgpIKGqIGRpZmZlcmVudCBmcm9tIHRoZQ0K
aHViX3BvcnRfcmVzZXQoaHViLCBwb3J0MSwgTlVMTCwgLi4uKSBjYWxsIGF0IGh1Yi5jOjU4NjUg
d2hpY2ggaGFuZGxlcw0KdGhlIHBvcnQtb25seSB3YXJtIHJlc2V0IGNhc2UgKG5vIHVkZXYpLg0K
DQpTbyBodWJfZXZlbnQoKSBpbiB0aGUgdHJhY2UgaXMgY29ycmVjdCChqiBpdCdzIHRoZSB3b3Jr
cXVldWUgZW50cnkgcG9pbnQNCnRoYXQgZGlzcGF0Y2hlcyB0byBwb3J0X2V2ZW50KCkuDQoNClJl
Z2FyZGluZyB5b3VyIHBvaW50IGFib3V0IHhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCkg
YWxyZWFkeQ0KZGVhbGxvY2F0aW5nIHJpbmdzIHdpdGggYSBzaWRlYmFuZCBjYWxsYmFjayChqiB0
byBjbGFyaWZ5LCB0aGF0J3MgdGhlDQpoY2QtPmRyaXZlci0+cmVzZXRfZGV2aWNlKCkgcGF0aCBj
YWxsZWQgZnJvbSBodWJfcG9ydF9yZXNldCgpIGF0DQpodWIuYzozMTg4LiBNeSBjcmFzaCBwYXRo
IGdvZXMgdGhyb3VnaCB4aGNpX3NldHVwX2RldmljZSgpIGluc3RlYWQsDQp3aGljaCBpcyBjYWxs
ZWQgZnJvbSBodWJfcG9ydF9pbml0KCkgdmlhIGhjZC0+ZHJpdmVyLT5hZGRyZXNzX2RldmljZSgp
DQphbmQgZG9lc24ndCBnbyB0aHJvdWdoIHhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCku
IFNvIHRoZSBzaWRlYmFuZA0KY2FsbGJhY2sgeW91IG1lbnRpb25lZCB3b3VsZG4ndCBhcHBseSB0
byB0aGlzIHBhcnRpY3VsYXIgcGF0aC4NCg0KTGlhbnFpbg0KVGhhbmtzDQo=
