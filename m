Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E742CAE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887393; cv=fail; b=OSMaTE2+GhHhFSB5gBWf8dlbMoYAi2AJvj5mncHgQypEOyiJO7LJfwIFyiu2OPNiBP2z/UnNbNoJTpfhZAVqXycqmdrAiYtTKDLFRjd7mUfUSU70ywd4GBN6JcFVajHBdQgZzpen+crFhsXqVixlk8YK6vkzrnRjkw19Wv+4+Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887393; c=relaxed/simple;
	bh=xTJDEkfgKOVPYftxdGE27WQi7P8zzksy/rZTianTGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kxC8hbxdHw+dxv56VXWUhMvR6nKjv9naaP+km0gQk2/2IxsXn0b7t3jx5jjnKbm2HwCnoS6jF+6WJhE5TkJfb5Vnnc4Z49UpJq8L3BX9oyJfHSp5wIBHEuLd0uf4SR369ybhb077S9ZsV9VL0V7WG7tjY+V0VIOlJsPY85mtPZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n0iYJIst; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n0iYJIst"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwPlW+6kY0zPSWx814GHzHOCI+zkyuk6HYpR9hnz4MLmm4AHyfXv65RQ5875u2Cweah0oRidTEqPTo/K96ny7LLGaEXEZlR1/x0f75B3h1/Sm3GorLk56lcN5bDigr3dewmLkj2N8a8wbv9YwjHXi4zyFYhHcJGlaJpFHbYPV3W6BkPdBYXEwGskJf0vmmVrdiONBLYSnmsZ6gM9MYaHXCri567ihVyNLbe+wB3dbf7Bj7Nq5hl02NmXqiLx1uMHxHZ2uMLJFnCmIWbQ1QIQobmdE62RPQT/nI4K8FAFsVakU4pNYokra+z5RLOpWRj+dzfHvL9QPnmd+XrAu6QqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnmljVkXv0MtdpA1f8UzAs2KP5XNnOxjR40w3Qr3Qqk=;
 b=T+9c7fUz9K5OCHnpEphX6K34cDBJj7n30dxikeWCU87rxnEt9bPirHhmdm5vexVn1dgYhOJrYcU/5SHulPV9MYLLnC630Vn2Gp5MjniJ1LVmogcT718S5DQ2wm5pOA6L0kLNfPAHkeyO+bLmaN+AkSPFKtKsO1sddhK4tJFEPDAttxXoLhS4+oGQhYJzRGeH3WvJPwVp4Ln3CSXVDz3M7XbchHramEl6g4cDWpe02c9mAsC//wJjcUiFo2luu6Oy+Nwsethvr/o97AoYVPIZzzVSbLlxg6ZlbOu9plRSd930onEGOWyf3HpytPpcFFnQgfKJoBoSUv4bMSL3OkrU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnmljVkXv0MtdpA1f8UzAs2KP5XNnOxjR40w3Qr3Qqk=;
 b=n0iYJIstEyFsWdz+VFYSBFhKRLqzF+/DfFIlTpobuZBwD1X3aBWtzM1ltvvtHhCxKNATf3XSpB+RTEPh/3nShRbf6zESBe0FliePjPDQxQatzetql9AB7DH/uEqtfG5emUCceTl/8q59YNxd3++c1QQwCqD8H2GtSabNNEa9bHU=
