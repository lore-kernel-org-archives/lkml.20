Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792988776;
	b=dB35X2GUl+ZkvZ7RR6dtgVgDb7S/O1cXMDdmgAr5GTC23Axoyi6QMfWpvBlZRauhNha+
	 TnCLk4imTCQNk1IABqeEUyGMZpIqyv5Qzp3qo60iVQBIX1QTO5EtDsrTCds5Xdq9QRSA1
	 ROkj5/zSkuZVs0NsCBOLKyTdSjcPQNTLhB6ewpM2TkZqD5YJ4rQHbFqdSnuXqnNQR+0l9
	 m0cYaRCQJb+EyLLCan08aMhRcwZMiKr8BoW8+2+5eqsJYPyCDONqYKbFQQIPlDxhaD5qC
	 oxu8exUAyNiOxVZqWI+pgujQouhyZNlC6+PiTDlozLP7c2kHaXAIrBJtKK/1daqxuEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792988776;
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
	bh=BSmIEV9Y+gturGm7ew77Bv/0I3dU9q/8hYs9Fk2wdgE=;
	b=1WfeIZmyOJUUxPMLM7STlZo/OI+4sRHtcd+n1Gh4rCyaK7AnU71EPhnCcscOQDimShKH
	 Yh0Dga3qsDlc6iHKPl/8U0gtpVyUNO0+pnQP3gKwlIzcaHfbetOkp7P8+Fq3pBASrEfoC
	 Vs3JoUeLhF0rFehzYZvqVG/04/G2zC9QqpLCA+wcvXozZVhTwHT8QRdfWQR8RWme4a2fF
	 zT6sCJENoyoffO/TKPmT6+r6KaX+y+LaZGBRMn6Y1YpCgtCgU85+A7JfSQ3u3t6mb01ug
	 xaBTsTf9tnF3B4vfkbFUtNNZ733CYczddnKO61jen+8Geh1KAWwWkmbTvnCtg/plA1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u3sbaHQ5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.16
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u3sbaHQ5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcedgjEye/H+xAP/TTRx0nHh/wQFxjPuAqjGfcY9Tms0cg2LT5KQ0A5BQNcXbT8Fa2kXrkxMtJ5XYvCtCA4hkeDklI1Vf+Ec5BSEG9fUAIxchRUmROfqh5lEALcGHEwCpUA7YrbB5QkgWeLfZfyY87GPOv+70vwdCtd6IVbHnHfWmlgDUjQzufyN+nVcLd/V9kMV9aLOGRwDYjSpGNzI9xD3Lnv8WeAPDqSmkE9Lmjs4PR2jt7tLJgg3UgrORKMqox4RdhqpyBs0EdwCUFUZw/q8dfoRqiz13GAFFMzT4G+NYyWNuqgTfKsovqoiUamPGU39nGznFCdQTD65t0NwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSmIEV9Y+gturGm7ew77Bv/0I3dU9q/8hYs9Fk2wdgE=;
 b=EK48WxTmzsqqJpd0MJd2ry24qAmLhaKe3x2vBH3ugvNXtMe2e3qNNmDEP2k49EYS37WI+MSr59VTnoBCaLdao6/6XJa73oA9UH5EGWff+eXpFuXHtNE18E+cGK2fX7W7jnAmVABHt5kpmjhvAC/X93Qr5jVEuRYRs9RyUbjuAVH5tI9ZxX5Wts0IzhJ7DGnhvt9IuxvnFu1+yk40Z9PAjMJ018WfRzVv/ggLbpCRLnurvsFQN5n/C82T1vw6IU9cM/9HcQJeRgnTOnzSEaTJ+JCqHA2Nui7+TB7quFA/ZZ2LFe44RbDfoupjW9IHsrzZIqzy3ED35L/xv9vcq4nLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSmIEV9Y+gturGm7ew77Bv/0I3dU9q/8hYs9Fk2wdgE=;
 b=u3sbaHQ5DB2R174Qihl5G6yJzP6V6nyNEz8qRiYGrEJ0meCT7H4Vcttm5FFJFp1A7HTDaiejaT8np4Pd+OQV1yCPGLfqjxJVw3RWu41f2Mokbi7nBHP5vl3mbOsqodoKmPxbuFZZNpM3CO9sgeKCeNSdVyUNAUAdhq7777M40LM=
