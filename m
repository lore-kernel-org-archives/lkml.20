Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990825;
	b=kzndz4mLOtbRezlXRaUelv/4BK/6CjXJneSTtztgzAldGRpU84dQJP95ptWSwP59F6gg
	 UHPAqZ88tvoNw5WrOOBUePLVE1koGPnzCSuQUahRX8/iPyoZbOGI0eKCbzQMqdesBb7fs
	 iOzRCnhYaqhMywroOS0HzDRtsJlhv7tZvC2SczZ/DHLSwIYar9xQ5J4m6Yl2urjmKjTkC
	 hXsCXOgkdFnqgvTHSRrFYqBpluKhsvKIPhqYO+sPmeLdqB7gm4m5vJ+uwBjyb0sUJ2yDF
	 XasSnTYKTFB9YG/egKOFTjG/hjd3D9Cv/bZRleeQP+cpxR+S1fIDazcJ8hdyZKWacug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990825;
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
	bh=Q5drd3yMn5vvDNR7RFXIAyHOzMT/U8zWqwSU4Hy9SEk=;
	b=PxUzjdBcV7m4h0bq6SJtq2Am2u+ANWIJsjB/xHow5scXjBgWCCIfPdZ2D/GmCsCDtiZU
	 TRgdNnR/25g8TarMxBCbl4ReJ4ivmRNCzxrjDb8VBDJRgkUiXXOrgT6u0X8+zhqsSOe1W
	 HGVUPWV9OpmGikpm802nT+7mT8aBOT2/H1xghPC/NhoWsuvgepoQYyGw6m9qFWAoc9PO1
	 SzT5hgmPL0YIpc/xv6fJQHn4G1TxgMJmV/DYxwaNlDtLmqoHSF+qV1iAuoeXpk+sdDxQQ
	 YRC43KVDH0pdt/WQATpEVV5NaXRxFxg+3w633AM1V/jg1SvlFXD9xbHRqfhqSXBBDVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=N0FRq9xK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.25
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D9606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=N0FRq9xK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGcAinx674uCIlInd3Mjr4AvLYRSFHVwX4NKfscdfG34I5WoA9fuqZ0cx0iR7VLjpQ73Fqqr8ev5mqlbIyiqxq6wnL40MBIFDp9dAluxL8rRoaveXctovGIw0n+gR7Urm06APQl+1M8EkiYxMZIgeWCFWn/JYf9tlW0UjfuUCm5YfU8CbF/6cPy6ag00vye2xv9RNC2PBYuW/SMm+w+OmFlpslAWGohLWtt44v2R25FU4a4jamI2QUAf+Lhn7idEaOIHWBLDztKJ29+NCd3G6X4DBUGDQWM1G48qsIldwKICOWOwGDQNfUhE3z/kgo45Rwbl0KCfTO+CXCv4I9zkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5drd3yMn5vvDNR7RFXIAyHOzMT/U8zWqwSU4Hy9SEk=;
 b=OpOLMOYPD/7KWAurVFf9rK3apnyRqGnPYV6eEBtkbbG8cqfkk0f95Xlmm0YWLcug0HDSoDPb3WUsxKP6gVX9BFFYDQDQmk/435IPAQ+/FjqKuTgmjdXVI7n5SCm06HoWqDKfljTshlBrTiFIcfHNymRowXCwNK3ZHJM39HeXUFU1+eAF+hAyAtFXCC9nlfzwsMtLBwfERmk1lqrJHt4a48EvkXXj+vuxe4Seg2YY8AdhXKVGwSKJ0fzsvaGRpW4t/E3TO+607k6gk1KPUoxOJyAE6VW4s0AOVOEkhxhB3n+mf7LPoMrQPS3elGhDmG0dtB6kLu+EYr1pacWDR5wVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5drd3yMn5vvDNR7RFXIAyHOzMT/U8zWqwSU4Hy9SEk=;
 b=N0FRq9xKscgVPzGjwasSAFaC7VAuyU3DfFelS/yR71hV1i2CMvsEaNpghtfza5Ihdru8L0A74xQwLX2u9z+s0MejVn5sj5h07eBWjYN5H1hT5SFP6Kz2+I15S9whO1yxjYzH5iuuE6Ye7ovdzVDoOJ74HeuPvwfdEK7TGjHE1ik=
