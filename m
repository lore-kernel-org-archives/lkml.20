Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077393B100A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897100; cv=fail; b=VZulAysuXzmY4v33WMvbbRtVVYU7eaaYcR0iHAM0MLAzwt2qWCGK31gwL1GHIw+1MG32NQPbQKI3Ro9EpAtSrV/mqjJQRZ/JtzCF6ERuglm+XeMHi9DvTIkiucEzbIQuk58pz4mqaqq6kE9927+tqbtMFC1cs0UhucLVWpDFAtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897100; c=relaxed/simple;
	bh=+jqWyymI8HlaKoThDysljDbcfJK8dGrt1NfSyNwEUbE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=AZi6HU60okmDXnLQNx6YdY8dMa722M/iadSvJfrT6NZm6O3dkWHd9hvop1Oa5vasweWPvMbdgGuiDszh1od2HwgeRjS5+lGiMgG6lOD1AtxeBmfUnYdZev0WDA78O63f0I6VPGxCFPUQMC3u+ozYDGLQ82mIgGvdWPkejaqeBQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3BTtpOMw; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3BTtpOMw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1ucPvRJKuQc6AOD9UpybpN45QxsVvPsneoyuFFYTDTe4cNSFSY+NH+wuTeSl+4jCKmyNmsneJGe4axGhzxu/4vX6bR/kigcRSyrYqp0pQgWCMGt3h2dBvlbN8E5aMz90hSYUfYR3oxsMss5S665b6A+MZhWBUiqa3mOO9sguikE3FglUpjbqbFJkztur4hcG4H7LQNoOG3cP+GWbVfowJU0a2pH6RI0o3Rr8LzcUNaaq1bssUdWLRoL4o1tKCGYKxpK+HES/FIEbUgpCduN+el01aCt1JoCW5MUbgTfphJ7J3IxoEcYM501+M2SkwD29FZwIvY4Bu+039GyDNmSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZcaOTBtnb5S0BSQgw/DVO+TQV+C8u+lQkhKhzBXU1w=;
 b=TaRFBwXSY8rxsQw4WaGV+DYes4TWWHv4B9sghLQ3AgDBdZXR2EF7kltl7AAO2uIhDdiUXgQq4MvAMhrOogbejsNlgwyvrEWGhxKijAiK9ldISG8Rb0yFrVZB6pb/IAsEWF4mUzCpUaZo6rca5D7RkOT+rVfABrzX9f6C9mSUbTb86yTltXb1PMD9hAG0ne9MJs3HY4XPikjNsuAsL94dL++DHTd3OXP56Ha1enRfWgqsnvmkxfikzo89cYF5N+JBN1j00hozmwbeVUxRabeGvhy2w67CU5Ae9N66tPOPtqkuMDLAFaWKfbxp7/yNPzNUxwkDaRsrakIT84jrj0xVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZcaOTBtnb5S0BSQgw/DVO+TQV+C8u+lQkhKhzBXU1w=;
 b=3BTtpOMw6sApFBVSoh9d4Ud5vMF+1LJFWEXr8+nxU84nTGVyuYutFXrTDqk1loE/nsqdIImoGYOqRyxxQUUVQ4EbYTdPbAS0CPDq8moAkehRvgpnPTAJyY82YYzX3/ecSpMHhmVeF810KyWLXNjCSdDx1Q3exVF67h4Bw0rp3bM=
Received: from PH1PEPF00013306.namprd07.prod.outlook.com (2603:10b6:518:1::13)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 06:04:50 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH1PEPF00013306.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 06:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 28 Aug 2026 06:04:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 01:04:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 01:04:49 -0500
Received: from [10.136.43.157] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 01:04:45 -0500
Message-ID: <fe1bef59-e047-4008-b498-0c0d49a2be76@amd.com>
Date: Fri, 28 Aug 2026 11:34:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/16] sched/core: Activate blocked donor when no
 owner is found
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Andrea Righi <arighi@nvidia.com>, Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>
CC: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, Boqun Feng
	<boqun@kernel.org>, <linux-kernel@vger.kernel.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-5-kprateek.nayak@amd.com> <ao8Mlls40IG9Vp6g@gpd4>
 <74324f25-2e8c-4f90-8f22-c1788615b95e@amd.com>
