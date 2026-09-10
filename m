Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692C530DF7;
	Thu, 10 Sep 2026 17:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059741; cv=fail; b=L7hPqpNlYLJJ0OjFlbBldych94OgBTnsKjEURzUUIlMLQX8CemE+5duVZ05b8YE1jk952HJAt0zgq2JzyByWkzBYDLg+p4zoYrxS7bnXD6tabivv6iaO3xxVnWufb/szgC64sF2a8CjIqYsB1pcmGKeVsYhgBuhLxDD9MB5+meo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059741; c=relaxed/simple;
	bh=oQdcZRAO3fGMytwCUBUI6FXjQOWeehR/EWhPyDUVMs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gfBGw8x5H9pjXJwbngP5OncGnjNzSsyti+cLxs5Bdn8urr5mDkll0MKR7QHEIfhEH1jgTlISRhov9ieNa/9ETXaLQtsmEBvLfAkrHybPkHTRx4+upNzVnfyGy2D7mOHpZ4W2sRT6fBuxkFiTarxGYYM2fxgZb47uCwzvjciPco0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hkulHdeV; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hkulHdeV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZDYv8T0USD2H8KGxW89UgFSvIPKNc6/JDDGhEz+Ae5gvNRF/A7vXZOKHtDYXWwqD5gOC1skQDqc9zUdBWPkqbfj9bcRFUpy4kj9tGCMfTMlERsfn4J8zf6qckwZIiLL8dFITYH9LJ3GNAABROWSSdldKB08zhrCRpADoGxnvbdvGKl2Ro1gKVwed7HfVK3bDisHzz3eEH59OdQr792IZxgY67iu0d7HM6IgCvMgSV061sf2I3NUSfF10Qa4QjE0v+npTl3RzW1zmjBQbz7iQXFsRIisok4Rnci6gThq7TQzo3BBn+83IUKXYwnnqsBFDfK3HzouvaeMcXWRr2jVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzXR7xKFn4AFDE1Iss2nPIPe/99nhjMSLvF47V1cfMQ=;
 b=ULgsquAVtkoDlfy4h7NYiDVcpDFs0kJ8R9DfAUKVUWivLtQ2sMR9MM0TzWPUBXL5j69xg+pH8XzIAANEHwDmZkvPlZhhVQSTIoAkg/AlOU45yMsFBNT+wzKyadlVryREg7fQN4XjAgXrGDtu51Jc0Mj9FI7UpDFNpx3PppKHDJhsTK1ghDuUgiGgMd3ihJg5wsJ+Vk7DqwGgwjA5WlACSaTOWcJdmVbQ5Gw1wMBGR2qKvY1HxBRlk3BEFrNYsKxHuUAT3DgfJLiqVn7UKJeuq3mXxRvG5hfZSv9RpoW+wtkHd46b/o+Pd/o4/TdRtL0ttgRL9mzDzZqbe3vVKa1YTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzXR7xKFn4AFDE1Iss2nPIPe/99nhjMSLvF47V1cfMQ=;
 b=hkulHdeVjDTP7XP9Y1k+fy4FPwGFurqC1CnD5I5SuHWC6aDXmxK6w5FX2rgYJ/CEdWnk7Tw9F4R9WqxBLcOGUOw2CVASdqO6yLfseLTUEv0CsuIy8Gv94f0GdD2RDND9zy0ikuSuvM/xEeqQnJG4wSrafeEi5URwPTIXau6gu+Rb1OiU27RhsKqmCJ0nU4wu1/hxpmOGuTjl1ZqytzHqXTM6+K+O2o7NIJvbZAwhNJjTdpa4gCmPECJX97xLLYi5nyANYBVBWglJWZn/KFY4w1DSta2Ypbw2Nybr1pRvzrdtDdG2OYx/kpZEglXHCMR13d/omsUkLCNiNOtKvgq5WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10373.eurprd04.prod.outlook.com (2603:10a6:102:416::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 17:02:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 17:02:03 +0000
Date: Thu, 10 Sep 2026 12:01:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <aqLif2zrrsbYd5sM@SMW015318>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
X-ClientProxiedBy: PH8P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10373:EE_
X-MS-Office365-Filtering-Correlation-Id: ce223642-baf9-4fab-f48f-08df0f5d3c5f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|19092799006|366016|10067099003|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+6xv2zkSOnr+fgCkBD+QBl8vma2W7ns7nkd99bLfib/bl+qELlNG2aM6mqgO9Wm789ThTeXO5WzipJU8g2j9hXfpmdHSzEGVLVQ7OEUZW+dURMzy2jQpkyvJsdLxzKog6ETr7qf9IvtHETgT0j3CQVd0dk0popKxIdA3cvi/mm8OqB6cLt1Cm/Q39PfKksLQrx3P+OWcuj/XnIjwLPXLdmfqNXVCSIvddrApUJz1onJ+JLVaeR/VhwFhhV4Xq1rZrFqRtbAHPd2Y2EBbsXQOTCxaDvZUnmylWz3jAbMkXiznGPp6OSRTIsBhgRq+0cw1rFEkHnz3zzFLtHAgrTd59gXQ+afJJUoXJ6/5OUhMdGGqfm6TK7NHWfZdisrvVtUIukvpyXBFItujDQLK/XxV96QTbrdzfecHn2wpbhuDiEBvmTccPCqmpf4IbS2it/Pkl92WohyDalsP5zl879+1vre24h6kP4VINV86sWaXArbcuXFWbB4QejrJZK9vvgORQ54i9dPu0BoegFfTiU81jr6ZuQaCeIAWeWHQf0U6NQGbXs15ysQ8dtyJbuW5CSzQq/Qt7Nj7zCtuauprYMANTO865BJ/WEES+liNbJ7P/eE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(19092799006)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8QuVwEl8dlYCJfh+Fi6h+K+5DluA/bw/H+5b2pdvAXKcHF2OSMap6kQ9hsx9?=
 =?us-ascii?Q?bMsk+OEMB7eM1jV5kh7WhD/Y5Tthg/vmGs9xcLtfi81dArXy9qEFN6RHANJ5?=
 =?us-ascii?Q?RHe5rg+F46rDQyiVS03CVP5Gqun0onFR1N/QfshKSNL2LXODpqq4zlHqmTBU?=
 =?us-ascii?Q?NLTxPtgg8p881QSo4DY9TKOq1Szl4x5o0IKKJnRJmTTRB/3Z6bIf+6KOHpDm?=
 =?us-ascii?Q?WVO62TTvgcWE50LV0eoVBgLRcgDnUBiXioCTFZjYW1smUGXrb3FGr55zY/mo?=
 =?us-ascii?Q?By1M8akbjJiF1KcKBod2gjdFzYc7e+L3TIRsRs/KykziN6MA7JTwPslqJ+t5?=
 =?us-ascii?Q?K76t31cS8hoN6jbPicU58ZyG93L+LWQ98WSBdyfsU66y2AwOKcOAO2zVM2y0?=
 =?us-ascii?Q?uvobnD/SiMIgqeajaDnis6vrfCMRfwLJAST+qwIYpsDJ89SOJ1R8jq8IcavK?=
 =?us-ascii?Q?mnsgn1KeaU36qKbDqVOAP3d8ILDEGBoYOWY7IqMnwZgu0A6BCjb2CCBTHCVh?=
 =?us-ascii?Q?sQMYsg/wWU7W0lBgE8olvY1WhL9YmsmmFotpPRNgMBIxtnsKvri9Cl4ws3xt?=
 =?us-ascii?Q?ukI7UUMAUS1XWNM4Ig8sQJqA9l6zJI6488m26RN+01+5/emc+vFzis5JweKw?=
 =?us-ascii?Q?XSlQxUtKZw/IRKF0rqXlVSNoyu0sOADCV0rrtG6oHQu9P6FEw3KYRtFENpJb?=
 =?us-ascii?Q?tpwQF+FyA49MUzIXdM3ZpCr3XHXDl6vY56hyL99p1F+XlPL+9F84LZ57mOKb?=
 =?us-ascii?Q?YCrE2zpE+z5j19p8yo/sf6ruW/68cRq2hQnHLlLEwje+dW7mgisLQI9AaFt6?=
 =?us-ascii?Q?XpNqxwVnS6AA9VpShtaTowpmYEyvJBQ+bd/f9daeE0rCSB+zRD+W78yAtb5P?=
 =?us-ascii?Q?KAxRoel+iWwKhm01NkOQTzqsCXDOHr7XOuVpzfD+SuIhy8oUEi0EXMeqz17z?=
 =?us-ascii?Q?Vls0UnX0KnW2TPEvEvpfrcyGddbkTsa1Cg9b1UUeoRMZODIc/+b9d8bcUlFc?=
 =?us-ascii?Q?eA8YrUVSWV9cTPeioZ2QNJ1jkKwxgSOClpRLttPv8Si+Tag/+hS3f9hNqle2?=
 =?us-ascii?Q?NKKPlxmHos9LHqI1gppjGfe29mDaGCeHs2fTcvhT7LuMbmYbM+d0WtEf1uFV?=
 =?us-ascii?Q?RNSzN236+/93AlPg01Viexog4H08/VyyQ/oIjKxzlHZLV+1dAQF+TGJbz5Xt?=
 =?us-ascii?Q?efKJY9nti6hkE+VrXbOVe9QUAoDMopw5WwIUV4QXQhXFonRN7lGoM0odCxAD?=
 =?us-ascii?Q?YaTOWkepuIdcyZ14AdeytnCYQvH6+ekCAvVvrjjdhVsTVH84dAr/KFbORa2Y?=
 =?us-ascii?Q?WuuPRXHM8oSKkAdM1TP/Z7SeTgffI7lFpZ0KVgh4rOTSgexBHTH2mwiLYziw?=
 =?us-ascii?Q?hq8v/pDrC+hR9zvcSj2mGEi2iERZNfEWjUFKQAdTlUozZyUpM9Ey2MZC3scG?=
 =?us-ascii?Q?3LqFPvsRFJArp9ibyuQzh+5cii5iiCD43dcxI3Hf4m0iuE2f7w/mPxIM7WmW?=
 =?us-ascii?Q?0F/R9LKSsGKaGfOSrKY9wpyhH8xTaibORd1OmVcgpkz4DFKwqndR/5q0La+Y?=
 =?us-ascii?Q?pOtbWblpCPRaKKsuqCK1MLroJ6qxBou92Rkyz/MgXrZfvdGkDMS55FTxt8sZ?=
 =?us-ascii?Q?Qo4xdrqh8KpEym1N2h1B4W2Si9igbV3BgKQDE4EAZ2FLwOfM/9KNAqv047lU?=
 =?us-ascii?Q?ln+7gzKHvTdyZzARSLB1X/0C12YZwnoXoyRXEJPgx50vYgH2OO/BoNNu67pJ?=
 =?us-ascii?Q?4ccB7Us31VKz1srzoh/uOBHUllxAHDptmzKLHlMIuzlupHLbPfo2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce223642-baf9-4fab-f48f-08df0f5d3c5f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 17:02:03.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bkSw7v7a0zTbezVy2P5sAxdNC/SGhvsmxw8k6tJcWgkY53hpNvKJ5sJ7hTjf8aNaGUMzmfYZHZNLSBN/nIN7Fn0pemFxV8CF4E/SoyZFEo3lRDeR0pMnfvOlj9qlaHx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10373

On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> Hi Frank,
>
> Thanks for reviewing this so quickly.
>
> On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > >
> > > Toradex boards route the sideband signals of their 24-pin camera
> > > connectors to different GPIO controllers. Camera overlays which name
> > > those controllers directly must therefore be duplicated for each host
> > > board.
> > >
> > > Describe reset, power-down, detection and power-control as
> > > connector-local GPIO functions. This lets an accessory overlay remain
> > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > remain described separately because the GPIO nexus does not abstract
> > > them.
> > >
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > ---
> > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> > >  1 file changed, 86 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > new file mode 100644
> > > index 000000000000..06e6836e1aa6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > @@ -0,0 +1,86 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > +
> > > +title: Toradex camera connector GPIO nexus
> > > +
> > > +maintainers:
> > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > +
> > > +description: |
> > > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > > +  signals as a GPIO nexus. The other connector resources remain described by
> > > +  the surrounding board device tree.
> > > +
> > > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > > +  A board may omit functions which it does not wire.
> > > +
> > > +  The function numbers are:
> > > +    - 0: Camera reset, connector pin 11
> > > +    - 1: Camera power-down, connector pin 22
> > > +    - 2: Camera identification, connector pin 23
> > > +    - 3: Camera power control, connector pin 24
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: toradex,camera-connector
> >
> > Name is too generally, suggest use board name, we got similar comments at
> >
> > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/
>
> I saw that and it made me reconsider this name.
>
> However, I believe that in our case it is specific enough. It is really
> the same on all our carrier boards, and Toradex specific. It's also only
> for cameras, which is more defined than just "io". Curious to see if
> others agree or if we should come up with a name for this.

If some days later, you update hardware connector to 30pin from 24pins.

>
> > > +
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  gpio-map:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +
> > > +  gpio-map-mask:
> > > +    items:
> > > +      - const: 0xffffffff
> >
> > are you sure need full 32bit, only 4 pin, maybe 0xf should enough?
> >
>
> Indeed we could reduce the size of the mask, but I don't really see the
> value in it. Isn't it good that a user can pass through the full GPIO?

it works, I remember it control input index's width.

	 <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>
          ^

You can wait for dt team's comments for this.

>
> > > +      - const: 0
> > > +
> > > +  gpio-map-pass-thru:
> > > +    items:
> > > +      - const: 0
> > > +      - const: 0xffffffff
> > > +
> >
> > missed
> > 	gpio-controller: true
> >
>
> This is one thing I didn't fully understand about the GPIO nexus
> concept, why would we need this gpio-controller flag? Isn't the gpio
> controller behind the nexus? The nexus just maps onto it. The actual
> controller would be on the SoC or an expander.

Yes, I remember "#gpio-cells" depend on "gpio-controller", does
pass dt_binding_check?

>
> > > +required:
> > > +  - compatible
> > > +  - "#gpio-cells"
> > > +  - gpio-map
> > > +  - gpio-map-mask
> > > +  - gpio-map-pass-thru
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    camera-connector {
> > > +        compatible = "toradex,camera-connector";
> > > +        #gpio-cells = <2>;
> > > +        /*
> > > +         * 0: Camera reset, connector pin 11
> > > +         * 1: Camera power-down, connector pin 22
> > > +         * 2: Camera identification, connector pin 23
> > > +         * 3: Camera power control, connector pin 24
> > > +         */
> > > +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> > > +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> > > +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> > > +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> > > +        gpio-map-mask = <0xffffffff 0x0>;
> > > +        gpio-map-pass-thru = <0x0 0xffffffff>;
> > > +    };
> > > +
> > > +    gpio1: gpio-controller {
> > > +        #gpio-cells = <2>;
> > > +        gpio-controller;
> > > +    };
> >
> > Need't gpio-controller.
> >
> > Frank
> >
>
> This ties in to my same confusion above, could you explain why or point
> me to a relevant example/docs?

My means needn't whole gpio-controller{} block, like &its, needn't add
node of interrupt controllers.

  Example should not contain unrelated device
  nodes, e.g. consumer nodes in a provider binding, other nodes referenced by
  phandles or node labels which are not directly referenced in the example
  itself. Phandles in the example do not have to be resolvable.

Frank

>
> Thanks and kind regards,
> Ernest
