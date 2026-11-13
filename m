Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794538999;
	b=cay52xgK1iBIPPDhdHsnZBFYUjImKOVWOgTMkRSxX4nEHfN4MIzAFeQGZV5ghs/0tXQV
	 MX7Loc5WzAiuXqX+mMoEmTEOntzg6ubQJtqj1khWxdtIh4TxJEFwQ4Yvmwe+T8jKELC3y
	 655MGBXxRCwz4zx9yBRKHlVfRxAZUIsBGlTQGzd+dnuX5yTs1ooyRuM/0TzXlRQZRb485
	 50ZIzuE52NuK4aGTCl7uu8CxL7wycJmT1zN6NUqh/mbcKI6LGL0hdBxESnEuhLuNM+Qc3
	 uvBlmWA6oFkaQhAeAd6AHa1VW/hiyqqjJjjFUHJTyusS7ry8781SK5ZI7TpAfXWj+hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538999;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=e9FFEiwCzaQLS6a4RqrCU6NXBuipwFfQsEYHdSKOUZM=;
	b=RY4Promg5TyYmqHFM78F3pRkkHqWp0bT6IqwYilK6eA5Z2wG1LsP2sQ0hYqYSF0vuwqj
	 hiDaCPOX3D3+7Bz8m9WCp4qzpqdVA3xeMLRxcCsHlye+dKP5MN99jud0svPBrBrQ2EzGM
	 Wshy55givl0sfU0arAVFn42AKvKXfYKtkBGYMioR3q7uUbj/g+XESq7g6yegl/7b04d89
	 qupQbT6uF3NG1K5IN3mfmPk/MxWWkDvTh+tPEEkLpr1j1Qia1QhXjVJxtL5c1qakztDol
	 RvX2ctRVe1EIncyJQ+scnfurcfJvQ4cOR/n6//yFOWkd/kifTRLu3eTUCW8UBL2m8OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y3U0JQJR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.31
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4912606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4912606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y3U0JQJR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKaDWVfXiXks7AgGsAEXquBncKO+4KlmA8e/9dnHrIFOQiw+OSkhai2ujM6WjGZYXAnzQVQntf5xYRrEUONW1WzOlwGiSc6JzNF9Nk/AOQ86Pe+337eV92Whh9ccYihVtd8JUaj9CFod5hVmMj7Xv5SkhJMZQ1BYn8Bt+XawySln9eIvXXYTVjDOT6lYwE8D5rUo+CdklOqQfcEoDzC2lZiPt8TAzXCU2P3eVI39KA2gxscwAjssCLswnBDDIF4ZToqRGcW3Bz2zwjhIHR/wuSXuyD+Hoq9JiryJNMqq+TXou0w1U50wm3XgPHTTQqR78IgfPxW6u0P+tTPj6h/xYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9FFEiwCzaQLS6a4RqrCU6NXBuipwFfQsEYHdSKOUZM=;
 b=Q3k3Ty5gx2vhMZcZctHL1DHCWJeSQskvI1yjJXUWg5FzIBfaRPH70N6ZwvHzkkauDZKHyRC/4NeYEFVSbXkNymwx08wq7DBZLmV194AX+y6+tj8p4SMFWQWIk9dKmtw/+nxoxZaEvtS1AFRfG9+vwMcJFuL+mpS3j0fE3b+4PnjujxZbyuPZfso3qKrwSnW+3U5cCWKSMijp/QvLixlYCQJxlz9DR8Vwn4FIS3l+ldAutrbydfvB3fO2cxuQTM8VGt3VInHlBl04Cqs/JVDKiQyT22s/9E09K83o3zWZ9sYTwGVmP7ecQ9XK9DjesKoMhuokIQkIJOzVo+XSa8K85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9FFEiwCzaQLS6a4RqrCU6NXBuipwFfQsEYHdSKOUZM=;
 b=y3U0JQJR0XZXoobUEHPAfgw2wKpQSn3QG+aXVHVdSxWQ8KYCI3X9XZwz3qV/CAOc+ebduPNcvVXF/hdThUro646VAuAZU77ks2qn5KSXQyOSuauBGkff1NnYbemVpH7XswTb/IsO/c8eaNNOTiB7Qw+mIFk27auTgQu2D/5NQe4=
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 02:59:52 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::50) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Fri,
 13 Nov 2026 02:59:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 02:59:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 20:34:15 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 20:34:15 -0600
