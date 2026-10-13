Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C849DBAA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871639; cv=fail; b=fNqSeLZnxbTYxNIJTlBeBzRsOc5sl7HO8VHjsafxJchTYn7dZVn41rG5Bp1I7sv5CQNbMuoTvBL2VG8S62TfvBuzWdha3jKQd2g4zBtSCMYL2krTn0xVHDEnFIu1lYwCmP7vljPs+etgKaf/EgWRPA3Ub5k+VU6LevDRh7sPfT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871639; c=relaxed/simple;
	bh=mCtGpAeGFeF2hfa8dj5wKGbLsRcHt4xf1zsJjlNh8Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hME76hPzEZ4ETS/jiMK+W3V2XEMRTF4Wm/rjguIxWJuOuaLyb4IEbCE1ds6nnJkhZNFNCkDz8MJxIxXVpKOP5FTkCZXmyZEWsZXJWCRW3lS8uK76UrbYwZap3YSPe++eS97jG5vj7U2T6NZb3v8cM/bBl4/1ve/gqPHI5e3ui0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2LJRAw0D; arc=fail smtp.client-ip=52.101.48.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2LJRAw0D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbyEcD9S+QXODJBzhcGERH0+o1xaAjLSvl1XxwZwgmsqGOGv0wYqnUR6HxMMtnvQSr6h5k3TRwqeyYbdZ6sRz4LM4QHEIEXoDHPjRfuvrK5EkFUcQLbYQOMw9IGBsA1roWwj9WKY+vgeS/iXo4tzlnIUiN3ozS/VQ/Efu3gytXu/C8gjff8aOEsnMOsEXU1vcggzFQi271VmXNiMhLCrOPK+KPJIe8OyCv79Vt+Rzpkywh+G/2dNd0SNxZjG/jD1VT5wQbO0fklwjxIQHIRCAg810K8SIoFSihg7hEvUmMgs24DMremhoy+oOo5b/Aob0EzHYxQuTaT9YRmRKVIhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpCIMKZfO1zkYfycCe8FVgDEXvUloWLwPGsFIggy5qY=;
 b=FsHTqo/Ac3LdksHIlvng/VTUrd7/eNYHFhjM0uscxeYdDnEUTHpn0VTQ/hMwwtw05iyAClrSWoL+lMwZoBEc2be3IIUd9KfvKysbUxxfGn21oWImv8DlQ2k6OUyxE+gEPknNnNBpqJyw+7H9svqG+vf0C4dHJT3t7PcXNxE6HThQ0aZw0AHX6OCgtyeDytSETLlxBx08yaGuD30/ydhFEt0oVscgN7FzYddO+SkukufXGX1+jYa2bb+Rc8LT+C94//fTrXS+jLwK4p6pKO+ENXF3HrP2oU8rynSAJQAuPH8ps9aUEBN7Mid25jGb7sj/qLvZNtjD+k7qpjI0Cg4JXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpCIMKZfO1zkYfycCe8FVgDEXvUloWLwPGsFIggy5qY=;
 b=2LJRAw0DpSqg/VBMdCQVOJlnGE4U1UjdNoTv1FFieLaL2lNrURovKUJAliNv4wFUv013DCA3MLmOJzYY3KEwF/XtohukBT2UFMQ+Vq4mZEDAg1bO3W4hyN77zXshJkAjFM5hLk7nsod97ufUm9w6iifpRoSXDN07F4ooWm8/On4=
