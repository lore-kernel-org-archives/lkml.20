Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793095135;
	b=yD+IRxlvmi+YsSeC+9U1xKTHyib4NutFemGrCB9/Ppzrqbsu7EjmPiwmGfIunV8zvxZa
	 L9CP7MFAIubKoA+EDSek7KxPgQCmjVi+L41K++vnTyZwMSCnECXDM4IgzvBfRLJ/yxVmC
	 qPDf1zy1BODj/UOFFRogOIb9Xe2RVU4eEK1e3+d3rE5SiU+83tu8ajscBUf2KwNxyovPQ
	 16jQATHsy/mx9P+6gQGZxypvBdTut0Y/JW+l881NDuZP4nAWI6bMU2LvP7tpUxJ17pyZd
	 C4gog2WEMS2OykVhz8REDwj/W1HTTaFBdjMYr06PS9biyAygVECMBz34845YPm98uRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095135;
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
	bh=S1iyfLwYUhq5jn5Rx22SPivmQ49lbsoqGhK757mABTw=;
	b=4PEn61nR439hGkhiJ8fBZ200ngh/1AhvX5MxN/+GeJrSKH4M+YUYFGdQz1f2rvqyo72e
	 dbXHIqH+wHzf2h1rA3jUQXI7CZEzouPmHOWbdjdjIUrbWpe+b+WZY30+XYVI++h4eRrFY
	 w78H4Wg9+7smX89l22rwk5apUdo/ViXQljDlX2tBY8CZsFYGeHzepNFeDfMjId3SdVEj1
	 kAnh3wk+St8foXKvZot/MOOAIEwUZg0I1SZdUGrKAQb60JKSouuGnhYwHXxNIpQkKtM4I
	 wvgS5+L33I0Av81yMDrTrmJCbJHV5a2D7pzNDEKfvhtQXh3fq629JQP/ZHzGav7ysqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=i6+3d998;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.55
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB23606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=i6+3d998
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QygKplGpsi2sPKTuWdSblJ5ALCJHWeQD7DnzLUDBM1yJ6n1bsg//15938WjBF1cP65ttSFRisik5dgWYgCCKwr2OhHyX6Lf7gSuV9fFz7dxdJSZvZx00mgQdBzLuEBmEJE+uGDMlFF5wIYxtRPjgrNowIDomy3RCEII5huIurLmYnKLn5F1YgTLtTJ1isWH6XENGCvmFoafTaIAhfGrg8jMw1cBS3DustmTmRiHTUouXOpXfAF8+ASH0UJ4NmCcLJ6+C4zfh5ojOVFPIIqrgTh3qGw5RzwiLJm6okXKkLJ4LZQr6P+wQA26930p2tc/Kq2fcCVwKUNg+pVk1Gw1zlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1iyfLwYUhq5jn5Rx22SPivmQ49lbsoqGhK757mABTw=;
 b=PHaKhbUVlYMsV8dzGenym7QZLjM3QyJd7JnKn7iLJMbZNkdQf8S3j/fYt8+kIq4bKQbKXAYMALB8maoMtdpxLEBxAdmcMnfAMPooBFxiLuCPPlMiOB6jjNRT1Izepo36yrSvUwwM+RKq/vFemgbwGRFxa+NRekQXyfoYP/AvK1zP6pQzIgOC743MoEm8+kJmJH0rrKXqW2Q477vWUCIZDhMGb4Nilut6JI2gODYg0VYWDYGH9em6YgbU8581TGdIDKFODTWvt9qYs4Dl94RIGfSqxDIaVZbVyz66huGMVmOwB9sINIoVbGYCeF+wuguvCpgn1zH6VPO89ngoiRLQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1iyfLwYUhq5jn5Rx22SPivmQ49lbsoqGhK757mABTw=;
 b=i6+3d998/skpvrgtFdBBPREI/n5H6Tqi48bCu/N5uUsvA1U2J+SjqvriLdQraTvPGuhiao2e6FYZH/2iZDqczU+B6/1M7aDDwMwYO9LV5pCr1mV7X6AoVUbwZzlVP9q/1jRgf3Vk48p1tVuLiqxtIJmhGHfl2aFk2v+R1prwqcs=