Received: from [10.136.34.22] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 20:34:11 -0600
Message-ID: <5f0f320a-a718-4df8-922b-a3187861d6f8@amd.com>
Date: Fri, 13 Nov 2026 08:04:11 +0530
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
To: Andrea Righi <arighi@nvidia.com>, Peter Zijlstra <peterz@infradead.org>
CC: <mingo@kernel.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tj@kernel.org>, <ziqianlu@bytedance.com>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <56e1d372-c938-468a-950b-4f984ad6bde1@amd.com>
 <20261112093308.GI2668804@noisy.programming.kicks-ass.net>
 <87ed02f4-f510-47a7-b3fa-30ad7909cb24@amd.com>
 <20261112103428.GL2668804@noisy.programming.kicks-ass.net>
 <avW8dhhssAucmErt@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <avW8dhhssAucmErt@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c70144-79bf-460b-c151-08df413217b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|10067099003|11063799006|4143699003|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	osrBRnb6QQweOPVIZFthFqWHIWbJ8EgiSJKPCiIU9+769TboKeMvzkOy/m57YhZhqASy6YVGLKpiYISRzrEhnXSWS24/NMgs+2iAZFwz5tW6jLSkTcCcnjlFTZt9jkofubGpLnkEZIF/1LbhGvpd/VAVm11FL25oA2/yZVsJ4l7ef1IUzJoOOLwa2ty5CoAvhW9kdrUGFe2unJEtoit4r+xi3iJ7/1aEmXoA25SdUpQokOdxM0EkU+3V2OdRc0+pnh/2N0j/i1BeLEjQqe/SqC/bdyZ8K4bBIY+/MvaGBRL5a4FceB67AvNW1xj7sArDqfNAlwqGYsd2YX2REE1034RAxr09h3yY+Bk8zRvodRGDNMA4oxt5D22clvfK8HRHz+FqGU0t3A1Sv7Q4SyxJ9ulmFMdGT+CoIhrXrXWVsHWuGXjZxTq0H3gEQxZalxxPKhCIyZUyB2k20fUuanZ1VIfTnLVfWRRp6kd+fAlV835P5cTPp90JzGdPlTPGA0rD5/9sT2sJmCURAZNBQ4y00tNtqwo81Gb2lQ7D6j6i24Vi+8Ye87cCe4yruNv1OLqfQJBujC/jAfmeP4R9/GOFsVE3zxpknm0H0QT8k17EyUfhbgFqBmRlx2SYE46NDWZrTXZvlnGSwczWXdl3+rCwt9eS63OebWuR9acl0yY9JLqmYbj0ITm5/GiANsQtPkgug/v7mkRGl1tLNlLX5zXSkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZtM896GGaw3T5aJ7aEtNfs7Xz7ZbERX6oLq8ZaE9YxqrgwgLbkcgLYETkPlsJBzccUdohCcXtirLDdYWTsill4P5633KT3QahuIKMgfxWa1NfeBIaoYn0fOumbejpSOSYREsFgAMHxZ4Wgo5hEPK5CMEWupFBIxKP6ywRp+s+2CCopgGEkOrCJgHWwyFdhzVSZHTQWzHQYsGJ4v8W6/dAxHCG99+eqkeoypvGK3hG9g4AsLNnawei3je8/kNjxtoVLpzqeYD++0rkwynMYxFcqiU4L/JWmzkwXln54SH0/eronZOptQrObuT+0LiwVYNTIMPy+4aR4sxloO2XWgHa6oWaxDK4XMgepAyr4e5v7cA/HXacuARJjAS2s70QriiakzE7+d3L53nGhzvnanyvAbFiFUYs7gYUovsaDvUKGmk7OByDkM6N00v1e6Dn1i2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 02:59:11.1227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c70144-79bf-460b-c151-08df413217b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561

On 11/12/2026 6:47 PM, Andrea Righi wrote:
>>>> Ah! we now have consistent cross-class wakeup_preempt calls. If we have
>>>> the following scenario:
>>>>
>>>>   - only EXT tasks
>>>>   - balance_ext(), moves task from global DSQ to local DSQ
>>>>   - wakeup FAIR
>>>>       wakeup_preempt
>>>>         if (sched_class_above(p->sched_class, rq->next_class))
>>>> 	  rq->next_class->wakeup_preempt(rq, p, flags)
>>>> 	    // could move task back to global DSQ
>>>
>>> This part I'm slightly confused about (on tip:sched/core):
>>>
>>>   prev was RT
>>>
>>>   pick_task_scx()
>>>     do_pick_task_scx()
>>>
>>>       rq_modified_begin(rq, &ext_sched_class);
>>>
>>>       dispatch_pick()
>>>         dispatch_one()
>>>           ops.acquire() <-- CPU is back in control of ext
>>>
>>>           /* Pulls a task to local DSQ */
>>>
>>>           /* A new RT task wakes up */
>>>
>>>       if (!force_scx && rq_modified_above(rq, &ext_sched_class)) /* True for normal pick */
>>> 	return RETRY_TASK;
>>>
>>>   ... goes and picks next RT task
>>>
>>>
>>> The ops.release() is only called when put_prev_task_scx() sees next of
>>> higher class which means the local dispatch from the pick stays that
>>> way until it is picked to run.
>>>
>>> So, the question is, should balance_ext() do anything more than what
>>> pick is doing today to pull the task if local DSQ is empty? Am I
>>> missing something?
>>
>> Aah, wakeup_preempt_scx() already does what it needed here. See how it
>> calls scx_schedule_reenq_local() when p's sched class isn't ext.
> 
> Right, keep in mind that ops.cpu_acquire()/cpu_release() are deprecated,
> the balance-to-pick gap was one of the reasons for deprecating them in
> a3f5d48222532 ("sched_ext: Allow scx_bpf_reenqueue_local() to be called
> from anywhere").
> 
> Specifically, wakeup_preempt_scx() handles SCX_ENQ_IMMED tasks: tasks
> that, once inserted into a local DSQ, they must either start running
> immediately or be reenqueued back to the BPF scheduler through
> ops.enqueue(). If the CPU is unavailable because a higher class takes
> precedence, they must not remain waiting on that local DSQ. The
> scx_schedule_reenq_local() schedules this deferred reenqueuing.
> 
> So, from a sched_ext perspective, we don't need an ops.cpu_release()
> notification to handle this higher-class wakeup race, since the existing
> IMMED reenqueue mechanism already covers it. Separating balance and pick
> should be possible provided rq->next_class tracking and the existing
> IMMED reenqueue checks are preserved.

Thank you both for the detailed explanation. I was under the impression
that ops.acquire(), opes.release() is still the norm but the
wakeup_preempt_scx() -> scx_schedule_reenq_local() path should allow
handling higher class wakeup during balance_prev().

-- 
Thanks and Regards,
Prateek

