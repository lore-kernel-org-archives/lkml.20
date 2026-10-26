Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792984207;
	b=AUUIYlGwSyxoCjzcoAACKrTx6wJFkxkWEZYaUxki1MZ9pTmcXwx7xQOOPzygVTquIuJa
	 5ARgfKhnK1zizNg848GTYAnTFT+hs78SlqY3bDWQYugtPBxc81twtrZOqAqyr28AB3Cmu
	 7SyyyiEX6euDg6+npy/9pKm9bCgGqvCjDfgUO1AHd7misplvQmaHZPg+PXoe5FdOJFmbY
	 FfQSlNNbmFEXmkrDi28D03HQX8NhRcRUPXl72tkcharuY0h4JnuvmFFFgjEcp5NRm74uL
	 Z7eYMRlG/yIolswjUehvyXQdkhd7mmm2foSfQp8Pe+Z0mJmLGCDnR6bnwPLS6zdpM+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984207;
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
	bh=SS1gy/Ap/KyhwDRkcQyaHCmnTVhIuGDMfjouAv7MnDc=;
	b=WoAZ2x32hW3PxKNnFq+Om1eE/QTWjWwAOpx15mrdbMKNraOcHJFKWvMg1+zD5u5DcjSd
	 A7aDcKu+PFLT4yOQifGsJe8ZDqT1nv8AUAO3g6N39O4Fp7bXzqSsbPIoT2b5HlKgq9jKT
	 tNnym+CAc9Me8PUlbRX0t1dLVagJgtju8W0soepYgjNcnIXo2gocJy2mS8mU2lqaSIxPx
	 yKA/msvSOqa1UHhlg7scmwICg/bMIhGAbSpvxLTEpfS1MIxaL+Dk+eXeNORpLDu1puDA/
	 dMg/+VKGnoTF6fRq7vZtDg2VeVLIfeyYhgR3f7Bq4+8qkq/DW32SBO+B1sUrdH4sKmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jKkKCbce;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E24606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E24606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jKkKCbce
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZ8zinO6cTQlt/9L3Ed3dg4vtK8e5A6aIBPVE/V+ZztpjEqFffbSJTsUkLmjrdATyvhS4GRQE3kigmlNIpKlUXHWdndNllwyHcU46/be3BIrM+exzroDho8QvgzFWAInVWfoK5dWnu2s0b+HNjYIy53BHrkbfakM/VLIfvGEkTQXLvbUhoEfEz4tqcQGpRq3fixF6QsTupr64mqVyPWX67Nda/OpfN6ZhpISs1p0ZoZIPNous4LJRZjZz9Wb4IZpg5unvMW91cRTSrEf4M4/tvuafAl+XqarvYJRCGJLJ5AKepGww7IamJ7jf7hVL24fWlMLUdNyNbG4nJTn1qCOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SS1gy/Ap/KyhwDRkcQyaHCmnTVhIuGDMfjouAv7MnDc=;
 b=r3ZCCSMXUFamavs/S7tO9DQBNhAnAr2t7aKolyWXBJkFKs0rN9Odb9lMmrhluC1z0KqxykqW4Iis7U7pjCTANCVGO5DYYi2ldTEZF59mhLdtV5ZFOp8W7TXIGFQS3cOysLJ2eSsdWUxgGpaBuxebbOlnDtjjo26uK/H7ebyNnqS8IZYHuJ+BvmLQ8YM/U4ZJEQmiuf4D85SFxYuMYLxz+gM61LpHdR7iW9gYj3+PuzLS//WY/Frnat6a5gpdIjPsLWY8qDUp1tVkcst7Sldrh6I4chDHmst0pOpsIbu8yZoyPvaDMUfYSwa7f0DfqRfxpducgRBqEtr0fPJ8wtpEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SS1gy/Ap/KyhwDRkcQyaHCmnTVhIuGDMfjouAv7MnDc=;
 b=jKkKCbcee+pHqJzLnUAREjUNQsk03cMqeXSOi9XGVerv3xEdgfDtpUCqHy9nlPTfN5Z1pssVpSS0azQwZFn1+NvxNVxqAzgw9lCu2bMQLJ5GncP8i7TdbQJJy8kx3f84tYtmxTgI9/4iy9E4wCMDARXvR4lNQp2IQGntavdtkYc=
