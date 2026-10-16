Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021123.outbound.protection.outlook.com [40.107.51.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8C46D560;
	Fri, 16 Oct 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146600; cv=fail; b=GMjMEGYggFJgMzYnaxG5jo/1gJHfASKHKFyP1kmJ/fZaRkTmUhkC65rUfc/HcOVaKm4bqUZ52IFqNcAHgfYz7nK7wAR/h84zkzYna4c4v0eEmvT6KfbUHYhw6+Dzmb27mmU23ASL4HnAa86Im8LRX0eKviJOkWyoAX6d3U172V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146600; c=relaxed/simple;
	bh=h+9PxssFBPp3ZJhIdoA3TiZDEaC7L0MVXBYgmWfx5mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KxNArU6GZcXmHNvdJWiZlU8Qi/vnlDGN1z/arevlyaJkDKTNe86JYMYyv8q9Z7/AhJdxJdbM6voP8E0mq/C1rZCcTEgGlJcsljHO7S52H4ltVNbjCjOK/41exGUGzdhKkXMDLGacWkBL+NEXTSUqydPozibtJjoev1Qva28sbMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=hRtYgm72; arc=fail smtp.client-ip=40.107.51.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="hRtYgm72"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruIYnvPApvyyvE7eot7WxrvV7QMv1e7I1MA5snEYkluacb+NB8+em82XOsQCKmaGN2MD8fSPtXur1gyH/QEgV75EjThyxTYeUnbDyrgN9QM+xYosQdzdbxTTuWQNAFd7xsgg91Pyunqv0eVSjvm/wbAzhspqw7gAFV/5+/te4vk/ferg4loKTwpHtVjXWRUkgHgaiESdledUiHI2NPduPCZNfoCDFWs49o5YKt/B29zUig8yBrtRDIDDIPImG508iABRexzspJwD3fnm4PAIrIMuVC+tJhZRkgpZxsx9CTEZbUtdJ8qZbdYaXi3jkueg2OZfwKH6MTHLmibRIpKGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2NlG7b/V79HAHrizLvjr1PrL9Nde4I30ArgN5jLEPQ=;
 b=XJVsPCqhYhYtMR2lYX9NGtDFp+7eyX4HtYo8qZswNMUskSomlIVPfArCfcVWhZzj3pyzo/97cS7y1JB6tOFJXOq0Lu15RA6BmoUgSyxYrqjPwd1g6MbycmMzJfNgHuBbtL8LbS20+cOAe+GPdqqZxcf0Ss/MdlNnlN9D2E9u4DlNWYTnDe538pBJN2x/iRaW2oKLQIBLnzrdK4n3wOtwbhGCKZcPJfeTxu8WLFO4SkTsD4/t7bXVJwz6dt9RggM5Xbe3g2zBWkjXbfBW5pdcMrtzdxHhrE7yaoWIxYgDmM+tX6stwDfrhq2BLJ3R67Oy8VCUfYe8f/y6lDwcxdOYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2NlG7b/V79HAHrizLvjr1PrL9Nde4I30ArgN5jLEPQ=;
 b=hRtYgm72yX3qtajjCAVcCS8TaT2BhhCVm08AmqmcavKHpJugAqKEYcuOrMHyQ1TbUY+K9zuiy3yRWB16NAWVHAyMUAFh7BNEWWRGZuS1Qayd4TC2IlVndYehEkeGRwlSBwDCmqF5Z7EVJsEet48rp/BL7W/c97gMbzm3TQ7xwDmTXx/ihpTl5zRBVoBkHcqKdBI26zkkLp/wuD1Us2ZYpPgZWoRZMAZZjRRuHBD6Kd/L3cC9Po3rwrWZ65UbwOyFNbJLyv9/AMU3GOQ8jQtO1kMalaJzmC0KqKU9C9uX3WGZMbbpSTouXIw7lADeVj04YojXit6pXyYAPwviDyENKQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:29:51 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:29:51 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kieran
 Bingham <kieran.bingham@ideasonboard.com>, "jai.luthra"
	<jai.luthra@ideasonboard.com>, Philippe Baetens <philippebaetens@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: mira016: Add driver for Mira016
Thread-Topic: [PATCH v7 2/2] media: i2c: mira016: Add driver for Mira016
Thread-Index: AQHdXKllr/0dSCh/EUCn7284MR8GGLb/+GFQ
Date: Fri, 16 Oct 2026 10:29:51 +0000
Message-ID:
 <PN3P287MB182974880896B859770FEDDA8B9B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
 <20261015-mira016-v7-2-828c931c5550@ideasonboard.com>
In-Reply-To: <20261015-mira016-v7-2-828c931c5550@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB1818:EE_
x-ms-office365-filtering-correlation-id: ffc1f42a-3899-4adf-edc6-08df2b706934
x-ld-processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 TR4GkoX35ggxHzZ0NGJrbgVBN7rtHdFdQAN3bzdRU+M+/oVD8Ay7T6p1meLA22lWuyuFDw1vVSfzOY/3loDw3OgLyAHUTVdjLKmmw478aOR0ko7cFsY4EBtT0T5+NG26Sc07hhFnScwGZGL+yCmJpTRGalkV6jf1UJrnH+MkHLtzKgy6H4KXU6De21XvlGToIt2KX6WpdCkq04lxqaOPzh1Skw3Beu2xA5x6KpFScgn56E7vVtQP+WkPtonL5agBLoZnqDHcRP8FklkTd54Pri/ROh+DMz2ArmHzWtrmntWYKiL3RwMPDFgfmSlFsS1VYWK7hKLJDr311aZAwMfMj/KjXdtDY/EILRhFFzt2NyZIGhi2pl7VaJigxlOaPcq+KDRhRzZ46pO6M7khzDwBFLIyOvPRicp7IzWX8xBKb1AGbfdOC42xfiuF8OkeTi8hY1YqoLE0pz41Cp2EP5T1D7zHvZQpvxwZ4SpISqPNCvCR+Bf6X7yN1LVpVdP05SyT8am0vSwK0CAprN2mYyJneBuQqfhIjk0fVtsR9MUjdHWOMtYIek9vl9quk5FVo4A7oiZeKG2+yZaK5G6+bnNRsCG1S3XMbFO3emaIcxvh20SsdXtdseFDSntl4mbWnP4MeZ5kD9EikqOfWurSt+Pj9KSwbZMl6yMCJtkw3S8V0Pf0Or2+68eTfOtbjSynZlmOzgUhMOxe26PGIsUYA25f31DVUiNltx9wq+kXyMDruw4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iukqx+XWG1OmcvMl6izMiP+doHnuQGXRnxvXzntCt5MtMYVA7nO7gHDly4?=
 =?iso-8859-1?Q?FGPTsQGJI9VCxt3voXdryo0vYe3aTB3bEAeuBoJNpeGoyWzZe9ekw9iAAc?=
 =?iso-8859-1?Q?4yycNQHOkjMHjtjfb6OuxKE/rQl9DA81bKA9pZXWc68KzIy+RzM6OeqWp6?=
 =?iso-8859-1?Q?XbfZaQt4WjaThuYSpkF4AmoWOCbLAAeFYObEEJH//VYCY4FIpisSt8qXqb?=
 =?iso-8859-1?Q?ePqqvl189APwFd0KJFL2IK/PnLgZ15ZOpoHso5ocwYYC6dDfYaLpiQDbKg?=
 =?iso-8859-1?Q?qRhVI80UoApY29ng5vgB8pZY1R//Bsbf3xUNs4caxJzkclBrDBtyCETQj/?=
 =?iso-8859-1?Q?4ja09ptcvG+skx8kfyWDxDa4XvMemL8Y9Ts/PbvqakxAKyRozzeY3bvBPH?=
 =?iso-8859-1?Q?RdRfjKsq6Cc7Dbh4hDI6iDezS34Z4BkqVdtvXxZ3aDFkIi3Fs7jhsQh3R1?=
 =?iso-8859-1?Q?HAxJOC+GskVSjZoZzrLjEX9Wf7JvobM+kkej1bz4v/PmqmfYGZmdJt48BL?=
 =?iso-8859-1?Q?7wY1/kKjTlhexgJ1ie1TpTs5hnsG6RiFdtct8hm5Og2f44OkKkHoujawOi?=
 =?iso-8859-1?Q?L2TK1KDyPtwGYlMiHvpGeymWbi8GXeauGjgSYIHm/F7vu5UZ0RZ5yjKyW6?=
 =?iso-8859-1?Q?tt0JtIVETtebk98Mo2NIgB+owul5P9U6u3iSO3juTgHRcnsx0a1Och6aQs?=
 =?iso-8859-1?Q?YTX8Ka4OZmVfFw6K45OITnO2FNwQtcU/WHh/i6SORbciH+uP2I7jsdU9Mq?=
 =?iso-8859-1?Q?ab3cYGM7x//0AtiqhkoIjo4OgDCZmneNeFLpxc52dR9MBdVl8+cShhmScY?=
 =?iso-8859-1?Q?jsIUvM/6BIAGpcnAu5QZtJiO4bDsxWtmg/nLB06hucMoyq6/yi0ohc4yJ4?=
 =?iso-8859-1?Q?eulvxogF12VmnO74PgmaanupA0GGEs+8/xa1HdZFhwfsgvXfQACIH2jqOH?=
 =?iso-8859-1?Q?FgSxxIZYxypnifXkS2t1mnYNBjJGK9s8ad1gZx8nDwL8k5D4EfdEAI+3es?=
 =?iso-8859-1?Q?x1NY/fYq0gsCjGHPTGmTV2YlWz+kTfuuA1lm8QvG4TtzSgp8eWW8w+khSh?=
 =?iso-8859-1?Q?/ydFKSaheVHgB21PnWfpaS15HVm5vGS9ItIs60jFBWFJJlq6GmHZ1Tf7sm?=
 =?iso-8859-1?Q?y8NYO/o9nOMssLuHdrIRzTr7fESfY8syaJNoJlA2pDFDrT9Xzg+tDqsAhP?=
 =?iso-8859-1?Q?pAPhdEBpoSycuIX1oFk9Teyxj3S14E31N/OkBoRX+B3z30dju5mqBGPJu+?=
 =?iso-8859-1?Q?nBV1jQd6LHezaNG98QpdAaBxOX7ypji2h5wCvlBHBcRm5voBewXcYxG3U/?=
 =?iso-8859-1?Q?VpnNzkhiYJBMBVH6mCMoWLFNKhP4D/Sk2vTlvR5R0+x0rb+G4sc6Oox7aL?=
 =?iso-8859-1?Q?I2iQKTf952y8yAD0cSisa2WXFHER9hu7QPhiM3QSESGUBWMEhlTShuoTdm?=
 =?iso-8859-1?Q?03e3eDjBMCmCpLQ8SyOF0LpyhrjWtXkgnIO9PGJ/IxbIa61wYv4l59GUVJ?=
 =?iso-8859-1?Q?OpjS6q7WeiLlPZ7RQUBngCniRJzcWk2QWbUbkohW5KQSg5iLFVyN5kh29s?=
 =?iso-8859-1?Q?f+/cfJuzJ2MJ0XmpxjBX1cIN8nj40s12lMb7UPvJBwZU2VO0qPvNz0Sn7m?=
 =?iso-8859-1?Q?ZuQ651Ym5KmCtWgPxZBPyoTq77DnoQOr+yY2v6CBR+DSThDuWtZ4mZ3U2s?=
 =?iso-8859-1?Q?KFQXwDz1A5YnlzYUHwngmhgSvlCbwsG2t45asAm+qhgzApSHp0fYLIWu9N?=
 =?iso-8859-1?Q?4NFeHvQnGT6+EDIXnIuLyrmpMWBgzcjdGm8jCz6Aco0GpTMuMSEdGitkSL?=
 =?iso-8859-1?Q?bAKkWWWkurb6BXXUPO4Sh+KRojQLf6M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc1f42a-3899-4adf-edc6-08df2b706934
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 10:29:51.1165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sW347YqUQ/W+D0RaMJ/smdZIIqPSlvtxxqW+jRrP8svE9KqwHlCOz1591FE3wu7St8+nGh4LxpTIxEDGxetx/tpNJZsyCwM3m/aleAUOEEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1818

Hi Jacopo,=0A=
=0A=
Sorry, I overlooked one point in my previous review.=0A=
=0A=
> Add driver for the ams OSRAM Mira016 sensor.=0A=
>=0A=
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>=0A=
> ---=0A=
>  MAINTAINERS                 |    1 +=0A=
>  drivers/media/i2c/Kconfig   |   12 +=0A=
>  drivers/media/i2c/Makefile  |    1 +=0A=
>  drivers/media/i2c/mira016.c | 2358 +++++++++++++++++++++++++++++++++++++=
++++++=0A=
>  4 files changed, 2372 insertions(+)=0A=
=0A=
...=0A=
=0A=
> +       struct {=0A=
> +               u8 n;=0A=
> +               u8 m;=0A=
> +               u8 cp_div;=0A=
> +               u8 otp_gran;=0A=
> +               u8 gran_tg;=0A=
> +               u8 lut_del;=0A=
> +               u32 esc_h;=0A=
> +               u32 esc_l;=0A=
> +               u32 esc_period;=0A=
> +               u32 byte_period;=0A=
=0A=
nit: pll.esc_period and pll.byte_period are never used, so you=0A=
can drop them.=0A=
=0A=
> +               u32 data_rate_mbps;=0A=
> +       } pll;=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct mira016 *mira016 =3D=0A=
> +               container_of(ctrl->handler, struct mira016, ctrl_handler)=
;=0A=
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
=0A=
exposure->minimum isn't updated when a format change alters row_length.=0A=
=0A=
Other than this, the driver looks good to me.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best regards,=0A=
Tarang=
