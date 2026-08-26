Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B76361973
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764843; cv=fail; b=XXngjjsWf3veaN7Jo+h0VAYf0b0PJJLbc/IU9h+pguzwGQUm8pxWc3T0DcmZZlCEDE/yAr685IbjeAfkxIdZLhbWiDeJCfYEmNvJ104GoS77BGZPCh0//ZSs3/uiNPO52JETsR4hm0C8qpxlIkw6BQZ6kPyGArdudj54kTvQGn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764843; c=relaxed/simple;
	bh=eQ5PQ2DZUVHBM8plDUKyY5oBN15uWZYe36b7c5++Sco=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nDZy9R6g2KEgT/RdETp993mwjAPRZaAteMP2DYafvwjwehtVH4e01reMO80D7EySq/XldALyaNfh4XGz+7HvXxwZVUB8gs7N/hLFyFAvbTEVBt0ihK8CW3CvyBvOpNe2BaNczUIky++qxs48B2weK4Ef3C6sd6pJgyl9dTQvJ3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D3FCDfyG; arc=fail smtp.client-ip=52.101.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D3FCDfyG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVvS90zIgIJsjtQP48U4vUphUduqD6vVhOLw1qzLdd0p+XI59eknWnv5gLQqblJ5TO7IwZvPdDN/+Uc4bLx1GQE2vSoc+Bo2sMUM8WajP2q2lAUK5d1FmKiMvVpzPB7ibhNYwhS45dpnOHPkkFg3+6FtFMjARUTeP3mq2IyBd7AyDzQcbeBij0OQ06AKTlZXnPAkzGaDVNe/ZIvUV8WugstpuJWONjJaKbuxH3hDxvMAEedv2wuTZv/03OSDHUMdbiZY48qBMMDfLsySXAeLeU/PuSoiDtpkTOFcr+bxZtaz4Agoavk1l9je4vPpP+JcOZJuv2XhE5zro5VH3rpUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVVsN0uaKzJXaKRxH0+7Gsxb8oeEa2v8GP7AsocNtnA=;
 b=ZsW7/DRznh7F3nqr7mdVRzTu+KwUjBDHtYWSgO3G5kbbR7EZj4dLQUEWDBleDoeS4Y0tQd8Tjyhbq6Y5HkCY/HRAwNKazryHbdNxoF3sITMI+MolfKJFzC3lLn6mEDTFOXowJJH4qMZLhX2BYsNuOOZbjlx9MrlzEVBgpC454O4klWrZ0pDsPnHwkjyafGt+ywXZ4drmYnzlMI6LhqNrmWLrYiO8NVnBijN75i/qtf39o2WfcZrh1AgknkEziZyjgrMPULPTEbb56meKu2kq2lsXJTCyUXK223CDy+dphQnqC+KcicFpgOKE8Axa6Dhb1QgFgXHLpoMprpM7qukpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVVsN0uaKzJXaKRxH0+7Gsxb8oeEa2v8GP7AsocNtnA=;
 b=D3FCDfyGUxVdXhSXnnSYDyWBjFUesD+IfnzR7oapbimBvl5IjwCW+HCnWkZvod5U0+7ozM5qO2UGsPvN0quaK5PWi2tCIj8VV910txlBDFw7H8ELdO2B63PG6DOk5yEEPZ4RG4aTG1cy5fEo9Ya4XtsLaxNrEwiW0lz7HHumgBo=
Received: from DS7P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::19) by
 IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Wed, 26 Aug 2026 17:20:23 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:8:25c:cafe::42) by DS7P221CA0016.outlook.office365.com
 (2603:10b6:8:25c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 17:20:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 17:20:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 12:20:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 12:20:22 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 12:20:17 -0500
Message-ID: <74324f25-2e8c-4f90-8f22-c1788615b95e@amd.com>
Date: Wed, 26 Aug 2026 22:50:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/16] sched/core: Activate blocked donor when no
 owner is found
