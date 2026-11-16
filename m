Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794819977;
	b=LuZ7OGf2HKbwYylzYdexzuvkSyzLMXnqiy8d9qZ+zwmjIf1xeiRU3H2KdMaCAx3A6Lxn
	 ipV60RpSeUrGo/rGtB7pUy54n4ehIqIk7ZTu9wcPaW5AhGDkmXzCj8I3Tbcv0dZNqYfxd
	 1pRpqawcw7y5bMxIdj3GdUC9S9gehl7KIHdXIMVNC7G1W95lmi7ejBby0cEM99tWLQxZ1
	 roRgZcF8AXcQOxtmNtWU4cqJk7bvxRf1SuL5KNZyyqL8SYoZ+2wKAP/UQknRBN0/lcg8v
	 X8tQxxBHyemtvYXzyn2U7E5xidFxBXgZKqRn4gE1ThUv8P1JM1CaCt98S/fbAeRCo8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819977;
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
	bh=bj1saj8vPi5Aiw80rHGDqnu+64R7YS5JFy70TTaclnk=;
	b=izWWPfbT03UeozuQE2bMV4BNd+cM1MezHzv+u7gvgCfh1PMXBp4HILNL6SHzjh2A/DX5
	 gS56HfeyNmA5C74RV90B8vVAh2Klo/gHMXGsm9tHfGEMZIiCIeZO29tP9WGYqlEGrT1Ff
	 Sc8fk4i0vlTV/XeDf7h0U/D5zBPsKMjSKPxcqKJpLOq9eUxDAzU+UNtYoaG7D57Q5pK22
	 W5oKz/RepJVCVdhH6GywiDp/LoJ/m4XLSgZTK7qftqeH3XeY0hnK9yK+LISh8dZZztwVp
	 FzwtYQ6lccvKu1pXV7V6q99HNfJ7RJ1fMb9BiFOaoWq2Z879ZAOYMlqCpylbQOJ6a6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ckag48wM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.9
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F5606A31C;
	Mon, 16 Nov 2026 09:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 469F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ckag48wM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRWY+E2daXpzidvJX+O0GmkZKFY+X3LbgzPwRMBAHhRsdZZxTj9ada4ZyM146pJbigzfzmb/JL10sNIYYAl4Lt/vf8NsEED3NJtGsKE+dJ5l9qbC3J5+WA8NqyjgCGg4IrcwSdKwt3o3mghuIRVTgUsEakEQHL4X0THqPuxmaMf1JxmGZW0YZXejU6RXl37hUj2bNLMjFJ7z64RR7gwQoc1LNaEes6MycgFe/QSWP5AajhFN3RKmAvZ4MV5H78sBd86SHBgqHKDBPys5MqmAHd6r43PsUBictJ30U3L6O6dGv8RWKSHn0Vy0N208zlGYeP3SgvfnGZH0lBErleO99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj1saj8vPi5Aiw80rHGDqnu+64R7YS5JFy70TTaclnk=;
 b=Dj9ypvAUMyEo+TtqF/m7qCpLqANHz6J31QjE4y/g2RkV97U55VW2vODBpwmi+MrcOagZWl8IDCRB6YURv4M9VAve2uk7vvcHZJBi9Zp7ZAiDqUWhah+fqa5wQRz+GEnQn8oSHjuNXUylsy994vSLRudjy81EEBokb7RpehW5QraONYBOvSWhSBfxTiwmBplDVTKicNYcT6Y8ll3cmslfAwQqEhH94gR3JKRZmgNG3DMpgm7dSoYyaFwXM/ILIFkDVWKRXrQhENZilU+6c/wtB6cmVREZBTuiru5KQST+WsrlRdiBjY+2L88LgDJv7nasVGSvB7hQGG2SfC42WkIRtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bj1saj8vPi5Aiw80rHGDqnu+64R7YS5JFy70TTaclnk=;
 b=Ckag48wMoBVISi+UgZ3NueJ3Us/cXH4mxPUpcuayI45/WB8yfioGUmKJb13H+Qj5xLhy2lXulJB+zuOOMY2Y2YZ2mY45Rln70REbhrE9FVS2AWutKV6N2IPRawKF+/WN9XMQRKB+Jb3hJlOBJSGM30hSvrmug2xYix0MYSebwPw=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TYWPR01MB11706.jpnprd01.prod.outlook.com (2603:1096:400:400::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:06:11 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:06:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Nhat Tran <nhat.tranminhk2@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module
 autoloading
Thread-Topic: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module
 autoloading
Thread-Index: AQHddaa5NxpTPTNuIEGKD9UTze5aULcwZttA
Date: Mon, 16 Nov 2026 09:06:11 +0000
Message-ID:
 <TYYPR01MB66035439726639C9F4C2A5B9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261116084426.103863-1-nhat.tranminhk2@gmail.com>
In-Reply-To: <20261116084426.103863-1-nhat.tranminhk2@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TYWPR01MB11706:EE_
x-ms-office365-filtering-correlation-id: 03f6ac71-bbbc-495e-a554-08df43c0dc3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022113327099003|261021121427099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 hqDp1zjjy8vapD61k05mCkGNO4NFy+P1y4MCppW7O8HrCAGn/Dtn7nOQCApf4HO/a6Rn9gT2kvMomMTaq9KSZXXrilkpX47xGXXtb7Uq9GACQpO7tWcJ1Ty/BaQDc4H/vzCNmtOA72tm4hyFuTR3qvmeKvvCdoTAh4aq7JRiu8Z9ZHT2+226XgLLmisM5ePsfxZWqZ92ANtuR/qP1uVN8b+vg84YGA6G49x9fz17Cf6ZRvvftYGmLd9y/oduxKVwho9YP6HYwXc9AkAsflki7zFKwZddGI05Nmz5yxbylgw7YcSWllB4/n09kboa4QmHGrJU7/f1yimAD8x8qQSySnwUNYq2QRp8M7h92Rs9wNDMuHpdzjvWUFsuLgEz0m5vNd5NV7ySW4QGE3CO8IurYilV2Od+xlR9S5CYlxJ6v5GQLMXPCtI+dB+VoINejGjok8O144cMuLM4v/LmGTFfB3aTwkuzyHd/SLWS4VeIeWXSqaLBL32kHUxvMSDN8B+M1977Sw/F9VYma5fsfeGyG7F76dobvF1rJ9KCDpXrA9UkiRGYXyzWFDMONLMkYTVtmyPk7V61WDpN2aLAfk/85HGCyXUpQp7LFMiZkvq5aRggtzV6aTpHEbdEVikaEDVx6l/0kdnOfngW3Ye8408FelcV5NluRJ4Z3XAKxbB8ZNE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gEEIoauu+8JKj+OeZU8RzU6VU+yB7W5VtCYnctAXYHh0IApn0tcp4vf+qTRN?=
 =?us-ascii?Q?oVwPle63fci46aRHIW8kvwiCWAnimYYZnspKhaEMgVlruAzEWsDh15ga4X9U?=
 =?us-ascii?Q?HKcDELEJkhx6YSMeTLLMZIsEIJPEFkAZahB1pfy8oSZGw2IHWnOcib+oyo5u?=
 =?us-ascii?Q?HGAkBwjGxotqdK9lSQsGHy8HW7dOAHhFAV8ienIGXa4OsCXcRvhbemaG334N?=
 =?us-ascii?Q?19Q9+KSoPAnXRepf8wwcB1AXlZvwlVGDluzAkjVNWsZaIzft/E9N08cexYR+?=
 =?us-ascii?Q?8Mb9U1+Zk3/NlO8tVfPfg48yPilcPLlm17H/oQmnXjoZkobuwwsuiQK3tnnr?=
 =?us-ascii?Q?hAGBKzulVMh2jynFCC2hLtppdUy0zdxo8U/Ct3eSm1qnEG8vi7Pljd/uqKVJ?=
 =?us-ascii?Q?0M56ZRqZykqKO8Rpbxeyw3HtXGDATWQNdgECNzsOdFBXBthPtJDfmqSQM3aU?=
 =?us-ascii?Q?XV+SqaEUEeGD8AWhBv1o6xU8L30MbHe8TTF4YpBs3lWeHZNpgPv21XQ4h2uI?=
 =?us-ascii?Q?1I+Wg9ZpLanm7OND9MktqOCe6NA3+OkqhdbjIvwPj7vnmW8P9L/eHtszD9BA?=
 =?us-ascii?Q?KcDPL99yukGGo6KObUsquqCHlSI5BylMMDtAzXnjqlPxU8msafRUneYOyLW3?=
 =?us-ascii?Q?b7NvSSYJdaROMPlUbhL5j4p+ZqU6ucl28fGgy+pLC3CaG2b0MWdq1NvLrDyE?=
 =?us-ascii?Q?THa9016qWk/9s+77uJ/IJxp9U+I7jbFin/2Xaab3cr/W3NqPf/XgIdmzHR9w?=
 =?us-ascii?Q?XslR+PrsVgtYF12mZenN279CgJgbQSIwqnHpbw3GNBOm8dhpvoT+5lvD6WKz?=
 =?us-ascii?Q?xv5uFXRp+Y53w6dn3JZ+fGBmRUiTKiPkDfEcwD46uMLL8Sv6T6skKTRWulXk?=
 =?us-ascii?Q?IfdEFdh2O13q6mCM5H6GpXpL5IBVt+eEyVVnWQPVvCNrpuPA2IjagN/T9sdu?=
 =?us-ascii?Q?PGN1/2TsYhfOSPVV5ioEcaXdE0JbaaCx/ShU8C9siZ0LUoU+PricWcmZPq8Q?=
 =?us-ascii?Q?h0Wr54A7aum6sPsNyonpBXi2f2bpIgmNgWh9Q9ubRjU4lv/CbJ/wMM10sOzy?=
 =?us-ascii?Q?vsIYR0r91QG+zNO6KMdyLkYJPqD9ZoroCYRuJ8zn3Anm+wX5UpMPvMmPpxRf?=
 =?us-ascii?Q?nnSvdrVu0YehnHnIIwotL6sapUOKAyg5QzXg/Xnrxpn4awQxTwHWIAEwXYlm?=
 =?us-ascii?Q?65we2GuRvcRlPDaJ4dWeZZm1ApTy4wL5cB31RTHqEyvdb53IADndNzFxiWQF?=
 =?us-ascii?Q?uxfoWuRxBI4BseZlJ2FleO7BXtOEeFDbCTTurlsyQOtgwxI8uzMfbZPpE1QW?=
 =?us-ascii?Q?KER4wj9/EeBxfwQvcrtcSNUa9LOStK6KEfeIFEvjbjYpDxKRsfktr1rZ+bzX?=
 =?us-ascii?Q?t7FrAxQ9E1wVUZwPrMocScorPDp7wi2BYNa0EunLWKKMkn4xCPn+2ETBsG9A?=
 =?us-ascii?Q?+sztrdHtGMii5ccFQuZKOD13j7WkArkySs1uwFWhFbp5CWUPA+c5kdH85ezf?=
 =?us-ascii?Q?RPB+zmzLrTFBo+dYXGFvNupHQaEjW1jxo/NQI4LOCQ9z+YzhY5ZefHXUhK6J?=
 =?us-ascii?Q?Zenp1H7O8JYTjLsHhBCvSWB3nY9QykXnuiUTtBsVtqe6eHl9aig/TqUDZY6n?=
 =?us-ascii?Q?hJRex8or6bDOmayah/WkYjKEdqabH+minKj4laWruK444/Cmy4GOP3ZZ4Zcp?=
 =?us-ascii?Q?lWOFWLigyTEEaxAniShgnugNMMnaRlN4+bO0RjYfgHwTVDwV658o0KR34lGB?=
 =?us-ascii?Q?wNcUztB0HQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f6ac71-bbbc-495e-a554-08df43c0dc3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:06:11.6996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4t5yM0v7C5XrOzJMkfekBDahgHXif8RCm5WRjLysGMYEQDgpcJCWbFeZFTaBPoEgmTR/52Pm1jQJO9uy4bnqAHzT4VKROa+MopZ29tUh4gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11706

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
> +       { /* sentinel */ }

Have you tested this patch properly?=20

I had an issue in probing the device related to id_table match due to strin=
g length restriction in [1].

So, to avoid ABI breakage a patch is introduced in [2] and
Similar changes done in [3].

We cannot apply fixes due to ABI brakage.

So do you need this patch as [3] is already mainlined?

[1]https://elixir.bootlin.com/linux/v7.1.2/source/include/linux/mod_devicet=
able.h#L604
[2]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?id=3D26599cbf46fb1a72d4c7789d08a127a3d6bc59d0
[3]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?id=3De0d3ff3fe71b2773913c43e5f759473cd003c9af


Cheers,
Biju
