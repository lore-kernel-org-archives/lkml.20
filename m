Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C836B90A;
	Fri, 11 Sep 2026 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140882; cv=fail; b=MN+t7VBlVMGwJhY+npMSqnt/D65LbrOwx0ggviHZJSHAzSQtOAUmb4soDieh5/EXHQ28D9eShERroPnvcv1PMth4ly7zhccgx9Anq+miiaY3fbSV/nUrwhua3/j0lAYs/SbcAhi9V4WGHM9EK90UksG1bdB7mDsqK5/z22tJ1Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140882; c=relaxed/simple;
	bh=djZOVliJ2gKdhslV4hwA1bnWBlsDBx0LxJE2TWqtHJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NvAcH2DNdfJGkWONfS0UCf4q8T6jh95MwnelDTA5RyFyuLdBDpLTNTPBtCaYwZeUZCdVpD2TKkSb9hxMcZR5Zcs9of/dKMir7FHottaLBUiowM5PdP+DAmMuTZPqirj4eWHcv7vtm5tiz02gFUKD4sfDRcrmsKKL8cd+P049g5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ateG5se8; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ateG5se8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlA3z9l+VjQn6OwFbW5WQmPFZ6gp3eKbtFquJAhmP8uqScs5JA7f5Ipu9vHT5a5mFPp3vyoKyI0mnQIYFGw3tHbVBfr4IZsHwNNpWhdfAAP5rJBGT6pYMq6vEUCfW5sLmhEK/grIR0vh3a4D3hjFxdorU37KakEQTpqtocir1HmOqGgWSsTmkLJjxrfrMVd5UhA90GhgT6qx+d7hjm0ZtXVKtP0axiv6Vzh3nNRu/vLjvbAkkDlFFP6EdglmBK0+M3V1lW1aZLRyUNeU7opA0boV0yazkLPgCAaRkNu5Zn9ucYFeC08QQN1qE7Sw8GtodsSgxE33ctlxhwqGA0904A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRUcvxXOQsxwrk2M6au/WQ0aepq0JvYoSRBIWX+Sh38=;
 b=AaVB6Ad5u1OfRHvbYsP96UzkHS6jNyuH5yOxlRHXt5Y5cH7JEJarEBauJ76XE9awRhTk50zvQncKXJ3k6HDinemyrrRdpj53NtM+It320WAjsAKu5XbHmxKYBd5oOhvm9EKJc3JWIa1rSl1PlRv9DFsA++MYI2e94z35ZnK4fmbZHPTFWgf810MHh4OKHhfgve6aXRz6Mt5a3FrtW+ASOfZuLwEi0uqlK9cWyh1K4iVNNLnAyLvAGuIYYz/v465b+SL+8e5VXpqC7NnaejHrH3HSskoXkzDO7HqHQBgIRxQJDwZ8rXwOCT5LiQLo91zJzJkx1AXozkwl4UcYFSvBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRUcvxXOQsxwrk2M6au/WQ0aepq0JvYoSRBIWX+Sh38=;
 b=ateG5se8icvXIbb4SHhacX4bJci/RX07TpqHUS1/TZ9cjD6Iok91aAnxKzqPE+RhBgidYvlhfbGCUto3wnxEKedOdkTkmiAqqvpySzdQ/ALLaZNxcehYMhNV/EWAq2KP+n5b3d3RD6qtHeUnQLaRFwKuAXFCWLzuffL4g50igwUAHP/0kz04IfTEBo8pKyQcehWmuIfVefoyb2tjxlT7/q4ndXBPwQrneGjRXqIE5bZ7TJ+Vo11iE48HvZ9i3BLrnNi+f4Z1ZMBNxs6Gtd2abWUHBDvqTqFMlkjhGGbPFzWDGvmtzOomATFC6/kcVGffmL7CUKE5J7N74ndPfKY97A==