Received: from PH0PR07CA0069.namprd07.prod.outlook.com (2603:10b6:510:f::14)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 13 Oct
 2026 06:07:11 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::8e) by PH0PR07CA0069.outlook.office365.com
 (2603:10b6:510:f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 06:07:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 06:07:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 01:06:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 01:06:58 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 01:06:54 -0500
Message-ID: <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
Date: Tue, 13 Oct 2026 11:36:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Apparent lost wakeups
To: <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<kernel-team@meta.com>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|PH8PR12MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c3b918-3bd0-4173-ca89-08df28f034b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|23010399003|376014|1800799024|22082099003|11063799006|5023799004|6133799003|18002099003|10067099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5udibpYD1FKAa8yusuxvEriTKlg40HHmLTbchQiIPOYJn7hzwAIeofIvOlKUdue3hGtB5+aQ0rPfu7sIXZD1DSBMCxiaROwhcvoT9frEqpwdaPhf6GHDMDhsjKzoER8cSFxwGcMXWEbyMxRK1wA7IK5aXdylbY7Lu3+kBqXdyrCe8XlJwfwrDQWGBMMObB6WjSUbjZOmP0jnXbnFiDMCkM3vhMLC4QVwPxlERYJbUwLEdfMV2tPWz/eL0e/bBY8kDCJ7gQWyNAOSzfN2//DnsuyQtli+gYcJYtU3pI/ZvIw5yeWvJ+G1bdegWUXY4U+EFTggf7vC7PLyM2Zv9hRaii8iYANGGqU9YHW7LxvNjVGaETJJV+7FKkKObEfMg3geYDbDdhB8+4Nd/Q/r05LKp8O5J1kyqkIC6bfJ9zydpKHmScrTGCN+TVa0fEsKuXm3WGBoc8KVBCSvN5ZryLXKiEx+2DV7PhT3/xYZojcpKRStxyxhc1oueKN6adbYpyVBNiYM8gXZX9hl9WwnqgEopBSukpmQSSYOW7o8MZzWC0f7S2PqNduuumDqDl1LY/m989nNh39Nrr3ISlghW2jsrmwFgZsZe9pf+fk0E62EiqJUap7YhWnSA+caawm4WZky5oyz+OCK/stybgK10z3RtQI3gD0taMOVH1lXiv3M/6LGNT6hmfHS8Hdr31LyMsZUlnQPRQuZ+dRcA8AE9HPxlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(22082099003)(11063799006)(5023799004)(6133799003)(18002099003)(10067099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	scLMzpMUnYF8Y6CrwtVI0KjXXSxi2LC8YY9WbkY9y7bDwoiMuCBpDVVZs5IHT8BcFRL3X5qhZ02Vz8YwjHsmVXak+XMS2dGA9D5PtLJXwYYjLQHb7GjlkO8KircvbgOVsh3o3nDx3nnby/GCWbjdkDma+Dm+og3Ty6zIvoRnPkTbd7LiY/5eMG52gBdXlHcHERNJCubvROQHKdXoW3HyN1BiezTNpPIzapzz5wHtkGDSSsUhz+g9yeq5kRc9QNvTA9KFZk6vHqoLhHEdZCyM1bDyCLeMQlmF8MVDxOC0qPwmWCsT1LCoSixsjtGhZ15b4ovL5TxmUKGBCwL9loH8PtQZ5RkWGGXSArKxKFE3UEz4X2NtwLR31c/AbbMEsFWtogeGQa2svIKFHp2MNkdmmag5XxMaPlxKjFKCAchsFBwPZfzrwSQJsfqZxPEUk/sc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:07:04.9873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c3b918-3bd0-4173-ca89-08df28f034b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986

Hello Paul,

On 10/13/2026 12:11 AM, Paul E. McKenney wrote:
> The scheduler appears to lose wakeups on both x86 and arm64 systems
> when running the rcutorture TREE01 scenario with RCU priority boosting
> enabled, but without also enabling testing of RCU priority boosting.
> The following pair of commits in my -rcu tree [1] make these two changes:
> 
> c7684673c6ca ("EXP rcutorture: Enable RCU_BOOST where supported")
> 4b08261f7bff ("EXP rcutorture: Disable RCU priority boost testing on non-TREE03 scenarios")
> 
> These two changes were motivated by CI systems reporting RCU CPU stall
> warnings due to low-priority tasks being preempted for extended periods
> of time.  The hope is that undisciplined RCU priority boosting would
> eliminate these issues.  (For an example of a disciplined RCU priority
> boosting configuration, see the TREE03 scenario.)
> 
> The following command reproduces the lost-wakeup problem, which shows
> up as RCU CPU stall warnings caused by rcu_torture_reader() kthreads:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 20m --configs '19*TREE01' --bootargs "nohz=off rcutorture.onoff_interval=0 rcutorture.nocbs_nthreads=0 rcutorture.shuffle_interval=0" --trust-make

tl;dr

I could hit that WARN_ON() from your debug patch with the above test
even under rq_lock. Seemed like a missing resched_curr() but it
turned out to also be related to rq->next_class interaction.

I haven't been able to hit the warnings with the below diff. Could
you please try this:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0f63c30b4324..f2f8af3cdfb5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11239,6 +11245,11 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		if (p->sched_class->switched_to)
 			p->sched_class->switched_to(rq, p);
 
+		if (ctx->queued && sched_class_above(p->sched_class, rq->next_class)) {
+			rq->next_class = p->sched_class;
+			resched_curr(rq);
+		}
+
 		if (ctx->running) {
 			/*
 			 * If this was a class promotion; let the old class
---

Larger explanation
==================

I added more debug data and I see what happens at time of last wakeup:

    Last wakeup comm: rcu_torture_rea

    rq->next_class: 000000008d901c4b
    p->sched_class: 000000008d901c4b

    next_class:     idle?(0) fair?(1) rt?(0) dl?(0) stop?(0)
    p->sched class: idle?(0) fair?(1) rt?(0) dl?(0) stop?(0)

    need_resched_set_after_wakeup: 1


And then at the time when warning hits, we have:

    h_nr_runnable: 0
    h_nr_queued: 0
    rt_nr_running: 1
    rr_nr_running: 0
    dl_nr_running: 0

Looks like the task that is enqueued is RT but the enqueue context saw
it as a fair task which pointed to __sched_setscheduler().

When pick_task_fair() drops rq_lock() for newidle balance, it is
possible to queue a task and switch it to a higher class before the
CPU doing newidle balance grabs the rq_lock() again.

It then sees rq->next_class is still fair and only checks
"rq->cfs.h_nr_queued" which is now 0 because that task was moved to
RT. The task was not running so we neither upgraded the next_class,
nor did we do a resched.

sched_balance_newidle() returns 0 and since we are already at
pick_task_fair(), we think nothing has queued above us and bail out.
The above diff fixes rq->next_class and calls a resched_curr()
when the task in upgraded but not yet running.

Lightly tested with TREE01 which passes without complains after
adding the above diff. Your mileage may vary :-)

-- 
Thanks and Regards,
Prateek

=========================
Artifact: Full debug diff
=========================

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0f63c30b4324..f2f8af3cdfb5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2305,6 +2305,10 @@ void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
 {
 	struct task_struct *donor = rq->donor;
 
+	rq->last_comm = p->comm;
+	rq->last_class = rq->next_class;
+	rq->wakeup_class = p->sched_class;
+
 	if (p->sched_class == rq->next_class) {
 		rq->next_class->wakeup_preempt(rq, p, flags);
 
@@ -2314,6 +2318,8 @@ void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
 		rq->next_class = p->sched_class;
 	}
 
+	rq->nr_set_after_wakeup = test_tsk_need_resched(rq->curr);
+
 	/*
 	 * A queue event has occurred, and we're going to schedule.  In
 	 * this case, we can save a useless back to back clock update.
@@ -11239,6 +11245,11 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		if (p->sched_class->switched_to)
 			p->sched_class->switched_to(rq, p);
 
+		if (ctx->queued && sched_class_above(p->sched_class, rq->next_class)) {
+			rq->next_class = p->sched_class;
+			resched_curr(rq);
+		}
+
 		if (ctx->running) {
 			/*
 			 * If this was a class promotion; let the old class
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 76f3c84ca684..7a0f2f701d56 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -279,6 +279,7 @@ static void do_idle(void)
 {
 	int cpu = smp_processor_id();
 	bool got_tick = false;
+	struct rq *rq;
 
 	if (cpu_is_offline(cpu)) {
 		local_irq_disable();
@@ -306,6 +307,7 @@ static void do_idle(void)
 	tick_nohz_idle_enter();
 
 	while (!need_resched()) {
+		bool redo = false;
 
 		/*
 		 * Interrupts shouldn't be re-enabled from that point on until
@@ -339,6 +341,69 @@ static void do_idle(void)
 		 */
 		local_irq_disable();
 
+		/*
+		 * Lost-kick safety net: never sleep with genuinely runnable
+		 * work queued.  Exclude delayed-dequeue tasks, which are
+		 * counted in nr_running but not pickable (as in
+		 * wake_affine_idle()).  Lockless reads are fine: a spurious
+		 * hit costs one extra schedule pass, a miss is re-checked
+		 * on the next tick/interrupt.
+		 */
+		rq = this_rq();
+
+		scoped_guard (rq_lock, rq) {
+			struct rq_flags *rf = &scope.rf;
+
+			if ((READ_ONCE(rq->nr_running) >
+			    READ_ONCE(rq->cfs.h_nr_queued) - READ_ONCE(rq->cfs.h_nr_runnable)) &&
+			    !need_resched()) {
+				WARN_ONCE(1, "CPU %d entering idle with %u runnable tasks queued\n",
+					  cpu, READ_ONCE(rq->nr_running));
+
+				pr_warn("Last comm: %s\n", rq->last_comm);
+				pr_warn("Last class: %p\n", rq->last_class);
+				pr_warn("Wakeup class: %p\n", rq->wakeup_class);
+
+				pr_warn("Last class: idle?(%d) fair?(%d) rt?(%d) dl?(%d) stop?(%d)\n",
+						rq->last_class == &idle_sched_class,
+						rq->last_class == &fair_sched_class,
+						rq->last_class == &rt_sched_class,
+						rq->last_class == &dl_sched_class,
+						rq->last_class == &stop_sched_class);
+
+				pr_warn("Wake class: idle?(%d) fair?(%d) rt?(%d) dl?(%d) stop?(%d)\n",
+						rq->wakeup_class == &idle_sched_class,
+						rq->wakeup_class == &fair_sched_class,
+						rq->wakeup_class == &rt_sched_class,
+						rq->wakeup_class == &dl_sched_class,
+						rq->wakeup_class == &stop_sched_class);
+
+				pr_warn("nr_set_after_wakeup: %d\n", rq->nr_set_after_wakeup);
+				pr_warn("h_nr_runnable: %u\n", rq->cfs.h_nr_runnable);
+				pr_warn("h_nr_queued: %u\n", rq->cfs.h_nr_queued);
+
+				pr_warn("rt_nr_running: %u\n",  rq->rt.rt_nr_running);
+				pr_warn("rr_nr_running: %u\n",  rq->rt.rr_nr_running);
+				pr_warn("dl_nr_running: %u\n",  rq->dl.dl_nr_running);
+
+
+				if (rq->cfs.h_nr_queued) {
+					update_rq_clock(rq);
+					pr_warn("Pick on fair: %p\n", fair_sched_class.pick_task(rq, rf));
+				}
+
+				// set_tsk_need_resched(current);
+				// redo = true;
+				break;
+			}
+		}
+
+		if (redo) {
+			local_irq_enable();
+			continue;
+		}
+
+
 		arch_cpu_idle_enter();
 		rcu_nocb_flush_deferred_wakeup();
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a2..7e685cc51e43 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1253,6 +1253,11 @@ struct rq {
 	unsigned long		next_balance;
 	struct mm_struct	*prev_mm;
 
+	char			*last_comm;
+	const struct sched_class	*last_class;
+	const struct sched_class	*wakeup_class;
+	int			nr_set_after_wakeup;
+
 	/*
 	 * The following fields of clock data are frequently referenced
 	 * and updated together, and should go on their own cache line.
---
