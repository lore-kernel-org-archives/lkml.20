Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074328;
	b=ho+D9OPgJjQ4AD3QpDFH/I7RgImQFSoudWHkCcejclhtGECSIwP2vGR2cbzjBXsxxhx9
	 f/l+uEWSn56NbnDZMuclinZWc9b5K97Nr90/0GY5soqN8ML/FWBLXnGRjmjdLY6a21J78
	 VxWqwdG40aQDSejWe/kSHWoiiBpinY7vPQICmVTkePRC7oaF1uIlpbBv5tS2l6+5NGWeR
	 36x13rWEpSdo3YK2yFvQQOYKM2oAM2guP1GMJo7qvsxm62WAp+dmNQCp413SOU1ItgMBT
	 o0Fa3PxaJ6j4newcocV/dwMS1n56LyBdZF3tXdosJZflEWBiRaBcjlBSe4Mlk2Hlefw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074328;
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
	bh=ydcTbzZ/Z9EoVi530C2a/e5BGbY54Ew8wbkogayNVYQ=;
	b=UVNZOOm1gEPOfjm7T6FoxtcgwEg/HThtvG9qJ+zo93I5ZRrdxV1O82vqT25wfNrfMCjj
	 2ywyOlr/nyUGtl5irJVRSgcLg4Z2npXqzAKswHeqsKD4pE/d1HpLTHC1CLub9tq0ozuGP
	 m21S+U6v2dcnhUc6gwvdOxhglqftzF6z1zI5aBrrUAmU0k1XnJGQQmTLIejDwsGz9XMe8
	 5QC9WYr9xGtM1xQ7VnCn5JpaV13vVIcdAFIprfUXcNW4JQNT08f5gSJwElOebR/n/BTGY
	 BH2MlcKJmrTy6sTVLwCI39wPh7lF+E65mnE+drvxd3fab0/ShKJR40laRE5NzLZswTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wFaDDYbS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1440606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1440606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wFaDDYbS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXtFRzEtU/ilG3LtLQu9OKBSKS5N19eclGAOcQbXAX1DlARS1GzhzO7r4t9jrC6xGP0SxmoipdD/2WLajI5OdRxS+EEJzHQFQd7UsSxYwTWUIHF8zJ5Kwkv52+0/8Q8dQcFGV94ojU5znSldCF/61Ay/4QHEUaUkmFj+uzryFr/abHX1SFAE3Dkkns+//RQ2+D3KqZmHZmICJxxzxvSGkkA/Rlhc57AGEqvbclwP0LhO2evVH6nXO0ZL8aDGFQ4lL9AeyfxqkvyUQO9Is2NwikEVqADHGvQ+HPUMrcqMBR3YfQgfHnR09ft4lR0kTkEgDWPJGuUc5BZopsciOurRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydcTbzZ/Z9EoVi530C2a/e5BGbY54Ew8wbkogayNVYQ=;
 b=S+vryEbJikDlgMh6UiQ6QvPA7Pu4igsfC/52ocGRHzuyiMhO2FcV9BTI6KPYo0AHVZgl67mlAslgRWDlY+BhZF4mNdB6cDgd6TkbnSuQ3FI9qrM9ejwtvNOOSAGG+EZ25s/Uuq8+qtU5OLkLhE/ILKIDZFvKPiWbKVWfXQI5r/fm0GcTEE0N939Fv4mbDHUJ8iDA7fu8Tk9zVsN54JeVCMKCZOu5x9U/oV67yi2XT/8Z4wINDgLESpICH7raQtC7F2bfIpQw9r5WPfmEc21V+9v8rjbPmyRYiHbv4EnZZqJY+yO+s3vA2Z/wH3+3igrZ6MOf8TPZbAnFAcrFCRCysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydcTbzZ/Z9EoVi530C2a/e5BGbY54Ew8wbkogayNVYQ=;
 b=wFaDDYbSeEzwLUvYQ1nzQfUtDqbIwjM1OOJIb8NrLSiDnHhf4718Lri7tGreyqz6L32gBag+Bck4k6VEWbSdLewgIO7AJgvl36U2pDLWAQeRPFJZAjX9secVvTqu1RoBUbaiGqC/0AaQOkfSA2QWsgNSAFcDtwg1FtSJOztDRbU=
