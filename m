Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48DE3E5A35
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539054; cv=fail; b=bC/QGxQA+iNIWwBJv2qOaaVg76SIBnlpsjeBLgxA7rLTOrM2p/WxPXzhrFEWiyqH4rLSL7rv+pZ2Z7rXrxGD2NAiNRK7PwCf+aNJ2MAdMqL7ADoTIUP1wwO5JrtGJf3aob/LmVnNRlRAzTiqzHoetEjZ5laekMSkdbbHcng5Mtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539054; c=relaxed/simple;
	bh=1fxkjs/G4YoKG8ASNY+w5h0ITMpRz/JisbjAIwVGM0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hvt4GZg2VUDGVs+EY1OkoXIIcWsl9YOBvmQccxVgORHC56kyuUCoPzK4ThwuKUYiYCjsYoTk4ERwAitkBxqmRp6Z2QwZqq4qimt6d33TLRJ7EnvfiajQRnhUgcOPocAE9Wdgbz+Ffuur+nUBCJ1YeNiJDod1W7EHUvlnEdIdSzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kzSKzC3J; arc=fail smtp.client-ip=52.101.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kzSKzC3J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ER/dzpO6wWGMt8wvLQOGF9W2WrKOrxeYq5CNbJhanD+Ma8mXP6oqHQtqUV+wcHimwcO2ax3jT10hyee7gHnGeUPrjp0jMmB+HfEmLROImSZS/2ioAX3zqosPYI21rPQN1GydZtPl3MngfayrGptfsbdJ+U38lhIWlULousSIMP0HDMsWx53qR03cbs2cQd/McfZWovEBVd4Td4RqF+VbklJMpBR4Yi5MRZH8xqIkMj6RYw9MY8/Uuji3Q8uvymXLeKKk3xk+rOOJMdsU9EfySE6c+9yZtYHMvya0HtsNA2Dc+1NaikwnzNb+eMRWGcal5G/VX0zFxj31Kund2MsHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sr4OkqAOQkPverA6s/D6oHCYRFr5ZRAdOkQ4F4nYX0=;
 b=hHcIDIQUIiEr/biaLxqaCg6L04CDd8OtML3JJvTWmJOkoXeLPvNXp5kxGgfYYiy/jFi4I70QeqiBceOBY9O57gxCOah+82xAq1PfVZSngDFpDg+IfyjtOBjPEFYXCI2sRkGE0AWJQceGzpouxXRw4WwMP00HIsdg2INoxRuXZbAPDAJgG3Ilux1aQale25ZcrRAxTgbl4vli8aPayD1zxhqDkMP8zn5F1yJBSbrawL6s5k4vavdpVAbOPPT9hjg2z6CeKxxZlcAzG0x0HiTEla6tj3eI9PiD7uB+Ghp7fVzLa6fQ6ZC3JTRWg6ZVmycdfgYXqrSxvvGTthhG9imbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sr4OkqAOQkPverA6s/D6oHCYRFr5ZRAdOkQ4F4nYX0=;
 b=kzSKzC3JNGkDP3pyQLxPM7X56/WrSAxSyTgBpz/f5traaZgbwOwiT52nafcMAyrQ8b897Qd0cAjRA8s3qLJus66bMNnKUzoLksY1KzXHoB9aISUk2T+RN0y985y2O9VxzXWgYsyC4b0mgAgPR5UQcsycBsRbRoneVW/G8s/eYZk=
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 06:10:46 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::65) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 16
 Sep 2026 06:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 06:10:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 01:10:45 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 01:10:41 -0500
Message-ID: <a367d70f-a095-419f-83e8-5d7458204f3d@amd.com>
Date: Wed, 16 Sep 2026 11:40:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16][PoC] sched/core: Alternate approach to
 sleeping-owner handling in PROXY_EXEC
To: John Stultz <jstultz@google.com>
CC: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Waiman
 Long <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 584187e7-f7fb-450d-8fbe-08df13b93f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|18002099003|56012099006|11063799006|4143699003|10067099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Vv3/5KTYnFtYVPThmAHCvMednaY/33tp9kA8+fdPMqj8SftT7Hhv8rshu45GwHqYSf7bKg9m1W3filONnJdGHFm4t6k5gHLp3iX3g+QmOsV+8b5enphFa/cOSiPEKSsLWRlVarxRn1Na+OKpLyt/KltKNnaV78ua1JagmQG6tddaGVHnseA/j1fHQG+bwQdIWkgEKaUys2N7nJlWkqWEIakPml3fv8/JVuqajT8TRBvMQrBVDwjFfHqPqzCTCrs5P9AbqJ4z6LuFY99cdq3CkKj+vcQ/xYrQn6cSjgBbPWhNSRdlU7+vd7RrGsRbcF/K1oi7wFaEAgFSPjhnnP9Uj+Mo8VqaWXwyvStzUEasnJI1WMxA6Tet4OUwFuR6MEPdv88qYX2fuw/sTGk+WDkEYn/5AuFp3pxTHg9oG/Yc6OQ1xzv3Ju47TyDx/wCpb/kg767Q1w5hVqnE1nakKQOVF99NZc7w47rj5hxznyGmpv2W1XXwMbfSeC4SQU0luMUS2HHLb/yC1dhwBjChGn0xyK39Cw37oVeMPy0uzeufA3uqSKAEsqjWE2NXfxLzYyTFxKuN5LoANVF6ogigqslnTgSbxyj5z9foeq0hI0xiGctfWEXevq8DSUDaK+P/R4AeiqZo3lBcayoOBPQFKomLNjVrOLNk0wR0mimWxEv9nx/MEFitOdmprMmYjQpi1QsmilqW73MGn9FWz9FND5V2Bg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CknrlW7JKcpLyUEUev5SYN5VSGbeO5vKC5lOYB3pi/fMTQJ2a7N7QEa/qaC8jdYQdX/Yug6FPh3lEUMbMR88OcI50vhp1ZtFGDla7CausSuray9Bbz7fAKJ+vgFJtL8GeHT2oBVeU4DEfFyH3Vop7sCjgAksKmnc/K/CrBm9Q7Lta5YRPGkPQNa2Xfpp/jmNUjUQ5UGO8QSZTg4jorM9u2YXjgcDEiNSVIjE/Em4oOKFWtUFRe35tCToIQRtuPwqw5VirBiqr78WwNKRXluPafy7htuoVleZLmfPkNelYcbO3Y0F44YbgrKUe7o82+4pii/gZgfKHrQgM0qV8FZeVkPhToK+kxhJk2sMITtvGCZt7xKVDZL4NJ9It+XtW2mSNyHQogKMh1xXSS5xJwkpPEs45dQ1d6kR/idD1zmrDam+3k/mgyXOWN0iJyjC+YPQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:10:46.1547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584187e7-f7fb-450d-8fbe-08df13b93f58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