Content-Language: en-US
In-Reply-To: <74324f25-2e8c-4f90-8f22-c1788615b95e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c37f03e-e7cf-4116-8f25-08df04ca4557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	UQ5geS1GXCbWA0zwemDSXRkqi7HxIq27TGfmGiB3+22DhZbLW0TzbpgHOkW7D4fI8UIlPaZCPLldrGPVgV8qoWJg2epo7uIHuUvl+XEtXWVxr2IrrdZMBVQOtzRtCdxN3S0/43ROQ6SPlnQu3Zyu0JLmm5oWh8MCIq5Ja5z6/T3drnI2DOYX8+6JudeMXC3eTzIQ/qhgcFbjGasKKNHRlDnpZn0mQbI37fKaQ6YiWBHDLaKsaQ0cH0K49Nrqm/yxU1XvxnZRUorJxOIBOO5eMmBoHahbRnjrPfE3JGpZS7vQeeGA3tYj7Y4aWLhSJlUUaNjNNYjLP58qhobLaN6wpJSzCUEb3MurpxH57C6jrkfWIZ9t1B0ElZ51h0qPKMA0yXNv7F5RAQDT7vMZAoGUi4FKF/H1DZdvrTLP4maoVMcatDRnXpIw6Efe1SfCPuZ/WgXvJIBvOpgG4CD8N3h6TmLM4MpZHiwbYVFWjnDtSZpCPupq10Uz4XhqGuF2+w4BhvxrRiTuOD4en87bOocAAABUm/nPeP1I0ZAURYT2n4ZMQ9d2807DI4m4XCA+1gm5aL3eCZMOZLP529g39jdcgownZjxmkIpRXwhZZMWPuhBJnbMarVq8krbt0gBecA/2RQpu0r/lO8+SFa0JV0So4LiX+JWUrPglB5fwUpa1ppPkGZajPjVUl94/3fmk24SMVh03Q92D3cVXok35KQ9e8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m5jwPnW4XOdujc37l3I5S2L/y64hrco/3d24Q2XAjqy/IYjonr6LOUuIVfus33Uwck/sv6sut8Pw0n0AC8qzdYwwp+FCUaAkEr+SyI0K3NlN6IpLaIMXtAMWoSefgx54bMMSjOMDdFYmTvWEtNDhmYZx8MNuE5yUNqAnPT7IvA2wJwGsqvbdt2bl/xpkmu+Q+ULMvLhPA9+KiIxC3tHZ0MU/X9/cqJ1dE2v3N4n6/kLc0Ix5LsgPnAr0ZsTTSHKzjicVzLytl3LleLyQNXlzm25I2fX6OY7TWhz3cd2T3lm+6nZZI9SwyG/wyIl19ClXtDMdHxXzrd79eAYLT3a8Q8DDHlWilkK+3Gbb5XfUjz2InnHrD6MBVy1cCliZjuoOULyEU/vXSEf6ZOX3GNnMhlIoh9l6gMHRysWLAEXW+g2WBdgPckqnSWnn4TmC7Gwp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 06:04:50.2546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c37f03e-e7cf-4116-8f25-08df04ca4557
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316

Hello Andrea,

On 8/26/2026 10:50 PM, K Prateek Nayak wrote:
>>> XXX: Is there a better way to handle this? If we can confirm a owner in
>>> find_proxy_task(), we don't need to do a spurious wakeup of every task
>>> observing !owner.
>>>
>>> proxy_resched_idle() until owner appears in an option but it will spin
>>> until next owner appears.
>>
>> IIUC, the owner can remain NULL until the waiter selected by mutex_unlock() gets
>> CPU time and acquires the mutex, so proxy_resched_idle() could spin for longer
>> than just the unlock critical section.
>>
>> Maybe we could instead force a handoff from mutex_unlock_slowpath() when proxy
>> execution is enabled and the mutex has waiters? This would keep the owner
>> identifiable and avoid waking every task that happens to observe !owner.
> 
> I think that negates some of the benefits of the optimistic spinning +
> mutex_try_lock(). I'll see if it makes any difference to the benchmark
> results if we always force a handoff for MUTEX_FLAG_WAITERS.
> 
> wait_lock should give enough guarantee that the waiter cannot simple
> disappear before the handoff after MUTEX_FLAG_PICKUP is set since
> waiter has to try at least one mutex_trylock() under wait_lock before
> checking for pending signals.

