Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D854A7CB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905132; cv=fail; b=Zq25WG5kECcg9IjyJd2nRRHT418FCoMt9BrNPahzAdPi9vDppQC2efr+yXCpwe37XsbLrloITLX587UShUoMHQLbUDHSqU+INFPJdFFympXQyzCzvBKsQEaZTBjCvlW5rWjLJFUvWkAkHtXcqK5IhgNwLQSdKgbzbaeC2qJY60M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905132; c=relaxed/simple;
	bh=bdyugc/R+tPeWYGk67wDuHxRHAV2fw3hvIZb2boXATs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BiUjjgfWkFAI7N6pnPAFa2f2YPDkWNVV/vXk4w4kB9Zs2hhfUnK9/hHD4nAO3f14lLw3g+sq8ymBHNTi6sNxT3yOpwxzNJep1vsYqrzy9R3fXT2+tYmKR8VVR1ZD442py0q2BsYfBn1cEDAwk8/wj41ZO6ovc3HizuvYJV9s4xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WB0Cjquw; arc=fail smtp.client-ip=52.101.193.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WB0Cjquw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj+GoRWKnDUuc0GFEYgXCxVpUWjHJLCSv/J37Gqriz0BY3GrKiR8cNSWsqvjWHajcyr9PZkPPsHO+qP11zb0/xzlfwSNpYyUhC7WeznNtyucqPrdZhV3Ckqg7WScaSq498ecTbV8o+KHVipiSjv++Hax5vDZ6859DAoDmmRqjTpHg4do+XsBp/y6u/bohdDAOw5YlvX2wWf52g01PB+DK0N3dSI2/UjFz8MC6T9UG7UObNXzfSJ6eYhb0tCMAnIOs75VxAyNr5t3w2Ui/Q45zdGRF3E5VFjUi93raN2WYHOpNN1VoOyO1JeXYjsaLfS+cuoQONJEOmTw4I3V3f+1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2w7lMxc+Ff5qaJCMEgeiWWndl/lr1pjtcj9f8oaoNw=;
 b=uW53lbsUD8Fw9qQuxLV+fZBjYBpi0LrS3XW2xcQtWmrdKVwLjMcBb3+fA6tcUKqj4vk1h+IL4egpQYXzJYnIC+VJFwYtLKy4onYkAyfdau1KVUXN+IAZI8aw/78LQSNiHsCamC3veJuEBuwfX/3SlcvBrPemvqn3MQSspPe2OmqM7ex+2Q724K/jIw05bIKWf4nbEBfzQA7Fkm4rzvvlmcSHi+zDGu+o9z1Bln/HZu/zBoMozvn1Z/pfXD9sBRjKV7SEq1Of74rzo2HC2IgUe6j6epEoNfpq2nTCUBKkSX3+2w6nFTxl+P8595z2go3mP8lpijQOzL4Y/eWk0vjWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2w7lMxc+Ff5qaJCMEgeiWWndl/lr1pjtcj9f8oaoNw=;
 b=WB0CjquwWIx0r7sCnBeyB98KZBD+9kcdlvOBiFhfcTRLTTmMEhY4PlEglGZ6j/WBUUr3BhU5fjr4z+ze6xxz2MabJxB+lABpa14Lhu5l/qmOXdBnH222nOrw1pI0IShAZpGaATVIioZbxF9nO3IqJ18iOTWC+6mixZz561ZJMPY=
Received: from BN9PR03CA0123.namprd03.prod.outlook.com (2603:10b6:408:fe::8)
 by DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 15:25:26 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::26) by BN9PR03CA0123.outlook.office365.com
 (2603:10b6:408:fe::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 15:25:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 15:25:22 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 10:25:12 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<kernel-team@meta.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH] sched/core: Call wakeup_preempt() for queued tasks during class change
