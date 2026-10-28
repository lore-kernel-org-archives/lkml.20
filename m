Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793182324;
	b=X69DD/Irf7zj++Xp4miVDioRJklYYLqQoUA8d8YdVwfi2GWkM0Q15gvU3T2tboVxJkP6
	 4jEoULPbCQvK1sFzHmdPWIPrMByljIsRntg6rIzcthnVJz3h1soBbFGZ72XuwuhZbNEII
	 1WU+ILd1lisT6nTGaqhxqQzH4S4VJUnmT5i0LK+fY2YPtsIv2Qbb9EnAVW/o2EpYgOkjS
	 lRR2U5ZEcU+gHGIUhchVNqawiowUhU0N+5a2IukZft0MSS49vdHgQfKhFfCfmVZEYKsEy
	 8hQcFul1yUMUWbuzB19BUsqNsT3TepIsde4S/RswLzrvpIssfC4AjB1QzZwte4FTMEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182324;
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
	bh=QE5Iput/A73cHnDEp65FdmNAl0pjl80R+82sUJbjIgQ=;
	b=vSQhLVbqpyLLMaz/eXUby+skQ82d15lktkkE4UPuOkdyxXnv47eWR1+r+taECODsuEKp
	 lHaH/IqbxmEAAQ6/CSMYf4VwEXUMmA+zVjs6LpTOlHdLTyzL+fVyKjj8fd7Hvg02nS/6O
	 vPQn/PatxvxquOftkr1vZyhSeXXcILYbUvZgqP+SjlVdNAYqYB1vBNihSoR/wqK3UVzfK
	 P2Vo1e3pGSqnd1+KLCdyELaf6Tr+2w/IEkC3YN+ZZBmxS4a+qpnWs/2AUuz1AHVgqmWyC
	 p/T5Ru4l4LfovKAGXYxdKJtj+ne64/BGIFsbYWFnJeWNvSrHIFtHUjGvV4Z1A9J25RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=crY2zPJB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.46
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6971E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=crY2zPJB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+GJF4kuJWuz3SjwcMU6EoEQwRt/H8M014dcsUEBhmaOFPVjp+NzMCTzB3Vb3+L9xrtJu7dq49fedVz1JW6MoMa1F5bX42ctIbYZeeQU4YEo/J2iy0MEo5/v/CTsIPKPV2QNRnlew1g28oukkfIDj7VtHy7jjm1hSiVdeqfSX0TDy3XMEbnfAQQ3tACkfjc0F51GZ1+0dHxEx2GS2dqPVbN8oIyrX1kufB9GMiqTJxLMDfJivM2/w6gpesiP7lDgLVZUROr7FvTNYOQMAF39SSHUuDBdf5aYd5MblocAOVMvHJ61GT0sJoOP8u/5VHBYJ9CFGNtBR5j7vUGIm29rhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE5Iput/A73cHnDEp65FdmNAl0pjl80R+82sUJbjIgQ=;
 b=wsBxRRcOxuJOC3SGFM7fUPD9rxXFV58ECXSKsgaASH5MA+hnek/6Q1BQ6847CdQVQN5DhKENsuyAWR/HhxNmBEgqcJMEdRPByhXSTAEjtfWJBH5v3sX8uH4m3b89+u95hn6sfeAi/zAkkuASP/JeePAKOR0aEqUAwp+ahuyNzXOLp+uDq0Q5s4WpHu0C2/pTHCl1ClGnFkPhShbQM7POdtJbdINdWiHgTKGDLgMHHZMdY+0TYfhsC3WbUV+wwTOZwuJXBEaUbf0rLSx7P0zaW96xESuwfLmRY09N1xRd5NFOq9zRFwhiJ0aOOga19UFbSq1s9kyl9JWFNfXLX8KB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE5Iput/A73cHnDEp65FdmNAl0pjl80R+82sUJbjIgQ=;
 b=crY2zPJB83dAEP2FPM/unQpOs4PokBFrWboVP0z/gLmT+c1y7n281NwuJnNwej9D830/QKKo/2LFQzJnWb8es+Wt/zT/1GzMxk7tHo2gBQ1SiK0UwFBtOkcXNXLNW+laJ20I+acnOYVQgUh86oL4CQof/mh/N8RONFvWV+lWA/A=