Received: from CH5PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:1f4::24)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Mon, 26 Oct
 2026 05:00:20 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::94) by CH5PR04CA0016.outlook.office365.com
 (2603:10b6:610:1f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 05:00:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 05:00:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 00:00:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 00:00:19 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 26 Oct 2026 00:00:07 -0500
Message-ID: <58521a9f-2f05-4176-8b14-96c7b5f0e212@amd.com>
Date: Mon, 26 Oct 2026 10:30:01 +0530
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
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on
 off-CPU sleeping dequeues
To: Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>
CC: LKML <linux-kernel@vger.kernel.org>, David Stevens <stevensd@google.com>,
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal
	<suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, Metin Kaya
	<Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>, "Waiman
 Long" <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, "Qais
 Yousef" <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo
 chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-2-jstultz@google.com>
 <20261024114422.GA6775@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261024114422.GA6775@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd9934b-e9c2-46fa-918c-08df331e08f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|36860700016|82310400026|261022105027099003|11063799006|56012099006|261021123027099003|4143699003|5023799004|10067099003|261021121427099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hZy7sTkROEqyNnT+BookXQUarvjw1CUmntGslc6NeeqxhmtSrpFh43FSEpVcTaQGi8TfCiGlsQip8Y9udyT0rZKiuYeLpTpFlw6AuZEeCoCuxwS+4hGEKXQF8qzgBaoPNGiR5HYU+kX57c8NHhpfTkCqBBI+cqTp1IA5iRLVErZKG0skI4XBHjOrEQhymbmNsaffinmm6Lu9cl4sd1oAv6tcZ93sp2II6tkZHP3dHzWFu49bKCummj+WU90YiKO219UYb82a8iMTIotJuFX4U3w7DFAe49JPmn+jYfggA/qyDxuw+jQ1Gxf5uG8IdUbNi9LvXfagKiDIUNjUdvLRnnqp8WVqPPrAxzW5uxGsNzad/OjBZdGFbDcoDDU3+x+f/EWNOV/to80Ag/Sc8ziFEXTE1F4VzkPV6NWMIvW2/Kk7XskzkEIIgSTxPz2KZYHjgsykb+UyhTOGr+Dn6wnjP3/I2S59yutBYh5U4OMfNtBPfBlYstdn+FPQahD4HyqzB0ieeyV4ZPWuCUhS90mee/95ILf8Vv+8aoJC5OIaXaGp9TmIPjM4whFiK8P1fKE25D6WUH4U/aEgUyXh3y7fA5SFaPUsKtokeCHWddIQA2a+EVvL6LnMW3nKyB9730p1TQEcDUyRQN3QTvaaned8Oa3dDCq1cwW/wiotxcjFLo5KaCxMuAxV73pnnBnd3k0U+IjMyM1vQTMCw5Kc98rvMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(36860700016)(82310400026)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(4143699003)(5023799004)(10067099003)(261021121427099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UFTZ0+jEOeex8CXFIyOGjm5x32fqLdceRBYMdP5Ss4yldj3fiNl1itIFzvyKX8c2PGXgyUigPP1cu93UOOCK8U4GqudsKY7YKDOCJSa/iQ0ZNNBwkcPU8+5QVSFfZqNob6eIesWR7j9UqXkPvn+RYWLfZb3WwisCnoNAEElNOXGgb6hh2tkr90fJdGUiOpHjo4UaZaFbzTOTBmOJdTNaTluzh3OcrEUhtqj5tc+57/SvqglPlSGw+5lxHMkvkMuX9Gq21QFnJcLnLfpoPuQrZMORthivbahUCVP9BfhaxQqXoCVbjy8l4NXtrmpaEMwsTf7VwxzWjCF9dmm8CV9qVO/q0SKFPG5X60vzmhxvLbHR9sRtpRyL/uxefXKr8YYO5xWRet/MCtZ5TwJBsTsIt8MTKb+8+2gqqHAy0hiZSXmwVYvZZ39510kgZ12hGMTR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 05:00:20.1513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd9934b-e9c2-46fa-918c-08df331e08f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

Hello Peter,

On 10/24/2026 5:14 PM, Peter Zijlstra wrote:
> On Fri, Oct 23, 2026 at 10:04:12PM +0000, John Stultz wrote:
>> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
>> index ebe0a7765f98e..20820fe1021a1 100644
>> --- a/kernel/sched/stats.h
>> +++ b/kernel/sched/stats.h
>> @@ -175,12 +175,28 @@ static inline void psi_dequeue(struct task_struct *p, int flags)
>>  	 * Do nothing here.
>>  	 *
>>  	 * In the SCHED_PROXY_EXECUTION case we may do sleeping
>> -	 * dequeues that are not followed by a task switch, so check
>> -	 * TSK_ONCPU is set to ensure the task switch is imminent.
>> -	 * Otherwise clear the flags as usual.
>> +	 * dequeues that are not followed by a task switch. If TSK_ONCPU
>> +	 * is not set (meaning we already switched away while the task
>> +	 * stayed on the rq as a blocked donor), handle the sleeping
>> +	 * state transition here so sleep-persistent states (TSK_MEMSTALL,
>> +	 * TSK_IOWAIT) are preserved.
>>  	 */
>> -	if ((flags & DEQUEUE_SLEEP) && (p->psi_flags & TSK_ONCPU))
>> +	if (flags & DEQUEUE_SLEEP) {
>> +		int clear = TSK_RUNNING, set = 0;
>> +
>> +		if (p->psi_flags & TSK_ONCPU)
>> +			return;
>> +		if (p->se.sched_delayed)
>> +			return;
> 
> Must this really be sched_delayed, that is, cannot p->is_blocked be used
> here? I'm trying to push sched_delayed into fair.c if at all possible.

In this case, blocked donors going to sleep would need
to set the PSI flags accordingly (do what psi_sched_switch()
missed).

"p->se.sched_delayed" tasks would have already set those indicators
but can still arrive here from dequeue_task(SLEEP | DELAYED) of
sched_change_begin() - in all those cases, the dequeue flags will
also have DEQUEUE_DELAYED which can be used instead to bail out
early here.

Would that be okay?

> 
>> +
>> +		if (p->in_memstall)
>> +			clear |= TSK_MEMSTALL_RUNNING;
>> +		if (p->in_iowait)
>> +			set |= TSK_IOWAIT;
>> +
>> +		psi_task_change(p, clear, set);
>>  		return;
>> +	}
>>  
>>  	/*
>>  	 * When migrating a task to another CPU, clear all psi
>> -- 
>> 2.56.0.257.gf7497c7d27-goog
>>

-- 
Thanks and Regards,
Prateek