Received: from BN9PR03CA0269.namprd03.prod.outlook.com (2603:10b6:408:ff::34)
 by LV5PR12MB9756.namprd12.prod.outlook.com (2603:10b6:408:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:12:04 +0000
Received: from LV8PEPF00000065.namprd03.prod.outlook.com
 (2603:10b6:408:ff:cafe::8e) by BN9PR03CA0269.outlook.office365.com
 (2603:10b6:408:ff::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 27 Oct 2026 04:12:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000065.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 04:12:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 23:12:01 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 26 Oct 2026 23:11:57 -0500
Message-ID: <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
Date: Tue, 27 Oct 2026 09:41:51 +0530
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
To: <albin_yang@163.com>
CC: <albinwyang@tencent.com>, <bsegall@google.com>, <chen.yu@linux.dev>,
	<dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>,
	<kayracizmeci@gmail.com>, <linux-kernel@vger.kernel.org>, <mgorman@suse.de>,
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>,
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261026133831.4111227-1-albin_yang@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000065:EE_|LV5PR12MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d79466-d9ae-4921-1c53-08df33e07581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|1800799024|7416014|36860700016|376014|23010399003|82310400026|261026121527099003|4143699003|11063799006|56012099006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	5pigh6/r7FSgvVAYLa2djBkLJia+MBMyV+VV4ljq0ncmffPVlsDuPgxB60AmWyegFEdGf4REVtg8//bLuSse9psFF7wCYP3ji+HtdaPRhBlC19s/6/lbv9dw2qpoK6qipKuAKkeMfiXWSrspFbI4jMgtX/ajW2OI5ifMT4XEeSZ+02IwF+9tE6R9z2QLYDxb/nQ+w89ixaLH3ixWzOlxwjAtFeupr++52aLuLzsZEcAW486Af3vf9vUbxBZpfu2vS6j+aVA8mcPZgV74vDhH+1sZXMZcsozecsjX8BWoALTRXSvpzV64FY0WpF5HzBbwT5n+eCNjm7rMC60JsIfRT8tjnN+VLlSE4dGcr7YA4EJJ9M3i3oOOz3iXXWrB3U0S8DVZ7TdC/SfnMbQSw5Ewro6geSrpD7b7UxXFmzQWpuVBDDkEOScjN1njthmJpEbY5PtP/AxSXPaTHZc6KScZ8T2JeE9RPf2mpDsWcQNOzUUR93yyaLTghSMUvliMWVmnXqr7pK1Ihbv3HhqzLWR9fYix2m7kOp4q0gnuAv0aCsLzSGcefw58utYxg5Ry1IcLBsiC+zM2i5H001XRH7YzrfFOHTyClPnssa6xgiUTWX+mhktxouuRy/GMQXtJczI7LF+2TOfqtvGHIkN7+dTSlryKZC6r+Sm8FmcafxNzh7Bjoj5XY0NK4MgaDrsSWrp5MgMAmJj3wHIKRREaLpw3nA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(7416014)(36860700016)(376014)(23010399003)(82310400026)(261026121527099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ka08BDXSiSb+GZ0KbDZAVlsTViXakG4nIGOxDatTge93iXgUfZmCSbJPbE4FrI6t90LWrDbiisrhICAE5bi8VArQ7xmtXHP048ZPNKM3vZbejydVQZXdlvLbv12p8MhYSj4cwd2SJXweO+nbMxohx5xNS6ghxB+jCfFuOba+M57BWprpg6C7E2nOtr520tS2q51zYdrVpB4+5yQeOY7CvC5PIeiQ2gaKODyqT8bRDeMsfFFzbj/3IWm6QzTxtqhsI+CDQLOgwUUM/KMdOX3RNvrjlYtvbWNNz+3fTZV6v/hTTDp1GVAVVA/UPf25OYAzNLGI6V7D2MTWOeXM7pzFtvN4ZrECBQFZWVaHfQMiY0hxraWN6Y/1qdkwfbXFNBBpMHPCr8p69oWdevWdlxY/+jmTRPJ5UVQbEzcZ4bJ2MBralq8cGi8AraYjh6c4nb8K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 04:12:04.6553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d79466-d9ae-4921-1c53-08df33e07581
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000065.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9756

Hello Wei,

On 10/26/2026 7:08 PM, albin_yang@163.com wrote:
> Hi Prateek,
> 
> Thanks - using is_blocked as the single indicator is certainly cleaner than
> piling up exceptions.
> 
> I rebuilt your diff so it applies cleanly and gave it a run. I'm afraid it
> does not work as-is in my testing

Thank you for testing the changes!

> two problems:
> 
> 1) sched_info_depart() now calls __sched_info_dequeue(), which no longer has
>    the "if (!last_queued) return;" guard. A blocking task has last_queued == 0
>    (sched_info_arrive() cleared it at switch-in), so delta becomes
>    rq_clock(rq) - 0, i.e. the whole uptime:
> 
>      cross-cpu: blocked 169.80 ms, run_delay delta 169047.52 ms
>      same-cpu:  blocked 168.70 ms, run_delay delta 185515.00 ms
> 
>    The control is affected too, so this is not proxy specific.

Ah! That is an oversight. I didn't realise arrive clears the last_queued
and yes, doing it unconditionally will account the full uptime.

> 
> 2) sched_info_enqueue() now arms only when t->is_blocked, leaving ordinary
>    runnable tasks with no counter at all - my sanity check went from +39 ms to
>    0.00 ms in every iteration, including the control. I do not think either
>    polarity works: is_blocked is still set during the real wakeup enqueue
>    (delayed sleeper: inside ttwu_runnable()'s is_blocked branch; donor: cleared
>    only later by ttwu_do_wakeup()). So it can gate the charge side, but the
>    arming side needs something already cleared at wakeup - task_is_blocked() or
>    sched_delayed.

Ack! I forgot task migrations. So based on a better look, all we have to
do i start accounting when the task becomes runnable again (p->is_blocked
is cleared) and don't account any time when the task is "on_rq" while
being blocked (p->is_blocked && p->on_rq).

> 
> The delayed reproducer shows 0, but that is easy to misread: it measures only a
> delta, and the bogus depart charge lands before the window. Its absolute
> run_delay is polluted too. (The 0.00 ms sanity figure is from the proxy
> reproducer, which carries that check.)
> 
> For reference, !sched_delayed && !task_is_blocked() gives 0.01 ms on the proxy
> case with the sanity check intact (+39 ms), and 0/20 on the delayed reproducer.
> 
> Happy to retest whatever you come up with.

So all things considered, I think the following should work unless I'm
terribly mistaken yet again :-) I've left my reasoning as comments:

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
 
---

That "t->is_blocked" check in sched_info_enqueue() may not be
necessary either but I've left it in there for now since I did my
quick testing with it.

-- 
Thanks and Regards,
Prateek

