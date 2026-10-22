Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658109;
	b=0eT5aXd3YiF/DS7hAtLAUNXRpEtXzZWm1TPCoBSIHKhT2MqKBr528s8lH71RvsEFL8k1
	 08gGe4dGeUWvXuR2eYUm8t+e7yf8sde1HvhFHtl7q3wVWPnszJTbbMQvSr3uxms0g6Qbk
	 14dIesYaJyAws0mRpZ7u4X4uN+rf9UZvvUZtMDQqI0jRd3z3Tuof1OScfzJLXTAp2s4R7
	 yCh0NMogn8Uv2oNb/nP27Io3rhD+TeWDRHJ+WccdKs1Yy5Ius29pWyTe2HnNqWwaJ5CGX
	 oreseN8dTlA2nfaEVglbH8sm5qvfBhwu56C2tqCsfsldpOECDdWn6oGYGlStELyQOow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658109;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=+TUKW3ckBsFPoW0fljSNh3uqtuvKw6AfyULXa68JIaY=;
	b=moNuk589QcJvi+STgdz8eOcZRJk1UXXCc8WvAYjmb8smEjJDnKkwr9xugvlcfF4r7D4M
	 BzfkyXqzyBPuuSn7vWNSAF7Yj994QfwnwdMotg7xp5Nw9lG1QS+3KEQa7biFqEIr28Yav
	 gCsgJGofX6yqML/peZEeTNwtuE2hbooW+2vxhdSMLO82g+WbFF/5a37PJghVwHft7nhTE
	 XMEJrQW0lkQaTBfOUef4qv4bL4/RyXnWZ6yEbYG5wuThcSIKjaccvjEbxXL8YrR1O6tRf
	 MKpE+5tIl6+G5wXdhQ8/KHId1+mVvMxYS9yOg/YWQrZEHdZUO4os1/vFQ4hQJ1Oyx/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s+zUD8BM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.15
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A8606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5A8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s+zUD8BM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlEyvVon0bB0hxiSXHoMl65PwyyVA5WjOgi/KRp2a/qZ+uAC5SjErkz6fwJUu9KoAG5IFcDSqLN7BX5YgUPMDmDKuGCcsuOpI/aLbja4ZmnFFKr5qLSmvJQAjNDh0UhalWFE6RT9pTbCV0Ia6Mdh1S0W1bqaXY4pnTBCgxYQzDuLscVPoc/xyV/wGhNReOHFG0Y9swysPCEwFVHkEJIFEEpcuewQF8qG32Vagid9dIohIZBk22+8SZQF4dG4N8LGNRopYGZMUvvS2mGLr1whtEpxGuIHU3xEgWGZLSCHXcBrmMufCTDheD6iS5YZ0wmttV8QKRDvhNj3994c0fRctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TUKW3ckBsFPoW0fljSNh3uqtuvKw6AfyULXa68JIaY=;
 b=fOjIyTixR9lgNajLAdKSl3j75rlq9K10dWpwCuzVxCIlMsZE5pZGQ5GgOsA1dEG596J0PTodU6Y3PWP/yZjIIi6jvb+vnMwsnzbgYA3dzv5G/NR3s8jaLJb8/PTTJaW9+0/v7/1NhJth8r96jFGOGfIg8lnwxDmKTx2Pnm+saWTrJBsntWdn5ekfzJS5cRPqvoBP06odpbbZumXYa8cA69tBrvzYr66ZpGrSTc7dG0v6y64UzZKHvskWVL3garcCJ0hc4+Wiq8cIkhFwfEUyHsC1IKgymZtUJqcmNGIXz4OGAmw9pJDCFDO9HiS1VOXTSVJweJ0chKNIHIXJ2Gd0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TUKW3ckBsFPoW0fljSNh3uqtuvKw6AfyULXa68JIaY=;
 b=s+zUD8BM2l8z5LJ1p8CREJBOuWFsgplnZB9rv/HpGtSSpekz41riQcQZi4RCLfdbYw1fkdgq6yOac5rOHDvX0eWTIUEj5+8DeyGk0rLOBDwqU1L2rSJKjBa+IrgzKoedgDXcYviw74KLsLdxhOXdbRwGk2Jb/bCKTNXQASQPuA4=