To: Andrea Righi <arighi@nvidia.com>
CC: John Stultz <jstultz@google.com>, Suleiman Souhlal <suleiman@google.com>,
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Waiman
 Long" <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-5-kprateek.nayak@amd.com> <ao8Mlls40IG9Vp6g@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <ao8Mlls40IG9Vp6g@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 6637a81c-ec96-4701-184a-08df03965031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7N6sa+qDbWJP0u9+f7/Q90v8llPew18qlwLQK2MX1OGWBW4eWkl8H1FRXRGbnoF49Ok9emrxY50WXNAbSS2f1NjEVBcDKurr3XymdO74xYuZAEYFvaBOAEHNyhROlY8zKuUQaWEDUEnsXf6eeDtn6NES7Xt7JdEtthSzthw5i1CXjwdYcXbxpElqufOwgfCdzpj4BaV+vYrKN/v9St0iyhMOF/RdhWB0sQ7Dlld5q+0YlW8VKj+U9OTsza2ZU+SHkObuwpypuEW4asVykGxBCENMy3EpHxn1ZKvtwnhyh2Xho6qTgr0pHjJbsTmriRwwIPEjjoNG+UXTS3DlrakE7iVeHRDYCF4yLXyUZEmrOUwXBaKYVMiGJyd/pqKY/8ikbeUlYRz2gB5nRaqnfc0MMRyYhvfJuF4Q61PPn72OD5C+fylR+gezz6x/qKosBvNJgNjGSNGqx0j5da9qkiPNt5iuh3QIUrPrnsaXkn9X/TEucG0anSTMHg7LYHHzGJq4QTZBUCTJzb3inplG3AZutbPjnZ80+w+X2QqBvdkYb5PSJ+MeJl6/0ZIiBd0VMF+r/8IYRUg0OFQtgvKAjkBU8H8C0uEaZe3MNI7KSNElLYMukJ6de4iWGh8toGQG3hBiNHCY94tU5qg118MWIpENbijNwsnPyU26AKtPsMbtxbD2lpj03upKxlqTVLjPAzgCemIpcYiJoklPG663LwwcFA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yR3RmZ/ZnrDEMZS5m2oHZmdQ+6bfa4CoOtYehjOxgTAkkEgij7mXpNgX1ZtZAbaokjiKuvAQbdLAWOMYLcpSNewUrUVsPpkY7tkNby5sxRDmhMdILAuTzZleNRx3WxCFsYTT/LsEs+ZP9qu842ooi9JrG9Z7Xkl+n0siY11U4DndtFRbkNbabeHMEMrf1xGgsgUIAzNPjBwpczOw23WtPkpHUq1+Up2c10l6ibpwHom407gaVw7gvxC9OYR/zgg/BgW9itNIqCgqBsPS3/+fBbQs8R1SH68HhB/Fi4QV/3LXT5Sx/i/7BHVqyNLb7UTtn2YZjPQYmDKX8hGXClCmHhAyB//Gv2GjTqb9s7rKplzqUg8+bZ/jdFuiv0MMHZiz0brYOktvGpTbWfzOE+I4HfQDNXmktHB81pX/9wFae4Vncj+6rrXfEFzkESA4ZpkC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 17:20:23.4351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6637a81c-ec96-4701-184a-08df03965031
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Hello Andrea,

On 8/26/2026 9:26 PM, Andrea Righi wrote:
> On Wed, Aug 26, 2026 at 06:28:48AM +0000, K Prateek Nayak wrote:
>> mutex_unlock_slowpath() follows:
>>
>>     if (owner & MUTEX_FLAG_HANDOFF)
>>         break /* ... and do __mutex_handoff() */
>>
>>     if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
>>         if (owner & MUTEX_FLAG_WAITERS)
>>             break; /* ... and wake up the forst waiter. */
> 
> nit: s/forst/first/

Ack

