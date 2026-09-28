Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89D41A56A;
	Mon, 28 Sep 2026 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600884; cv=fail; b=AFjtzWAMiYJSB4qscg5Q27i8b9VtdzQRBAcphbrpyQrY3mtamDp75FMhpH5K5ckQiNC9aLJBR3ihLUBnb+7KKOXi7phjFeE3m2ojcw0ccp86fjukpAW+jsiNo+ADXrh8idtA8qz+xJGlfPxbOYd3XaA5DM0xC1eOaIMcqm7ZZgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600884; c=relaxed/simple;
	bh=M2SXAHqh2JviyXjtGjZEJb2ONydWKWahYH8018t+ACc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=peprpi61TpFPaNaqj/PPfmMv6QJGGkSxSIEx8WgpN12BplUHZYr9nGyjLOsejUvhxQBn6yMl0x8S/B+uCsxBRQLdnax6GGxyHhoIb1rAiqOZxZi2EOlsetVNJUps98CJsZeCNURneaqlAByWBnJyKnLKfE12+NYETe+urgMTKdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kUJ8lmzQ; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kUJ8lmzQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9/QLMXeaHyMof1y9fam15iyU08rxgGUUvnfj1X1HXxQ1198d6oyBcUGTriRFTv+dWAro5/+qS6afJzGXPaZ96Ck7KxLyvH0QXsmA2mX7TB4EOvZamjeETmnSbaiam67ySO4ebfQrRZLzEste01JhaF1+xTqmy4/ddB1i4th6f7WN+ZD9TETPxUWEwg2sdkQTj9/UvYR+sL4NuFlADVZ/buvinkLbKPjUD/DZOWdnG2YQ/JfwmePwm+7DNVm7E4k3MWUnYf5e0oAYTss0HLS35lKCR0ABBJSmFA+Jpj1Xng/KUhuXNpSL9XJt/IWF56Co+n6vFdHXnejth+G1/9vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxSNjVT4979CcDIB2eXyC2fXrOMFb2I45D/2gr/sDgg=;
 b=yYCNkbNKtD28jgLPirVnBSuBH4YT8Cs5hkusRqCWsAXH5UOAW9oUvtQQUyZ8jwHddZho8OOVNDMuIOyC+Kv8P0Tn1vUU7+6R7yZX5myTtrF+TvMo5+9Upfj4uSW17hAR7hqCnB/qCxjTsQrU79SoHaFFxnTcmL+XKW8b3GFON5jZQ4Wg6YIRmceFnmOqktIBwi/sR0NsW8DBKNq2yGk6to9z+2L4Wp9uB+w7hTciWMG7uxx67DWlN26MBnX5KiLBbiV6PHXJqxQlJiXCg4b7KBvv4WLB5r7rdDOQBSf0XgXb/F7XTA2sg0/DMwa3uLeH55+gb1GBAeuKzrFurnA2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxSNjVT4979CcDIB2eXyC2fXrOMFb2I45D/2gr/sDgg=;
 b=kUJ8lmzQli1BIh+azhe0vqgHUmaViI1r7seGp50NyzLmZPw14Xmz/YusPXBY31a2JQqYmRe5pUUFy1TdwYx9WLPY29X5hn8WCaX7IvgF/o+qtyD9RIvQZvohlEi2ggDuxng3RJYolZtax2YuUORgoP2o7fJKB28SYw7hWDPzNJsc4hXLTEW95DqGBd5ZByeZ+wXTjPG+/0SE4dVWFTQTQ87AQunWLau/5VsawzbcvboqJYLOmnOY+I/EmySwGrUWgOdBdgyWxkpqANPTkyK1mHg9x66+IF8bJF4WpJTYk3h1712WBsXO25Fm8MtoFnxOrO8UPe3u+jRygUYS24rX6A==
Received: from PAZP264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::15)
 by PA1PR10MB8643.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:07:59 +0000
