Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD560363090;
	Wed,  2 Sep 2026 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358586; cv=fail; b=jFVLolYhHe7LFKnLF45xskVyG9iJpCEdwZso4BskJXTC1v7eBmBz/uM5+FL12OobFaScxUeQ/I3VEW/LvTHXtaasghgh072WdgHMqWUgmFYHbUl/vxCDeml8CCahdP647GGlYWamzCU8DGSi9i59Xb7gQmwWSQdNAbnhKhMhmxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358586; c=relaxed/simple;
	bh=+F7pDmEIn7QSkgGZ27DXkmoRAdlo5Toy3+vjCvakGiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUPefaOaowjvlcx3tTKy6ozLh4yRxbCVRkoLmM6Uez373RAhjOt1/GtkeAXn86aD9vQLjYgumYp9brnpJYlumay4tbhXfE/PeQSsdugcjbMtKx78Awq1+fQ5C1k3drv60fOPjn6KwbjIdrTuSjMVOSOLl8V7XPzwLt9nkwi4AAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L9IRVAlo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aeKJQrps; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L9IRVAlo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aeKJQrps"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DitRu1328514;
	Wed, 2 Sep 2026 09:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=5wErMkxFSNEol9iTmB
	zf8KofU56E+NIVuszHDXEPOP8=; b=L9IRVAloVfT/yoS3GvL9doiAyiu4nFQ5Xw
	f7Y3Y9MxCFuR6ll+LibLe2q95X4TJec5hpgKA+2UvfPJaf5vW7LI/oLtBA8DxZ+K
	6yCCJuKanl0kvTwZZ6vfYnRHhBaeYOTFcx0MZqMj5nJNknzOqK7WIPISDrr4V8n9
	mhXZf7LYaCfkXsvQtxgAMqm2Zwz6oOWLGbOo0pUc3zCxcaPVLIDkNWMODi7m9Uwv
	b5YXjkSOPhPHcJ7fhQy1usatBe1m/ZvBqUx5uiM+eOqX8UpEw+zYQIGF0SUkOxVG
	FQ93EvWRmfxxNlLZZZrcHeHcemCoNQSPGgxct6PJkOJ64nm3AkxQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azhn15011000.outbound.protection.outlook.com [52.102.149.0])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntj4ds-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 09:15:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLfWsIuLRgL3Buthb80oT98wzY2d6KRct2Y3Jmh39DHKrioPm5t51ptchJx6q1jt5JAxK7TAJ6r7HMXLKcEGsh8qhHTm4cQPllbe/TIq2IPbWFDLrJhjI+P9xN2tF/aQJgXlJQwPzCc6Pu2JGgjoXQ0qUyM4hSuPy4xytk7xmpNur4YyA1ZeALZU0ISqo3gfgFrKEKzBTJRje+ILE49Ct9uNbI9F5HLxUX3MIYuXSnJvAty84Vu7dYzibFzWZxQ+9iG2dCwC6/Prp/sUe3nvrQYPGoEao5viW3nQk0pirQP23MCusafme2c4Sys0oZX4jff8VKoHXUJyCTVkTpOTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wErMkxFSNEol9iTmBzf8KofU56E+NIVuszHDXEPOP8=;
 b=JtgWug+nN+VRtet76W9ZUVyd6VD2Csr68FeEjj2S9G2rgRpAF6YSoSNPPZWswDh6Znme16Ng66kZT5ovm6g12MM/W/8uAAjfiPfTb/72mq3WQGdGZK4L5Fyp9f/RwvNads1RKCitUVHsgupG2sqqRPJPazOw0AIe+MGVP2Jzzyzeo8gtiCLt/oqwLMfAQFgSTEpiB0Pis4qByUEKHu11AfIYP5KZVz/gswRp327eauDCtT3WGTNpaffwjM7w863XqYc5Hazb6zkjlenBWWoTeS11m5HlTPS4qExVmVK1/uwALBiYPMJzkx6C6pd3CHdHQpZzVmeiyIIx7imAx+jnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wErMkxFSNEol9iTmBzf8KofU56E+NIVuszHDXEPOP8=;
 b=aeKJQrpsTiDwF0HqzDd5+4mKsn9BjRRmy/2PqjlTzICU478mqspwvxBgTSC5Ib8qmTD/Ter2uDhhmvqS9JZO7zgh6OZxBhgSa1ItEEp9C2zzKmgNeFLdmegPzaikDw96IokngaIqqk83UdsGFPwVTyAUB+B6CXhTslEpyabO4KA=
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by LV0PR19MB9212.namprd19.prod.outlook.com (2603:10b6:408:327::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:15:45 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::49) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 14:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 14:15:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 236CF406543;
	Wed,  2 Sep 2026 14:15:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 02C2D820247;
	Wed,  2 Sep 2026 14:15:43 +0000 (UTC)
