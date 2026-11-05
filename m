Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793874687;
	b=2UZ1Ie2LzD6+nw0TTvgYovPC8rZq2LWuksJ+a3kA1R25cyKJnBkLmcuP93vVECxgCTwD
	 S7OPmPY/OmZuTcANR5y0HRMH+MCsoqpAVNSNqd4Ja6NyWoT5Vy6GeHUsoDquWhMLbPCJJ
	 sQqPazcWUwIMzUaO3qFrj+3+GNymiMpqqaXVRLweNNioZB/SvooFZsA51Wb5ynmWeTOIg
	 I5AclBF5nIHsKqK6e+DRcP7Gll7yCfcWgOkdn/22Yo6Gt54q4OUNOMiSZAKOChsaahEdr
	 O5GoUYdGSEgABgwXz5RffA0J0DktjNdzqso2UihMn2kGKq12LubrbZ3B/d1hUTNZLlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874687;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cC01LMvKS94fWVhN9dESG6kMu2u1oDQqPXfkRqg44y0=;
	b=PDLEjWDNkr0JpuKzmYzk9HDWG6tXznKpTGpdjm7o51OBSu3HDc4WiMHfEDNVCu1XkMzC
	 B+6oSD7+lHo5LqMAs0y8W4Rjrao/e4h27cLZoV8YZ/QB2wfa8Q/Znb7stnXvWZWUZFBXT
	 Cp/VwnIau5ZKl1oYyY9Ts86UNu9FJ1/7KQqauHcD5JuKV/U38xNqMnch+2t49f2+iZ4zX
	 hzhPFcpGXXjYpTnz6GfUzy2h+1hQLFroP80Hyi4lPd+SGa8bgkV4k6s62xvpyMaBykj+6
	 3XQZsJL32TRX+goiCZleUe6wzjERhSA1DmhvsF0VRA0Fz/y6OltaiFSKMgogUpOZd2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="n2q/3XPX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.42
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156E8606A326;
	Thu,  5 Nov 2026 10:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=n2q/3XPX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnbjCMWoIf8Se39xuXG2kNP6k0BKIXQ5MjWH54/I4wBy4ZQpIL6ByOUt16CiVOxt5ZxwVbt9eYKqul3BXJAh+bvVgKD/amjvPYsxOUshlDwtRhpymCB7AIr8npihGPOFBd0Ycxl4kTGRdKWPOd6KHdmHX2sTYvB6CiLRczVmuI39szWn3crygkfTGs0k4gAxtvLjHS/C+EX8kUdYCJZwv3CaGfFT4+HCyc0QRVFluq8jRFc7/qvSf6WdSy8nhn6JOTYejfY/SRxsv6+CSZJSwxcTjB/wMjpBCaipvRlkykQgu9eOWAfNIsBmRuer90Yrzz222HqhO6XEC01RVG0/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC01LMvKS94fWVhN9dESG6kMu2u1oDQqPXfkRqg44y0=;
 b=W8pwCmg39xSRSnVlVes/9himfoOE8dvZ6CMTUaJ2WsP6zVlvBM75FoGBq9Dz3qq6gc7gmdzyOHAuAzSrN8i+ZUnk0SpRvu/pIeIZ2iTXl1MBZvRC1YxCSNrzhlC5ZkSQ/p1hiJG0+JZ6PCQRAcR4eiC4Ouvj9qcrhsdx3al8JD7dkLEyGrFmw/cE/FfRxF8CY8apb+QMzMzV4kGpn3S1pumOnh95CprHRCy79WRyZ2K21K7d6ZjsgLNFZttBm21Fjt1/AwOuikXUCcqXOnLKHX74K2mcbEVw5fuSYEqlgpC/6LSAsZZCHo1CshFDLxNNOBnVcA3IPiN9qD/oVQ0V/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC01LMvKS94fWVhN9dESG6kMu2u1oDQqPXfkRqg44y0=;
 b=n2q/3XPXFXv0rzos9doxkR3r2c22s6TaU6HOsdJAcNowN8aq26ZF0+tdzygduhGuLWKQVShAuRHlw078m18/LO3Or5HGlUpvBwv3saK7zGekHZKiUhSUBQ0R6d0BB1cXyhRqBmzS6WYApXXI0f7X+QyJR5TqCcEkZT1T0CBcLYoLp2lnYM+HgXhZ97IVOySEneAMkJL/3ZZLu/h/WdvnteIH/DHUlKLDaapejtCt1N2DOgw/H7cwdnGWPmRyqSM8h41UP+7BrxTTx5xm6igt/zueO4UkCEOi8xJIYNR1em/k1Dv3B4wU2n6dTkdqGS3bqAiHmW7LCazIgAofFNQIYg==