Received: from BY3PR04CA0013.namprd04.prod.outlook.com (2603:10b6:a03:217::18)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:58:41 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::56) by BY3PR04CA0013.outlook.office365.com
 (2603:10b6:a03:217::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 09:58:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 09:58:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 04:58:40 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 04:58:36 -0500
Message-ID: <4c8b0413-2ade-447f-9313-ff51dca7c7c4@amd.com>
Date: Tue, 27 Oct 2026 15:28:30 +0530
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
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
To: Kayra Cizmeci <kayracizmeci@gmail.com>
CC: <albin_yang@163.com>, <albinwyang@tencent.com>, <bsegall@google.com>,
	<chen.yu@linux.dev>, <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>,
	<linux-kernel@vger.kernel.org>, <mgorman@suse.de>, <mingo@redhat.com>,
	<peterz@infradead.org>, <rostedt@goodmis.org>, <vincent.guittot@linaro.org>,
	<vschneid@redhat.com>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
 <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
 <auBzeRvGD4irNz5a@scheduler.schedules>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auBzeRvGD4irNz5a@scheduler.schedules>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d49237-36ba-41d2-4ce5-08df3410e129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|376014|7416014|82310400026|36860700016|1800799024|23010399003|18002099003|22082099003|261026140227099003|56012099006|11063799006|4143699003|10067099003|261022105027099003|261021123027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	snBvLZm7bGzSKsallN3x98fIYMVVgp0gCYfYJeYzdraBJUiNwYIpRkklen7zAA4tGh8Ms0N8FndzwsxUUsdI8Tl6twW79yDngK6jiZUV0iZHx0/d9vBiO4rpuAf2ZijrK72SUMgoOmIe2ArfJk0iv++P/EFnbcQ3YemNMv8thOq6CsODiahX9Ctg9/3nrMKHbssN7/AeQv4v30zERHiJlFn5sE7RswDpsHXF6n+OJy9LGf8zT+BJqzjmQgKHPeeaunDPE1ETDjdhpN4LRvzwoCLPcUGFB6w3N2fIp+BnQUg8Ga0WymJSAqEJNO9Vz49kRFes/SilqopRKppZKRQ0FDkgG52ccvR+HRWeJfPPrlLZJ9J36MrcC4z+mCG29QOqlhZdSA4ID7vrhQOT/YC8ngOKxMvaGaX1mFMEmtwb1c+iwV7i7RSoWuMLNhlDyQxD92Fa/CEUDMqtqCc5DPpN3jei4oTw3FBZLVd7rDpFxXJa7xPJfoG8TC0UpKhoyAiyaD78zm81FrUW7jfAmtXWl2qTQ6Q1U+lCNIT6uncsnbVdJgZ2VdXaI2vxJT9FU8LNUAJha+0xBhgfiBMT1Jzw0qzutbmUDAJt1ADvXEmJSjlWQd1nyYu2i8Va5ZZO6gK23lMdd8pVB+gsispfnJwhtuuIwo/dLHopGYAd5AumuqbbFnNgOHv80sI6NjGbxCgfnHP/66iVIop4mLT8fPchVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(261026140227099003)(56012099006)(11063799006)(4143699003)(10067099003)(261022105027099003)(261021123027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pCtam08eCEgHxZFYcA7qcA7zh3jO0LLyE5pY8KafbWHereq6KbSj1hUSJ2vaxnz/5lPCWeCqdfXf8r6aVFhJ4KLbws3IWXrjQ3lfwTuGyEofRl5yNfJmo9bc4BgMBAzceR5al6/RRHNH2UA4QNB8dBm4fHkOWfL5kLkyTHSYc4zcOezDqpcmuufjA1Kr4ae/kC1/UC19p0cB++2dT0yTMDsgelnjh1eOw2EhB9xauc0RYMk0+ATvfQZHZKmShF+unoUWWaAp2k+U/v2Cib41lhOL/JNIpgtRWDmDpTKPStgyg/gHSbN5JLrtmWHSF/J0QdwTX0VMuuT2CrOntFFP1Ie+8TcTAUOx7N9fN1gDqU1H8Bj/CBgNhs0hrDd6c+AiwiWNyZ6ZyTlp032kb0CN4Nq8XorPFTZ+HA7Gf04QCnOg6pBln3PJJ0W+AtozYytm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:58:41.0332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d49237-36ba-41d2-4ce5-08df3410e129
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

On 10/27/2026 3:23 PM, Kayra Cizmeci wrote:
> Wei, what do you think? Will this work for you?

Full diff for convenience:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..4b99ef5b3b2d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 		 * it should preempt the task that is current now.
 		 */
 		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
+		/* Start accounting wait time. */
+		sched_info_enqueue(rq, p);
 	}
 	ttwu_do_wakeup(p);
 	return 1;
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98..c4c624deb25b 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -239,6 +239,15 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
 static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 {
 	unsigned long long delta = 0;
+	/*
+	 * If a task is blocked (blocked donor, delayed dequeue task),
+	 * do not account the queued time as runnable. A task that is
+	 * blocking would have already cleared the "last_queued"
+	 * indicator from sched_info_arrive() when it got a chance to
+	 * run on the CPU.
+	 */
+	if (t->is_blocked)
+		t->sched_info.last_queued = 0;
 
 	if (!t->sched_info.last_queued)
 		return;
@@ -290,7 +299,23 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
 {
-	if (!t->sched_info.last_queued)
+	/*
+	 * "t->is_blocked" is only cleared after the enqueue is done and
+	 * the task is woken up. If the task is blocked, update the
+	 * "last_queued" timestamp to that of last enqueue - if the task
+	 * is still blocked while it leaves the runqueue, this timestamp
+	 * is ignored and is cleared at sched_info_dequeue().
+	 *
+	 * To transition a task back to blocked after wakeup, it has to
+	 * run on the CPU and naturally reach a safe preemption point.
+	 * sched_info_arrive() will do the correct wait time accounting
+	 * based on the last "last_queued".
+	 *
+	 * Any movement of task after being marked not blocked will be
+	 * correctly captured as queued time at enqueue + dequeue
+	 * boundaries when "t->is_blocked" cleared.
+	 */
+	if (!t->sched_info.last_queued || t->is_blocked)
 		t->sched_info.last_queued = rq_clock(rq);
 }
 
-- 
Thanks and Regards,
Prateek