Date: Wed, 2 Sep 2026 15:15:41 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <apgvjaZL4C/NVF9d@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
 <anNfCj2e5kPZhaK0@opensource.cirrus.com>
 <3bf36ae1-d771-4ccc-b306-9cd19f626462@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bf36ae1-d771-4ccc-b306-9cd19f626462@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|LV0PR19MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: a47b7abf-58f0-423d-5259-08df08fcada0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|34020700016|23010399003|82310400026|36860700016|56012099006|10067099003|11063799006|4143699003|5023799004|6133799003|22082099003|16102099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	d7dmtYa179GEuIEZoCdGjvmeifDPTCsrrd9a9ISpbHZAX1jALbN6IPdW8/iD9Skrk7ZA7JRcNm4p2jgrgQsEfm2fCMO/LWkmu9wk000HTy1N1r8OgLSOXuUPDyQbNLhncrnsXGfwv665gkdHR3+JL0UAp6LJBLQ3SOzBDKqRWDqdfZYJgKt7FIgaBFD7HSOcs1YavQTATU29a/He52Dpcz0W/91S5xX/7twBYzHSqnkDI8MNOQGIBvdwHRzmQVJFR50ZDCzrFT/9KkagkXE9HqJyaESGN+KlEvN23zuUz2CP+EI9gMn4UQL5tkL6z84zo/3M6QQwtTrNuK7BNJ/ehB9Fdu8dEY6rWcio0BgGmFCTA3yjjMi4dsJbhxEdoDGKjMy4sp5vA+B948a+J7kVrA7UnMgUg1gqYSIbsktp3n09EO96FuHkbvGbfjJluulR2sHFGyWFqn8zkv5SjKom4PIkZGSpuv5DXcbXC2YhINtBF9Rbgfb+mbJiidjg4J0YFOmB6I5lXByeyGv2Nk7mj52uVWFWWYJGPrtUKTWtT533GncfC2YLGW6yxKFR6zOzO8ihj9p2JkGsQkQAIFC5/qLl2kGfzjSPWjF5UZvWjVxMAVBY5XDkwzb3/USqpz1l6HTQFU7LKa6WIyIZekXOcpW1pUz9HI91gAjcVipf1+Ad594lZpd71fS6NUeBfhbUtvoV7rMRa2qrZq5tWdywjA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(34020700016)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004)(6133799003)(22082099003)(16102099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	to0LoPd+j5blNHnFcqh1xC5mXztLEu1Tmr0K2Y8eTvaJtZsdUaIQmVE35S4tL2meeMS3cm5GQhe0+T4KgkmTKjWWG7hKODFN8JhbDNW6tYX/Lx4bmzGWAP1TlDAqdUJnmPBoDasLoeKhIRxBC+lA/w3vUHAq6MiuhQwIuv3KyQQLAwcDfVr1fSg2t4BWFi9oBujvgOJhfULmHsUVycw/ZkyPyyK3nPMEWkCnoAY9Scmzq9sokDu7YUXJkB5+k2gicjsvZiLH5SM5cnYxjnfgDfifFg01ZgSAbwesJMK9rG0DtBjyNib9vZ5cY2ymjxa+9bHXXBakAoorySJDrFk9NH3vRDmQGq1IANWYwU43Fj0Lg2OEpILKv6DyYN861sdtdyeJ+a/bOJbuuC4+QYNdTLRZxiKEtNg+K8/r5qtwBO4XTvtiAcZvzP7PgrRe55YM
X-Exchange-RoutingPolicyChecked:
	MgauSXrFJB4/1GHlssXavTV4lsS2ogGVPfeO+6hUpvyFREnxstx43+0pxAs8RvGB48xDeqE+vAijhNFyDEXP7x9jEWmV/KD0wMmwKk1+p/jGSZsA5OJZC4hYA10eRiUYmxH2W0qgaeUpxP4DBMvx1x7zZS543dL7t63cAqpURvPz37HtLdqOg4auUTXeHxpWq2fEnHWnJR2w95XFTSue9wbFbY1A0h4V3O7uIiqWkUV6fVYRJMYICNVwglihR5KVLLuO/XSOcoeVDDp8yk6DDT1WX3UGRP7jlRLLDvllpVunX+giCOgCC66ZZmN5ITpePcLIDUOjUF6I3ZipKUvWPA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:15:44.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a47b7abf-58f0-423d-5259-08df08fcada0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9212
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyNiBTYWx0ZWRfXxowiAZwclBE2
 TVvSoDn7UzNCTHGjcY6wmG+gW8Ltv1QNYhnVsA4qk/vnt/Esm1IXvTGwl/RWORDNLbKl55EHbum
 RWzKjwpFLfRJAtvN5UcfHBHG8xMQORwiw+LANbwzJeaMh9Y989daxGiMZ4xTamuLO9tw6USs3OI
 3VKzI+htpkGbut03HKUYXOT977KrckWHDZ9mmMwU/xKfmMjNA+On/ANH3sK6Qbdcy+hZF1bD9RK
 CB6OUuM1Fr6Whl6iMCfcMHmAI2I51CtWY6b7KL/7j+kWA0BguY37lnhePdbA1Gx1p7LULjPiTo+
 vqjiyoQ5jXEMsVH4tSLyYijo+vMtq31ZD9a/s4MD8ZE7iTh0M/3dOFuqezCr1hRT9ELrM8GPRlG
 fbMywSoKNkuqN6cQ7cakMKhTW3TL1TklDWRZjRJkWXMvj7qPBOVOHlbh7FOa3FWlcaglkU9P56i
 UB23yoMSj1kWLGEcSbA==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a982f95 cx=c_pps
 a=LTeRg1cpCY6hXZLkbffG2A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=l5JjWFqTjyui8lMPraQA:9 a=CjuIK1q_8ugA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyNiBTYWx0ZWRfX+Ie/ZT+ie7/S
 8bbiiP7zJhirc8vN0oKHNPEkQH+bIqUnipKvIoa+bePO2XBsE7jP7dOY6QhjvrV3K1vZ/NXMl6J
 YLTNfHMPhLdzY4WNgupW79SSHQf1MHY=
X-Proofpoint-ORIG-GUID: fsPS5BruScb1PiTrhJnZN3w9HOZ7aJG3
X-Proofpoint-GUID: fsPS5BruScb1PiTrhJnZN3w9HOZ7aJG3
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 02, 2026 at 01:26:03PM +0100, Srinivas Kandagatla wrote:
> >> +	/*
> >> +	 * Unmute FU42 CH1/CH2 and stage 0 dB volume via the _CN (NEXT) alias
> >> +	 * so all four staged writes activate together on the SCP_COMMIT
> >> +	 * below.  Writes go to the vendor slave regmap because FU42
> >> +	 * addresses are outside the SDCA class regmap's routing.
> >> +	 */
> >> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH1_ADDR,
> >> +			   WCD9378_FU42_MUTE_UNMUTE);
> >> +	if (ret)
> >> +		dev_err(&slave->dev, "FU42 MUTE_CH1: %d\n", ret);
> >> +
> >> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH2_ADDR,
> >> +			   WCD9378_FU42_MUTE_UNMUTE);
> >> +	if (ret)
> >> +		dev_err(&slave->dev, "FU42 MUTE_CH2: %d\n", ret);
> >> +
> >> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_MSB_ADDR,
> >> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> >> +	if (ret)
> >> +		dev_err(&slave->dev, "FU42 CH1_MSB: %d\n", ret);
> >> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_LSB_ADDR,
> >> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> >> +	if (ret)
> >> +		dev_err(&slave->dev, "FU42 CH1_LSB: %d\n", ret);
> >> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_MSB_ADDR,
> >> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> >> +	if (ret)
> >> +		dev_err(&slave->dev, "FU42 CH2_MSB: %d\n", ret);
> >> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_LSB_ADDR,
> >> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> >> +	if (ret)
> >> +		dev_err(&slave->dev, "FU42 CH2_LSB: %d\n", ret);
> > 
> > These should all really be part of the function regmap they are
> > function controls. Also would mean you have the MBQ so you don't
> > need to do two writes per register. I assume, with the commit
> > group stuff, these are writing the next value rather than the
> > current? But nothing here updates the functions regmap for the
> > new values, is it ok that those two get out of sync? Or do we
> > not define these controls at the function level?
> 
> These are now part of the core in v2 which exposes them as proper mixer
> controls.
> 
> These work fine as long as we apply the mixers after the PDE transition.
> Which is not what user is expecting.
> 
> This behavior is because the codec seems to reset some registers to
> default when we transition from PS3->PS0 state, volume, mute and micbias
> are going back to default values, leaving the stream in mute.
> 
> I can try to re-apply them in the codec callback hook, but in general
> how should we handle this in sdca core?

I think mostly how you are approaching it is fine, my concern
really was just the use of the device regmap rather than function
regmap here. The controls are clearly function level controls.

Thanks,
Charles
