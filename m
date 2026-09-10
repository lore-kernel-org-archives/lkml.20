Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988E4FDE6C;
	Thu, 10 Sep 2026 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057599; cv=fail; b=khMOhdN60v1oH4PmtfeiAkda1oQr5svfmsM5yjEMteztaTosvmXyKlBEjAC89jHhEYChcKOWqVd//WVapt1PAOXCsYezFahd4w6Qsq7yDeXSLlkXHoz+75il3yiCFAXQNcoWb4LyWIlrXaU8TkKVCNYLqjwQj1DTJJdm/xe/Hlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057599; c=relaxed/simple;
	bh=iC1BNZj61U7UCVwaXSwNwEiOPVbtOt9Fg2rN53FNzRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EOj2YGzs5ieNEgzcWhPyp8gF6/BEPr8pxkvbDrVdz4Wp+vbxwHfsJWFX810iIYzi6nWgsviNkW7z5OZHAICGMpAoPLcZvbeK/CVCq18g1J+t7fus7PeGFJZa4GVbKP0p+FzDbs2p/xz2HgSg0lpf/VgSJjuAsViyk8c3gOi3WhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NHrV4XuF; arc=fail smtp.client-ip=40.107.162.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NHrV4XuF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZEXKDlufwgROnDlTXgJ5cFDpaKDhSjk3+AUjm1d7ChnL4FMTfBtNmG54aVW7TrWVFnWSHtXd6Cp0tQIq70/DS+0xc8I6Nec9SA4MpoqaYPtwdfeJ5TkA8xs+zPV2St750RvOz9CUwJjVnqULkERF5ReQHjJpk0kD6AQa3xIHuMlSGupqeiIQ+C7sQi0Anek6Ue8h7shbf0cLIkHovLK4ctb5H+vNnhveBGiRUEzNWIgAAb9RwrjY3uPB0FEPx4mOmuvHnbdCzuX4v4ZI3CI+Ud7QRDL0YlEwqEJKjUS5QU/yvfpVYL3fF1iNNtfCrhLRjxEvS/U6lv0EMdvIIeT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPUTII5jib0Plmd2JAI4VZ2bRIQ0d18sbZnWQYHBjDA=;
 b=iE8OHJBG1xlVy9brB58RPkLAYhLbVsYzLSB0RXdxfR7+KKtseUm4Ecw4JFlRkML3YnTtrm16wswh2kVswtygkxfBPXiE7L4zF+KgOqFKYxXLyOcmBWru2M7uuegOkliW2SrGaOl5Qd9pNIFDHxWMnJcdKksxazr+HB6OZK0Cj5o3awrZDlG++w+GeQN5QqnCzi8IuMnRjSFtC7CES3k+XLilw89CfZRMgFY0mAel9aokJl3HxDoDliyLhW7oYyFHGmv/aHAH5bvlesLBdmrwhe22TA9JWVmQJ754XP36Wh+18AI3R3YYk8Q0ojyKk9PrDsgk8zgsabBZ4XV5vW4NGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPUTII5jib0Plmd2JAI4VZ2bRIQ0d18sbZnWQYHBjDA=;
 b=NHrV4XuFqEU7MsMf4+6K9g/LGmiyftBPb0FCt7XU0QKFVxvQ4f6409VWrSz+pYG9OUZf+bs+AM3Re88jlN58HDJjp38SATax1tQLSvr2MjDmAx0IoEYQ4cOEmTWWNG5e/VD1Jka/OnDt5UVXwPPlnawddb10jzoRsmT8+p/hWK/7ovUoZQmK7JVXC5q/uLuDTFdWc8MvD3LjxsFBQX6GGYYS+3IIUbFsGJhJQ8i9P90/R0Qo4HQdbHLZ/n7yhWkUoYjlRBV1lkTXxTjYa7zIuSfBJViOMSY68dVBv0AIg2uiETEzJUiGgaBJUt2yzjH0/d5JT3UybuFTXtzpH5ci9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8293.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:26:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:26:33 +0000
