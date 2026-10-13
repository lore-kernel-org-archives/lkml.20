Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D68384CE5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880266; cv=fail; b=PBPYFk1mtCcYD6P1NDI+qa2X19xelRFo4K7ixnLX504rW3D2rkj5VoB0ctoCDpjUoZKMhedvXT5/aZRMxqSXY40wq1FPwZkl1LkUBYeeIon6ZJx6hVFl4q03lnggovsS68Le+qNCiNoY2jq9d9d6UQITrzs20aOE0qpnrkvMbv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880266; c=relaxed/simple;
	bh=2QckdUK847mpt0JZy1uHMe5sZSzLUWF+JmSZU+ZNTkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d9eFKVFSBOlJFu50Cbr0clQ7HX4RRjoIZl9t/G17nyQN5NXftUQ0XSLjOmq/IymzGjK0JQ5dNFllKTBd01JZaWNojkzE9BfIgzkB7rE5wHrkAiKD+mzc2J6xsB0ZhaJNWOla8O0acfVP/aU+dbsXcMmfd0F1TcuD7CRRqJysJwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SIwiynGS; arc=fail smtp.client-ip=52.101.43.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SIwiynGS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgyW3DSR0eMDJJO9bVHUxT54BN+QYR0Lly9C/7MKmW5Dd/CoKET5lcWx14ePguEZSYn4K/49R5Ie1CUS+NRbbrPT+mGKhSMs2FhYrTZ1rmLhJTP8DUw3QZZKrhCuZ7ZdHsY7nKA6CbgSzaRLGMDrdHKu4kZkDl1JkRZwD67uWVjfvbvMmvEsxth5zYolYTR4NAV0xLAavgk7KeW0m4g3g6b1+yz2OuCaOz2PxrWaBpP/7OkJV6x1bsADgTcDa+yl5eHdrf9MB3J5CSyrLMJcbSbz6AJkB9roBxz8mnfag9du/j7X0oNkEhrU/1Jg6g8Xm0bRX7IaKihfuhebzVu8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hAwGpaIWRyzaHSvw20+1RrPfF/mZifNQ6YWqb+Amwc=;
 b=jVs5Bx31GBTDeZY6bf6CZrQjlNu18BEtLhnDefjudidC2xKPpgAiZweIzWuYm/yLc6AJ/N8IMW4snX5aEL6NF9BDQDncM+JnB0ug89NxzjyVOoh5TavWj+D8CM1+3a+RcmYx9jBcJZhHdqe03hXcJEWgN7mzYJ9cpLrE4j/MRvUewTMBrfhCNKzJuI9KRyresw1JO4njd2xF1+DoJPtgsOyqigdrAaTCE5btYHWPF1Gbv7rjpJFFR9oc94wB8kEYC8ubrw6Oai19//cpRTJEahWSiA4rb4uWAHat6FSoH2hjjPhV7Kpe4Yqw0J6N/nREFkVnjCOZ5ycZkXj1XSOWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hAwGpaIWRyzaHSvw20+1RrPfF/mZifNQ6YWqb+Amwc=;
 b=SIwiynGS6A+H6JEuVOGtoA3Ghx3UEUywUT+4NDytYHqZ3Pw/1GeHzKMlMG3nFGIwi16qo7kViMbzP+I4NobGeugkorootrz58X35ZNkau9wqGz3/Wj5Ih+2ImfuXw1ySSKz1UPZxYQw+oaEhwGe3Jy70sbnXd7x4m5l4oBi30K8=