Date: Tue, 13 Oct 2026 15:24:55 +0000
Message-ID: <20261013152455.9039-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c499d79-c194-4d48-5e7a-08df293e32b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700016|23010399003|7416014|376014|1800799024|82310400026|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	pOHiYVV6iFHQHrkgS9SEFy+aMocidys7fePRufsPBsbeYnTHDpqWf6ICckcCIeCSACqosmNhH4HDE21e8eErk4nyoSb521iK8G5XOD43D56BS0IRt8TvQfWDuv7+W+YDwPBnMpBMyxaZOWc6bEkw5SBv57u1EomZQvIK02LNq6bXLeUq3VyYNeecT+pLT+ktk1P7MmkkUwANF6DGiPSvpn853Enx9pCDGDLl5Kw3zi6O55rQ9ymSmWH20MaLeWrvpRTzIyIoT1F5jONOULegTwvTujoL6iRkU6jBfLNCUxbf7dC/HQFhdr52skyxntY7wzH1STAvDCLEaM9IwvFnWW2t0uKyk+qkr71UeEVOizi7yyr211L1lOPb/LBofJNL73Tc11FWPIlt9Ix0qLpGGdJAqrbqZ+E4R/IwRkm+R4RU8dI3+0mth5JQkjA0TvSxop/gKyLqZYG2rv7k7gA+EPTQEcGX1/o1B8vWCrZv0fAMsyWTjAZHGvdkXP/Zvz3KSggJlkhn72HNQP/+xcqNrtHuIe/ICYf8dCSMAwi+VQE5DlaKVE7NPIb32PcdsfLe7+by0aW+D3wE/JqTWXebKV/JLnKpXyjwZgny6uN98sUnpgSq14gjpLWxaiIWi+14emUJnfPpdyjZUmtceCKsiednWU3kr7gNPiJAJFvvIW0DI8omE4gpY0OIcbkPXAkXq8Qa8IaToWTmQV6hriirJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D9Nk7br5BfKFleqLJxl1pEGLfFmsklY3VbOST1pJTYUUAjbnN/phaPi3e1nePdrn42wqZ5XqrSHW8aucwyQWOQD6EpCh3+nEMTtFFz+ATqZZj9OcLizlkhn5j+XN3Dr1Yg289bDL2G2IlSCAsjMHJ13GW+c5JzXfYzjqZaAj8tqNydk+JnSs/k12XxeJN/aBSagW8TmX2P9hx/SYsRa3sVOSDcTpOKi4f9+xkSCyTu/LQ5q5IoayOyVz5OlaAAJnc3WfKAZN8hIXipMWuBDZOZP5sUe9ZXAblTfhK04LZNQvLaDMxfDx60m8u+PzUAMFJxBiBLzwxy+sD1sVl2gTWDGpABU4H24Vd7QZisxPtlRG6io0q+EnHt5OwKrVYpMDswyn7sFV4acQ/UUGfgmekTEU/KEZ9niXAhBkxjd/Lrs/evTItYttqFjKgEzMSVmM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:25:22.4976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c499d79-c194-4d48-5e7a-08df293e32b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311

Paul reported recent RCU changes exposed a lost resched where CPU idles
with a rcutorture thread waiting while being completely runnable.

Dumping the rq state at the time of idling with runnable tasks showed
the following:

  rq->next_class = &fair_sched_class
  rq->nr_running = 1
  rq->cfs.h_nr_queued = 0
  rq->rt.rt_nr_running = 1

Although the waiting task was an RT task, "rq->next_class" did not point
to rt_sched_class and was stuck at the lower priority fair_sched_class.

