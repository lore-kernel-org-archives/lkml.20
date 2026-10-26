Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989172;
	b=xtiJpcjeCGrmTbL+Af2oNOY7xsTGFAuKQjbs9eRGlzZRmYzBm7XfP4w1kCPWnBL6DxdS
	 tW/VcefeZ3LOU6isfNIDELxqyotH3Iqc2rnvcEJGn3HZTl24Kb+VFBtdCHK31+dULw/o3
	 WHvt712/hP7BKAH/UnBe5sjU59UwwdBp4nZa/Hfqr08PpxoUg9jEziM/nlBT0ouiD2mYU
	 QXpCon2G+Rv8E6bm/yDS773ZMWxLIpsIrrEMKiWGOooMcEou5dd6h3G2FAv+P9WgXesW+
	 7wFieUWtGuIRoJWH4+PkSVzW3VZ9ivGxa/ssleQyi4jzJNAKoqgjBky69xE4hEQuwSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989172;
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
	bh=D0iVvlHuB74XoEalrxtkGWN5XONv+72FbHhrKEXQZsU=;
	b=YZQKrMLdKs9QNOcm2cRBJBG/7WATr0LlJHJaFphdRTUDVN8LYtUaWU5HlqeWq2iwkMFl
	 0eBEuFm6tKi7gl66xVIbtcBFIHMZsRAW6azDmYLFgR1EI73dUVPdo0d5rSLCbJodxt0Ip
	 ym92j+NT/X7NL0hq9c13TXFW48+I1QNgOA9sBHBrtbaT8QFHi43RsCwgL4Q6avfE4Vcrj
	 z+4wsumfcFYJj02soYos2P5pUcy6hI51EEgzm6yEEDRGmknl9Yt/5wjhtXOL9F052Hn4s
	 RHdZRZD1JpYm02Wr+6/pz9Bfbo9D1OX1T3JJLXmdxnQshdaGN8b+BlrnXWi4BkEhZUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pm692X4C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.12
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4575606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4575606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pm692X4C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnnkf/YOFGuyqMT/ygi4kvMEkNVWKSNsio9tQ/C3yaU6kVT0pj2P7dLyjkPStcmhp2pb44zWCvzUPtdaw3rZIQPdYIy+rtPn0ctSppGVq95chqVynYyoaen3v3xCQlURbCN8Rd2YjqM7izfw8Oi+CXXjJlOyLycJpOj3OQopFayeBEDFCnzFm6iRVqhJPVVqN5s5dLmWmwxOhKO2b/lFLGic1TF0xIIH7VqJpZpAkjw5+sdPIczbvCtkpuZONBp/du2Iqp1l5zifRCdNtF6bTcSNGIzR0TUsl0meD0wAgIQvKVhofcTWK7YEOY5wJnGg6/gsLGNnKWvxHlsr0GufpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0iVvlHuB74XoEalrxtkGWN5XONv+72FbHhrKEXQZsU=;
 b=F+jYYVmwrRV1zwEPXCi2RXDME2ZWoNVxc0Ra57FpxnVa4iJ++wwZmEZDpGW2VUCFo1wrTRNGu8kN5qKoFb+VVB/SoGf7xUiG4OFOS2kj4z9SsDRffh61TK1hKEgv6/CuEAkTx13RZigSA7Fjv1AgTYMm7kWfk8lQvTszFIBC2L4djckedBtcYLIh461kg3V/vco1POjrISG4vb337OILJaCzEACoHSGrNzeRheuDFx0wdnR0k7giZQLk6NIATb8sUbjKgvugll+fr3SGxVEI7IZyLlKj1hqbYE2n0kzzRIno10jb6iFOnNMeoLoR12g5p5mN7wQ1WeU4AhEb9w7Wdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0iVvlHuB74XoEalrxtkGWN5XONv+72FbHhrKEXQZsU=;
 b=Pm692X4Cm85QBpAlMEXaC4QVERoaOlNx5YrNvNF6mwRJ5HfHeoJTcktB/fqIF7w7Ve+CpnefHWZUu7xpohhug8WTsxGdbbWdKMPo34zVPi2c6DbyKvJ2nXOd0s6+HLSZ1hv1L3iiRpG0VXX3AplG4pppoQovDMSjaUZrh2dsI78=
