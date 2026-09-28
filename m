Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885347ACE2;
	Mon, 28 Sep 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585128; cv=fail; b=pR+zuDj+p4x1zVXBPYZgkPj6HHDkBpfBvu4zh0P6J0z5ZDhnR8thry05jVjv26nOzP2v4byM6VsJE8VOB41U8H9ziSVbKjE7eH57308Z8REzHdByKenntMZ9mT+iIcZ4BKEzZHhJ5MQqs+d+Tjhttj37wFMLk6L/sY2Xf7GOMtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585128; c=relaxed/simple;
	bh=IC/LQNgAsN4EYyGSYM1j89pYzFUFFfhzjqgTeFNMtvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fdWCnn5YJFR1dUVYwd5RU1T/RWYjbEABdQ+/+432k0Z/9VOGNXWImtzyeA8w3qoi4OH+jSvcrxaM+8rAiqDiXvRuxD34wVWLJRF4dmt7pnwMrZx3fMlhllXMoQtHq05o3Uq1HuUX9evWfTy7d6RUx68VDFksGGvHx1EUlnW+UY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cJYsRdmb; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cJYsRdmb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laUCGZmkmW23BUWg8/AFZoo2l3L8XVWgQDGHjLq4AcvEu8WQoO8JPehgRwLmAg+7yk44Ri3eECmPwwcFaRO7KCc2p/sHcILOG4nAYAesxSP3vbfLGHydXjklW3MXR5KVe1Xe22eb2XUNEVUP/mK3QD/oIuohspZ4liKaROr/BysyZcH8y24AgT8TSjsSzPDAGxs6cObxHNKqxwBcVms5/ORV0OGQBcKBfhxEdyJOYoYPtB0xASkgSAY/mEsw9lh48JeBd3VhQ2kQW60gXM8vzn8/w/ATwDwr80nWMFdvr+GSOpag6iqL/rObFw7NnEFPbCvWAySFvIyl1qc1ZEMrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT8b0pCQ0yjJecVmaGdxCgs1keFPKzpPLKM/V3xRvkY=;
 b=fg93L/ikiLG0AvclFjiKKjPcB5FC3WeQbFUotGg6MpJ/JjewEC/O7M+pW09Gwaocrc3lgrBYnIA5GD5MWXJR26+JRauvAyiqoPnAFf5Yo9jKUotMvHCHilPP8t1VyghZuxZRMK4+8xO52unHZoK7KolmmeOsDlaj3OzbVtL6Oj6hgswHHI7r52kEMQxQN/tPixAQaUZXg7UYin9KLTNUGjhb8DDDLsa061dPejRR7LIxlKe4NOPhq7yVI0GdBvrtDm+Gz0LpTGke/P1gwVCOXIKdHCIbHKPczyiJeJQkYDvg3xfxUbwficvlq4SVZkNUZuwkL4DDLvlO47ujMs4HWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT8b0pCQ0yjJecVmaGdxCgs1keFPKzpPLKM/V3xRvkY=;
 b=cJYsRdmbxMEkjp2Lc1AdSjXdUT5R2AI9Lq+ua5rq6CU+yQyb06LglFy0ppUUAxOsn3USNnBYXy4aD8tpIJNmcMPxqHAMiEUcqvee95IQJtoXxXjXjl+xT2h+prSNkMUsrDisMZF5zNamfF/hfvujb/6wABawLLOz+OY6+9a7nYQPBkLVawj3D0ebgFW5OOysipfufCNOcyO4W10veQMdevjFEiipOS16rkRANGeAKUj/2chPwtbMaNzGMrQ4ynz0mGbjjpz0AxDCIPpazfiJ4u35duF4bgYHMeLIpnhet592KJ1GmJHyfj5o0/ot9kcO2Wu8ouaPtgFvG2pMzY/xAw==
