Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794594388;
	b=RlDRYtRcJAux5PGS4LPms6D5XL9x6GupE7rKWCohAzUde2MHNkC4GAr6jjPvwBEwofkO
	 612A0z2CiYpAIgregH43Pgox0G1G12LO/vXv9GZDapS8EQoxATmiv6PbpWWSpQlGL1+aK
	 2VUwinZHwjex3N8r92ua2bxS4ovr2mqk7oAqug0RYJBUBgyI+0sxSAraHi7S5EWj6ExXc
	 qFfpdLo3CuLEzf9LA91j9iSYDHPwVVuSSjtUH5Hw14WeLVBpc7bM1Z/gfDqNYq12AypJ0
	 RyL3uyHb1zj/EsdgFAn0Tcb6Y+k3123leQjTMGvqQcY5L9amlPfmwGzReOt4EK/p7lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594388;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tUXB39mBlkPdMAUlhd0YDproZrnf/hsh9QBHTasvNHI=;
	b=muqTpT73tcRonvtO0WgrJG2fi/5fddns6jNgR2uKEla8g46hxb3dIWaa48vhEzruq30Y
	 M1tiEmZmfUGiTnY06pt0vk4HeOz6AIYVvRiwMCFtIB+52oibp8TFfmo8UPOv0BErRM9tI
	 8NjnchFucl9JEKriqLV9RLAAsPny2Xt3robNkzQqX+KF17DsFB/CbqQVkCUREigErueCt
	 mRkExk7nt+5iqNzSB4rY+jNnDiLSNUjKAppClnW0AWKOQ9roGdsNAF0Md7AxFvcFwVlIE
	 s/I99AaAc8Ru+4+QakLl3YnGStGyuYyHFmyH8mJ/Vxz5LmqLbo5Qd/NWQRxfkZhdqVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jKH31ZjT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.34
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76705606A8A7;
	Fri, 13 Nov 2026 18:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76705606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jKH31ZjT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GR2gNjQXoDWyn1KQA8+KG/iDrJWn7D0hAVmth4YdFrgD5RRB0e5tgZDVTS8MlFQnzb6lCmNGTdtg8gryQfVFzUI3IGXhKpJGJZbTrvsJHAxUzaJwSrZj54hjd5RT+QOpu7pLJh2UafIRGeP8aaI7lw2H+uGXjYGzU4fMWLfYA+wThYrAz6+X974poLVjQy7LGws+AWfAq/zRk0qHVKtbMVe+VWu4LOjIQxAAX4ByR4NP7/HDvJyeOJS+oVX3P4miDdwvEcSHcZq3f9ZvnP0kVHI+9HJw5qyNG54U+f6l0Q3k3+Gg94MTbXpSyIOX09MGqJrmplWwudCKS36kMt8B6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUXB39mBlkPdMAUlhd0YDproZrnf/hsh9QBHTasvNHI=;
 b=EGpTz0xBpBvFScD4Bp3BKltEbA8Oiy1h9DxCFydwSvuLtSoMnC6pvVSJObZGEg9LA3bcNm42k+wp94sd4UTuxHtSHPucJ0rXYsix6XkmtQBo54dDwMvwBdc0y12kre1cmUSReFZV05UE9gmDDV6FBe6RNafLVEUzlaWPoHv++KWLP9kDvrWeB7cAZFyKZJkvur3bOgSm19Cl4VRItvZgYCQqo2aKwHj47D0h+xKR9TmYwoCmO4Ryz7e6UiAnI3XsSaWmHjpn+gUZ9G8TmNJX2GlUr7oeskrKJ228nF4HTEip7UXgmR7Sp4+Vh3+9q/tR+xTNfdPbF7z/8QV8Q3daxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUXB39mBlkPdMAUlhd0YDproZrnf/hsh9QBHTasvNHI=;
 b=jKH31ZjTevTkkeid0QU+iYXyyYcLT018qGRDC+xVtO7+LPVT0xOGarNVRfT9biMr/Nb6ZquJqJ31hpz+ntsfMXL8e7iQUU5pbZkYDD++FgxOIgc0OzSLuT6UlFd5KGRD45A+H+gcYNh6m/+1KgP3Fan7kIGktdrbZy0ZiMOOs68=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TY3PR01MB11611.jpnprd01.prod.outlook.com (2603:1096:400:3dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 18:26:24 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 18:26:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v8 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 USB2.0 support
Thread-Topic: [PATCH v8 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 USB2.0 support
Thread-Index: AQHdbG9QJKu58Qx8MU6nYWwhICH5Z7csXrVA
Date: Fri, 13 Nov 2026 18:26:23 +0000
Message-ID:
 <TYYPR01MB6603B6EDBB8B91D54F6DD38E867F2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
 <20261104-usb_rzg3l-v8-4-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-4-ab109c4bd108@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TY3PR01MB11611:EE_
x-ms-office365-filtering-correlation-id: 7efb10a7-cad5-4c36-2668-08df41b39f4c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|4143699003|56012099006|261102123227099003|261022075727099003|261021121427099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 hx1ZA0tEiT0AdxOdgdbIA420RL8Gc5JV6GiW7oQ14dri8D7TmIhswgyPwpY3WTshZwPROI8DCHYiyAD9Q5C17oXKxKA+vhQEg4nSv2Ku1UuCZDAqbEENJaers34lJDULsK9cObDgsYUj1vnCGG35DJqvDkOgJVNAeFjuQLiglO41pzA9V5j61FwO/XEZI/TQ5jSfJElm+0+UUnH2jS/R5f3LkQ5n3qRQile4WQ7UYpQjqjVxx/9sa/dW5tKRo+K3euermkj86XqEuVyI8hp1qn8yaCLlc9+5d/BTlfD3SViq9TDQsEhRqU/a/16CJ747QUe0GmvNx+qGQ7hLJ96fpdDeHzK5epJYgaT8Tcaw97mpu9QtaF3qbN2KCRIt5CqKmb/xc7pbYiEwoyZGWxTBgjh9dEw3ZoJe7wUbuF15of7lOyPMH+FUCSyA5aioUOm7YhE9dwyEyviGswp4pl0sXmV5MRHww0HOvJHMn1Ij/0szNYUsSVLf/w2ssTIUewPn50kKK7n1u3ok/9Eyf2My/sNsjbHg3gBoKfeWSlvaBVLI/eDbtLkKrpX1aBZsgFk78PpBtef2ZqfWoaQXR3yNVXvRUQDYo1j+yFPZrVEldQbNa4ayQJzarnVZo0l/hkBYrIBZzvmXdeD0amCinjzOXnPIge7f624uGELzDKseX2y2iZ3+syUTiJtL4L8t+p3Q1tzdP73wTX9DJwTHj5R0zj70ohz8wOPk9rcdkCdAWeE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(4143699003)(56012099006)(261102123227099003)(261022075727099003)(261021121427099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTNDVDQrR2VNWWpaYjgwNVh0cTVaeURmWFVYUGhzVFNNWkpGNHZlQitVcVp2?=
 =?utf-8?B?a0g3dzBlSHp6Rng5VFFsVWVvd3V5SlRtU3F1TlJUYmNDVk5zYjRZcGJVcmc4?=
 =?utf-8?B?TmVkUVl3MStCa2hpQlk5M3FYZnJPQ2gxdzhFanRhTUFPcGZxN00xbDJpc0Uw?=
 =?utf-8?B?UlUzaUJXZW4rMlRmZmUxYUNBZmNuMjUzVytzSjVIZXdRWk1ldFVRN01NWkNx?=
 =?utf-8?B?cU14RzNuUE50Nk1SWHZjNWFlSE9kbHk5OTFHVkRtMmV6aU1tTWlqRVlhdys1?=
 =?utf-8?B?aEdVRDFId1llQWRtTjRmY2tBT3NzSklWTG9XaG1hbEUxdGdBT0RPUWtJWTJr?=
 =?utf-8?B?OXBUVG92VEJFNkx6a0lKaU9GTmtmK2xGNmRjZ0lIYTBHVlo2Tm55a3FMc1hr?=
 =?utf-8?B?WFI0eDJvdjcvUEhQQndURVAvL1ozRkN6S2p6dmNzNVBUcTJkb1FkaXdFUjhT?=
 =?utf-8?B?WTFua0xYOFZzQWZYZ3pOMkhMYVlFVENtOG1aTkZRVGZwNnFudnJ6NWRRdlcv?=
 =?utf-8?B?OGVoM01OYXN1eXVkQTk3cmdoNmpHUlhFNEc2WHIxb25mT2lUR0RHM1VMamwv?=
 =?utf-8?B?T1NnbWlRd3BUcEhZNWVXYWIxUTl5MUxaeDJqZWRNWGkzQ1FWWktSQlZQRnhQ?=
 =?utf-8?B?dGRPZkhJR0l2bGNNNFJYMFRLWU83VEtRdHpxbGg3aWtlNFF6Z3FUWFpQQ0Yz?=
 =?utf-8?B?cER5alRNYVNRZ3FyVjZEU05xQ3FkUG12ZXZ2WitPdVRqeEZyZklGaE84NkNS?=
 =?utf-8?B?K3RjM05xalJMK2xzbTBWYTJhSzJDY2lick5iczJ6bkx4OTFidUlvb202R2p1?=
 =?utf-8?B?YTRsaXdEd2phbzBRWkIvQmRXUjhvRm91L0hXcUJnVGU4elE0bXV2VlUwMTA3?=
 =?utf-8?B?d05GSFhxdmtPWkRFdHBaSEdHVUtGM1ZDcStZQ3ZzbFBETjI5TWpSTGx6UFRz?=
 =?utf-8?B?bWtGZ0x2YzYzR0JvUmp5bjJQUUhCTDdlYjhaOThkOW90bkVIemdCbmtXeXpn?=
 =?utf-8?B?UkpiVitueUpPQk42VWFVdWk4dm42RlhjMU54TUsvMkVmaDRuR0hlMjZaZndo?=
 =?utf-8?B?Y1RNSTN5TnpSMnF1d0VEQ1Y0Zk1UNUxTQzl6RURvSE1BVThVaWZ3bFdVenVI?=
 =?utf-8?B?V0U1L2M3M21MVDlKaWVFbGVtZzI4YkozeEx6a2E3cituazlYSDZseG90c09z?=
 =?utf-8?B?T3hoUVZ4OHhkWnBGLzRURkhtRjd4czNJUlpEd0diVEhWeW9NNXJGaVloRHA0?=
 =?utf-8?B?ZVJVQkNaUXBYS1BxcWdoREg2cXQvTkVweGM0RkxFc2FFc1RHWEpRYy9XR3V3?=
 =?utf-8?B?VmhjUjNBblFIdTQ3YlVlc3dnQTB4VWp6U1N3MnVFU1FSZURQem5jTzhtTTdC?=
 =?utf-8?B?blQyWGtGMUowdTZwbHhhamVSa3dyWjJSOFUySklib1F0T3Bid0dEUjBtSDEz?=
 =?utf-8?B?MUduRTI3TCtFSzZzRlF0WEtUZmV3eVNHU0xWNzRsVEtGdDJLRnkxM2ZlblBR?=
 =?utf-8?B?cEVxUVFITnN5eHpMeFlSbHBiRGJLM2U2eGpBZk4yZ1VxRUpCd0U2TE02OHJP?=
 =?utf-8?B?UEtCRFdVNU1CTzk5d1Z1WnozKzI4b1RPeWRNYVZLdm11YnRrUFcyY3RMd202?=
 =?utf-8?B?VThRZUhPTnA3TWdmNGNEblFYSnJDVGtaTWkzNFhUN1JINWxSUGRNVHNLdzky?=
 =?utf-8?B?N3RrK25NQ2xVaG1aRElCWHVNTXd4UXVHNTZ3N3U2VExDSndYL04rayt1QzlT?=
 =?utf-8?B?KzlQazRKS2RZNjR2cUppWXRJWHZuRFozZ29GS21YOU1PQWtFYXZmN0FsUnph?=
 =?utf-8?B?cGpXL2RFNzNEbnF4b29hOW4wQXNyaVRrR012c0ZKNXpYUFRvYTZkS1RHQXlu?=
 =?utf-8?B?blUxc2NVM3c3c1ZxdkFjK0JZU2VUaUhUZ1c3UHpJeXZ3dnBlUFlVZkN6U0Ju?=
 =?utf-8?B?SlZnTlVDOWZtVjdNeGNlaHp4S2RSOHlKdzI4b3V2WDBUaUR0aitoS0tvN1V4?=
 =?utf-8?B?dUNteDZsNjJJVkpjSUU4SGpjNEY3Z29uSnBlQVpkUkpxa1orczRsSzRveEFy?=
 =?utf-8?B?TnBaYzNHVDhTamFkSlpJdllvZm5sWXJjdWdlcTZzeTdNM0VuTkR5SkM0OXBZ?=
 =?utf-8?B?UkJneVF5MG5BbmdpUEppNkFjSTdrNWtBL2FyRHJ0cTgyOXBHK2lucHFSWjNR?=
 =?utf-8?B?K0doTmg2aytrM24wS3A2amhwbDV0MWNGT2VvdWNxaUxGbWp1QVVSaUlrU2VL?=
 =?utf-8?B?SGR3TmkyRmczNEdYWHc3NkRKQm5pNmIzNGU1R3JKbFp3WS9GZkJJd0xkU3ZR?=
 =?utf-8?B?QUlNd2JCV3RRYzZ1aXZvK1lVWGVZSmhVeDBvdmlEdzRXaVVTWVVmUT09?=
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
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efb10a7-cad5-4c36-2668-08df41b39f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 18:26:23.6920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJ49Ql+MPLt0moeS0zLfz7epl/W/rGfISw+T8/g3ZrGaMQXLfwxBlUBpXO/WeauoHVckNofj4qnx7Oa7RrLgLqje4Znk0pb2gytky5km7r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11611

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gU2VudDogMDQgTm92ZW1iZXIgMjAyNiAxNTox
NQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcw
NDZsNDgtc21hcmM6IEVuYWJsZSBVU0IyLjAgc3VwcG9ydA0KPiANCj4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gRW5hYmxlIFVTQjIuMCBIb3N0L0Z1
bmN0aW9uIG9uIHRoZSBSWi9HM0wgU01BUkMgRVZLIGJvYXJkLg0KPiANCj4gRHJvcCB0aGUgZXhw
bGljaXQgImRpc2FibGVkIiBvdmVycmlkZXMgZm9yIHRoZSBPSENJLCBFSENJIGFuZCBIU1VTQiBu
b2RlcywgYXMgdGhleSBhcmUgZGlzYWJsZWQgYnkNCj4gZGVmYXVsdCBpbiB0aGUgU29DIERUU0ku
IEVuYWJsZSB0aGUgVVNCIFBIWSBjb250cm9sbGVyIGFuZCBib3RoIFVTQjIgUEhZcywgd2l0aCBW
QlVTIHN1cHBsaWVzLCBhbmQgYWRkDQo+IHRoZSBVU0IwIHBpbiBjb250cm9sIChPVlJDVVIvVkJV
U0VOKS4gUG9ydCAxIGhhcyBubyBPVEcgcGlucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gLS0tDQo+IHY3LT52ODoNCj4gICog
VXBkYXRlZCBjb21taXQgaGVhZGVyLg0KPiAgKiBEcm9wcGVkIHJlZHVuZGFudCBub2RlcyBmcm9t
IGJvYXJkIGR0cyBhcyBpdCBpcyBkZWZpbmVkIGluIGNvbW1vbg0KPiAgICBib2FyZCBkdHNpDQo+
ICAqIERyb3BwZWQgdXNiMV9waW5zLg0KPiAtLS0NCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwOGcwNDZsNDgtc21hcmMuZHRzIHwgNDIgKysrKysrKysrKystLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDZsNDgt
c21hcmMuZHRzDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Nmw0OC1z
bWFyYy5kdHMNCj4gaW5kZXggNjhkN2I1NzllMzUyLi45ZmZhZWFkMmM2YmUgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDZsNDgtc21hcmMuZHRzDQo+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDZsNDgtc21hcmMuZHRz
DQo+IEBAIC03MSwxOCArNzEsNiBAQCBjb2RlY19kYWk6IGNvZGVjIHsNCj4gICNlbmRpZg0KPiAg
fTsNCj4gDQo+ICAJCQkgPFJaRzNMX1BPUlRfUElOTVVYKEgsIDIsIDkpPiwgLyogU1NJRjBfUkNL
ICovDQo+ICAJCQkgPFJaRzNMX1BPUlRfUElOTVVYKEgsIDMsIDkpPjsgLyogU1NJRjBfVFhEICov
DQo+ICAJfTsNCj4gKw0KPiArCXVzYjBfcGluczogdXNiMCB7DQo+ICsJCXBpbm11eCA9IDxSWkcz
TF9QT1JUX1BJTk1VWCgzLCAwLCAxMik+LCAvKiBVU0IyMF9PVlJDVVIgKi8NCj4gKwkJCSA8UlpH
M0xfUE9SVF9QSU5NVVgoMywgMSwgMTIpPjsgLyogVVNCMjBfVkJVU0VOICovDQo+ICsJfTsNCg0K
DQpJIGFtIHNlZWluZyAidXNiIHVzYjEtcG9ydDE6IG92ZXItY3VycmVudCBjb25kaXRpb24iIG1l
c3NhZ2Ugb24gUlovRzNMLA0KaWYgSSBkb24ndCBkZWZpbmUgdXNiMSBwaW5zLg0KDQpUaGVzZSBw
aW5zIGFyZSBjb25uZWN0ZWQgdG8gU29DIGFuZCBub3QgY29ubmVjdGVkIHRvIGNhcnJpZXIgYXMg
aXQgaXMgdXNpbmcNClVTQiBodWIuDQoNCkZvciBtZSwgaXQgbG9va3MgbGlrZSB0aGUgcGluIGlz
IGZsb2F0aW5nLCBpZiB3ZSBkb24ndCBpbml0aWFsaXplIHRoZSBwaW5mdW5jdGlvbg0KYW5kIHRy
aWdnZXJpbmcgb3Zlci1jdXJyZW50IG1lc3NhZ2Ugb24gRzNMIGFuZCBub3Qgb24gRzNFLg0KDQor
ICAgICAgIHVzYjFfcGluczogdXNiMSB7DQorICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzNM
X1BPUlRfUElOTVVYKDMsIDQsIDEyKT4sIC8qIFVTQjIxX09WUkNVUiAqLw0KKyAgICAgICAgICAg
ICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWCgzLCA1LCAxMik+OyAvKiBVU0IyMV9WQlVT
RU4gKi8NCisgICAgICAgfTsNCisNCg0KQ2hlZXJzLA0KQmlqdQ0K
