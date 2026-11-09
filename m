Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189812;
	b=xURULQLntGHm2d5Lc1cC/r3CxKrzXtlctQG7G+kJP2G5UtYZozguHXOB4uyuxN/tgbet
	 KZgaDrWa6ErimiyBWKsoKk4HSb1TpOA+FuVng3Ot68duaiGiN4zfarh0YxOFFu7S73BwY
	 A2WkrNNAqBVLziP3Ohd5iQvOoFYgo4ErC4BMGUNXm0SSFG8gx52l+O6HOATs73kaZBBMs
	 kJ/cmgeIqlB+PoL6wjqemxqiiqGYW4bP5nwEJXM+oITvtwcLoMU5hDqgsrCvqHVmpWenn
	 S7ci4F0A/4+aQ/J355eul8ISc/WVcdPyV9EdPd81r4IdaCFIbP/RMYqc+5o6aVRp1Qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189812;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:User-Agent:Content-Type:Date:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yomQRAW8KO5MzFG+nb0CnIeAiJp4ssWom4/L+WcvyiU=;
	b=ElUhXjcWaFzqz2+4l2iBi1Gjl3rIreSnf/AzP6jwH22kxeMpCxv8o9QaWoT0Lw4rO1Cs
	 v6MdZ0Iz3iksYPqVmNgkWntuC9rclC6zEkpUfSzLvsbX1BDJoTT1VHZPCW2r5YgyOQdRE
	 LDEg8F1nmwiMHGMZ/KQGP84UAruh0Xk7JBtKZ9K6tPMnGQam2ZF9n4p5TZQC+2quXR241
	 uJSA5ey1EW1pgaBN+j/LgNEZSVD111jlWO+0L4BBa5Ok/qiRaApcwzivZeyomey9gnnN7
	 rP0KSmFTEu9z1Z1T8S5hFOS9ZYSv7m/u6o2MvYgB95Fdef3doKhZMlWVchFNB8cKocA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fm7i+5Od;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.22
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF0D606A31C;
	Mon,  9 Nov 2026 02:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADF0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fm7i+5Od
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZCYUdm8crWykWdceLVZ820Rt0kS7vBVwyuLcASzQkZx/vvhq3OiJjYDhueEakatdIvMiIy1k0Klypi9Noskuh8NDjpNHXBoVRfmvyc042pp1zqezyvP2iWEtOOv5VKqkdS/X9IRqXr1kJNNQBlmWU+opbT85MrSNQhQ4hRTrNGK9Q2gEKCrsTDA9PfijW/GXA/Ly7m6ZmnGbmu1H5dE7F/U5JehCHZ5S3iH6wtvBOoNeLtbaPDVVBu83dUoJv6iGI4w/06M87kO2LqBEyAMIMANd0BLD0UOuNxXpHBAFOGqPhnHdeuvaJxoVsgyD0xeIeE911luYpeEhUooLgH25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yomQRAW8KO5MzFG+nb0CnIeAiJp4ssWom4/L+WcvyiU=;
 b=ImvAiy0ZVBfoTYYzhc0c2fl3bDQPvxmV97SXgBBb/+TpUPZGii7VJ3f8INMEhYKwyqqfawwqTkD3jfbcJrBYaOHCw+dc2gMlBQsDQlq5ofGuEFQrYg8ENiCFPQObBqy/NifTD/FL5k4UPuEhFORYzFa/2Y+aPbRrG86aw2sgJd8vuvj1RMQEO692btXLPtIfua0EUwTkE1miJFBPOj+DdICam+c3UShfrnsU3UfvC3kx+Ba03uKGnroHJUl1Xea++qTg3EWM5p/eM9bNdQphdwOVHnaCP6EI81/VMzRISnKfn6r2dqD2a/QWv8Puhr54Z1CjH5sdWag7u6NvDXvFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yomQRAW8KO5MzFG+nb0CnIeAiJp4ssWom4/L+WcvyiU=;
 b=fm7i+5Od22aZXdDCysaBRy6lCNCrhK1Zu3MWdzDhUCt6ZJ5b0eDuKMUZeON+kdj3vydFz42Sh+fo2ZkAz8+PXGhtApiptWSPOp4T534HAApt9TDZHUYFOcxf2ZO5r/iS9raWxrjUb1Vz3nLQPj0tbCtqC5RobWKNpsJmFwESGyk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TY4PR01MB13993.jpnprd01.prod.outlook.com (2603:1096:405:204::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 02:03:29 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 02:03:29 +0000
Message-ID: <87v766pxqn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: <shao.mingyin@zte.com.cn>
Cc: <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>,
	<lgirdwood@gmail.com>,
	<heiko@sntech.de>,
	<linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<wens@kernel.org>,
	<jernej.skrabec@gmail.com>,
	<samuel@sholland.org>,
	<linux-sunxi@lists.linux.dev>,
	<linux-renesas-soc@vger.kernel.org>,
	<srini@kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path
In-Reply-To: <20261107160827257FwoXZMjcThgcfD-ZPfKsk@zte.com.cn>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Nov 2026 02:03:28 +0000
X-ClientProxiedBy: OS3PR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:604:dd::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TY4PR01MB13993:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c03fa11-81b3-46f2-e695-08df3e05a5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|52116014|366016|18002099003|22082099003|10067099003|11063799006|261028144727099003|261022105027099003|56012099006|261026140227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	vCnMCfH0Tp0WNhZSA2/s549oGDi4Hg0GK5eFUTERT5kc3p73jyKvzspMH+CUJTv289ABwgvjGewJTfeSwZWyS2FLwVJIYGhhVTyFpnPC5h/TJ4eQlbV4tbBKKJ9xP5jCWl8iyiLig5xEEigxZhSyNoOZ4pHGfvM2/A27TpcojdGJc7fvidGpACNf/X6QfNVpCakofS9S+mMQ6/SD/VUKMO3nAZDC/KVWuCLEP9btphXOvEqHIyCkl/uXqx14q6W1tQTQCPoiQhB8s2+zIm9D92p5l7f6teCRmBe+kabPjKSxsJQApmxGum7/oOyHiJuslPU6bA3WqDDI6WkPFwUnZuEMhAMMMvl447IRA+Dej2AcKsjjH4Op+1wf9JFG65YV8yvg2IeAL1lQzmzoTQAiEoomoJQu5XkK0hRbaLK4V/egww9syMkJ7rFAFTJy8oWwHt6p7503rZkeDgnOdbu5SaMDXxeyrO4eRC5u2W6uJBCYgP31Mbzi8j5qBYkxJ54tbmyz6NLbvbriPpGGrbcz0nEngiALRFeh+NS6bqhb0pSjnYRJ3MapIWHa+C4j1CaPT0g7wxm2S8WyTXJllxGfPVcSd+7XbxQAXcrdTm1VhT7k3EdkDP0TLlpXUXtndCBB9vf1qEtQELLOnSwO6W+cVkvPVObLWJQhXXn/t5bVAnTM0hDFMeA0HZrZcNdWrm1QwB4K1uDRPaKb6uUeM1l009NXLwETj4cu89I9Ij8PIPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261028144727099003)(261022105027099003)(56012099006)(261026140227099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0piyin11ViYUUgutyaW3BGMQYCTzrA6LVL3DdH17yaGRiKZGcry4F8pkLy9e?=
 =?us-ascii?Q?yXQF4HS835/0t/bL/++ybTi/nmsfmkUhX4rMf7qlEqUALx7SGlcpOuedt9Ex?=
 =?us-ascii?Q?4d0AIbJjH8e3C3Hu2wu4h0oyArv3J717DbfpQL+1l4jjlRs0ipy4M3SIv8ve?=
 =?us-ascii?Q?QOTICq3cw41VhzlopH1+1ApMz8TRVx6pSa3qaf+eR04LV8o6Bw6ErEz/G6QQ?=
 =?us-ascii?Q?zkLWHPxe0fCYeXyti0kUlKqBOffRRWBnBGc52gjEmOlvOP5TEbrn9h6pBewi?=
 =?us-ascii?Q?kT2wv1NDvCZZqgCnqLILmRBk8az1Fcw6KdJILidsPdMqMh83M8zKawGzNPoa?=
 =?us-ascii?Q?/ern3GOaV2ZcdhHnBzmH6iaeh9oV/2430Xy5XwQ/tR1WVOud4z63/FbylV/x?=
 =?us-ascii?Q?uYNSfwvF0b21MkdkTtV3+EbMhKD4gJEccs+AzBpf4YnDnDwhjW8t3SMnb0IU?=
 =?us-ascii?Q?XmDQJ03ddIIASa6lvR+VqspLsQA1k6X1Kfm+PUKoDX6RVFYaAQpR47qDQ+E0?=
 =?us-ascii?Q?cPzlb96/4KGrZ0GzPRjPk9w+GRK08H8HtEzImEQBuR2ZeuX2hygjJomcikSX?=
 =?us-ascii?Q?JHCBqRYWFY3ItXZjHZkqiD2ih7JfOuMf+cNih53NWli61Hnw47Mc/Ly45G6h?=
 =?us-ascii?Q?LXs+jR5Nh6eRRyqPaE3IYQZpEajdSKgEWpSf8C0JLOjx3GE+w6YKqPbTd6um?=
 =?us-ascii?Q?MM6WXlDFqXX05xqwmHkZSBo9JeP27D9q7EQpX30qf/pYd1d6r8UuCr/6cUsd?=
 =?us-ascii?Q?fblFgB3bFILIAhmV0kvmKI84lgNFLd4s/VMifss+XBjqVsz7eMmmbkaFP1el?=
 =?us-ascii?Q?pMGTXRelcBmE8O+LnI9eTVJB6d64XIiLQaTlolWbigwEFTlyCGWwtzp05iob?=
 =?us-ascii?Q?/xQFYhaQmj4LLMco6fn6KR7Bgh6lw6+9cI5nc/bk4IkQERo1ctllsqqLsoVw?=
 =?us-ascii?Q?zLfPxb7ATl7L3iS+tX8BrTXAN7t87BgaqjQGgzesaGCAyxh4slStIq39qkNN?=
 =?us-ascii?Q?jx8+uwDE/sm0gT6xVzjzRdHeFIRQOzkkBakobpp4UC9PgeIHmsmFbym3sRvr?=
 =?us-ascii?Q?Y7vgF0faHRburcopm1N1JPDqt4mmR6Hne6Afio6mKWlLfPENyYSifOR67tUP?=
 =?us-ascii?Q?yQdGAD0MoZDy9zXdOUGxVfG8TtZlQe50L3ipRDVK4m7sZbHXu/4yjvH9Q/GZ?=
 =?us-ascii?Q?4iR86y/jeBWpgTNcSvbdYEQGMTZ5u8MFpH50/kzyDskKksUUA8Je0iRrxK+V?=
 =?us-ascii?Q?m8R4jpL8V49L925GIPqJQQJPe0DXGoQjZCtVofcWKS6d4y+cYuGz2ib3jtEf?=
 =?us-ascii?Q?nOJaH2o6U78qEoCn5hN+0tFKVGnCrqHsTehnDzaxTJ9+mEkcborukC3RjicA?=
 =?us-ascii?Q?qpbD6AHH14STnFeeHiOxRTlPgNlE7gJ5R4PmadgUFChI535uD4yyz/zjPi/N?=
 =?us-ascii?Q?oGSOObROnF1Oj+MYbd3Pfo57o8pPAuwHQYTer8ZyLYtqDXgjzwZiHuChwXh+?=
 =?us-ascii?Q?RJL9w4mc38adq4MCBHQZsAgNusihtmxUqUUVjfB95p3PPyI/nRUewqGsRq4c?=
 =?us-ascii?Q?zZuq4P3BqckFll0uuaP9EpUy2XmxhLyS9BtDTyxdrqDSwhrq4F3LkZb/857N?=
 =?us-ascii?Q?ztpjtSMrGlo3n9vEv73HMgb4GtFYYAiLeKljbAMCOq2jtwWlkTVNo7Bl49w7?=
 =?us-ascii?Q?s9em7scRxjXxaugF3vBicud/bPS3KSS5ZjjtXWwBzjdyKQZSXbVQ3z2qwNAm?=
 =?us-ascii?Q?Mk3mZ9eXFAg3zvEBJSHBXvgPjoukKiU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c03fa11-81b3-46f2-e695-08df3e05a5d5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:03:28.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsXH8iRV3lQVzCaEvTPOztBTaQaU0Ep7sQaYMlo5PkNRcS6tl7uejVoqHUmpAbG33acYZLOwf2xOD3M0/aqwUeQ6jvLEkkZEfHTuGfP4QYguvrMGgvTxlA0FTEl+YB1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13993


Hi

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> rsnd_ssiu_of_node() returns the child node obtained by
> of_get_child_by_name(), which holds a reference.  rsnd_dma_of_path()
> only tests that node and never drops the reference, so every DMA path
> setup leaks the SSIU node.
> 
> Put the node after the SSIU branch has used it.
> 
> Fixes: 4e7788fb8018 ("ASoC: rsnd: add SSIU BUSIF support")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
