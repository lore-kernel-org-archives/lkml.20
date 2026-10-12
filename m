Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F55470438
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796923; cv=fail; b=R9caA10Qidy8K02YPefNAkrMufN0rC+yjqUlt+sd+4nmzgtrhmda3LJj0xiaOn8qqiHrpYxPFFaqqjVAsZ7cBvFBrkzeXeBoyqh8i4Le4Gw9mlVqCHMwNdrzR7W7hKDzLWozWeYJUOXUdaNPQaLbeFlkIbavaUshp1scrfCNZEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796923; c=relaxed/simple;
	bh=6ODOFTzMaG1Cxp739ZhYd8Mrb6oD6WzYvwDdIjSWPSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZCz6rkE1ut9M44Fxy9tzy9kVEdCpFDzJwPQWSEn4E3DQ3GhPh5GR9Zal2bPprgbJ/1aaSbL8f56TsBK5rbbKEPtSH+/M006fl/AW6T0Mzqw2qi7o3ArKagDjBmQQU+HbHam2WDp68Ic482TDRFDaPvoewDgCTKRcHjvZQaNfj6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ukwzMgX1; arc=fail smtp.client-ip=52.101.43.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ukwzMgX1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czo6N26knZaZVTfPIYf8+N5+rJ2V96hAd+qhPbZVE+l6y6XSplUNURhMa7RLi/tcPbZ+fcPuxyexIDTK1o/2ddpvTfUloxNBTTPzaJKjuRxVc6NOBMZfnsMasfyMESRCIgUQoYoAT30tORDoef3n0KlrsET9yBwe0FHaUm1/MM3426HnDC/huS8Rv8WAgQlNNzXI3DW6OMG8jdzHMmtXD7kfM38cpPEDdMn+JOcaK35OorxA6sT2xAuiBVHpQZ1yOCetw008DJqHf3syGBZBhb3oxuSltdRyLCypZsR7Zi3lqNAYQ2szvY/YxzjVcFpFrdJLLT7PpLRJb1+1T6wBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhlf1JF4JB5qP8DSWZ1pMo8lfz3UEK71+yiVjnuc4s4=;
 b=dWxoOqD5HzHCQh4uoj7I/C7xurk9dCkUZKb7LxK+fQeEAAxDMo3PaSyujGdJXOTUTjWlBnJv03YnqN6aKM9Oif7gW8UJZ/mTjO0EvAsIOzAju1rofkyAHlMWx2s69mYUTGd7XUUpKx07vMOaBWNarURDEzBsXHobejBsS1Q1TLhrqfYMvPLZCZsPikl/hVLPsBeKhiOacAAEZ/kHBhekwio2EqiR6CfrTCe+HjsOJyPrv7/HZRcMmY1h8R0MlfwD+5bsAyCD4g11ySbZ97FWNsuvSMvrKidPefYvMFsnCD98Hwr2w+e3WJPLePhvW6Kkkjxvv5vUYmc8/QfHOj37qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=zohomail.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhlf1JF4JB5qP8DSWZ1pMo8lfz3UEK71+yiVjnuc4s4=;
 b=ukwzMgX1MIwCV9M6cxiKmkeu9yKwsj6HVTEzepSRhlPKXfpkI8FofiIwWLFCs1I1RTFxFZysUMtRtFcd2gc37CPzwSpUaPOV69z9xvGCTRBJ89YLM1eRmJj1/Zc6NSfKpgIYg3I3wsFQKHlxfQ/irI4AYOJGKHZAUL1Ov/jgsEQ=
Received: from BN9PR03CA0936.namprd03.prod.outlook.com (2603:10b6:408:108::11)
 by LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 09:21:57 +0000