Received: from BN9PR03CA0315.namprd03.prod.outlook.com (2603:10b6:408:112::20)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:26:12 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::54) by BN9PR03CA0315.outlook.office365.com
 (2603:10b6:408:112::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 26
 Oct 2026 04:26:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:26:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:26:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:26:11 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 25 Oct 2026 23:26:04 -0500
Message-ID: <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
Date: Mon, 26 Oct 2026 09:56:03 +0530
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
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
To: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>, "Juri
 Lelli" <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>
CC: LKML <linux-kernel@vger.kernel.org>, Valentin Schneider
	<valentin.schneider@arm.com>, Connor O'Brien <connoro@google.com>, "Ingo
 Molnar" <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Vincent
 Guittot" <vincent.guittot@linaro.org>, Valentin Schneider
	<vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>, Metin Kaya
	<Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>, "Waiman
 Long" <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, "Qais
 Yousef" <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo
 chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com> <atx1U_0FC-fazkV7@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <atx1U_0FC-fazkV7@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bbf531-c8f1-43bf-4f88-08df33194431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|11063799006|4143699003|5023799004|56012099006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QFViXqVUMsQLYwvnaHriGcDFJfqjoWCPaifM0fVVOho5yvQV27iMnxX//FMPERuaL0PKusS1Pz4S0EG2Z2SYynwvKTkkov5opkQTwGsl4IIXdvskz3ZclBt83SesDsX89zcU3CRyEmGXu4I947hoAGOGibEeS/DNcExawwC3mHDhG3V96jxIqEOoqLpk6cURSAFXiK1iMe9WHptFRkT4eN9DrZuf1/Embeu0Pi+u8qEBi0vGHMqPKDhm/Dtd/X/gxQH/PwFtV27mpCQjtavs4wJFE2GptuDWq4HDQuqMPvL+3TSmz5o/asaR1+BkmjPrh/F+J26NgNRO/SMRqyRB9Ox2b68N3z8KYUOadB3aaNEOhezOOO9UThPayt2KTasUPdjEesn8gJGAE3eeCMzPp8b/O+yLxVcQif8SL/rGG7nMm11bWTPlTFfOq6XsiEYbQpQXrBQU9Lz9CS7DWimwulB3cbSwwnRCn2dgH+6iVrcZc4C42Der5T0NjcqZtkvUxrp03CkLXS+muJn7ITHMZ+AzB8L4CqYMElgSsS5u25Qc/ML5laT7vXUfYbYgGByJRboLVS68IjkK6TgJELlCqI+UhY/YgK7gkQYphARDZVTO2q91Oby2wzyD6sEbZACknWnr7mCg/+oaojUzt4GNFqjWg96Iz0MITa0lU49YVRtb92Z/h7urvnIGN6VFjp2bioH3cTJ6vyxNvyy9WYc9Ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(11063799006)(4143699003)(5023799004)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d+2Xv8Y21ij7mqrK1nj5yzSelWQmEZE+DM97CsxvAIy7bGjJTa6X+LoF2X6bVUmzkICBlXxDmXPCyhVIARpssgX0XdwTTz9vc5Ykjxp9FCftn41J6hfXKLwB2JItFEWp8F61Wmi7gIEXT+uZ+GGOeqJsdlBzrHfHlD0POjzW9oQfTSi3GPhDL9wY9fB9MicjbAJnmOb44YQSBg02h9hqdC0/ziqFJ/wbM8TUv9J4AZt6zw1N6xRzjthWVNhE2MFsRYGgmW4HUa/FLLszT8gywNGbsgry1VV52LwBLNZeHWeOi0nQM7DIS8v/e8CEpUbJz0uxdPtehThTaAO0I/b34nX1FA57UABvLGuQ/umpqQi1WkAjdKLAVBNrxILQcpogRBqsDngZc7HddVsTp5j5Xk9ZUf1PgaqkxXdNkZ/Y6YuxU+TNFWoYc4zxYE039i4z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:26:12.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bbf531-c8f1-43bf-4f88-08df33194431
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260

On 10/24/2026 2:37 PM, Andrea Righi wrote:
>> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
>> +{
>> +	struct rq_flags rf;
>> +	int target_cpu = cpu_of(target_rq);
>> +
>> +	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
>> +		/* If task is no longer blocked, don't activate */
>> +		if (!p->is_blocked)
>> +			return;
>> +
>> +		/* Avoid racing with ttwu */
>> +		if (READ_ONCE(p->__state) == TASK_WAKING)
>> +			return;
>> +
>> +		if (READ_ONCE(p->on_rq)) {
>> +			/*
>> +			 * We raced with a non mutex handoff activation of p.
>> +			 * That activation will also take care of activating
>> +			 * all of the tasks after p in the blocked_head list,
>> +			 * so we're done here.
>> +			 */
>> +			return;
>> +		}
> 
> Is a racing activation the only possible case here? When
> proxy_enqueue_on_owner() calls block_task() on a fair task that isn't
> eligible, DELAY_DEQUEUE keeps it on_rq with se.sched_delayed set. In
> that case p simply won't donate until it's woken by the mutex, so
> nothing nasty shoudl happen, but maybe it's worth updating the comment
> to describe this case as well?
> 
>> +		if (task_on_cpu(task_rq(p), p)) {
>> +			/*
>> +			 * Its possible this activation is very late, and
>> +			 * we already were woken up and are running on a
>> +			 * different cpu. If that task blocked, it could be
>> +			 * dequeued (so on_rq == 0), but still on_cpu.
>> +			 * Bail in this case, as we definitely don't want to
>> +			 * activate a task when its on_cpu elsewhere.
>> +			 */
>> +			return;
>> +		}
>> +
>> +		scoped_guard (raw_spinlock, &p->blocked_lock) {
>> +			/*
>> +			 * Again, if activation is delayed, it's possible the
>> +			 * task has been woken and is no longer blocked_on,
>> +			 * but went back to sleep, so double check blocked_on
>> +			 * before activating onto the owner's rq
>> +			 */
>> +			if (!task_is_blocked(p))
>> +				return;
>> +		}
>> +
>> +		/*
>> +		 * Have to make sure we handle nr_iowait adjustment before
>> +		 * we call proxy_set_task_cpu() to ensure we are adjusting
>> +		 * the same runqueue we left (where block_task()
>> +		 * incremented nr_iowait).
>> +		 */
>> +		if (p->in_iowait) {
>> +			delayacct_blkio_end(p);
>> +			atomic_dec(&task_rq(p)->nr_iowait);
>> +		}
>> +
>> +		if (task_cpu(p) != target_cpu) {
>> +			en_flags |= ENQUEUE_MIGRATED;
>> +			psi_ttwu_dequeue(p);
>> +			proxy_set_task_cpu(p, target_cpu);
>> +		}
> 
> Can this break SCHED_DEADLINE bw accounting?
> 
> p is sleeping here (not TASK_WAKING, not TASK_ON_RQ_MIGRATING), so
> __set_task_cpu() skips migrate_task_rq_dl(): the old rq never does
> sub_rq_bw(), while ENQUEUE_MIGRATED makes the new rq do add_rq_bw(), so
> this_bw is leaked on the old rq. And if p is still dl_non_contending,
> task_contending() on the new rq just cancels the inactive timer, leaving
> running_bw on the old rq forever and making it underflow on the new rq
> the next time p blocks.
> 
> set_task_cpu() doesn't help, because migrate_task_rq_dl() bails out
> unless TASK_WAKING, so I'm not sure how to fix this case...

I wonder why "p->dl.dl_non_contending" is not sufficient to know if
there exists residual bandwidth on prev CPU. Seems to have been like
that since commit 209a0cbda7a0 ("sched/deadline: Improve the tracking
of active utilization").

Only time task is non-contending is if it goes away with DEQUEUE_SLEEP
or switched_from_dl() with dl_runtime.

The latter doesn't need migrating the timer as the timer will either
be cancelled if the task switches back to deadline, or will expire
where it was queued - set_task_cpu() has no effect in this case.

Only other case that marks "dl_non_contending" is sleep + wakeup and
for that "p->dl.non_contending" should be sufficient. I don't think
we ever do a set_task_cpu() for a blocked task other than wakeup do
we?

Juri, Peter, are we missing something subtle here?

> 
>> +		rq_lock_irqsave(target_rq, &rf);
>> +		/*
>> +		 * proxy_enqueue_on_owner() called block_task() which
>> +		 * increments nr_uninterruptible, so we need to reverse
>> +		 * that when we activate the blocked waiter
>> +		 */
>> +		if (p->sched_contributes_to_load)
>> +			target_rq->nr_uninterruptible--;
>> +		update_rq_clock(target_rq);
>> +		activate_task(target_rq, p, en_flags);
>> +		resched_curr(target_rq);
>> +		rq_unlock_irqrestore(target_rq, &rf);
>> +	}
>> +}

-- 
Thanks and Regards,
Prateek

