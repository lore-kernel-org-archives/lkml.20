Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A8478E39;
	Thu, 10 Sep 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040726; cv=fail; b=tZL5cDJBEwcqmsCcyPnTRWurr9zGyp0psZTrL9UrjDj9XqS2PF6pRhy+GS6/ZZW188xSBerWcuwxrsaXz7dtLPBq1GthzVzRn4sU1d847g0P9PPIg8Sfj0K69iImlJwY5iQLQXvZ3ajwJdfK2puddGjS3uP0t2JJmgzz8RktGhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040726; c=relaxed/simple;
	bh=BRrnixfA0E9bDGsB/cS73GRRL2K332EMUgeep8yoLYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T51Rf/QfCG4Rl4MEnxRHToqI/YXtCMlwMffSVrlOW9KJYexzOqICdU4NSLEUEh7ReFmcLBylPWkrNNxXDESEshkhsrDWHLVprLtBY2pPvci7NI8sVEw9zJBXlVF1Ke/jYJG207xPXFZIQHh3rSp2MOxX7RcC9mv9KYOE+nTm18o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cjVewWUu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rgKe1Dpi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cjVewWUu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rgKe1Dpi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IggaR3050653;
	Thu, 10 Sep 2026 06:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XwlrEwxsucUF2KNqB3ACYSCcpSzRRvt8BS08D1njyP8=; b=
	cjVewWUuqgMXLu0s7VqMexaYXoTrX3lQpcXBKI1Zs9ZeEgW5ReuQOc+hyXh+uEzk
	KyGsDipWLxAJslbEyLS3YjMHKs3KmeCKGYqEc3aYNSSJ6K8AxP+fDD35ZG638enC
	WdjcfIsG6Kc6E5oAvMzYtkgk7oCRKdtuvqw7K8vLzSlUFgmPLzVc88b5WDoFvEq3
	FRJBxB720JKCSZfaSpUhY0tFvGcYcDYT09zPt5cZWy/xf5VdJ5EHr6lW/NjICQhH
	2q6u6VbEQCzcVjE7rVgDJF+F1aQtjhOY50Gnr/XFe8eGiPA3QByDIZOFPg4Ce29Y
	Y5P/CHmmuhf4yP/LHk9pNg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022083.outbound.protection.outlook.com [52.101.43.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyp92fw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 06:45:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVI1U4BC175+bzZCc3qaKLmLsB7PVWfeoKyiDFjtANu+cmlGqcjFlXksBrbUT8B8MX/LCTEkkJ9UpwXJnUwWZYximnHNSz/O5j/8fGtOkvFGNGl5ztI4ke9OwguVMQAUlvAR90xw4Qxb+q+MAY8+jibF8zqWwclXLQi9Wftcn43hssJorxQfpr1XS09ClLxShlk3ddmfO94/Rqhi6AztNMZtwkNP9+UlIJNtRUt5d6O8jN1ruUCZFPfiUscBMrLKh06CYb3mlEk2F5O7yZ5k2DJWJ6MeeLvNBxbqAfhxzWq+FHzLtJKRcs0P2jeKQ+Z78BxoYBV5fGzh+uvdnRXCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwlrEwxsucUF2KNqB3ACYSCcpSzRRvt8BS08D1njyP8=;
 b=KOoPxWl0CJ5FvNyzascAo8iwrdZLveIk8u6Q7RHsIa97n6DEifalBzRZVA2r+BuumDjlwkFZdHZ3/w0+NHmbMYQpNf2ZHIRAS0jYRe1WINkxpZMU6mR/MneloSfFTCpXWSWpAhnH/6BlAb2nWnhDPghpDBpAbvWBmCk5XQN46Yyd6LYpfEul2H+0BF/DUzmmtBgkzlwCqUXnfBLoW9zZdr+SqRBmfvXBEJ0FlTOjV/mG2ksopLg/f/NqSq0tedvS3typIM9PbKxMllWqDZqkkkn9Fk5fKgWN9PDsf2Me37mIX04qq249AIAyTPVl3OG3swuiITjZ5nBUrmel7ZPO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwlrEwxsucUF2KNqB3ACYSCcpSzRRvt8BS08D1njyP8=;
 b=rgKe1DpioK8BS5DE0uqqYknZeegMQsR4KvjfT949aVMBZd5W7+vWmPBQTT0GxTcgCdjDeIlLIzXj3f9uasDEPtSqnqdEwF9Ddk+bOQiawqUyPebir+0ekArrYKLXQXF3l+n7g2XAlPvRj/zsWUYPkO+a+uuCarF3QlIQWS+EYGc=
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by SJ0PR19MB4827.namprd19.prod.outlook.com (2603:10b6:a03:2cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:45:03 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::42) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 11:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 11:45:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4D4C9406560;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2DB17822564;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/5] ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
Date: Thu, 10 Sep 2026 12:44:57 +0100
Message-ID: <20260910114500.1586637-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910114500.1586637-1-rf@opensource.cirrus.com>
References: <20260910114500.1586637-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|SJ0PR19MB4827:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 39c06387-08d8-44d6-9475-08df0f30f3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|61400799027|36860700016|10067099003|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ETfubdhSn1ELCtPuVbKdoNfsE8BTZlXLR7iW7mSK6fR/+Y5gmztmkNJk8W9kH1+WzV28QHIX80gqbZDHkIR0gfxV4ilYnriyIqek9tVI5tvmDazBysn/Y58ogNtwfSwLqTH401FMfqX/LD56VyBtW++Zi3d15DDXBySHU1WfMV863AiL3b2EszHqRgPEUQEx6QiHucuCXttIsXpgo2aFpakJ95MHetqVFuIN/tCD/qGvlrWw3i8z8ta21CHxuJ4Y4jfMLaJJMc3R7eRYv1l0DxivR7LYIsYT9nm4pLj+oXUrEfJHS4BYhHkqfwPLvfYjpRe2ibV7kD/L4uln1MKWHQm8PGzdZvx0uK4f+urdVAhadkpC6CvFVXHWQuZwzMQIosfPkBo5s7DeSIvB/f6EYAgaVNkGjvvfdwYODKjxNToLgS96nR13ssCqdVKwy67ck26v8OuXh1+RTzAnG3bvCrcr1jC635c/f57H+Slw3ilUBuylE0iGCEwD0Dr0xPSXMd3ajbq8furCfklsS5Wjg55nJUfhNO8fB21Hksj5iN1e4WWFtgirRkju5z964tJzWGJ5uZlKHHVVD3YeQVkXZgvf29CU8tVvAby8Ji+t+rB8qCiu/HXpOJL6ydsnwaQAqaHmbkYlB8BmZ7FD+pmP9zNRSHzRmZeI9UYpaZpVuwzlkzRE/1aYq60SGPhZuC428zGRCEI9Tzk/1N60fib1zw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(61400799027)(36860700016)(10067099003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	czc2vNl/t6QwkzfmD64M+oYWg9cn/uVJHGQrZUvHs9aqx1ebnsqJxUCVE2vzgNXeuF9z6iLGDrDSqFnwdewpWO35THgiEqAXwm3obiDKT+b3VKT2qBb5PPUhwMEaNEDb/UhGWj+pT7WwgcCNLhIs14GPEZV1b1RbKy+OcR3pYt+kR+jADoi3RVIbnJ2UaUSZU3Xk+RhWhY/AXTGacNi7icUmKx5O5RrKF+GvXip0Am0uWZW+ENanzsphLkNu7UG+X3lB4z8jk7DJT8Tj+3eEQMV77bw8gdlW9GqeSvO9IPOYOxOT0Ec+209AvA0qIUnHC3gqT89PEJRXR3sXcetnEvIC7NhAVCLtUsdaa/u27LN7iVfgDGhod/PuiGaq4CJPX6HTvvwMiL4FHEvMJ7bSNy8DspLIvePRgKDJj9NxTMXPrqGG4gJDfRxQQr7G9KBx
X-Exchange-RoutingPolicyChecked:
	KEVCT8r2BpO5Az6i8L5P7WNKdJFSvETeKlgDMvLfugKjujatJIl6BXuj5jQoOARzzHBc32LrTYX0KoUEfe5tAqh2E87eF3Vgil6Zc+VIFVUoHMluWbk1hkg+RIjoQ71LHPq0rLTiyw2Lyq70eg8lOq/f/vkAhVh/koPPW3bLF2PGC1i8Cm6bt8J2rKiXiu8HCheZWon+Kf2+tkg2SudJHuERCB7M0fT1Vv8iZCKWieBGYrNhPWM/kO17oY4iJX7W7WJnosakbQQrXWcfyweT2BonWj3mWOPWZAmIARlpq3HDVq8if5pAkFYX/ta5ZGM7GvjrnISi/7bnLMWnD0HQsw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:45:03.1610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c06387-08d8-44d6-9475-08df0f30f3e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4827
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa29844 cx=c_pps
 a=z4sgpIVFmn7gf/JJ24wZvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=yrhuzdObe6TiVxlqwUMA:9
X-Proofpoint-ORIG-GUID: 5OzFslrU_MBgnIjuFfSOfBuKPG7em6qk
X-Proofpoint-GUID: 5OzFslrU_MBgnIjuFfSOfBuKPG7em6qk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX8L3Mcn/JzU7l
 lXp/xQwaPuyjTatDpSgcZThj54IJVvcLFHe8YMNkM0l306UJA/2z3+9wLwr+oFcvGWffJAtWj1I
 RIms0i0P7gc39F4UnDrSqvHlsLE2JqRRKKEgFFrQ3u4mszP7eBFJuCsEup13/2yhct0kKSjtKhB
 b54Ar7Wz8rO0RKeTLfmYrFYt1hlpwpdjwxRob7Twqhn2vDA3HAjI3I57KZIg+kM1iFyET1gA59Y
 474SB+JSeQWvbc5/F+hHUhoMhRwYYkxJi7LSFwOUZUVROYYb9es5CXbFdW5do9ThsPJIpow1xxJ
 q+ifxSk0M7fem0Bbhg8xFbZALK0BUkZRdIufSXNdH2sM8/YWIFYIFk+UEYAwhaVzVTP2tn3aVAe
 o3MxS7kBZCaez5NRROrOXWjoMcYjQBSBcUkgvkx7nFCzpWRbbTboxakASDxU8UtVmTQlaP/tBK6
 l3i1/nqBb0OpN+PWUkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX7bxxVJmu/boV
 alzb0VGJKsPNXbqQfDL4bvbDu5Fdb06Tzs4d+B8RMxEid5bHNReCnqkopweJU9gjwOD5rZEJwfe
 Kc7I7vqmNBeg+BJvttdBVMraAuWZZMY=
X-Proofpoint-Spam-Reason: safe

Add a codec_ch_mask member to snd_soc_dai_link_ch_map.

The CPU and codec channel masks are not necessarily the same, and are
quite likely different. SoundWire and I2S/TDM both support assigning
different sample slots to each codec, so for example channel 0 on each
codec could map to different channels at the CPU.

It is also possible for one TX channel to map to multiple RX channels.
So it isn't _always_ safe to assume that the total number of set bits
in the CPU ch_mask is the same as the total number of enabled channels
on the codec.

For example consider this mapping on a capture stream:

CPU0 CODEC0 cpu_ch_mask = 0x03
CPU1 CODEC0 cpu_ch_mask = 0x03

This could be either four TX channels on the codec split across two
receiving CPUs, or two TX channels on the codec duplicated to two CPUs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 94c9b75e27e3..5afc34b147b5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -700,6 +700,7 @@ struct snd_soc_dai_link_ch_map {
 	unsigned int cpu;
 	unsigned int codec;
 	unsigned int cpu_ch_mask;
+	unsigned int codec_ch_mask;
 };
 
 struct snd_soc_dai_link {
-- 
2.47.3

