Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887732F5495;
	Mon, 28 Sep 2026 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599686; cv=fail; b=J8oz/bV5MxzsYo8+LBT7kMGBFQaXskJzEA9We3wKYbCKgYpzg+QJ6scf5zzG419Lsj2gsVrZW54dtqt9h72ybMlDJSKNzZOpKuGDRDV+eWPkMpErfX15PvJabtw6zFI+s6C4GwD4hP/q1Xi3TFh997pvdaLrcV30eowxOEEXr2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599686; c=relaxed/simple;
	bh=g//SQd86aZ6r1/TAnETrK2t1XQnRMuHuBaJ+8R0KREI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aq1wSXXR5+9Q2gkUnIinS4nHHjx/9WiavHxjT/6e2YM+yxAJlDSXxEPgH/Nsp3k+di16GF2B1/ZvkUyQKFj02gCwYmYj3MTQOYzTWRZ359ikHN3V2GQ80/cblvzHBaAFt9T19B3xXRcTqEsqn+RDIDST32t9kX89ReIH/mauIvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ey23Q6lM; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ey23Q6lM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeHtssuAdm3nF6zqDid+LCpW+/SFU5oQLNNVUa/aREWP8vq4HJcb8XeeJgZ9U+dBZCGn0EqGX+MI1rC8v0ZEO/I9dKa2qdI2WDbFpxyCgStFXDzap8xvgoEiWvipn5MZQz8KwcO6ZcLMTJr6K1QZ/ZCBRftlHmM+JImdWaDzQamcevWd/OGfcbY3uF3sGCHDwTMlq345TDjmpsTsAE23OkteLahXMeFWlr+BvDQN7UC26r9vKiqSDldYpDhy0U+MVuPk774rjNig6jhFLdMqUNqVPI5EZyTykRXau8jjRN/e2kmg/9zoUDd3O5of+ulfWPD2yD2NGTZPz5Wcuf6j8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcqBmHzjEANdbV7L5k6SN6lFoTq1isuVyPwYCB10/Po=;
 b=RtWiegra6YAixC+hjVdPYZ0JvKBKvlJ+TwsJlkXFGqQgUyMN/eUBHF95Wl3ErwjQQ0rQQmSsiUMTx9kZgHojvmxvNce355+4/UkHs6DEGvLvXcDabmeO3yo9xmzshXo7SdvsmV6Qj3DruEgxjBgjbD/MsXffHfOk6A1+yL6ThpHa1U5TD4yY2ccgkPpeIHZO6vgwrplOlrs/L0SwIaB7S7q/nnL5r/qu/LccxRsorIAX3BkrKFngKE1FvStCy/HfHfbBd5I0q7BVmcGkFrzTdHx8aA4mUpav7XBOF+mCs8ZHIxR+545H6rZ7iddOVDXwInv4t2K7nh8277HfYD/0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcqBmHzjEANdbV7L5k6SN6lFoTq1isuVyPwYCB10/Po=;
 b=ey23Q6lM3PTKBIKInDe0V7bTAztrFRy7Q4T0B4wAU7N1pmR+R2fmjJG2A3kMM77GXDCt9i5xGhMwF1OD2s5dG7QaBbR1SGHU8vqs4REv2G0cDNfJ3iGK7BtGbFjozgf5lnXYAQT0JKNlmFqv3WPTc2kq4imeNhYoiwyJF6ljoY4Sr8ha4SaHhgJ2E22NcD7jZz0bqXroPw1+TcxsYDSr0T+vQXYBgmTQk+tmPjGS/kacyRkEXEqkh/tBxDU83izfQKLvzzUCJ2YgJyPv04tFSZ1h37U64YWRTIgIWezOQrsa+AWyZmIGhBvs/KkolWC+ecbyw4TBl3HiHarXJ21ZbQ==
Received: from PAZP264CA0122.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::18)
 by AM0PR10MB9670.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:743::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 12:47:58 +0000
