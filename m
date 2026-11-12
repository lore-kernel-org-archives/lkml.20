Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472521;
	b=xjccL21yab89/WowP5TUSCTxKEOX4NtC37+9o9gTKxAyDYS7gsoGoprr7vHqU9iuAtmH
	 NlE958jmTivlZRYoxKLwbqCxBbmpuwAdn30HhqoBy5EVmdMNVLRJbze0TRMuGQjVtwJH0
	 fpTRVdWMlqXg9skYPsbGrpfsZhU/qpmzh7+9/9hgZrambPVAZUqOOrJOiJw+PFLDB/uJK
	 j0Fw2IYaP1ySJ1DL/Ojhk0grA693lBHj0b8YVEcWcgOoOtew0EFpYVIuc5P9qWrCN+fxH
	 1HFy+fQXeFFBwOiDk6WuOx/YOOcgVj6pOoNcCNWlXEn6lsdA0Lu4GHBEnQltgrZHY0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472521;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UJUOURdvl+sN5OiQ22VQ/TWM+Zq4x/CnWpFitsQcOPM=;
	b=yuSyVWSmKubdQfbBt2Qnwf7QET63UIZXF9zkS4zTjjat4ON14UW4/ISw7EsvrupE8gAw
	 F4qraK4j1dXySh5lffCLHtysG6gdXSrwHGzp0QqO/HBHLgvRl1e6IVmgd5kf1WTU8ufkq
	 J3I2JoxfMQp5SJBC2aJMJfPLkzI+G4Q9GtU8MqE7iUr4aSNjUPjjnd7y808IZJSlpUUUA
	 B4Q4iYpljtOM+jwqkSVRlrQqtBJmIK98IzQeUdCC2mwvE15rsI/LP+Y4QXQaPm8k01GnD
	 vR/zT+gYemyFKnTks3NgPErpW3L13FlDvWE/TlIy1hE0jXbMA9ECtRfc6tpt3Kp6sIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o14NwQVV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39EB606B735
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39EB606B735
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o14NwQVV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ust8vI+5lw5HsVZPQfjrQODdbmhjIN35o0Lq34GvCAbOGyrBEfDAzRUgU6do9MENNcbEqsXXiHq4MvDqtm4eil896a9Y9VgIcaC56Pq5/XJ6KYmbsnQwppv/ciAr644asCgVH0tpnIGBi7CeO/QynU8eacDFDoPUYTWFrusPTcdLdvNK3dqULV8I6P6um/KJtitWlie+aeTMRZzQib0q3lkEzxu98Xl8WzctkGg9cciPNJ5ATJ/FxbLvbps5hWYHorxZSoKcn6hVRXK7O94GEGro9mei4srOXKES2tWXhSxh7hqW/RyDqenZlEb0wCjhBs0GoRTfjEgtrIazPh6ajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJUOURdvl+sN5OiQ22VQ/TWM+Zq4x/CnWpFitsQcOPM=;
 b=JGMOWQ4vvhnTNMMpLZ6xrJ+rQ47+22XgKxlFl+Kkz5mKSqUu/gclSbwjuo1eltSk3F7cxfz/LoNaZHgPzijqp3Zosh0SjBUkWlL4AILl8hwa0OFcvt86mRNQ+gRk12dKu84anZ6ZQ/44rPMGfNwP6V/AW//tDTyeYGvEdE02ApRdr8YEkHuKbDV5wAyPcpMK0XyN6WNBai0E3opmVHja10DjBz7YOiUjHqEhRvZhJAaaEUDAQtkF4qSiUnxsHGhcylWKg6WWFD42Ae89AhSFs2NxtB62z6SxsBOhgyWhwhTlcMgy56BYLKXuTlOZKLg7eNzto/U168HlbNDyx87Sug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJUOURdvl+sN5OiQ22VQ/TWM+Zq4x/CnWpFitsQcOPM=;
 b=o14NwQVVubEzzgOH87BnR/Q1rv/FXqNC++KjpKNEPto6vDekeJ/LdloU6Q4mRAyCZ40NeFlEoHXKDMx0zCdWlrDha29c7B7t+dhe4zhZhKLtYROW+0fyJL8mraCqSlJRX1+nFHRvPM2OqFY04yIJpAXPiyItIUigWFvWFtmE7tc=