Received: from AM0PR02CA0125.eurprd02.prod.outlook.com (2603:10a6:20b:28c::22)
 by DB8PR10MB3738.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:45:21 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c:cafe::83) by AM0PR02CA0125.outlook.office365.com
 (2603:10a6:20b:28c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:45:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:45:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 10:51:12 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 10:45:18 +0200
Message-ID: <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
Date: Mon, 28 Sep 2026 10:45:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, <mcoquelin.stm32@gmail.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lionel.debieve@foss.st.com>, <amelie.delaunay@foss.st.com>,
	<patrice.chotard@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|DB8PR10MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fb5687-855b-4260-3d99-08df1d3cd428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rDykTYbmAHJ/6ETe3vMRMiv4M22rgNAAyHqpjl0+KTuAEUMHdEvYmTOWqPUVgNkMssKO87/ulmE0hY4BCuh+HIBHAwy+ENHDGK1iodZRSqM4ceHriEnJb2IvxAgtcihVQINDuZBQcPftMQFqJwPYDtNBcvInpuOvNNHU+z9bNK+6G6V8sq4p2SddlJs63zuNYoVhTN1qpCaH+DQTW1/+XHzBncGNpkwiOx2D1I7VEi9b9BT59IMdjxdVV/FPqoYH9zklkdYesX7u8nbbdMlNie2fIMZijHEJYg9DwsHjE6cGZ5T9KI6AH+4YyAm/dOwCUF1G8ycinhq3J8EHyI7cBZ64CFIO01EwIkcNzo3W2Mj07lc5U1N7HqYnO1NTrXqvjLd4p1GWIPm43onsAGqNAwrIX+P9YjwG8bIexQz+b6g8PpiPQVI1UYVh82c8opZLgmERKTqZe1fWXNX7qdDvRVdIQ4/RQ1oncDnRVLFnqADqjIDNAKCPVejtTIoL3/xAu0p4A6pe0rUfBAXVz8Ps+Q81W9qNLuivc5fByQDtlaDyWgpeOHnui2gTdtlUhLWuleiSFWIyC7v3L1qgJJydO9X05ZcptjMplaUePaWTek9ijIWEO4Nkoql8AqYjv7bwBieyfrl4mF8byv83HN+4w0DaD26jvass5poRHmME39DRtKhncplSBaernHxV4eGlN8VmZ24xFQYWq6QEwBBxcQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WQAuka2RCjQ+KLjukQzMhhzBlwrGV1jcnHHAH+LdzkIyA8VoSJmua/61g1GGSi4mByhD9nzSxLWrIu0Mv/cRa5mL7s5jDkAvhXwnT+gq8nAwxPV6nIAq+DTOV1tEG+0O3vp80xUBelCFFlg1CuoghE8v9SukM0V/mxePlPaWl0pcGxupki4bWH68o/ZJNLuaWs4Pbqh03f/+TcMlty1OSj+rhVLETcuzG8Du2PKOhAAddwB8YPuYAGgZly65kO/Su29FbW5wA5Fxf4Es4MddDrkB5NjFQUEE4iEqB98SdM+tg4GfawIqLeLaC84mPvVTDm+slPIRrESPlrOXn4DDahc0uZ3WCMyFytfzZ7cKwbpWMdwIaZ07nrbnarEbqCGXw2pBuVEOz9HlHH5rBoMFjG0nUQAPiiW7EhQ6shLe7EjcJIxyTIsgqsBVIvOpD/56
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:45:20.3383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fb5687-855b-4260-3d99-08df1d3cd428
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3738

Hi Mateusz

On 9/7/26 11:14, Mateusz Nowicki wrote:
> OP-TEE implements the STM32MP2 watchdog SMC service with function ID
> 0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
> value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
> bootloader is never refreshed.
> 
> Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog support on stm32mp251")
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
> ---
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> index 9e1d240888ff..35e247af957c 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -35,7 +35,7 @@ arm-pmu {
>   
>   	arm_wdt: watchdog {
>   		compatible = "arm,smc-wdt";
> -		arm,smc-id = <0xb200005a>;
> +		arm,smc-id = <0xbc000000>;
>   		status = "disabled";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 9c63fdb5a885..2dcbba65e298 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -36,7 +36,7 @@ arm-pmu {
>   
>   	arm_wdt: watchdog {
>   		compatible = "arm,smc-wdt";
> -		arm,smc-id = <0xb200005a>;
> +		arm,smc-id = <0xbc000000>;
>   		status = "disabled";
>   	};
>   

Applied on stm32-next.

Thanks
Alex
