Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F8C388878
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532212; cv=fail; b=sdO6mcj10mNIxpLgD0y3G67IT7O6MB9CRhfInzxo2WaPZCB9mVMlJZz7ZsAQl2xjanlSyWdZEYDKBmWzG5Q4v/MH/+56Erzoi6m9WLNN3mJiaCdnQ8tp3OklRA0SCTMBr4l+MwLmyozvt2WfHOjkoLa4dWeAmFBGsWzmg137X0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532212; c=relaxed/simple;
	bh=fHxfr0x+BpfE5udLpl6SFoTik1gNeGkAZmvYmNq4pGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tRzbuomASE5vr2sRpFr53+paVWuTsAtLOiuwVwmcOENQxEr+RcHKh1Cx/m987cWJIGzUjYhl9eq2BS/Q7sjgbsjarMnfETQS25zfSXwdd7+9wkAI1B7jkyYIr4NYrxZZQ/24Hu9SHIvBw/B5ZwI0Y1+h8WUS2PPb21G8wCBOsvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rJOU2lXq; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rJOU2lXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn8wy2k5ezEXeQfJ0X4/wv556c3xy7urIm41LtTCDVPVmW51ocXEV+VAuaVGf843va58Cp/wbxJQ1Ewb3n+z3JhbkDHI6FQDmxVytVz1MQ+0DjAKYKMuJ2K1Kb7tzM889ZoSiXosRNuUKsonHAoSaKrdUHnv9qRRlOaFRYbiLjYyIEF+5UKSbZSmd2obAbS54sKmqtY+BXCaFZnyVqKw7lE43KX9GuaWTHuSi7ydEU2wksD6ZXi6xkQnp3UldzxBfCWkkZ2OX+s/E5omBenM/9ke0ERoGV462SpDiuygB8PTcLRaYwOHQ9CAPQxIUoirWO71MG28ZJpPByPOwqPLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zaUO7Bv21DTFs7v8I1wHWQe21Y+MPzr/qgqGe+Ny30=;
 b=X2RWTkSc9sbto0XlDgr0/S601wTKOmRRWOKybW8Bs6LwNuYlvyOPevJ7JhS5Aq9VYp7jWE7Z2CQ8ukmP5Z4rTuMkaOEziKYasaqeqqPc8GqsYE1I0z7Q3MmhS1Kv3bAhc3zVMUVYh3wGK6dIGGrPw/FRLKVa31W71mVc47KG2SPQWNr+nbRcXiPQ1PPrOygh9Se+Ju+DrI9tuwtPNhgovpvn4Cr7t+OtNUkDn1TwSXARH0VMEk0TsfEfQ1LixhMmKMOHA42TJdxuBM9qh/E5X91jNgSQk2UR+6Kj1B43YfYr5VNuCEGIqwaWfgfP3aP79T8eTelVTs/nZZgevUhaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zaUO7Bv21DTFs7v8I1wHWQe21Y+MPzr/qgqGe+Ny30=;
 b=rJOU2lXqw/RSR2+AinyHb+WCQszbPHWwFzWfEbOh/dXQvDmq2o3TqE06oZ8tKRyqpIZRcE8aCLLXlg7M/Tjs8TmShohX/Aj6yvEdnVsovL56iyswX8TtY8tAWKHV7/GK+ELQ1r/JJmHbMneNQe3HiF+oeMAPjvpRjfBSW2y9egk=
Received: from SJ0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:a03:33e::16)
 by IA5PR12MB999276.namprd12.prod.outlook.com (2603:10b6:208:60b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 04:16:46 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::2e) by SJ0PR03CA0041.outlook.office365.com
 (2603:10b6:a03:33e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Wed,
 16 Sep 2026 04:16:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 04:16:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 23:16:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 23:16:44 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 23:16:40 -0500
Message-ID: <d0d2b334-d7e2-4a4e-87e3-d24e6f3afbc2@amd.com>
Date: Wed, 16 Sep 2026 09:46:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/16] sched/core: Activate blocked donor when no
 owner is found