Received: from BN0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:408:ec::31)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 03:10:00 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::40) by BN0PR04CA0116.outlook.office365.com
 (2603:10b6:408:ec::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 03:10:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 03:10:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 22:09:54 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 25 Oct 2026 22:09:48 -0500
Message-ID: <637331bf-1b4c-4c1c-8205-0636c93d990a@amd.com>
Date: Mon, 26 Oct 2026 08:39:47 +0530
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
Subject: Re: [PATCH v33 4/7] sched/proxy: Set TASK_RUNNING when shortcuting
 return migration
To: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>
CC: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>, Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef
	<qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang
	<kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-5-jstultz@google.com> <atxuCoz3ZO_0j0Go@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <atxuCoz3ZO_0j0Go@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: cff4954e-562a-4d03-3d60-08df330e9f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|261022105027099003|261022075727099003|261021135927099003|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	WHS/49zG0xYQ17AXE8pjnevcmzTKaMnDoWibqHfGHWIXOy6mgoawoVqCTGMokpyibmrXQQiqluMHAIAw62LKr2MA22XfF0SaUka6O0R+9EmZ3k53ONeE1+BbNPnUZv4WQe8Xe6FzbmgdRupJ+/cQiPGkEyoQLph3NLVEvOBkM5PqNDCUn6sW1Eio+2YJuCKhNIInIJE6xRjgbASMO9cPr4ZyiCatrlh5l564gD3AcLvJuZBQQvYUPRTHVm20rME5ates8bXy550MfNGUB7hL1cZOp5dNBk4bNf+WVV3ZlwDCYZBq4Li9TLLW+HJLPZRKLR0AVrmB4ZARZvVHrCzfv+ZVD+dWnbs3z85n1wEZSrhuBqpAaPSn5EbNFH/mjAWhYW1XqTHnvkfBfAB5Bxv0TQ5YIFdM85TuLBau7XJnXS39JAO2deICXtoKZOvgNoAbtZayR6LqaDxqZVJvP37JszodFnIUmVn03+nORC1eJwzHMVJEYE4gXedlAMDpl4Tbu8QdSSfvka734fEerqSt+BHgcgxnzIbVHnJED7pEWWTvzUFh2foRhJJ50lVn7LkxqJ2x33gIyfjcmIFw/WYpadUOj6SWLYNZdo3jpF5SNe/hdka+YpKQWrHObVXTT58UbIdzl82SM+Cd3yWZn7yTJjiWv+PMr9y6tjjFvcsftVIA/JwzDeQHxyXLxDQTc4kTVRu9OOSmoHneUB8Qh1U7OQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261022105027099003)(261022075727099003)(261021135927099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bjHNUjp6TRgvHO1j/54JKJyVsmICDjCEySgbst27reE3hFuJJ/jSzAbaakLQggyr32rD5tW7tbg/KUy7oPn4ikPw3sivbWJBRAHryOsi4kRVTt6kRPU74eFBs7DLVMJRljfsIkfgQbIY0q7DiaDaQoJqYVxGi9lz7p+vp8SS1oXFaGs0zZA9O36H6pA3HyNnyjVO0tajbD1mvhehwf3+BriRn/AfbWf/lPPG+7YeX09aQe5Mp2w5xXX5GOLuvr+prPF8HiGPKXXuX0FKzx7jnnUA4wmA63bPfQWFII70ZDim4AC18bSvTIINf27Vhl/I+/xB7hHA8mxbOF40fwpMvXdduySOq6biF4XvCFsu/ZZpvC2MUuBeNUOW3bkRAfruA6O7cvGtni4X1VRLJzBICrPMFYRVneX7GgeSDHXHAZ9/mQiyqI1q84sLpfAB6tS3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 03:10:00.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cff4954e-562a-4d03-3d60-08df330e9f09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

Hello Andrea,

On 10/24/2026 2:06 PM, Andrea Righi wrote:
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 2cb42de255f7a..43ba76b5a3464 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -7028,6 +7028,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>>  			clear_task_blocked_on(p, mutex);
>>  			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>>  				p->is_blocked = 0;
>> +				WRITE_ONCE(p->__state, TASK_RUNNING);
>>  				return p;
>>  			}
>>  			goto activate;
> 
> This is basically an inlined ttwu_do_wakeup() without
> trace_sched_wakeup().
> 
>> @@ -7065,6 +7066,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>>  			__clear_task_blocked_on(p, NULL);
>>  			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>>  				p->is_blocked = 0;
>> +				WRITE_ONCE(p->__state, TASK_RUNNING);
>>  				return p;
>>  			}
>>  			goto activate;
> 
> Ditto.
> 
> Can we just call ttwu_do_wakeup(p)? It'd also avoid having two copies of
> the same state transition that can diverge.

That is a good idea but I wonder issuing a sched_wakeup trace without a
corresponding sched_waking trace will trip some tracing scripts.

That said having a __ttwu_do_wakeup() to consolidate all the task state
changes in indeed a good idea. It should technically look like a
__schedule() raced with a wakeup. Thoughts?

-- 
Thanks and Regards,
Prateek

