Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793158637;
	b=Oo1puUs5UCHxeaoyOGkCo0b/qrRC+wdWC2Lm3gT8McVnS8WUtRiAkzZETw06vNNJ+EY1
	 ljF3RR4YwzLaLunOyxs29z7R6CN3f5aVl8oRVhswB6MJKmZrJQRxqFAKCgcpTvHNYE5bP
	 ZN3Yb1NEu6/zSenUQqHstPFUtUWlgUBQYctERzMT4XLALgIcj2V3c9ZeOOLIqiaigkQ5j
	 fZ+2U98drhOFsJO8bR+vltidAfiOx7KrNk9Spm+WpYVk80Z1Tjip2TKGKFviZ31zbdAyR
	 cP+bOB13ogcmq5yx8AIsTxNrprJCrtIfjrcsZf/f67UkoKXMsPhmA9T2ZOXC43Z2pKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158637;
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
	bh=8Shcz6ARKMQNmlKExc0x3vMWUitanMUyjEb9zjCnr+g=;
	b=VW8Nie01fbg8GF0wQx08aPnC9y9B2ia5sZpIazE+pl4eGYC9xfPokQxbCVh6XJhhXEUB
	 No5oZpqr5/DHi1qUfYskbHUy51WjDrnEiSuJ+8sdpdA9/8+sTsFdFbjz3e2Qww9/V4PRv
	 YXf4MDz6VlzzwgF6307x9gf0CmIhbASh0oMtie81IoUrT5WLaTP7ZYhDANFOFzOP9cXWQ
	 IoRrxNu83Jo95sIfyXkROWjJO9MY4WtIVMfQHuJxBWnfc8uZndDnPgVawuTxEPbhzEsoD
	 f6grrhFdZg5+fAXlbQ8q0+HqWzDquyEKNeDEtIW8fY7gzQ5k3ivEPXgb+8N8OaVq/jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sk3nOfld;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.9
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DAE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sk3nOfld
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x139LxtZLli3JsLrasimMYtzQPKngnN5dDZI7CfA44uS57ZGXVbmOJXLyDvh0cboVMFPbSP0dUnFF/6tPDG0iAIfDgIKvqZ2tNqoViPxy/Hzk6ASOu+ONcZ5gJr0x/c65SiXITBcjgYvxv7ze8VKPs3wwZP4FRswlODv3DkL0iWhVuRsfuIThd7BkXcZSbEjZ1/m/oSth/DnKSKzUoQkPuWL8ZlEhIAo+zKFmzkEDq7Gw0ETrN914ML1R8wcmyc5U4wxZsMo4sv8V6JJkLvAVDZws16S61HqQjsEGPZJSyPSLdZQvJOqvUTW1N+2X1f/fvScFVaWznTqeZVkJMMDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Shcz6ARKMQNmlKExc0x3vMWUitanMUyjEb9zjCnr+g=;
 b=A+6Rtm/fQ/HhawKw2w0HcyhihAvZ2akFRuBnIHvaeXiMZpr3MdDZnBzCHpx6xqEpDFK2mFLJvEfcUovHtjjmqhpptr6WnvK5LfXabqaQ1mZLsKumfV5aGGJhjM/tPb4HmBIpbp/N2vXogwPFwaHLHcTuvX5PhkbmOuYMG5CUqTAGIus94YDATbayW1hG6szrnYaMSXw2qX2EOowBzCzSq/57VQAf0nV6sqtrLOlWYDON/UBuAH0xk1Gsuf1ZwCq54y/otGu8PkyzmkOGQVBJXv2XVSqhc3FUA5OvWfsMRKVDnv4tulncUMim9z4eY65a4TctzGoZuL8ToAqcKtIBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Shcz6ARKMQNmlKExc0x3vMWUitanMUyjEb9zjCnr+g=;
 b=sk3nOfldAQoZmyeSY9tDdedcsnioEdUY55oEKMlimfeW0Ics1iJRRSGhBqJeJKYjd3+p+L8rrkiUEAXKb4QlbSzS4JUtKIty5PD8uB7rbNYTBaxJKMA7HUXi6hBeD3XsbGmXEgQEL1wLOyaRNPuHA2s3J2krnUnm13xcngd2hRI=