Received: from MAD0EPF000008AB.eurprd04.prod.outlook.com
 (2603:10a6:102:1f9:cafe::74) by PAZP264CA0151.outlook.office365.com
 (2603:10a6:102:1f9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 13:07:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008AB.mail.protection.outlook.com (10.167.241.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:07:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 15:13:30 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 15:07:36 +0200
Message-ID: <a4c02a71-df8e-4370-8ec5-9f07210f8727@foss.st.com>
Date: Mon, 28 Sep 2026 15:07:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: st: fix sai3b unit address on stm32mp2
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Olivier Moysan
	<olivier.moysan@foss.st.com>, Amelie Delaunay <amelie.delaunay@foss.st.com>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AB:EE_|PA1PR10MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: 2334c1c3-3c14-4066-0d3b-08df1d6184c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dbnyIOIYHWsVnuu+/hwhMgU2ioMjjiYmTK64eAdQDXd8FPjLoE1cQru5YsHhQdHY13Pkm5UPGkQ99kFvTJ8ISmetHt+q7nQJAp/clJ4hXQfOKWIzz3dnKlAQDgunnE6tNCx+BTjtoBTEBrKKjgq2QvLeBRLHGPFOLM1BYWhaa6/90cCdXpY7D2rXkl73vhSaNwiMPENFya3oh3nC5Dio+CKaJ1KTWVMxXFv0mAGGXrHLaIVp/kQ6YIdjVUKqWAOobliv+o69FMHSVgk21Hw7N9JomIlOhCmicc7Or77ZHQ+T/2T7zZ2v5Yj/3iRccKMRNjTw/GCqTA40R09DtIxeGgqj4t7DFe9yOxpTxcY5FDx359CvTZuZembo7yuMT1Im7jpsCsBv08ESOMVvOPMxZgiDEIrO1curu0eK9tvdPmBf+TmFvO6INaKTqynebQnBnGOhYXXn1eMSaVgTFTkG4UkqqtxZlToNprPYtyv210zaF2jORptGKvkmzPBRtawWx0MVBOhoJibDxYErDYIMqCl530GpBHm1Gi+6EkG9WCF4PnMAUSATojzxlno3+UUZlte+b5Qvk5DtOvcArGeR1bLyrZT10WKnltXudR+IztRa1osOTJvJM8fKqhd0lCy30fg+JqCJbTME8bu0G/kz7+AEdzSWVGXUITQ+m9Chbxp0lmNK5iQOtE/mK1mAjYlF7+k2XsQUNmoiaU32cfVC9w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NvB43Fu3yn31YG4vvvysDsG6GuhtHwXjLo3Eyg2FGQVxH8CAk3mFUU9LHw/GAMVM2gFtodx479Z+XA0U2z8YIVIhvqHQ2EEDudiqB51W0oC3cYKXwv5bP+2Gb9+4pvqVSlQAxGQWpTS00dLUCjRE52/q8gXkLzqsROTxRyG+l1vrWZFf1wdR3XVvl5HKx5Wv/g8Prj+UJSIbK5+8tHRvkGZZGb3m2vVAfziK6JiL8KU7W2jFYCa6rY2RIrQFitP8rTBHtk80rpU9cs/jCfdrFDG5b8wsELwkS15x9z+JK+GhMRsH1lK/m4CwxqaWJ9fclY5BY493U9XEYVbHIST2WnlPe7eSfdDe74FYVf2cxfDkebtVzvomy7a4ArsWgRHAmFcAcNRAvN3m7jSQXAjHj44a3JCEtDu7Ec4tGYwrIaPJHfCEXLRIZhsMC5ORYvAK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:07:58.5351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2334c1c3-3c14-4066-0d3b-08df1d6184c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AB.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8643

Hi

On 9/24/26 21:38, Mateusz Nowicki wrote:
> The sai3b node on stm32mp251 and stm32mp231 has a unit address taken
> from the secure alias of SAI3, while its reg property and all other SAI
> nodes use the non-secure alias. The reg property is correct, so there
> is no functional change.
> 
> The typo comes from two different commits, so each SoC gets its own
> patch with its own Fixes tag.
> 
> Mateusz Nowicki (2):
>    arm64: dts: st: fix sai3b unit address on stm32mp251
>    arm64: dts: st: fix sai3b unit address on stm32mp231
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5

Applied on stm32-next.

thanks
Alex
