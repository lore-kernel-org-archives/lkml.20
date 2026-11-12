Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794478631;
	b=p0w26y03mqIi6gp1QUQeaE8rwKTRoK3aOmffhnU9WRhEaH0xBqcWQyryN0qcRRmukhWw
	 oVj9JTv2F/v+hHUfFAa9ATK9CrAcvnYpIFAXkxtOzH9b0DYtsdSYpwq7MVEAC8s6D0I9Z
	 A8w8j3ACY4Fwd+jMu0Ski7IWqIGgMz/A1xmWX4Gfooo0XuirREU9hz/J2s1OPaxOmfLOH
	 2mVx1533jpjs35y9zTQ3VWXvcNcb1IScdevZSH5nZSsERqJGYpQcQ9iJ0P4xPsOVNxmQj
	 3FObBV4kX/ZZKkjrJDzu3/2iaYl4a12yXM8jOEpzEGYacff0RBy+eJTWpyh+vViaGNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478631;
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
	bh=xMVBG+wwVRqJ5awtXc20OKhxtWtkcbC9Z5QyH2k21uc=;
	b=S+g+6igGfy1hsvAAdD3EI8153A3QggLXU2VLwOq7ngJUie8VUesoHm1kt47Uwnjd3zoF
	 PSEaKbPo8uRFukOOwFCTfifs6uG1ZjyjRaz4QbHW55knMNRBrnArXrrFXUskFV9fEdhfv
	 9VHIeDIQM7owUTexSdlgwBLFwZ0pmp41VoWcFnJCueBUWeTf5Vpe+fMaLea92GV2eTFhj
	 qBJUsQMNjIGD8uHX6qycjCie6RD/TyXI/OSHKtVn0/1F59lR6O19A2s0DHLOpsfaOwadn
	 msaLO6JAIVVgWyF1Rz+eex6rcJ9Q9LnDmkLcflREvSk5eD6D4WuRrmLSsL47XmxAeyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZyAN83bv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.69
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CFD606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZyAN83bv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRUz1Jc+lHOyVU8dgecX7oPWHo7CpYV0hnSl+LrZ/mfTclKI1rigtjFAZsPXEB90YbmadIOba+Ve7E32YVCYjiAXbQ1Okyvho3RnLe1I3UaO2Ox9CTu4pRHk1tTeAyW3hYGUoUKYP6iUbL8xn3O7wDFz3e20IafRhPZycNfTQ9+hmjCA5XGWcEqakDyBr/5MziwtQV9OgX5VeB8q85ynPuUjJjHXBzy6l4zpA3fN6ZWTy8+Do1z8HwPcaSXlReGavZu3aBGi746rfkBySfv52PBXBbuZrfat6lqPU+p2iIM44u7nMZMi4teEZNYratDQUJ0lsASyzix952jDhp7HyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMVBG+wwVRqJ5awtXc20OKhxtWtkcbC9Z5QyH2k21uc=;
 b=VSvpZdSSA0xnSw0fIG5ySUe9DWWFrT9zlUNtN7EBXtQWDE+KC9ELMdVWjLmWeDhMm91G/6A52kRnDgRc8fqfV9XAUsvRqumIxSJ9bx17rkDJTlbjLs1JfK9lMYbH9+WAZaPap+M/csrDWKALf9mbnf9A9AsXU+9GXJ9FkvKRxftSRYoqiT+82ku/76Mv6sncdKiTjv6ybHlo7Pd7Gn/xocVasFqC78J6lotiGnplOnPhd73LEAVxBlwnu2nVQJ8gjrjUrxUSp6yyInYVTicas6pB542cOrtPId+O/6I2hG29OBUAGDBHT86y/uMB5HduHqA7+BmB39CrUw276qQ2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMVBG+wwVRqJ5awtXc20OKhxtWtkcbC9Z5QyH2k21uc=;
 b=ZyAN83bvBHgmwOOEAAzCY0w5Bid85kPBRI3zTuIB7CEclu7fvnCegK3epOSROnY5tavIAlpn3nb58cPRGJScHHSQlyBRj1/Ki346JVEK2ct4ZXlIcHEwtKZ0pOeGiuWnMRrmsHdgLIdyPazi3YTH+vqlZOk6PmYE+lM4kIhZPAo=
Received: from PH0PR07CA0043.namprd07.prod.outlook.com (2603:10b6:510:e::18)
 by BN7PPFDE2ACDA69.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:17:06 +0000