Inspecting sched_change_end() revealed the following race with
__sched_setscheduler() for queued, but non-running tasks:

    CPU0                                   CPU1
    ====                                   ====

  __schedule()

    /*
     * rq->donor is a fair task that blocks.
     * rq->next_class = &fair_sched_class
     */

    rq_lock(rq0)

    pick_next_task()
      /* nr_running = 0 */
      pick_task_fair()
        sched_balance_newidle()
          raw_spin_rq_unlock(rq0)
                                    rq_lock(rq0)

                                    activate_task(rq0, p)
                                      /* p is a fair task */
                                      rq0->nr_running++;
                                      rq0->cfs.h_nr_queued++;
                                      wakeup_preempt(rq, p)
                                        rq->next_class = &fair_sched_class
                                        resched_curr()

                                    rq_unlock(rq0)

                                    __sched_setscheduler(p)
                                      /* p is moved to SCHED_RR */
                                      task_rq_lock(p)
                                      sched_change_begin()

				      rq0->cfs.h_nr_queued--;
				      rq0->rt.rt_nr_running++;

                                      sched_change_end()
                                        /*
                                         * p->on_rq = 1 (ctx->queued)
                                         * but p is not rq->donor
                                         * (!ctx->running) hence
                                         * resched_curr() is and
                                         * rq->next_class upgrade is
                                         * skipped.
                                         */

                                       task_rq_unlock()

          raw_spin_rq_lock(rq0)

          /*
           * rq->nr_running = 1
           * rq->cfs.h_nr_queued = 0
           * rq->rt.rt_nr_running = 1
           * rq->next_class = &fair_sched_class
           */

           if (rq->cfs.h_nr_queued && ...)
             /* Above is false */

           if (rq_modified_above(this_rq, &fair_sched_class))
             /* Also false since rq->next_class is still fair */

      /*
       * sched_balance_newidle() is considered to
       * have failed to pull any fair tasks and no
       * other wakeups were detected.
       */
       return NULL; /* pick_task_fair() */

    pick_task_idle()
      return rq->idle;

    next = rq->idle;

    /* Preemption indicators are lost */
    clear_tsk_need_resched(prev);
    clear_preempt_need_resched();

    rq->curr = rq->idle;

  !!! rq->idle switches in with rq->running == 1 but !need_resched() !!!

In simple words, enqueue, followed by a class change of the newly queued
task goes unnoticed in rq->next_class indicator and
sched_balance_newidle() sees no fair task, nor any higher priority task
enqueued.

The above sequence will lead to CPU idling with a runnable task on the
CPU.

Call wakeup_preempt() for ctx->queued cases in sched_change_end() to
re-evaluate rq->next_class after class change (ENQUEUE_CLASS) and set
the NEED_RESCHED indicator accordingly.

Newidle balance will correctly see an enqueue of a higher priority
task if a queued task was upgraded when the rq_lock() was dropped and
will retry the pick.

Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
Closes: https://lore.kernel.org/lkml/8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop/
Fixes: 1e900f415c60 ("sched: Detect per-class runqueue changes")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
Patches are based on tip:sched/urgent at commit a0bb6fac53fa
("sched/core: Account PSI IRQ time to the execution context, not the
scheduling context").

Tested with sched-messaging and Paul's TREE01 reproducer.
---
 kernel/sched/core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..1754d9f95f2c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11327,17 +11327,16 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		if (p->sched_class->switched_to)
 			p->sched_class->switched_to(rq, p);
 
+		/*
+		 * Check if the task can preempt the current in case the class
+		 * was upgraded. Note that none of the switch*_from() methods
+		 * know the new class and none of the switch*_to() methods know
+		 * the old class so we must resched here.
+		 */
+		if (ctx->queued)
+			wakeup_preempt(rq, p, 0);
+
 		if (ctx->running) {
-			/*
-			 * If this was a class promotion; let the old class
-			 * know it got preempted. Note that none of the
-			 * switch*_from() methods know the new class and none
-			 * of the switch*_to() methods know the old class.
-			 */
-			if (sched_class_above(p->sched_class, ctx->class)) {
-				rq->next_class->wakeup_preempt(rq, p, 0);
-				rq->next_class = p->sched_class;
-			}
 			/*
 			 * If this was a degradation in class; make sure to
 			 * reschedule.

base-commit: a0bb6fac53fa7cf1cadb487b43d4c9276a6b82e3
-- 
2.34.1