Received: from MI3PEPF0000855C.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::15) by PAZP264CA0122.outlook.office365.com
 (2603:10a6:102:1ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 12:47:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000855C.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 12:47:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:54:29 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:47:57 +0200
Message-ID: <37aa38ed-06f8-4fc1-8183-0473fcf6235b@foss.st.com>
Date: Mon, 28 Sep 2026 14:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: dts: st: add eMMC support on STM32MP257F-DK
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855C:EE_|AM0PR10MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d75a072-7fe6-438b-e2e5-08df1d5eb94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|36860700016|82310400026|376014|56012099006|11063799006|5023799004|3023799007|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2k/pSQ2JNBSlAVnYuWdZLtTsqA/hJmHqJVIGiFFO8U1Mk21uOflLYAIRd84m3gpZNx45vpZCQT660zGpLRwc97xZeODEpFGHh5jrjDakjztk06rHGXnTP8LJstaHNk6ypT6W3mXiDRDfD8jqcTnnEObIVnNtrb2hJ6U8JcVjeTAnYS2ZYvtQkJMys8rCqYJTv25f+0Ros72m5Y6m96GmfOhLVdzYTQE4L2mphAsouPZBsc7tw+DzfpwH+3elFTgul8gd4fme4Twppc1VwDPhScAtpAZGSW5vzwat9ZnNM/nepuVMjBUdYjTtRvKCKmOAMIw9yt8DPrOVA81nFAcpr0B9oDkAh+Z3j2rDHnz8OZ1ne+X452hdRmx/QiWumJdr9MJi80Xji3q4DiqQEoQ/Mf6NaO+/FpL/67jeJAaegQvlePXffhEGvFaNNCxtYdsBpRr0DfuzTZxnsdwolF8dTma3GS0A4TE2Pmciv5/NG336TQqDPpi7lISYsNix5RiCwB5j+xsQbX86nlWXXX45bcyv9WG5TJDGsZ/1yxJLu8/KEzkRGNUwHQRMOjXgQZkE4hiryMWoXmYcU8uruxXlGD1AnR0r/8Jw/HSMqz9nVHgsPaWtz8OaxBMXXG56xWZcszztJJPwxlmIVUxN/BjVccFdXbtJnuP6gN1EIVZl/daKYJn06k5GcVy1GH4corXeI5jQuCJQ8ASjZqShHPM/dQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(36860700016)(82310400026)(376014)(56012099006)(11063799006)(5023799004)(3023799007)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pf0ex0BkYmCrQUzX6zXod0Z5ODqVEtkQdWgNRq+UzN7KG/5fmPeDH4pyT6hhuFx4HFfEEXNqdKEvw4Sh3aMcJ9hFcupoBfmwUI73Zdi71KXaklVkTSFnEYKwO+X0ITJdCgrNsAw+kl2eWm0zSUuNAJmIE8sKc9F7O5zkjA/Wf9w9obmG6qSYSdQWYqVNRxCrncTiFTVKd1Ky/r4yb1oa33Vx8Y9/rzQ3tS6lfHo/6W0cMhAAbUI5aQxjKQBbHuIUg2rtAPKe3+byy5gDRh2YS7wAZOk4nwBhSXb2Fc2Z46hYPjVuxhN668kayQID743rmu2bCx69//ClpdP9u4auFaQPhawP/kejHd2HKsAOEWFtcBNjzAa7amCPAEoM0kP37gsYupgEEKzEOpHGvR76R/FEKdxVTndzbzFNITVj6zFZIsnDT04IIyUT+bJMeUpi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:47:58.2192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d75a072-7fe6-438b-e2e5-08df1d5eb94d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9670

Hi Mateusz

On 9/23/26 13:47, Mateusz Nowicki wrote:
> This series enables the eMMC of the STM32MP257F-DK.
> 
> The sdmmc2 node and the _a pin groups are already in stm32-next. On
> this board, the _a groups give corrupted reads in HS200 mode at 100 MHz
> without any CRC error. Patch 1 adds _b groups with the faster output
> speeds that the datasheet gives for 120 MHz and 166 MHz operation, and
> patch 2 enables the eMMC with them.
> 
> Changes in v2:
> - Rebased on stm32-next, the sdmmc2 node and _a pins are already there
> - Dropped the patches adding them
> - Added _b pin groups with faster output speeds
> - Dropped the vddio2 regulator range, VDDIO2 is tied to 1V8 on the DK
> 
> v1: https://lore.kernel.org/all/20260912204454.219606-1-mateusz.nowicki@posteo.net/
> 
> Mateusz Nowicki (2):
>    arm64: dts: st: add sdmmc2 pins_b for stm32mp25
>    arm64: dts: st: enable eMMC on stm32mp257f-dk
> 
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 +++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 19 ++++++
>   2 files changed, 77 insertions(+)
> 
> 
> base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5

Series applied on stm32-next.

regards
Alex
