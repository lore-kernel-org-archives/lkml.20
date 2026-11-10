Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311993;
	b=URDuzVJMXYgyX5h00JA9/EhYO6BoTK5mk3dNlJ70nQZvXJVlQ/OISftyeK1E6zdi7+Uh
	 U6x/HIqc0PE+kl/Dm3DOsLMLpdQnKm/kM5Utuz3bib2FhRYuE15wpuIY87+uheEnJTCRq
	 ytgN7BeMmSvVBPnRkiNEzPgO+ScPzQdfrjawHgXM7Teegbp6FgH9XE72d6ViirrQYju6/
	 gv4m8u4fmQYSDY8o1NICV6UPn8gIHrn4/FOks63Wh4nmFzdqJfNkjCpehAbErjgLVSVvX
	 RzG8W/LNg5hhIZuQrG+Qy39X0hRd+VHWM9la0XgwLMs1Ay/yvpZPZYYza5p+Z/jvQ1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311993;
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
	bh=V9/hmEpW7VhCM2APgNcx6VDBdyZLPM+ZVWuCrNLxXzM=;
	b=JR3jYwtgf/myVBIlg0FtpkWq02aFkpaQKj9Y8sfrXZx0LXJRPx5FuAcqCoaWa7WjnfPY
	 kM2Eh91mcFg7na0DSyWPa6t3w7ywTpoDCcK0uGg55A+hkB+beAZpf6vxe7Si7UpxMqF8Z
	 OoSrFv9QPKUdAKTGYTcu0C2PIvirfsCQ3Yds4/t3oY4MtA3oIO9B/eCNG+p2D9n9m/03z
	 mj4AWHX1zeCkUFejFLM8EVKG59bdl1aAh7mkr0MVLaAhBwBrxeDWRKXtMI4keYMDfDJ6X
	 Pd3n8trq/kBuZkVBoCdtnYbfMiiA9KRiXUjIrcdMQhI03kQ0QKqZfvx5z8slT4/clCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ikgGded2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.61
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F55606A31C;
	Tue, 10 Nov 2026 11:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ikgGded2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4Azm49Q5Jaq2klVhRcJHF+qeG7NmP5cyJR3q05vss4sCNs7xkgwHEllBhlvBSy/vYPeCSw4F1lPvQWKa6Y56eOv6nRTleHXQEIkWOkZ4y/s6ZNhqyyly0ntqiahVn9AQaqqYwaqdQcSrVeBFgmFJ7SSOUki/iQRGtgZYJfTx92W/G4i55gu85xX+23VOWwFcgdluhRQcfpK3lNm/lbfrYK0dd3PQicZPMCkRd0bFVtL5gdh1eOKwMRMAphMp3iR9ObHMqt4FWVKKeHhR7ud2LeJxPBv2rojGmSCeEKzvzDq2lUyT6r57OlGdKt65lydLESKDshlRXUKovvW9K2zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9/hmEpW7VhCM2APgNcx6VDBdyZLPM+ZVWuCrNLxXzM=;
 b=J1Q5aCoJaBxUfhtmGVfbNUnGSM4OYx9Ag7tFWSBU2sLnfsqNBMS59cXLYEvPTkhoRUiLacz64mDfnQvKlC96G1L+0zTM5EyNuWs5WgZzQe4WyuvDPkj45UQBay7LRsoebQLJLM8+W8W7U1Ivf2i6Oznm50rHo6A7fXY2wZKMGn1swjLn0+CnWpJMl43X2+d5Z0COYfCuG5eKEQgw2PZL63oajn0Ow44MK9jGorcw3DlZ7VlI3YFodtHpMGb8SIdJvqlZ1c3mItKSF08FiTqLvj6pluYK5Gl9lIqUZfRUfbRIjo8I7ZqfhJLJYzxx96B/+7IUldPt5u1bzAYNtRXurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9/hmEpW7VhCM2APgNcx6VDBdyZLPM+ZVWuCrNLxXzM=;
 b=ikgGded2PsaQAXu2ff+yoG4FUWMzA2DzU+vEf01ZY4XOUgNCNlPpOH2uYoOpb7IduFNt0GapbUVZffPPJ+H0n6HMLcmzKrOC8hghl3EiQ61gM/Mv7s+S8Huw/GcRJ7sFeDc7te7MBn9ow8S4pgF5RHjePqgbSuuxGZ/lKvZlgo8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7174.jpnprd01.prod.outlook.com (2603:1096:604:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 11:59:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 11:59:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
	<prabhakar.csengg+renesas@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate
 platform_set_drvdata() call
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate
 platform_set_drvdata() call
Thread-Index: AQHdcQkfBhop1o3vvU+JgV0KsDs5cbcnMzrg
Date: Tue, 10 Nov 2026 11:59:49 +0000
Message-ID:
 <TY3PR01MB1134683B4AB5DC97B70F76FB586722@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7174:EE_
x-ms-office365-filtering-correlation-id: 3602f887-210c-434b-7c8e-08df3f221f4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|18002099003|22082099003|10067099003|38070700021|261009223027099003|11063799006|261022075727099003|261021123027099003|56012099006;
x-microsoft-antispam-message-info:
 CJ9NhDDMsxTMwfK+oBfG6/l9p4d93AnaMhr0S9gqR68UOeH/6wDdB8BpAcBxc88iZzvF0UFmeFwFOfu4FE9CQ1YuzXJAtTv9tOscm2W/U0JaIkEhv0Y188ex+7f7Db+6dtjPAMTrKmFRwiuvamTul3m8moCB+HorS47qFMpNC4IW+gSweA7hHKpAU1+ZZav2d6qjWsKIC6gXxf4PNo6OtvAw/SuaXmq24dO0Hp/mvtf8UYXDlr56LQ2PVhx1615JkNkOKmDL0nXK82jwCWJPPA6PRF/ajzHPxoPwg8tZUxTxvXBoelLNMfvgvyKWqeWaZj9QT2cbZIaXl3uhycjhNeV5wlID5vZgAx+YsaXNWmCLl4sZwTj2jBlaYVK48tOScG7jEfXltB1ZnEQGPrx1K+BJ1ZoPS0qg2CRhA7eX+To616XIXfXf1jMkKqUDZmR7Jgkh3ZgjhZ48Pf+e9dvMxJSaKkz12sjnI0yFeBmbbpJ8cfEjmln6d2M32Mm1xgQu3MrJoaazUPuWkVccFjGxknfQRKcgYEl9uNFtaCc1E8JM02ZUYGZ6b7DuoiyRX0swx+Zh6oLsZ1OJhCJLpNhxNmd1N4qonKQpKdjrjxLCmmFyajFTRsYujwBO53vwLb28wwB1T/yNl0J6QlYe5z+U+lIuKPT10uYU5SDO9OAOo4Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(10067099003)(38070700021)(261009223027099003)(11063799006)(261022075727099003)(261021123027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GUMhQ4v2qAVuLQ9tzr4ondiqY3Vu7iMPDKsMJhOgiKqh3Em+5UzOg+fodY2q?=
 =?us-ascii?Q?OBzcC0YI88LaQXuyn6veBVsORZDje5QYmBtcRoGFSejKKO+GB5U8uVxuaVDT?=
 =?us-ascii?Q?Y+AEtQEsPSHafxGE3JCAx3zJJYZ38IBLmJWWFDl79vnwInZSsvpv++a/3utZ?=
 =?us-ascii?Q?PdOiaobszkd6pKLaKW+m32GndIqQwayBOrNlhbROhJFBc0RFS4aDo38+cY53?=
 =?us-ascii?Q?LYNEA3HElP/JP8skZxMfUzkw0Ofe8KT80+mE1LexGm0L4Z6oXCkUckLvPQeS?=
 =?us-ascii?Q?CwoNDWwgmIE1dQy7zSBJi3VZ3u1e2pXSfEBdch/pcaYleKDWc7f5iqAbC0Y/?=
 =?us-ascii?Q?asRPt8/kOTBtMFufaTaQmdOWWqJcK8A3FtyAvlGIqvfvYmIP4LUVJALXIWRs?=
 =?us-ascii?Q?AZ19SQdfj0fIv9kWh+9EbrjHfmkZC9e65Uj7Otl6E4TRIOLhEhuHDs3P76kt?=
 =?us-ascii?Q?BzspwvGrLJLVRU/0qtAQiXEEEvoWmo0eHFJh92W2G/5X5g82by6EE3zrUqT2?=
 =?us-ascii?Q?y1YKHadEJIbcEynDzaONv8wXRWT0sfKcwNRSmuQsjXn5ceLPYneGusiHM5dc?=
 =?us-ascii?Q?rX3xzBQdYJ9Jh2B6H7q/c25+yE/ebkeds8WoigKWFdCgFe5iXH8/rNTgsx0L?=
 =?us-ascii?Q?3iW9R7cVxWNG5JkCy2pcklKhMdqsD/HHsXc3g5J3+837ZUEP9m4Sjcv4MhJA?=
 =?us-ascii?Q?X/Vu+fwV+/yuL8FUAPCtE1ntHD3oLHE7F4pUjdaVGAYR4aeIZ+GCz1RNUfz4?=
 =?us-ascii?Q?nlIOkTy6PE/HkW2ff6W5gTd5CNgLJb3aumCA0Yf+C7jAeTIxYMKbsALIWgxT?=
 =?us-ascii?Q?EnZ/y8titPM472eNwjGcS5bzZ42YHwxU6MOlLCzRvlg+CQoRqUiYmpTELxMs?=
 =?us-ascii?Q?4aNDdk0s2wRV4hxa3D5Y1JwFjg3076rUdjNJZ7PuyE6hlBZFnne1rVJc/1J3?=
 =?us-ascii?Q?AGaL8b88B+ZEI4lOjivPV95qmlf9zoSxkO3vAtI/qoW4RkF5flmSjNJSOPBb?=
 =?us-ascii?Q?JvBKtrhN/KdGvsqCyJLpdSYxrQIDbR3dTDDFfo+XvLNG9zj0cOb7f8ewJyWq?=
 =?us-ascii?Q?92h4gkAZRIRSAzVRornRFWc/25vvg6reKVWzOnAOA5W+RkcpuFIFKmi6Q3Zz?=
 =?us-ascii?Q?lzjCmSLmN3WJwIffZZwqvDBqo3qDcgJrAPAu0SeSVhIYAN8Y2uBwxUlwtHJH?=
 =?us-ascii?Q?hNY93Uh1ZHHPxHsr6OyiTkCWAkK7Q3GIy3UJHZMMLnLoO/EAwoVr5aAI9pM2?=
 =?us-ascii?Q?QUCb1CnCogOqh44rM4qr7JUZl08thmlKGX2FYDcVxaVy89V+krePZ3SOxXJg?=
 =?us-ascii?Q?KgvOUGDykL4oUbjE7NHX5ZT8AMFnFJVwL88ngltiMnrS5mN7kQe+afZdIAHD?=
 =?us-ascii?Q?sxyK5KiESzOrFG5E4jvNjUJNNRShFW3M9aIEm+FGgnbnxjaX6ad0Do8DAG+z?=
 =?us-ascii?Q?PYsFXpkMnaJ4CRduqsqCODPO+nze/hrrjJWiYAJkNO5JKr7kYwZyK6kR12fT?=
 =?us-ascii?Q?qOCslkqqySskcio2V//v0KKqPL9MTIzyQ0bEJksT9HaWsy43XwZuPsBRrnxb?=
 =?us-ascii?Q?M16eRJfES4wkH+HQi0NG4U+mZNI0sWx/SxKcgJtd/XOpKbSdBrYWv/2C0tSK?=
 =?us-ascii?Q?Wwpif3ZnytTz/rmxHfSiHnKILK5kFWJ3QITAsYt/gJuwcaAzUcycPUOA+FK0?=
 =?us-ascii?Q?JQLrNw6qYfYbRvYX9HWp1nepARoUti7dDkMy5HlgRT1i9H14XkmaCwyu3REV?=
 =?us-ascii?Q?HhSUgFfELg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3602f887-210c-434b-7c8e-08df3f221f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 11:59:49.5876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYZeVZLQRNDdFXm1hx55CAgyw6RK3+MELJQZbN8pngRIBekN62NZ6X3XkbvPss63CA3NGe2FZlDMWChSzZv5n3hA8fDmZod/GXkqgpwKwDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7174

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 10 November 2026 11:46
> Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate platform_s=
et_drvdata() call
>=20
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>=20
> The platform driver data is already set earlier in rzg2l_mipi_dsi_probe()=
. The subsequent
> platform_set_drvdata() call uses the same arguments and is therefore redu=
ndant.
>=20
> Remove the duplicate call.

Some thread related to the patch [1]. Can you please drop the first one and=
 keep the second
one?

[1] https://lore.kernel.org/all/TY6PR01MB173770FD0BA340F5A50633E21FF322@TY6=
PR01MB17377.jpnprd01.prod.outlook.com/

Cheers,
Biju

>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 5b257f5adf06..985d6e02203c 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1576,8 +1576,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	if (!dsi->dcs_buf_virt)
>  		return -ENOMEM;
>=20
> -	platform_set_drvdata(pdev, dsi);
> -
>  	ret =3D rzg2l_mipi_dsi_pwrrdy_init(dsi);
>  	if (ret)
>  		return ret;
> --
> 2.56.0

