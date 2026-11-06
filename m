Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793961210;
	b=vhRAeb7jHJdWtWkXH79x+EP31t3O/jZk0rcr3PPAZj/Xs+wo1zFCgjC/J3UnFt6BRoXR
	 rH+MCtN3rlkIXl1rJNV++scP5u4W+lHPo7SFGyaz6x0GmllufHAZQ4t2jXJf9zmIuXumQ
	 CTk9w3/sGCxc4e7LegWOdkIzDc4DUg6JMc4SubbYGASStj81H7zDl16eBuO7mhNskGulH
	 solZRL7jwpbr3tZiSuR3wdSVecdc8km+6u9prybbskqzu4nT0ZGGONxSXZTP+Ri7QF6Gw
	 TUmavbAI8mRdvDl9cLftQUBTqaQ76mEOiAYaPDOFH+6ZgWyJvwMJwy4pofwtk7uYmSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961210;
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
	bh=IwFa/IZCEkb2k77E31lZTIY0B5l6h/xTQQXneqWumEc=;
	b=IPqvzN2EL/ed4SFFdUgjH4cFUqJHAuN85zo2vU00+fJDl7gFO1UJWa+la2H2CQigAL/m
	 gVV2Wi4bp2t5du35GZbU08a1SNXjuWF3k9wRHMnpB4VE82vZlP1ZebwZOefjLqpJl6Y7u
	 kK1HgNy//ks5c0U2FmZVh/j9hj9Vw+gDrQN9zDciWFHmRUjNoasXab+XbhhHDdEHJ2ANZ
	 y6HLmdit8Gdz4bu25D8laBdzY3dl89zRWJRgu+UWRp/9ajnjFxB33XhXJRO2rlmxSb2bc
	 gg1qA+A4xhs3to7JVpFY1R/yZfMQWHQlvPISZsd24cJ2Wvzi9rWmQWGtHmQ09V/1rkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Doyk1PfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.54
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1130606A32D;
	Fri,  6 Nov 2026 10:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1130606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Doyk1PfY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFXpd64nZWUnu3cHro8zPnb26txOTIt84ytUk2a7fc/uNYLUYtUIsn72ks6ZFhbMJpqZx/yoeunvK2WSJisZXXQcGOw//LiCAqJPnHef0rhhfX+hQsvNcDOS3rg2OL2jlt/mfUf5J6kyoA+Xzqv/sRa6lAPRXlYyOQ/Eo6nx3e0XbwN2h6WL2T9EIuLRGh+p10lMib1pfz/En3YX+BA2p4vJFJbwAsRXHGgj3/SKAYloGNVATzj3xGNTGVJ/F/TchfcI/ybDJNU5/0QczkPW5yQq67LX6OKkYXHMYy4o5WPpQKrfO2HS3qj6M9t2tZvXJDir+dhkPacGYBgsd2qVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwFa/IZCEkb2k77E31lZTIY0B5l6h/xTQQXneqWumEc=;
 b=HOJZVtfPynyLEHGfctvYli6KtsmTEIxE0tRQPJfcl4nK9c7rxx96sktigikGFtdiZBKe/8/ZVDaILipKqHeT1gL9n+Kd4XcH2iP2ALG/D8D+NSbikb5VMF2aLSjJZIHSThzmB3jc0aBcIZvV3b45HnYgMkraS/UnvFgLp03dae58EBjtc6w9JxYZgXIvRXEThcCxiYODrJH9inogD2xjASZXbMY2RfFBkIPpY4MGj4a7vObYzQtZFlJC8qgF7KQGh/5SbkqBMacr2fZB+3REf56v4TB4c6Bh8ETUuaEEtuS4HY3u9Vbpj3VwAGsYNSeqshRm5LnbbqAaUe3jJM4sWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwFa/IZCEkb2k77E31lZTIY0B5l6h/xTQQXneqWumEc=;
 b=Doyk1PfYKE3Xu7C05LssdibRNgfJMsmyo2ZpQgysQv4n9MUj0g+fosNLRpH0ywiaoOpzzAvltGyt/s0vVnKsXrYzKzKOnjtlWZp+/7pdyAFZgosW7CH+NnXjAeV2k/QnQm/LbwN3HCpMmbJlLBW2D1v7dGIwF4+wDye7+HWRlmVyUvEaYfJDpOFHvR46Db8DCb9BzZZSoGjHuECuz6GBNANLKqNocNibf7Efn90FvNsX+0Xe4a4c/9VRtWzKwOIb1GpW2obBGvX7leAb5wvCwNtvNj7+nnZ7cbwTuGKFxO9Txfxn9LsaXq+YOrdTQATAbHc2QC657guR04LrBdnVkw==
