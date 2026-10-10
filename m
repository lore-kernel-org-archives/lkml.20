Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BEF393DDC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791623219; cv=fail; b=Yy2ay7Y8yZHSk6IarwKQP8lK5obM+6WMl0h4nO8hdarrX+rthdbj/u+X6AwnNqnvB9VVXJlDYhHsO831gcR8u1TtzqYZouIVeMgCVoHb/uezs0EN54Pbdrl8f5mmdZ6RUoxhpW7mY4DnItt5xWx9DrQ3nJJwRKoKr/N6gRvic1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791623219; c=relaxed/simple;
	bh=WnZbHG7AfTGnXXzQrDceNAC8P/idkEAJNxNwokzFkKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cIZr84hjaYLyGDjXBNzWOSBkdeUP8ifPcdAdmBNiVfx1cnzZzfNnLsceRMXYFSSmdyIaj3+udZ7UYZsfe8Ue6dzU4abJYUUIhKptyvcJv/9ON2LDGh9c8Besiv0TGBUIt4zVr+lYP9j3rXNtmGAaoJMHDavSMrQFW61GWD8qmrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=laqjjmIP; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="laqjjmIP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=od077coCLf+WuEMhKK7FqInjJzUCG9yqUlAdd14WR9HI9RtGbwAoF/JuFD7W+wjb92CwbZIcW7lJx3DNH7QKV3/iu4TbkkGiz1BhhqQbMNzw5w93QRyPRfuFYSw4oinR37tVz159WcBJ2BoEpqm3dXLxiWN3S7QL/G8DR8W/eC2/YQQgElvaw2/lECq1qL8gT+ANdC28fbVHj+YNM0GLq/cPqT1SVeD7XcfuYsb9kICPRYuHNu3JlkjCy+9MStjXFn/9FC9dkO0G/iLENW2wnZuga7KzHNN+5zirYa8oyxJFaI6yi5XYlyz4OvjR62325zbuC0vxAawX+4ky+V2jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNfZdt9+6NqZRHb2jf7RkugYXpRudmEcPsnQMfdvG1I=;
 b=Stx1xsnkPWLIfEVJ/s6ZrVToqjT21gSehyvMppcb8ZznO3Te0FMIIeT7tYsEliSCPMOy5z+NeAo1BsTT+MInaj/yC4BW3SmY/p5iU5aSAbH6n2bv9/XxugQ3ZBLWnM+V55A1nViiBN2o8QNew0iDE+KgEE29kM4/7Jq70vfPiQ2Tm1Fo0RQvEfnUIAIG+CBN9Cl8o1n5ilsVVrZlnT1z6KbVAv9fVEcZYgoeIaioJoPDGy/76PTfII7UlidUguUQEp0idivPYZKn4W0JrPaBI3bZRrE94Oo/TqOIrPbp04PMNHKY1hWR9SbCMf/uopq/8XjNawfYpQrNjSQ569jn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNfZdt9+6NqZRHb2jf7RkugYXpRudmEcPsnQMfdvG1I=;
 b=laqjjmIPyIVVANTzYMinX+J5ggIxkfbZEZFjvj7hX/wZZAoaYqoBoln7G95ihsZQ178NBjfHJoFuZ55iOmCdGoahWqrVzj/Kcjwl2WQ+8g7QJBEl+MOk11tJILifopuPNF5SSrgeSQrig8uUiFLfcAY0Pv/4gLC0PxcOqCBFS0pvtdvg7oJUjkamNpdAsjNPWWQ1dIdLvcxx9KrD5TbDhZ0q7nTiANBucuwDe2keHY8PT2zZCHoUI2TwbC7BDnGqYaDIyQmkPP1PXVza3u63LAsl0ynVPLctvJWAaSMBZx6f3EXuo1RMwDiZCTIh0l5ClP0q0PEq0UC90HqTFzcVzg==
