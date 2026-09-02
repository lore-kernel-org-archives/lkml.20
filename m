Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED636A02E;
	Wed,  2 Sep 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339355; cv=fail; b=l4yR31/i9VNeLxtlIqOAt0hPC4jTJm21i8Hjm9wzb0P3G9So/KBSsZn5euI+RCm8W1wkXUZEP28hzpHVZTjtqGwLSrWR5x8TB0VLaC6kGVI5aNOEs+QzkGNNHiDTkhmkr1bNOiqPxMr2gdpznI20St43hQXslwuqCIfG8dVNy7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339355; c=relaxed/simple;
	bh=TRWbwDzenU1jXv8jwudxaan7oiV0sSbiAP8iNebMd5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tRjOEisbN7RGmWjLiCC4tk24MFF7DmZ5gJ2KQ8KzcY52p5QqV/C4Xp9m2bA9G75DIn36b8+3U5s+2ExZWeEPC9VYj8YNhymp4W1cnhKlb6n7GgPdtRNK2wscwZOdkEdJNV1gP2hbn37ME29tQyhff7QxO0LBFy81bv8Rxpu7j7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HgBE5iLP; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HgBE5iLP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ9NKax5GHhBuO3yX7UQbMi5RcWkwHHYCC1AM6R7j4frOUhPuzczWTPRCAXiNhYdKg+Zh+yLavkxVG2aL/eKkXpHXLP2uoFVy+H8lnGCaWxfmcpiDGLehooGc67BiFJ569JvBJdMepBdcupabfP06P2Bj2YhiJpmcMAHPNhkwzCAm9UxdDIcJtXoYlWq4ZBXxJlM7OPjvyBROWQXwDN2qk5GdbOgsKUy192RdasoQYpGVLh0pak0XsPqIA0G/x8cJ3TUA/TRMmF6i49/oL78K5peZzv/Fe9UFhwt5lc9kAG5pgHIq0x6dzJ0nYPzg0rlVZ7XRLNv+mKws6BBYF+cNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ0BVlV8QKs+WA/tePpiGO8JNKHAiKPvkno1I9nLxqA=;
 b=ArdcDy+m1hQfQKNWejWt1w9o5IiF/arCY9Z4Cwriv38m71UFX+2aFCF9WCQMK+Wh2X2r4UYJyCGbcugyCD89meb/tIs8eOAZQmqbElYdtWKlK0267kttYjhdff4MLT218EZ2VCOzJmf/JvqYT/chiM/wT9j2KmqIROoJnzh9VAInpU74YzWtlfbh1NIMZptOkqP8mhSGnHu9pUDjzcoLMC5TT1mXiphFExR89WOU33eoJsRSnEaRx9MKykALrVRrcOGbveXbpxyKohfIeA4XvCfDyhlPtb7bMcTNmQfLRs+Es2Eh3I3dou1/7zKBe5XJRTWOR/262WWjyKpj76oX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.87) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ0BVlV8QKs+WA/tePpiGO8JNKHAiKPvkno1I9nLxqA=;
 b=HgBE5iLPcQ8vr8G0RqZwVLlCnt8Tr+DuT1kgI2QdNOudDTSbYzn27hIMmZ/t2j8d4qnx+baPpsW9LgnxJ2LXcNXHeuCbIDmrCYQzJCwMrp+PfwCosGgZr2W5GNqQ5ANvHwgHlDjRSV0Sih2F14+cGmRfibwrQ4IZsAre49sHHxbs1d6icz0Iipiw/cEhqNI/5DDGfbg0xryyXxQ9s2RNrCktTcujc9tIQSjXzui6U4qKK3Z7bxrUX8Xh+YGjG5sxBVhZkKDvo0duu5eRkMV56Ot5woQIS/SnljcHujqxMpNT2y3sW825ryNxft0wsAe5z1vWYaHh94ho9q2QYLwCYQ==
Received: from DU7P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::9) by
 AM0PR10MB3697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 08:55:48 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::9b) by DU7P190CA0015.outlook.office365.com
 (2603:10a6:10:550::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 08:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.87)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.87; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.87) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 08:55:48 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 2 Sep
 2026 10:57:44 +0200
Received: from [10.48.86.251] (10.48.86.251) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 2 Sep
 2026 10:55:47 +0200
