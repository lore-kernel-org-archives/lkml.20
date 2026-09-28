Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FB02652B2;
	Mon, 28 Sep 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599209; cv=fail; b=Y90wF5Sja1F7VIuvZ0ri3bmDY72hMdW/CVoH0gefzC7sOfEwnGwzEQ++AZwBiwTfJszZA7hkMOGjTfVS5CJLMW6QFjAiZ20Y/6uI6GBVRhsYzH0IKg4Sbbl1aakB9fuR1h0UeFTEfWyVmtN4m3MJXimWKJoNUctMEgKkqdOUWlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599209; c=relaxed/simple;
	bh=DXj6kDo3XB+2khgFPr9vFED/mhGrfIZSPWewrN9oPFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aDvqxq3lrdkMEBjzWDU8q/RNYJCioeiDtgY/rhX50Q67qtHsnoFzWIMXtdhwg33KdG9gLvpiN1LHBbI00HUmredpI7jQBzd7C5joE6lEiArYraF7/88WTdCS6GJvWcu8BBNduyaJp461bXFnDyO9wfZMmueiudMRSr8T9HqUWSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Y0A0eBC/; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Y0A0eBC/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLuFy5m9ApxQCz4iW5LI0MF5asY7gNYjYjdPwioQ1JVQF4RVOxlRoSn/n4anfxpHxdRIJ24Lux7nZuhQnadPugukiW8RTIaFA4EMEAfh9rMSD/Lu2hHfDZSqSgcQTiACwvGwPQBaXsJkFMVys9X5HqoWcY6pQKXrtjl2WfeoIeMR/9A9zYzDITOmHKIyK1Mln2aEuvUAi/Wt8IlHZwfjElBpFHYNo+1izP1Li46WQM+gJ97XOvBOrjKqH+m8YstFIbtunLE+qUZR9uuxiL+2zJMSBBHylvZzGGxnwM3ggYz8Iyf+19awUX86sooenpC2TTzs9T6tNR1RdVVbd5rE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HssTRDz+FH3gBTxCzMXbvmj7QI3EqIUW93n3mDUsW0Y=;
 b=f96iVqWGUFNdMwDy+jv9PC+zvZPBrZ5Grrm+oxATdV6hXUsfGLEWEdvLDq4oC7WEDV7rRWCb5wKwAemJnXE9sW5zOAovLmvG7IBvGydPFRKCXlVYdZGahZ1dVl5gZkW0niVCiRVzxTK4EpYQ4sJsA7rFR0dSNi+8wdn3PLorgn2OVKMqq7G5hCpVuhbSFT/YPeD/avRr36csDsv880x3bLDVL+iPPF6fcsWdO1+VorGhYKkGA4N9TV0HXaG1UYpWGgpkGiK5l5kPMUv+GR3htwNWE5LfGxciKJoOOAsDkDdbhBboDZYHXatQbWX4iTsOFe85uGj5vYz6QO1aDSoG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HssTRDz+FH3gBTxCzMXbvmj7QI3EqIUW93n3mDUsW0Y=;
 b=Y0A0eBC/kdApqTxuUxjZcbKxRIO+PdjhE8LUe4Foq2buLoOYeZQoTKRdXmmXuTj3Fa7MiJC2/f00vu80o9c9u7R3yWL7cgX8KoI5MnCjJkJ6z43ZOSf0ctlYFSO55B5+oiN4gL3rV15tPo7id4Lko9C47cOMWslg0RVic1i8Jlw2T1lmiujyiNdFV6kkIbH6LMxjxtY4cTGfIwKU8hZcd6/8pTrRtwjZJOqG5/qTrojyIT6L4kAIxba9oI1rwWnQeZYFsunF8SlOcvnJs4acAtwkchxRZYfOicz/mngW+TqPxd7ba+3RGD8YXKc9LfaJb7kqDCTbRdS119phBrpkQg==
Received: from DUZP191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::29)
 by DB3PR10MB6858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:43a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:40:01 +0000
