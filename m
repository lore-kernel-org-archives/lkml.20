Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349F484221;
	Thu,  3 Sep 2026 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430791; cv=fail; b=VIpxk/shSuCtgjEkv6KsXK3VY40g3hgu8JOz2dshcb7SdmfeUnwPufocyuqChdE6c29ijrwALeFFIQQcTNAA8jLbtSpuwbAAbRFs3dI+IDz8NKJ7ieiOW2Gd0UqxrXFt2eWEXWkv/tuc6YEI4HB0dW6f4Sj/2W0J6cHuCEYkHU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430791; c=relaxed/simple;
	bh=PoUpp4I+ldAHpMOFm2FRCfbnPjmqQYCU4GvVStr9kfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PW7I7rnzW11priyyabF7ygSuw4QZqwKIXF6oRPWpZgSex+3iW3h96oKwkapM7AXo+hnnUNyTjSZAIL3Ylk5nESu+Xa4Z1B8T+9iey29mGqmEZw44USRw1AP3r6b8Oo0ZUNo4Ou441+lXmIZyOXGjhebvtK0hwhrUumGlQ2bhSXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Iq06QDIt; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Iq06QDIt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyj1l1RIAPwFDURSdrmMQhj1HO18L28jpJhP2QgTWYjIrzZR6bTk7Hwn+Ijjal6M/RAFLTjLuB2MN5TFYPOuKOsbzEFOYqe+aNE0+88uAqIcyvxzuosV/9CE+hZm+EVF/qSfR4YAVc43UwEBHHegfHp8W6G9xuAhXZt/FuEIQJBpa+ewTSO3A1y5wpMGVCQbdFaFDE1SCO6DK874/DW3KAkQy+cpcUX+2k7IKlUXd26kj345gme31zNV1GBtlRu0F4s8pZmjjrIb1GGRXvVYDURSXuuH9Zqc7Fhm9/B76NFY2krVqs+f3obiJNeuuY5RRWV25LPpiahvMQ5uoWwbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWwrRCUaQMd13jrkgTL7dC4SUzFnWzdzuMg8vGXTBg4=;
 b=OuHLTwwk+EJhVm+GeSvALgcPzAI3z16vVzhzrwiSUu89s1pMDqc7XQS58ETcALvgIKjb4JUoK0MeEtnSPmzA+lDGd3jFWsl7JNCrNvqmGDN4WXg8O6m09koXBwaFQ9ozM/f7rNm7QxAfDZQxR7VzDEiUJyjFrk6MciXnbxpvwsv3cviSjqtyl4282SQXEBndgbVy0jxHv+OFqglW+GIrgPzzV7IxFRiw1R3ra6OYHFz7r8EkIkQ/b8eMn3YJp8v24NBJM/yDE039DGW0LDncUAajYRVpKQdSKrigMv8gyIYsloBgMeuziKCqd7JJc+XJArZ6oDWjyOHQRYgzgxP9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.88) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWwrRCUaQMd13jrkgTL7dC4SUzFnWzdzuMg8vGXTBg4=;
 b=Iq06QDItacyE0sAXS2zSnqbjKNNxed7Zrvm+q1efHQhjzKUAtrL3MzDI02lL0Ns7UaPsB19rPbbvEuYG9oHoiYyRXRx8SzD/F85H+Q6ZLB8hWIsh0Da2X2In6h1+qvB5o/pED1skocqPBFTdxKBJzDnbpFLnc62tKNXjhQdkUOR4rPGwr5/2dfFAqO5QFwjBhZGX6Vm3SC/vKmDF5UQ9WBbY13idCsyzyYt+XRQK2C9WKYcdSrEIG8r3HByeES/gwQx+y7BtnYh5HIxLqJoejHPjUAU59BgbAaSqVWouaWSVxsgLaJ8FfX9ON5RxXihkKidsEXo/jemZRSX9MEifSA==
Received: from AS8PR04CA0210.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::35)
 by GV4PR10MB9596.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:19:32 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::98) by AS8PR04CA0210.outlook.office365.com
 (2603:10a6:20b:2f3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 10:19:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.88)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.88 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.88; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.88) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 10:19:31 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 3 Sep
 2026 12:16:49 +0200
Received: from [10.48.86.251] (10.48.86.251) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 3 Sep
 2026 12:19:29 +0200
