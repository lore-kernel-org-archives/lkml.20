Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D9B2D8796
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789968794; cv=fail; b=BKkN00ZSoN15GsprmwzSQnSe1IUQLxv0nG2JQbNvaziVPQMWXytQhtrSuT9HP0Q4ujx6p7lI2565ijB8WDveFdFWrHUbMZk5PFHYsx1EnR+wrVjF+S2H/O0t+5bn4LNQKgZf/5xBGX1xJBho/iddixQ4COb+NFsX4x6ISddVTv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789968794; c=relaxed/simple;
	bh=5Tva8Duxz0fpsSEoANTvxkP9wxr/JACFKLm70M3oPSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YDN0FSEOwXtvC1UggA2ZyRtqWxk0l6F8CSaqIK97momMUDNpt8U3Lq4w9zPnTI2m5u9DZuGCR01R9XfMlfrL9BQunDDSEXrGIMsjNh9D6+RuanE4ZckCN86AP4LTavSy/M4rEc2T0vRGHeL3yuimlmHdFGQp73yFCnGldvvWDDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dhZo+yDi; arc=fail smtp.client-ip=52.101.53.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dhZo+yDi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/pSTrO7XgFqvqRjH1dzeknlf3O8r1ZhoDHCZLCyJN3x7iTp8zD3ZMPCVDCSXqCH4A4k9B3wJjz0bTDl13/xQ1Q/bNDjCed61LjPs+RqrKPAJyzxnhEO3mNoS9JHMln17Lp2RNWVcKLSooFLj24W5Lj+cWLeY4uepTRLUXCXZeRzVZCH+L58gK4+xSBumrjNKE6MQItbVIvfbflLfS2oDcT+Vr4anPQ+idomDG1x4lIZCjseaOZSsW1kaB0Gsf8UpV2XVNVdUZDnFVYtPL3tElw7e+7GFwPtCn+wiPlOAMdPneYe7CLjnqogla1QxU+5tVYyeXExie4qaW4JUhgR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bxuwu/qVHOspkDDetNDOLYOU/s0RudMioSs4VnpXDk=;
 b=EumBzNn/6B2ZRbik35we5b9IwqhN9SAw/Iai7IeT4kd5X0szkS/yIXmUh+vAOGe2szCWUPquTuA1mIAu2L7RtaK3N3N35A3y1xqELFHPkgK3nY7HwJyMyFi2qTTWPhRbXII7U4yYIiB+BXzefOsqLOaGFSKcZ93yGFR+xvLkyAOwHDAHENZGO25wAtdlsUYEmHLhdjcFEWtI4i2GhlxIXy+HRzqRUlEyfFrZxnfmDOmn0hrIa8TBzFNmG5Ad45GVp69kOZV2lPypNOaKHOucL+Lvr2Zt0889wLUIWtE3FyYr5mO3e30xy1fiqYGc/q8POq1LEXEDrhLoNrE+p3D55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bxuwu/qVHOspkDDetNDOLYOU/s0RudMioSs4VnpXDk=;
 b=dhZo+yDic87X509iT1/wnUS1TyAt50G93QA0vfvJg14n8cJUFrmNjPdSlmOdJr8LthxwlE1/P2aDWbPNQbA+LO1oL0916LaztmLGG7sYrh9GttR5zD71I+/vhFy/Flw/exTmi4BfiM6bTm/aGd6zOid3fzLhzmvKxRbwhavj+do=