Received: from BE0P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::14) by
 DB8PR10MB3130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:f9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4; Fri, 6 Nov 2026 10:33:26 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:b10:a:cafe::6f) by BE0P281CA0004.outlook.office365.com
 (2603:10a6:b10:a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Fri, 6
 Nov 2026 10:33:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:33:26 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 11:34:05 +0100
Received: from [10.252.31.114] (10.252.31.114) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 11:33:18 +0100
Message-ID: <f8a1dacf-f701-4d04-b837-906504d6afa8@foss.st.com>
Date: Fri, 6 Nov 2026 11:33:16 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
 <20261106-truthful-humorous-centipede-bc21ab@quoll>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20261106-truthful-humorous-centipede-bc21ab@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|DB8PR10MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: e3082801-be9a-4e69-86ee-08df3bf16422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|7416014|18002099003|22082099003|10067099003|4143699003|261026121527099003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	4RCrxcsTsG54ZgZcJ4H6e+VvmIZg2YAA5sm3UZv+i/aQkplIENKpdy04qZtjKL5v9pPoOQ1+YgUyu1/7CKTkhO7kGo17V+LOAtj7GHU4HPYY/byLpjm8aMdfVw6hzFCu9UX3tFy8bMhNppbiY4iB5+4ZBngafNwO/2fYN6uU6siW5zBN3b/lyrHbPPi4uuLoZB+GNXhPH6KOoA867T2vkeUyIh/914rP/L9q+xry2k1uAyQcw7/SSDAM8LKy+Payzp1hZN7tTrZGShTdddx3xXCLFqcov6W0Jdhn9cciwxBQnwTZF6puu6ZsBwiqGVH+AgOtjbFEpdO+qRLil2aKOeEAV9Utx6a1uM4Slvr3ftKP/YUF6iVQUDMTJpgLMKgcPxMP2dtW9kyhFxyTxojNWmfjo9eUQa/SHVihmpEzZEDPrJ+RvV29Y1KbbTeW3qv4DRJyyWiWOClImmOtzgL0QfiNiKzfK1hdPcpNX5EGqhPAhGQW8yMyd1IQQg8GnH9H0DZVMpowpLH48lTS35G5UhU/VQ5nq6EAnOmkq07qDs9XUfOU5a8I+ZaA3WQ4bmu2EtE4Kl7KWEG9gncnYqT2FJSFWGDtRTQy12ZWkswMqOSVQLwPMI6IB/XgbnDRx0KWflVQWKdusul9NTaiMG1Nd7SXtl0oBBf2/z91L4sgPz9KboA/Ixu4GGDQm7cOy/2EglUT8L+tJnR/bWSV4J2Txg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(261026121527099003)(11063799006)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aYOyV0aNO+wuVD3QdGaA7lDe++Fp3+P01+YS3RQGx1XL9yQN71IuS5W7YIWG+lUaVCE4wgyCXItXPi1nGlDyQ3eH2uGyaYGeFI5EF3sGOKNuL2P+022n2BxlASGv6++vmTHXKsj8ZGQaXO/VnI2IiJCP6Sew5HjcRqyOZ+ehjmA2XpIrFMkJCuI+/KN0MMLx8Xk/FNV+m/ogR1uEl3b4RNdaviXAWpoesptEfVXfbxrz6ULAUBuiNYK/OVRCOcpy/1uUECXsQKkWZ6mn/hzAPhJaMIKX0h8rpbkI/69ljB/aTYWopfv7nRIQv2xPH/UoKz0yse2wLvwcaElCMiVNiYLVnEKxBpW8KKWughiWzecBtwrGF0/UVLkhKNw4pHYm5eJ2w+HQj/UoBkslEFm/uW03cdRkYRUBh3cyYNoQAD+WrZggkR5w+T0TSeTxx1wl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:33:26.1920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3082801-be9a-4e69-86ee-08df3bf16422
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3130



On 11/6/26 11:16, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 04:20:08PM +0100, Patrice Chotard wrote:
>> +      nvmem-layout {
>> +        compatible = "fixed-layout";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        /* Data cells */
>> +        wakeup_sec: tamp-bkp@0 {
>> +            reg = <0x0 0x4>;
>> +        };
>> +        boot_mode: tamp-bkp@50 {
>> +            /*see boot mode selection feature*/
>> +            reg = <0x50 0x4>;
> 
> Mixed up indentation. Please also run scripts/dtc/dt-check-style and fix
> obvious issues.

Hi Krzysztof

scripts/dtc/dt-check-style  doesn't return any errors.

Patrice

> 
> Best regards,
> Krzysztof
> 

