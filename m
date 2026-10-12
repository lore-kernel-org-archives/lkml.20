Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E8188005
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777951; cv=fail; b=VeYLW9KJo4sfhHg2eTJ8PkmoG0L89hFpGO55vDxjK4Rdkvhnjh51BNgiyliFxr7QKAlwf9wubAwylOcU2ByHjRb7rRu3O36C6a5bu7a9dyCfv8fK2LvlfknXearcunUdoqP2EuKt8WiUThHT0B1inaxhyKrbJhCy6FypvXKFZ7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777951; c=relaxed/simple;
	bh=rBRe9g/HWK81qhQA+eQWtVJ+f8vfj40sEaonpF3s5XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HeFyGWRJO/t6nYJQrJwvKYSFyM+uJuEycN1cRgi/DBSpDWimCZYPKzlL3A17SqovOwChm3T8I8E3wsfV/sEz1hypiS9yys2hYTYjut8IXf9BKWKFnqzCln8RXA7SGEboArODdk3nHScMYosyEFRD394EnX2gpzIbtyYC721a/Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2TGJaRrZ; arc=fail smtp.client-ip=40.93.195.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2TGJaRrZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceZ8DRPnCbioaDDTBOhfwx1mKHE0lmimTatz9FlzjvxGP2ovd69izcaNTxHFcTb6JwOKKHN55MnBlTBJOFOQNSjiDiazZRDmPISrtX0Q1dvYkP/iWjCEUZcQnG5EccuAKkgry/kaPQR0gcc6sB5hCyHNNa92meiB/rCZy3kdh8fynVTvSa6IkBRka155ImtBpERUGSk6SHqS2bJSp4HPXvUeR/rMaf+4xGGig2A+IVF7D7oj52Q7pHCfIu5CiY1in71hrYheGYmlwCRGaW7ghP3pB8f57fKTYdi2ootTU9InDasKQws6KkEbhg11j1psOn4pdE3asFygxG0eLrjXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn8euBiHDui8kdrMPVF+j/zPqf+/2ekyzvVh2ehUpRI=;
 b=gh7FwaohO/cDAEa5YEpXKSgMffXJdu8Tsy7ja0P18Mp6LWU682+f8G5r9Ngkz04Lxix0im1gCbB/hu0P89OFMJQmiAJ2JoTUc/qiFulyLwRbD9RjzjChjvKrwUvDovxnZMAkcbvCKtsVRUsF1r7pibRTU2Qz8o4648+o9wYYAE5bhAQGIx2CwBMiMpCx3tjmMeg3nXIoGjV/VqH4SyKLndPZ+BLqZIe4CSjP0TaqYalcJh/nRlE9MvMal5/ToSz3BqbixmXahi0e3PFq3ejPs3cZasS8xo7mr5oBZlE75RmGLTVn3I1mgC1HT5LpfZegz+C0tJOT2HjjLeMhj4VuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=zohomail.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn8euBiHDui8kdrMPVF+j/zPqf+/2ekyzvVh2ehUpRI=;
 b=2TGJaRrZdqDeh6mhhTv26Ryc2ttVdm9NKOTuR4waK3gUL6GXzjvb3vkDDaQln75EUsO1FufP/5us1sr2qhkWrrgRllIIWHp97dd+Ute7ypgvVw2UxiZZKMwtkAFELGNk14h56ArgUX+FUVSxFM8wZQwPycbwOKKn2zKmNVo4TIA=
Received: from CH2PR18CA0051.namprd18.prod.outlook.com (2603:10b6:610:55::31)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 04:05:44 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::12) by CH2PR18CA0051.outlook.office365.com
 (2603:10b6:610:55::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 04:05:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 04:05:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 23:05:38 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 11 Oct 2026 23:05:34 -0500
Message-ID: <832e9395-49e9-40dd-a4db-1c1bf9753100@amd.com>
Date: Mon, 12 Oct 2026 09:35:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3] sched/proxy: Defer donor commit until after proxy
 resolution
To: Xukai Wang <kingxukai@zohomail.com>, Ingo Molnar <mingo@redhat.com>, John
 Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Andrea Righi
	<arighi@nvidia.com>
