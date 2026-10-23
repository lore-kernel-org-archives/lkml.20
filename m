Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748222;
	b=hwMoA2i6r+0zZRw5E1Sb62/8Jhs/jbOA3RzqCD0MttVM4VI1J3WZp4g5G3ijw11svRaP
	 +2M3+9Gxr7KEdykN22Sf8Hg5IdF5dpu1OMwBtyLNLRJUY6G6pqVkqRbi7iWe2BPyWwSOc
	 QHwzKozlvdnQIoFCvA12W0a6qdY4cGgWkKjw2r6duakJdXL81FDXa5uUsQx+HGaopx5U+
	 vpsoH0oxdbg9mn+SPSyLmnqbZ32oWbEpldRbK2KXWPBseG9JNC+OsqByH8RSqeox50dnx
	 upmPjkp/Wu3zJ1p+vx8EINdfZwKovQA4B8TACHNL5D4mCdd4nkKjEB5nAKoHUS+Z2Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=GzIRLkyEzbY9ycLQTv1GdfRHJyYQGlDbZjX7pB7yuCQ=;
	b=fvvw3FVAgxm5L5sr7IXvlwxXb5vRCgGNHuEBPEaBnV9NMPND9HUrAtE2GzOj3pI4TKS7
	 KjbdHjGrDDroAjFOR6Z4QU9p6cY4POVI0H7ciRG1XqYp9XMgwuRke4ZpuP+IG0lla1lrC
	 2Mc4y7Zxb9WUajjvTEFTVsoYVZg6NYOSO8PZiZMLUwFK+co0OkagA7iYrQKewG2KKAEtA
	 YTQqswM2TIQAguMqxehRFX8Yk7Dx0fgKHP4jpKQifp5ovydJbeS0Ac62crYczqa9SsXTq
	 Y+p2K3b2d3GVl+a/RgYcItwFr86aVuMboZsw6MZ0gMoCiiNFYDSV9FEfc0fP2BqY5fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hDhuSSC3;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=G745UoF1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5291606A31A;
	Fri, 23 Oct 2026 09:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5291606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hDhuSSC3;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=G745UoF1
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N4kith2791323;
	Fri, 23 Oct 2026 04:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GzIRLkyEzbY9ycLQTv
	1GdfRHJyYQGlDbZjX7pB7yuCQ=; b=hDhuSSC3bTBfLrMnbrpOOzK0+L6eTxvwDi
	98H8rFNJbuG34mRyoiVDh5oclgdzcCoxjWQW10mIG+sWKcyuJnwq8D84uualD+dk
	wY7SE8HjNrQDx2icxv6nHbJBDpA4GFXNwFfgKTb6F+VC2Aq8zKKM8WUo1pjPU4lF
	STPYpZiUQ30bjk/BbxbsQUmeuKEK/0ResH5l6uFQjiq60A5EB4l0cl063t99Vsji
	ZGeQhYatWqDXvRaxDKjOjuLPJEBl1q/CUCs1MljFEkaTgFUhbwi1GpH2MdefE+6+
	DqsQHEWg3qY0AXfeYPhIk7OgGq5DvannX1wpZxDBAuaZLbRMMAQw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023133.outbound.protection.outlook.com [40.93.196.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hf97n9ydx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 04:36:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGMckPzgryrV+iJzDF2Pw1FbIaHrNOK6hIoxA1R3A0Ipt7QjkcT5pGjcVbCuR2bLY4lDrF8B7DWWRMBdZIMPVf7vw7iYpJirhOrtiNdK5Iq9eUY7cVzWmMCrnu0mWoY/8mWS7C2jNborxl6KHp71VVlfHzO6O6Tm/7fe2xo2CkHtxTA5tLu3SmqS23QJiZwi6u2G3oI7NB7XbUBHhEdcxqqgDpL0j01ktJdadReMHjCsveL3MBHL1s7nHFlh/UNFJgVI+hDxYCm7NwFY7f0g4O/TEOCg4ctxOzr1gNHVafSjug+2VEpnireWv89XlXmQFJV9Y5J5hOum6uumwdKT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzIRLkyEzbY9ycLQTv1GdfRHJyYQGlDbZjX7pB7yuCQ=;
 b=eIViPoxwrHCy8cmVFlfWFODZNpfNGgVsHIE8cuYmBRJT6w22tIpf5LIP5Hp8mJc/CYoyPpsD3hGUxv/8Xqdxv71vpTmw82XQUH8TE8YrAQQ0VL9vp+HuJSGPnGRYTAAW5UhT7kKfjN+9E3Pcxmsj3ZOEzE0M3pYYQRCPuWReghqVEOiHvRm2KC+zRWupKJPgAL+BbMnUma4EqGUAN8eIbcsI6dQ9bdw8M5D48HAMdO2xWRNcI0BSCUWtCFQK83FthM7xOZp3Ehi2h3+jugZu+dou0wrVXnM0dLqyzFK5Og3aubdEYnYfBY/yNaB3ughMMuFkibpyBS1Y0YjYDtGk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzIRLkyEzbY9ycLQTv1GdfRHJyYQGlDbZjX7pB7yuCQ=;
 b=G745UoF1RcHAMWFjqKsCUH4uBT/5GY5rwzjl/cze5ieiQzm9Ge/vmYbqkNsbtBEGi/WlTQBbmLsemIbEmxdCCvnLexKCmsl9GS4B5uAYoUTQRdELERNVc0Lh3V/QQ5STjeRD8R3jW8+QgXpWz0zPCy1lrvE1HqsXSud5+bwv6JM=
Received: from MW3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:303:2b::9)
 by CY5PR19MB6148.namprd19.prod.outlook.com (2603:10b6:930:2c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 23 Oct
 2026 09:34:57 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::53) by MW3PR05CA0004.outlook.office365.com
 (2603:10b6:303:2b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4 via Frontend Transport; Fri, 23
 Oct 2026 09:34:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Fri, 23 Oct 2026 09:34:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6BEF6406540;
	Fri, 23 Oct 2026 09:34:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 55DE382024C;
	Fri, 23 Oct 2026 09:34:55 +0000 (UTC)
Date: Fri, 23 Oct 2026 10:34:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: David Rhodes <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wentao Liang <vulab@iscas.ac.cn>, HyeongJun An <sammiee5311@gmail.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: codec: cs4341: Handle hw_params return value
Message-ID: <atsqPon16ficpEtR@opensource.cirrus.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
 <20261023090157.518032-2-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023090157.518032-2-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|CY5PR19MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a09ed3-3447-4606-b52b-08df30e8e6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|23010399003|61400799027|261009223027099003|11063799006|4143699003|10067099003|261022105027099003|261022075727099003|16102099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	EmV1SlqfyYCKPQ87JLwuqpe3upjPxXDfPspwQD3GYuyMa9Wh0PGpva5az8V9ETl6Z73eMCbjS75mAstG9p6fRs7fqpu7Umgrt06bz1H/3eeTWppFIjq+/IkbmXemh7PNsGL8aw65Y3cQnv41+4Kjl4ZVhqpsuote/nnxto9bw/wmkAqMFvWbGx81TfqF6Yt1YWeElJVXZY81Vj0YnxfQ9bRRb0veCoLHjPuf1OO2W2z4zXTDysUkhrCY/8AnsgVOkoUkCkEOqsrj07oiEoi+wjBO6snWPoNmr/FhQODr7/TzRXaPOKWzDg7DcYk7c7fphmzita/pbTR31GUgHo0UcUXLq1T09KcvENTvY9vNYSscZl5aMZTW8sLUA+xSb29XV4t9+didrClb/uC9VZ5Q/79jGf+bYyi6G9n1x5R9bYJiHAP8BStA5FZl5isXXpRX4orDezWXFAAuqWVSRJJCKHsajsyeHrmcP0Fl/ScX2TrNqf/PyQmc3csRciV/GnlQDHN0bgMIcPb9QGK2Y3OC4R6JsXO0r9FRPxRgqHVmfztDA8VhHV0RKfMyoEdTBypEXBU0Gy5PGrFj1KyW54I9jWu5BaE8Ka3A9EbVV4I53ctMReAvSrR9EeZjl5OGpe70mAs5MJ8fF+Jz+agDFLtUVDBwBods1XawPb9VGhKFl6T9zuFldb5AJq7TfVZop7y8F1L6qHACU1fnbvjJzVLsiw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(23010399003)(61400799027)(261009223027099003)(11063799006)(4143699003)(10067099003)(261022105027099003)(261022075727099003)(16102099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xU5vTnXurB8ZvahhVSVcnchfEqMl8nZmB6tKAe/LJ5DEElTZgMHQArfNT/ZyRJjfouP7+QU9VFYmrQNjMeO+0ojEf0oj+vea3P3aIvW6SYGlZuvP1AvaBQRRx0fq22NOaggEff0BKGidsSf+NwJ4hOqO9lw/yNo11ItU3vg0CxkAAWPOy/lmvOnXTZKDWRZHA9u0lLqRscyemq7Do99MrmqWiR+qlWewTcfk5hQZltUszoK4/OK33OYlRm2kxntMsK63TZ0UlVgQJw0zxOCunt7AtMSvGSp9QKxNggt52OvtDMzDH/0HscObJwvyast7JxLr0RAndimzGgwgAWejMB6QdGaefgWfyTDv0uMTn4SEF7cePpHXRoA9ivjoCnbYSF2f06rdCwvORgiP7V56UVi1eDa57Q4phuu2/qNtQaUmlWUyldjpB749lnLa1dma
X-Exchange-RoutingPolicyChecked:
	i0fVePPyi+yS/q7BKNxW6BdDE7b8Awz5SOfbn7E3rDloA5EFsL1aLj8EvLbEMO3cs5xq2iElMlkPnEQ0/uALym6HMBB/dTQ7X7I6gkz0W4hu9l41nOlxDJTjY+J2Nu4mhSO2pT09WLSe67ZmBlwRCZx/TScC7OvKTlZxHBmWZn53OgrMHNg8J1C22oY5EItI+fU6zP6YhwJxtH5Y0BXZfTKSnFV6EyBVzwo5q/l7Y+7gM0LRno1hlQcvP3rLvIfvxfYwLsjMX3VdhtV/lknV7XOUO179QajHfF3cfRM/vfW/rxyKru8LjFlyS75XoLLTKBKR96lyPuHSvCeXEet6lA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:34:56.8235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a09ed3-3447-4606-b52b-08df30e8e6b9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNyBTYWx0ZWRfX15EsW9J4qPr8
 v5BfFuZJaOoCbJF5J8VZSK1R9LyZtJA5MUkcs3X4eKycI7xxvYCtbPwCN+gh3QsWj5mCc943rM7
 1nnQX9sEw2S/LXw89HwLhGnS3aDzQP8UD09597DshMdzrtECvVXvpAi98yTV8wLqz7VWS5MNaoP
 u5AsAVB3eJ6Q8kfGg2RtjFJmtaQwybNzj9CUoAPubfv5aYJj6T4kOBZ7SIomGX7EmEJVjxJ5tOR
 MA+kzh1KyUufgRmngkz8bDovODBOvQhEnjh5jbOtEVI3fgPhzpTTeM9Nn04x44aPMkVfcAqX3xy
 /bPjf1LlgQGRe05rbg/hSg4uXDTRJwLBXJBSdNk9pFnwliDj45M/80bioExVp99OHok6GZPYlm7
 +YBBus8wGQhFtvtQEiRDfIlICLLit53vXuSLg9g79ruxM7yo1TYH8iQxyfEwdm8niwevczj6UU+
 N3Yd/xbq8R/Io2rfvjg==
X-Proofpoint-ORIG-GUID: u7FI-6ebrQsnjLEdKkZuCegZShgFy_3l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNyBTYWx0ZWRfXyfvODhXekQCF
 QsFJ62fFMdBd7384lPapsd6lLpflnSn6v22XwUQ8ByXzURMjlG8xohqu83sC7VTWc4vrkyEan1a
 K7tk74bnpoNR8GaHACqDdTHSTkp9siE=
X-Authority-Analysis: v=2.4 cv=e5GT2qp/ c=1 sm=1 tr=0 ts=6adb2a9f cx=c_pps
 a=pt7H9/Fs7R05i13VUf3btA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=d9MVKBpCiFKrY5ZsQbcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: u7FI-6ebrQsnjLEdKkZuCegZShgFy_3l
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 23, 2026 at 04:01:54PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_soc_component_update_bits() may return 1 when the register value
> changes, but ASoC only marks the DAI hw_params as done when .hw_params()
> returns 0.
> 
> Propagate negative errors and return 0 on success.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
