Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F303C9890;
	Wed,  9 Sep 2026 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971647; cv=fail; b=qux/An2pvgRT0Yes4VfdSboVN0hBWDIk9q7WzCC/AwgDQ+vey1wbTC7KEU9lPngZBLPM2gzntI2x2PZk84H05Los4Gob9eums4Ig5JULE66N2DJxBFwhpsm/718Z9j0GTyd0UrPgxe7lm2IUzpLZIzWrSjnqL+KR7sZdh+7YQME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971647; c=relaxed/simple;
	bh=dZMuQQHdsbuQRHzY4cxmcpgvl5bpkGKHwVKHtFExzLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FDljBmTTkleSMYLvGce4PubgeWu6qoQ0pDGliU8ycNObcLnVQEE9RBDsfFGUkuoPHX2fPf89v5zTOH9KRYv5gBqN/d4hU1jR4qNsO8BV+D6ZeUq7k0ePcmMG/oaM0lfnya6xlV1SrpUqQrZK4L7DnpUAW6vONi9mH1g+UKmIpYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=si5wlXYu; arc=fail smtp.client-ip=52.101.84.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="si5wlXYu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idgNsJeECaXyhBrBYdgKO0LGRRAOskHWfDIx05Vpr729c5xhGhROHPSy+UPohgZU7UKGqiWnEsOnht7JCmugaNGvEVacFgYK9iJ3hN59dlgZeeCK+n/wdAawNuoRo9EWi3NQ+XBol8rznaMAx2rtIDa0YV2BJuVxrtIKBoRnYA5BZfypmAZs4sVUYrJCeQfZzODqjXHpqc0E/P115Ew3LjVVCMnMzb8QlDyy2EGO1w+e9PxfdZNi6JHlyPugClgphXd+wJ1szYL70l0e2cwOYQDcF9uBtULOpXiADILwHJqeT1GhftwyjcL/qGIHbTKe6/D+BhZiv1WqYc0XzeFCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDFpvjlAG5dI9H78MjOXlCjw83BoXamG8H0r6ZNkxMg=;
 b=J24BHFkkC9IaDt28AeJ5CCExKJMTaExWsGNd8CAO89C76H2oD8ePXRPdgDdb96tLuv///mYpNq0PcIn33hthDtohxjBsLOnTXkvYe5+Sc3L4NyjDVnQCiI5o0aa7W2+GnQ8PdcUR1tePrQcDmCdm0GJq9G0DiEwVR8965J8Ihb3NkbIGSlrKmfCZAlxM4kZTSo6kcTXzowmLKSYIlLy6nZiGyV3YYoWjEjgZNoAa+ir06uYwo5lRdA6IAaqI/NBpQQSOu5lRfcEn0kKDjuO0bBR3tLpnd63rbQxeLtxusIe4hbdzG2eydeMRJkfmqiqoYi29aO2BTelN6t7qn57SZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDFpvjlAG5dI9H78MjOXlCjw83BoXamG8H0r6ZNkxMg=;
 b=si5wlXYu6bRn0Oh2Ij/cBo8I9luZnLl23Z2rZxC+8sjEOYhfeQ6YiN/ROZIMJfSyvQ45rR7JqFsBFzf7WPbpxy7Ms95Nv3oAqU9XrLz9iSKL59x3jBBIwO2aln8mI8LnJh6khnQO3qZ8LWJu7msPOF3xPcJ8rULUq3AIwSHb4KKipJLws9oIvqDuTNkHd/v+3Kg4XYunhAV0A7zOz/s9Ap7miKOfqqM0b2qWx/W7r0m9nElsqDmTxcJCXHReho87CSxQ0LvcNyykPo/UznwnnHwwy4bVmTn3Lm3+QUfIGn/vdP0gSyWFcZWNNhmutHisghm/WLJ6liAUFm/GdReT9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BESPR04MB12586.eurprd04.prod.outlook.com (2603:10a6:b10:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 16:34:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 16:34:01 +0000
Date: Wed, 9 Sep 2026 12:33:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org
Subject: Re: [PATCH v7 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <aqGKcKS8wJ5K6Pwr@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH8P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BESPR04MB12586:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0eb137-67f1-42c8-78cb-08df0e902767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|23010399003|1800799024|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/ipROqXvdNtWOBj7gpuGx7KE6xuZK6J9M3ZlEsqWvqZfyMCi7KdcMpHjP/xQ7ABV6x74oQ+6N4yuxpDlLh/6vFGENqRuCMOJ0Xvap+kLNJR5wB9MaNAg9BoZr7amlCvGpZCjhs9xoSbpVyRaXOZ8skPfzLtUy2HPabhu52i+4j4b0A7U6jO88Lw42f9iNvTZoBluln6/m8nNyRNU/xsNtdb1aTuqO2AMzqLb7P1QFiFDRGYYT4Le8EFTG/lZVLa80R0hsh0Kv52LPSfJEupWbNVKnrSr1Jl7Dth3fwx0j9mx9f00RmRuNwGTCfOlaH2Zu2Kc/KaLH4IbM7kFTWZGFDSNpSwhMbsMrQvA9ABON+iuifH2TMS+2AJ8XA4ndlyWvKpfY6qi+HwfHznEJBXyCoCfIEew6qaNA6vWq1mDvCRnPI4WuoqAaite5I5Ksc1gzJJjasYoY5MO532Zq9/vohFT5vQqFvMwVK11SN0gtGfxAoeUWTvkjaVMHUXN5DMxUaaO3my6MRBhoJM+RCRK4iBPOw/XpkvkwhGSsrzVNQ+4TCnmc0sl1Z6gH7lxQlN+uSw5h/byA6TgCppUCF06n3HcTvF0rcWPeWrFlJR8DQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(23010399003)(1800799024)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AUODxs/+LCYfalZO6tjTH62GoNy/XC9Ys3pvW0wcywCYvPluulNRPhgOS8Va?=
 =?us-ascii?Q?y7jXwuTlKkmv7kepneW5jyXfacsDNh5KUOdIeQElbxokeEtRSDLRs3NamWmP?=
 =?us-ascii?Q?A61dQTVSWe76BFiDFY6I6nzoJmb48vR5HmaA5sowOFT9rBdCLM5siqkNK+Av?=
 =?us-ascii?Q?0w1JOFxywA5PkKFOewRRd5y6Jj1on7lsnAbtYYHne/vum5m8LkbdMUd4Tg4o?=
 =?us-ascii?Q?4+TbxUMghgXF1ZYbG/pUIEz5nOISUZsK7gGVUNrs6NFqwCX649Ox9oDYKhLO?=
 =?us-ascii?Q?bZ4sd+ytTbI6HqA0zPB1r74BUBlzbTJHzMdRsVNf/SuFZnZ53kgRIubZ8VLL?=
 =?us-ascii?Q?UnSqJYsHDYc+tLxJybZBZDDKnJ6OheST9gEO49a4sub1uQ3CYw3E9iAUFE8X?=
 =?us-ascii?Q?VYR4CvyapfV3dopk5zsXYsFGp9Ng7Q2xEispgfZQfRFSix7S3PrvE0QmERwa?=
 =?us-ascii?Q?uYTUMtNN4A+Vcb4q8hwDuktqhkY97S1MHA7roBnQfddM5ss4AFdNK3b8Y7aH?=
 =?us-ascii?Q?oouJACceJqDpBcpg2MpiBqvFTmNc6jswzwGHUZAXTHEcdHKworqRYdjWmiS2?=
 =?us-ascii?Q?+26H2M5VtsSIgGZ4dxsZc6/dt+e7oaD7xX9JCENpUhV/36Vf8OVY5Gh9DN1t?=
 =?us-ascii?Q?dmhI9DP7RsrmCAjEg2E2ih4T4c++mUea3Bng1JeYsGf0cg440MJei25KnsJg?=
 =?us-ascii?Q?bHg8/99flMEZCdJPjYmiMeVbfaMFjB3OFaljIX3XMQqPEnaD8jPkc0bKZ+9t?=
 =?us-ascii?Q?bhOmG0lAoew8JRI1CzG8YSefmX8JHWX3EE8WzakVWUXVEryFUSmwj1VIA/JY?=
 =?us-ascii?Q?ii+eDjBqxdc18ZaHRYaeENeeFHMEj6dFfQtVW5sk7DfPtnM64YaxM/+UryCw?=
 =?us-ascii?Q?jv6fDYeHwkzLxZyvSFNpAgqLnRYbqW2GHtP7meuxopiXJ1hxm/RrnscE0NV/?=
 =?us-ascii?Q?W53yRonVw2C8z10PzrlBeFoHZF7crFKjkgU10NWDbriFBYzy6maqbmapIDIP?=
 =?us-ascii?Q?R5LXVo/NWI1Qb5ZAmVKno5SXPEeVl5XrwGNu6E1NvQrfzZ9oHqN2cQ47BJQZ?=
 =?us-ascii?Q?VxVs0bQjyz2uHZ3+V6zY6E4jU8bhTPjFkCb0AJse1npozsd9EZg1aSM4vUWI?=
 =?us-ascii?Q?dQK65wkHN8xGxzbseIoREjKaafkhoCCqVhU8DuOvedrf+DVwPwNT8zt8yda+?=
 =?us-ascii?Q?PwX4QOPH6WZLAvlJEkVHRdIj2kkLG1BRrq/XIO+j+Gi3s/18YWiEKIXmBY+o?=
 =?us-ascii?Q?aYlo9Ja8mVpSefIxetSQ4v1ZAaJpsfdmcRLeoDmWHW6Ln0d4XxGgL9wmddFd?=
 =?us-ascii?Q?wH0B99N3EqMCiI11Nll564qSJ/2yHBwkNXx4lHgQOnreLpocoK0W4D8Qr3TT?=
 =?us-ascii?Q?UIC5XtXMTyN14j1b+DYSNtsrL9GfYj1zpeldJcRKyY6CMmx6dWN8vy4zIh3A?=
 =?us-ascii?Q?Kk4Ip/JE71jZZpdvksG0po2XIONenfa/p7Zh9qCrVdOydoIsRKao9rFRYfj9?=
 =?us-ascii?Q?GhJ13teQICXIEpv2rzLbpo0kWJhI5BN85tiXA4WHKz5B2feJgrDWMy4lIUlO?=
 =?us-ascii?Q?VNRfenKGJcGoOADXAVq6lyIh1nbAVqktPLFBZhQw1jKfdOhyFtYBbUIy3Jkq?=
 =?us-ascii?Q?XWEvRT2+X43GeToVMh9lRj+ZEIHamS7fd3xucP1Se/CwY6WR/rIAxDgMgku6?=
 =?us-ascii?Q?N/IcANoaNsNWsOUMyx/EF0mlxbcL8lFGxaTvsgLqEX2ydMvXxr8uEit7z7Ed?=
 =?us-ascii?Q?6O1avEASCpeNfaw7W8CX53WEOwkMkz2BpzPdSwQkOfnm39yLntfa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0eb137-67f1-42c8-78cb-08df0e902767
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:34:01.6224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIKi/6FRY9235vz78kQqQDANyu6c45X5fdYQCgg2bHciJ2IzbXQcpqD+Bcv/fCAEjI/MgP19fMGhikuz899xKnOeVLWbr9Na/ntzc5/Bo1qY2CvrOFHQ9jbiIMmRaY87
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12586

On Fri, Sep 04, 2026 at 03:46:28PM +0900, Nas Chung wrote:
> Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.
>
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. The control region
> manages shared resources such as firmware memory, while each interface
> region has its own MMIO range and interrupt.
>
> The control region and each interface region are distinct DMA requesters
> and can be associated with separate IOMMU stream IDs. Represent the
> control region as the parent node and the interface register regions as
> child nodes to describe these resources.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/media/nxp,imx95-vpu.yaml         | 162 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> new file mode 100644
> index 000000000000..aa7dd8838af0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
> +
> +maintainers:
> +  - Nas Chung <nas.chung@chipsnmedia.com>
> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
> +
> +description:
> +  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
> +  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register region and
> +  four interface register regions for a shared video processing engine.
> +  The parent node describes the control region, which has its own MMIO range and
> +  manages shared resources such as firmware memory. The child nodes describe the
> +  interface register regions. Each interface region has its own MMIO range and
> +  interrupt.
> +  The control region and the interface regions are distinct DMA requesters.
> +  The control region and each interface region can be associated with separate
> +  IOMMU stream IDs, allowing DMA isolation between them.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-vpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: VPU core clock
> +      - description: VPU associated block clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: vpublk
> +
> +  power-domains:
> +    items:
> +      - description: Main VPU power domain
> +      - description: Performance power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: vpu
> +      - const: perf
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  sram:
> +    maxItems: 1
> +    description:
> +      Used to store reference data, reducing DMA memory bandwidth.
> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^interface@[0-9a-f]+$":
> +    type: object
> +    description:
> +      An interface register region within the Chips&Media Wave6 codec IP.
> +      Each region has its own MMIO range and interrupt and can be associated
> +      with a separate IOMMU stream ID for DMA isolation.
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - interrupts
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - memory-region
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      video-codec@4c4c0000 {
> +        compatible = "nxp,imx95-vpu";
> +        reg = <0x0 0x4c4c0000 0x0 0x10000>;
> +        clocks = <&scmi_clk 115>,
> +                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names = "core", "vpublk";
> +        power-domains = <&scmi_devpd 21>,
> +                        <&scmi_perf 10>;
> +        power-domain-names = "vpu", "perf";
> +        memory-region = <&vpu_boot>;
> +        sram = <&sram1>;
> +        iommus = <&smmu 0x32>;
> +        #cooling-cells = <2>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        interface@4c480000 {
> +          reg = <0x0 0x4c480000 0x0 0x10000>;
> +          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus = <&smmu 0x33>;
> +        };
> +
> +        interface@4c490000 {
> +          reg = <0x0 0x4c490000 0x0 0x10000>;
> +          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus = <&smmu 0x34>;
> +        };
> +
> +        interface@4c4a0000 {
> +          reg = <0x0 0x4c4a0000 0x0 0x10000>;
> +          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus = <&smmu 0x35>;
> +        };
> +
> +        interface@4c4b0000 {
> +          reg = <0x0 0x4c4b0000 0x0 0x10000>;
> +          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus = <&smmu 0x36>;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d9648737e92..7387a11facbe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29233,6 +29233,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
>  F:	drivers/media/platform/chips-media/wave5/
>
> +WAVE6 VPU CODEC DRIVER
> +M:	Nas Chung <nas.chung@chipsnmedia.com>
> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> +
>  WHISKEYCOVE PMIC GPIO DRIVER
>  M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>  L:	linux-gpio@vger.kernel.org
> --
> 2.31.1
>