Received: from SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::30)
 by CH8PR12MB9741.namprd12.prod.outlook.com (2603:10b6:610:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:29:48 +0000
Received: from EA8PEPF00000005.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::84) by SJ0P220CA0026.outlook.office365.com
 (2603:10b6:a03:41b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 10:29:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 EA8PEPF00000005.mail.protection.outlook.com (10.167.249.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 10:29:47 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:29:41 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 05:29:37 -0500
Message-ID: <a5b8b01c-1020-4e0a-8d2c-a8f898036f5f@amd.com>
Date: Tue, 13 Oct 2026 15:59:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Apparent lost wakeups
To: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<kernel-team@meta.com>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com>
 <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
 <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com>
 <20261013101452.GG2009045@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261013101452.GG2009045@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000005:EE_|CH8PR12MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c6427d-f62c-4037-3624-08df2914e7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|23010399003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BzxCOHjjnJw5MiVqyn0N6tw92GLCd76sHixd07xlmQBRPT8mDyYqOhfMZmG/dj3T39GL36RMsvno9gV1k5C+exjTzhBC7RqFIlnK25FrTlM+tGCqYEQWKptJh9FxiDCe5QjsmHLaLM6qsTCAij/ESR0p/KrmJiSrUShgJ+r6C/BLB8G9REVUaBthHqybBhym1h71C6HBFP9vGkr3e5gSfbt3hxPVv25H0bOHQGMPJCK2pGBVCFM3JpzbTIAv805kQ4oVVgSg1bD8rE1PNRweq6e3h15zKL1ZY4PxjC7YE+MLddS+zNSSb70briF4FvM9sJWpszx3ya6Dt/R+Qu7ROecKLpfMRGATTwN28xRyeOq39xKodH10SAvKBJ15eXhRjWPj+8TImo1PnRoszgezsw8bmqutSF7Jy0k8QgI8jmscvJKh6hgu6XUqnGasrwEqCybvLsPeori+ZVqnUEiothf/bmsAtH/G0f+/dZWwGzzKVl78km57+gxHBXHtsK/FSQFvk+FcbFGfA930nf5WyfF0cDDBLgZUU7k0iUZ3TtArzAYZC7FyvmkCawTA2b3/bidGVTzg1RstaQUxD6fu6HeI2Pt2LR96rwe1eRA1MwrvvBIDmJEvEKhwfGUF2L8gVbVaFWanEmV+eGDXm9o3smSjPcm11PNB0lMSHAoI4YrTjhsf0Pg+XU/WgL6HqVGA4UCW1bnmI5DfBLgovXjJyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xsn2wukAL8YLGCoZYp9AzQNC3jK3+g/DHIbMH4GP5o/F2dkmt9ri83OLVfWx0oQ+NpTsRAJA/tZmqCggXeagpFuZRX02PKK16roymWlO9zUmf67mTmFEh0hxSktlbcC0BNVHrYAmbRUykN6LG3EJJ4MyVGAGr1jCc7RZkozijJkgwlN//ZEyKYuFwjHvr0KT5xQT4L0MnqOwht+RVLe4UbETxIdmzbhapOwtgFmfvumiyxL4ch3OG1yp8tSyfukvBX0aoismgOynYSimGVdlYHkViZqCToCbt8MhXmiq8FCmTJfH2tE9LQtqOM8RVSw0txKjzviQCshjlE7hpkSgpOXv5ofuLvfSKbRibV7mU6XPiVrGUp8MDNXwm38npX1AqbJ9HJnaSzpgEGYYxlX14HgNkwvZcs9bcVks2vZ7/8oZWZHUhUxtNL8gDGzMVdew
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:29:47.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c6427d-f62c-4037-3624-08df2914e7f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	EA8PEPF00000005.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9741

Hello Peter,

On 10/13/2026 3:44 PM, Peter Zijlstra wrote:
> On Tue, Oct 13, 2026 at 09:58:25AM +0200, Vincent Guittot wrote:
> 
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 0f63c30b4324..b37c771c41ad 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
>>                  if (ctx->running) {
>>                          /*
>>                          * If this was a class promotion; let the old class
>>                          * know it got preempted. Note that none of the
>>                          * switch*_from() methods know the new class and none
>>                          * of the switch*_to() methods know the old class.
>>                          */
>>                          if (sched_class_above(p->sched_class, ctx->class)) {
>>                                  rq->next_class->wakeup_preempt(rq, p, 0);
>>                                  rq->next_class = p->sched_class;
>>                          }
>>                          /*
>>                          * If this was a degradation in class; make sure to
>>                          * reschedule.
>>>                          */
>>>                         if (sched_class_above(ctx->class, p->sched_class))
>>>                                 resched_curr(rq);
>>> +               } else if (ctx->queued) {
>>> +                       /* Check if we need can preempt the current task. */
>>> +                       wakeup_preempt(rq, p, 0);
>>
>> Isn't what we have for ctx->running above what we also want in this case ?
>> Then sched_balance_newidle() will detect it with
>>
>>                  /* If a higher prio class was modified, restart the pick */
>>                 if (rq_modified_above(this_rq, &fair_sched_class))
>>                          pulled_task = -1;
>>
> 
> Ah, I'm maybe slowly starting to see the shape of this.

Essentially:

  /* rq->next_class starts as fair_sched_class */

  pick_next_task()
    /* Finishes ->pick_task() for stop, dl, rt */
    pick_task_fair()
      sched_balance_newidle()
        raw_spin_rq_unlock()
                                           activate_task(rq0, p) /* fair */ 
                                             /* p->on_rq but not curr */
                                             rq->next_class = fair_sched_class;

                                           __sched_setscheduler()
                                             /* Upgrades p to FIFO */
                                             sched_change_end()
                                               /* Does not change rq->next_class */
                                             rq_unlock()

        raw_spin_rq_lock()

        if (this_rq->cfs.h_nr_queued)
          /* Skipped! No fair task */

        if (rq_modified_above(this_rq, &fair_sched_class))
          /* Skipped: rq->nex_class is still fair */

        return 0;
      return NULL; 

  pick_task_idle()
    return rq->idle;

  /* In __schedule() */
  clear_tsk_need_resched();

  /* Goes idle with rq->nr_running = 1 and no need_resched() */
                       

> Does something like so make sense?

Couple nits below.

> 
> That is, any task on the rq cares about promotion, only the current
> running task cares about demotion.
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 047fbe8ef298..2a8bf562a769 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11261,7 +11261,7 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  		if (p->sched_class->switched_to)
>  			p->sched_class->switched_to(rq, p);
>  
> -		if (ctx->running) {
> +		if (ctx->queued) {

I think this branch should just call wakeup_preempt() to account
for p->sched_class == rq->next_class in case p is upgraded to
same class as rq->curr.

>  			/*
>  			 * If this was a class promotion; let the old class
>  			 * know it got preempted. Note that none of the
> @@ -11272,6 +11272,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  				rq->next_class->wakeup_preempt(rq, p, 0);
>  				rq->next_class = p->sched_class;
>  			}
> +		}
> +
> +		if (ctx->running) {
>  			/*
>  			 * If this was a degradation in class; make sure to
>  			 * reschedule.

This looks correct. Upgrade keeps the task running and degrade
re-evaluates the selection.

-- 
Thanks and Regards,
Prateek

