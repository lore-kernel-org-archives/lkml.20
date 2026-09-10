Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85FA4BB266;
	Thu, 10 Sep 2026 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057064; cv=fail; b=sEWvaEiGk0ofDRssuQL/ThZcAiuPZRDSin39nNLetE4DshL9Y0Hgb6FrMNMCJ/W3DfOkHklU0Wyvz4QBPjMV1vhTmXNb8NasrgCRHUWd/5vTK1SpGkji6ybqT6x9Hnt7VwaQ4TA84sZCZmJEv7J3xfh3wUSeMahc3BlJYj+4yo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057064; c=relaxed/simple;
	bh=ca64k/DoMBjzaC5uexc2OTY1NnTJ2RJXGoEObyY8OVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ECOc/myPGFkHyDWzid2S7GAN4wZCICUA6+Dw4fpjLtqvJyESOuOgzM8sEQkM8XLHox+bZMu27aHKXIP5yrAQI1N4z65T+EFIvh/vZPl0KxlJBqglPvDS/GCa2/XFPhblsA18x9SOLdOlTp27yCexDoFJTErmX6Jq1w9VGWaYpeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FBXl2ZCK; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FBXl2ZCK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmNUhTopGKR6c5TBnt5stLT5hOQX8vN+eL/SHQk6TYxlOAIXCRSoUprYTIu+Humc3F++oFPP34J1sUCRKzDAoVFeCkQDONz/OV10FkTIIXdMRUTFjYCU04IilqF2IPNSuoMYV8UXwMLRSxOoYpZ7yBOIVRrusMw1QIvl6AeKJtypZ+Yt2bDezknG02V0nTOn+aMGpBec0lMylzMzqGExKst6oJkx6KhLhzi/d13yVNZYDrwBb5OONwnIk+gb60ivxo6gKvO4IKbvl3mGFsLl09ulYj1ZNYDbGNtMhLZKEsHhKwC5aSRF5xmKJ0qenlZGXj06IHmzL07yt2jTUYA+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS7c3I6sUZORYahhUbF9vsI3xnaELGdTZ7etAAR71A4=;
 b=sL1sftH0j/n3H1I8M9e+HzoLo4ZPpSKbfxzQUzuLNJfNVOwojkfru+nBIcpJAEfPP58KN0MzRU+tlyi3GyKEnvjRhOueNUtMAitxgvPMq7goqLg1lFxzwbnC/x/c0KW32uEkV/HBGR1fqtmevwI+m/U8wqd+gajXPi9ob1rQ7wXYFl+JICy5RY0vAM2WpRGh5njm81VQ9YTOXQycdxroGt5snTqev0uImBXiHlUEn0g+ylT+J56W6oo7gYGVv417pb+hH589P2k4NpXdxQP3vxbIv0uE7c6GrF77Q+xitRF0g4tWBQBcfUGv+Ld6Ogv+UrBBGjE9udeEnsJi40BBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS7c3I6sUZORYahhUbF9vsI3xnaELGdTZ7etAAR71A4=;
 b=FBXl2ZCKYh8wihNteZNXHScX1BZeHchMqm/jYHdEUrc+fZO1GJbdNslRbJOI4Mz93hvddzjUFJW/VNX3UjOJBczndnthmwK5TjZq7u1da1dYDnZvWoHKRSES/mFZookYf4JPIHx1DIqwdqXWjBs7fFHJsj3vGhPmOAw5v2sAQE6g+YqaWaW6LjBn7DWojDoz/rGJtfDPTCfroA/BLEILf4oQdZ2w5eRQVFX+pLKThNWn3O5T4cRKGHBJoHR5OuUZdwaYBFm60/GH2ZY6ZZ3CH9chHiyqoGM7q9nuVNLoyfqB/4O/OjFV8UKXWGvWGZRv0TjDgHdTAiEYUDDedEVmDg==
Received: from AS4P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::7)
 by GV2PR10MB7461.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:17:33 +0000
