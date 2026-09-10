Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF543B4407;
	Thu, 10 Sep 2026 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065515; cv=fail; b=A2SxYvf1B9EhEuz6b3NlwFF63afw2x39CnLpLu5Chzg1786W/2sImgs06ayhziUYPci49RfCawxDCE7FxJ2X+6OPz101uG9IAcqnAiBGR4Ym37zZOhCJZPaz125nPgM27vCDRRpAxb//JAFMIff799hh+O2pIfU/EhSMvklXxio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065515; c=relaxed/simple;
	bh=RZ98HjroxG0QRJ5UG8eFeKikzKBztu84B1FRWUFq7BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SaTVVIOQvaCD1De4nNSZTHeyvP+YjKRj6GWqL8KwVPyidZkKhv8zEkdw3ndE/c/1+AmYhZBCQW8WK6/y9wtEKaGg1Nm0hc4IMxTjRxiMQbMjCIpmBPDoAe5dYJewTFtClfFoNt2p9YJ1cJ4G3uXL6VTWupQFV9++ZZgjwuW51y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D6NGYadR; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D6NGYadR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFvx1RIh/mEwNSP5o8hyzG3gv4LdHYVhUIj3I7pOjFd8WhjaEzq9vnDfJbvcSiJplDcYi2EkSpxOhGqGKmxlqAofzllG/PTnypa3mujSI/H9ZS/Y78sMVORgCgc++oK/tM0sYHQ0R0g0j3wuwE0uPHQ30NvvXOma/XNU+Ce4d7KrcNYGXNBXpno54sqj+kYWTOYLcTWWnElrGMuOy803K5fji0w4m6PD5G+a/NO5yrO5w8COSfXY/+lke9qamjGJr+tTj3iLChkrkDhmN2CQntCxNruI+Q2tQ01/4vNmEg+X3Yjlifppg/DPvyT9Abx5cAd/xWeuFkPA+dgy5LesGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFX6FttHVDfP4RsI+fLqhqmLyj9OPi7KCX3beiiWEf0=;
 b=m/g3GtQG3s87j5N6YHWhCz3nNDcrH/5aad9cAxVRG3G0v/JC/eW/+OOA+E0Lkhn8/qbdZo7XMvGM8Q1D3xNdJCVwF3tkKLQSQjAG/gz6QLzFve1wwyYXgTCRRl5vOjZwo+nrdgcPj4sEAGAycTEVtL1HbyLcSCd3F5HIkx8GTjEtJjYGgaNUWT6xCQr7ExpFMnu2o821C8XHm2HPHJfcr/aIc+68KJwNupKHkIZn9iI+F1bqI7keLwwQsANN77mWtYFXSpzAhBKyHUbAAZrr6VaHI+bryf23xWbo6ZzVV8ubwnqOLOK6o7XUmxUOA55Ds1UKjIarGB42IBxTYYOSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFX6FttHVDfP4RsI+fLqhqmLyj9OPi7KCX3beiiWEf0=;
 b=D6NGYadRQTwkjfr4/+Lt8zT6rop+cWucCqgup5DtfWYZrVoufXns65yzQOZ5fJJgf3F+xkGhW3xHyyquDITzOp+ZZ18HrFluyFAI8QXpXsRdYPwM4uOBSFibPpSCaKeBusgMx8+V+hD2ElekOUzjsrqLTIrvev47NI8q5LL7SkMegPKORwFJD+OUgn0J2l5erBYgb9eHJKzUmbn2T29k1kw9icKlJseS1HbZd/8H/f5mFqpk5erGX4JaJYgbLLLukN9PBnYHLkuEFBfTqRcl5341+VKccxMFXWPIuYkDcKZUKn/hD2994T9CFaDXcxb1SVQdDrXCf3H1YZyWTmYBpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11306.eurprd04.prod.outlook.com (2603:10a6:150:297::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 18:38:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 18:38:29 +0000
Date: Thu, 10 Sep 2026 13:38:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <aqL5GRAP3JFFRWSV@SMW015318>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLk5UAv-j39Jxd3@francesco-nb>
X-ClientProxiedBy: PH3PEPF000040B0.namprd05.prod.outlook.com
 (2603:10b6:518:1::5c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11306:EE_
X-MS-Office365-Filtering-Correlation-Id: 363eca0c-0d3b-422d-927d-08df0f6ab55a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|19092799006|366016|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	LXZ0yjTSB44CCL/UgAJCbPVa9JfSc7n7YfSKjXNbji6axF9tUgagbyYlVcheDpbgUGqxf04zHwAuH9Inn0+rGVBFjFlsPvjuFlIdo/Bz+hZeiHG2pFR4egs+hJ4iS9YZeAwlaJZINoqigljKBmG91mNpw6H2CNuyuQ4FOWM3MhaaClwbtTCk9LQAAB2ET9+WnexIDxm0T+tXz83mldb9Szxpm3GRu/GQl3Y2+IapVd0Z6EjIlWzl/wfrvNpjzcylpUYFmFwXY9O3u675DlPY0+iTOydaJ/2PJ/PVdw/5NJ1rlf8rXyAuatuUuPBKw7yN4DRma6TW3dhgAeYgtjoq2RzMhZgBrFCQhuIGaQdCx3m2y5WctZcUWh3fNI7Lqy8Ut/uvjXOz8/tpnEurzSNcgmlaxVPf6wWFCdX+BC4mvFCKQSOo6lwMWrK+Kf6Nj61wCkl047dFfwTVMZ6wa0klZnviwdMXYuth/BaY5cik7L3DeJqGNlRJHTcYmvU4v6fa0mL6q2dNorqPaBpMGBjxl/arhsHiZY9PtEsPP2uPVM13MOZ8r96TFkb24qyE6gV/apn6SElCkyEBYjlP91/G65S75Efjw30LSc0whCqwtxpWKJhqZUlk+bMHwTbq0Sm1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(19092799006)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j5JU7fVZ5HXCqa092q6PzIT73uXKe5rO9hhfZk467KYeEthBwY/2r3P5aCt0?=
 =?us-ascii?Q?mI2f3cbjCeMkqK+ShjkZw+ULYocUaqMbo5Rui2w4RUHE8vyxXcdU3pbe046g?=
 =?us-ascii?Q?jVN9XPaSDGSu0RlnnbfNTOClURr8lABE9FLI0QuXhd0cNTFvFEyiphhV2OcC?=
 =?us-ascii?Q?MmY+qqa4y7TaazVJY5VKVuABYBEmyWiYwu95FkWFiWTdhDfD0MRDQnHiwy12?=
 =?us-ascii?Q?AX4dstNuvsJEc6Qy1MLrUOIFPJwDinZ/bxwvznWFv0DBCzJvLhjqQB2xV05Q?=
 =?us-ascii?Q?ljWpkaYL4mkW8j668H/585EcitwhhdurzYHVQeK6zt+6gw2wyuvpnKj9FHVn?=
 =?us-ascii?Q?9ETm+UZ1HkpcK/bn1hfRzcV13di8Y2egw8/0rDVxW/VkDHk4tsJ9Bk1DgQVJ?=
 =?us-ascii?Q?lYvKUpNAY49+jcMDs9J+cTYQVE6BwOQ59cMYHrY7RlFbPATPDV9bgkJoxmFb?=
 =?us-ascii?Q?t98a7lQ4WasOzuY6xqJkNYw2ZJ/Xvsyc95c4OkJt04UkjhuT/z4n0spLvnKL?=
 =?us-ascii?Q?TFCxn41WB2BUqFeeuUHSu/x7sQTHh8uzO5iUkd9DIHacS/ADJwX1l6ioox07?=
 =?us-ascii?Q?qjg11LlFO5v5gwWeipSJAKf1Y3NhyIpA98gRBspO2OACx918nm7LPbGje9ly?=
 =?us-ascii?Q?MT+r/ALfZ0Qt1BIqO9vjnsRT5Sx5CZ21fMCmJOOyAOy7myAn+1EAnjXJmthp?=
 =?us-ascii?Q?UY/fABFPljo71aD94NlUdW51pmvHR8NyLvPBqkWFbbmRrIxpTRmcH55o/Tba?=
 =?us-ascii?Q?UurNVARXe0X4UNn84r3fWWHCQD9QP9WayqeYrtjEi3hKymjkz9MR2P0REIUi?=
 =?us-ascii?Q?kjUMK2sw0NLwtrx5o86HSA6Vy4QhX1LLcpBcNQP4yJKugxv9gd4xGnFaZLF4?=
 =?us-ascii?Q?U0YYo9+fvi4cq1U60sOVxDdZ8+R6KmIQQgP+Ky6GvQDqHTzjeETCt902PMFT?=
 =?us-ascii?Q?vf5yNMONspMM+mf9ThUm0TyB7jQQ+F/C1Zw0Wp9+v9rV+iLJC/W1BmMwg5wM?=
 =?us-ascii?Q?ca+FYtvJjfSldRNgPOHEhQK2MO5w+7fwzyzqv2sp/mJuZn8p1UT/O8qIsTuH?=
 =?us-ascii?Q?ZMzJyO/IdqbtgBV1CxqNZ6IMeCaNwIZkaWc7EDnFNzC5sJ7mU03elcOZT0FW?=
 =?us-ascii?Q?4XjuhK13xmfrqdDNfd+4YkLeNhT15MS7ZGP2Hiw3AEEUr7SjZU4C0EPUHr6M?=
 =?us-ascii?Q?xQyUgkWIretmCZrFQJubLpAUnmEx20/Zm+wfrAgc7x9DBnF0zduKIA4zHJPJ?=
 =?us-ascii?Q?m25NNreHAEde+mTql1no3wDuRPt0qBmBYacdgL6FKgutxIHz7kC2RsOrfa9F?=
 =?us-ascii?Q?DyYwv4/fuN4c8xCUMGIpFA0Knhssl/aGjZcSoTFIJcsspqJzw4KpUm8klJBq?=
 =?us-ascii?Q?fAjSR5Pb4arB3+/Hn2NlF9gCWANlMuJZ3G7TZuUz0YCEdVKeT4tt80Lru4J5?=
 =?us-ascii?Q?7c8VXspiuRNr2DupxhfxuArGuXHl6cRCrxYlF+hKAnZQek3CglgsG2gmNqD1?=
 =?us-ascii?Q?iORy5ZFhHdUGbWtcmN8AJOGf9jULqQJ5+UfvZXZo/OKJPi246Mr9F3A2LXv+?=
 =?us-ascii?Q?eck94I+TaGso9iZDEKknSy+g5bMWfVydko4i+QZARjCYM7+ef7pY6958YqfM?=
 =?us-ascii?Q?puUWFR5P2WdTRPVP6aAec2YS1RqirAy6+eOBFtH1HpXV6ORVdmjhwK3Q66C2?=
 =?us-ascii?Q?HlgbE30PP82zlb4NsyMy3kW+g6pA9QMrj70cztB9UX4mHU5TW2BjrqCnFgKO?=
 =?us-ascii?Q?JYQb7W8ES2V2v+7vuqCTdbvPdKWzv6h2q1zP2EMv7gFXSwgbbubv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363eca0c-0d3b-422d-927d-08df0f6ab55a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:38:29.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5Hnpq5mBw9nF174u17U9RiVHXD8csVlJkWTENF+37jW5scOsCI6g7GsrMfCY19NhJqqCRNmw6S7as4NVNvbvcNwbxnLEbZ8jlNSPYHvl5r/07sVkZdoe0zCMA/A7E6A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11306

On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > Hi Frank,
> > >
> > > Thanks for reviewing this so quickly.
> > >
> > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > > connectors to different GPIO controllers. Camera overlays which name
> > > > > those controllers directly must therefore be duplicated for each host
> > > > > board.
> > > > >
> > > > > Describe reset, power-down, detection and power-control as
> > > > > connector-local GPIO functions. This lets an accessory overlay remain
> > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > > > remain described separately because the GPIO nexus does not abstract
> > > > > them.
> > > > >
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> > > > >  1 file changed, 86 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..06e6836e1aa6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > > > @@ -0,0 +1,86 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > > +
> > > > > +title: Toradex camera connector GPIO nexus
> > > > > +
> > > > > +maintainers:
> > > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > > +
> > > > > +description: |
> > > > > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > > > > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > > > > +  signals as a GPIO nexus. The other connector resources remain described by
> > > > > +  the surrounding board device tree.
> > > > > +
> > > > > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > > > > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > > > > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > > > > +  A board may omit functions which it does not wire.
> > > > > +
> > > > > +  The function numbers are:
> > > > > +    - 0: Camera reset, connector pin 11
> > > > > +    - 1: Camera power-down, connector pin 22
> > > > > +    - 2: Camera identification, connector pin 23
> > > > > +    - 3: Camera power control, connector pin 24
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: toradex,camera-connector
> > > >
> > > > Name is too generally, suggest use board name, we got similar comments at
> > > >
> > > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/
> > >
> > > I saw that and it made me reconsider this name.
> > >
> > > However, I believe that in our case it is specific enough. It is really
> > > the same on all our carrier boards, and Toradex specific. It's also only
> > > for cameras, which is more defined than just "io". Curious to see if
> > > others agree or if we should come up with a name for this.
> >
> > If some days later, you update hardware connector to 30pin from 24pins.
>
> That connector is there since years, not days.
>
> We have multiple cameras, designed to mate with it.
>
> If tomorrow we will define a new camera connector (that is absolutely
> possible), the new connector will get its name, maybe
> toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> whatever that connector would be named, not just in the DT, but also as
> a product and on the actual HW.

You can wait for DT team to comments this.

Frank

>
>
> Francesco
>
