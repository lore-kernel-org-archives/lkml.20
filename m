Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DFB4B7A3F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726043; cv=fail; b=d9zOgGAU1V1ke4rf89tBmi65hI2TpTaQcBGnuNTB5NeAJ4PXeh9KWaENqshiYEV8PbKrElsfabSuXV1oFDNK3eWaBImfJMmDGE0AtLEAC42hKPSEwyb6/7UwjP/MWkUgT5PFVJHdOChKu5XY9PZaZ80QzggAYoEyz0pXzx6pDmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726043; c=relaxed/simple;
	bh=u6wxWEVhHbLlZMit0+Jx84jns7IkNdCW1J+bdQoyEbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NT5w2NPSmeYJo71LF6fOdIKbG8Or7XfvyWIAB3QpE2mxd3Ze/NCDpCgX6HLaM5/5cytEeL/TjMu19a21Ke2Mo56gBFZNxPDMPffeAfO3ii497ItGPRb0UcEboPzgOv9hlketEjpshWuPHfeKHr2Kv+JK9rekMPGBRkA6MzJ+q3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I6ItSzmW; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I6ItSzmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suP/RXmx33fPux+SeZyx4eLb1qXoKmKhRs29Usc23M9s1capbcWi7Nv47EQ1Nl4iDB/V9Eeo40lC1rO9kuqBqac9MiZ/ImSSIaD59nH+38cvFI6O4ch5Isg/y/ER5fZWvVGvnzpoxcsavlR6gH0zhlmGVfre2uAv53kkqt4Oxj1gJS5QEQ9OTv4jQMW/JGE3g5iz7eY+qXqCwIsz7FbnF5GGtWx1196NGKo1Xpa5TzNm9tgcnP3THYuURq3ck0kPSHOuP38ewgPbq+Q7osCu0FvY2+n/EnnBXstPPu5zuHdwOM4w1I/X+95zLdmplOfqN9480gvb2C0vj/44/rbvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4Z0N2qdLPNPBANZKC757OFxCdHXPtxRbdZHTJJQeW0=;
 b=BbNdoJATm5xoNnSyaSg2UI2+il/fiG6FM2vog4pxawMn/pZ1Th0zq0VH865G99uqmBArUnqF4W+3nZftDBJ4LhjPUmclToltyh2QmsGafyVLH6hex+v5aiF+J1rFXbr5B7ZETa1/6pd02ejOrStPfVRWnNypAHFfFW3Qj1DH2cLpyN2TSIDHemqscAYhmy69MpzjXcjdT7aEoBcttZq7VucjxuNkviR3qbcBxSNhgi0vk7j0t+N9HnVMf9SVlgfUBtfcn3ltE7wP3q1PiStOxc2pfHpsYT75CCjKa3zDx9FsxMdK5XpMnb0IXrweIHFnzQwWqQii2ngS+YiG3OvElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4Z0N2qdLPNPBANZKC757OFxCdHXPtxRbdZHTJJQeW0=;
 b=I6ItSzmWCcNjaK8U271WsWJLU/X0ReEmjjQYDCdxXH2rdsLNR2HNtlXSDjW9wvspOpF5n0onlANuOyDT0FYReEKvDLLxJZiGo0T9E23UxiVL8GYyY6msK36eW9L2auwLpfpbw6xOhwxmRH0f0yH6G2XTNGVH8K0+HU12OzV8hzI=