Received: from MW4PR04CA0063.namprd04.prod.outlook.com (2603:10b6:303:6b::8)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:32:44 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::6) by MW4PR04CA0063.outlook.office365.com
 (2603:10b6:303:6b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:32:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:32:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:32:42 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 25 Oct 2026 23:32:34 -0500
Message-ID: <327337ed-6a9b-4ec5-ad5e-bacaaccb1553@amd.com>
Date: Mon, 26 Oct 2026 10:02:28 +0530
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
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: David Stevens <stevensd@google.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>,
	Metin Kaya <Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Qais
 Yousef <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang
	<kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-2-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261023220431.1106611-2-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: eb06453f-a67e-46e3-065c-08df331a2dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|4143699003|11063799006|5023799004|56012099006|261021121427099003|261021123027099003|261022105027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uTLKrdkPG//DNtnFNqncPm5y2HL2Bo22SqrFZkooQEX7yz2GJvIt6EsTIsWtwdqyT+e/bm/EELL3yCUO5d184biz+G6DS1Lk87AaFglUppNSlJhHgZ0IcWUtmICcFOP/cDxKYX9O/b86hwQSkGbhHrELaMdr+QrnLaS2GyFF4XE3FYItnv1t3b2PHRnlEoIFgEZD7LQTo1KwWLclMtfwWS3i4DWnTqZAeElCFzWyRAcE0sZ8OGHQEQgxClTI6J4DSyrqC3Wgbu20Nynqf+j7+sfsEbdpiNxz3ZDmImMQeG+qV2QUu4NjH8y3Tw89zSJ3vdgg+8ULulrBwXdNIm1dM+h9RIiNEyiA9NBkxfbhs0Bmyxl5utljJcz0FfCBYHZHjbAABJq3OYuwMMA/qCjtl7o40tvgc8ASKj0fmWAA2RCyaOvD69S8sY1Bq34EF3tLxNJhPpzpHy87CF/vDh7bCzDmSs/GSvMymDcF6eNQ0LTQ/IIFYhCqx8cE1tXy9RQIy9lUVQjibwz2ZbxgyG0bpBlnmvENafWil7gKVQiRjI+aWTApl5Tnwtl9K1X18CywbyfyBQp5VrI8wAdbPaNZFciDpw6H/9zrK5gzJq3F1QaLK7L3PXJfgVl+7iWHDvBDvoykaZpARcyscvyWmcLtwBz7QzcFqIp/naKv2BE/xFdIR4lzWyW8F5HOgEo8P+WoOU2WjgHU8kojK0QI2Zi5lA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(4143699003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sxGE4HSS8xZktM08/c6gGAlLqxqKN5xGV/iLpv5tWHk/9IcVJ79n0iOmXGNX5Bp+N87ADJyGAgBrTF9S5Z1/wHEhydg4vxIGl48YolIMwwc0F51PQ2m9O/fBJzwwoO24WGRT+fV+VERhvNSVmsc4oaI/+SMPdNVrpftcFqoI293zdI66wWD2MBhtheU8l7N5yscHCyXFjmea23WXMmGpCNOC6DAiLRDzuBwhd9KlXevjEzyjn0uDscY11PabDb9EQ3BQXwUOv6mOYMjqI3b5s1zhOBmkoDifLHuYHP0B6QlHo9SsIghuDJb33KdTivhVzEyKeIq+r1LaYEheP19xGLN52vs74mmOATnwM61WYNWfhZRriu2EN+YvD6R62JPldensD+A8oom0ZD8JzJZB7bU8P1PBAbr2QbrSPKmc5nIV+wW9BdhD2hAs8aKlP9g3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:32:43.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb06453f-a67e-46e3-065c-08df331a2dc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100

Hello John,

On 10/24/2026 3:34 AM, John Stultz wrote:
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index ebe0a7765f98e..20820fe1021a1 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -175,12 +175,28 @@ static inline void psi_dequeue(struct task_struct *p, int flags)
>  	 * Do nothing here.
>  	 *
>  	 * In the SCHED_PROXY_EXECUTION case we may do sleeping
> -	 * dequeues that are not followed by a task switch, so check
> -	 * TSK_ONCPU is set to ensure the task switch is imminent.
> -	 * Otherwise clear the flags as usual.
> +	 * dequeues that are not followed by a task switch. If TSK_ONCPU
> +	 * is not set (meaning we already switched away while the task
> +	 * stayed on the rq as a blocked donor), handle the sleeping
> +	 * state transition here so sleep-persistent states (TSK_MEMSTALL,
> +	 * TSK_IOWAIT) are preserved.
>  	 */
> -	if ((flags & DEQUEUE_SLEEP) && (p->psi_flags & TSK_ONCPU))
> +	if (flags & DEQUEUE_SLEEP) {
> +		int clear = TSK_RUNNING, set = 0;

nit. You can declare these on top with clear set to p->psi_flags
and override them accordingly here ...

> +
> +		if (p->psi_flags & TSK_ONCPU)
> +			return;
> +		if (p->se.sched_delayed)
> +			return;
> +
> +		if (p->in_memstall)
> +			clear |= TSK_MEMSTALL_RUNNING;
> +		if (p->in_iowait)
> +			set |= TSK_IOWAIT;
> +
> +		psi_task_change(p, clear, set);

That way, we can have a single psi_task_change(p, clear, set)
at the end instead of calling it here and doing an early
return.

>  		return;
> +	}
>  
>  	/*
>  	 * When migrating a task to another CPU, clear all psi

-- 
Thanks and Regards,
Prateek