Received: from DB9PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:10:1da::11)
 by AS1PR10MB5699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Fri, 11 Sep
 2026 15:34:37 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::9f) by DB9PR05CA0006.outlook.office365.com
 (2603:10a6:10:1da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 15:34:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 11 Sep 2026 15:34:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:40:38 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:34:34 +0200
Message-ID: <1fd38ca4-48e9-40fe-9771-9df984ef68e6@foss.st.com>
Date: Fri, 11 Sep 2026 17:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Drop bias-disable from STM32MP15xx DHCOM
 SoM sdmmc1_b4_pins_a
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260828150111.173089-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260828150111.173089-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|AS1PR10MB5699:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eb2e04-7895-442c-59a6-08df101a2fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NThlLJC3XTcEf0NjqTouFJ+2PrJq6qZ/EZVvXLUiPcdW6zlcASv4qbE6rgNqkvZsUfWDwGqf02j1/bPr2cEaDIRRGfLGg5mIOPUwCwyaGVD5wS8lyYuG1V0kfRHb8AzmvVTJ3G8B1OxE/gqUhZkLWJk/7/qwAHe0OXTid8GUToaC233eWc+VvkPCpeqx9uBDx6a9Y7tHV4J2z3gbSCfvS7DBFPGOorWTP2QJuzR7Y5tokTqPhios2DV6FA8WqZfxuhXBw5hLwg1I3v3vePiXiw7lWbvE0Dy3+wP4GDWc7LNSgiRDbkm9xhNDG00R3p4l/kalPxzx2zFH0nhEvkc3eKHfxO5E1gXE04AWH8uPF1OuhBpTCEX4Fk3AAm2lZ+Z2xUXorXRKO6nL0ijGXJcyiizHgleIKqtOEsqxRl3hkt553FBOD/2vNhnzrHDD+mNk5k1Jk6hIoFvLMPvxtdogoShrtKjrzOsfTnUWdRObEB3s9y8LMyD+AZySZLxEuZ0rO5vmmuDwDzKid6s/fwM2iyyEnAYhYs7i30AhipWDa0trLnOfOI/zg9CZ293w5KtYKN1v1pEL5cyTXLVdWujBiFYQ0CewOMyP0wCM0J35FNfNd/hNmS+T7bp+XvBNlUZ1OiIaD+/4E84FsYVZKe6SreaSFr18xVwdFrNp11n8k4na6wU6l2Z9cyePTtCKDT89BY3JQzKhQxzdf68w8Gkiyg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	igOlBfNy0lPTn7khvKxtzxlYNKVm4r1YxqZVWLkKKZP7/OuI5xp+rtq5+Eg3K2/reNJ/pTTT49OLAt6PQaVjVy4hNCikLSfMUp2uRGRXEsRSW/hY/Tk3TG0DtScYTDdMGlvKewB8eNEvnFfWd0rKd4wPbRgD6NOr22YsX9gQrnAC+5LgEyV3tRwPLA9FbhYEp5phOE1KAfQ2smv2nbH0PbrjVZvxcLJbe61wZgk6FyrDtSG/e4SmYAYG0000P50/A43Nbh7xlZjUaPZnbffCgvn45hPZAcHX/1kmfMLXbKhr10bv4EmdLtPEV6tI+wUsIacGXefupb+Sx7KuEUpDo4yIOucNBk8Q1b76FFORv6SN1E6ZIH5YOWukJ2Y4Cy8y0xW9pOM4QXGs5EiEazoPWYz3X2njQRjX7AQuwqZJ6uuAEizdfgI4TdKDnt3RyZ8Q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:34:36.5220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eb2e04-7895-442c-59a6-08df101a2fc2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5699

Hi Marek

On 8/28/26 17:00, Marek Vasut wrote:
> Drop bias-disable property from STM32MP15xx DHCOM SoM sdmmc1_b4_pins_a
> to fix the following DT checker warning. The bias-pull-up property is
> the only bias-related property that has to be present in those pinctrl
> node subnodes.
> 
> "
> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000 (st,stm32mp157-pinctrl): sdmmc1-b4-0:pins1: {'pinmux': [10253, 10509, 10765, 11021, 12813], 'slew-rate': 1, 'drive-push-pull': True, 'bias-disable': True, 'bias-pull-up': True} is valid under each of {'required': ['bias-pull-up']}, {'required': ['bias-disable']}
> "
> 
> Fixes: 7cd8567d988a ("ARM: dts: stm32: Enable internal pull-ups for SDMMC1 on DHCOM SoM")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 4cc633683c6b7..0a4263e6209d8 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -505,9 +505,11 @@ &sdmmc1_b4_pins_a {
>   	 * - mandatory on SoMs without SD voltage translator
>   	 */
>   	pins1 {
> +		/delete-property/ bias-disable;
>   		bias-pull-up;
>   	};
>   	pins2 {
> +		/delete-property/ bias-disable;
>   		bias-pull-up;
>   	};
>   };


Applied on stm32-next.

Thanks.
Alex