Date: Thu, 10 Sep 2026 11:26:22 -0500
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
Message-ID: <aqLaLmz7n31P6igy@SMW015318>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
X-ClientProxiedBy: CY5PR15CA0238.namprd15.prod.outlook.com
 (2603:10b6:930:66::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: eabc1c01-4576-448a-5b90-08df0f58469b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jMKRGq6Xv/C0uqd+S0o2smxa7hyQ3RrB+Wa44FOc7sbEFkMSrvUpbbVxD+eFkaGYEy/tHpGFXKWGFhmcy80bpVpg5DoRif2Iw3lqvW9bnpWE4vtyzi4x1fq8rtf5aHLJS73zWx4rpb/Xg8GDFpaz70e0ROHBHOcoeJBNJ32Lg9d9g0ijaQTyTclyZvAcjrFChTYeHuCdsptmSmrp9Z6mF2n3UQYWn3o9OGfn2chr+y8CEtbHJDakzd7Cy2GD5YQWj3bBKxQBTKIJIQKQdg/mMotYYjTZXPrC7iBV1P+v8AC5AMQJYgtmDZPUHv97wSLtMQz04SIY1uA+dDz/z0sKs5HWyO4+my9Z1Sw97MWN6fUmOcTmNk9fexJjnU4CgTv3BgqntDGCexq9UshF/slAgCGwKH28n1xs0idQvTS8SBwjhiJQn38kss2aV1BTr8bnH6UeG+QknAJxBN0qUKcmlcoPc+iHriwilCWLgt0v44vxxN9KyeFotlbhhIRTKMs7zgRYhcAbp2cgiEQgT4OmWrkMvtEPsBUC+/Z1pfHBqzBeyTvzm2UEocyi9NEZ47BAZPMuHspsaKJjoGTX3ZHijYXdZHXGbtwMA/vEBQ+AOjFpfMx4hUnDDmtCJILYJ3Wu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f4jJf6nWfT45VeHiUeWuKhh4k71//aGM6h/xzVs+ab8qKf5rHtR3cXALwipM?=
 =?us-ascii?Q?anGEXi0r7tC275BryBd9Zxgz3DPRp5ACwnpEv87dGC4QeOoDt85NzoI0ANSY?=
 =?us-ascii?Q?uxclEYA8w82c48au6v/EvLDlR2rebqO9wqFwALdkA0aohgmRxn5gZdrGl4PF?=
 =?us-ascii?Q?zPLOxwXkIhuE+hZZZxfTymzZB9IGIF3rl/xrX3lJ+YA6TD8JXbZJoHv4gHb+?=
 =?us-ascii?Q?TcTW+Ojx8sX0t93QtKtayZZz5uqh9WgBhZELMyg9eWm3RjG6NF5+AuRHDo3K?=
 =?us-ascii?Q?cePcA2uhUB8cCBLTbysEylUJSyXNZVRZeO4fwio+eCaOXHcnKHjb6BWiB1me?=
 =?us-ascii?Q?gRtyM9RJcZDP4JUfAB0ziTdDNmMLjlYWLS7L6IN6jbb1BFh0kefghzw8B8i2?=
 =?us-ascii?Q?9pQuVhtAKHFt0IzCKLzvrOLGq8Xxlqkz3udpO5G6VurteyFpA+oZztK9paQW?=
 =?us-ascii?Q?D4W/2999180PKJPlzFnuIc0SMUp2mU0ACidX1fWZOWUZCC2wHc2+xnIKvX7n?=
 =?us-ascii?Q?uyM88yUSh49YRKyLVmQbQkX4+fVXODVZt9wXgzmrdRuKfWuH1V996rABoGxs?=
 =?us-ascii?Q?itXJ5uD/eKDYgEJB17svsUGtwqw1UUbS270YV5LZ+xKLzdRgkUVE9oFvqhyt?=
 =?us-ascii?Q?ZkjIdyIqemSXtp18H6w7ju7VVT9UmkJ+4V7rRP0tm3lc4AUpnj93kNvLnOLk?=
 =?us-ascii?Q?fVWIbYCXVtlnrlq/p/Wu9GhCxE/LGIqM2jy8MqGGRIREH3ONa0QjnbaBHX3B?=
 =?us-ascii?Q?CMPhVuGpR52diiNlMiwJObUy4qiAENw7cvkqbBKM467ps2gNUR+NV7GwI8Jz?=
 =?us-ascii?Q?QJuA4KL8yrKQhPsSIfO3NowKrTBK7/ceVH4R6IJDl7ZNwvzpmsebT8YYVe0C?=
 =?us-ascii?Q?6v+Fp2ODDZ9B0YwapvmpMOUew1FAC9nCTJDiHN6mbBV+Qap3tdBbx/OdT1aD?=
 =?us-ascii?Q?5YzwiHWZcHMnmuSK6xUpuNue7itZIGYxiqUC7J4B/ZHFZnvUeUQtyAFwVctn?=
 =?us-ascii?Q?Eo7otKndAgqUeIAh9TF5Cr0sh/t842aqrmeuMEvMrMIzO5MMfTnp4pLcs8aR?=
 =?us-ascii?Q?z/bAVREg87kJm68/Sp+XYlpAVt7feD4BpbO7gWfZJuek5pdn5oiGSsgQBTV5?=
 =?us-ascii?Q?qBbtmG87ijleRm9ZmMlN2tTSimWha5ler6smv5IilS27JjZG/cwbHwVnyMSG?=
 =?us-ascii?Q?a//84CPjOOenO5Td2SSQYgxqNk/FVGyhJRglycE1IMmPBDBSD+Z1irFM9dHs?=
 =?us-ascii?Q?bivdgy+MFwLDc1ajmosgOeSFo44ZECsEQ07ujixKnCl/UmOohE1XO4jzyVQc?=
 =?us-ascii?Q?hsK4L1PrwTtf5vT9hFbm2kCuZHrQKvSVScjt7ffogm3Oy74Lt022DF0cuNmz?=
 =?us-ascii?Q?U5ww2018Wa52PKByezeAhWbN5uMaQVb12B6eIlGTT6XKvpDoRKEU8yEF2lxZ?=
 =?us-ascii?Q?/SQKQth5pG+z+J9HNf097eQnxsmJz7l6RFlQgOI3kXCII3r3TfsivadCuZih?=
 =?us-ascii?Q?QLhM3ki4wzAzynDO8K6vdnox5RL1b0HdnYXbISfH4OFw4YMw8+V4QijA+ukZ?=
 =?us-ascii?Q?FSkWUDDOBIcD5AzHxnuv7Iljols7Y0XqjGRYF8qVxz0snkS5aATKrvLoJ05c?=
 =?us-ascii?Q?U58HsLErl2mhBwl1D8gYdmZhCmt8MO12psHNHNbrNHpkGE9dW60pI/lIULEi?=
 =?us-ascii?Q?w6KcWvUUKpTTjUrNu5ADRRMyZ1OgdU6ruUuZsrKD6nZ7tk1AzUjzBmUTgUzM?=
 =?us-ascii?Q?fbqfymdvs23t4bSztA+pjdyuzNCMzsHbp1J5W0SSJBsvtkN4fDk4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabc1c01-4576-448a-5b90-08df0f58469b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:26:32.8906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUz79t3hjBGoN1iw8MrO0hPUuoZBE0jYnksh5Ad6I0EUtJcdaJ8aMTVepYQU7tMsV9aDYk+MlWliBsqAHjkAZDHoW9onaQx1+7/VjBkgB5BS3L59hQufNhKtCPYJ9/hF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8293

On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> new file mode 100644
> index 000000000000..06e6836e1aa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: Toradex camera connector GPIO nexus
> +
> +maintainers:
> +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> +
> +description: |
> +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> +  clock, power, and sideband GPIO signals. This binding describes the sideband
> +  signals as a GPIO nexus. The other connector resources remain described by
> +  the surrounding board device tree.
> +
> +  The nexus exposes connector-local GPIO function numbers to camera overlays
> +  and maps the functions wired by a carrier board to their GPIO controllers.
> +  GPIO specifiers contain a function number followed by standard GPIO flags.
> +  A board may omit functions which it does not wire.
> +
> +  The function numbers are:
> +    - 0: Camera reset, connector pin 11
> +    - 1: Camera power-down, connector pin 22
> +    - 2: Camera identification, connector pin 23
> +    - 3: Camera power control, connector pin 24
> +
> +properties:
> +  compatible:
> +    const: toradex,camera-connector

Name is too generally, suggest use board name, we got similar comments at

https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 4
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffffffff

are you sure need full 32bit, only 4 pin, maybe 0xf should enough?

> +      - const: 0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0
> +      - const: 0xffffffff
> +

missed
	gpio-controller: true

> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    camera-connector {
> +        compatible = "toradex,camera-connector";
> +        #gpio-cells = <2>;
> +        /*
> +         * 0: Camera reset, connector pin 11
> +         * 1: Camera power-down, connector pin 22
> +         * 2: Camera identification, connector pin 23
> +         * 3: Camera power control, connector pin 24
> +         */
> +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> +        gpio-map-mask = <0xffffffff 0x0>;
> +        gpio-map-pass-thru = <0x0 0xffffffff>;
> +    };
> +
> +    gpio1: gpio-controller {
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +    };

Need't gpio-controller.

Frank

> +
> +...
>
> --
> 2.43.0
>
>