Received: from BN3PEPF00022BC2.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::45) by BN9PR03CA0936.outlook.office365.com
 (2603:10b6:408:108::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 09:21:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC2.mail.protection.outlook.com (10.167.248.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 09:21:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 04:21:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 04:21:51 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 12 Oct 2026 04:21:47 -0500
Message-ID: <adaa5bee-bfe9-4a03-acc7-0e41c5242e7d@amd.com>
Date: Mon, 12 Oct 2026 14:51:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3] sched/proxy: Defer donor commit until after proxy
 resolution
To: Xukai Wang <kingxukai@zohomail.com>, Ingo Molnar <mingo@redhat.com>, "John
 Stultz" <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Andrea Righi
	<arighi@nvidia.com>
CC: <linux-kernel@vger.kernel.org>
References: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
 <0fe8a0fe-68f5-467b-be82-cf631e00fd87@zohomail.com>
 <832e9395-49e9-40dd-a4db-1c1bf9753100@amd.com>
 <d5cb66ce-9d96-45f7-a07d-5dc3ac70e8d2@zohomail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <d5cb66ce-9d96-45f7-a07d-5dc3ac70e8d2@zohomail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC2:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fc6f55-802c-47ae-bd15-08df28424396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|7416014|10067099003|261009223027099003|921020|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	mO5Q8VqmW7fxBMpq+eTkFG8F5Vo300VI1cZkXwXJE4rrx6jNLtDgjqCeI5YnnIoF/wNUk4cV/lGvj0koRbQC6Eyt9D3m3V5P/oxW4bmQM2sACmosRRBppJ0/Xx9Gq1MaQfpNDvBF9Pxx+oS6m82uL5XyU3oVcvV4J3201HFPPcHGIV4He6viqzPbpUE8ryKDzdMSA6HFDDL409WD2EfMC3voNE8tpfQ+gy48+rumTn6XCoobTXOK+UcxcOYzw/MeYOZ40yTxDWnpvZW29rE5mFlODvwPxj1fJ7BS97USqy61tZratrOqRaMJZvrAYMKQHDX4qcE0iewMWDubIfSEh8QDAcP3kQKd0Uln/b5stiJaWV5E+u4ylTh8JHhCwk9cJe/3iXxo72Y83fAcBRqrFtxU77rdZnzu8IixpLC7zdRLUJ47nc2HFcWt9mkV9X3tnAWTM8L6ecV1sPdsJYIV3rPiOPAOgcamRhn1S59F1Hb9rSlxRmHlPXI4Qnt6W3QnZeedx9wezJH0bgDjt/WionT0mchNg52lGOrHZpoYV7sWV/RfjURSaQnDp5EJmbXyFmF2LVwtH/2RE5GNzGatm49vSqumspMnPGd5eldNn9GLA3BUlLqiqd+JQQ431FImRw8u//CYItXLkRqsS3Uy31uBf7LG37+v6eOMWXtRrGXXmZcxRPsr49ikhl0IJCBDGEx7N8nhvVtVeQtukfl/2oB/07UUQyRHUCyMnsKVxm8XIy0f620dqf/8FZDazmy5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(7416014)(10067099003)(261009223027099003)(921020)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xsE52jnHzqKPOBxAY5MrhOzmjizLninaA307n3nad78YLo54K3YsnU32Wlq5iAJwHaBNcomUpjHzYwQJpTf1/zd93ORHowH8zIxMd5jLFEvxOfZWmxSOD7oHbwWKROVt+FRe6KmAAQYzUpx9yoe4ZVAucu7GeYTAvzGxXkzE6oJ1lW34MwwTBUUYFjhKa67ZNzlEztBFx8MK7dF1coWjfMjYfyOaKpXYCNueP+ao0ucq80ai4Z2vB0mgwbJpEZ4Fwj7dpcLQaUiUu/zI0cryVhVf48zjTZEoig0ck/2wsHXzLAX9BxqE/0ylZbNgsavhGyuyeXjwIe+QNtRc6yqnSlR1Fs0IlUHGpPcJkwGaXd0FOWyUul2gcUuGI7GknZo0cUZK61TW7HvLgl83opSolREWotaCtFYiwwwTTr0V07XV6BfZ54GcYiiLSJ/vPq4t
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:21:57.6374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fc6f55-802c-47ae-bd15-08df28424396
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758

Hello Xukai,

On 10/12/2026 1:09 PM, Xukai Wang wrote:
> 
> On 2026/10/12 12:05, K Prateek Nayak wrote:
>> On 8/27/2026 2:48 PM, Xukai Wang wrote:
>>> @@ -7143,45 +7159,49 @@ static void __sched notrace __schedule(int sched_mode)
>>>  
>>>  pick_again:
>>>  	assert_balance_callbacks_empty(rq);
>>> -	next = pick_next_task(rq, &rf);
>>> -	rq->next_class = next->sched_class;
>>> +	donor = pick_next_task(rq, &rf);
>>> +	rq->next_class = donor->sched_class;
>>> +	next = donor;
>>>  	if (sched_proxy_exec()) {
>>> -		struct task_struct *prev_donor = rq->donor;
>>> -
>>> -		rq_set_donor(rq, next);
>>> -		next->blocked_donor = NULL;
>>> -		if (unlikely(next->is_blocked)) {
>>> -			next = find_proxy_task(rq, next, &rf);
>>> -			if (!next) {
>>> -				zap_balance_callbacks(rq);
>>> +		donor->blocked_donor = NULL;
>>> +		if (unlikely(donor->is_blocked)) {
>>> +			struct sched_dl_entity *donor_dl_server = rq->dl_server;
>>> +
>>> +			rq->dl_server = NULL;
>> I'm not able to understand this special dl_server handling.
>>
>> In case of "pick_again", pick_next_task() will clear the rq->dl_server
>> before the pick and for "keep_resched" with idle task, I don't think the
>> dl_server from pick makes any difference since we'll come back into
>> schedule right after the switch.
>>
>> For rest of find_proxy_task() we don't really care about dl_server afaict
>> unless I'm missing something. did you trip something that required this
>> change?
>>
>>> +
>>> +			next = find_proxy_task(rq, donor, &rf);
>>> +			if (!next)
>>>  				goto pick_again;
>>> -			}
>>> -			if (next == rq->idle) {
>>> -				zap_balance_callbacks(rq);
>>> +			if (next == rq->idle)
>>>  				goto keep_resched;
>>> -			}
>>> -		}
>>> -		if (rq->donor == prev_donor && prev != next) {
>>> -			struct task_struct *donor = rq->donor;
>>> -			/*
>>> -			 * When transitioning like:
>>> -			 *
>>> -			 *         prev         next
>>> -			 * donor:    B            B
>>> -			 * curr:     A          B or C
>>> -			 *
>>> -			 * then put_prev_set_next_task() will not have done
>>> -			 * anything, since B == B. However, A might have
>>> -			 * missed a RT/DL balance opportunity due to being
>>> -			 * on_cpu.
>>> -			 */
>>> -			donor->sched_class->put_prev_task(rq, donor, donor);
>>> -			donor->sched_class->set_next_task(rq, donor, true);
>>> +
>>> +			rq->dl_server = donor_dl_server;
>>>  		}
>>> -	} else {
>>> -		rq_set_donor(rq, next);
>>> +
>>>  	}
>>>  
>>> +	put_prev_set_next_task(rq, rq->donor, donor);
>>> +
>>> +	if (sched_proxy_exec() &&
>>> +	    donor == rq->donor && prev != next) {
> 
> Hi Prateek,
> 
> The case I had in mind is when pick_next_task() selects the candidate
> through a DL server, and find_proxy_task() later goes through
> proxy_resched_idle().
> 
> 1. Before this patch, the sequence is effectively:
> 
> |-> pick_next_task()
> 
> |---|-> rq->dl_server = server;
> 
> |---|-> put_prev_set_next_task(rq, rq->donor, donor);
> 
> |---|---|-> donor->dl_server = rq->dl_server;
> 
> |---|---|-> rq->dl_server = NULL;
> 
> |-> find_proxy_task(...)
> 
> |---|-> proxy_resched_idle(rq);
> 
> |---|---|->put_prev_set_next_task(rq, rq->donor, rq->idle);
> 
> |---|---|---|-> rq->idle->dl_server = rq->dl_server; /* NULL */
> 
> |---|---|---|-> rq->dl_server = NULL;
> 
> 
> So find_proxy_task() is entered with rq->dl_server already consumed by
> the donor commit, i.e. rq->dl_server == NULL.
> 
> 2. After deferring put_prev_set_next_task(), without the save/clear, the
> sequence can instead become:
> 
> |-> pick_next_task()
> 
> |---|-> rq->dl_server = server;
> 
> |-> next = find_proxy_task(...)
> 
> |---|-> proxy_resched_idle(rq);
> 
> |---|---|->put_prev_set_next_task(rq, rq->donor, rq->idle);
> 
> |---|---|---|-> rq->idle->dl_server = rq->dl_server; /* server */
> 
> |---|---|---|-> rq->dl_server = NULL;
> 
> |->if (next == rq->idle) goto keep_resched;
> 
> ...
> 
> 
> In that case the DL server selected for the uncommitted donor gets
> attached to rq->idle.

I see. I guess, proxy_reshed_idle() would be a better spot to
consolidate it rather than juggling it in __schedule().

> 
> The next pick clearing rq->dl_server does not undo that assignment,
> since the pointer has already moved to rq->idle->dl_server. It is only
> cleared later when idle becomes the prev task of another
> put_prev_set_next_task() transition.

Which should be the very next __schedule() since we retain NEED_RESCHED
except if all the tasks migrate away and we genuinely select rq->idle,
then the dl_server lingers around.

> 
> 3. That is what the save/clear/restore in v3 was intended to avoid:
> 
> pick_again:
> 
> |-> pick_next_task()
> 
> |---|-> rq->dl_server = server;
> 
> |->donor_dl_server = rq->dl_server;
> 
> |-> rq->dl_server = NULL;
> 
> |-> next = find_proxy_task(...)
> 
> |---|-> proxy_resched_idle(rq);
> 
> |---|---|->put_prev_set_next_task(rq, rq->donor, rq->idle);
> 
> |---|---|---|-> rq->idle->dl_server = rq->dl_server; /* NULL */
> 
> |---|---|---|-> rq->dl_server = NULL;
> 
> |-> if (!next) goto pick_again;
> 
> |-> if (next == rq->idle) goto keep_resched;
> 
> |-> rq->dl_server = donor_dl_server;
> 
> ...
> 
> |-> put_prev_set_next_task(rq, rq->donor, donor);
> 
> 
> If proxy resolution returns NULL or idle, the saved value is not
> restored into rq->dl_server for a donor commit that will not happen.
> 
> So the intent is to keep the DL-server selection made for the candidate
> out of rq->dl_server while proxy resolution is in progress, and restore
> it only if that donor is actually going to be committed, while keeping
> the state seen by find_proxy_task() consistent with the pre-patch path.
> 
> Do you think rq->idle->dl_server being set in the second sequence above
> is harmless, or is keeping the save/clear/restore the right way to avoid
> that state?

I assume it may take the dl_defer_idle path but I'm not super sure. I
personally prefer resetting state in proxy_resched_idle() since it is
all in one place to refer at any point.

> 
> I’ll look at the sched-ext interaction and the __schedule() structure
> separately while rebasing onto current tip.

Thank you but I'd wait for Peter and John to chime in regarding the added
code complexity given the visible benefits of this optimization isn't
too much.

-- 
Thanks and Regards,
Prateek