> 
>>
>> MUTEX_FLAG_HANDOFF is only set by first-waiter after it has been woken
>> up and in absence of MUTEX_FLAG_HANDOFF, the owner clears itself from
>> the lock_word and wakes up the first waiter to try a
>> __mutex_trylock_or_handoff().
>>
>> MUTEX_FLAG_HANDOFF exists to prevent new optimistic spinners from
>> trying to hijack the lock from waiter all the time and potentially
>> starving them but it is not necessary for MUTEX_FLAG_HANDOFF to be
>> always set in presence of a waiter.
>>
>> If a blocked donor is deactivated when no owner is observed, it may not
>> be woken up until it becomes the first waiter and is naturally woken up
>> which breaks proxy in the interim.
>>
>> Wake up the blocked donor and allow it to grab the lock when no owner is
>> observed. If the task manages to grab the lock, the block chain will
>> follow at the next proxy migration. If the task fails to grab the lock,
>> same situation is restored and everyone migrated to the CPU of new
>> owner.
>>
>> Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration for PROXY_WAKING case")
>> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
>> ---
>> XXX: Is there a better way to handle this? If we can confirm a owner in
>> find_proxy_task(), we don't need to do a spurious wakeup of every task
>> observing !owner.
>>
>> proxy_resched_idle() until owner appears in an option but it will spin
>> until next owner appears.
> 
> IIUC, the owner can remain NULL until the waiter selected by mutex_unlock() gets
> CPU time and acquires the mutex, so proxy_resched_idle() could spin for longer
> than just the unlock critical section.
> 
> Maybe we could instead force a handoff from mutex_unlock_slowpath() when proxy
> execution is enabled and the mutex has waiters? This would keep the owner
> identifiable and avoid waking every task that happens to observe !owner.

I think that negates some of the benefits of the optimistic spinning +
mutex_try_lock(). I'll see if it makes any difference to the benchmark
results if we always force a handoff for MUTEX_FLAG_WAITERS.

wait_lock should give enough guarantee that the waiter cannot simple
disappear before the handoff after MUTEX_FLAG_PICKUP is set since
waiter has to try at least one mutex_trylock() under wait_lock before
checking for pending signals.

Thank you for taking a look at the series and ack on the comment on
the previous patch.

> 
>> ---
>>  kernel/sched/core.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 4cd69b08b415..9d9db7ccf01f 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -6809,6 +6809,19 @@ static inline void proxy_reacquire_rq_lock(struct rq *rq, struct rq_flags *rf)
>>  	update_rq_clock(rq);
>>  }
>>  
>> +static void
>> +proxy_activate(struct rq *rq, struct rq_flags *rf, struct task_struct *p)
>> +	__must_hold(__rq_lockp(rq))
>> +{
>> +	lockdep_assert_rq_held(rq);
>> +	proxy_resched_idle(rq);
>> +	proxy_release_rq_lock(rq, rf);
>> +
>> +	wake_up_process(p);
>> +
>> +	proxy_reacquire_rq_lock(rq, rf);
>> +}
>> +
>>  /*
>>   * If the blocked-on relationship crosses CPUs, migrate @p to the
>>   * owner's CPU.
>> @@ -6934,14 +6947,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>>  			/*
>>  			 * If there is no owner, either clear blocked_on
>>  			 * and return p (if it is current and safe to
>> -			 * just run on this rq), or return-migrate the task.
>> +			 * just run on this rq), or wake the task to try
>> +			 * and grab the lock it is blocked on.
>>  			 */
>>  			__clear_task_blocked_on(p, NULL);
>> -			if (task_current(rq, p)) {
>> +			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>>  				p->is_blocked = 0;
>>  				return p;
>>  			}
>> -			goto deactivate;
>> +			goto activate;
>>  		}
>>  
>>  		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
>> @@ -7029,6 +7043,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>>  	}
>>  	return owner;
>>  
>> +activate:
>> +	proxy_activate(rq, rf, p);
>> +	return NULL;
>>  deactivate:
>>  	proxy_deactivate(rq, p);
>>  	return NULL;
-- 
Thanks and Regards,
Prateek