Received: from DB8PR06CA0039.eurprd06.prod.outlook.com (2603:10a6:10:120::13)
 by DU0PR10MB5267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 10:31:24 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:120:cafe::28) by DB8PR06CA0039.outlook.office365.com
 (2603:10a6:10:120::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 10:31:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 10:31:22 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 11:31:54 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 11:31:08 +0100
Message-ID: <6103ddea-9ef4-4d02-b41e-ed0b4701250e@foss.st.com>
Date: Thu, 5 Nov 2026 11:31:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
 <20261017-valiant-exotic-heron-c0b6e8@quoll>
 <ef5bfb63-4e57-49e0-a1aa-81b5de14a36f@foss.st.com>
 <b81b8404-572b-4ea4-91ab-6e201f0352b9@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b81b8404-572b-4ea4-91ab-6e201f0352b9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|DU0PR10MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 35428e10-03bb-4a06-6d74-08df3b27f015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YDnZ1bK6pe/5tchNp9qMW2r97j2K6GuEOpwr3oFFcNne7WiRv0+3CxNVHuoRz1or/HimLBL5HVvVzSjrJX5AmATKqwlvaGOI03vMMIWXsru4NvGfU/9UWIBOnkVcwc2rhMYbxD72k5ageyRX5T0tt8xAVWcct8zoK4cA5eMsTRFouO7XIe0QCn/ghVBeIRzSMXC1396dZ8o7LEf8Obz2BKFUl+UTcob0gntGwFdVpstPdKlckJAru7Yg20MOjRcNeCxY5/GxLmK4TtU7zLCIKKteXhsYwXgT5EjXTLTJIpARu5AGTqjJSWbM6m3vrcb54q6hD1Wlh6FykoCqBnmp9r3/AitT+PVZxHoTizjNEcosDf8OBkM6c0PoqmEZ3H2jTN3SnwId6hunamRdw+iK6aDKcpYzqLFpgGB7T+4z1V+KQnwMj6bepBqvTCHlTMI7XNrbfyzIlVgx3CTjfueCCe9l/y6waLyv7rSsQVOLowD1XiNUdErTUx6y7dfWH+HVEiVtmfv94BvcwyYIGD1uyLlaQIy3Es+GFy9ToUB2weM09DP+LZmF6/hRnQ67H0igoQdZFjaUAnFgG4k9NI0TWs6D/iCbHhoiiD0txvV0ZpT77Tp1ugpqCb2yxSyvHcvPQgBwEHyOVvOtks0Nqlkrfg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P8EB97CFnoAS/22Vbc6dVoRQLTlN73AerLYD+PBob4w++52CMgiUnW5T/2Ljoj/d3KNynzaYEdBwLPhhLpnwU35koNLVhdqhEjKva2lhh7XfzQSzh2m9kPzu3Ql16prltewkL2Pu+acOYXhMz/YXDz94s1+wUgJPwt6ghCFw1tnjGJ7ecDwxHoaIFY+hkhoOmKcU5K1SzujeZTgS0AWqEXdh8XBJVAhS0AYvEVALVpHGFm5JR80jINeWpbtt20ea+LJC0Isu/TzMvFiLD2G7Xs94e7ohXrUmZ6hB4U7Z6ljJ8o0wEJVy3kJKbDr02nB+z5SjRslViE9lQVBYjBCSC5Ggtq21qlsLk22ZeqttG9hTgdxWfFXQSWY7gvfKXc53gxujaxuhZ/dS5L1rVvOUrJsc0hG1FtO4d47wtZOLq/BdMw4G7i7RmLCMSHxM4AR+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:31:22.6450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35428e10-03bb-4a06-6d74-08df3b27f015
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5267



On 11/5/26 09:17, Krzysztof Kozlowski wrote:
> On 04/11/2026 14:43, Patrice CHOTARD wrote:
>>
>>
>> On 10/17/26 19:52, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 16, 2026 at 05:26:04PM +0200, Patrice Chotard wrote:
>>>> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
>>>> exposes its backup registers through an nvram child node described by
>>>> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
>>>> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
>>>>
>>>> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
>>>> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
>>>> "make dtbs_check" fail on every STM32MP TAMP node:
>>>>
>>>>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>>>>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>>>>   '^pinctrl-[0-9]+$'
>>>
>>> There are no children of tamp@5c00a000 in
>>> arch/arm/boot/dts/st/stm32mp151.dtsi. How is it possible to reproduce
>>> this warning?
>>>
>>> Are you using some other patches bugs as a reason of change in bindings?
>>
>> Hi Krzysztof
>>
>> yes, in this patch [1] arch/arm/boot/dts/st/stm32mp151.dtsi is updated
>> that's why bindings need this change.
> 
> You cannot use future code as a bug being fixed.

Ok, so i will merge this series with https://patchwork.kernel.org/series/1176665/

Thanks
Patrice

> 
> 
> Best regards,
> Krzysztof

