Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F5361DA9;
	Thu, 27 Aug 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787791367; cv=fail; b=gCKPNMKdfJh4u8GnhAkRJ3joPz5ANAT1KidhBzsfnNPdl267ie8GU4K7uNotrURXTrr5mN0sgtNW7akHQCHq5q1vIAFnZK0QvD3Fom6oJLIi8204s0viFYiKHHDF5boUbRl9ZY1pkfz6zkVYor5mFHMT2/KLtTL4ZwlHUz7g/KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787791367; c=relaxed/simple;
	bh=p899NfdJwnFMmZKLFiahQHs5h8EAczmxNrjz8jngobI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MwTMyAKTnCXw6hX1y8jPFOQcd1AD91USSAdCFU7gnWQ1dQtlPSP4MwHii1RT83dV0ixJ9XjyjXNXVZEYkNUQgr3TYIpX1YJLMjVK/7E+zCBljvR9LTE4XPb6VwuZvMvHqYFlZtkupt5bwvYVJPDW1l4cKxwCp/egE4Rk2hnarhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hl337p3h; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hl337p3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQffWNDhCdysPJXNVo5T6ubs24N+IQfKknQ5xOAJC0ceiHKcDJT9bXbcQSWhkdj2G7nL9zWis+WujPZUNbjMRpNKM4vpGIGLWpDd7sQz4cKNG80I4GCEsful9uvJe1ipE5y6spbHlvMhGBsjdwvjJVxi477BYuXG+2wu1Uc906IeoVbTDFKxqtSqtmWnlnS1eGyDHQxh31VVWLvIEWuxtFqKjF4Bc6vmusPThkisiBK8x+Mf/Q4peYVK/NHxkOdu+MTpG8tG0u0zdC8tEuK/7RJbx/uWj87P3o1tzti7XvRAIlrZVZQErYg2Qrb6RdVEnMnvVEJhFj1Dz3JopuLr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lNMfGdN0AiY6HIywQtth4HSIK1umEahUpGyAAUWmk0=;
 b=tdzShxCc+1kaXccfzRgy724DtqZv3SypPzRlrylxFer9pg4IzlfB/gknxFn6IMG5e7vGCqFLwPpcsAu+OiOHUVGU7Wv1AVHI+xP8KK3lWbCOeVfLFckKxfROpPz5oMUNUEOCp1AjhYLO/mKvz0/3iHipzty6KNhj80gJaLMuSGErQQ9SVpBSqSyvxq8LpZp7rTBidvYXFCGzU+cqXRmo1BZjIbs3DCYl9R2KO3WNC0MS3Z1xhBluxRJ4FvTrXvZvSwTmUObw/e+vDmOxu6lFEO2ZuZdSSAY+mZ+1UvKmMf9a9hoN+IEwZOB4MViMyvFxBCDi09kVo5VD01kCWLBQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lNMfGdN0AiY6HIywQtth4HSIK1umEahUpGyAAUWmk0=;
 b=Hl337p3hS0gaUuXIibpUIpf0bwR0hzHd7t6rc8HM2KPyJNQ4Hopn58MtJzkHZmQFGjYIpIm44ga0ZDEpAVcjGKhLJodGFXmHfwiPj2uY6aLw+I2UN0rBpTbnMFzl7ebifQGocsGBXe1FxqGzpr5NgYaoTGf851UZZkgZt0+u54yAki2RTf7HpMxRYyC5FyUTqVqUwIgy+aKsHY/AG8Jr/OChkhE5XPWKce91AwzId34pzeAW6YP7S03sTjTSV/gaeU1VB9aDQzsBarjCUXeFB1XsbVRADpAZ+JCDV9cSEAtzPPfavW4Fl9CfXIPUWVob5G8Y6ckegPCFzpivN5tlvw==