Below  are the results from few experiments. All diffs pasted below are
based on John's tree at:

  https://github.com/johnstultz-work/linux-dev.git proxy-exec-v31-7.2-rc4

at commit 06ac43db4d8e ("[ANNOTATION] === Needs confirmation of
functionality past this point ===") with CONFIG_SCHED_PROXY_EXEC=y.

All diffs are very experimental: virtme-ng or testing with a disposable
environment is recommended.

============================
Experiment 1: Simple Handoff
============================

If I do a simple handoff like below, sched-messaging goes pretty bad:

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 8a85912d7ee6..da14a49e4fa2 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1009,7 +1009,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 		MUTEX_WARN_ON(__owner_task(owner) != current);
 		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
 
-		if (sched_proxy_exec() && current->blocked_donor) {
+		if (sched_proxy_exec() && (current->blocked_donor || (owner & MUTEX_FLAG_WAITERS))) {
 			/* force handoff if we have a blocked_donor */
 			owner = MUTEX_FLAG_HANDOFF;
 			break;
---

With just a simple handoff on waiters, we have:

    ==================================================================
    Test          : sched-messaging
    Units         : Normalized time in seconds
    Interpretation: Lower is better
    Statistic     : AMean
    ==================================================================
      Test:                   vanilla                 handoff
       1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)  *
       2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)  *
       4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)
       8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)
      16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)

     * Data points have > 10% run to run variance on all versions


==================================================
Experiment 2: Allow steal until next task is found
==================================================

If we open the opportunity to allow stealing of mutex until the next waiter
is found, the results are ever so slightly slightly better:

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 8a85912d7ee6..5ebb2624b331 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -92,7 +92,16 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
 		unsigned long task = owner & ~MUTEX_FLAGS;
 
 		if (task) {
-			if (flags & MUTEX_FLAG_PICKUP) {
+			if (sched_proxy_exec() && (flags & MUTEX_FLAG_STEAL)) {
+				/*
+				 * STEAL cannot be set after HANDOFF has been
+				 * initiated. If STEAL is set, clear it and
+				 * preserve other flags
+				 */
+				MUTEX_WARN_ON(flags & (MUTEX_FLAG_PICKUP));
+				flags &= ~MUTEX_FLAG_STEAL;
+				task = curr;
+			}else if (flags & MUTEX_FLAG_PICKUP) {
 				if (task != curr)
 					break;
 				flags &= ~MUTEX_FLAG_PICKUP;
@@ -104,7 +113,7 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
 				break;
 			}
 		} else {
-			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP));
+			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP | MUTEX_FLAG_STEAL));
 			task = curr;
 		}
 
@@ -274,7 +283,29 @@ static void __mutex_handoff(struct mutex *lock, struct task_struct *task)
 		new |= (unsigned long)task;
 		if (task)
 			new |= MUTEX_FLAG_PICKUP;