To: John Stultz <jstultz@google.com>
CC: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Waiman
 Long" <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <20260826062901.2137-5-kprateek.nayak@amd.com>
 <CANDhNCrgA4FtvybSaigh1nfDr2r+xz5FDrhpWHnD3FS3FD2tWA@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CANDhNCrgA4FtvybSaigh1nfDr2r+xz5FDrhpWHnD3FS3FD2tWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA5PR12MB999276:EE_
X-MS-Office365-Filtering-Correlation-Id: c82296aa-f451-4220-dd66-08df13a9522d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|7416014|376014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	AY7C5Rl02YYFmDITaPfN/pMVasEmbxmJ4N+7rUH7yZHU9W5ZOp2mD5IqEnxmHmQpAS2TsWmZ/otCbC4usNQuQSC16BHZr3WhuM4AykE6wvxlhocDWySApjhG8W6r/AcjUUNlOlbP9JqNogT/8cIMTUwjhAw5DimfdNW7/B3h6a12RwQUzC+4lbwYET+GC6HPHnuCwTYBxe8EYFgEVzSz/USht+6KSaSXpXEnUrEX46yMPc3XuX2CJxtyWj9LQ5IO6g7skCCND7SL7hLaW0CFzEp6thnLIqIUZAw6/LzV721DjCEhekSx3JfZl9SQ4dod8lCDxBiyIlYZDDKIxx4Eo1WnNuDxtwv8J85L4fL3GEFg3S1Hw+v2RyVjQMFwnkol06ZOINazBrOb3EeQOg1dBIrv4Z4rrNiOalxrHHrZ6/XWbZSV3sIB9iMbZYcsxlFZairg2WOaUTODYFliBs5/TmCWzShal8sx2whd6zlPoaDHRM8zJR+iLgrt+hHO+hVvRwyhB5LzZ71bKRB3gcBAqOKOAhgS4aW7OKSPdHn4KqyPOciyQRaNF6mmEx+D08HDMiFPb5INaZ8udz6Y5PRVitjuBztBUO9VMOh0MHx1tP0V+2osacHxLHHIDarQYtb3LzjxquTYMdhW5UailTc829sPFB8yMk72FOgTMi7tgh+X7cwmXjXUMT7++h03zup9yVNsm9QJQCr4QUmv8aPV8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(7416014)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y0vMxabfdgip8awnnBCndf9NwCYzWcPGUozj5Z38wGHCnyllA1/IiNa8VQrmauhonwosVjVTIH+mXkJhVVyJ4IryjG/ZkWAGQO+GGOLwshxaND2TM49JDPAn+HSgkM2PaiIO8wM1MAUCXXifkfVHHuTlvRn2aWhSApBHT2Ssdp9skwuNqJ9DJq+5UR5GRyRzRG1WmAPGNl28bQw8USbSfurCl4OPICDa7sq1s9GLrlts6oUGUijZxAVNlE8n0TIDftX1Eq1CVH/VEOh9gVNY7Ant6TmeF2z1RMC3ZuBSZ3w5ot/m+cmEeH6B61z6denKu4AqBfxq0tLSStaZ6BX5SGo1UzYhDAsmbOZxvx7R7kj7Y5vQy3Z/7hC18n4ifFTr51r0AgIZ5Rsj6ogVd2l2T1lNORUaLlAd11bQhllg047IFfLZKaEMsOs4KyOjVrDL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:16:45.8007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c82296aa-f451-4220-dd66-08df13a9522d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999276

Hello John,

On 9/16/2026 8:59 AM, John Stultz wrote:
> On Tue, Aug 25, 2026 at 11:30 PM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>
>> mutex_unlock_slowpath() follows:
>>
>>     if (owner & MUTEX_FLAG_HANDOFF)
>>         break /* ... and do __mutex_handoff() */
>>
>>     if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
>>         if (owner & MUTEX_FLAG_WAITERS)
>>             break; /* ... and wake up the forst waiter. */
>>
>> MUTEX_FLAG_HANDOFF is only set by first-waiter after it has been woken
>> up and in absence of MUTEX_FLAG_HANDOFF, the owner clears itself from
>> the lock_word and wakes up the first waiter to try a
>> __mutex_trylock_or_handoff().
> 
> We also set it when there is a blocked_donor, to ensure the task
> donating its time to the owner gets the lock next.