CC: <linux-kernel@vger.kernel.org>
References: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
 <0fe8a0fe-68f5-467b-be82-cf631e00fd87@zohomail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <0fe8a0fe-68f5-467b-be82-cf631e00fd87@zohomail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 963aabc1-bb1a-4522-c894-08df28161655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|11063799006|4143699003|921020|56012099006|22082099003|18002099003|261009223027099003|3023799007|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	nIGXNpCMiEIGRUvav11kdTHJU/3JiPzE5FD24Kb8zg8QoMRXof9Tb7yDRRZmil6+LFy3I1A55IREtyl81d4K0zFYa387PtP8Bpcu5Qow0yI1mfnivZ7ABvHUb8dyOh1QZmuiFycLtlmgyfsXSjsKbnsR3OGNVsKSrQqXD1zVUHP1fg28YpY5O6xI2K1GsCxJ+nZAautVik9PWDm/wRauccR+cESzTObT1e6rtEM3LBr0QvVnDy/UP0rQdkc6hyFVJ5Cs9fQcHjxDV2GUdGfk/X82GhovYoH6fUsAcHHt9mHWYbl65h76nzTNYtuGM2bKVoFLxMo9WRMHIbfGyFoHs/co84euJFRfcigpkAhAhCOd93/vFFQXE5ZVadGNucmCsvSTbYriaRBdRrBfNsGij1oE599MH7rc77wIX21f4NW4AgLzGuNTYea6qbcjxr3ZGkJ4/+qa0lUpJTkN5j5qQ3sEqTqAPo575UkFcRBMnKLq4PzAU1MB8kGnf7w+HwIX/jfxALeBqM1QcxNEXSpbn6YcKlx9borqfgN83ObllF/XmGaIp04ogM2o2FQ6uYxB8Dao6XbNA6ET+Gj2Pr7dqJqMATvVJluPbqw57LFjTiSEa9saIIx8qhG0WPYV8VeSW+YIib5C/0dGsjuynFKWNHK69CGyMzG0EFf1lzr3zSJ2sIacxzHsvacwa+AxxJx2nWCChkLd0lXuzB4T20UzaTcrgRofA+L8ThHFdwa1ne6v6G8usHS8slbaE2hMz4t9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(11063799006)(4143699003)(921020)(56012099006)(22082099003)(18002099003)(261009223027099003)(3023799007)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pXfWCEVT4v/5BZb8pZ0lLJbH4ejeqwM/341vnEBASzncXDz8qmMwqx+i8hEqdoDECv1wOuKQEccpYFbgjgccNc7QwxwGaEvZSfPWjykarmlFPZOqEWyGW7NTvQKtkcGs7gKHxgfebjQ8KYb9H3FUAlG8dn/ot3xGMXPDMe8mcMwkzlvCsNIdPh79eKFASernrvRUNXpmOf8HTpIL8P2N34af5ONpVUWR8ekVGYgPr4ueRrO/c13UoZk/vMkNK+BuEVmaXpTOnT+rTVlNa7xLRckFJ0eNX/rO9zUghaOELp14dHICCzvnoVRblU2mE//Ql3ngTGVny6UonAYkhc+IuOtk8YxNpWHO85DnNq2zqDAa53cWusiAc7ohfwP58NJCzL9aaEfy2gKe6gOfTuAIIFT8nxH8PIBjNoSvIW0BIqhavo8UktvwPw529lQtw2Gu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:05:43.8235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 963aabc1-bb1a-4522-c894-08df28161655
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

Hello Xukai,

On 10/10/2026 6:27 PM, Xukai Wang wrote:
> So the measurable effect is at the donor commit point itself: deferring
> the commit reduced the number of put_prev_task()/set_next_task() callback
> invocations by 81.7%, with the measured callback time at that point
> dropping from about 11.29 ms to 2.52 ms per workload run.
> 
> Separately from the measured cost, this also places the scheduling-class
> state commit after the donor has survived proxy resolution, rather than
> committing state for a candidate that may subsequently be abandoned.
> 
> I'd appreciate your thoughts on whether these measurements address the
> concern from v2, and whether there are any changes you'd like to see for
> v4.

I don't have any real concern except you'll have to rebase it on latest
tip and handle the scx changes. Also in your v3 ...