Received: from CY5PR15CA0065.namprd15.prod.outlook.com (2603:10b6:930:18::20)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:36:54 +0000
Received: from CY7PEPF000000F3.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::4e) by CY5PR15CA0065.outlook.office365.com
 (2603:10b6:930:18::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 03:36:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY7PEPF000000F3.mail.protection.outlook.com (10.167.247.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 03:36:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 22:36:53 -0500
Received: from [10.85.38.248] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 22:36:46 -0500
Message-ID: <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>
Date: Wed, 28 Oct 2026 09:06:40 +0530
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
CC: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>, Peter
 Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>, Connor O'Brien
	<connoro@google.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, Valentin
 Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Qais
 Yousef <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang
	<kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com> <atx1U_0FC-fazkV7@gpd4>
 <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
 <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F3:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 6400e353-a943-496d-8fdb-08df34a4b5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|36860700016|376014|82310400026|261026140227099003|11063799006|5023799004|4143699003|56012099006|261009223027099003|261022075727099003|10067099003|261022105027099003|261021121427099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yPfeRLTzS6riJluvmXujtaPlbkvFfEnLTj62occkH6Z0E2eqUU9Klf1EQ5hrbLFH+MxYceJpM6eKMzG7SI/jOoqoJlK8RMRPTqWKa7G0JDQoJOB+wGs1xmZCQ9CbFkPCcShk3xIDZ8sL8n1GRZgfeZdDpfFk/zRVmNeVMptXXO+F/o9Q/6EncEHsXU+yxfsS2efWTxgssP55dHRuOspPY6LpUOwQyWGkTLfoI7GQ7KMNkh/GqY+azthuAEkhYaMQqlBK/iZ8VqrT+D2NZzf2g8MRZ8r8A3ZEVi16EzY6zWrWKE6Je+NPbozW8XgeI0ulwRUnifx2kaucQUVCvX8Lj87dkyWYzOfK49dPyGW+CeODYBd5K0J0Rd+3PTtp6S0E98bMtjY+DwJkzQE2jihwsSyMek0I6Ead6u3IfbmVzL5U/lw7fuZz4Ze9Hm93Xb/93FtQwz+V4u3ErU97yKstn7gMatcuoGJcoyw/9QhlGqoKlbdfCDg19q2o+5Gb/vCFHzqID25UQPUsiMhwlVJhORLV48NQQsRQrWnbQYtfn0It9qz/OTlJjQxxYQY+y4bvfO3CNEmxsQBoBpZprmnbyuJm+B/f2RG0CBgCYHlwaKlJP7gIkL0qj57d6uKBdSQPpVdhdwcHx7uipLUZFqJAImmAUoH1ZSu3DmqCMusFw0Gk7sEUaT58my+vsBglDCCO
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(36860700016)(376014)(82310400026)(261026140227099003)(11063799006)(5023799004)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(10067099003)(261022105027099003)(261021121427099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c3PS3JDntjENFludPjr79sdgDA8z4eev/+ecavxj83+D0ed7l3OxHXq91y6J1aG93SDBN89I+6JQkWq5c4iFgupaAPXqV8EFvtKtmdgHFQu6SngJjB8lau7y8e2sycvBuX/7LiCjP6tllFvzHNINVxhLPRZonOUYZWCk8IszKxp17V1N09rRbzWCVtAshfBAGs0o7Z83SV16hdt1UTR39ZPErSeVsHTunQJzjQxEIJstP27gQW+e7gooJptPy44zkCLf/j0uTs36zwteDLZiE0MiDEpvPSaA+s9VB4o0D8OvGFiOCtKji9PfOArdl8tTsE+pjJ9P32PTF95OyeBApbg2HuO2jiFBrr/Hw5GmdqC0dau7g74hA6U9Xesstk/DsZw5YwFuqMc5mAj5jJng15DONouh7sIaXlmzGkAMDMzZPStqiooQ3zMkMnv+nbI8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:36:54.1263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6400e353-a943-496d-8fdb-08df34a4b5f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598

Hello Juri,

On 10/27/2026 9:52 PM, Juri Lelli wrote:
> Hello!
> 
> On 26/10/26 09:56, K Prateek Nayak wrote:
>> On 10/24/2026 2:37 PM, Andrea Righi wrote:
>>>> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
>>>> +{
> 
> ...
> 
>>>> +		if (task_cpu(p) != target_cpu) {
>>>> +			en_flags |= ENQUEUE_MIGRATED;
>>>> +			psi_ttwu_dequeue(p);
>>>> +			proxy_set_task_cpu(p, target_cpu);
>>>> +		}
>>>
>>> Can this break SCHED_DEADLINE bw accounting?
>>>
>>> p is sleeping here (not TASK_WAKING, not TASK_ON_RQ_MIGRATING), so
>>> __set_task_cpu() skips migrate_task_rq_dl(): the old rq never does
>>> sub_rq_bw(), while ENQUEUE_MIGRATED makes the new rq do add_rq_bw(), so
>>> this_bw is leaked on the old rq. And if p is still dl_non_contending,
>>> task_contending() on the new rq just cancels the inactive timer, leaving
>>> running_bw on the old rq forever and making it underflow on the new rq
>>> the next time p blocks.
>>>
>>> set_task_cpu() doesn't help, because migrate_task_rq_dl() bails out
>>> unless TASK_WAKING, so I'm not sure how to fix this case...
>>
>> I wonder why "p->dl.dl_non_contending" is not sufficient to know if
>> there exists residual bandwidth on prev CPU. Seems to have been like
>> that since commit 209a0cbda7a0 ("sched/deadline: Improve the tracking
>> of active utilization").
>>
>> Only time task is non-contending is if it goes away with DEQUEUE_SLEEP
>> or switched_from_dl() with dl_runtime.
>>
>> The latter doesn't need migrating the timer as the timer will either
>> be cancelled if the task switches back to deadline, or will expire
>> where it was queued - set_task_cpu() has no effect in this case.
>>
>> Only other case that marks "dl_non_contending" is sleep + wakeup and
>> for that "p->dl.non_contending" should be sufficient. I don't think
>> we ever do a set_task_cpu() for a blocked task other than wakeup do
>> we?
>>
>> Juri, Peter, are we missing something subtle here?
> 
> I think Andrea's concern is valid, but I'm not sure I follow what you
> propose Prateek (apologies!) or are you saying you don't see an issue
> here?

Sorry for the confusion! I do see the problem and my question was why
can't the bailout in migrate_task_rq_dl() be something like:

  (Lightly tested)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..6a081c2b7191 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2654,19 +2654,23 @@ select_task_rq_dl(struct task_struct *p, int cpu, int flags)
 
 static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused)
 {
-	struct rq_flags rf;
 	struct rq *rq;
 
-	if (READ_ONCE(p->__state) != TASK_WAKING)
+	/* Inactive timer is not armed. Nothing to migrate! */
+	if (task_on_rq_migrating(p) || !p->dl.dl_non_contending)
 		return;
 
-	rq = task_rq(p);
+	/* Task must be fully blocked if we reach here. */
+	WARN_ON_ONCE(!p->is_blocked);
+
 	/*
-	 * Since p->state == TASK_WAKING, set_task_cpu() has been called
-	 * from try_to_wake_up(). Hence, p->pi_lock is locked, but
-	 * rq->lock is not... So, lock it
+	 * set_task_cpu() has been called from try_to_wake_up().
+	 * Hence, p->pi_lock is locked, but rq->lock is not...
+	 * So, lock it
 	 */
-	rq_lock(rq, &rf);
+	rq = task_rq(p);
+	guard(rq_lock)(rq);
+
 	if (p->dl.dl_non_contending) {
 		update_rq_clock(rq);
 		sub_running_bw(&p->dl, &rq->dl);
@@ -2681,7 +2685,6 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
 		cancel_inactive_timer(&p->dl);
 	}
 	sub_rq_bw(&p->dl, &rq->dl);
-	rq_unlock(rq, &rf);
 }
 
 static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
---

Isn't task_on_rq_migrating() || !p->dl.dl_non_contending sufficient
bail out checks given the inactive timer is only armed for fully
blocked (DEQUEUE_SLEEP) tasks?

deactivate_task() + activate_task() will not leave an inactive timer
so task_on_rq_migrating() should be enough to capture that and if we
are doing set_task_rq() on a blocked task, it must be during wakeup.

> 
> If the issue is confirmed, I wonder if relaxing the first check in
> migrate_task_rq_dl() to something like
> 
>     if (READ_ONCE(p->__state) != TASK_WAKING && !p->is_blocked)
>         return;

So, the problem is we we are doing an block_task() + activate_task()
for proxy donors and they do not see TASK_WAKING state - the task is
fully blocked (say TASK_UNINTERRUPTIBLE) for this whole duration.

block_task() can arm and inactive timer that needs cancelling before
the activate on a different rq but since we don't do TASK_WAKING,
migrate_task_rq_dl() will bail early and the timer is left on the
old CPU.
 
> might fix things, but then it's ugly to call it from do_activate_
> blocked_waiter(). We could teach set_task_cpu() about blocked waiters
> (otherwise it warns) and then call it instead of __set_task_cpu(), but
> I'm not sure it's any prettier.

If something like the suggested diff is alright, then proxy can
simply use set_task_cpu() (followed by correcting p->wake_cpu) and
everything should be alright.

-- 
Thanks and Regards,
Prateek