Received: from AM2PEPF00070CF2.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::91) by AS4P251CA0011.outlook.office365.com
 (2603:10a6:20b:5d2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF2.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 16:17:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 18:23:01 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 18:17:32 +0200
Message-ID: <9c20a5a4-1d3f-4040-96a1-1711651c3f06@foss.st.com>
Date: Thu, 10 Sep 2026 18:17:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Pankaj Dev <pankaj.dev@st.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260910052340.246717-1-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260910052340.246717-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF2:EE_|GV2PR10MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: c72532d8-f25f-4155-2706-08df0f570556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|7416014|376014|6133799003|18002099003|22082099003|56012099006|13003099007|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	7eTARtP+K5/v4ZsBrlXjL4hQjP4HuBX8SSw7mi3yAS5r2lWphlopGMD10fa97HlCDlnXNL7RVayiHbxnra4FYGTeuZu6hqIweerz3rlvuqRDrzIyo6FskRVfmDGlIAKaEFZKvmKXq/q3QaKeYuYuXuEftolExDWmUCg6/YA07akl8Nfe4EpcCVKHZgonkswf1yLQSCKgSp+nuSJYICEwweO6dCMZ+4ZtZNuRif37SOsBwkHG2c1ik3KXBStJMAXpwVbFDsuuCnQLgF+bZZA/dsW6wUP+MUCL/BVjZYDpUlODyDXodx8pAYC8WMHu6okZZlofWyCV2Dsbjc8A9GKBipNXjn+ga6ZGcFi4FUtBgBR68ZyxlFdzOp19mVZFaOOkvMNKsEKtn/swdq6K+o8ayApf8UFJhPHvBJ2Zfyh2GcHGAJNNGPDJptkAXLF8Bbi2n35GcQHgaECSAjZ9DHuzZUwm/PTJ7a+DQwHHqEIHGdJXQdT9/yNY4ZkItjlqcppDMhNjVhaltJvGgCHXo09ju+dU1CnkYUFo7kLwLCfVAdTTX2xypgx6DnIXrT3RCLfEiHvgwoDkPcZ3JL6nz63dinYaJeiSMUpKqiDlSs2Gr1Af0U0blNB2TIEo+ZGJKA7l7rW+aU8QV9LXtbv90Dc0Pg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(13003099007)(3023799007)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	96WVh2AyrYfP2QznRDHns1eCe9GBZwqeV8aukeblDy2hCIa2oa/xPAD3afc/QmXjus7tnnhoEWkG/hMpo84qZIfXKWzRc1qV1wqKlHq5CvLONAm3XFlNZu5MFi1Q1GvOyOK3W6Vhu8OUZFeda8MLC5zDomLj6EfEh2WfKfgjuRTgPRfAT/KbRTkNWG+XI611dqzatNhplKiEgRcojz/k6/CLrYJ3D35JpPLFlNwipPF7WYneDs6idsZTqTC2wi6tVzR8norTTn6gOM9jgzwbih/cYDvTWeh2X97K6vdkBvod4J+F4kP5h5KShETm+36hgodfyvw4N0E6Pca/vyf423k/yYkMX7EujtHDsn6ww4NIuK0BmAH9TaajidZpsp2uZ61ufQFz3miRkrRgUyy6HzBXeGPoSjGkgmGKQfMGD9O4aQBsdsKW9OK4SeuGFroP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:17:33.5054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c72532d8-f25f-4155-2706-08df0f570556
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7461

On 9/10/26 07:22, Marek Vasut wrote:
> The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
> glue logic wrapper around it controlled by syscon. Document the glue
> logic and DWC3 controller.
> 
> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Hi Markek,

You can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

BR,
Fabrice

> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Fix up Sob/Cdb lines
> V3: - Document maximum-speed
>     - Switch resets to maxItems: 1
>     - Drop label from example
>     - Use generic over-current-active-low
>     - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
> V4: - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: No change
> ---
>  .../bindings/usb/st,stm32mp25-dwc3.yaml       | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> new file mode 100644
> index 0000000000000..96bd557327252
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
> +
> +description:
> +  The STM32 MPU DWC3 USB SoC controller block supports both
> +  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +  - Marek Vasut <marex@nabladev.com>
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus_early
> +      - const: suspend
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  over-current-active-low:
> +    type: boolean
> +    description: Over-Current signal polarity is active-low
> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandle to system configuration controller.
> +    items:
> +      - items:
> +          - description: phandle to syscfg
> +          - description: USB3DR control offset within syscfg
> +
> +  st,enable-port-power-control:
> +    type: boolean
> +    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)
> +
> +  st,vbusen-active-low:
> +    type: boolean
> +    description: VBUS-ENABLE signal polarity is active-low
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - st,syscfg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    usb@48300000 {
> +        compatible = "st,stm32mp25-dwc3";
> +        reg = <0x48300000 0x100000>;
> +        clocks = <&rcc CK_KER_USB2PHY2>, <&rcc CK_BUS_USB3DR>, <&rcc CK_KER_USB2PHY2>;
> +        clock-names = "ref", "bus_early", "suspend";
> +        interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
> +        phys = <&usb2_phy>, <&usb3_phy>;
> +        phy-names = "usb2-phy", "usb3-phy";
> +        resets = <&rcc USB3DR_R>;
> +        over-current-active-low;
> +        st,syscfg = <&syscfg 0x4800>;
> +        st,vbusen-active-low;
> +    };