On 8/27/2026 2:48 PM, Xukai Wang wrote:
> @@ -7143,45 +7159,49 @@ static void __sched notrace __schedule(int sched_mode)
>  
>  pick_again:
>  	assert_balance_callbacks_empty(rq);
> -	next = pick_next_task(rq, &rf);
> -	rq->next_class = next->sched_class;
> +	donor = pick_next_task(rq, &rf);
> +	rq->next_class = donor->sched_class;
> +	next = donor;
>  	if (sched_proxy_exec()) {
> -		struct task_struct *prev_donor = rq->donor;
> -
> -		rq_set_donor(rq, next);
> -		next->blocked_donor = NULL;
> -		if (unlikely(next->is_blocked)) {
> -			next = find_proxy_task(rq, next, &rf);
> -			if (!next) {
> -				zap_balance_callbacks(rq);
> +		donor->blocked_donor = NULL;
> +		if (unlikely(donor->is_blocked)) {
> +			struct sched_dl_entity *donor_dl_server = rq->dl_server;
> +
> +			rq->dl_server = NULL;

I'm not able to understand this special dl_server handling.

In case of "pick_again", pick_next_task() will clear the rq->dl_server
before the pick and for "keep_resched" with idle task, I don't think the
dl_server from pick makes any difference since we'll come back into
schedule right after the switch.

For rest of find_proxy_task() we don't really care about dl_server afaict
unless I'm missing something. did you trip something that required this
change?

> +
> +			next = find_proxy_task(rq, donor, &rf);
> +			if (!next)
>  				goto pick_again;
> -			}
> -			if (next == rq->idle) {
> -				zap_balance_callbacks(rq);
> +			if (next == rq->idle)
>  				goto keep_resched;
> -			}
> -		}
> -		if (rq->donor == prev_donor && prev != next) {
> -			struct task_struct *donor = rq->donor;
> -			/*
> -			 * When transitioning like:
> -			 *
> -			 *         prev         next
> -			 * donor:    B            B
> -			 * curr:     A          B or C
> -			 *
> -			 * then put_prev_set_next_task() will not have done
> -			 * anything, since B == B. However, A might have
> -			 * missed a RT/DL balance opportunity due to being
> -			 * on_cpu.
> -			 */
> -			donor->sched_class->put_prev_task(rq, donor, donor);
> -			donor->sched_class->set_next_task(rq, donor, true);
> +
> +			rq->dl_server = donor_dl_server;
>  		}
> -	} else {
> -		rq_set_donor(rq, next);
> +
>  	}
>  
> +	put_prev_set_next_task(rq, rq->donor, donor);
> +
> +	if (sched_proxy_exec() &&
> +	    donor == rq->donor && prev != next) {

nit. That condition is too short to need splitting into two.

> +		/*
> +		 * When transitioning like:
> +		 *
> +		 *         prev         next
> +		 * donor:    B            B
> +		 * curr:     A          B or C
> +		 *
> +		 * then put_prev_set_next_task() will not have called
> +		 * the class->put_prev_task()/set_next_task() callbacks,
> +		 * since B == B. However, A might have missed a RT/DL
> +		 * balance opportunity due to being on_cpu.
> +		 */
> +		donor->sched_class->put_prev_task(rq, donor, donor);
> +		donor->sched_class->set_next_task(rq, donor, true);
> +	}
> +
> +	rq_set_donor(rq, donor);


(+ Andrea for sched-ext)

On current tip + sched-ext changes lined for v7.4 from
https://lore.kernel.org/lkml/20260922165445.943315-9-arighi@nvidia.com/
some sched-ext bits will need rq->donor to already reflect the next
selection before they are called and three "if (sched_proxy_exec() ...)"
splits in schedule() looks all over the place.

I'm not sure if 8ms overhead is that visible in a real world workload
especially where SCHED_PROXY_EXEC brings much more benefit to balance
that overhead.

I'll let John, Peter, and Andrea comment further - last I remember,
Peter preferred keeping all the sched_proxy_exec() related bits in a
single place in __schedule().

> +
>  picked:
>  	clear_tsk_need_resched(prev);
>  	clear_preempt_need_resched();
> 

-- 
Thanks and Regards,
Prateek

