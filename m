Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF913A258
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532208; cv=fail; b=E0cr1+DKC0OdmIYSspoUBJOoszWWiPKSZyovZLZPsmVS+07bhO44z+7F6k7ZGU6eGApCZC0S0Gulcmqd7sgRSzaze1mf0wSfbqxkeyfIZImYtCxi/4+tBaYEoNb7F3iyYGI1eNtFtb1Tb++VMV0nXGCeVihRVlHifY42Ikdb/OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532208; c=relaxed/simple;
	bh=e2iKccoOnv8vM22hiOcgoRmnZQ/N4MMM1afzEXMjGD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jft6VWT2GzZK8FZbYgtlZxTRQArcUYkqZVYmyeRZADGt3WiAm3AUEUkgK1JF6cK5omj7eOeL9Ex3EiA/OE8ioWrLQk1v8D9ltFopv1wWewkvEdTyYYgyY5Og6i1Hjs6anHKiMWmKIfEq/qeNe8KqeVR+oZISi7H3iQe6rF0v4Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=daD0v7Xo; arc=fail smtp.client-ip=52.101.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="daD0v7Xo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGEqgd8HE6O5V31IDARcMzBxlRCiwJ5BpEPi0+2DlWnjMPAg0lNe0VhGnIelH2I6oYkXc+6B6CQ5Gums+UIQEC/ESyJGghxqkKN6hSt2RfBu9KUPHhbES2kuaqGIA9jg+AIVSnqOoJy8Vas6bLVIDqaS+KjzsG+Las28yZfxM8nPvUcf09yGyv1ALoOwxTGfOGbTCQzm+9emI8OTru0E1djJpBz4vm/SzIqwWlthZ8J/4IRbJbUfHefLIwwoaWBgndd/jwrCpLis8Zyjl+ngHGLUQvAF2D4IOFXyj/cHgWIvdSGDSo0ZviEz5OBuQN2r3ehHf8M9O7z2gZdWl/c/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nlBFDMRR62ia8vTPNIDa1eZGFwjEy3/E6OlXMmVtLc=;
 b=lCYOdYvIB7qpp1Yx3eoI/hKq17x81chI9VQh/HdvQnqQjOHF54EiDW9N+mgrZNdjfZtFMuDOc9SgVpo/tpV5is3D/PY/VqCSmFrm+jkV3nMz+3y5p158blpovxsu+/T9IB0syScgBTqvMBfv9AYlGwLEz28kfgZatmfsEuJBNwB4WScG3KD3j+yDm7ms5IAzooDFYxuPUBOTWvQNkVQIpjFSqIrTVAGJoyPnNssXrRmizm3RsxwghI7VzYg3PiR1S9RAc+cfcvYjswYXSqV5dGw3qKYqNHY5LTWtnEm5EDbt5Gw7Stwj7fqWXebLb+WaQyOenMARcFfBcvR7e80Z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nlBFDMRR62ia8vTPNIDa1eZGFwjEy3/E6OlXMmVtLc=;
 b=daD0v7XoOeKIkC8Yk/s1PB7IITN+Xb8L9iIjfytsSDxWujKpgBqARq8eUrIyX3GRUWHpdxIeR64ZJn3ahN4TOEluK1LS91mui/gLN7QT1I1UOgY/f+sWaZQZ247eAzymx/Tgq3+uVD+IF6GkS3QupqogHipc4aZVWn2mJH+8TjY=