Received: from MW4PR04CA0312.namprd04.prod.outlook.com (2603:10b6:303:82::17)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:35:11 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::43) by MW4PR04CA0312.outlook.office365.com
 (2603:10b6:303:82::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:35:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B6.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:35:10 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 02:35:04 -0600
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>
Subject: [PATCH] sched/fair: Avoid transient double accounting for delayed tasks
Date: Thu, 12 Nov 2026 08:34:47 +0000
Message-ID: <20261112083447.25603-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 553b0b75-31c7-44ea-cc9e-08df4097dd87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|7416014|36860700016|6133799003|18002099003|56012099006|11063799006|261026140227099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261021135927099003|261021123027099003|261022075727099003|261026121527099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SsSzgMUv0NhVNqDlCJAXmEUumoAafqY8hDnsxmHWlFyw53K4FA0epBZQqwyOIvy6P6uqAHxH9Us6+hbIxgHDs3U7qwaBhI5PIT2pYxvfS+s3DIFmzud8XG++b7nt+RH3San8IULaJ43ZRy2AHWoSR74zl4uEjU3kvX/NJuI/CC1miuH1ArMwShEh2LBF3rJ+qElvqOLTHchz3EbwR+Sh7e6dQgr4P/uFNjlF2sA2xIn9LtNvosCCBf4FP00rPhkDa8aKLjvgFks+vq4OTewZmDoRTTA+WDYLDJdNZuOHH76ZOYg/VpJRvcTtQ6nVuAILLSFxD1VqQMfWS/7yjsC+uctA8rBVERfLwxDR3Xq/+jyjea6iLwQObvPnY+tKQEgSbBxCcnZVv+7R8egPTdPz/xhEUCBRWNRFo923tYeb0xBILO9HbQenY+TxZfje/1ywnevkN/+XT3O7+SHoSDJcU8XToF9kGdHIt+BosB6S3+YiQNmgrIF5QiPdehtbl7b2571h6iRu/9heGXgZiKwCx2dDwUFcOqT6FAVpK3wv9HLcAIWCHAFUpKYe3g7hnflgO7snL5NJamouXDf/99C5g2zYEng8t1IuGJKrW36c0IkqYyvslw7KtmsSrxmatRZJnC8zzqSWFGGehzl8EWao37Qhiija8AjYYdJAMnIeVXjZbCJrC1AdJrECooFsa+SNhXgXbdOshcIhCGRq3+Wx6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(7416014)(36860700016)(6133799003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261021135927099003)(261021123027099003)(261022075727099003)(261026121527099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cK81kHlaw9fLwdERhLslBbGp3RjuLS8PQhf7qK4rKHYhOtBQHISElmpzYFrG0LuswBQ6ki6KEDsFNwhFj0ZkL7hWeT6Y9fYp0bXd5tg4UbyBg8SAmyZG5s9T6WQ6tH0H8BDSSglTHSXET7ANFlfaB9k1XYRhU/5xyEWllbY1ieY+51aGaifDVnzuPCVVA3VvWsaxNpjqYcYMyJW8ftUJvIjg3hmk2JtXPmS+i3F4z3OO7IRjApf68OC0xC4phh99X/js4q4qFvBbxQsBEAgqHC1+h6aVsoHlWtfsAERu5WaHlSAaFfhTMFLwAX5VUUC66UZtjn/ddoCl8mJzxeUI4tZyiJn20xxz4RlSHoK4DlYE/7sG5LOb3bgpniVQmjpDsH8GAQ3EChqHHnzaNGG3FldIvHKqYQBiQC6tDtpKgjat9b5JX2AGDrJ24Mg7H70b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:35:10.9803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 553b0b75-31c7-44ea-cc9e-08df4097dd87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418

When a task is delayed, h_nr_runnable is adjusted via set_delayed().

A dequeue of delayed task with DEQUEUE_DELAYED would decrement
cfs_rq->h_nr_runnable again in dequeue_hierarchy() and then correct it
immediately in __dequeue_task() via clear_delayed().

Adding:

   WARN_ON_ONCE(((int)cfs_rq->h_nr_runnable) < 0);

in dequeue_hierarchy() after h_nr_runnable accounting is tripped
reliably during early boot.

Although the cfs_rq->h_nr_runnable accounting is transient, this
incorrect value gets cached in se->runnable_weight and can affect PELT
calculation until the next enqueue / dequeue adjusts the runnable
weight.

Similarly, a task enqueue should never reach enqueue_hierarchy()
for just ENQUEUE_WAKEUP && se->sched_delayed. Wakeup of delayed tasks
must couple ENQUEUE_DELAYED which gets correctly handled in
enqueue_task_fair().

Avoid incorrect accounting in __dequeue_task() and warn for
incorrect wakeup flags if delayed tasks reaches enqueue with just
ENQUEUE_WAKEUP.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c | 61 ++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4cc0caee626..e61b365a7b11 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6614,19 +6614,8 @@ static void set_delayed(struct sched_entity *se)
 {
 	struct cfs_rq *cfs_rq;
 
-	/*
-	 * Delayed se of cfs_rq have no tasks queued on them.
-	 * Do not adjust h_nr_runnable since __dequeue_task()
-	 * will account it for blocked tasks.
-	 *
-	 * This check can be removed because when flat pick
-	 * patches get merged as only task can get delayed,
-	 * same for clear_delayed().
-	 */
-	if (!entity_is_task(se)) {
-		se->sched_delayed = 1;
-		return;
-	}
+	/* Only tasks can be delayed. */
+	WARN_ON_ONCE(!entity_is_task(se));
 
 	/*
 	 * Drop a task leaving the runnable set.
@@ -6640,20 +6629,18 @@ static void set_delayed(struct sched_entity *se)
 		cfs_rq->h_nr_runnable--;
 }
 
+static void __clear_delayed(struct sched_entity *se)
+{
+	/* Only tasks can be delayed. */
+	WARN_ON_ONCE(!entity_is_task(se));
+	se->sched_delayed = 0;
+}
+
 static void clear_delayed(struct sched_entity *se)
 {
 	struct cfs_rq *cfs_rq;
 
-	se->sched_delayed = 0;
-
-	/*
-	 * Delayed se of cfs_rq have no tasks queued on them.
-	 * Do not adjust h_nr_runnable since a dequeue has
-	 * already accounted for it or an enqueue of a task
-	 * below it will account for it in enqueue_task_fair().
-	 */
-	if (!entity_is_task(se))
-		return;
+	__clear_delayed(se);
 
 	/*
 	 * Re-add on wake, after sched_delayed is cleared. On a final delayed
@@ -8177,13 +8164,16 @@ requeue_delayed_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static unsigned long enqueue_hierarchy(struct task_struct *p, int flags)
 {
 	unsigned long weight = NICE_0_LOAD;
-	int task_new = !(flags & ENQUEUE_WAKEUP);
 	struct sched_entity *se = &p->se;
 	int h_nr_idle = task_has_idle_policy(p);
 	int h_nr_runnable = 1;
 	struct cfs_rq *cfs_rq;
 
-	if (task_new && se->sched_delayed)
+	/*
+	 * Accounted via requeue_delayed_entity() calling
+	 * clear_delayed() when delayed task wakes up.
+	 */
+	if (se->sched_delayed)
 		h_nr_runnable = 0;
 
 	for_each_sched_entity(se, cfs_rq) {
@@ -8258,6 +8248,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		return;
 	}
 
+	/* Wakeup of delayed tasks must be handled above. */
+	WARN_ON_ONCE(!task_new && se->sched_delayed);
+
 	/*
 	 * If in_iowait is set, the code below may not trigger any cpufreq
 	 * utilization updates, so do it here explicitly with the IOWAIT flag
@@ -8275,9 +8268,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (curr)
 		place_entity(cfs_rq, se, flags);
 
-	if (se->on_rq && se->sched_delayed)
-		requeue_delayed_entity(cfs_rq, se);
-
 	weight = enqueue_hierarchy(p, flags);
 
 	if (!curr) {
@@ -8317,16 +8307,15 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 static void dequeue_hierarchy(struct task_struct *p, int flags)
 {
 	struct sched_entity *se = &p->se;
-	bool task_sleep = flags & DEQUEUE_SLEEP;
-	bool task_delayed = flags & DEQUEUE_DELAYED;
 	bool task_throttled = flags & DEQUEUE_THROTTLE;
 	int h_nr_idle = task_has_idle_policy(p);
-	int h_nr_runnable = 0;
+	int h_nr_runnable = 1;
 	struct cfs_rq *cfs_rq;
 	bool dequeue = true;
 
-	if (task_sleep || task_delayed || !se->sched_delayed)
-		h_nr_runnable = 1;
+	/* Already accounted via set_delayed(). */
+	if (se->sched_delayed)
+		h_nr_runnable = 0;
 
 	for_each_sched_entity(se, cfs_rq) {
 		update_curr(cfs_rq);
@@ -8417,7 +8406,11 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 		rq->next_balance = jiffies;
 
 	if (task_delayed) {
-		clear_delayed(se);
+		/*
+		 * Skip accounting since set_delayed() has already
+		 * adjusted it. Just clear se->sched_delayed.
+		 */
+		__clear_delayed(se);
 
 		WARN_ON_ONCE(!task_sleep);
 		WARN_ON_ONCE(p->on_rq != 1);

base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.34.1

