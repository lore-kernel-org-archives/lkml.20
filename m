Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792725789;
	b=hZF7XIYJ7lqk0S1+KCNlwWCzirAKB+vjlw6q1AsUE6KWzNUtzNHulfN8O44kVF1SJgEO
	 5JEkLxBaHoDBKcTDUpCe2+zN/8iOY9rydo9mhTcTNEv6gXBkZaEp/yrGjd0hju+GZBwJe
	 PvzSu+NnZSyEW6eTC4B/vuvl5zK5vPspd2f48R9iokuJWGfK12fBkEHv84FzTQdEu07Zu
	 5Nd020W588LH4U7utwfENnx9baGbbltS2+SfovUsIEg48u59TebZnQSutYnXVVW1/IoXr
	 xzShmkHBvISTGfRKg6OLA5x13d8iaijUaqLp94oIVmHNVZ1B984pIwzxmnPv5LSxBzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725789;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HJjD8C0pA4kO19qQzObjadZdZd5ZIr7MUkYHha4SuIw=;
	b=Gfw4KKvzALU2OQlUzLMn/Mik9GwDXy+OOWRFcOf9Xaj+rbIXF5PQqH9UOn3F7B5MhIRv
	 ciEGL0Sc7Ztzj9D4OGNhzd5hLKYb5ggDFWtpDppyG4oZw9+qeDMdYzmclulSOgJSTxPZQ
	 fugP5bOmExwMN3TbL3NcWeGhgvMW1Ae1/1+3KeCg7Gwh4ofxgPaUWpLJAPE9wafltpE2k
	 3dKFGpniSnrDNdEpvWTb/nkp+DBl4myBhI4/mzFs4QMlIXlx0pc/i1AX4Nzk71IRkh+pk
	 6/S1E0Eu54ixbXXYylXjHcl7UeBqHorkGu+nV3pnQamAaFH3ydxVe/BLen9kH6r9Vjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tMbpgsZA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.17
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF0B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tMbpgsZA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iV8PUO2NOlcOHNxeR0fHfI9zGoGnrNtyK3y3nBvxbkyjYE2Da4wg+P72hQZ4SByFbkrROUGPzZWg4W51PXRdBDjM9eAvNLQglsLDyrFsgVQBBFFM/CoBwb3x4a6/hbGpsvYkmzvafAz7WFQ4HXHOdiZIATnTL3bz2iKPZ6ViBB/N66+rzmbJ80x4uQEMj/JJuCnhXZZYT+4Nk7d7ilE61X2cCaYEC+VVIbBgCJGMuLMZ+MsqTmkJh+UFRk6U1cOqZqCSRn2hjMU+WiAn7rNJCg/FSh4bIwAelUnjK4yBQNDYrsvgX8ezW9A+3c57t2v/a5pEgnwRoEha4Gwz5VV7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJjD8C0pA4kO19qQzObjadZdZd5ZIr7MUkYHha4SuIw=;
 b=BBBfUg9yYzv+PKV62iL/UpeR0Ri0sGxyC7n47qAzo+qV4TK7oxTvjK5VLrngIJtTPlvGlw5lOdtr0s/Z6GMrlmd2xjSRBGLTA5lFF0bVvsf7SVZNyZUGZOHleqUrV3RPvibWbkzH82RLNfVjZidrTheOFIyLZkQ+8bVGERxn9thyuRGCrNGBuhLC0qjPnBmHoLssOLk2HxpGK8yNC/t6K1pSrs88hRrMKOJDW/uwaymAJE8tuKWfRhbYi/131yTW8mna0Vi8O0htpEWWR7bobKAmzRBVKlpigC4w5irckOKmV2kmDqpuDzlh5Tc4xV0o++j4Y9UkXYZBsGJLZM+EGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJjD8C0pA4kO19qQzObjadZdZd5ZIr7MUkYHha4SuIw=;
 b=tMbpgsZAExuDEMrj/zX14OwvrhMpouADttJdt5pc2Ae8rJotbMHbr/Ji0RI6TXMACd8uW2Dh42BCPhLrt+ynzVsPEG4SNmr+488wfiT6Wt10wMtKPv+0S3P8QvHUaWh9IE8pInINBkRMJqk8mwKEDhJ8xvhdNrh+5FcLw+Bbwkw=