Received: from BY5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:a03:1d0::17)
 by PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 10:11:58 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8f) by BY5PR04CA0007.outlook.office365.com
 (2603:10b6:a03:1d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 10:11:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 10:11:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 28 Oct
 2026 05:11:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 28 Oct
 2026 05:11:43 -0500
Received: from [10.85.38.248] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 28 Oct 2026 05:11:37 -0500
Message-ID: <1bfd6376-cc69-4c55-ac3b-6ea12b8c6c75@amd.com>
Date: Wed, 28 Oct 2026 15:41:31 +0530
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
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
To: Juri Lelli <juri.lelli@redhat.com>
CC: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>, "Peter
 Zijlstra" <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>, Connor O'Brien
	<connoro@google.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, "Valentin
 Schneider" <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, "Qais
 Yousef" <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo
 chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com> <atx1U_0FC-fazkV7@gpd4>
 <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
 <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
 <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>
 <auHH9ixQvWQ7RYA3@jlelli-thinkpadt14gen4.remote.csb>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auHH9ixQvWQ7RYA3@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dbae39-30f2-49ce-f1d6-08df34dbe712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|4143699003|5023799004|11063799006|56012099006|261022105027099003|261009223027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3UzDCgEfAwFoHu844DPylaqjPdOHUpt16RZIgjNvmBM+zPRKXBqxMieqDVoTST/KHR5c3zRfPPx/W1gDDqxtiIfuxH/rrWXIxRWeBESnrDj+0WkdU/caZNCT3/Dfdnn4hXuHtF8a934BpSMY/txlme36yH3Tdd9SH4Z/6TcV48ANaMyU0vqkqg+DPI6Bir7OTcHOfY1DrTH0rGCUc/hyyh72SooEzDF+S2OMfM4HfQ+0l1vDR2UVV9uxy843xwEmd5Wx7jjgxcrMbEtgQBIGnAIAF8dRLCT5Mw8YCdTzHXB0C/fT/IJYWCtmcA5X8SJNh6Ri4yq83ME47dVwMfwBf1Zh3fuV6MleslfxyChQgRXPiMDvA7zomBkJV7B3rwmN6OmUQXD33Fb8+KYQy0ZuPelfv47p5eimERqg+q4UhfVNbeP6LoQ08YxwGmuB2NeVUiLUWVz+ZQkiEoOKffSetmEapw4kPu1SsC6y7q8gwLFufjnDqo3/mH4v15UBirlDon2AeiqIzuklvUCKQFeYaCITRXpfaFKtmfygy7bVYkyBhOaamzzWI2q0WlN5iIjxynLKJ3AS5nVCRSBvCoWmLgTQhhUc/spgbmkki7swsRLRdfNGiB6iv+Fx3VI3ZP8fHu7NRQ866A/hoU2bdYPs5YgXW9nQ3weeGg5uDsBA6ZaKmMBuDNvC0sbafG3w21Z8s3XKXBQSVQYtFK49iKp2/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(4143699003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2toy+YeLJzFGoLoYxA71uLHvEKE1y9CAcg7/0/9QPs43a6qHGuXAmf2E/JYVid+APPKAJ72R+Ig3PRlcGnVGPFCPNWJor5yNP4zX2B3jJ6EMoT7Y4ZVO2WGxVhSlTDFrv10pI8MHzkWDp3W2AQKee7oPr+ZCD2pihzEQLuSRzOs4rtWXQPQahrz8p6a7VLGSlUY/OgKAw9tgg10Sy9m956ki8RHQPyF0JHhNA/tfi7XhOqCSnw96zl9TMv5NYQ8jCcPyKCkrQDr9uusA9toyOZvv+O/sg+37iVGSKahEWwPQrUajeucZddjCf7QvcizvcmLMMpPZz91AQZb3KGzKqMIMq5nORwU5iuuIBeTl7R3wvw5EHeN8BuB4uiVQFprCpTWmyhmf8nYpjXDzyC/7vQiiIq6N4vgnOCt00Aagsv0CYpsevSDO5qN4OYRM8Guq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 10:11:58.8134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dbae39-30f2-49ce-f1d6-08df34dbe712
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223



On 10/28/2026 3:31 PM, Juri Lelli wrote:
> On 28/10/26 09:06, K Prateek Nayak wrote:
>> Hello Juri,
>>
>> On 10/27/2026 9:52 PM, Juri Lelli wrote:
>>> Hello!
>>>
>>> On 26/10/26 09:56, K Prateek Nayak wrote:
>>>> On 10/24/2026 2:37 PM, Andrea Righi wrote:
>>>>>> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
>>>>>> +{
>>>
>>> ...
>>>
>>>>>> +		if (task_cpu(p) != target_cpu) {
>>>>>> +			en_flags |= ENQUEUE_MIGRATED;
>>>>>> +			psi_ttwu_dequeue(p);
>>>>>> +			proxy_set_task_cpu(p, target_cpu);
>>>>>> +		}
>>>>>
>>>>> Can this break SCHED_DEADLINE bw accounting?
>>>>>
>>>>> p is sleeping here (not TASK_WAKING, not TASK_ON_RQ_MIGRATING), so
>>>>> __set_task_cpu() skips migrate_task_rq_dl(): the old rq never does
>>>>> sub_rq_bw(), while ENQUEUE_MIGRATED makes the new rq do add_rq_bw(), so
>>>>> this_bw is leaked on the old rq. And if p is still dl_non_contending,
>>>>> task_contending() on the new rq just cancels the inactive timer, leaving
>>>>> running_bw on the old rq forever and making it underflow on the new rq
>>>>> the next time p blocks.
>>>>>
>>>>> set_task_cpu() doesn't help, because migrate_task_rq_dl() bails out
>>>>> unless TASK_WAKING, so I'm not sure how to fix this case...
>>>>
>>>> I wonder why "p->dl.dl_non_contending" is not sufficient to know if
>>>> there exists residual bandwidth on prev CPU. Seems to have been like
>>>> that since commit 209a0cbda7a0 ("sched/deadline: Improve the tracking
>>>> of active utilization").
>>>>
>>>> Only time task is non-contending is if it goes away with DEQUEUE_SLEEP
>>>> or switched_from_dl() with dl_runtime.
>>>>
>>>> The latter doesn't need migrating the timer as the timer will either
>>>> be cancelled if the task switches back to deadline, or will expire
>>>> where it was queued - set_task_cpu() has no effect in this case.
>>>>
>>>> Only other case that marks "dl_non_contending" is sleep + wakeup and
>>>> for that "p->dl.non_contending" should be sufficient. I don't think
>>>> we ever do a set_task_cpu() for a blocked task other than wakeup do
>>>> we?
>>>>
>>>> Juri, Peter, are we missing something subtle here?
>>>
>>> I think Andrea's concern is valid, but I'm not sure I follow what you
>>> propose Prateek (apologies!) or are you saying you don't see an issue
>>> here?
>>
>> Sorry for the confusion! I do see the problem and my question was why
>> can't the bailout in migrate_task_rq_dl() be something like:
>>
>>   (Lightly tested)
>>
>> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
>> index c0ebdcde5fe5..6a081c2b7191 100644
>> --- a/kernel/sched/deadline.c
>> +++ b/kernel/sched/deadline.c
>> @@ -2654,19 +2654,23 @@ select_task_rq_dl(struct task_struct *p, int cpu, int flags)
>>  
>>  static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused)
>>  {
>> -	struct rq_flags rf;
>>  	struct rq *rq;
>>  
>> -	if (READ_ONCE(p->__state) != TASK_WAKING)
>> +	/* Inactive timer is not armed. Nothing to migrate! */
>> +	if (task_on_rq_migrating(p) || !p->dl.dl_non_contending)
>>  		return;
> 
> But a task can be blocked/sleeping and non_contending if
> task_non_contending() was called after 0-lag; in that case running_bw
> was subtracted already (see zerolag_time < 0 -> dl_task case) but ..

I see what you mean and I didn't see that the sub_rq_bw() is outside
the p->dl.dl_non_contending block but simply checking
task_on_rq_migrating() for bail out should be enough to cover off
!ENQUEUE_WAKEUP cases right?

> 
>> -	rq = task_rq(p);
>> +	/* Task must be fully blocked if we reach here. */
>> +	WARN_ON_ONCE(!p->is_blocked);
>> +
>>  	/*
>> -	 * Since p->state == TASK_WAKING, set_task_cpu() has been called
>> -	 * from try_to_wake_up(). Hence, p->pi_lock is locked, but
>> -	 * rq->lock is not... So, lock it
>> +	 * set_task_cpu() has been called from try_to_wake_up().
>> +	 * Hence, p->pi_lock is locked, but rq->lock is not...
>> +	 * So, lock it
>>  	 */
>> -	rq_lock(rq, &rf);
>> +	rq = task_rq(p);
>> +	guard(rq_lock)(rq);
>> +
>>  	if (p->dl.dl_non_contending) {
>>  		update_rq_clock(rq);
>>  		sub_running_bw(&p->dl, &rq->dl);
>> @@ -2681,7 +2685,6 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
>>  		cancel_inactive_timer(&p->dl);
>>  	}
>>  	sub_rq_bw(&p->dl, &rq->dl);
> 
> .. we still need to sub_rq_bw for a migrated task, and I believe what
> you are proposing would skip that?

Ack! But this is only needed for wakeup so just:

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..20c388b55c50 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2657,7 +2657,7 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
 	struct rq_flags rf;
 	struct rq *rq;
 
-	if (READ_ONCE(p->__state) != TASK_WAKING)
+	if (task_on_rq_migrating(rq))
 		return;
 
 	rq = task_rq(p);
---

should be enough then?

-- 
Thanks and Regards,
Prateek