Hello John,

On 9/16/2026 10:52 AM, John Stultz wrote:
> On Tue, Aug 25, 2026 at 11:29 PM K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>
>> I had promised John I would share an insane idea if I got it
>> working(ish) so this RFC presents an alternate approach to handle
>> enqueued donor wakeup vs owner's chain-wakeup race via ttwu_runnable()
>> path and make the activate path as light as possible for tasks that
>> don't need to do a chain wakeup.
>>
>> The series essentially breaks down John's large patch at
>> https://lore.kernel.org/lkml/20260807035232.1881495-9-jstultz@google.com/
>> into smaller chunks while introducing the new approach and fixing a few
>> snags encountered along the way (Patch 1 - Patch 4 are fixes that can be
>> discussed without getting into the rest of the RFC).
>>
>> Disclaimer: Series in not bisectible in any way at the moment - related
>> bits are introduced together at and intermediate builds may fail.
>>
>> Introduction
>> ============
>>
>> Handling sleeping owner requires proxy-chains to queue on the said owner
>> and perform a chain activation when the blocked owner wakes up.
>>
>> Since a blocked donor can be woken up by another concurrent wake event,
>> the activation path becomes complicated and wakeup has to take an extra
>> lock (p->blocked_lock) to prevent any modifications to "p->blocked_head"
>> and miss activating any blocked donors.
>>
> ...
>> Trade-off
>> =========
>>
>> Advantages:
>>
>> o Only need to juggle blocked_lock(s) under a single rq_lock().
>> o Re-use ttwu_runnable bit to handle removal of proxy donor.
>> o No need to do get_task_stuct() / put_task_struct() juggling.
>>
>> Disadvantages:
>>
>> o Possible increased rq_lock contention on the chain-wakeup path but
>>   those events are generally rare.
>> o Lack of delayed task handling since the src_rq need to be locked
>>   separately to migrate it.
>>
>> For the delayed handling, it is possible to use proxy_migrate_task() to
>> move the task after blocking. Series does not implement this yet to
>> limit the number of bad ideas.
>>
> 
> Sorry again for being so slow to respond here!
> 
> The series definitely looks interesting, and it seems to be holding up
> ok in testing.  Though figuring out how to refactor them so that they
> are also bisectable looks like a real challenge (part of why my
> sleeping-owner enqueuing is basically one big patch)!
> 
> That said, I can't say I've truly gotten my head fully around your
> series yet. I've definitely had way more time with my change, so I'm a
> little biased in feeling its somewhat more bounded (even though the
> activate_blocked_waiters() function and the multiple lists of tasks
> are very complicated).
> 
> My initial sense of the downsides here with your series are: It adds a
> lot of new per-task state (blocked_cpu, is_linked/needs_rq_sync,
> sched_migrated_on_blocking, lock_nesting) to keep track of, and some
> of rules for the new state have dependencies
> (sched_migrated_on_blocking is tied to is_linked), and leveraging the
> ENQUEUE/DEQUEUE_MIGRATING flags feels a little subtle (I have often
> gotten the ENQUEUE/DEQUEUE flags wrong in my patch series, and
> unfortunately the general documentation around those flags is lagging
> a bit, so this adds to it).
> 
> The locking being simpler is a clear benefit and definitely sound
> appealing - though I do agree the rq_lock hold time in
> proxy_activate_blocked_task() seems like it might be an issue.

Ack! My original thinking was it is only done in the slow-path and
is only held for a few ->on_rq and list manipulations so I might be
able to get away with that small overhead.

> 
> I've got a few more questions on specific patches, so I'll reply there.

Looking forward to those.

> Again, it definitely is interesting and appears to be more integrated
> into the scheduler logic, so I'd expect that will give us better
> results then my maybe more isolated and tacked on activation logic.
> 
> Have you gotten a sense of what Peter thinks of it?

I think Peter is slowly getting through the more stable stuff first
and may arrive at this at some point but I'll try to get a word in
at LPC if he is planning on attending.

That said, knowing Peter, I have a hunch he might like your approach
better since it handles delayed tasks too (tasks may be eligible at the
time of chain-wakeup), does not add stuff into ttwu_runnable(), and does
not have the insane (DEQUEUE_SLEEP | DEQUEUE_MIGRATING) behavior which
has larger implications for PELT tracking and SCHED_DEADLINE.

I sent out the RFC since it makes for an interesting discussion but I
have a feeling lot more things need ironing out if w go this way but
I can always do it later after the stuff from you and Suleiman lands
once I can prove some benefit.

-- 
Thanks and Regards,
Prateek