Received: from PH8P220CA0040.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::15)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 03:23:03 +0000
Received: from PH1PEPF00062F26.namprd02.prod.outlook.com
 (2603:10b6:510:2d9:cafe::34) by PH8P220CA0040.outlook.office365.com
 (2603:10b6:510:2d9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 03:23:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F26.mail.protection.outlook.com (10.167.243.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 23 Oct 2026 03:23:02 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 22:23:02 -0500
Received: from [10.85.46.93] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 22 Oct 2026 22:22:59 -0500
Message-ID: <9d1381a4-6f4f-48aa-b76f-fad11e9d5bc9@amd.com>
Date: Fri, 23 Oct 2026 08:52:58 +0530
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
Subject: Re: [PATCH v2] sched/pelt: Fix truncation of the PELT period count
To: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Kayra Cizmeci
	<kayracizmeci@gmail.com>, <linux-kernel@vger.kernel.org>
References: <20261023025207.2967903-1-sh_def@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261023025207.2967903-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F26:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: c3237247-1acb-4a50-dd7c-08df30b4f268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|261021121427099003|56012099006|261009223027099003|11063799006|10067099003|22082099003|261021123027099003|18002099003|6133799003|13003099007|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	EAB8U1KGseD8zHDjqMWy7GtASFYmwVYpdI6BmxWtrIBg2ncCbyXFRJ6eSDFTvt4RtjmsdGxsX+3JnKDjcbp5fhsQNB+C4I8RszIlvZXzA7XVSFlVnibQp6HCAa//GLKPFFrQGFFZrJPJxVVe029tlAt1Ehd7MO1xRItus9awPOUQH1eIQYyTD31OcAaZMaWZ3Eo6xEoSPI3yLxxWOidNYLbbLhT3YWBrrJdAnraXStsuaXoC4RJZv7rPwxKq9ga2ytW02dP5gvdrcxHFFQeayDKmvxOfNvvynyOdKN5+cRk5P4jAG756rSXS67TL/jv3ChGFYPIa/amljr2pgRV7pZQWZsKb67+p4gWTA7qyzqrWwN54I9bJIM8DWjynn7lDhgaNV9k/f0kduRvK0A2s1OizqsEpfafW39+6GWp3p6R8tEKNt3wr9TOgkemz0qwJpf5Wfm/Or/ljY393kT5iyKY/9T5snhGlckJibzA0752Uc4CnbFAxQ/nVApKgUJCu3DxsDBjlFh7QN/PO+IemGSSUXZ0HlA8AM3BtR0mJZopb9YPgQiA+coiFnnyIuFsoBhHr0p2fTArmIhwf5ZB7iNK/DpRCGwwGt5aPY3q4wWkIFc/zXeviN7v+bl97y2iVXUGbuxlsr1tAGdq0iAuiaPxbh/QHDKuy+gPbBwg50rg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(261021121427099003)(56012099006)(261009223027099003)(11063799006)(10067099003)(22082099003)(261021123027099003)(18002099003)(6133799003)(13003099007)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LZ+JpnA5o7IwFF2WORP7Tb61oJ4Qvx0xPhsfYvqV4h52Vb3nI69YsW2LBPnLHYx5zicafnyZ6OY9SLX9DyNh2dSRP1FZb1fN/uWMyiec52rN9uFgAc6xbrYG+qVCFiTnoo69izIBtvIV3RzfUVZxFfUBkMOff4Fiq+F/LMtmUkyx0N5CeWi9DOA4ADZaS/KJt8qLOKe2IHIohdL5I4d6iazerpj6tiNknyXkrx1zqjX/WnaPHevmmIf4UU2OgCGG+fIzS1yMHhU2u1sKeOiY+BwWt4CRfzRuJnJzH9ljV8GnUq8IpnPXjImhh3gI2CM7Odv/9QnIPGuupJjJLwnz6JudUb67sGEqGKo2pd2qNxS0wDCmaXxXnHsn7PZyzwu1887dhRTp9k7Gc1nh1VttZtrxFXrM6dr4Yq9PuCSd+zhFk/tqRv/4Yjn8WUCZSPTy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 03:23:02.8021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3237247-1acb-4a50-dd7c-08df30b4f268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F26.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

Hello Hui,

On 10/23/2026 8:22 AM, Hui Su wrote:
> accumulate_sum() computes the number of elapsed PELT periods in a
> u64 but returns u32. When the count is a multiple of 2^32, it is
> truncated to zero even though the PELT sums have been updated.
> 
> The caller interprets zero as no period boundary crossed and skips
> recomputing the averages, leaving *_avg stale relative to *_sum.
> 
> Return the period count as u64 so the caller can test it without
> truncation.
> 
> Fixes: a481db34b9be ("sched/fair: Optimize ___update_sched_avg()")
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Signed-off-by: Hui Su <sh_def@163.com>

Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>

> ---
> Changes in v2:
> - Return the PELT period count as u64.
> - Add the Fixes tag and Kayra Cizmeci's Reviewed-by.
> 
> v1: https://lore.kernel.org/lkml/20261022034930.225042-1-sh_def@163.com/
> 
>  kernel/sched/pelt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 779eb58a4261..d10d57b6b8ec 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -99,7 +99,7 @@ static u32 __accumulate_pelt_segments(u64 periods, u32 d1, u32 d3)
>   *      d1 y^p + 1024 \Sum y^n + d3 y^0		(Step 2)
>   *                     n=1
>   */
> -static __always_inline u32
> +static __always_inline u64
>  accumulate_sum(u64 delta, struct sched_avg *sa,
>  	       unsigned long load, unsigned long runnable, int running)
>  {
> 
> base-commit: a804c5742bff224d4cb4d25dd383554d598be32b

-- 
Thanks and Regards,
Prateek