Received: from MN2PR15CA0051.namprd15.prod.outlook.com (2603:10b6:208:237::20)
 by CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:33:09 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:237:cafe::4e) by MN2PR15CA0051.outlook.office365.com
 (2603:10b6:208:237::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 05:33:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Mon, 21 Sep 2026 05:33:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 00:33:08 -0500
Received: from [10.136.46.195] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 00:33:02 -0500
Message-ID: <fd2e3f30-ba51-4b2d-9e62-a5b81dc972a9@amd.com>
Date: Mon, 21 Sep 2026 11:02:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/stats: Fix run_delay over-count for migrated
 sched_delayed tasks
To: <albin_yang@163.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <chen.yu@linux.dev>,
	<kayracizmeci@gmail.com>, <mintaohuang@tencent.com>,
	<linux-kernel@vger.kernel.org>, <albinwyang@tencent.com>, Chen Yu
	<yu.c.chen@intel.com>
References: <20260920043116.1298017-1-albin_yang@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260920043116.1298017-1-albin_yang@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CH8PR12MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 9325a71f-c16a-4f4b-9e2f-08df17a1d23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w0o3XjXpXI7g/m9kq1w1K4wX6EqQD7Ut7fOU3hOQnrTwBoW738w9tB39+ALaaMVUr94jqpwsR/jQFCJuhOsEZnHHl0bDUHwSXkLczUJ/619nmfAj2ywvSUGWc0g1x33fWHuarLHKfKC1Cqom8lEXP1yJlOCU1l/zx93wTNH5M1PqLtSqhFYz96Rbx+31Hq6QapwcU4A4oCsJfnIgB/31ljksk9NcUoLNdAoEUZIWSLarHxvCGy4daxXliNVLUJyDhZNCP4+BZtXxfgC5Ktl1e9MzQKvO4EISY5ZyA6mpKysaSMSRRHLXMtktwYSMSqkk4Vczqa7tbkm01r3ZYx2mfUKnV+hMaAZ1xAS9yjgE1HO7wmPVddQoLTlxwRjRTCtuq49DL30YNQdoHp8GASnrsysPXTRz7iu23zefK3G9mbnbuUqVytxEP/PffOhE7PMaf8E2y3Vqi14468jGtDgUH/wcAbs3MvaF6+g2mXNkftg8iiwa3ED6PvQFcnzbkvgv6dMjjtkhkI9uUzQa8ZXGhnjYUmKrWUkhLyHgiwvV1drpOrEcNhj6RyvVzO/eq3SQOeFcLRjU7KNz529d1bEzj1KrobXQOl7fmiN2wz2O7ZA0LLlJpptXVwIxDlHP5h80vF4wPUKIaAAECU9Jtitlnr/98RQ7dy9qF4kR5Vdp1QA4TJcNrrKNe+XI/0hoiSGvAchIk2usjVeC+Jl0OpJ61g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j7bcXb8bYCV7F0eKUOt/kcVMJR+Hb4hzrXRdlGR333rVk5/eUhV+mdfZd1/orxTQR9FIzNSC17dpKtHO+MTolWsfAQ2BKYzZLTSMhuIZXCyA3mGHXdc4NJJUxkwN0H2p3cYzp61dGJ0Df0ApFtC5a5I5fznZ+L6P3AW0huF21UPctiAzbI414ViVAuqmObTSMAU6egyYXigcQcaexNLA12aJWkUo6dL4zoe91HVwKOyZp0mKyGMaveQFIgAg/3flxOo4xDkTZh9gJRnGwwi4I1rCi3hJFqKEVFtOAkIJhBoGiDlo5e6UFCBePI7UMERWd8RCr4ffibeNH8R3uK4zYU/kudQeuVcr5UKtRvMs7+ZJBSoYKKVnsdzyC/G1sT2fQ1w+6rvfNA9kkGHOlBAhmySoae2iSCwO8lW8Qz1d5fouwcxFLTOPQVRmAvBnO2sM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:33:09.4024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9325a71f-c16a-4f4b-9e2f-08df17a1d23f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9768

Hello Wei,

On 9/20/2026 10:01 AM, albin_yang@163.com wrote:
> From: Wei Yang <albinwyang@tencent.com>
> 
> With DELAY_DEQUEUE, a blocked task stays on the runqueue with
> se.sched_delayed set and its sched_info.last_queued is cleared, so the sleep
> is not counted into run_delay.
> 
> When such a delayed (sleeping) task is migrated across CPUs via the plain
> migration paths (move_queued_task / move_queued_task_locked, the latter used
> by __migrate_swap_task), activate_task(dst, 0) calls enqueue_task() without
> ENQUEUE_RESTORE, re-arming last_queued to the migration timestamp while the
> task is still sleeping. The later real wakeup (ENQUEUE_DELAYED) tries to
> re-arm last_queued at wakeup time but is suppressed because last_queued is
> already non-zero, so sched_info_arrive() folds the whole sleep duration
> between migration and wakeup into run_delay.
> 
> Load balance is affected too: the sched_delayed check in can_migrate_task()
> bails out only when env->migration_type != migrate_load, so it does not
> block migration when the type is migrate_load - which active load balance
> always uses (its lb_env leaves migration_type at 0 == migrate_load), and
> which regular load balance can also use via calculate_imbalance(). Either
> way the re-attach goes through attach_task() -> activate_task(rq, p,
> ENQUEUE_NOCLOCK), without ENQUEUE_RESTORE.
> 
> Fix by not re-arming last_queued for a sched_delayed task in
> sched_info_enqueue(). The wakeup path clears sched_delayed before reaching
> sched_info_enqueue(), so it still re-arms at the real wakeup time. Plain
> runnable tasks are unaffected.
> 
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Reported-by: MingTao Huang <mintaohuang@tencent.com>
> Signed-off-by: Wei Yang <albinwyang@tencent.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>

Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