Received: from VI0PR04MB12350.eurprd04.prod.outlook.com (2603:10a6:800:30f::9)
 by DBBPR04MB7644.eurprd04.prod.outlook.com (2603:10a6:10:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sat, 10 Oct
 2026 09:06:53 +0000
Received: from VI0PR04MB12350.eurprd04.prod.outlook.com
 ([fe80::5a14:6ce3:f50:495e]) by VI0PR04MB12350.eurprd04.prod.outlook.com
 ([fe80::5a14:6ce3:f50:495e%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 09:06:53 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Radu Rendec <radu@rendec.net>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jindong Yue <jindong.yue@nxp.com>,
	Xuegang Liu <xuegang.liu@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v6 9/9] irqchip/imx-irqsteer: Use
 devm_irq_domain_create_linear()
Thread-Topic: [PATCH v6 9/9] irqchip/imx-irqsteer: Use
 devm_irq_domain_create_linear()
Thread-Index: AQHdVwQRgnSpUTSxTUm6a5KDCtvWrLb0Ij6AgAJc7lA=
Date: Sat, 10 Oct 2026 09:06:53 +0000
Message-ID:
 <VI0PR04MB1235029B68F4C48A05F045E61EB912@VI0PR04MB12350.eurprd04.prod.outlook.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-10-Zhipeng.wang_1@oss.nxp.com>
 <asgEkzuozDh77hq5@SMW015318>
In-Reply-To: <asgEkzuozDh77hq5@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12350:EE_|DBBPR04MB7644:EE_
x-ms-office365-filtering-correlation-id: 562fe6a4-09dc-4fcb-ce70-08df26add391
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|18002099003|10067099003|22082099003|261009223027099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 4eUxU2OZ1g/+TOI3JAUYcPeEo+ROuwMj1bYVJtF1S6r3XWEPfPOIq8l0q2le0yt/K/1dijMbOWVJau+44v7EG4IY8C4BNL5UA34S5Zq/0nT03XYC6dl+XAiLgK0ITT+8G/Gq5IjFyerh3+hXj3BanYD7WbbXX5L9qJ8N/EyM1BFYb7tNqdO7Pxh4QgJZ1k4WfQoS8IlxRyK3WOCtNVavI22mm9lhiXVJ1thWqaXfVSndLEKJ5hkZa0AJzfiiwD+rFyU8YZNZMTph6d98LzCpzH+phES9Cv7HKNIcBr5ieGeJvtZllPtfDEG3x4wR6yd20zFMi5EoHTmn5fbC4Nz7AkYhJfts+PejpRHZDOeuFVeV8EVVpBTrxZFJmRHs2XywtDVWGxxhyF10SBUpLifsMSTk2RAmA+IDhPj1MZ+Pga3FY1etH4IxjCQXYHxa2RlFjhEIohzxZVCnDs9hRCxD6X/Jp9IpmlChmrX2ztiv9VfWNPv+8+DXDp8tQDPSOSFmvCmPyku6RgJUVSwu7Yu8oZkgjawbEHkbeFXhAIqQKknPrKtiaX5ul4HQ+7fmE6PDcCzBdjt6PU8qZY6ssJhvfpFsUZezwP6bF59sS694+rqtBabVWjVXQ0mVjMSK46mmJIuvj3Hl34crBgXh1ISPzG/K4/U4tmVcKPyX+O8l68bIuS9G39nFJP5YmviIiWJUG34+n+mlqKib9J5YX1CxLF8jBZaIx3oDRmE3fgSeBts=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12350.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(18002099003)(10067099003)(22082099003)(261009223027099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EUigmVTCvObgswWISgn2czE3erOIwXh+6qXdQEUlymMndeYDk/QQzIk2Fof2?=
 =?us-ascii?Q?OwDzCwdIdDU5KJBhcR5XLiBR96Tlmy16EGLD+R8o5ST04AXNWeXMxm5m+YA/?=
 =?us-ascii?Q?aD8jnh7nQiKvTbwqwhNwf6orNVS0E5EtJKQ9vdSbRu+6K1lBBNG8VAM8OVjg?=
 =?us-ascii?Q?c49AO8qexH0H8SGSJ9FLb98vX3yO4n+Z5V6koFIxEDj6ETXc3V5CDcv+W6rl?=
 =?us-ascii?Q?BY8K1KG4VeGRyZp2KumnYokNuBZ27IIP56KzzTr0vnIaMhLUofV1uQaeJfsk?=
 =?us-ascii?Q?l8p7jpwmIi2L3Sccz2LvH1FslSDoaaWSpbWDO8Bo4ieNGVMJiVcf129FQDSM?=
 =?us-ascii?Q?JbhAnmf/Mf9uVBIsmiJp2sj3XORGy1RWB2mWaJnqN28E31aaWNA/5XYyOgVS?=
 =?us-ascii?Q?vYV5l+C0DgCm/pIUVRP9cDP8LsetrWOaOZwEZnP2bSEPNTTm9QbOOOKgW5Lv?=
 =?us-ascii?Q?O8YMrQFeswKUmYWMBvHXdXFOGVNiQpD1gDXjY8MQOcLol/5UZif1YQMjjZVI?=
 =?us-ascii?Q?SyjbG+xIqSH+3pckuVE3Gu+cj1mSVINlLqnq70DdXCQHuS9FRDv0+7Xpk+iE?=
 =?us-ascii?Q?nRunf1wOcmI86xWAwKvupNNAtXwIzEN5NvU7etk3uizA+IL2VW2Ev5T6qFgS?=
 =?us-ascii?Q?KQv69/0P76HiJthNrzhW7WgKJfGY+knWFfO/hHSuOn+0EGrYoWRx3hLROoli?=
 =?us-ascii?Q?HkfxuxLs6vtG+wBUNxUlShYpO1Mi6zsT0xKNiqBKmqZKT3wWZuA64a+wFMx/?=
 =?us-ascii?Q?L4pLaItz8EzyXTN4Cgc/P+DWVbCc/g+P4f4ew2dffLsBWuL/tO4xQqkjt+je?=
 =?us-ascii?Q?fFE3USv6dboKoAtBsiHRoEu2YZdPGCalUZ2YWi9ElHronUA8N7fQ0AsXMbrX?=
 =?us-ascii?Q?X6h4okWes+mGVwElsvNmXv9NTeljQI7233V6dKvN67L5nc+Zr1yWGeWnVmnj?=
 =?us-ascii?Q?1bN/ZiiOB7CBhf6Q1uBgLW8q0T90JlVn6sUISv6/FVV6W1gFZn0Dc40QPVT2?=
 =?us-ascii?Q?teOamPjUFyXbKZxcvB0fdX5YI3HeYFUfFxLW+R1magQU31oqwTwWFUzAeXB7?=
 =?us-ascii?Q?sdME4Z/Z6lg6IYhtKofQorXO3ip4IZ8W8CMkpeBjMMraH8Gl/MDXoJsH6vKm?=
 =?us-ascii?Q?tS4xsCzhIH4Qw3MKfiJqrGBXdQYzu4B5B6yrP8ndyCwU4/uVNCDBmNZRWMY4?=
 =?us-ascii?Q?0YvnEbAES8oD9KXb4vd8cHxTfGtmmyCX4nQ4vA9H2auNIkhmFsB66VKClqHS?=
 =?us-ascii?Q?s4BjMpmAdXumHtE0Z2IEvzPuP8xdBXThBIq7GQYmylrjiIqJ0fqh3Y3romJI?=
 =?us-ascii?Q?Hp8N6ulfPQ15Nc1kqcT3OQ6EwZ7Vdniet/7i2l34v/I/tb4CMD+SBcgzjUR+?=
 =?us-ascii?Q?eFmMXNSG3HM3abLG/wLVBj9jBLyhuebxHDNoMIc7FwFwOAA7PlXlYHkBy4aF?=
 =?us-ascii?Q?Gm3FzMnL8QYgZDHhxKIHZlJeNP1UrOdXVSwf1vyBLHGGiTsJTD1CWu/wZmck?=
 =?us-ascii?Q?aBRARcwA6SEbHVa29v+uNLHrH8aeZxTTMSpFXFJkO0N0GcDb+BqLUpxoeN8r?=
 =?us-ascii?Q?A+n+fF+cK9oYOcWNo9/AxLWzBqhFQ1iJEr7abM8eTH616okJv+32ky2gAJyS?=
 =?us-ascii?Q?+0r/c/j6vH3yeWDGzNQaXzLDG0o3nnsZXSq6rd8d4XZHh82KTiteGkniqpT5?=
 =?us-ascii?Q?srVJuTGllUb/UjEybe1+Lr/GMn4MwKkdwMWS8fW3Cn6xDHkPxSb47n8nQmK1?=
 =?us-ascii?Q?rcxsuxluSQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12350.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562fe6a4-09dc-4fcb-ce70-08df26add391
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 09:06:53.0491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZnsIRNs6v7FhzWslZXNipLfJjtaILmHIEmrEnq6osDJfsxGG9MDCclObhcpIG1pkCIwwIxKP3cDcgWSsj0Z+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7644

> Subject: Re: [PATCH v6 9/9] irqchip/imx-irqsteer: Use
> devm_irq_domain_create_linear()
>=20
> On Thu, Oct 08, 2026 at 06:02:31PM +0900, Zhipeng.wang_1@oss.nxp.com
> wrote:
> > From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> >
> > The driver open-codes an irq_domain_info and calls
> > devm_irq_domain_instantiate() only to get a linear revmap domain tied
> > to
>=20
> Miss match actual code change.
>=20
> Frank
>=20
Hi Frank,

Right, the commit message was stale from an earlier version that used
devm_irq_domain_instantiate() with an open-coded irq_domain_info. I'll
fix it in v7 to describe the actual change (irq_domain_create_linear()
-> devm_irq_domain_create_linear(), dropping irq_domain_remove() in
remove()).

Thanks,
Zhipeng
> > the device lifetime. Use the new devm_irq_domain_create_linear()
> > helper instead. No functional change.
> >
> > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > ---
> >  drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c
> > b/drivers/irqchip/irq-imx-irqsteer.c
> > index 85edd5e33ca9..f5601769d036 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -246,8 +246,9 @@ static int imx_irqsteer_probe(struct platform_devic=
e
> *pdev)
> >  	if (ret)
> >  		return ret;
> >
> > -	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev),
> data->reg_num * 32,
> > -						&imx_irqsteer_domain_ops, data);
> > +	data->domain =3D devm_irq_domain_create_linear(&pdev->dev,
> dev_fwnode(&pdev->dev),
> > +						     data->reg_num * 32,
> > +						     &imx_irqsteer_domain_ops, data);
> >  	if (!data->domain) {
> >  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
> >  		return -ENOMEM;
> > @@ -294,8 +295,6 @@ static void imx_irqsteer_remove(struct
> platform_device *pdev)
> >  		irq_dispose_mapping(irqsteer_data->irq[i]);
> >  	}
> >
> > -	irq_domain_remove(irqsteer_data->domain);
> > -
> >  	if (ret >=3D 0)
> >  		pm_runtime_put_noidle(&pdev->dev);
> >  }
> > --
> > 2.34.1
> >
> >