Received: from MN2PR15CA0057.namprd15.prod.outlook.com (2603:10b6:208:237::26)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:31:00 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::8f) by MN2PR15CA0057.outlook.office365.com
 (2603:10b6:208:237::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 08:31:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:30:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:30:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:30:53 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 03:30:50 -0500
Message-ID: <49bb195f-a193-48fc-b818-41e2178b8537@amd.com>
Date: Tue, 13 Oct 2026 14:00:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Apparent lost wakeups
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
 <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
 <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d00d015-747e-4960-60ab-08df29044f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|11063799006|4143699003|18002099003|56012099006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	19olu74ZyAt6Ic8q8U5Nt7pb2iYbcuXVyZCEhleONILCapKDh8qjqEDgjvyc60cK/K5QJmN/lmsPSB6TrmG1ZHiHzl2aHYjlo294iTFWna0tJL7DZs09TaUhe8wCL56KgmjjBc933tijaRV7pHXwrchjgopP/EXyZAZwH3Rnoy2VFgOMMYz24xkt1aHXtztyDC4s4y+0lCLFXCZfPQWhrG9p6GJtNa0eKyhDcme6tpzQs8EmLoClpRAzTTnCroCJ0R/UxYUvojHFXf5h5wIsizyfTZ+T73RXcNQHx6Vguwv42C0YVF9XEHTlaadoioogONXFhYD/SiDXymyCpWDlQiMdlCVMXBfhBqJ3cMTWoB9684fgL3HVinIB+ZPBFkj9jqhkUoxwAfT0jAYtCeGbI4yK63GD1LcvoyHooiw/UeFVGfwTYTlwxbWpPKB8/1IODZnGcOnPHOlQZJy1F5PZteHOHWCj8ggbLONPjYdPUQgcbLuQlgbAlQYC+aUn9rMZMdmS/C1dgNGHIJCeYYstEvsDI6Fc0oqk5Db3z4I3l1ZDLsuhVLr/T+gh7pXpmPdfCDup3vdyHAQg3OSd+hA39rcLI9xHMznbCTHCMITdxkXFMrAUQE5Nf+ihwyyKdQWbaapno0EijIR0zW7xNgG83rVi1Dsn3xbkivd3RI24w03kYpUP5hy5cEUn0dKuDGVm5rPmI8YoHwLt6LlYovPU5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NjCk8FrfFn/YpF6BE9RDE44G9TQ7WdKu6IPBrWOCpPmXllMgpEFkW2PxOH0Vq8ttbyOeCM1N1Qu2RtYDEiNNbVfYepCeOzHWnnE2JbBoRuqTBGrKHRQ6tVIAcQTQFuEthoe/RCyBPZMsgaRVLf7OHiGf7xUkO/gEkN4oINs6wkSNF/vf81mo2HFI+ZdCRcEdSCNbYtBLvhklkiVfAjgY97Y0SSg1G3NdD9/lo6R/ePQhElV38iNLjqhZH9UBFR/b74xiIgI7k1+QHHSTzevzcjFBgXk0XORTQ+69NLVKJs45fNRU3Y5uHGdda87lnvDRHc1M6ragFZku7mMEThkuwAe96yHlrOPGrvGlVbpQRUMhQWoJpRPsP/FPNu+lnhEFeW8oFsEo+Uef9U39SiOd6uSNUjB353z78n6agHtJIgvC9J3OMVAhlPB6ZhW3a78P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:30:59.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d00d015-747e-4960-60ab-08df29044f75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765

Hello Vincent,

On 10/13/2026 1:28 PM, Vincent Guittot wrote:
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 0f63c30b4324..b37c771c41ad 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
>                  if (ctx->running) {
>                          /*
>                          * If this was a class promotion; let the old class
>                          * know it got preempted. Note that none of the
>                          * switch*_from() methods know the new class and none
>                          * of the switch*_to() methods know the old class.
>                          */
>                          if (sched_class_above(p->sched_class, ctx->class)) {
>                                  rq->next_class->wakeup_preempt(rq, p, 0);
>                                  rq->next_class = p->sched_class;
>                          }
>                          /*
>                          * If this was a degradation in class; make sure to
>                          * reschedule.
>>                          */
>>                         if (sched_class_above(ctx->class, p->sched_class))
>>                                 resched_curr(rq);
>> +               } else if (ctx->queued) {
>> +                       /* Check if we need can preempt the current task. */
>> +                       wakeup_preempt(rq, p, 0);
> 
> Isn't what we have for ctx->running above what we also want in this case ?

Ack but with a couple of exceptions:

We may not need a resched_curr() on demotion since the queued task
isn't running.

For a queued but !running task, if the promotion lands at the same
class as rq->next_class, we'll need to do a
rq->next_class->wakeup_preempt() to check if we can run it now
which is also covered by wakeup_preempt().

The ctx->running case seems to have been optimized to avoid doing
an unnecessary resched / wakeup_preempt() calls when the current
task is still the best choice.

> Then sched_balance_newidle() will detect it with
> 
>                  /* If a higher prio class was modified, restart the pick */
>                 if (rq_modified_above(this_rq, &fair_sched_class))
>                          pulled_task = -1;

Ack. I'm depending on wakeup_preempt() to set the rq->next_class
correctly on an upgrade and as you pointed, the newidle will then
force a RETRY_TASK.

I hope I'm not missing anything.

> 
>>                 }
>>         } else {
>>                 p->sched_class->prio_changed(rq, p, ctx->prio);

-- 
Thanks and Regards,
Prateek