Received: from BN9PR03CA0589.namprd03.prod.outlook.com (2603:10b6:408:10d::24)
 by DSVPR12MB382825.namprd12.prod.outlook.com (2603:10b6:8:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:07:18 +0000
Received: from BN3PEPF00022BC5.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::2) by BN9PR03CA0589.outlook.office365.com
 (2603:10b6:408:10d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 10:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC5.mail.protection.outlook.com (10.167.248.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 10:07:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:07:17 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:07:17 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 05:07:13 -0500
Message-ID: <644b5845-4a3c-4f49-abfa-edb4fa6ed89c@amd.com>
Date: Fri, 18 Sep 2026 15:37:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
To: Suleiman Souhlal <suleiman@google.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, "Davidlohr
 Bueso" <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
	<andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, zhidao
 su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, Qais Yousef
	<qyousef@google.com>, <ssouhlal@freebsd.org>
References: <20260917043339.2093426-1-suleiman@google.com>
 <20260917043339.2093426-3-suleiman@google.com>
 <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
 <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC5:EE_|DSVPR12MB382825:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f22cc1-ea86-4e78-a55a-08df156c9f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|56012099006|6133799003|5023799004|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	X+/dRVzLg7PAH2/Pq3yIZnY4Iggh/PQHnr4BtjnKnUr+CwbngaWjnlTJsgAZR/eUmyVxulBHW9KaHD1IdII9HOKAnX11r5X9IgvRVdm8Hwl78MepBheUQqJuGwYx+BaIVccF2peBRb9Lv8fDZrQp0kACGXesYM3JSDj/klokouK4pf30aPw8rO+Lz7Am9T106EgWYJdxdJB5CgRBTqV4UKfv9cnrFMNylpKrCrNA/Wh+5DjmlEqlrZ62B1xum5WyXDeCmrKsqf8AO6qtgr/xp/UEwvuu95g9wvVzq3B8os4AlqToVg71tpEDHfHKV6jrzNKYDrTpw8gonW/t6lgGqYmoA5BaMaHXdJB/67hwGdS63woaex4cYnfhTvoImISossUF2KM9U0bSmcKoTxBtAYfoQ4aFs2Z3mZqPamguxfa6KwYm34ntCd2ipiQezUtj3se7/3d4TbK+7gyw2cgbipV6kKIYu+xmcxkjiKd9b90bG7y+wT/5pQc2T8VdxWcYcrvf6YgYMrpTYVDWzbkbHrQ5WEJuN3eKNoVDR1Ofda7nnVxTF7hVbDjlpLH+D0wc5eVdrxRtzwNNuUjFQS6MwhR5dTbn1L25wYitEh751kdQvHT1zLGl9Jr5PvqW4SHFomsJmgP/p7RrzpBqj5Dv52Y8RV0wsuaQNHTgneBA7vOOZqZTkGogU6jT2hJdb5dOnAfusj/AhIEmHnlZbQdXbQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(56012099006)(6133799003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uW1J6MbroVaF4kWE2d1+cWYn3yB/GSWxn+T6NOFETzueSa+/2rAPMIunqG9GOpTmPs+C9bIHgahmAwHvANDasWBNsRtHlcjTe4wx99Qpywx4dBq0xAXA2fmvYuz/ZrzHkQ20yf/pkyj4Bv/vh9HCcStqtSVsAhjsEfhyZHYRGihUJwCgvW+bw0lRHSA6cv0+ayy3V/GQOP2+iEEqIhqWoe/REMAF7sj+rZJqJ0jKnL2Z/Jx+GQW+1781JOUc4rpglXJ2+OJxT/vucwXQx0u0rv8CNGtEICY2SgWPobKetlz4+KeZSGT8N9Ken3XKJROaXysVBhCnOUsT7OJBEhypa17YD+UA2AhDN9vtvVPFcYVC9dSSpt4LE1IhgsPLoqEOj1dTQ1qOj3FRY3dfY2n7SOtYTLI9kA+BDTiKDwPa1nuK3P6FCSezaL53k7GNpzQo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:07:18.1418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f22cc1-ea86-4e78-a55a-08df156c9f38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB382825

Hello Suleiman,

On 9/18/2026 12:41 PM, Suleiman Souhlal wrote:
> On Fri, Sep 18, 2026 at 12:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Thu, Sep 17, 2026 at 04:33:26AM +0000, Suleiman Souhlal wrote:
>>> Switch PI futexes to use p->pi_futex_lock instead of p->pi_lock.
>>>
>>> When augmenting PING futexes with proxy execution, we get lock order
>>> inversions, due to the lock order being p->pi_lock -> mutex->wait_lock
>>> in the scheduler, but wait_lock -> p->pi_lock in futex code.
>>>
>>> So move the futex code to use a new lock, p->pi_futex_lock, to
>>> protect p->pi_state_list and pi_state->owner.
>>
>> This is of course horrible. Lets not do this.
> 
> I suppose the alternatives would be to either figure out how to
> un-nest pi_lock from wait_lock in futex code or un-nesting the
> blocked_on lock from pi_lock in the scheduler.

So the only time we try to grab pi_lock + blocked_lock is during
wakeup so I think doing that should be (theoretically) possible.

The ttwu_runnable() handling is extremely painful unless we block
the delayed task fully. Since we have he new p->is_blocked state,
we can safely retain the p->blocked_on while running the task -
it is either cleared during unlock by previosu owner or will be
same as the lock on which the task blocked on.


Based on John's tree at commit 06ac43db4d8e ("[ANNOTATION] ===
Needs confirmation of functionality past this point ===") on
proxy-exec-v31-7.2-rc4 branch:

  (Lightly tested)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c54e9fedc9cd..a5a9d3655976 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4008,18 +4008,14 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 	if (task_cpu(p) == p->wake_cpu)
 		return false;
 
-	scoped_guard(raw_spinlock, &p->blocked_lock) {
-		/* Task is waking up; clear any blocked_on relationship */
-		__clear_task_blocked_on(p, NULL);
+	/* If already current, don't need to return migrate */
+	if (task_current(rq, p))
+		return false;
 
-		/* If already current, don't need to return migrate */
-		if (task_current(rq, p))
-			return false;
+	/* If we're return migrating the rq->donor, switch it out for idle */
+	if (task_current_donor(rq, p))
+		proxy_reset_donor(rq);
 
-		/* If we're return migrating the rq->donor, switch it out for idle */
-		if (task_current_donor(rq, p))
-			proxy_reset_donor(rq);
-	}
 	block_task(rq, p, TASK_WAKING);
 	return true;
 }
@@ -4106,9 +4102,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 	update_rq_clock(rq);
 	if (p->is_blocked) {
 		if (p->se.sched_delayed) {
-			proxy_remove_from_sleeping_owner(p);
-			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
+			return 0;
 		}
+
 		if (proxy_needs_return(rq, p))
 			return 0;
 	}
@@ -4305,20 +4302,6 @@ static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 	return false;
 }
 
-static void ttwu_queue(struct task_struct *p, int cpu, int wake_flags)
-{
-	struct rq *rq = cpu_rq(cpu);
-	struct rq_flags rf;
-
-	if (ttwu_queue_wakelist(p, cpu, wake_flags))
-		return;
-
-	rq_lock(rq, &rf);
-	update_rq_clock(rq);
-	ttwu_do_activate(rq, p, wake_flags, &rf);
-	rq_unlock(rq, &rf);
-}
-
 /*
  * Invoked from try_to_wake_up() to check whether the task can be woken up.
  *
@@ -4493,6 +4476,8 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 {
 	guard(preempt)();
 	int cpu, success = 0;
+	unsigned long flags;
+	struct rq *rq;
 
 	wake_flags |= WF_TTWU;
 
@@ -4524,17 +4509,19 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		goto out;
 	}
 
+	local_irq_save(flags);
+
 	/*
 	 * If we are going to wake up a thread waiting for CONDITION we
 	 * need to ensure that CONDITION=1 done by the caller can not be
 	 * reordered with p->state check below. This pairs with smp_store_mb()
 	 * in set_current_state() that the waiting thread does.
 	 */
-	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
+	scoped_guard (raw_spinlock, &p->pi_lock) {
 		smp_mb__after_spinlock();
 
 		if (!ttwu_state_match(p, state, &success))
-			break;
+			goto out_restore;
 
 		trace_sched_waking(p);
 
@@ -4562,7 +4549,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		 */
 		smp_rmb();
 		if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
-			break;
+			goto out_restore;
 
 		/*
 		 * Ensure we load p->on_cpu _after_ p->on_rq, otherwise it would be
@@ -4618,7 +4605,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		 */
 		if (smp_load_acquire(&p->on_cpu) &&
 		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
-			break;
+			goto out_restore;
 
 		/*
 		 * If the owning (remote) CPU is still in the middle of schedule() with
@@ -4653,8 +4640,25 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 			p->wake_cpu = cpu;
 		}
 
-		ttwu_queue(p, cpu, wake_flags);
+		if (ttwu_queue_wakelist(p, cpu, wake_flags))
+			goto out_restore;
+
+		/*
+		 * p->__state is set to TASK_WAKING. It is safe to drop
+		 * the p->pi_lock and wake up task outside holding
+		 * rq_lock() similar to the wakelist approach.
+		 */
+	}
+
+	rq = cpu_rq(cpu);
+
+	scoped_guard(rq_lock, rq) {
+		update_rq_clock(rq);
+		ttwu_do_activate(rq, p, wake_flags, &scope.rf);
 	}
+
+out_restore:
+	local_irq_restore(flags);
 out:
 	activate_blocked_waiters(cpu_rq(task_cpu(p)), p, wake_flags);
 	if (success)
---

I'm not sure if PREEMPT_RT needs that activate within pi_lock since
TTWU_QUEUE is disabled but I'll let Peter, John chime in.


> Either of them seemed more involved than creating a new lock, but
> maybe I was wrong.
> I will take another look.

-- 
Thanks and Regards,
Prateek