Received: from CH0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:610:77::17)
 by DS4PR12MB106381.namprd12.prod.outlook.com (2603:10b6:8:4f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:34:32 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::34) by CH0PR04CA0042.outlook.office365.com
 (2603:10b6:610:77::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 08:34:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 08:34:32 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 03:34:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 03:34:32 -0500
Received: from [10.85.46.93] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 22 Oct 2026 03:34:28 -0500
Message-ID: <aa72774f-ad04-4733-8faa-0853a32c2e4c@amd.com>
Date: Thu, 22 Oct 2026 14:04:27 +0530
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
Subject: Re: [PATCH] sched/pelt: Fix truncation of the PELT period count
To: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<linux-kernel@vger.kernel.org>
References: <20261022034930.225042-1-sh_def@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261022034930.225042-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS4PR12MB106381:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c919518-9d0a-4ca6-f799-08df30174bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|261021121427099003|56012099006|11063799006|10067099003|18002099003|261021123027099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	puUpHFUqMrwkL4j6ErRNexTh5XsDD5V0MPvBKtxIsed1PVLSXn6pua+zfDdbWrufyK4Jtus3WZbpATM9OEAthKtLVeaaexKgJNXt5n2Y+rOP2E8TelzcNMKueZobXiWpzkcZOb0XedlvY5euwn+ogYSWhOTwiTPPuAe4fdiY9lRDZHs/xEB0UXwL2sDswVzZfNdJvWcuNhCBoeOCXbSecR9q4x1TmBTVvutNW6Z40xzXBoG69PJFJfcleRblCny0xVVTsyEI33mARZJ4xx+Uq5Mg8ak56w4Hdl5fFLCJ5Itxoz/UEC0xmCdCBjTWLWAeLKQs/qnaFu8/BDII5IUauQgcxY2LDMDHzdV7oxxUWdlwwNNS2faD3ppX26zqj8thZ7NjTp2wrYMGihYqcFpI3iOcTL3+M2XLKh7WvsCAZSNoQ8LI24dehI86cLbkgRd9l4kctwSQwgGALOF7MkDDnZm/vuP9ri2lhrwUPqv5mCKkK7louuruKeMJ6qY2DICooJvDaBALLQTS6RjQNT5iREA56VLrbqFTOdeGlK+w9EHilozETESSXezV+bjxxyV1pkXOJlWOWNeyk8dkHVHVnbKJTNGTtZotqhDx4N8ySW2WdWwZKkXGeNiPkTBycqAfhkL9rG3w+GrRWvkDZwk13reuw2eUOQTNyfHeaMGZ/28gASXJOZAmZx2av+5EwPX+L208I4i6HW/RjQZKKNqcOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(261021121427099003)(56012099006)(11063799006)(10067099003)(18002099003)(261021123027099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gasRHD/V0wGP3RH7VCu1D64air8hYMLtNtaRsPAnyolC1kc6L+9rqvH6UirKZh2TJ18FkbY80oLd0HorUbvJw4+RGMHR0QQAOAv+ZLMALwJis3LZ7kzyi0DMcNGe1SSmJeIOLvxVwj7luXcbKBAbBSk3rzs+TUnjN0qUN8nb6qVTkMys/Zj9oGSw0/WAtVys0sOd+zKS24jQgeIWTQ01cfRMhkZGqt/kj1aTXT8dZiNwpd2WCm3V5rhbNGt0p3i7uCEL17oayacBp2TwtcVFBDdzUn2BQSTc+V7IO03be3OB6afkp794WjmtBwt7SvgdCipkia/6qgbJJ9ISNSaOgE5lgOg3s0iaYmyhLEpxTBHXq078Q/CnKGoMgGeSScsjX6mJ+ge1ZZpRyLN8QL523GV1Ar8eFCKV32KlabSh5ufD9wgQatsldo42MX7IEIt1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:34:32.6250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c919518-9d0a-4ca6-f799-08df30174bf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB106381

Hello Hui,

On 10/22/2026 9:19 AM, Hui Su wrote:
> accumulate_sum() computes the number of elapsed PELT periods in a
> u64 but returns u32. When the count is a multiple of 2^32, it is

So at least an hour between PELT updates! I suppose it is possible
with nohz so not too far fetched.

> truncated to zero even though the PELT sums have been updated.
> 
> The caller interprets zero as no period boundary crossed and skips
> recomputing the averages, leaving *_avg stale relative to *_sum.
> 
> Return only whether any period elapsed, which is all the caller
> needs.
> 

Probably needs a:

Fixes: a481db34b9be ("sched/fair: Optimize ___update_sched_avg()") # c079629862b2

> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  kernel/sched/pelt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 779eb58a4261..519bc9c40043 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -146,7 +146,7 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
>  	if (running)
>  		sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
>  
> -	return periods;
> +	return !!periods;

I would actually favor changing return type to u64. Since
accumulate_sum() is only called in one place, and that too within an
'if' condition, I'm sure compiler can optimize it similarly.

>  }
>  
>  /*

-- 
Thanks and Regards,
Prateek