Message-ID: <43ea0c7e-44f2-4ec0-ae82-ee60203c8842@foss.st.com>
Date: Wed, 2 Sep 2026 10:55:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st, stm32mp23/25-syscfg subnodes and cells
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260831231359.136475-1-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260831231359.136475-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|AM0PR10MB3697:EE_
X-MS-Office365-Filtering-Correlation-Id: ae09b595-8c1d-44ba-c06b-08df08cffbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|7416014|13003099007|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ig9Fxglh5KgdezAJKp0/JE9HKx3YvPxdDaN5tSkqcWw6XFz4i35/1CTKAS6ff0d+GDNoY8fVgPv825SMzFCsI2RZ8fJuDD/TFcHsOxXaIUJ0z2G6SxO2MPwPAEW+9LwIu5/Pc9PMmkmEZ+uTURl8yG9zmnKmIr4bE0HazWHr6lOwty+In0KhwXoeNkUAJdyfVUhUt8l2SxsN5KsU5Htu5R7dkgFvA30Yo9xWemSC5LS9vei1ycG9bTVOrc/hbNb/qqZ9RkTjflVUHkCyJuDQRqhmGIDRFO/Os/jY7oHiqBe9xdJPU97ZE2df53b0jJHCT9eNqLNvaU6pVwb/ppaAF/XWoC+uVPkv59poIgGlmXZ3kyh9COWZFY19R2w9D9Hv3tCAnUottdmFOx8wNyaYqTb0lwKDtb75OLAy4q3UGIxaM4jat7FzSILk2d93Y/9SlAi515pgnKoLpotlz4ZT3f4/rr/JpCRZefDifSrIPCSog1rS0eNehRkFb4TvEr8Xrw6HDQ/6wWmzdMIKwhJYQHgw/LF1SHAdNhfTDi+s6wP4k4DbqIT2h0LWpEGY6+L+fYLySw8+UPZHiO3qdc09osOaIB0DWMkMU5vcPLM0mO3Qz3jtFzGB1c3UAys9SxgV2VrQ3BWEvGv8bNrm5pf2ZZV5Ny7qNZaIISL9Q9kvmqFe1huZDVZ3QMkZ7q0eYOnEdk43lwzaAAvRARSYV0dBFg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.87;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(7416014)(13003099007)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gS+V1StxB4G5OPa5CUKPNIO7UUGIoL1BEf1BxPimWTJiUWVDcl/MC9VIKcslmONQjh/jCFMsLS4HkrzegMNcoFCqpB3xW75WjMH+ziY5dfF2vgmhWWZzsALHDPMVTrvuE0117FMBa48s9nm0C4XbvtTVWOzfcFzVDN1I4OcamWvh/OQ4YYIxG7P+SpyGrEimMmFwIUzF2lbhte7tyxQmnW4ASkL+JJj5B1CTaFJNDNSS85+PY5p6L2UzJCsfIlPqIXwmNtUbyde1G2mfcAcHnOjyLl6V6Q/wGDejMkJstQARvJ7rmXn8+JPG3KayWItarBw/QLzwExddCY0pV4VUCt3fTm/618m9GdKnTrY+fdX5JmtWgZHx90JQplp2arlZ73s8w3BERXS1aPa0HK0ulSvLWPA/wD0jangw9mzJ2NImfe9/dZ5wY6f2wAwxAlOg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:55:48.3527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae09b595-8c1d-44ba-c06b-08df08cffbbe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.87];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3697

On 9/1/26 01:13, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: New patch
> V3: Fix the bindings
> V4: - Undo simple-mfd in favor of dedicated SYSCFG SoC driver
>     - Update commit message to match, this used to be patch
>       dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: - Add missing contains: into conditional
>     - Add phy subnodes into required list for stm32mp23-syscfg/stm32mp25-syscfg
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..2cce174004fe0 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,17 @@ properties:
>    "#clock-cells":
>      const: 0
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -57,10 +68,17 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          contains:
> +            enum:
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg
>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"
> +        - phy@2400
> +        - phy@2800

Hi Marek,

Is just saw the discussing on V4 with Conor. That's mainly a thought:
I'm not sure USB is required, e.g. mandatory for a product, even if not
so likely (I don't know if this could exist out there). Still, the nodes
could be tweaked (deleted) in a board, to reduce dtb size in such case.
I'd relax, e.g. let these 4 props as optional. Do you see any drawback ?
That can also be relaxed later, if the case is seen.

Thanks & BR,
Fabrice

>  
>  additionalProperties: false
>  