Received: from PH1PEPF00062F29.namprd02.prod.outlook.com
 (2603:10b6:510:e:cafe::4b) by PH0PR07CA0043.outlook.office365.com
 (2603:10b6:510:e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 10:17:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH1PEPF00062F29.mail.protection.outlook.com (10.167.243.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 10:17:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 04:17:05 -0600
Received: from [10.136.34.22] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 04:17:01 -0600
Message-ID: <87ed02f4-f510-47a7-b3fa-30ad7909cb24@amd.com>
Date: Thu, 12 Nov 2026 15:47:00 +0530
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
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
To: Peter Zijlstra <peterz@infradead.org>, Andrea Righi <arighi@nvidia.com>
CC: <mingo@kernel.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tj@kernel.org>, <ziqianlu@bytedance.com>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>
 <20261112093308.GI2668804@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261112093308.GI2668804@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F29:EE_|BN7PPFDE2ACDA69:EE_
X-MS-Office365-Filtering-Correlation-Id: 5863563b-131e-49ce-5724-08df40a61a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|261028144727099003|261102123227099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021123027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6NHXbgexgSkvDuRPKZsG5+u9XG93fPRwHZcaPlL11qzam4SjeCweN9330NDgejvYLeNJOHITQW/2CVmubhd6b34E0UDe9jf4vXEbyMZAdK03kKLB7cHz9hYsYUhKw4zlNQb66rWlLMjz1enhRY+tbWZrzYejrHv9lgrIZkg3QjIlf8G+B2rGytEKywT/1v4gPmF4uVy3xGDdQO8OFBhNGdSTQYWFhIktlGt0T4Yv2r7BCm/we3Wmt8dwMm5V8K2MKChw5/vsfn1Yqup0dqzWqeccO6Teess1Jxgt/tbkUsfrVxZ7XOZ0nRbdTVMFDewWe1PxxGROYoDlQEAG5ZSfz7umgtNFeWiMpkb0n5yGeL8P/5Pmp+lHLVi/LwLBoZ8kp50zE++c3MUoqUFHxk6xjM0jnPAT08XKUWBfcap2jGIUvkK/qfe8KRg28bled92+OCmaLPnV0s/sYjIxTrXllgvOFPlhpTwtVZdDkLpzjQ/20k6BHW6kandf6cxAyaokstO9gVE6kgD/lyHRG1Bh4rvtJv7Ve6lvT2VKuoqR5yWxICoSzqVQdLVACH03Orp6wf8npWK0nNCaipNK4zpdyJ6ddwNkrz/RcMcA5XfJ6gVxiInFV1ZcRcguCXoUeVqu5ou6fVIClA68mFzbBMULC4w7/zxMI9ZCmC90mpFSPme8YAjN4FhFMLKHyD2K51E1SqzPGUO0I4zv9eLp3CVv3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P7d5mPYXEK5w0AKJoc11zGWWJNtgbY0GYyTCDC/y630hXm5zAazcP66YAkufhprX6L4L8mtke6EqoKFVL/g/69lYzaGZ7E4pblRMB+5j6R9Vt/bsCuwO+njVZeBRYZ+iT5vbqsSt3W5Fup3EGNMPqBz7bMQyovHO4oVqaYtU+EG/m0lNInqlrfjOWeiqjnNOe3XNUDjBsSLLST2QC4dNOAjRTpIXv2+fLdSgIKqgxYBjJZPh207Q6JHGIjy3T7r3l82NX0gXwJ+lD+Mbsao7B7o1UU0dZ0cfdzd00jbU0dwKzJyY/lO9lB+P3vCdQ3L0jn7Hp2H/3CchgKRODRffK+p8yDCNXWfm51XYkoQq281IyWWrIQlIjOZUsJZoUcvKPdAJ5phnCvnFy5zs3UDEo7dvDlwpvv3/wP8Z6z3+Tj6KWgIxZ4skZecUInV/aib2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:17:06.0086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5863563b-131e-49ce-5724-08df40a61a59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F29.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFDE2ACDA69

(+ Andrea)

On 11/12/2026 3:03 PM, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 12:16:06PM +0530, K Prateek Nayak wrote:
>> Hello Peter,
>>
>> On 11/7/2026 5:29 PM, Peter Zijlstra wrote:
>>> Ever since commit 50653216e4ff ("sched: Add support to pick functions to take
>>> rf"), we have the unfortunate situation that both sched_class::balance() and
>>> sched_class::pick_task() have overlapping functionality in that they drop
>>> rq->lock and balance tasks.
>>>
>>> Additionally, prev_balance() is only called for a single RQ in the core-sched
>>> case, resulting in 'missed' balance opportunities in this case.
>>
>> So I have a fundamental question - looking at the deadline and rt balance
>> callbacks, the balance is only done if rq->donor was taken off of rq
>> (blocked / throttled) and we need to pull a waiting task that might be of
>> higher priority.
>>
>> Now, if the balance (say for RT) failed, and later, a different class' (fair's)
>> balance callback dropped the lock during which a RT task was woken up on the
>> CPU, I believe the wakeup path would have already done the balance while
>> considering this CPU for wakeup right?
> 
> Indeed.
> 
>> In that case, why should RETRY_TASK want to try balance again for the old
>> "rq->donor" for which we have already ran balanced for? Shouldn't it simply
>> pick the task then? Am I missing something?
> 
> need_pull_dl_task() has '&& dl_task(prev)', so if prev was FAIR, then it
> will not be true and pick will not cause it to pull another task. And
> similar for RT, it checks if the current highest prio is less than the
> previous prio, and if prev is FAIR that won't be the case.

Ack, but assume:

  /* RT tasks blocks */
  pick_task_rt()
    balance_rt()
    /* Fails */

  pick_task_fair()
    sched_balance_newidle()
      raw_spin_rq_unlock()

      /* New RT task wakes up */
      
      raw_spin_rq_lock()
      if (rq_modified_above()) /* True */
        return -1
     return RETRY_TASK;


  pick_task_rt()
    balance_rt()
     need_pull_rt_task() / *Still true */
       /* Again: Probably unnecessary? */

    /* But it does find an RT task so loop ends */ 

> 
>>> Just like pick_task(), prev_balance() would iterate the classes and stop when
>>> there is a runnable task found. The only difference is that pick_task() starts
>>> from the top class, while prev_balance() would start from prev->class.
>>>
>>> This means that if prev was an RT task, we'd get an extra visit to balance_dl()
>>> -- and similary, if prev is fair, we'd visit balance_{dl,rt}() both. However,
>>> this is not a problem, because both need_pull_{dl,rt}_task() will DTRT.
>>
>> Balance still sees old donor and it can still try a pull if the newly
>> woken task is on a lower priority than the rq->donor. Is that desirable?
>>
>>> Therefore, move balance_{rt,dl}() into pick_task_{rt,dl}() and remove
>>> sched_class::balance().
>>
>> Until commit 50653216e4f ("sched: Add support to pick functions to take rf")
>> that was how pick worked and we should perhaps stick to that. commit 67692435c41
>> ("sched: Rework pick_next_task() slow-path"), made it such that none of the picks
>> could actually return RETRY_TASK and we are actually moving back to the same
>> state as 67692435c41~1 with these changes.
> 
> I know :-(
> 
>> IMO, we should re-introduce balance_fair() for newidle_balance, and drain all
>> the delayed task if !h_nr_runnable && h_nr_queued to avoid pick hitting the idle
>> label altogether.
>>
>> Doing newidle balance for every idle rq's core pick seems too aggressive. I
>> think we should let idle balance / balance callback handle those movements after
>> rq->core_cookie is stable.
>>
>> This also allows for us to now do rq->next_class->pick_task() and that should
>> always return a runnable task and we don't have to ever juggle rq_lock between
>> picks which has already led to a bunch of issues.
> 
> So the problem is with ext :/ They need balance and pick to be one. If
> we have separate loops there is the possibility of doing a balance but
> then not picking it. In that case ext needs to undo the balance and we
> don't have anything for that.
> 
> Humm...
> 
> Ah! we now have consistent cross-class wakeup_preempt calls. If we have
> the following scenario:
> 
>   - only EXT tasks
>   - balance_ext(), moves task from global DSQ to local DSQ
>   - wakeup FAIR
>       wakeup_preempt
>         if (sched_class_above(p->sched_class, rq->next_class))
> 	  rq->next_class->wakeup_preempt(rq, p, flags)
> 	    // could move task back to global DSQ

This part I'm slightly confused about (on tip:sched/core):

  prev was RT

  pick_task_scx()
    do_pick_task_scx()

      rq_modified_begin(rq, &ext_sched_class);

      dispatch_pick()
        dispatch_one()
          ops.acquire() <-- CPU is back in control of ext

          /* Pulls a task to local DSQ */

          /* A new RT task wakes up */

      if (!force_scx && rq_modified_above(rq, &ext_sched_class)) /* True for normal pick */
	return RETRY_TASK;

  ... goes and picks next RT task


The ops.release() is only called when put_prev_task_scx() sees next of
higher class which means the local dispatch from the pick stays that
way until it is picked to run.

So, the question is, should balance_ext() do anything more than what
pick is doing today to pull the task if local DSQ is empty? Am I
missing something?


>   - pick FAIR
>   
> This will need some surgery, but might just work if we have
> prev_balance() set the rq->next_class.
> 
> I suppose I'll go try this, the end result is much nicer.

Indeed ;-)

-- 
Thanks and Regards,
Prateek