Received: from MAD0EPF000008AA.eurprd04.prod.outlook.com
 (2603:10a6:10:4f8:cafe::23) by DUZP191CA0033.outlook.office365.com
 (2603:10a6:10:4f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 12:40:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008AA.mail.protection.outlook.com (10.167.241.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 12:40:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:45:53 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:39:59 +0200
Message-ID: <13a5a9ee-916d-4bfe-b067-8d5b7db6aca1@foss.st.com>
Date: Mon, 28 Sep 2026 14:39:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: st: add dcmi nodes in stm32mp231 /
 stm32mp251
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260914-stm32mp2x-dcmi-v1-0-c594e081d21b@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260914-stm32mp2x-dcmi-v1-0-c594e081d21b@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AA:EE_|DB3PR10MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: fa28317b-cef6-4ebc-35f8-08df1d5d9ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uadxcTtghWQHcoHNM4f8DI8FRm4IUxM4UU8SehLBlp3BRXWi9IELaQB7QyYPhCsQT+ivfNN+wHk6YP4tCe2occCOA+ULEs71O9acyzr2rW1HS16bDFvb+9Xm6wkX3u9iIiWshMy2ESiVwLsMNWu0ISm1eoU4yCOJ6KAqL4fqLkdw6bxkN3VXAazNhoY11u7ntm6HrcAF4svygwck50T6TEJpaSvDHBs0FSpfFOYritbuJug7pvaiURBrPHsp1jXHpFoqs4+8i/4709ggRblDkghLRhHDiINtD7dRSqTiYqcx9GY1lcbN9Qm9aObVF/ptIPYpUSYtxgm3jx5v2P8VJ3zgAlyefN+C9t2FY8z0KX2T2sEOkxGF11XDb2bbuC8fWhtytRZI1WzdanctpVFUWFIF6vREtjV5nYMReXWtEn6OiEckAWmbfpNCar0yZmwQxOKym3DQD80xdaI4gF7ByCSJUmzD0qCQGMVMrdIhociZbSHPQgVMAOqI2eZu8R3keHZ7YXSHJ8M+TmUsSCS4o2Ml7v8/h3yA0b+KDbb/Tn+G3iYeVeqo58fCliDNJ4tji2bJGYEx0bMLlVX+V3tIG8rJ8KmwCKUKqC0x5dj6BQkNTyxJ3CLswrQ85WLhCm6W2leFtzDtLYDBokRwaCL1Jkgi2bQuz6/pXKHhHdjt89KWcRj7dPklCtrr8RgxRL3bLoUJg2EsxsYNvR2NekH56g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eTnYELRyi0H6irzqYcxv4GEBAZ221vnNA1tXzby1o/3ieg6hiFICpFwkZqNDGrwRFw0RtZcLmOYVdalrAwK2g6mZPLMRt7LR9MV0uLmskPUJ1j/7oiIpWDegWHVB3yHMk+OgsvdL8quc14wuWkur07eO4S+a7s6/HX9/0O79Oqqdx+moiMEpvYqSTyzOpsX0NGt27+hHLVrAk8mm720j5Q5yBIgYJaWSOiGY4qXqgyW376YP4FfxJEk94DCm5mbRnVSATHkWH4VAcdwaNRvC1jwxjHMcMH0mUFBNJNQkdEbmFDayg4NqFL47kc1XufwhqZJ/sOHz7oSFqSgppq4v1e8v8V7xWa/xuGNeiR27uYEBbfUDo71R4Zd2YG8+8vTVSkB8xa2ldBRuYHSsZ164vZ044HvU8+wvuGMkW2lG8S95OMl4LxlgZVuG8oLu82uH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:40:00.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa28317b-cef6-4ebc-35f8-08df1d5d9ce2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6858

Ciao Alain

On 9/14/26 09:09, Alain Volmat wrote:
> STM32MP23 and STM32MP25 embed a Digital Camera Interface (DCMI)
> block allowing to capture frames via a parallel interface.
> Add the dcmi nodes in both stm32mp231.dtsi and stm32mp251.dtsi
> describing this HW block.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (2):
>        arm64: dts: st: add dcmi node on stm32mp25x
>        arm64: dts: st: add dcmi node on stm32mp23x
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
>   2 files changed, 28 insertions(+)
> ---
> base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
> change-id: 20260914-stm32mp2x-dcmi-9fd57ababe6c
> 
> Best regards,
> --
> Alain Volmat <alain.volmat@foss.st.com>
> 

Applied on stm32-next.

Thanks!
Alex