Ack! I just considered that to be the same as a MUTEX_FLAG_HANDOFF ;-)

> 
>> MUTEX_FLAG_HANDOFF exists to prevent new optimistic spinners from
>> trying to hijack the lock from waiter all the time and potentially
>> starving them but it is not necessary for MUTEX_FLAG_HANDOFF to be
>> always set in presence of a waiter.
>>
>> If a blocked donor is deactivated when no owner is observed, it may not
>> be woken up until it becomes the first waiter and is naturally woken up
>> which breaks proxy in the interim.
> 
> Hrm. So in older versions of the proxy-migration/return-migration
> logic, if the owner was NULL we'd clear the donor's blocked_on and
> either run it or do return migration, which I guess wouldn't see this
> issue.
> 
> I'm curious, is this behavior something you've observed directly or
> did you just find it through code inspection?

I was testing chain migration and I would see some task just block and
stop proxy.

It basically led to an observation where I would see most tasks, which
are being proxied, finish quickly, and the ones that were fully blocked
would wake last one by one and finish slowly. 
> I'm wondering as in playing with Suleiman's proxy-futex work I've seen
> a few traces that had some unexpected behavior and I'm wondering if
> this might be the cause.
> 
>> Wake up the blocked donor and allow it to grab the lock when no owner is
>> observed. If the task manages to grab the lock, the block chain will
>> follow at the next proxy migration. If the task fails to grab the lock,
>> same situation is restored and everyone migrated to the CPU of new
>> owner.
> 
> This seems reasonable to me.   For the situation to occcur, we'd need
> the task A to be deep on the waiter list, and be in blocked_on chain
> from a selected donor, and the lock its blocked on to be unlocked and
> ownerlist before the woken top waiter is able to take it.
> 
> If the task is important enough to be in a donor chain, then we might
> as well wake it and let it try to steal the lock. That seems better
> than deactivating it and the whole chain until it rises to the top of
> the lock waiter-list. Especaially as if we came in a moment later and
> found it owned, we'd be potentially migrating the whole chain to a
> different runqueue just to boost it. So yeah, making the most of the
> opportunity and trying to grab it makes sense to me.
> 
>>
>> Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration for PROXY_WAKING case")
>> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
>> ---
>> XXX: Is there a better way to handle this? If we can confirm a owner in
>> find_proxy_task(), we don't need to do a spurious wakeup of every task
>> observing !owner.
> 
> I guess I'd want to get some metrics to see how common spurious
> wakeups are and how problematic they might be.

I think it is rare with proxy - if there is an active donor, we do a
handoff and we don't have a problem. The only way we have wasteful
wakeups is if many CPUs have a blocked donor that see the same lock
having !owner and all decide to wakeup at the same time.

> 
>> proxy_resched_idle() until owner appears in an option but it will spin
>> until next owner appears.
> 
> Eh, that feels wasteful (especially if the top waiter unlock woke up
> ends up deep in the runqueue and doesn't run for awhile - I see Andrea
> raised this point).

Yes, and I had weird (borderline criminal) ways to get around that in
https://lore.kernel.org/lkml/fe1bef59-e047-4008-b498-0c0d49a2be76@amd.com/

> I've lightly tested with this and it seemed ok. Though I want to do
> some more runs with it applied along with the proxy-futex code to
> understand if it helps.

Ack! As mentioned in the cover letter, I have only tried this in
middle of your pile where futex bits hadn't come yet and similar
to chain wakeup, my head started spinning after reaching the
cpupri bits.

One of these days I'll be able to push through :-)

> 
> Acked-by: John Stultz <jstultz@google.com>

Thanks a ton.

-- 
Thanks and Regards,
Prateek