Message-ID: <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
Date: Thu, 3 Sep 2026 12:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Marek Vasut <marex@nabladev.com>, <linux-phy@lists.infradead.org>
CC: Pankaj Dev <pankaj.dev@st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Rahul Kumar <rahul.kumar05@st.com>,
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Christian Bruel
	<christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, Vinod Koul
	<vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260902141312.649406-1-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260902141312.649406-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000192:EE_|GV4PR10MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 83109a49-9883-4d54-d962-08df09a4d856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|7416014|10067099003|3023799007|6133799003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	T5P8j8MN2qKgrfPD4zjR1+GerB0BUGMPn9VKK2aqDT9wu3J48dJ7fb0YmUt1baEA/6pLpCCYC22XJYevnyQceHiNjbtLezo5uFDG7CxStfWaU0WyEj0JsPThkeLvU9xKm2OhBhsyqwYW6zdpkupVtNc+scSepoAlRvJTXrDxNnT0wUDYEKtg+WFPLu3MlZQLkRLC27NOqSqC2j2JbasgvdeLwg74j1SyYIqFb3zDCUOHBPE/AaC6QcPLGU6wmMVzHoJaPc4gvQIHCZUBz9uzmXCyPGm5MGAsDONsX4HgtyQlZm8HdDS7gVlkQw8yKVK1wSRx8fZisuIYykterwW84euTfiPsi2W1FKspOFipiq9UN/JEldNtn3RL8a5FaxLGP2ZEeQ33O9VpZfhcuLZ2saB/263iUZ/L3ETHotJtWrOtgBP4aqrhMSbPyYj60YX/chgoudQNDg5yEUVaV3zS+u2MjOfdZ4SiM2BelL7Da0et8dcO9GahYtBWo7qvTHq9NRirvKU27dqU3rNRY+yFyuJ4Gu/ObLIDn+sJrSIAxWHwGlmyhrpbD+e/Nukvqf1GqYTSs4zi/+/HO9mJIy3647xQRWuvENW925QXDjv4e2TwunE2ALK/8TkciXywdeSndwSm5g3Qk/CIiO1wYVJiIA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.88;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(7416014)(10067099003)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6fUT0CwICTzxUpjQQehgXElTps+XOEYNZUyo2bVPU3cUrddn7q1cywnpvb8zN+C6hRLzcKtEkzfYjxql+MrXbxQSStyxp09qXKF0zzNvBXT6PDVqrG6f6r7RjQ1V3I7pX/Gc+D/VKbD1zl5oyQFxBX0bPKYhlts4R9JQmLAx4XUWx7I7DZ3kutXYqpFFLwPr1mcM5JYUzVJitk/Nkxk19anCLmQOBQD+HcualahiFIP67nDeSiBRLLEtekvWZQD8ZNi9dNOA2fiXldjCA5nUheQVOcsd1+3b339kbHBWtdDD4SR3viGoeSmcCX+G8NBHqmWe28Zv5w3SOfvV8vCdSvc7VvuPijnBh8FP0ddJLL7+9aimNfKPaEiXyGiMzXcbBR5vp9iJeKvEy4RLIR7HcGefJziJC+NTZcDTnwSACkm//X+KN8oGE3YqqnrLI6kT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:19:31.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83109a49-9883-4d54-d962-08df09a4d856
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.88];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR10MB9596

On 9/2/26 16:13, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.

Hello Marek,

I'm not sure if/how this fit with all below tags. For all the
contributions you've made, you can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

BR,
Fabrice

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: - Fix up Sob/Cdb lines
>     - Fix up compatible string in example
>     - Use additionalProperties: false
>     - Expand description:
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Move clock-cells next to PHY cells
>     - Fix the bindings
>     - Fix up Sob/Cdb lines further
> V4: - Reorder the properties: list, put #...cells at the end, reg after compatible
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: Add RB from Krzysztof
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> new file mode 100644
> index 0000000000000..c76e94c044e67
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/st,stm32-usb2phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 MPU High-Speed USB PHY
> +
> +description:
> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
> +  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
> +  bits in the system control register are different for each variant.
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +  - Marek Vasut <marex@nabladev.com>
> +  - Pankaj Dev <pankaj.dev@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-usb2phy1
> +      - st,stm32mp25-usb2phy2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd33-supply:
> +    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - vdd33-supply
> +  - "#clock-cells"
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    usb-phy@2400 {
> +        compatible = "st,stm32mp25-usb2phy1";
> +        reg = <0x2400 0x24>;
> +        #phy-cells = <0>;
> +        #clock-cells = <1>;
> +        clocks = <&rcc CK_KER_USB2PHY1>;
> +        resets = <&rcc USB2PHY1_R>;
> +        vdd33-supply = <&vdd33usb>;
> +    };

