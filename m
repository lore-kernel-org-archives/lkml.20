Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020140.outbound.protection.outlook.com [52.101.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F662F8E91;
	Wed, 30 Sep 2026 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776062; cv=fail; b=X68rChYTZg8UKBGY/X7ZpoLBgiRKVJ5b0GXtQNAcrxHaQ5/vMgU/n5FrwvfqAqV5286IKGaao2QJ27MYqseyhNuo0ePFTg05YDpCV4AgNs7IbwgYP3n0pZVlnxPTe8oTu91fSRGLimh/ywbqUkklKX5DrpSEQgbc6ZaFNVqQ/GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776062; c=relaxed/simple;
	bh=q3s6DGEObISewH/XX2gLTqFl5rPruspfwUBBjsj5KeY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KiLRpxHMG3v8VtM3quu35yRzPtnUCMKd3pVJnjA6VdHbDgFIGOIVefSbFVm/NiaO8VWu63kpUP0kflDhMYd60wKodvf7KA7jVXusort33Gw/roJKZMjtYYwpC9bEcyTrF0FH061pH+FLcxYmqRi3lG8ITAHleVFP0Q13n9ZzN04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=PQswSa39; arc=fail smtp.client-ip=52.101.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="PQswSa39"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHcTnNR6LAbb0nG76JGXR/ydPpA/+Nm4e4xkaulNpZLATmIcZ8lry4PPwHU1N2b6T5tgqV1jZoNu6pJoCtypWanb49NoTnfdGbDrgIBBlaLgbQHyWZWhPtdf5eKJ8LDqnOSBR6Bap/BL5Sc68trilPteUBDHBYn6gicvbnSAdlUXlN0g8ddgfiiYgbPslMYWU/XZIghKbdfozgoqd5pnmV9nOz7HptpXFja+cFJC/2Njy7wAZL6FfVNkDngzpGhioHhesQ3pYo/EdaPOkEDJxR4hYakdTJ0jgfi1shPgmpaQONzeGCa6znLMw8hwH3jvkUWKNr0oyN1c6vt4LSZbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQZPL3isgr/8n2vpa0sU0Q3CTxXPJUSHXysqoC4GlRs=;
 b=VHEVSRpbU6H638G0UnITNr4R6d2rxeGUkfaIKYXGdlptG0jGxsUKYqRxq/PL/7kZ/IBPd/HlKwJ8iSzpcywN6rT8/gJ1wDoP8DdkHhYAM9hcDICBI4ruOSVtqEXnlhK9LjWFWP7FfUXSGsrPfOsWAOiVhYMc4X0TaLtzYqOBMKRJ1MjQvX+RxDZHjQ/wXTiyhpBQXhi0l9FiSSc2YG4NCovltx/Kc7sJR3ILkNKjp9aaTJndW7Pc89GFxoq8lg48oA5O7gCa2A997hirV483y0t3l8kwGj7tDeZdL9igjBOBmhK5qB5q3c036uhkCWgzoYAt4x1J4uWsZVdcojun5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQZPL3isgr/8n2vpa0sU0Q3CTxXPJUSHXysqoC4GlRs=;
 b=PQswSa39Ev7IqgA2IQNj1Vy1GxmLjW11Tjrz4EAqecTI0josunLLfuy179gyd+FIGoNkeSRKp6/0ady5PY5ajGz0UnwDqXyYuNybDQYioGUTe0CiZ12S31zepOeCXqM3grBenPWl60K5RkWlYlYbJAcqfHrWG5QwjbrN8sKKj3YO6yHrTi3Sb2S7xRVX41t5tin3QMnM0d2jl+ug9xdRr2lPQEWCn9IydaC7JEts9ijJrFqq7HlO0sY014qhO7FMznAUoBSa64Xemnyn7o8+svByb9EgMg49G5D+NQL83pUuQSZ5LizOYZ7iuLMNT4L3P8nY40ChpCfYI4EgPorKYg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB2053.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 13:47:22 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0451.014; Wed, 30 Sep 2026
 13:47:22 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kieran
 Bingham <kieran.bingham@ideasonboard.com>, "jai.luthra"
	<jai.luthra@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Philippe Baetens <philippebaetens@gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Thread-Topic: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Thread-Index: AQHdUMo4rVRTjcvjQEC54POlPihIBrbm/ntd
Date: Wed, 30 Sep 2026 13:47:22 +0000
Message-ID:
 <PN3P287MB1829832B0C6C42441B18D9D18B8B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
In-Reply-To: <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB2053:EE_
x-ms-office365-filtering-correlation-id: adc586d1-3490-4faf-e338-08df1ef95aa2
x-ld-processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|10067099003|56012099006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 2YxcgjIPqIw2ylDnZ6wSN/XShakM5KSlbzekiZ6JW5FQjG0IntjL3RDPUtjGNYBY15CiHY2wbUXXNl3OVjY1nQGtk6fz/gRITVIWSI0FTS2ESurfoU0lbIxYlm06Pf6SH9bpttITEYesLI9e1JqpBQCl9mpO+5S6h7qD5sKSMKkXnayNyPf/HwIFxA/h8Cf6adP3U3pY8Lz2MF1vev0VARs1y8SENCRiRcMD+/wa4D59Set0kma3zqITVx059T/FArCUt1leJB6QURmwCVkFQ8MCKyOYPSSfk+5vHMetme2MkV6rBQR7gMX3LcdoIROVms9K6DBLWijOL/8V7EbjrcjiS1lrj5mvaz57jWPQ0U0Bcr2Cc0Od5ExdefsRE82K+p4OCEmh+UkKRgXzcSc+9CpHhjZs07cpmSPI8h9vBmtnwYQHGXA1Wc/0TLOjPZIDjNsTIVq9WBD1MR1IEmuKpWXR7rXpUzk9d0D3dUtMHOo5nU6XUdRke9L4ON5sWZSz13RfkpahHRgXbHhplC5LVz90xObfzUJbb+w0eloNU30FbsHUhPtzH14JVVWthIc+p+ljQVq5w7llZ5G+WjhK2DIaJB9BP3k2fIpWpG4Ew89dVXFIlaxv704awGOsY4BzvF3Cs1+mhgjQBhymwDYrkgU2ior1VIxJYwv3ERJ5w6k9F6tQSx8CuT06R4GdxofsaaY0YTmj9CaeLiqiCb4WAYOozGmpFEcHf61qKafPvjo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?yeIEu8Ktb4PH5DosQh/LzEG4qaP3Ct2OIjYA48pTFZ2984qVJEJh6HtY?=
 =?Windows-1252?Q?UPxqQ54GW6MGnUxrLvfZLagtH1WWVF4ciM7BbpJ0j4BTnrIjDH095JSZ?=
 =?Windows-1252?Q?rdwBaAzHBshitsceO6lNJYV5G8VDkIuG1ukwUAXZ/hGS6BYrJwISu5yx?=
 =?Windows-1252?Q?+i4PbMxQgTP1Zo3MmSQ3yt/b7aw6TFqPO6JYBS+TGcufpyAqHFhmxdzz?=
 =?Windows-1252?Q?N7EOcn9ZHEjQMjruswtb68OfbkiZ5d41McZFVi/LDn7JOhEy0nNciZN1?=
 =?Windows-1252?Q?GYR/wKrCygwYhRYpqgppUME9tDOwKzfupwjex/SZ2Ndhda4RX63LSW6V?=
 =?Windows-1252?Q?TGe7OVIOYXVlHxHT0PG+M575e7w56wTv7fnu82gLkuFGE6xC378ZisdL?=
 =?Windows-1252?Q?NANuFjNCwSClTpSdok8odDgSuVYa9KUVGn8TNesuF/HeInUb5/ep7AgH?=
 =?Windows-1252?Q?+jXAJpH63mBmCC2G5pN/hYC617pSd72Xfw8CbFzhRr2J/ahE4F/li0Q0?=
 =?Windows-1252?Q?Y6AerdgxsgQupK7/7Kyy3Oo/etTIenVrcNoEWsBS3q6VmXrOngRCVWiD?=
 =?Windows-1252?Q?wizu/Ry0itk3cmgxLzqcbdNxsrdq1VUmCTruiS/is+lxV2NUCBA///3f?=
 =?Windows-1252?Q?Gbvm2wAoO2VXGiWvddvvXs2+LBRddaj8VLkZ5WqytyvcDXHyZ39BdwDz?=
 =?Windows-1252?Q?sJziR0ncPP44OOFJSmw9icKLieNWAHwKXebAwRWCSsaFtmw0s17NwWJz?=
 =?Windows-1252?Q?t+3Ins87XcVxuTnxhB+djfwfxtTf6GufTKuJxN0qJFZWlwBrIE105XHe?=
 =?Windows-1252?Q?cXldelPS2dFbLD3CJenOHcEKPoOFJ+BP4K9PH6VIseZtM4azmZv3mVSm?=
 =?Windows-1252?Q?4BimDNXzgEvZbzzmNUd7nqlCiaRakSKHLgcnahrEvJobLh1wNZN9N1/0?=
 =?Windows-1252?Q?U+8oNM8t5OTL+t8lCqeMYTGSUUnqy/MBpQKzSipijqlxN2+EzpJHbJkx?=
 =?Windows-1252?Q?TTJXx19gjq3e3AS3p08+4ardDI8mk7JADG3nbhsfvBq9nZMVVM6IS9tW?=
 =?Windows-1252?Q?KkTcRII10yHJG+LHLMX4jWF7OP0NpE7ksQk6Wm0PHbb+yZ6h+9Fu3Ihs?=
 =?Windows-1252?Q?tNIfIcpso/0D2G2+kTD0AE7tIu1qAxker6EdnZls3dHk5WLgdVcNopJ7?=
 =?Windows-1252?Q?NrsgVg95sDVrspJNMH4yy7HlcPfNjSaIu3svW6wIFtDVHLzR7mycfBRn?=
 =?Windows-1252?Q?yl+ZKTDznntemHgAibHAdRyrhas0czC2JOlbDnRrKzL0LroJ6zYpGSjn?=
 =?Windows-1252?Q?MlzD33O9G0/TvtRP7fZlgTFg5vzx2pdmH5JhsxIl3FODvJBJlzivt6fk?=
 =?Windows-1252?Q?2R74kI9AztNCqo/jwR42KoJAiJuRkoAwtuE76N52+nRldJjfBKYRxkai?=
 =?Windows-1252?Q?KRgEDxfh54JOdkCfVUXSmkCcp7v0gYvOCKQtFse82K47LMPGcz615Txx?=
 =?Windows-1252?Q?tyPMKFsOx6J6GCWdre07SoF36DDBBUGuFCK3IiBNGOazW7JRD/I47dAS?=
 =?Windows-1252?Q?t1udbH+FdCRyRPb9UMV0jFg4BRrOKWPNuxehu16Enp+iNZa+mEy2eJ5b?=
 =?Windows-1252?Q?3xcQifhzdP2mRvy2Tv6CK0wazK8miZpyqzM2FLLo+VYdLWurcwXUj7w1?=
 =?Windows-1252?Q?LL5pDd+q+OXcUqkXv2Kl6Ebcob9skKN0nmSyUZoW0NeCGrNaqX4nwf9l?=
 =?Windows-1252?Q?Or4Aau1y/Olvw/ej7gEipEw1XcEaY8kWlATgX3ddUvISwPFzz+LohB7Z?=
 =?Windows-1252?Q?lpLCjoulbLU9il4h5xw+CxKP0plPZpqu13qClW6LhHKEn5LDSe95FbPw?=
 =?Windows-1252?Q?8vQmIQD7Ja+PX6ow6kFXBGcWvBgBEmRYdBw=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adc586d1-3490-4faf-e338-08df1ef95aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 13:47:22.5591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3vJtoVnzyLCl4bDc4Ej//fdciNXI17HK6vHi0K/e9NPMFPdPHzy+W2J9wHy636JnL834lU1PXrsP4PYMEWfHanSbYixLicZzex/YAxZcfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2053

Hi Jacopo,=0A=
=0A=
I noticed a few issues. Could you please check the comments below?=0A=
=0A=
> Add driver for the ams OSRAM Mira016 sensor.=0A=
>=0A=
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>=0A=
> ---=0A=
>  MAINTAINERS                 |    1 +=0A=
>  drivers/media/i2c/Kconfig   |   12 +=0A=
>  drivers/media/i2c/Makefile  |    1 +=0A=
>  drivers/media/i2c/mira016.c | 2309 +++++++++++++++++++++++++++++++++++++=
++++++=0A=
>  4 files changed, 2323 insertions(+)=0A=
=0A=
...=0A=
=0A=
> +/* Register select. */=0A=
> +#define MIRA016_BANK_SEL_REG           CCI_REG8(0xe000)=0A=
> +#define MIRA016_ACTIVE_CONTEXT_REG     CCI_REG8(0x4002)=0A=
> +#define MIRA016_NEXT_ACTIVE_CONTEXT_REG        CCI_REG8(0xe003)=0A=
> +#define MIRA016_RW_CONTEXT_REG         CCI_REG8(0xe004)=0A=
> +#define MIRA016_AUTO_SWITCH_CONTEXT_REG        CCI_REG8(0xe005)=0A=
> +#define MIRA016_PARAM_HOLD_REG         CCI_REG8(0x0006)=0A=
> +#define MIRA016_DISABLE_CONTEXTSYNC_REG        CCI_REG8(0xe008)=0A=
> +#define MIRA016_DISABLE_CONTEXTSYNC    BIT(0)=0A=
> +#define MIRA016_CMD_REQ_1_REG          CCI_REG8(0x000a)=0A=
> +#define MIRA016_CMD_HALT_BLOCK_REG     CCI_REG8(0x000c)=0A=
=0A=
A few of these macros are unused. Can we remove them?=0A=
=0A=
> +=0A=
> +/* Chip id */=0A=
> +#define MIRA016_CHIP_ID_REG            CCI_REG8(0x011B)=0A=
> +#define MIRA016_CHIP_ID                        33=0A=
=0A=
...=0A=
=0A=
> +static const struct cci_reg_sequence mira016_8b_fine_gain_init[] =3D {=
=0A=
> +     { CCI_REG8(0xe000), 0x0 },=0A=
> +     { CCI_REG8(0x01bb), 0xb4 },=0A=
...=0A=
> +     { CCI_REG8(0xe000), 0x1 },=0A=
> +     { CCI_REG8(0xe000), 0x1 },=0A=
> +     { CCI_REG8(0xe024), 0x3 },=0A=
> +     { CCI_REG8(0xe000), 0x0 },=0A=
> +     { CCI_REG8(0xe000), 0x0 },=0A=
> +     { CCI_REG8(0xe000), 0x0 },=0A=
> +     { CCI_REG8(0x005c), 0x0 },=0A=
> +     { CCI_REG8(0x005d), 0x18 },=0A=
> +     { CCI_REG8(0xe000), 0x0 },=0A=
> +};=0A=
=0A=
I noticed some registers are written multiple times within each=0A=
of these arrays. Are all the repeated writes required, or can=0A=
the redundant ones be removed?=0A=
=0A=
Like for the above array 0xe000 register.=0A=
=0A=
> +static void mira016_update_pad_format(struct mira016 *mira016,=0A=
> +                                     struct v4l2_mbus_framefmt *fmt, u32=
 code)=0A=
=0A=
third argument is unused. Can we remove it?=0A=
=0A=
> +{=0A=
> +       unsigned int i;=0A=
> +=0A=
> +       for (i =3D 0; i < ARRAY_SIZE(mira016_mbus_formats); ++i) {=0A=
> +               if (mira016_mbus_formats[i] =3D=3D fmt->code)=0A=
> +                       break;=0A=
> +       }=0A=
> +       if (i =3D=3D ARRAY_SIZE(mira016_mbus_formats))=0A=
> +               fmt->code =3D mira016_mbus_formats[0];=0A=
> +=0A=
> +       fmt->width =3D MIRA016_PIXEL_ARRAY_WIDTH;=0A=
> +       fmt->height =3D MIRA016_PIXEL_ARRAY_HEIGHT;=0A=
> +       fmt->field =3D V4L2_FIELD_NONE;=0A=
> +       fmt->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
> +       fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;=0A=
> +       fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=0A=
> +       fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int mira016_set_pad_format(struct v4l2_subdev *sd,=0A=
> +                                 const struct v4l2_subdev_client_info *c=
i,=0A=
> +                                 struct v4l2_subdev_state *state,=0A=
> +                                 struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +       struct mira016 *mira016 =3D to_mira016(sd);=0A=
> +       struct v4l2_rect *crop;=0A=
> +       u32 pixel_rate;=0A=
> +       u32 min_vblank;=0A=
> +       u32 gain_max;=0A=
> +       int ret;=0A=
> +=0A=
> +       mira016_update_pad_format(mira016, &fmt->format, fmt->format.code=
);=0A=
> +       *v4l2_subdev_state_get_format(state, 0) =3D fmt->format;=0A=
> +=0A=
> +       crop =3D v4l2_subdev_state_get_crop(state, 0);=0A=
> +       crop->width =3D fmt->format.width;=0A=
> +       crop->height =3D fmt->format.height;=0A=
> +       crop->left =3D MIRA016_PIXEL_ARRAY_LEFT;=0A=
> +       crop->top =3D MIRA016_PIXEL_ARRAY_TOP;=0A=
> +=0A=
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> +               return 0;=0A=
> +=0A=
> +       /*=0A=
> +        * Update the row length: changing the image format implies chang=
ing the=0A=
> +        * row_length parameter, which changes the line duration and the =
pixel=0A=
> +        * rate consequentially. Also, changing the image format changes =
the=0A=
> +        * analogue gain limits.=0A=
> +        *=0A=
> +        * Do not allow to change image format while the subdevice is str=
eaming.=0A=
> +        *=0A=
> +        * TODO: row length depends on binning, update it also in the=0A=
> +        * implementation of set_selection.=0A=
> +        */=0A=
> +       if (v4l2_subdev_is_streaming(sd))=0A=
> +               return -EBUSY;=0A=
=0A=
State is overwritten before the streaming check, so a failed call=0A=
with -EBUSY still changes the active format.=0A=
=0A=
Should we move this check to the top of the function and only check=0A=
it for V4L2_SUBDEV_FORMAT_ACTIVE?=0A=
=0A=
> +=0A=
> +       switch (fmt->format.code) {=0A=
> +       case MEDIA_BUS_FMT_Y8_1X8:=0A=
> +               gain_max =3D ARRAY_SIZE(mira016_gain_lut_8bit);=0A=
> +               break;=0A=
> +       case MEDIA_BUS_FMT_Y10_1X10:=0A=
> +               gain_max =3D ARRAY_SIZE(mira016_gain_lut_10bit);=0A=
> +               break;=0A=
> +       case MEDIA_BUS_FMT_Y12_1X12:=0A=
> +       default:=0A=
> +               /*=0A=
> +                * TODO: Clarify how to handle 12 bit 2x fixed gain which=
=0A=
> +                * changes the line timings while streaming. Only allow 1=
x=0A=
> +                * for the time being.=0A=
> +                */=0A=
> +               gain_max =3D 1;=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D __v4l2_ctrl_modify_range(mira016->gain, 1, gain_max, 1, 1=
);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       mira016_calc_row_length(mira016, state);=0A=
> +=0A=
> +       min_vblank =3D mira016_calc_min_vblank(mira016, crop->height);=0A=
> +       ret =3D __v4l2_ctrl_modify_range(mira016->vblank, min_vblank,=0A=
> +                                      MIRA016_MAX_VBLANK, 1, min_vblank)=
;=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       pixel_rate =3D mira016_calc_prate(mira016, crop->width);=0A=
> +=0A=
> +       return __v4l2_ctrl_modify_range(mira016->prate, pixel_rate, pixel=
_rate,=0A=
> +                                       1, pixel_rate);=0A=
> +}=0A=
> +=0A=
> +                                 u64 streams_mask)=0A=
> +{=0A=
> +       struct mira016 *mira016 =3D to_mira016(sd);=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);=
=0A=
=0A=
We can use mira016->dev directly instead &client->dev.=0A=
=0A=
> +       int ret;=0A=
=0A=
...=0A=
=0A=
> +static int mira016_disable_streams(struct v4l2_subdev *sd,=0A=
> +                                  struct v4l2_subdev_state *state, u32 p=
ad,=0A=
> +                                  u64 streams_mask)=0A=
> +{=0A=
> +       struct mira016 *mira016 =3D to_mira016(sd);=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);=
=0A=
=0A=
same here.=0A=
=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static int mira016_init_state(struct v4l2_subdev *sd,=0A=
> +                             struct v4l2_subdev_state *state)=0A=
> +{=0A=
> +       struct v4l2_subdev_format fmt =3D {=0A=
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
> +               .pad =3D 0,=0A=
> +               .format =3D {=0A=
> +                       .code =3D MEDIA_BUS_FMT_Y8_1X8,=0A=
> +                       .width =3D MIRA016_PIXEL_ARRAY_WIDTH,=0A=
> +                       .height =3D MIRA016_PIXEL_ARRAY_HEIGHT=0A=
> +               },=0A=
> +       };=0A=
> +=0A=
> +       mira016_set_pad_format(sd, NULL, state, &fmt);=0A=
> +=0A=
> +       return 0;=0A=
=0A=
You can directly return the result of=0A=
mira016_set_pad_format() here.=0A=
=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct mira016 *mira016 =3D=0A=
> +               container_of(ctrl->handler, struct mira016, ctrl_handler)=
;=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);=
=0A=
=0A=
we can use mira016->dev directly instead &client->dev.=0A=
=0A=
> +       struct v4l2_subdev_state *state;=0A=
> +       struct v4l2_rect *crop;=0A=
> +       int ret =3D 0;=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&mira016->sd);=0A=
> +       crop =3D v4l2_subdev_state_get_crop(state, 0);=0A=
> +=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               s32 exposure_max =3D crop->height + ctrl->val=0A=
> +                                - MIRA016_FRAME_INTEGRATION_DIFF;=0A=
> +               s32 exposure_def =3D min(exposure_max,=0A=
> +                                      mira016->exposure->val);=0A=
> +=0A=
> +               ret =3D __v4l2_ctrl_modify_range(mira016->exposure,=0A=
> +                                              mira016->exposure->minimum=
,=0A=
> +                                              exposure_max,=0A=
> +                                              mira016->exposure->step,=
=0A=
> +                                              exposure_def);=0A=
> +               if (ret)=0A=
> +                       return ret;=0A=
> +       }=0A=
> +=0A=
> +       if (!pm_runtime_get_if_in_use(&client->dev))=0A=
> +               return 0;=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_EXPOSURE:=0A=
> +               ret =3D mira016_write_exposure_reg(mira016, ctrl->val);=
=0A=
> +               break;=0A=
> +       case V4L2_CID_VBLANK:=0A=
> +               ret =3D mira016_write_frame_duration_reg(mira016, state, =
ctrl->val);=0A=
> +               break;=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               ret =3D mira016_write_analogue_gain(mira016, state, ctrl-=
>val);=0A=
> +               break;=0A=
=0A=
Why do you not introduce vflip and hflip controls here?=0A=
=0A=
> +       default:=0A=
> +               ret =3D -EINVAL;=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_put_autosuspend(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int mira016_init_controls(struct mira016 *mira016)=0A=
> +{=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);=
=0A=
=0A=
we can use mira016->dev directly.=0A=
=0A=
> +       struct v4l2_fwnode_device_properties props;=0A=
> +       struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> +       struct v4l2_ctrl *link_freq;=0A=
> +       struct v4l2_ctrl *hblank;=0A=
> +       u32 min_exposure_lines;=0A=
> +       u32 def_exposure;=0A=
> +       u32 min_vblank;=0A=
> +       u32 def_vblank;=0A=
> +       u32 pixel_rate;=0A=
> +       int ret;=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static u8 mira016_m_to_pll_m(u32 pll_m)=0A=
> +{=0A=
> +       /* Table 12: Lookup table for =93M to PLL_DIV_M=94 mapping */=0A=
> +       static const struct pll_m_div {=0A=
> +               u8 m_min;=0A=
> +               u8 m_max;=0A=
> +               u8 pll_m_min;=0A=
> +               u8 pll_m_max;=0A=
> +       } pll_m_lut[] =3D {=0A=
> +               { 16, 31, 224, 239 }, { 32, 63, 192, 233 },=0A=
=0A=
I=92m not sure, but I think 233 might be a typo and should be 223,=0A=
Since the m range and PLL code range don=92t match.=0A=
=0A=
> +               { 64, 127, 128, 191 }, { 1285, 0, 127 },=0A=
> +       };=0A=
> +=0A=
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(pll_m_lut); ++i) {=0A=
> +               const struct pll_m_div *p =3D &pll_m_lut[i];=0A=
> +=0A=
> +               if (pll_m > p->m_max)=0A=
> +                       continue;=0A=
> +=0A=
> +               return p->pll_m_min + pll_m - p->m_min;=0A=
> +       }=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +               for (m =3D MIRA016_PLL_M_MIN; m < MIRA016_PLL_M_MAX; ++m)=
 {=0A=
> +                       u32 pll2 =3D pll1 * m;=0A=
> +=0A=
> +                       if (pll2 < MIRA016_PLL_PLL2_MIN ||=0A=
> +                           pll2 > MIRA016_PLL_PLL2_MAX)=0A=
> +                               continue;=0A=
> +=0A=
> +                       if (pll2 =3D=3D target_mbps) {=0A=
> +                               found =3D true;=0A=
> +                               break;=0A=
> +                       }=0A=
> +=0A=
> +                       if (abs(pll2 - target_mbps) < best) {=0A=
=0A=
Since these are unsigned int values, it would be better to use=0A=
abs_diff() instead of abs() here.=0A=
=0A=
> +                               n_best =3D n;=0A=
> +                               m_best =3D m;=0A=
> +                               best =3D abs(pll2 - target_mbps);=0A=
> +                       }=0A=
> +               }=0A=
> +               if (found)=0A=
> +                       break;=0A=
> +       }=0A=
=0A=
...=0A=
=0A=
> +static int mira016_get_regulators(struct mira016 *mira016)=0A=
> +{=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&mira016->sd);=
=0A=
=0A=
We can remove this as well.=0A=
=0A=
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(mira016_supplies); i++)=
=0A=
> +               mira016->supplies[i].supply =3D mira016_supplies[i];=0A=
> +=0A=
> +       return devm_regulator_bulk_get(&client->dev,=0A=
> +                                      ARRAY_SIZE(mira016_supplies),=0A=
> +                                      mira016->supplies);=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static int mira016_probe(struct i2c_client *client)=0A=
> +{=0A=
> +       struct device *dev =3D &client->dev;=0A=
> +       struct mira016 *mira016;=0A=
> +       int ret;=0A=
> +=0A=
> +       mira016 =3D devm_kzalloc(&client->dev, sizeof(*mira016), GFP_KERN=
EL);=0A=
> +       if (!mira016)=0A=
> +               return -ENOMEM;=0A=
> +=0A=
> +       mira016->dev =3D &client->dev;=0A=
> +=0A=
> +       ret =3D mira016_parse_endpoint(dev, mira016);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       v4l2_i2c_subdev_init(&mira016->sd, client, &mira016_subdev_ops);=
=0A=
> +=0A=
> +       mira016->regmap =3D devm_cci_regmap_init_i2c(client, 16);=0A=
> +       if (IS_ERR(mira016->regmap))=0A=
> +               return dev_err_probe(dev, PTR_ERR(mira016->regmap),=0A=
> +                                    "failed to initialize CCI\n");=0A=
> +=0A=
> +       mira016->xclk =3D devm_v4l2_sensor_clk_get(dev, NULL);=0A=
> +       if (IS_ERR(mira016->xclk))=0A=
> +               return dev_err_probe(dev, PTR_ERR(mira016->xclk),=0A=
> +                                    "failed to get xclk\n");=0A=
> +=0A=
> +       mira016->xclk_freq =3D clk_get_rate(mira016->xclk);=0A=
> +       if (mira016_validate_xclk_freq(mira016)) {=0A=
> +               dev_err(dev, "xclk frequency not supported: %d Hz\n",=0A=
=0A=
Please use dev_err_probe.=0A=
=0A=
> +                       mira016->xclk_freq);=0A=
> +               return -EINVAL;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D mira016_get_regulators(mira016);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");=0A=
> +=0A=
> +       mira016->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",=0A=
> +                                                     GPIOD_OUT_HIGH);=0A=
> +       if (IS_ERR(mira016->reset_gpio))=0A=
> +               return dev_err_probe(dev, PTR_ERR(mira016->reset_gpio),=
=0A=
> +                                    "failed to get reset gpio\n");=0A=
> +=0A=
> +       /*=0A=
> +        * Calculate the PLL configuration based on the link frequency=0A=
> +        * selected by .dts and compute the sensor timing bases.=0A=
> +        *=0A=
> +        * Initialize row_length to a value matching the default format f=
or=0A=
> +        * exposure and frame time limits calculations.=0A=
> +        */=0A=
> +       mira016_pll_calc(mira016);=0A=
> +       mira016_timings_calc(mira016);=0A=
> +       mira016->timings.row_length =3D 1262;=0A=
=0A=
1262 doesn=92t match any of the supported formats. Is this a typo?=0A=
Should it be 1062 instead?=0A=
=0A=
> +=0A=
> +       ret =3D mira016_power_on(dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       /* Enable runtime PM and power on the device */=0A=
> +       pm_runtime_set_active(dev);=0A=
> +       pm_runtime_enable(dev);=0A=
> +=0A=
> +       ret =3D mira016_identify_module(mira016);=0A=
> +       if (ret)=0A=
> +               goto error_power_off;=0A=
> +=0A=
> +       ret =3D mira016_init_controls(mira016);=0A=
> +       if (ret)=0A=
> +               goto error_power_off;=0A=
> +=0A=
> +       /* Initialize subdev */=0A=
> +       mira016->sd.internal_ops =3D &mira016_internal_ops;=0A=
> +       mira016->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
> +       mira016->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
> +=0A=
> +       /* Initialize source pads */=0A=
> +       mira016->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=0A=
> +       ret =3D media_entity_pads_init(&mira016->sd.entity, 1, &mira016->=
pad);=0A=
> +       if (ret) {=0A=
> +               dev_err_probe(dev, ret, "failed to init entity pads\n");=
=0A=
> +               goto error_handler_free;=0A=
> +       }=0A=
> +=0A=
> +       mira016->sd.state_lock =3D mira016->ctrl_handler.lock;=0A=
> +       ret =3D v4l2_subdev_init_finalize(&mira016->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err_probe(dev, ret, "subdev init error\n");=0A=
> +               goto error_media_entity;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D v4l2_async_register_subdev_sensor(&mira016->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err_probe(dev, ret,=0A=
> +                             "failed to register sensor sub-device\n");=
=0A=
> +               goto error_subdev_cleanup;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_set_autosuspend_delay(dev, 1000);=0A=
> +       pm_runtime_use_autosuspend(dev);=0A=
> +       pm_runtime_idle(dev);=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error_subdev_cleanup:=0A=
> +       v4l2_subdev_cleanup(&mira016->sd);=0A=
> +error_media_entity:=0A=
> +       media_entity_cleanup(&mira016->sd.entity);=0A=
> +error_handler_free:=0A=
> +       v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);=0A=
> +error_power_off:=0A=
> +       pm_runtime_disable(dev);=0A=
> +       if (!pm_runtime_status_suspended(&client->dev))=0A=
=0A=
Could we use dev here as well, just for consistency?=0A=
=0A=
> +               mira016_power_off(dev);=0A=
> +       pm_runtime_set_suspended(dev);=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static const struct of_device_id mira016_dt_ids[] =3D {=0A=
> +       { .compatible =3D "ams,mira016" },=0A=
> +       { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(of, mira016_dt_ids);=0A=
> +=0A=
> +static struct i2c_driver mira016_i2c_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "mira016",=0A=
> +               .of_match_table =3D mira016_dt_ids,=0A=
> +               .pm =3D pm_ptr(&mira016_pm_ops),=0A=
> +       },=0A=
> +       .probe =3D mira016_probe,=0A=
> +       .remove =3D mira016_remove,=0A=
> +};=0A=
> +=0A=
> +module_i2c_driver(mira016_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");=0A=
> +MODULE_DESCRIPTION("ams OSRAM MIRA016 sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
>=0A=
> --=0A=
> 2.55.0=0A=
=0A=
Best Regards,=0A=
Tarang=
