Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793857441;
	b=wrSa2gSZqHkQEDjy8vU+4ZEMVWhNJMFq64dw3kUwOY+Nn5KmLUtAPVy+R+YJEnUaTBzk
	 obyuiD4/MCqmivLHDNcbb6d26W2WePwii2BNOe9AZmrhLqDuuj0BT/IIoNLGhiXoScPJX
	 LGkaZ+w+51MLbzVrGjiDgdLJfDuXbQFAkeiy70mkmzpwvQjwTVnBJZ44Jh5nwj5VQRgjg
	 oOBO2IlE0dkwCc+ommQUXm8YVfXaeD0WG3HoQK0nkY+gfOpLgK28OPstY+jtBud9Ugh/N
	 6crva6ERyhsF+VrgDj9LPM2JTy4wNEnhwTrlI4ZBy/uulIFUJYetMkUSTMpuhtSqv4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857441;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=jSEfwpx/y4Qz8yaHO2IL4qlWmGrnWeYhjb8zPxUyUis=;
	b=f/wlgNCLGCibFi8ARSjC9V2r/UX+04hsJxubsQ7HkoTiOgYtpRsSJO37oUMXhxeuWtkG
	 AEWze+LQvKK03MI+VFhhymaBotV5F+7kbFzKWdY4rsjBaOm8D80s4LChqVXclxSK2MhJQ
	 tzwfdkPBovnKE4SIPrY/TFendsNMxtI2kIze0YFzBdDvuBEHkYAVyt4iOASPkb+9v/Mpn
	 Nag9b967hF3Zitd+CYpVcQaeKtXvFSbV6Shy3VFvIYYPehNYGHNLd1vxg8orBgDhMjRlJ
	 5n4SeOqMX19wY5dU3R31A/Cos2Xeest7rl8MWnffYBiBcMPiPNrXBkvBTYE5SGrmceg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=OD5n5px9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.80
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020080.outbound.protection.outlook.com [52.101.227.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD81606A326;
	Thu,  5 Nov 2026 05:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=OD5n5px9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkXe6bG1qusRz3V5FI7QDz/PqtiImHp4nMr+OfGfPng4RyarThG9UdRinK6CviimTgUBzHrBeUmhI/D1SQ9lkUSdGHMFV/L0RY9i0r2lFk/nbeI58kPF5YQuu5axGHC2EOAI6CA3MkiAAA1B1U8RYbFnjHjMhEjFoxy67MF0sruUZA84Vivw8L2LpXBwhPok58EPhp7Qr5bExCn3dAfpSfk4HojP/pDoJhB8mE+YH/kUsDwWCUjE8gR1YtxlG9wdVRxoD28a3Qhg+0ZuO00nMjDSBNmGzNppe5ByERpkQqCRKZgc+9mlsXVQYl+q4sATd723dcXDqLSIZTwio6nJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSEfwpx/y4Qz8yaHO2IL4qlWmGrnWeYhjb8zPxUyUis=;
 b=d0jWEzcZw5WhhWlO4+ragrCkABO6UmlBh8Vd+L0FI8qjjkU+hMrN3nlAS58vsN6gu4uFswxiM+wGXCN7/a0G3ieUnjQvbrXekK3A3GCIeTtjatlxHBqWDygXve25f8fXkPC3y18e6J8m1NuXOha6PkB5kYxtm8HUDVgIJJFByt1gd2U/Gn+Yb9rsBb9eUzRX7pByUdLceaWGgy+8gy3fiDvFddmGmbb50zAKkys0AZKx+A7GG8U7XIK3Vh0x8IT9y3E0lBCSKf93NvGCNANlVJulOVHhH89dWePsu4EsszlxMQarZCX1uQSGG+dxaNSXCE4ZB+D0zY61x9IobAG/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSEfwpx/y4Qz8yaHO2IL4qlWmGrnWeYhjb8zPxUyUis=;
 b=OD5n5px9mPqdkLVhDvYtL8MQh/QHYEnD1vUHvCxqWnKBruyrkW5eDOSQwhLVPOXCQdgB6sv+3S8tGSDzbr7gV+NDr7c+N85LlmmghAVuOHnCe8QTkKZW5WSEFNeQRXd9AZ2tehPP1n5DYphfWVJVH0Jk18uTdA4LIfaAmFA+eve823q+IT3FFhUFYbLg4xpalnIsOgnsauEvHCbrIjnSc6umX3nYkKVJk6mKgf6eT0zCR0GPI93Fb9PavhtAy/JSUjTT3xfkBGTRVndpuVKCZ4JNnnY0W8FMw3tYKjKt3PwGcdcljNxUYYb0tR4IBWl2wWp+xWHJ2RF1x0TlJLZemQ==
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::11)
 by PN0P287MB0411.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:122::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 05:43:55 +0000
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7]) by PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:43:54 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, "armandas.kvietkus@proton.me"
	<armandas.kvietkus@proton.me>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Thread-Topic: [PATCH v4 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Thread-Index: AQHdWWDKRS7I3UJZjUyrcHmQyvB0i7cfHcpm
Date: Thu, 5 Nov 2026 05:43:54 +0000
Message-ID:
 <PN3P287MB2188EEBDB68A82967833C8DB88772@PN3P287MB2188.INDP287.PROD.OUTLOOK.COM>
References: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
 <20261011-upstream-s5k3t2-v4-2-d33b12fb3263@proton.me>
In-Reply-To: <20261011-upstream-s5k3t2-v4-2-d33b12fb3263@proton.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB2188:EE_|PN0P287MB0411:EE_
x-ms-office365-filtering-correlation-id: 347a9e59-2750-4b9d-613e-08df3affc77d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|10067099003|38070700021|56012099006|4143699003|261022075727099003|261022115727099003|261022105027099003|261028144727099003|261026140227099003|261009223327099003|261009223027099003|261009221727099003|261009220027099003|261021121427099003|261009221227099003|261021123027099003|261102123227099003|261026121527099003;
x-microsoft-antispam-message-info:
 SbshEleI5FyDkiG48SqmA3tYGxJZUKf+bUMcsLjy0lG1bw7bCnwvbXTq8Ou7uyMkhSuheKIYf08XS/8qDsjNZUoMpelxSv7aXTHliT5lv09crE1DdquqIaB8rM+KrzsuQaZyKyejxLfiEN72A5JVeZuLRzCiJhaRrBNUP8nIF/h9HVnjKoVFLUm39ZCC+57YDr5c4z9rvVMhbRK2df46wh2E/UPt6+dnLo6Zr9gtGGk3Mu1hJOo+OlCl2gcUM5H23hIRDKSu/J5r2Mh+NtLRytoHS9chGEWgmB06bMo55K04nkH8BDNAWeaQjD23e9VZKArJXJ0kz9UPuV0iG/NlugyQ3PUk/JtkyOKsNbTkZfeyB/veuE7vvwwt81RvIqbK1U2HRCwG0NSik8mNrDF8bsDJOQP1Bxsciysk0Wd1c+IY7/xiAaK2DHJBjQSvvnr88sijsNiw6jBOLyjRZgrUQrwQCCMZ91l4S6y7Zvz7XvrZcr+bqoSSCfaQO+mg288Oq63CiW+h/O2DKa3V7i5ASDG5J0RfYxpkhjKZaiu60LaioEi3JJbqKyrm7e2qLLKHc3eH6G8S9ehd5cHViwDJL2awM6zxPyM9/etg+Dbo58kgVNfavkToqUy4SNxpY2XGiAp1Ov8/EwHVbjvc0u4+HbUZiqX5scYzvkoZP1+l6PwKHZ52wmRsrsINxPEFPEEGfjnx6IfmrgvMqndQpDPIXHbdy80LpJlQXBtXAU83AS4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2188.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(56012099006)(4143699003)(261022075727099003)(261022115727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009220027099003)(261021121427099003)(261009221227099003)(261021123027099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?by2WDt2VYa4SLJn3RknuvXGIgj62qdErNX9D8UXc7Q/dxt3pmMEEpQp+fx?=
 =?iso-8859-1?Q?sYx0oOcf4Mref4cA9HgAaEnbzTfxjOin8xKSgknCMdzPdAxrGQSRBydvlK?=
 =?iso-8859-1?Q?d4YgkjC27OdmyAzF8o72MUpwjGla9hKKFYDND+UsO3e3RiS35fCJCZnuir?=
 =?iso-8859-1?Q?QUf+TmucJBFetK46XTJ+qNOqX+Ocjw4hoi1Fy87halB0x2kWgzbbrIY5ID?=
 =?iso-8859-1?Q?vnvVWhOnfK9+FFEIx49Vb1Bg4XA4GHcrAZf0buHqBiI77i92QHfw9J74iL?=
 =?iso-8859-1?Q?+ozB/Yt1v+zOR8rvOU1an7V7K3ev1C3DdM/hEsMND3QGGE/itHQp6rWF8E?=
 =?iso-8859-1?Q?LZH6ZvH8pVPmB0SUTubZ4V6lMynLNrYdqDjCdEl6DTvSkubp2nCuTMKcOE?=
 =?iso-8859-1?Q?33BQeMEy5lzoZAir9onCQKVAUeMctnbll0S4odLfM9YJdxArfwPuq8WP8h?=
 =?iso-8859-1?Q?jbD1yWDWy6/7YVXvXrngTzZGqdAIx4xwjYDqEgZbQmATK9kYY+vN0hzES+?=
 =?iso-8859-1?Q?4QOBmXNhgSvPKfgvq1DsZmlsI7C00pXTu4SmK/5dhj58fUSOq8wAisnmAI?=
 =?iso-8859-1?Q?drPuEjs/brEn5RWdkysiYtoqiOJywk1aX2+XkKeplCuNkoJlPmK3LXDwBN?=
 =?iso-8859-1?Q?5xW5mUJWd+ijwPgE9XzYVz7kXXq9fi3I2EqtgrKNyvOC9ugOC6JiYFIMDg?=
 =?iso-8859-1?Q?AxRZ4Q2T5VVEj/xiAhvt6G7IMCKcrTOLvSZwISdGwshw/QwA3aiPCrJFty?=
 =?iso-8859-1?Q?82Z1EaLW6Ih1KAMkppbJ16oCHB1HgEBQg1DBNM0Uz12F1NDXUYGdVEVjAe?=
 =?iso-8859-1?Q?S2tHr2YEVWRai7SPYfwsQORDBa9D45V0hL22nMvn5P4bL04IQ20JuNcr34?=
 =?iso-8859-1?Q?7E3iSt6z637+xmxHVyh1p+v8pL6WLLnWMA5XhnbaVR7tbO4Nz4z+3BJAou?=
 =?iso-8859-1?Q?1g5WoJc4g/3yJALh1GCaoi122ZkWJhmVRrVOfMx3FOjljcRjiY6eVfkpz9?=
 =?iso-8859-1?Q?CKlTKer514EyJ6vD8cgMTzMPVSiHzi4pDQO78fL9vxadJoBSEcOacXglbd?=
 =?iso-8859-1?Q?Wz4nYafTF0SeYv7zXcNh3HE9fPvRt8pIMJC5VQTL6RqfiNf0L1bGid5Wcj?=
 =?iso-8859-1?Q?z4dgDiQGjFry7zSwTSzi6GHvAx6Yxin2LWzWcTA99l1jEW1+ktZiNIJwNF?=
 =?iso-8859-1?Q?BdSeK3lk7IcH+v43PPv8BfJy03jBspEt0SRVbQDPI0fAgct3GWv3Kb4eVa?=
 =?iso-8859-1?Q?CGH6Ul7po2YE4kjtfOFzpGFe87xpUULd+miMLEJVD8K+a2IeGtuDk6+GIs?=
 =?iso-8859-1?Q?s55mcouUeC4gDlppsNi8dmSwVRWY2LgThlQnDuMkB/HVfiYRxr663DJwe3?=
 =?iso-8859-1?Q?eudi8kk6h3e+S7a5QTSDcwKZouiNylY3XmyUETuCR883/NJvznjxDnpncN?=
 =?iso-8859-1?Q?RZp23BQ/dGNW8sgm76BBwUQk/mnnPokIyFP3tytwOf3NLWvPT/lnUsB7Yp?=
 =?iso-8859-1?Q?S7ORBCRifPurpZt7WkXOeMBRqYcpmn8c+lQdi1WRth6083s7pU6NdFgQQg?=
 =?iso-8859-1?Q?/InsDCnJrGS3J5O+gPo2+yWl1/vzmQTbaO25KPsZp6oavPseKyvNGK5hnv?=
 =?iso-8859-1?Q?rfl9bsdh+roOHrqcBYuIr2k0p8yYcEsGVlGAeijvUeAWdSvvdg4ZuXdDV8?=
 =?iso-8859-1?Q?1lOfHMBin0YtB7bTOPgUkxKvGyoTT5B1t6MfoSdK7lmBQww0nX/CUL/Sn6?=
 =?iso-8859-1?Q?guuxUOc6pP+r7JGDG6UsJ981NgkKwCD+J66ambp+4m5iNyGRyiFcOp0BcX?=
 =?iso-8859-1?Q?V8LJqYRa8SVgIivF/SaZ58xDd3dxMls=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 347a9e59-2750-4b9d-613e-08df3affc77d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 05:43:54.7453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6lMirvusay6kMMwwnAn4J07hFRoOaYGDt9LpnnvcxURnjyQMRBzJ3rAREm0uyh1zHiR4oXH9Syg9Qw5S+XS+Tn2Jq6A0/pu6e6rhlbw/UADZyRKco7E9jOroyUEi7gm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0411

Hi Armandas,=0A=
=0A=
sorry for the late reply. I noticed a few minor nits.=0A=
=0A=
>From: Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>=0A=
>Add a driver for the Samsung S5K3T2 20 Mpixel CMOS image sensor.=0A=
>=0A=
>The driver supports three modes. All of them are RAW10 on four D-PHY=0A=
>lanes.=0A=
>=0A=
>  5184x3880 at 15 fps, link frequency 448 MHz=0A=
>  2592x1940 at 60 fps, link frequency 448 MHz=0A=
>  1280x720 at 120 fps, link frequency 300 MHz=0A=
>=0A=
>The pixel clock does not change between modes, so the pixel rate control=
=0A=
>is constant. The frame rate follows from the line length and the frame=0A=
>length.=0A=
>=0A=
>The controls are exposure, analogue gain, horizontal blanking, vertical=0A=
>blanking, horizontal flip, vertical flip and test pattern. Rotation and=0A=
>orientation come from the device tree. Power is handled by runtime PM=0A=
>with autosuspend.=0A=
>=0A=
>The register tables come from the vendor camera firmware. They were=0A=
>checked on hardware.=0A=
>=0A=
>Tested on a Xiaomi POCO F3 with the Qualcomm CAMSS driver.=0A=
>=0A=
>Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>---=0A=
> MAINTAINERS                |    1 +=0A=
> drivers/media/i2c/Kconfig  |   10 +=0A=
> drivers/media/i2c/Makefile |    1 +=0A=
> drivers/media/i2c/s5k3t2.c | 1331 +++++++++++++++++++++++++++++++++++++++=
+++++=0A=
> 4 files changed, 1343 insertions(+)=0A=
>=0A=
>diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>index 1924dbd20b57..e625cf3a28e3 100644=0A=
>--- a/MAINTAINERS=0A=
>+++ b/MAINTAINERS=0A=
>@@ -24386,6 +24386,7 @@ L:	linux-media@vger.kernel.org=0A=
> S:	Maintained=0A=
> T:	git git://linuxtv.org/media_tree.git=0A=
> F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml=0A=
>+F:	drivers/media/i2c/s5k3t2.c=0A=
>=0A=
> SAMSUNG S5K5BAF CAMERA DRIVER=0A=
> M:	Sylwester Nawrocki <s.nawrocki@samsung.com>=0A=
>diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
>index 5c52007f9cbe..999aeecd2a21 100644=0A=
>--- a/drivers/media/i2c/Kconfig=0A=
>+++ b/drivers/media/i2c/Kconfig=0A=
>@@ -804,6 +804,16 @@ config VIDEO_S5K3M5=0A=
> 	  To compile this driver as a module, choose M here: the=0A=
> 	  module will be called s5k3m5.=0A=
>=0A=
>+config VIDEO_S5K3T2=0A=
>+	tristate "Samsung S5K3T2 sensor support"=0A=
>+	select V4L2_CCI_I2C=0A=
>+	help=0A=
>+	  This is a V4L2 sensor driver for Samsung S5K3T2 20MP raw=0A=
>+	  camera sensor.=0A=
>+=0A=
>+	  To compile this driver as a module, choose M here: the=0A=
>+	  module will be called s5k3t2.=0A=
>+=0A=
> config VIDEO_S5K5BAF=0A=
> 	tristate "Samsung S5K5BAF sensor support"=0A=
> 	help=0A=
>diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
>index d04bd5724552..9a25d8200b65 100644=0A=
>--- a/drivers/media/i2c/Makefile=0A=
>+++ b/drivers/media/i2c/Makefile=0A=
>@@ -130,6 +130,7 @@ obj-$(CONFIG_VIDEO_RDACM21) +=3D rdacm21.o=0A=
> obj-$(CONFIG_VIDEO_RJ54N1) +=3D rj54n1cb0c.o=0A=
> obj-$(CONFIG_VIDEO_S5C73M3) +=3D s5c73m3/=0A=
> obj-$(CONFIG_VIDEO_S5K3M5) +=3D s5k3m5.o=0A=
>+obj-$(CONFIG_VIDEO_S5K3T2) +=3D s5k3t2.o=0A=
> obj-$(CONFIG_VIDEO_S5K5BAF) +=3D s5k5baf.o=0A=
> obj-$(CONFIG_VIDEO_S5K6A3) +=3D s5k6a3.o=0A=
> obj-$(CONFIG_VIDEO_S5KJN1) +=3D s5kjn1.o=0A=
>diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c=0A=
>new file mode 100644=0A=
>index 000000000000..07c7d0419122=0A=
>--- /dev/null=0A=
>+++ b/drivers/media/i2c/s5k3t2.c=0A=
>@@ -0,0 +1,1331 @@=0A=
>+// SPDX-License-Identifier: GPL-2.0=0A=
>+// Copyright (c) 2026 Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>+=0A=
>+#include <linux/clk.h>=0A=
>+#include <linux/delay.h>=0A=
>+#include <linux/gpio/consumer.h>=0A=
>+#include <linux/i2c.h>=0A=
>+#include <linux/module.h>=0A=
>+#include <linux/pm_runtime.h>=0A=
>+#include <linux/regulator/consumer.h>=0A=
>+#include <linux/units.h>=0A=
>+#include <media/v4l2-cci.h>=0A=
>+#include <media/v4l2-ctrls.h>=0A=
>+#include <media/v4l2-device.h>=0A=
>+#include <media/v4l2-fwnode.h>=0A=
>+=0A=
>+#define S5K3T2_LINK_FREQ_448MHZ		(448 * HZ_PER_MHZ)=0A=
>+#define S5K3T2_LINK_FREQ_300MHZ		(300 * HZ_PER_MHZ)=0A=
>+#define S5K3T2_MCLK_FREQ		19200000=0A=
>+#define S5K3T2_PIXEL_RATE		676571429=0A=
>+#define S5K3T2_DATA_LANES		4=0A=
>+=0A=
>+#define S5K3T2_REG_CHIP_ID		CCI_REG16(0x0000)=0A=
>+#define S5K3T2_CHIP_ID			0x3142=0A=
>+=0A=
>+#define S5K3T2_REG_MODE_SELECT		CCI_REG8(0x0100)=0A=
>+#define S5K3T2_MODE_STANDBY		0x00=0A=
>+#define S5K3T2_MODE_STREAMING		0x01=0A=
>+=0A=
>+#define S5K3T2_REG_ORIENTATION		CCI_REG8(0x0101)=0A=
>+#define S5K3T2_VFLIP			BIT(1)=0A=
>+#define S5K3T2_HFLIP			BIT(0)=0A=
>+=0A=
>+#define S5K3T2_REG_EXPOSURE		CCI_REG16(0x0202)=0A=
>+#define S5K3T2_EXPOSURE_MIN		8=0A=
>+#define S5K3T2_EXPOSURE_STEP		1=0A=
>+#define S5K3T2_EXPOSURE_MARGIN		4=0A=
>+=0A=
>+#define S5K3T2_REG_AGAIN		CCI_REG16(0x0204)=0A=
>+#define S5K3T2_AGAIN_MIN		1=0A=
>+#define S5K3T2_AGAIN_MAX		16=0A=
>+#define S5K3T2_AGAIN_STEP		1=0A=
>+#define S5K3T2_AGAIN_DEFAULT		1=0A=
>+#define S5K3T2_AGAIN_SHIFT		5=0A=
>+=0A=
>+#define S5K3T2_REG_VTS			CCI_REG16(0x0340)=0A=
>+#define S5K3T2_VTS_MAX			0xffff=0A=
>+=0A=
>+#define S5K3T2_REG_HTS			CCI_REG16(0x0342)=0A=
>+=0A=
>+#define S5K3T2_REG_TEST_PATTERN		CCI_REG16(0x0600)=0A=
>+=0A=
>+#define S5K3T2_NATIVE_WIDTH		5192=0A=
>+#define S5K3T2_NATIVE_HEIGHT		3888=0A=
>+=0A=
>+#define S5K3T2_DEFAULT_WIDTH		2592=0A=
>+#define S5K3T2_DEFAULT_HEIGHT		1940=0A=
>+=0A=
>+#define to_s5k3t2(_sd)			container_of_const(_sd, struct s5k3t2, sd)=0A=
>+=0A=
>+static const s64 s5k3t2_link_freq_menu[] =3D {=0A=
>+	S5K3T2_LINK_FREQ_448MHZ,=0A=
>+	S5K3T2_LINK_FREQ_300MHZ,=0A=
>+};=0A=
>+=0A=
>+static const u32 s5k3t2_mbus_formats[] =3D {=0A=
>+	MEDIA_BUS_FMT_SGRBG10_1X10,	MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
>+	MEDIA_BUS_FMT_SBGGR10_1X10,	MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2_reg_list {=0A=
>+	const struct cci_reg_sequence *regs;=0A=
>+	unsigned int num_regs;=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2_mode {=0A=
>+	u32 width;=0A=
>+	u32 height;=0A=
>+	u32 hts;=0A=
>+	u32 vts;=0A=
>+	u32 exposure;=0A=
>+	unsigned int link_freq_index;=0A=
>+	struct v4l2_rect crop;=0A=
>+	const struct s5k3t2_reg_list reg_list;=0A=
>+};=0A=
>+=0A=
>+static const char * const s5k3t2_test_pattern_menu[] =3D {=0A=
>+	"Disabled",=0A=
>+	"Solid colour",=0A=
>+	"Colour bars",=0A=
>+	"Fade to grey colour bars",=0A=
>+	"PN9",=0A=
>+};=0A=
>+=0A=
>+static const char * const s5k3t2_supply_names[] =3D {=0A=
>+	"vdda",=0A=
>+	"vddd",=0A=
>+	"vddio",=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2 {=0A=
>+	struct device *dev;=0A=
>+	struct regmap *regmap;=0A=
>+	struct clk *mclk;=0A=
>+	struct gpio_desc *reset_gpio;=0A=
>+	struct regulator_bulk_data supplies[ARRAY_SIZE(s5k3t2_supply_names)];=0A=
>+=0A=
>+	struct v4l2_subdev sd;=0A=
>+	struct media_pad pad;=0A=
>+=0A=
>+	struct v4l2_ctrl_handler ctrl_handler;=0A=
>+	struct v4l2_ctrl *link_freq;=0A=
>+	struct v4l2_ctrl *hblank;=0A=
>+	struct v4l2_ctrl *vblank;=0A=
>+	struct v4l2_ctrl *exposure;=0A=
>+	struct v4l2_ctrl *hflip;=0A=
>+	struct v4l2_ctrl *vflip;=0A=
>+=0A=
>+	unsigned long link_freq_bitmap;=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_init_setting[] =3D {=0A=
>+	{ CCI_REG16(0x6214), 0xff7d },=0A=
>+	{ CCI_REG16(0x6218), 0x0000 },=0A=
>+	{ CCI_REG16(0x0a02), 0x003f },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3aec },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0549 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0448 },=0A=
>+	{ CCI_REG16(0x6f12), 0x054a },=0A=
>+	{ CCI_REG16(0x6f12), 0xc1f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2c05 },=0A=
>+	{ CCI_REG16(0x6f12), 0x101a },=0A=
>+	{ CCI_REG16(0x6f12), 0xa1f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3005 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7bb8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3ca0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2670 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9c00 },=0A=
>+	{ CCI_REG16(0x6f12), 0x70b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0646 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4348 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0168 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0c0c },=0A=
>+	{ CCI_REG16(0x6f12), 0x8db2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2946 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9bf8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9df8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3d48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3e4a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0830 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0188 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1180 },=0A=
>+	{ CCI_REG16(0x6f12), 0x911c },=0A=
>+	{ CCI_REG16(0x6f12), 0x4088 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2946 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2046 },=0A=
>+	{ CCI_REG16(0x6f12), 0xbde8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x89b8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x70b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0646 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3548 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4068 },=0A=
>+	{ CCI_REG16(0x6f12), 0x84b2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x050c },=0A=
>+	{ CCI_REG16(0x6f12), 0x2146 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2846 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7ef8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x85f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3149 },=0A=
>+	{ CCI_REG16(0x6f12), 0x314b },=0A=
>+	{ CCI_REG16(0x6f12), 0x0120 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0988 },=0A=
>+	{ CCI_REG16(0x6f12), 0x40ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5881 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2f48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x68b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2e48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2f49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x80f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0xc428 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a80 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2e49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0e78 },=0A=
>+	{ CCI_REG16(0x6f12), 0x36b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x90f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0xe803 },=0A=
>+	{ CCI_REG16(0x6f12), 0x18b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0120 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02e0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf0e7 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4978 },=0A=
>+	{ CCI_REG16(0x6f12), 0x01b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x42b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0021 },=0A=
>+	{ CCI_REG16(0x6f12), 0x40ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x66f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0128 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02d0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1be0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0121 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf5e7 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2248 },=0A=
>+	{ CCI_REG16(0x6f12), 0x234a },=0A=
>+	{ CCI_REG16(0x6f12), 0x234e },=0A=
>+	{ CCI_REG16(0x6f12), 0xb0f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7211 },=0A=
>+	{ CCI_REG16(0x6f12), 0x92f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9420 },=0A=
>+	{ CCI_REG16(0x6f12), 0x90f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7401 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd140 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4318 },=0A=
>+	{ CCI_REG16(0x6f12), 0x96f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7f63 },=0A=
>+	{ CCI_REG16(0x6f12), 0x581e },=0A=
>+	{ CCI_REG16(0x6f12), 0x022e },=0A=
>+	{ CCI_REG16(0x6f12), 0x03d9 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0220 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x181a },=0A=
>+	{ CCI_REG16(0x6f12), 0x401c },=0A=
>+	{ CCI_REG16(0x6f12), 0x164a },=0A=
>+	{ CCI_REG16(0x6f12), 0x703a },=0A=
>+	{ CCI_REG16(0x6f12), 0x1180 },=0A=
>+	{ CCI_REG16(0x6f12), 0x911c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2146 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2846 },=0A=
>+	{ CCI_REG16(0x6f12), 0xbde8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x31b8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x10b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0xaff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xb501 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1348 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3ef8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x064c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0xaff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xff01 },=0A=
>+	{ CCI_REG16(0x6f12), 0x6060 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1048 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x36f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0f49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2060 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7a20 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0968 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4883 },=0A=
>+	{ CCI_REG16(0x6f12), 0x10bd },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3c90 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x950c },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x16f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x19a0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x30c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9800 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1dd0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x17c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2210 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2670 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf45f },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd957 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x08c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x49f6 },=0A=
>+	{ CCI_REG16(0x6f12), 0x213c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4df6 },=0A=
>+	{ CCI_REG16(0x6f12), 0x571c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4ff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5f4c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x44f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9b0c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4bf2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xed0c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
=0A=
I noticed some repeated page select register writes.=0A=
=0A=
Are these necessary, or can they be removed?=0A=
=0A=
>+	{ CCI_REG16(0x602a), 0x1014 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0100 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7000 },=0A=
>+	{ CCI_REG16(0x602a), 0x108a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0006 },=0A=
>+	{ CCI_REG16(0x602a), 0x1092 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0005 },=0A=
>+	{ CCI_REG16(0x602a), 0x1096 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0002 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001a },=0A=
>+	{ CCI_REG16(0x602a), 0x109c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x10a2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ae },=0A=
>+	{ CCI_REG16(0x6f12), 0x0007 },=0A=
>+	{ CCI_REG16(0x602a), 0x10c2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001e },=0A=
>+	{ CCI_REG16(0x602a), 0x10f4 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x602a), 0x110a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x113e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0001 },=0A=
>+	{ CCI_REG16(0x6f12), 0x014e },=0A=
>+	{ CCI_REG16(0x602a), 0x13ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x160f },=0A=
>+	{ CCI_REG16(0x6f12), 0x0d00 },=0A=
>+	{ CCI_REG16(0x602a), 0x13fa },=0A=
>+	{ CCI_REG16(0x6f12), 0x009d },=0A=
>+	{ CCI_REG16(0x6f12), 0x0107 },=0A=
>+	{ CCI_REG16(0x602a), 0x14e2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04c2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02ae },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0xf44a), 0x0010 },=0A=
>+	{ CCI_REG16(0xf46a), 0xb6a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0f5e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0200 },=0A=
>+	{ CCI_REG16(0x602a), 0x0f90 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x17c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0201 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0001 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0203 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0405 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0607 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0809 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a0b },=0A=
>+	{ CCI_REG16(0x6f12), 0x0c0d },=0A=
>+	{ CCI_REG16(0x6f12), 0x0e0f },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x020c), 0x0001 },=0A=
>+	{ CCI_REG16(0x0bc6), 0x0000 },=0A=
>+	{ CCI_REG16(0x0d00), 0x0000 },=0A=
>+	{ CCI_REG16(0xb13c), 0x0800 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_5184x3880_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0103 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0003 },=0A=
>+	{ CCI_REG16(0x0310), 0x008c },=0A=
>+	{ CCI_REG16(0x0312), 0x0001 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0008 },=0A=
>+	{ CCI_REG16(0x0346), 0x0008 },=0A=
>+	{ CCI_REG16(0x0348), 0x1447 },=0A=
>+	{ CCI_REG16(0x034a), 0x0f2f },=0A=
>+	{ CCI_REG16(0x034c), 0x1440 },=0A=
>+	{ CCI_REG16(0x034e), 0x0f28 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0111 },=0A=
>+	{ CCI_REG16(0x0404), 0x1000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0001 },=0A=
>+	{ CCI_REG16(0x0382), 0x0001 },=0A=
>+	{ CCI_REG16(0x0384), 0x0001 },=0A=
>+	{ CCI_REG16(0x0386), 0x0001 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
=0A=
Similarly here also=0A=
=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a58 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1477 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x000a },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x003f },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0804 },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_2592x1940_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0103 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0003 },=0A=
>+	{ CCI_REG16(0x0310), 0x008c },=0A=
>+	{ CCI_REG16(0x0312), 0x0001 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0008 },=0A=
>+	{ CCI_REG16(0x0346), 0x0008 },=0A=
>+	{ CCI_REG16(0x0348), 0x1447 },=0A=
>+	{ CCI_REG16(0x034a), 0x0f2f },=0A=
>+	{ CCI_REG16(0x034c), 0x0a20 },=0A=
>+	{ CCI_REG16(0x034e), 0x0794 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0122 },=0A=
>+	{ CCI_REG16(0x0404), 0x1000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0002 },=0A=
>+	{ CCI_REG16(0x0382), 0x0002 },=0A=
>+	{ CCI_REG16(0x0384), 0x0002 },=0A=
>+	{ CCI_REG16(0x0386), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
=0A=
Same here=0A=
=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x052c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a3b },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x004d },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x080f },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_1280x720_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0104 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0002 },=0A=
>+	{ CCI_REG16(0x0310), 0x007d },=0A=
>+	{ CCI_REG16(0x0312), 0x0002 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0028 },=0A=
>+	{ CCI_REG16(0x0346), 0x01fc },=0A=
>+	{ CCI_REG16(0x0348), 0x1427 },=0A=
>+	{ CCI_REG16(0x034a), 0x0d3b },=0A=
>+	{ CCI_REG16(0x034c), 0x0500 },=0A=
>+	{ CCI_REG16(0x034e), 0x02d0 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0124 },=0A=
>+	{ CCI_REG16(0x0404), 0x2000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0002 },=0A=
>+	{ CCI_REG16(0x0382), 0x0002 },=0A=
>+	{ CCI_REG16(0x0384), 0x0002 },=0A=
>+	{ CCI_REG16(0x0386), 0x0006 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
=0A=
Same here=0A=
=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0296 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0515 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x004d },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x080f },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct s5k3t2_mode s5k3t2_supported_modes[] =3D {=0A=
>+	{=0A=
>+		.width =3D 5184,=0A=
>+		.height =3D 3880,=0A=
>+		.hts =3D 10880,=0A=
>+		.vts =3D 4096,=0A=
>+		.exposure =3D 1000,=0A=
>+		.link_freq_index =3D 0,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 8,=0A=
>+			.top =3D 8,=0A=
>+			.width =3D 5184,=0A=
>+			.height =3D 3880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_5184x3880_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_5184x3880_mode),=0A=
>+		},=0A=
>+	},=0A=
>+	{=0A=
>+		.width =3D 2592,=0A=
>+		.height =3D 1940,=0A=
>+		.hts =3D 5648,=0A=
>+		.vts =3D 1996,=0A=
>+		.exposure =3D 1000,=0A=
>+		.link_freq_index =3D 0,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 8,=0A=
>+			.top =3D 8,=0A=
>+			.width =3D 5184,=0A=
>+			.height =3D 3880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_2592x1940_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_2592x1940_mode),=0A=
>+		},=0A=
>+	},=0A=
>+	{=0A=
>+		.width =3D 1280,=0A=
>+		.height =3D 720,=0A=
>+		.hts =3D 5664,=0A=
>+		.vts =3D 992,=0A=
>+		.exposure =3D 500,=0A=
>+		.link_freq_index =3D 1,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 40,=0A=
>+			.top =3D 508,=0A=
>+			.width =3D 5120,=0A=
>+			.height =3D 2880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_1280x720_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_1280x720_mode),=0A=
>+		},=0A=
>+	},=0A=
>+};=0A=
>+=0A=
>+static bool s5k3t2_filter_by_link_freq(const void *array, size_t index,=
=0A=
>+				       const void *context)=0A=
>+{=0A=
>+	const struct s5k3t2_mode *mode =3D array;=0A=
>+	const struct s5k3t2 *s5k3t2 =3D context;=0A=
>+=0A=
>+	return s5k3t2->link_freq_bitmap & BIT(mode->link_freq_index);=0A=
>+}=0A=
>+=0A=
>+static const struct s5k3t2_mode *s5k3t2_find_mode(struct s5k3t2 *s5k3t2,=
=0A=
>+						  u32 width, u32 height)=0A=
>+{=0A=
>+	return v4l2_find_nearest_size_conditional(s5k3t2_supported_modes,=0A=
>+						  ARRAY_SIZE(s5k3t2_supported_modes),=0A=
>+						  width, height, width, height,=0A=
>+						  s5k3t2_filter_by_link_freq,=0A=
>+						  s5k3t2);=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D container_of_const(ctrl->handler, struct s5k3t=
2,=0A=
>+						   ctrl_handler);=0A=
>+	const struct v4l2_mbus_framefmt *fmt;=0A=
>+	struct v4l2_subdev_state *state;=0A=
>+	s64 exposure_max, exposure_def;=0A=
>+	int ret;=0A=
>+=0A=
>+	state =3D v4l2_subdev_get_locked_active_state(&s5k3t2->sd);=0A=
>+	fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
>+=0A=
>+	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
>+		exposure_max =3D fmt->height + ctrl->val - S5K3T2_EXPOSURE_MARGIN;=0A=
>+		exposure_def =3D min(s5k3t2->exposure->default_value,=0A=
>+				   exposure_max);=0A=
>+		ret =3D __v4l2_ctrl_modify_range(s5k3t2->exposure,=0A=
>+					       s5k3t2->exposure->minimum,=0A=
>+					       exposure_max,=0A=
>+					       s5k3t2->exposure->step,=0A=
>+					       exposure_def);=0A=
>+		if (ret)=0A=
>+			return ret;=0A=
>+	}=0A=
>+=0A=
>+	if (!pm_runtime_get_if_active(s5k3t2->dev))=0A=
>+		return 0;=0A=
>+=0A=
>+	switch (ctrl->id) {=0A=
>+	case V4L2_CID_ANALOGUE_GAIN:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_AGAIN,=0A=
>+				ctrl->val << S5K3T2_AGAIN_SHIFT, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_EXPOSURE:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_EXPOSURE,=0A=
>+				ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_HBLANK:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_HTS,=0A=
>+				fmt->width + ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_VBLANK:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_VTS,=0A=
>+				fmt->height + ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_TEST_PATTERN:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_TEST_PATTERN,=0A=
>+				ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_HFLIP:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_ORIENTATION,=0A=
>+				(s5k3t2->hflip->val ? S5K3T2_HFLIP : 0) |=0A=
>+				(s5k3t2->vflip->val ? S5K3T2_VFLIP : 0), NULL);=0A=
>+		break;=0A=
>+	default:=0A=
>+		ret =3D -EINVAL;=0A=
>+		break;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_put(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static const struct v4l2_ctrl_ops s5k3t2_ctrl_ops =3D {=0A=
>+	.s_ctrl =3D s5k3t2_set_ctrl,=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_init_controls(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	struct v4l2_ctrl_handler *ctrl_hdlr =3D &s5k3t2->ctrl_handler;=0A=
>+	struct v4l2_fwnode_device_properties props;=0A=
>+	s64 hblank, vblank, exposure_max;=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D v4l2_fwnode_device_parse(s5k3t2->dev, &props);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	mode =3D s5k3t2_find_mode(s5k3t2, S5K3T2_DEFAULT_WIDTH,=0A=
>+				S5K3T2_DEFAULT_HEIGHT);=0A=
>+=0A=
>+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);=0A=
>+=0A=
>+	s5k3t2->link_freq =3D=0A=
>+		v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,=0A=
>+				       ARRAY_SIZE(s5k3t2_link_freq_menu) - 1,=0A=
>+				       mode->link_freq_index,=0A=
>+				       s5k3t2_link_freq_menu);=0A=
>+=0A=
>+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE,=0A=
>+			  S5K3T2_PIXEL_RATE, S5K3T2_PIXEL_RATE, 1,=0A=
>+			  S5K3T2_PIXEL_RATE);=0A=
>+=0A=
>+	hblank =3D mode->hts - mode->width;=0A=
>+	s5k3t2->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					   V4L2_CID_HBLANK, hblank,=0A=
>+					   hblank, 1, hblank);=0A=
>+=0A=
>+	vblank =3D mode->vts - mode->height;=0A=
>+	s5k3t2->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					   V4L2_CID_VBLANK, vblank,=0A=
>+					   S5K3T2_VTS_MAX - mode->height, 1,=0A=
>+					   vblank);=0A=
>+=0A=
>+	v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,=
=0A=
>+			  S5K3T2_AGAIN_MIN, S5K3T2_AGAIN_MAX,=0A=
>+			  S5K3T2_AGAIN_STEP, S5K3T2_AGAIN_DEFAULT);=0A=
>+=0A=
>+	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;=0A=
>+	s5k3t2->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					     V4L2_CID_EXPOSURE,=0A=
>+					     S5K3T2_EXPOSURE_MIN,=0A=
>+					     exposure_max,=0A=
>+					     S5K3T2_EXPOSURE_STEP,=0A=
>+					     mode->exposure);=0A=
>+=0A=
>+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+				     V4L2_CID_TEST_PATTERN,=0A=
>+				     ARRAY_SIZE(s5k3t2_test_pattern_menu) - 1,=0A=
>+				     0, 0, s5k3t2_test_pattern_menu);=0A=
>+=0A=
>+	s5k3t2->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					  V4L2_CID_HFLIP, 0, 1, 1, 0);=0A=
>+	s5k3t2->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					  V4L2_CID_VFLIP, 0, 1, 1, 0);=0A=
>+=0A=
>+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &s5k3t2_ctrl_ops, &props);=0A=
>+=0A=
>+	if (ctrl_hdlr->error)=0A=
>+		return v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
>+=0A=
>+	s5k3t2->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
>+	s5k3t2->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+	s5k3t2->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+	v4l2_ctrl_cluster(2, &s5k3t2->hflip);=0A=
>+=0A=
>+	s5k3t2->sd.ctrl_handler =3D ctrl_hdlr;=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enable_streams(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *state, u32 pad,=0A=
>+				 u64 streams_mask)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	const struct v4l2_mbus_framefmt *fmt;=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D pm_runtime_resume_and_get(s5k3t2->dev);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
>+	mode =3D s5k3t2_find_mode(s5k3t2, fmt->width, fmt->height);=0A=
>+=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x6028), 0x4000, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x0000), 0x0005, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x0000), S5K3T2_CHIP_ID, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x6010), 0x0001, &ret);=0A=
>+	if (ret)=0A=
>+		goto err_rpm_put;=0A=
>+=0A=
>+	usleep_range(5 * USEC_PER_MSEC, 6 * USEC_PER_MSEC);=0A=
>+=0A=
>+	cci_multi_reg_write(s5k3t2->regmap, s5k3t2_init_setting,=0A=
>+			    ARRAY_SIZE(s5k3t2_init_setting), &ret);=0A=
>+	cci_multi_reg_write(s5k3t2->regmap, mode->reg_list.regs,=0A=
>+			    mode->reg_list.num_regs, &ret);=0A=
>+	if (ret)=0A=
>+		goto err_rpm_put;=0A=
>+=0A=
>+	ret =3D __v4l2_ctrl_handler_setup(s5k3t2->sd.ctrl_handler);=0A=
>+=0A=
>+	cci_write(s5k3t2->regmap, S5K3T2_REG_MODE_SELECT,=0A=
>+		  S5K3T2_MODE_STREAMING, &ret);=0A=
>+	if (ret)=0A=
>+		goto err_rpm_put;=0A=
>+=0A=
>+	__v4l2_ctrl_grab(s5k3t2->vflip, true);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->hflip, true);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+err_rpm_put:=0A=
>+	dev_err(s5k3t2->dev, "failed to start streaming: %d\n", ret);=0A=
>+	pm_runtime_put_autosuspend(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_disable_streams(struct v4l2_subdev *sd,=0A=
>+				  struct v4l2_subdev_state *state, u32 pad,=0A=
>+				  u64 streams_mask)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_MODE_SELECT,=0A=
>+			S5K3T2_MODE_STANDBY, NULL);=0A=
>+	if (ret)=0A=
>+		dev_err(s5k3t2->dev, "failed to stop streaming: %d\n", ret);=0A=
>+=0A=
>+	__v4l2_ctrl_grab(s5k3t2->vflip, false);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->hflip, false);=0A=
>+=0A=
>+	pm_runtime_put_autosuspend(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static u32 s5k3t2_get_format_code(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	unsigned int i;=0A=
>+=0A=
>+	i =3D (s5k3t2->vflip->val ? 2 : 0) | (s5k3t2->hflip->val ? 1 : 0);=0A=
>+=0A=
>+	return s5k3t2_mbus_formats[i];=0A=
>+}=0A=
>+=0A=
>+static void s5k3t2_format_from_mode(struct s5k3t2 *s5k3t2,=0A=
>+				    const struct s5k3t2_mode *mode,=0A=
>+				    struct v4l2_mbus_framefmt *fmt)=0A=
>+{=0A=
>+	fmt->code =3D s5k3t2_get_format_code(s5k3t2);=0A=
>+	fmt->width =3D mode->width;=0A=
>+	fmt->height =3D mode->height;=0A=
>+	fmt->field =3D V4L2_FIELD_NONE;=0A=
>+	fmt->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
>+	fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;=0A=
>+	fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=0A=
>+	fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_set_pad_format(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *state,=0A=
>+				 struct v4l2_subdev_format *fmt)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	s64 hblank, vblank, exposure_max;=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+	int ret;=0A=
>+=0A=
>+	mode =3D s5k3t2_find_mode(s5k3t2, fmt->format.width, fmt->format.height)=
;=0A=
>+=0A=
>+	s5k3t2_format_from_mode(s5k3t2, mode, &fmt->format);=0A=
>+	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;=0A=
>+	*v4l2_subdev_state_get_crop(state, 0) =3D mode->crop;=0A=
>+=0A=
>+	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
>+		return 0;=0A=
>+=0A=
>+	ret =3D __v4l2_ctrl_s_ctrl(s5k3t2->link_freq, mode->link_freq_index);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	hblank =3D mode->hts - mode->width;=0A=
>+	ret =3D __v4l2_ctrl_modify_range(s5k3t2->hblank, hblank, hblank, 1,=0A=
>+				       hblank);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	vblank =3D mode->vts - mode->height;=0A=
>+	ret =3D __v4l2_ctrl_modify_range(s5k3t2->vblank, vblank,=0A=
>+				       S5K3T2_VTS_MAX - mode->height, 1,=0A=
>+				       vblank);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D __v4l2_ctrl_s_ctrl(s5k3t2->vblank, vblank);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;=0A=
>+	ret =3D __v4l2_ctrl_modify_range(s5k3t2->exposure, S5K3T2_EXPOSURE_MIN,=
=0A=
>+				       exposure_max, S5K3T2_EXPOSURE_STEP,=0A=
>+				       mode->exposure);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	return __v4l2_ctrl_s_ctrl(s5k3t2->exposure, mode->exposure);=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enum_mbus_code(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *sd_state,=0A=
>+				 struct v4l2_subdev_mbus_code_enum *code)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	if (code->index > 0)=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	code->code =3D s5k3t2_get_format_code(s5k3t2);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enum_frame_size(struct v4l2_subdev *sd,=0A=
>+				  struct v4l2_subdev_state *sd_state,=0A=
>+				  struct v4l2_subdev_frame_size_enum *fse)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	unsigned int i, index =3D fse->index;=0A=
>+=0A=
>+	if (fse->code !=3D s5k3t2_get_format_code(s5k3t2))=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	for (i =3D 0; i < ARRAY_SIZE(s5k3t2_supported_modes); i++) {=0A=
>+		const struct s5k3t2_mode *mode =3D &s5k3t2_supported_modes[i];=0A=
>+=0A=
>+		if (!(s5k3t2->link_freq_bitmap & BIT(mode->link_freq_index)))=0A=
>+			continue;=0A=
>+=0A=
>+		if (index--)=0A=
>+			continue;=0A=
>+=0A=
>+		fse->min_width =3D mode->width;=0A=
>+		fse->max_width =3D fse->min_width;=0A=
>+		fse->min_height =3D mode->height;=0A=
>+		fse->max_height =3D fse->min_height;=0A=
>+=0A=
>+		return 0;=0A=
>+	}=0A=
>+=0A=
>+	return -EINVAL;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_get_selection(struct v4l2_subdev *sd,=0A=
>+				struct v4l2_subdev_state *sd_state,=0A=
>+				struct v4l2_subdev_selection *sel)=0A=
>+{=0A=
>+	switch (sel->target) {=0A=
>+	case V4L2_SEL_TGT_CROP:=0A=
>+		sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);=0A=
>+		return 0;=0A=
>+	case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
>+		sel->r.left =3D 0;=0A=
>+		sel->r.top =3D 0;=0A=
>+		sel->r.width =3D S5K3T2_NATIVE_WIDTH;=0A=
>+		sel->r.height =3D S5K3T2_NATIVE_HEIGHT;=0A=
>+		return 0;=0A=
>+	case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
>+	case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
>+		sel->r.left =3D 8;=0A=
>+		sel->r.top =3D 8;=0A=
>+		sel->r.width =3D 5184;=0A=
>+		sel->r.height =3D 3880;=0A=
>+		return 0;=0A=
>+	default:=0A=
>+		return -EINVAL;=0A=
>+	}=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_init_state(struct v4l2_subdev *sd,=0A=
>+			     struct v4l2_subdev_state *state)=0A=
>+{=0A=
>+	struct v4l2_subdev_format fmt =3D {=0A=
>+		.which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
>+		.pad =3D 0,=0A=
>+		.format =3D {=0A=
>+			.width =3D S5K3T2_DEFAULT_WIDTH,=0A=
>+			.height =3D S5K3T2_DEFAULT_HEIGHT,=0A=
>+		},=0A=
>+	};=0A=
>+=0A=
>+	return s5k3t2_set_pad_format(sd, state, &fmt);=0A=
>+}=0A=
>+=0A=
>+static const struct v4l2_subdev_video_ops s5k3t2_video_ops =3D {=0A=
>+	.s_stream =3D v4l2_subdev_s_stream_helper,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_pad_ops s5k3t2_pad_ops =3D {=0A=
>+	.set_fmt =3D s5k3t2_set_pad_format,=0A=
>+	.get_fmt =3D v4l2_subdev_get_fmt,=0A=
>+	.get_selection =3D s5k3t2_get_selection,=0A=
>+	.enum_mbus_code =3D s5k3t2_enum_mbus_code,=0A=
>+	.enum_frame_size =3D s5k3t2_enum_frame_size,=0A=
>+	.enable_streams =3D s5k3t2_enable_streams,=0A=
>+	.disable_streams =3D s5k3t2_disable_streams,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_ops s5k3t2_subdev_ops =3D {=0A=
>+	.video =3D &s5k3t2_video_ops,=0A=
>+	.pad =3D &s5k3t2_pad_ops,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_internal_ops s5k3t2_internal_ops =3D {=0A=
>+	.init_state =3D s5k3t2_init_state,=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_identify_sensor(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	u64 val;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D cci_read(s5k3t2->regmap, S5K3T2_REG_CHIP_ID, &val, NULL);=0A=
>+	if (ret) {=0A=
>+		dev_err(s5k3t2->dev, "failed to read chip id: %d\n", ret);=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
>+	if (val !=3D S5K3T2_CHIP_ID) {=0A=
>+		dev_err(s5k3t2->dev, "chip id mismatch: %x!=3D%llx\n",=0A=
>+			S5K3T2_CHIP_ID, val);=0A=
>+		return -ENODEV;=0A=
>+	}=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_check_hwcfg(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	struct fwnode_handle *fwnode =3D dev_fwnode(s5k3t2->dev), *ep;=0A=
>+	struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
>+		.bus =3D {=0A=
>+			.mipi_csi2 =3D {=0A=
>+				.num_data_lanes =3D S5K3T2_DATA_LANES,=0A=
>+			},=0A=
>+		},=0A=
>+		.bus_type =3D V4L2_MBUS_CSI2_DPHY,=0A=
>+	};=0A=
>+	int ret;=0A=
>+=0A=
>+	ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);=0A=
>+	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=0A=
>+	fwnode_handle_put(ep);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D S5K3T2_DATA_LANES) {=0A=
>+		dev_err(s5k3t2->dev, "invalid number of data lanes: %u\n",=0A=
>+			bus_cfg.bus.mipi_csi2.num_data_lanes);=0A=
>+		ret =3D -EINVAL;=0A=
>+		goto endpoint_free;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D v4l2_link_freq_to_bitmap(s5k3t2->dev, bus_cfg.link_frequencies,=
=0A=
>+				       bus_cfg.nr_of_link_frequencies,=0A=
>+				       s5k3t2_link_freq_menu,=0A=
>+				       ARRAY_SIZE(s5k3t2_link_freq_menu),=0A=
>+				       &s5k3t2->link_freq_bitmap);=0A=
>+=0A=
>+endpoint_free:=0A=
>+	v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_power_on(struct device *dev)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D regulator_bulk_enable(ARRAY_SIZE(s5k3t2_supply_names),=0A=
>+				    s5k3t2->supplies);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D clk_prepare_enable(s5k3t2->mclk);=0A=
>+	if (ret) {=0A=
>+		regulator_bulk_disable(ARRAY_SIZE(s5k3t2_supply_names),=0A=
>+				       s5k3t2->supplies);=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
>+	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);=0A=
>+	gpiod_set_value_cansleep(s5k3t2->reset_gpio, 0);=0A=
>+	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_power_off(struct device *dev)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	gpiod_set_value_cansleep(s5k3t2->reset_gpio, 1);=0A=
>+=0A=
>+	clk_disable_unprepare(s5k3t2->mclk);=0A=
>+=0A=
>+	regulator_bulk_disable(ARRAY_SIZE(s5k3t2_supply_names), s5k3t2->supplies=
);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_probe(struct i2c_client *client)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2;=0A=
>+	unsigned long freq;=0A=
>+	int ret;=0A=
>+=0A=
>+	s5k3t2 =3D devm_kzalloc(&client->dev, sizeof(*s5k3t2), GFP_KERNEL);=0A=
>+	if (!s5k3t2)=0A=
>+		return -ENOMEM;=0A=
>+=0A=
>+	s5k3t2->dev =3D &client->dev;=0A=
>+	v4l2_i2c_subdev_init(&s5k3t2->sd, client, &s5k3t2_subdev_ops);=0A=
>+=0A=
>+	s5k3t2->regmap =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>+	if (IS_ERR(s5k3t2->regmap))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->regmap),=0A=
>+				     "failed to init CCI\n");=0A=
>+=0A=
>+	s5k3t2->mclk =3D devm_v4l2_sensor_clk_get(s5k3t2->dev, NULL);=0A=
>+	if (IS_ERR(s5k3t2->mclk))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->mclk),=0A=
>+				     "failed to get MCLK clock\n");=0A=
>+=0A=
>+	freq =3D clk_get_rate(s5k3t2->mclk);=0A=
>+	if (freq !=3D S5K3T2_MCLK_FREQ)=0A=
>+		return dev_err_probe(s5k3t2->dev, -EINVAL,=0A=
>+				     "MCLK clock frequency %lu is not supported\n",=0A=
>+				     freq);=0A=
>+=0A=
>+	ret =3D s5k3t2_check_hwcfg(s5k3t2);=0A=
>+	if (ret)=0A=
>+		return dev_err_probe(s5k3t2->dev, ret,=0A=
>+				     "failed to check HW configuration\n");=0A=
>+=0A=
>+	s5k3t2->reset_gpio =3D devm_gpiod_get_optional(s5k3t2->dev, "reset",=0A=
>+						     GPIOD_OUT_HIGH);=0A=
>+	if (IS_ERR(s5k3t2->reset_gpio))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->reset_gpio),=0A=
>+				     "cannot get reset GPIO\n");=0A=
>+=0A=
>+	for (unsigned int i =3D 0; i < ARRAY_SIZE(s5k3t2_supply_names); i++)=0A=
>+		s5k3t2->supplies[i].supply =3D s5k3t2_supply_names[i];=0A=
>+=0A=
>+	ret =3D devm_regulator_bulk_get(s5k3t2->dev,=0A=
>+				      ARRAY_SIZE(s5k3t2_supply_names),=0A=
>+				      s5k3t2->supplies);=0A=
>+	if (ret)=0A=
>+		return dev_err_probe(s5k3t2->dev, ret,=0A=
>+				     "failed to get supply regulators\n");=0A=
>+=0A=
>+	ret =3D s5k3t2_power_on(s5k3t2->dev);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D s5k3t2_identify_sensor(s5k3t2);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret, "failed to find sensor\n");=0A=
>+		goto err_power_off;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D s5k3t2_init_controls(s5k3t2);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret, "failed to init controls\n");=0A=
>+		goto err_power_off;=0A=
>+	}=0A=
>+=0A=
>+	s5k3t2->sd.state_lock =3D s5k3t2->ctrl_handler.lock;=0A=
>+	s5k3t2->sd.internal_ops =3D &s5k3t2_internal_ops;=0A=
>+	s5k3t2->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
>+	s5k3t2->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
>+	s5k3t2->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
>+=0A=
>+	ret =3D media_entity_pads_init(&s5k3t2->sd.entity, 1, &s5k3t2->pad);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to init media entity pads\n");=0A=
>+		goto err_ctrl_handler_free;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D v4l2_subdev_init_finalize(&s5k3t2->sd);=0A=
>+	if (ret < 0) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to finalize subdev init\n");=0A=
>+		goto err_media_entity_cleanup;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_set_active(s5k3t2->dev);=0A=
>+	pm_runtime_enable(s5k3t2->dev);=0A=
>+=0A=
>+	ret =3D v4l2_async_register_subdev_sensor(&s5k3t2->sd);=0A=
>+	if (ret < 0) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to register V4L2 subdev\n");=0A=
>+		goto err_subdev_cleanup;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_set_autosuspend_delay(s5k3t2->dev, 1000);=0A=
>+	pm_runtime_use_autosuspend(s5k3t2->dev);=0A=
>+	pm_runtime_idle(s5k3t2->dev);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+err_subdev_cleanup:=0A=
>+	v4l2_subdev_cleanup(&s5k3t2->sd);=0A=
>+	pm_runtime_disable(s5k3t2->dev);=0A=
>+	pm_runtime_set_suspended(s5k3t2->dev);=0A=
>+=0A=
>+err_media_entity_cleanup:=0A=
>+	media_entity_cleanup(&s5k3t2->sd.entity);=0A=
>+=0A=
>+err_ctrl_handler_free:=0A=
>+	v4l2_ctrl_handler_free(s5k3t2->sd.ctrl_handler);=0A=
>+=0A=
>+err_power_off:=0A=
>+	s5k3t2_power_off(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static void s5k3t2_remove(struct i2c_client *client)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	v4l2_async_unregister_subdev(sd);=0A=
>+	v4l2_subdev_cleanup(sd);=0A=
>+	media_entity_cleanup(&sd->entity);=0A=
>+	v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
>+	pm_runtime_dont_use_autosuspend(s5k3t2->dev);=0A=
>+	pm_runtime_disable(s5k3t2->dev);=0A=
>+=0A=
>+	if (!pm_runtime_status_suspended(s5k3t2->dev)) {=0A=
>+		s5k3t2_power_off(s5k3t2->dev);=0A=
>+		pm_runtime_set_suspended(s5k3t2->dev);=0A=
>+	}=0A=
>+}=0A=
>+=0A=
>+static const struct dev_pm_ops s5k3t2_pm_ops =3D {=0A=
>+	RUNTIME_PM_OPS(s5k3t2_power_off, s5k3t2_power_on, NULL)=0A=
>+};=0A=
>+=0A=
>+static const struct of_device_id s5k3t2_of_match[] =3D {=0A=
>+	{ .compatible =3D "samsung,s5k3t2" },=0A=
>+	{ }=0A=
>+};=0A=
>+MODULE_DEVICE_TABLE(of, s5k3t2_of_match);=0A=
>+=0A=
>+static struct i2c_driver s5k3t2_i2c_driver =3D {=0A=
>+	.driver =3D {=0A=
>+		.name =3D "s5k3t2",=0A=
>+		.pm =3D pm_ptr(&s5k3t2_pm_ops),=0A=
>+		.of_match_table =3D s5k3t2_of_match,=0A=
>+	},=0A=
>+	.probe =3D s5k3t2_probe,=0A=
>+	.remove =3D s5k3t2_remove,=0A=
>+};=0A=
>+=0A=
>+module_i2c_driver(s5k3t2_i2c_driver);=0A=
>+=0A=
>+MODULE_AUTHOR("Armandas Kvietkus <armandas.kvietkus@proton.me>");=0A=
>+MODULE_DESCRIPTION("Samsung S5K3T2 image sensor driver");=0A=
>+MODULE_LICENSE("GPL");=0A=
>=0A=
>--=0A=
>2.56.0=0A=
=0A=
The rest of the driver looks good.=0A=
=0A=
Reviewed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
