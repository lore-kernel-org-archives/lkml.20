Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794819614;
	b=ZkJFhe+4FSktlPupqvho04K9fNZdPG6JlBrwDYPFkkw0o13AG93b+WUjDyB0x8x8rlbk
	 OneUWBYXx6u9t24NujrlgsRaXV1caVlnJCZlK525fZ7E3KSB3sHvMuiKpsSLZ040VgJW8
	 +gM9mSn2WGId0heAJC8+RTEwzRTAlqBnRFdokO077Ms5GmtKeFyTiKP7lTf4l9ZfKTKGO
	 lZwYfR0GpFAt4kHianw1pexJgTX3i1vRPq5R8jfJBTuUcUnzp3uBXDfgTVddJoRiIRL++
	 F636N5p8r3xoSIRJpAkPdGHDRitdRm7VPph38TpO/xpUfICCOFH06vRa1ayJmbtcPvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819614;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=epdpfmxJRLinhPgmekq10RcckKmetcaK+nqi+xRGVTE=;
	b=bV20UYBtyOysgdNhWE8Z3Vn+vU4qsKNbeATetGUSUt09z0g7o+kqHvoHqJ4vLz+mlvzD
	 zI7racqelAC6jxsh/TdOpQxNkpq17y8ob9Rp9i9Oj4VGDcCh5/OP4FvbfaI+8ZzHdlSih
	 HKmBtgl6nso0jarWbDPpOUejGZLsvgTBHUJ46lGE77MM/aPt8fJbjD6kE2qbQiXtfPp/B
	 WURm3ru8bWFUlJ3EtrtmN95XxR67QNkWJIJTtte2F9goMKJjvnjX0BUsgI3JGNPDIeNFY
	 BLXgI1v0IjZFxorCSVGpiHOzXce/HRJeixJz8n+uvl1AFVLHan5S+F2XGE9JTwlJB+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=CR4Lhh+S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.0
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD18606A32F;
	Mon, 16 Nov 2026 09:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD18606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=CR4Lhh+S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSOp0Q0LBhm0SZF4V0DQZ5O6QzYM6E7x5b3DGJ7ynngq7Tx6AKr9/e7Z6leusHuWpJB4JRLP6WxM4lNTHlX+qbYzJgKYnkyyGV4Or+YYeGkvqm+wUe/QXTn6yb8ih3Rm8PJ6WR0TDaC3VAl3lOXmcF4R2KI7rf42GUFcZYuy450UCs4rimUIXlTWLL2VjtOC11L70krBlM7h254TfW2NgHZ34PeT+wyKt0RuwOcvb6ldtXGhZRG2T20YV3tWo9mY3MrfSUYkE/LyKYP2QX/tC4tkZ3Ey/ydw9897rQACGe3wdWEPf0wUGY0abkHlcEzoYHvy3WJ9TDmtVDzl9dti+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epdpfmxJRLinhPgmekq10RcckKmetcaK+nqi+xRGVTE=;
 b=s+tcrJsDMiHGr3e4ORCA8I43sfnRViKFHNDVtgsuoWey7lpnxNmkKFRixdNmx/YECkrZj1BYYWV3yW0OX84FtMEX+nYrnL+OQR8gNWwHKF1F7xDEdmyBJeZl6Qkaq/xVu7yXiNXfSGGZv1t5cGyO4GqOSsSTceXQAoI6eLVv/TpO6V4HcdjYQ17O/SyxahYe4oAHh0gNTDdVRaOMWdlYJqbuKhaHuFlnyI49J6HqjdhiO0dYs+G+Z4fhAHOG6Q4iDhI2D0HknoB23ZmLz5E8eFVZbwGSgLqtAnpmKAtDm1mEhgEHG/oCcBpra/6hZMKA3zjBDZbeMLjnq6Bazpo/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epdpfmxJRLinhPgmekq10RcckKmetcaK+nqi+xRGVTE=;
 b=CR4Lhh+SpJcNLRDy6AJExH2fqrLa89ocYgIG1rpOeE/Ik8cVokYoVzyVFHm0u20E7pWgTGOWt03J1MUptk6BOReZtJm9V0MED3OrcdTUIMsw3FGZPxLmnpxjWTJeeNta1CLSYxnC1LnjztYnaO0/9i7ojBS0eiNkYMZHyN2RxVQ=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by OS3PR01MB8873.jpnprd01.prod.outlook.com (2603:1096:604:155::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:00:11 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:00:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Nhat Tran <nhat.tranminhk2@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module
 autoloading
Thread-Topic: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module
 autoloading
Thread-Index: AQHddaa5NxpTPTNuIEGKD9UTze5aULcwY71A
Date: Mon, 16 Nov 2026 09:00:11 +0000
Message-ID:
 <TYYPR01MB660390413BAEDD7B2475BEBA867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261116084426.103863-1-nhat.tranminhk2@gmail.com>
In-Reply-To: <20261116084426.103863-1-nhat.tranminhk2@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|OS3PR01MB8873:EE_
x-ms-office365-filtering-correlation-id: 7007d725-b909-478d-e1f9-08df43c0058b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022113327099003|261021121427099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 C777tHdZWl8m18KNSfH7VCJhbTUyu0NnY9PbJHwuBckd5MIWSEzEdxHkpBl6wHXytXiNBEmY3toY1Jm2TwoqTRH/XTxJ/62JLywBDbzOjEIU1FR4X+qjGeybuKDlKfCokNWFSa/sAlLUaxt+VVWzPUt9TmDe1V0TTvFql4dO4cUdBmDxD94MC3JiAE5tVCVFY/JDk41pKgNG2/y1ylotvjiTz4zDd7HZnnJ2W40QRsr8mLAfE1nzM190GuAVYAXQzY10LYudF0t8IR79cXqXnKGvqUcRQLnZkSqnt4MokxjEberDVUofFzEPcdEvZdeQGbKSetvw8jbYxK0Afk/CLVCDYxfbxyURqYRFMPXYGm+r+kihztbWCF90MYS0KwhNuwFJlgeKS2wtScTn//JJW9ey7MDeIubW+dZuSqFBwV8biliLO0AwMFGl8YegerZ2cRN2K1oKDJOYPnEbPZxfYJLlqp3By2LYDZ8dZ/EbHFjFyyhf1J1xCFH95ZV8QCK++PWfRrvF0AJ/+A9HIj7P0rWGOPawF643xT1IPz8ukTjePfGE2lFgwkxPJcwRCd+r6HGQxPF/uCq5rdbMSuCEQTGcFDP6RIfwDaUR7mkQgEx3xUy4OjkO5B3miL3QL9SEVzwFIbdHeQohKTVqgHYQN34s1rjJ9YHyOmN0V1ilEGc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8VyOZvV7tVFrq8phP9g8WmrTp2DurrhADFFCzgGkCcXAEXyeIU3zWy9zrkNi?=
 =?us-ascii?Q?p3ugBPZqCQdyMxP8xZIYNiO02dBcK55s4DtotyOPCMNwedvDRj1KFhFNrnVi?=
 =?us-ascii?Q?GJDVbxhKdSrwNr6NlqRZwSqBnZci8MP0/sTh9PYUY78z3OuwoyaoYZHofSEw?=
 =?us-ascii?Q?71ALmufrUQL2lVQ+fmEcLrWq2qP1S4Nay7msnuiI/M55kYn58zKZy9ssr33t?=
 =?us-ascii?Q?QFFe/ppRhVrLUcI4HHcgRC0LOB0iWimGShQIIxNvrg6EqEMew7bog1LEKdhw?=
 =?us-ascii?Q?jzs0b5uKdNM8IZWBWk+rjhyhCtwNILOON3eqTBndVTNUHDv5Vsg5nFmKGaeR?=
 =?us-ascii?Q?u9jlDpw4UQWxjV2vukZiLlT8l924SmBkteSuhg2aZsxu8ilQ6WWLEroUcnDx?=
 =?us-ascii?Q?GdoWOZtB3uREb/mCGPCJOQ47MbQM1QOXQNGM/Vi7SqeE0jPgJbC2BCJMkdJR?=
 =?us-ascii?Q?VNGlsmcd3MKGkF1piElw2wJd87U/uSDpL2onzJZdfTl4z+z05It8PhOf3clO?=
 =?us-ascii?Q?0s69n9KvhCR9FZK8VuQqQdM6zcq7NqeHrs5ijWMNyFOOtydSaUlDcB4AVPjq?=
 =?us-ascii?Q?5S//kMJbvN2NVm2xHH28VUvNIPVdPdySOCx+6CZ6Adb4WD7x6/QESii7l1Pu?=
 =?us-ascii?Q?1Mgwh874G0OigR42NGnNQSVbV+MwH1IYyDj3DIMrFCg40fuLjtvr3Co/lCg4?=
 =?us-ascii?Q?aJ2Ap5+kwpRo2iUDtC430dTHhgwav9eQq7IJLiQAvpVKSd1png/SBpSsIu1P?=
 =?us-ascii?Q?p+TI8YUL/xsgDiUl9X2nsc/izE3EF7pmy363u2n1GjG4vSoDh+n7QNAafNYO?=
 =?us-ascii?Q?qQYQytwA5YVXRFDjKUEFnc2icBi1Xm6VFUT8mQA2EKxQCIkGwdxM1iXrRBVg?=
 =?us-ascii?Q?Q2nkf0n9fewxv5O2BAofe0J0OEapdL1K1Joj7euiukrCdT0S8IaJrCn7HEMe?=
 =?us-ascii?Q?SsYuWGC0aYEXAQBP8heImoIYtnuF9YgoVEGTzH4C/XdIGlX6//gBW50n7zEX?=
 =?us-ascii?Q?ODLEus+UtoSQtI5TFMK8Fh8v6wTVTVTM0lwn2rpbjPk/J5XB607HT+xVSmP9?=
 =?us-ascii?Q?Pi/YBIF9i8LrVMt2Em9Jbkt1E6V2y2Cg/7oqVWfdSI0gvnVX+omokVgVUZlt?=
 =?us-ascii?Q?+HBya8W5wuaqSRvwYPM7BNhMCNAak9V3oedqkoLYZntOsbOrKsRYFm/j7VgH?=
 =?us-ascii?Q?MtcaeKzppkYeeueM3OlE8+5Lnj1odMzGjSyeCxVSFQZqVWPB5UhL0uP6Akft?=
 =?us-ascii?Q?OhcmMxlO7G0P4oi/CvFZPHks3Z11mjIFbPBAi1qM5llo26NndgURMEGq41yq?=
 =?us-ascii?Q?Mak/a7UBGNHxq5ZcaPO3LAwaC/bV/oxl5ZStldgWDskcwD9KZZ8rNEEHR271?=
 =?us-ascii?Q?sfjcuU6Dzxi5uu+b84sn1i6/cgvWG6A6JhKNmpKugfKHd7KwGeDLfVEMF4kM?=
 =?us-ascii?Q?gL9NRDkTyqsCa+bxcAN7IK9Yv4fxzo6tnPAAJcp94eAZSSe7IWu9lR9Hzbi9?=
 =?us-ascii?Q?DmavS7kTgI0PBLz3iX9tQxAr9ZV16S6sMoPIPetlIcBrr/bEul9Mho5++aST?=
 =?us-ascii?Q?5uplcsTA/0/dob7iwU1cM/iiJo5dAzv7KftMFKytLUF8FmLtVqmkMj5m4eKX?=
 =?us-ascii?Q?i9JfJBtwYf2noJjUNtEBG6z6rEcKWm8rsQlxnwSQCVrsKpHfQVAZkPFTg8QV?=
 =?us-ascii?Q?PT+Py5EEGEQ8BrF+KdMX1a+Y0yiHhdz8dPb2XLeAnAwAAOlYDgaOR1AV8Rkk?=
 =?us-ascii?Q?1A2Ps+NTtg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7007d725-b909-478d-e1f9-08df43c0058b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:00:11.5171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2kDnpGx/9SP39IvJtoFgq0yrUswSZFD47HS6qFJYLhcSwPobDQiWeCWsrEGq/AKHARmdOtYbuUZN7TV5GpQYB5DlXDcP145VarIZ5Sc8W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8873

Hi Nhat Tran,

Thanks for the patch.

> -----Original Message-----
> From: Nhat Tran <nhat.tranminhk2@gmail.com>
> Sent: 16 November 2026 08:44
> Subject: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module autolo=
ading
>=20
>=20
> The driver can be built as a module, and Kconfig makes it a module by def=
ault when
> RESET_RZG2L_USBPHY_CTRL is a module. However the driver has neither a pla=
tform_device_id table nor a
> MODULE_ALIAS(), so no module alias is generated and udev never loads it.
>=20
> The device is created by the rzg2l-usbphy-ctrl reset driver with
> platform_device_set_of_node_from_dev(), which marks the OF node as reused=
, so the uevent carries the
> platform modalias "platform:rzg2l-usb-vbus-regulator" rather than an OF o=
ne.
>=20
> Without the regulator, the USB0 PHY waits forever for its vbus supply, an=
d the whole USB0 port stays
> unusable. On an RZ/G2L SMARC EVK:
>=20
>   # cat /sys/kernel/debug/devices_deferred
>   11c50100.usb    platform: supplier 11c50200.usb-phy not ready
>   11c50000.usb    platform: supplier 11c50200.usb-phy not ready
>   11c60000.usb    platform: supplier 11c50200.usb-phy not ready
>   11c50200.usb-phy
>=20
> Loading the module by hand makes all of them probe.
>=20
> Add a platform_device_id table and export it with MODULE_DEVICE_TABLE() s=
o that the module is loaded
> automatically.

A patch is already mainlined [1] with these changes as part of RZ/G3L regul=
ator support.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3De0d3ff3fe71b2773913c43e5f759473cd003c9af

Cheers,
Biju

>=20
> Fixes: 84fbd6198766 ("regulator: Add Renesas RZ/G2L USB VBUS regulator dr=
iver")
> Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
> ---
>  drivers/regulator/renesas-usb-vbus-regulator.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/reg=
ulator/renesas-usb-vbus-
> regulator.c
> index 9ba791bd72ec..65a58bf5ffa4 100644
> --- a/drivers/regulator/renesas-usb-vbus-regulator.c
> +++ b/drivers/regulator/renesas-usb-vbus-regulator.c
> @@ -55,12 +55,19 @@ static int rzg2l_usb_vbus_regulator_probe(struct plat=
form_device *pdev)
>         return 0;
>  }
>=20
> +static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] =
=3D {
> +       { .name =3D "rzg2l-usb-vbus-regulator" },

Have you tested this patch properly?=20

I had an issue in probing the device related to id_table match due to strin=
g length
restriction in [2]

[2]https://elixir.bootlin.com/linux/v7.1.2/source/include/linux/mod_devicet=
able.h#L604

Cheers,
Biju

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
> +
>  static struct platform_driver rzg2l_usb_vbus_regulator_driver =3D {
>         .probe =3D rzg2l_usb_vbus_regulator_probe,
>         .driver =3D {
>                 .name =3D "rzg2l-usb-vbus-regulator",
>                 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>         },
> +       .id_table =3D rzg2l_usb_vbus_regulator_ids,
>  };
>  module_platform_driver(rzg2l_usb_vbus_regulator_driver);
>=20
> --
> 2.25.1