+		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
+			break;
+	}
+}
+
+static void __mutex_steal(struct mutex *lock, struct task_struct *task)
+{
+	unsigned long owner = atomic_long_read(&lock->owner);
+
+	for (;;) {
+		unsigned long new;
 
+		/* Lock was successfully stolen. */
+		if (__owner_task(owner) != current)
+			break;
+
+		MUTEX_WARN_ON(!(__owner_flags(owner) & MUTEX_FLAG_STEAL));
+		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
+
+		new = (owner & MUTEX_FLAG_WAITERS);
+		new |= (unsigned long)task;
+		if (task)
+			new |= MUTEX_FLAG_PICKUP;
 		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
 			break;
 	}
@@ -389,7 +420,17 @@ bool mutex_spin_on_owner(struct mutex *lock, struct task_struct *owner,
 
 	lockdep_assert_preemption_disabled();
 
-	while (__mutex_owner(lock) == owner) {
+	for (;;) {
+		unsigned long __owner = atomic_long_read(&lock->owner);
+
+		/* If the owner changed, break out. */
+		if (__owner_task(__owner) != owner)
+			break;
+
+		/* If lock can be stolen, break out. */
+		if (sched_proxy_exec() && (__owner_flags(__owner) & MUTEX_FLAG_STEAL))
+			break;
+
 		/*
 		 * Ensure we emit the owner->on_cpu, dereference _after_
 		 * checking lock->owner still matches owner. And we already
@@ -985,6 +1026,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 	struct mutex_waiter *waiter;
 	unsigned long owner;
 	unsigned long flags;
+	bool steal;
 
 	mutex_release(&lock->dep_map, ip);
 	__release(lock);
@@ -1006,19 +1048,31 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 	 */
 	owner = atomic_long_read(&lock->owner);
 	for (;;) {
+		unsigned long owner_flags;
+
 		MUTEX_WARN_ON(__owner_task(owner) != current);
 		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
 
-		if (sched_proxy_exec() && current->blocked_donor) {
-			/* force handoff if we have a blocked_donor */
-			owner = MUTEX_FLAG_HANDOFF;
-			break;
-		}
-
 		if (owner & MUTEX_FLAG_HANDOFF)
 			break;
 
-		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
+		owner_flags = __owner_flags(owner);
+		if (sched_proxy_exec()) {
+			if (current->blocked_donor) {
+				/* force handoff if we have a blocked_donor */
+				owner = MUTEX_FLAG_HANDOFF;
+				break;
+			}
+
+			if (owner & MUTEX_FLAG_WAITERS)
+				owner_flags = owner | MUTEX_FLAG_STEAL;
+		}
+
+		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, owner_flags)) {
+			if (owner_flags & MUTEX_FLAG_STEAL) {
+				steal = true;
+				break;
+			}
 			if (owner & MUTEX_FLAG_WAITERS)
 				break;
 
@@ -1071,6 +1125,9 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 	if (owner & MUTEX_FLAG_HANDOFF)
 		__mutex_handoff(lock, next);
 
+	if (sched_proxy_exec() && steal)
+		__mutex_steal(lock, next);
+
 	raw_spin_unlock(&current->blocked_lock);
 	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
 	if (next) {
diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
index 3e263e98e5fc..eb4180745da0 100644
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -33,8 +33,9 @@ struct mutex_waiter {
 #define MUTEX_FLAG_WAITERS	0x01
 #define MUTEX_FLAG_HANDOFF	0x02
 #define MUTEX_FLAG_PICKUP	0x04
+#define MUTEX_FLAG_STEAL	0x08
 
-#define MUTEX_FLAGS		0x07
+#define MUTEX_FLAGS		0x0F
 
 /*
  * Internal helper function; C doesn't allow us to hide it :/
---

With that small steal opportunity, we have:

    ==================================================================
    Test          : sched-messaging
    Units         : Normalized time in seconds
    Interpretation: Lower is better
    Statistic     : AMean
    ==================================================================
      Test:                   vanilla                 handoff             steal + handoff
       1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)       3.63 (-16.34 pct)  *
       2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)       4.14 (-20.69 pct)  *
       4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)       5.45 (-34.56 pct)
       8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)      7.80 (-81.81 pct)
      16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)     11.89 (-101.86 pct)

     * Data points have > 10% run to run variance on all versions


So, the opportunity must be extended to allow stealing until the the waiter
wakes up for !HANDOFF cases. Few complications with that are:

o We cannot continue to persist the old owner after mutex_unlock() since that
  owner can die, block on other mutex, etc. and that breaks queuing on owner
  since new waiters can go and block on a dead task / task blocked on an
  incorrect owner.

o We cannot allow steal after handoff to new owner because __mutex_lock() will
  resolve to new owner that hasn't woken up yet and waiters start queuing on
  it but a concurrent task can come steal the lock and break proxy. Not very
  intuitive; adds a lot of complexity.


============================================
Experiment 3: STEAL + Temporary swap to idle
============================================

the unlock will temporarily swap to rq->idle of the lock owner's CPU with
MUTEX_FLAG_STEAL set to allow grabbing the task until the the waiter wakes
up and manages to grab the task itself for !HANDOFF cases. With that,
numbers are very close:

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 8a85912d7ee6..187f95544453 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -92,7 +92,16 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
 		unsigned long task = owner & ~MUTEX_FLAGS;
 
 		if (task) {
-			if (flags & MUTEX_FLAG_PICKUP) {
+			if (sched_proxy_exec() && (flags & MUTEX_FLAG_STEAL)) {
+				/*
+				 * STEAL cannot be set after HANDOFF has been
+				 * initiated. If STEAL is set, clear it and
+				 * preserve other flags
+				 */
+				MUTEX_WARN_ON(flags & (MUTEX_FLAG_PICKUP));
+				flags &= ~MUTEX_FLAG_STEAL;
+				task = curr;
+			}else if (flags & MUTEX_FLAG_PICKUP) {
 				if (task != curr)
 					break;
 				flags &= ~MUTEX_FLAG_PICKUP;
@@ -104,7 +113,7 @@ static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, boo
 				break;
 			}
 		} else {
-			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP));
+			MUTEX_WARN_ON(flags & (MUTEX_FLAG_HANDOFF | MUTEX_FLAG_PICKUP | MUTEX_FLAG_STEAL));
 			task = curr;
 		}
 
@@ -242,7 +251,41 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
 	__must_hold(&lock->wait_lock)
 {
 	if (list_empty(&waiter->list)) {
-		__mutex_clear_flag(lock, MUTEX_FLAGS);
+		/*
+		 * The last waiter can be interrupted before the full
+		 * unlock with STEAL is done.
+		 *
+		 *  LOCK lock->wait_lock
+		 *
+		 *  __mutex_trylock()
+		 *    // Sees old owner			__mutex_unlock_slowpath()
+		 *    return owner;			  atomic_long_cmpxchg_release(&owner, idle | STEAL)
+		 *					    // Succeeds
+		 *  if (signal_pending())
+		 *    goto err;
+		 *
+		 * err:
+		 *  __mutex_remove_waiter()
+		 *    __mutex_clear_flag(MUTEX_FLAGS)
+		 *    lock->first_waiter = NULL;
+		 *
+		 *  UNLOCK lock->wait_lock		  LOCK lock->wait_lock
+		 *					  waiter = lock->first_waiter; // NULL
+		 *					  // No wakeup
+		 *
+		 *  !!! lock->owner stuck as rq->idle without STEAL set !!!
+		 *
+		 * Persis the STEAL flag to prevent an idle task to
+		 * linger as lock owner. __mutex_trylock_fast() will
+		 * fail temporarily for first contender but following
+		 * __mutex_trylock_common() will do the right thing.
+		 *
+		 * XXX: This can also be solved by doing a
+		 * atomic_try_cmpxchg() or__mutex_clear_flag() in
+		 * __mutex_unlock_slowpath() if steal is set but no
+		 * waiter is found under lock->wait_lock.
+		 */
+		__mutex_clear_flag(lock, MUTEX_FLAGS & ~MUTEX_FLAG_STEAL);
 		lock->first_waiter = NULL;
 	} else {
 		if (lock->first_waiter == waiter)
@@ -274,7 +317,6 @@ static void __mutex_handoff(struct mutex *lock, struct task_struct *task)
 		new |= (unsigned long)task;
 		if (task)
 			new |= MUTEX_FLAG_PICKUP;
-
 		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, new))
 			break;
 	}
@@ -389,7 +431,17 @@ bool mutex_spin_on_owner(struct mutex *lock, struct task_struct *owner,
 
 	lockdep_assert_preemption_disabled();
 
-	while (__mutex_owner(lock) == owner) {
+	for (;;) {
+		unsigned long __owner = atomic_long_read(&lock->owner);
+
+		/* If the owner changed, break out. */
+		if (__owner_task(__owner) != owner)
+			break;
+
+		/* If lock can be stolen, break out. */
+		if (sched_proxy_exec() && (__owner_flags(__owner) & MUTEX_FLAG_STEAL))
+			break;
+
 		/*
 		 * Ensure we emit the owner->on_cpu, dereference _after_
 		 * checking lock->owner still matches owner. And we already
@@ -1006,19 +1058,42 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 	 */
 	owner = atomic_long_read(&lock->owner);
 	for (;;) {
+		unsigned long owner_flags;
+
 		MUTEX_WARN_ON(__owner_task(owner) != current);
 		MUTEX_WARN_ON(owner & MUTEX_FLAG_PICKUP);
 
-		if (sched_proxy_exec() && current->blocked_donor) {
-			/* force handoff if we have a blocked_donor */
-			owner = MUTEX_FLAG_HANDOFF;
-			break;
-		}
-
 		if (owner & MUTEX_FLAG_HANDOFF)
 			break;
 
-		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
+		owner_flags = __owner_flags(owner);
+		if (sched_proxy_exec()) {
+			if (current->blocked_donor) {
+				/* force handoff if we have a blocked_donor */
+				owner = MUTEX_FLAG_HANDOFF;
+				break;
+			}
+
+			if (owner & MUTEX_FLAG_WAITERS) {
+				unsigned long idle;
+				/*
+				 * Swap the owner to current CPU's idle task
+				 * with a STEAL flag.
+				 *
+				 * The lock is free to be stolen and
+				 * __mutex_owner() will resolve to idle task
+				 * that is always ->on_rq on this CPU.
+				 *
+				 * Proxy donors will temporarily migrate here
+				 * before a wakeup or an optimistic spinner
+				 * can grab the lock.
+				 */
+				idle = (unsigned long)idle_task(raw_smp_processor_id());
+				owner_flags = idle | MUTEX_FLAG_STEAL | owner_flags;
+			}
+		}
+
+		if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, owner_flags)) {
 			if (owner & MUTEX_FLAG_WAITERS)
 				break;
 
diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
index 3e263e98e5fc..eb4180745da0 100644
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -33,8 +33,9 @@ struct mutex_waiter {
 #define MUTEX_FLAG_WAITERS	0x01
 #define MUTEX_FLAG_HANDOFF	0x02
 #define MUTEX_FLAG_PICKUP	0x04
+#define MUTEX_FLAG_STEAL	0x08
 
-#define MUTEX_FLAGS		0x07
+#define MUTEX_FLAGS		0x0F
 
 /*
  * Internal helper function; C doesn't allow us to hide it :/
---

The results with temporary switch to idle + STEAL are:

    ==================================================================
    Test          : sched-messaging
    Units         : Normalized time in seconds
    Interpretation: Lower is better
    Statistic     : AMean
    ==================================================================
      Test:                   vanilla                 handoff             STEAL + handoff          idle + STEAL
       1-groups:         3.12 (0.00 pct)         3.47 (-11.21 pct)       3.63 (-16.34 pct)       3.59 (-15.06 pct)
       2-groups:         3.43 (0.00 pct)         4.33 (-26.23 pct)       4.14 (-20.69 pct)       3.48 (-1.45 pct)
       4-groups:         4.05 (0.00 pct)         5.95 (-46.91 pct)       5.45 (-34.56 pct)       4.00 (1.23 pct)
       8-groups:         4.29 (0.00 pct)         9.56 (-122.84 pct)      7.80 (-81.81 pct)       4.31 (-0.46 pct)
      16-groups:         5.89 (0.00 pct)        12.29 (-108.65 pct)     11.89 (-101.86 pct)      5.91 (-0.33 pct)

      * Data points have > 10% run to run variance on all versions


My machine has held up for some time with Experiment 3 so I'm
fairly confident at the very least mutual exclusion is holding
up - I haven't seen any lockups / hung task either so hopefully
other bits are fine too :-)

-- 
Thanks and Regards,
Prateek