Received: from SA1P222CA0058.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::9)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 04:16:37 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::4f) by SA1P222CA0058.outlook.office365.com
 (2603:10b6:806:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 04:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 04:16:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 23:16:36 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 23:16:32 -0500
Message-ID: <957fb772-0fa0-40c3-9446-aca6c22ca9fe@amd.com>
Date: Wed, 16 Sep 2026 09:46:26 +0530
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
CC: Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>,
	Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Waiman
 Long <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-5-kprateek.nayak@amd.com> <ao8Mlls40IG9Vp6g@gpd4>
 <74324f25-2e8c-4f90-8f22-c1788615b95e@amd.com>
 <fe1bef59-e047-4008-b498-0c0d49a2be76@amd.com> <apWYv6SdL0Ck-a5w@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <apWYv6SdL0Ck-a5w@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: e3cab725-7528-4c19-7caa-08df13a94d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|7416014|376014|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Cb57Y3/77J6Q1Nrykp8MNXZLsM+T/ezq7H6HVEaECfpu6oM+vF9zTtW61ujivmGDizcd6VgjZe+LrtUtk1PlJvlXYGgroKbjv1ASxjuFVhMebpdfUKxxm/h34hsDRtrvfwlB1rxeztvcdf0wnMCeFMWn+LRDdDDHyQEbAB4AEVWzcvsInhJC4UZNie1JnK1elNL6fDTzf2Acs1TjNPlbhVWRCaw9XZKO9ZU1tETXYMEDlNKg+oz6YUi0OUo0MJ/4LhkcmRDk1vBghuOrUbBUfn+WjI7IOztN25Ql733kuyZtt6OiNme+mgQk8eyKT9Qx5rccYJRzmDjcJ6GXRf8P66zY4/8W67Ycwe575qNJ6038StgVswA6aimv8Wp3y1yU1l78vwgmdKGFt3y3TluO+Oxe+UigAiDoOuQ4vM2CCqOm/oPK2E1TUb1guTBkB2lEb3SLkSWhLkILxDOdwkwE+tZVUFswORPVg51d4/Sk0tKbUWfRLwSMpq8KjfqgZtGJ8FFvFM7Aj6VrTA/9k0+KWmKCz3u8bh72G0a/nyjzE4+tpBcave7iEAuQwhGdjexxwEamJPAgfQkigh51ogN4kDNrIwOjftMW97z5AnioUs6CELCldTABx6UZA/ZacHhP2OH2LFFk4eX6tN5pJ15XeFNSNcRQXcaJKXFvuN092lUkDRNNL+++oVGvl39gAgAkp2Kviu+ua5rYgij/YXF7ow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XK8p9Xdxbmhtx5Ocd9E2hhkkxY93qylNxdGm2tsZ7bUYkVp7HrkThY6T6jud0EgSLl5q8sUV4LNMEdXahMIOf3KMpL9R2oT9BrOqUpyn6Lx6CLualsaBavpCvG+/+WsFIQYdt0yjiR1kUaHacg3Bv+oQS0GnN2hKZXqhlDbIj9KSyKEdq/pJeDcCIbv4iX8f3U/XzHsMAAdYveB/h0rK6wvMRfAVnwl3iOlNIUChBSTAC4JxDfF5u2crwf1qfrGc+L8G0Z+Al0Zb3Va5WM5AoAaJlnzycvJzDsJkjVU4Z58aJ0qoSn6YzkIV87MgwlZ0uyQG1rdSEJ+fUZpTVLR9DJZ34RczlNaD4JdSgPh/xD9UBWjspsUXXq33lVWlPNl8KPEEZAaOTcZLxgl7W5FckKnjHZ0ei3DpHsf3Er5KD8Vtamw9EpbCtgC7x1vNV6KC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:16:37.2312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cab725-7528-4c19-7caa-08df13a94d0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895

Hello Andrea,

Sorry I forgot to push send on this and only realised today.

On 8/31/2026 8:37 PM, Andrea Righi wrote:
>> ============================================
>> Experiment 3: STEAL + Temporary swap to idle
>> ============================================
>>
>> the unlock will temporarily swap to rq->idle of the lock owner's CPU with
>> MUTEX_FLAG_STEAL set to allow grabbing the task until the the waiter wakes
>> up and manages to grab the task itself for !HANDOFF cases. With that,
>> numbers are very close:
>>
>> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
>> index 8a85912d7ee6..187f95544453 100644
>> --- a/kernel/locking/mutex.c
>> +++ b/kernel/locking/mutex.c
>> @@ -92,7 +92,16 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
>>  		unsigned long task = owner & ~MUTEX_FLAGS;
>>  
>>  		if (task) {
>> -			if (flags & MUTEX_FLAG_PICKUP) {
>> +			if (sched_proxy_exec() && (flags & MUTEX_FLAG_STEAL)) {
>> +				/*
>> +				 * STEAL cannot be set after HANDOFF has been
>> +				 * initiated. If STEAL is set, clear it and
>> +				 * preserve other flags
>> +				 */
>> +				MUTEX_WARN_ON(flags & (MUTEX_FLAG_PICKUP));
>> +				flags &= ~MUTEX_FLAG_STEAL;
>> +				task = curr;
>> +			}else if (flags & MUTEX_FLAG_PICKUP) {
>>  				if (task != curr)
>>  					break;
>>  				flags &= ~MUTEX_FLAG_PICKUP;
>> @@ -104,7 +113,7 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
>>  				break;
>>  			}
>>  		} else {
>> -			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP));
>> +			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP | MUTEX_FLAG_STEAL));
>>  			task = curr;
>>  		}
>>  
>> @@ -242,7 +251,41 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
>>  	__must_hold(&lock->wait_lock)
>>  {
>>  	if (list_empty(&waiter->list)) {
>> -		__mutex_clear_flag(lock, MUTEX_FLAGS);
>> +		/*
>> +		 * The last waiter can be interrupted before the full
>> +		 * unlock with STEAL is done.
>> +		 *
>> +		 *  LOCK lock->wait_lock
>> +		 *
>> +		 *  __mutex_trylock()
>> +		 *    // Sees old owner			__mutex_unlock_slowpath()
>> +		 *    return owner;			  atomic_long_cmpxchg_release(&owner, idle | STEAL)
>> +		 *					    // Succeeds
>> +		 *  if (signal_pending())
>> +		 *    goto err;
>> +		 *
>> +		 * err:
>> +		 *  __mutex_remove_waiter()
>> +		 *    __mutex_clear_flag(MUTEX_FLAGS)
>> +		 *    lock->first_waiter = NULL;
>> +		 *
>> +		 *  UNLOCK lock->wait_lock		  LOCK lock->wait_lock
>> +		 *					  waiter = lock->first_waiter; // NULL
>> +		 *					  // No wakeup
>> +		 *
>> +		 *  !!! lock->owner stuck as rq->idle without STEAL set !!!
>> +		 *
>> +		 * Persis the STEAL flag to prevent an idle task to
>> +		 * linger as lock owner. __mutex_trylock_fast() will
>> +		 * fail temporarily for first contender but following
>> +		 * __mutex_trylock_common() will do the right thing.
>> +		 *
>> +		 * XXX: This can also be solved by doing a
>> +		 * atomic_try_cmpxchg() or__mutex_clear_flag() in
>> +		 * __mutex_unlock_slowpath() if steal is set but no
>> +		 * waiter is found under lock->wait_lock.
>> +		 */
>> +		__mutex_clear_flag(lock, MUTEX_FLAGS & ~MUTEX_FLAG_STEAL);
>>  		lock->first_waiter = NULL;
>>  	} else {
>>  		if (lock->first_waiter == waiter)
>> @@ -274,7 +317,6 @@ static void __mutex_handoff(struct mutex *lock, struct task_struct *task)
>>  		new |= (unsigned long)task;
>>  		if (task)
>>  			new |= MUTEX_FLAG_PICKUP;
>> -
>>  		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
>>  			break;
>>  	}
>> @@ -389,7 +431,17 @@ bool mutex_spin_on_owner(struct mutex *lock, struct task_struct *owner,
>>  
>>  	lockdep_assert_preemption_disabled();
>>  
>> -	while (__mutex_owner(lock) == owner) {
>> +	for (;;) {
>> +		unsigned long __owner = atomic_long_read(&lock->owner);
>> +
>> +		/* If the owner changed, break out. */
>> +		if (__owner_task(__owner) != owner)
>> +			break;
>> +
>> +		/* If lock can be stolen, break out. */
>> +		if (sched_proxy_exec() && (__owner_flags(__owner) & MUTEX_FLAG_STEAL))
>> +			break;
>> +
>>  		/*
>>  		 * Ensure we emit the owner->on_cpu, dereference _after_
>>  		 * checking lock->owner still matches owner. And we already
>> @@ -1006,19 +1058,42 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>>  	 */
>>  	owner = atomic_long_read(&lock->owner);
>>  	for (;;) {
>> +		unsigned long owner_flags;
>> +
>>  		MUTEX_WARN_ON(__owner_task(owner) != current);
>>  		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
>>  
>> -		if (sched_proxy_exec() && current->blocked_donor) {
>> -			/* force handoff if we have a blocked_donor */
>> -			owner = MUTEX_FLAG_HANDOFF;
>> -			break;
>> -		}
>> -
>>  		if (owner & MUTEX_FLAG_HANDOFF)
>>  			break;
>>  
>> -		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
>> +		owner_flags = __owner_flags(owner);
>> +		if (sched_proxy_exec()) {
>> +			if (current->blocked_donor) {
>> +				/* force handoff if we have a blocked_donor */
>> +				owner = MUTEX_FLAG_HANDOFF;
>> +				break;
>> +			}
>> +
>> +			if (owner & MUTEX_FLAG_WAITERS) {
>> +				unsigned long idle;
>> +				/*
>> +				 * Swap the owner to current CPU's idle task
>> +				 * with a STEAL flag.
>> +				 *
>> +				 * The lock is free to be stolen and
>> +				 * __mutex_owner() will resolve to idle task
>> +				 * that is always ->on_rq on this CPU.
>> +				 *
>> +				 * Proxy donors will temporarily migrate here
>> +				 * before a wakeup or an optimistic spinner
>> +				 * can grab the lock.
>> +				 */
>> +				idle = (unsigned long)idle_task(raw_smp_processor_id());
>> +				owner_flags = idle | MUTEX_FLAG_STEAL | owner_flags;
>> +			}
>> +		}
>> +
>> +		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, owner_flags)) {
>>  			if (owner & MUTEX_FLAG_WAITERS)
>>  				break;
>>  
>> diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
>> index 3e263e98e5fc..eb4180745da0 100644
>> --- a/kernel/locking/mutex.h
>> +++ b/kernel/locking/mutex.h
>> @@ -33,8 +33,9 @@ struct mutex_waiter {
>>  #define MUTEX_FLAG_WAITERS	0x01
>>  #define MUTEX_FLAG_HANDOFF	0x02
>>  #define MUTEX_FLAG_PICKUP	0x04
>> +#define MUTEX_FLAG_STEAL	0x08
>>  
>> -#define MUTEX_FLAGS		0x07
>> +#define MUTEX_FLAGS		0x0F
>>  
>>  /*
>>   * Internal helper function; C doesn't allow us to hide it :/
>> ---
>>
>> The results with temporary switch to idle + STEAL are:
>>
>>     ==================================================================
>>     Test          : sched-messaging
>>     Units         : Normalized time in seconds
>>     Interpretation: Lower is better
>>     Statistic     : AMean
>>     ==================================================================
>>       Test:                   vanilla                 handoff             STEAL + handoff          idle + STEAL
>>        1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)       3.63 (-16.34 pct)       3.59 (-15.06 pct)
>>        2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)       4.14 (-20.69 pct)       3.48 (-1.45 pct)
>>        4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)       5.45 (-34.56 pct)       4.00 (1.23 pct)
>>        8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)      7.80 (-81.81 pct)       4.31 (-0.46 pct)
>>       16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)     11.89 (-101.86 pct)      5.91 (-0.33 pct)
>>
>>       * Data points have > 10% run to run variance on all versions
>>
>>
>> My machine has held up for some time with Experiment 3 so I'm
>> fairly confident at the very least mutual exclusion is holding
>> up - I haven't seen any lockups / hung task either so hopefully
>> other bits are fine too :-)
> 
> This looks much better from a performance perspective. IIUC, the idle task in
> this case is being used as a temporary owner marker, but find_proxy_task() would
> treat it as a real mutex owner and could set idle->blocked_donor, right?
> 
> Should we handle the STEAL state explicitly in find_proxy_task() to avoid
> creating a donor relationship with the idle task?

That is a good point.

Originally, I had intended for it to spin in __schedule() on just one
CPU since this returns idle task from find_proxy_task() and I though
it'll be similar to porxy_resched_idle().

Now I realise, since we don't go though proxy_resched_idle(), the
NEED_RESCHED flag won't be set for the idle task and the CPU will
actually idle with possible other runnable tasks on there.

That needs fixing yes!

-- 
Thanks and Regards,
Prateek