Received: from MRWPR04MB11999.eurprd04.prod.outlook.com (2603:10a6:501:94::21)
 by VI0PR04MB12211.eurprd04.prod.outlook.com (2603:10a6:800:334::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 00:42:38 +0000
Received: from MRWPR04MB11999.eurprd04.prod.outlook.com
 ([fe80::7ffb:d155:57d1:767f]) by MRWPR04MB11999.eurprd04.prod.outlook.com
 ([fe80::7ffb:d155:57d1:767f%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 00:42:38 +0000
From: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Hongxing Zhu (OSS)"
	<hongxing.zhu@oss.nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux@ew.tq-group.com"
	<linux@ew.tq-group.com>, Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH v2 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System
 RAM overlap
Thread-Topic: [PATCH v2 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window
 System RAM overlap
Thread-Index: AQHdMS93DTedmeVLJECtr692Jn/3P7aolX0AgAiB+6A=
Date: Thu, 27 Aug 2026 00:42:38 +0000
Message-ID:
 <MRWPR04MB119993B450D7A20DBEB08E4488CAD2@MRWPR04MB11999.eurprd04.prod.outlook.com>
References: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
 <20260821054334.1277088-2-hongxing.zhu@oss.nxp.com>
 <aohk6D8ay79lGAtw@SMW015318>
In-Reply-To: <aohk6D8ay79lGAtw@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB11999:EE_|VI0PR04MB12211:EE_
x-ms-office365-filtering-correlation-id: 4d02c5cb-8283-4b4e-0e63-08df03d41833
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|19092799006|23010399003|376014|1800799024|38070700021|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 zesmi4jPG9yKDyqcMQbjJk3JmU6VVXV8RJupV0KDIf4sLfy7/tWbxMqPzN07imRv+WkRW+qMk6U9eskYT3Rg0nhJwwhpifanSoJw8YOlZ0znE1PtCnQRH7WZLbOiOfKJuCe39/4JTfkWg4s5xqrOrDnrfqOIFnxInxoWjs65L3/AXZ080g97NhzSKgS0Y1u4/T2U7KomfdUFF5RO5Tx4I+Ob5m7/VkllM8yzgsjN0Ng0ryzGI9+QEbtrDGC5+uotz4LBV8EoKroIkqDMif8+0RC7xhZd73PL7227jbGTBrayeuA7xI31LzDCewlgVZTu7l/oZVJBuvvlt50OyUwqV6C6Qt9MQOCS7Ql0cNQtFd/57FukMp6IxoAdjynroSaLxskzTp2Y/pGrdPtrWjRxPFE5Se3VxUuwjH/ota/vPX4UBhyX2RNo8okosLgWU/J5R3Wg1jQ0t58+j7sRAMfT6Zco+NHr8cxT/+UHMDX6zbpcn2r/4wgwbV5f5GC9CEUhmqBbLyXl8DDKp4H7LbHjbrRHSmUveVf48Qdn9sj+kzcdX/3dM4JnN8P1HFWAkhP4zVNkXRQ+HPVZZojT9hdT2zRCtKTkyytZkuHH8YR9lNpQoQKkMEOPtW4DITmOprkmauBX0h97pgh95SEzTKHY7rjzdPQR8ioYF8CKeSlqgnt1axQuNvIE1BJQ5jdZCA7FXCum5+SgpQ2JQ/7y+HevBROkUNQzg1t0R6r8Scq5vAU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB11999.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(23010399003)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HbkmF3Gg8WY10+m7xEKvzWXyPBbp8mVit8awfOPqk9rg/y3h7oWlVBAN+88g?=
 =?us-ascii?Q?91DmTcmhfjazyFQOyEosYd+aibWqjRYrtGxIx0BulBn2KCflt6O+I/MaJlNr?=
 =?us-ascii?Q?Lzd68xr35LDYFE5awOcq1/XRixc8jncqQG+yWmgrgXVI9T+ixncjxoBwgnkC?=
 =?us-ascii?Q?nUC9fwiHW9Lg5ybwAsiPkAYEFZVeGupsVpP54OouTA1y3eK1UbclWAmVOemL?=
 =?us-ascii?Q?NoVHgegqKZr78xz6LcLkvx7spe3pjv3Lq6v50Izlj7+ejP3qQ/R76crKrgZG?=
 =?us-ascii?Q?yTvfS9GimnoFlyXPfZSu5oPh+TDG51ccclH7zM0hOwM1fBH7yYlJmbAK41Xu?=
 =?us-ascii?Q?6cGnGYxJYkC/dKclv4N1RLTl1DE/DTt32uuiHoi82hwmd4OkhFRg/oFzT4ds?=
 =?us-ascii?Q?QgwfOkFiTVhg6hEX+1DJHpAEpl3qv1ioSYcZTZohCEh8wquGiWaph09w/pQi?=
 =?us-ascii?Q?NawinWwKgzHKGgXmWP0Ui6cKPY56/nfMWTinu85XdAqIE6RPfZzaPpyjm95H?=
 =?us-ascii?Q?yexFM4Z6G8MLUjYqWcoD2QL6k7tM6TBcremEbS95WCJaA1pNq/Xf4iu5NpaB?=
 =?us-ascii?Q?yT0KrMF3rBcJWs/eTcUJayfb/dEfrt/1n8Bba6lF4F16UQ4oF/2mte7RowNJ?=
 =?us-ascii?Q?vCQo3M02azZ6FkQQqPsHrXawrDXmMpCx5KRPhwHBDABk8Uzybczowmf6vYLG?=
 =?us-ascii?Q?OEKcu0Hgq9xQgX7m6Xz9RQ755ntNE93uxZf5qtL+U2EPFKKS0iVjCvVPdgpf?=
 =?us-ascii?Q?hXaZhNlNX7vm73eL8OH9axvV7bTHPESGH9R25RM0vO/3lOLTsJiMTcKl1A/x?=
 =?us-ascii?Q?TAPU2l/Uba0LFk7lGiYOZAEjJycsdQ1z38O1nA7D9kAMLtnA1CEb/CEL3s4o?=
 =?us-ascii?Q?zQecUvPGsInLRqfNdXhBfvMe6NIrMhWMXZEgZWfIrBokndilzakXwEPKnxF+?=
 =?us-ascii?Q?uZWhXqnsCQRU2EhL1vBbKpKVdAuDudNmWJt9V7FM6pqAq3SyBHu17H780B1O?=
 =?us-ascii?Q?Jk0slkfr2ZOXfIp+FYRL32qQ3uShFyISf9FURTH+aiCKxJHrJuNvyFgQF8Wq?=
 =?us-ascii?Q?ixzX6U5P9F+/iLSOBJ/9iEAvtqPCRpQ0SyRbrf75vlxT2CvMQYQqkwvyKQWD?=
 =?us-ascii?Q?u1dkIcavbkYMM+Ub3eWqDWJH4Mg+MXcU13grXY2DZzaV272JGzPY1OeDZbKs?=
 =?us-ascii?Q?nmrstnktfZWT75ItzKtNfUK+qg0yMS9NgMOh2BPA74jKbGMPJku3zfYeFDdF?=
 =?us-ascii?Q?4XHOAHHCftaj53TBQUGT6HOVSpOOY4bKXpeHXF4m0ikr9kJDymjRX6aPEyzL?=
 =?us-ascii?Q?StOink/lAabRBtv7uSJqukmX43GWqeGK6Peuoc6y7juoo2cpFajGh5+ftty3?=
 =?us-ascii?Q?DMrqHreB6cutEMqFg7oZBBEaUJZyNi6HVf8cVAk5mUS31RjhPoDKuUokFU9Y?=
 =?us-ascii?Q?46eN4a4TDxfLLsCBNmEw+PF2P0ACJRQnjUNRR9DJi9fCZjgTg8g0ZVnF5a1P?=
 =?us-ascii?Q?Ht/eSHvlFv5UeRs83ZDRkdMlpTFwCNb1+LUUtscl2WE+bPAvEED4NUvMO3/M?=
 =?us-ascii?Q?z8s+sszmODug+s3EtHOnarJU4oEqdhpwLuiVmn1U9k0zB0AeI6xn4ZTHh7ZN?=
 =?us-ascii?Q?TzkFBdhjhaBFyoTGkPiFa7Cd71cKsguHAwsnIUalsgF7h8LTmjaSHXkz2ntC?=
 =?us-ascii?Q?hHOAThFGvDFy31Jhrfcbw2nKzSZNfw6nw7rCQk5Dz0xDYPpdZTdSzZnupLLX?=
 =?us-ascii?Q?t7OZ/E1hWQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB11999.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d02c5cb-8283-4b4e-0e63-08df03d41833
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 00:42:38.3442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byQcxG05ESrE0cB0jo5IJhh6xdBB7+yCOXpwHtYuTCdHvYTcPWh7ATf/KWWDFh9GK3ns+/O4N/E41cSh+Q/H1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12211

> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: Friday, August 21, 2026 10:47 PM
> To: Hongxing Zhu (OSS) <hongxing.zhu@oss.nxp.com>
> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; Frank Li
> <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
> kernel@pengutronix.de; devicetree@vger.kernel.org; imx@lists.linux.dev; l=
inux-
> arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux@ew.tq=
-
> group.com; Hongxing Zhu <hongxing.zhu@nxp.com>
> Subject: Re: [PATCH v2 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window
> System RAM overlap
>=20
> On Fri, Aug 21, 2026 at 01:43:32PM +0800, hongxing.zhu@oss.nxp.com wrote:
> > From: Richard Zhu <hongxing.zhu@nxp.com>
> >
> > Move the PCIe non-prefetchable memory PCI bus address from 0xe0000000
> > to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
> > reserved and safe to use.
> >
>=20
> If you agree, I put layerscape discussion link at here when apply
>=20
> link: https://lore.kernel.org/imx/753fca23-c3eb-45e3-aeac-
> b7b248fa723a@app.fastmail.com/ [1]
I'm total agree with it. Thanks.
BTW, sorry to rely late.

Best Regards
Richard Zhu
>=20
> Frank
>=20
> > Fixes: dbecf38e60d4e ("arm64: dts: imx95: Correct PCIe outbound
> > address space configuration")
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 38fc47024841f..0f03b85aaec17 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
> >  			      <0 0x4c340000 0 0x4000>;
> >  			reg-names =3D "dbi", "config", "atu", "app";
> >  			ranges =3D <0x43000000 0x9 0x00000000 0x9
> 0x00000000 0x0 0xe0000000>,
> > -				 <0x82000000 0x0 0xe0000000 0x9
> 0xe0000000 0x0 0x10000000>,
> > +				 <0x82000000 0x0 0x10000000 0x9
> 0xe0000000 0x0 0x10000000>,
> >  				 <0x81000000 0x0 0x00000000 0x9
> 0xf0000000 0x0 0x00100000>;
> >  			#address-cells =3D <3>;
> >  			#size-cells =3D <2>;
> > @@ -2039,7 +2039,7 @@ pcie1: pcie@4c380000 {
> >  			      <0 0x4c3c0000 0 0x4000>;
> >  			reg-names =3D "dbi", "config", "atu", "app";
> >  			ranges =3D <0x43000000 0xa 0x00000000 0xa
> 0x00000000 0x0 0xe0000000>,
> > -				 <0x82000000 0x0 0xe0000000 0xa
> 0xe0000000 0x0 0x10000000>,
> > +				 <0x82000000 0x0 0x10000000 0xa
> 0xe0000000 0x0 0x10000000>,
> >  				 <0x81000000 0x0 0x00000000 0xa
> 0xf0000000 0x0 0x00100000>;
> >  			#address-cells =3D <3>;
> >  			#size-cells =3D <2>;
> >
> > base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
> > --
> > 2.34.1
> >
> >
