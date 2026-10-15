Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1A3E834F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035752; cv=none; b=kLyicYIJtbg3w+lOAc4lecWuLU6Uf5g7dCiTvY0rAnmiFoDggTjgdpv5oEfSk36XqHbYooOUuiUXFl+ZrJ63IEpqomqhb3ShE9iaQTGzP/DcU3MOCsS80nA8eguhXcOageG77cNoUr/fiDHWaCPttQ9HCu1y3xXZRfwRdWkQlTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035752; c=relaxed/simple;
	bh=MAle1rxtN+5sTXt5cEGX2nYA+bMHJgSJkkzcPshSUHQ=;
	h=Message-Id:Mime-Version:To:From:Cc:Subject:References:Date:
	 Content-Type:In-Reply-To; b=k82Gu8JR4oDobBgt6J6/QZWnJ/nXknww2YucElAm/tqTmzygP0RHk9CvaWV7uInC3i/Uc72wlDfkeP4czTeizK1+jQWaR4+ZmglvrhnLWAYEzZrk4M4Jcczu1pHl0pK+T87Ze5Q1rKkiJWrJM0EcTT62OgUEtjUEDx207spnqgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a4qzHdzJ; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a4qzHdzJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792035737; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=18g34PysGbh5XHdISii7T815efgfUCVrzKpp9lKPQHQ=;
 b=a4qzHdzJzwSU4RNzZZTWTpnjQiz55jgr+5VWbz7fivEVDT1rBuc6khUdLFCbF55lx05SIc
 3UEUAi0hEtppmsSxwRaNA2JNGmyPGWJ7QERlBZIVDbjC+0NQtBD9Bw1xzjD4km4Qfglj3n
 KXO4T+Bo4R57nExxL1d5hSpVEgOeMSos1Ir5wGcU9r59DTL1uMZf0XuOgYWG7cU2mSaWVV
 QWnls9oaxwlSYiZsddmjolHoKZkDjDISS/44ve9sFsJS8asbQNuUCnJ07h4omYju492GgF
 DtDLsJ8AOeAdTr5Dc+I/UlRNDEJhyOx2MLiA/8Y8QSQgeC5lYkUEkfFXfo+XbQ==
Message-Id: <359a4776-6737-43b3-8c26-77b2d3bae081@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: "Gregory Price" <gourry@gourry.net>
From: "Li Zhe" <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, <mingo@redhat.com>, 
	<peterz@infradead.org>, <mgorman@suse.de>, <riel@redhat.com>, 
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Subject: Re: [PATCH 1/6] sched/numa: clear fault locality state on execve
X-Lms-Return-Path: <lba+26ad04b97+90936a+vger.kernel.org+lizhe.67@bytedance.com>
References: <20261014094347.99157-1-lizhe.67@bytedance.com> <20261014094347.99157-2-lizhe.67@bytedance.com> <as98SA5yfBaeI4oj@gourry-fedora-PF4VCD3F>
Date: Thu, 15 Oct 2026 11:41:51 +0800
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <as98SA5yfBaeI4oj@gourry-fedora-PF4VCD3F>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>

On 10/14/26 9:02 PM, Gregory Price wrote:
> On Wed, Oct 14, 2026 at 05:43:42PM +0800, Li Zhe wrote:
>> task_numa_free(p, false) is used by execve() to reset NUMA balancing
>> state without freeing p->numa_faults, because concurrent readers may
>> still observe the task.
>>
> Is a process that exec()'s going to run long enough to actually collect
> any real numa fault data?
>
>> the retained p->numa_faults array, but leaves the current-window buffer
>> half and p->numa_faults_locality unchanged. Those are also NUMA fault
>> feedback consumed by task_numa_placement() and update_task_scan_period(),
>> so a newly executed image can inherit stale fault feedback from the old
>> image.
> I'm not sure this actually corrects much unless you have a long running
> program that eventually exec()'s - and even then it seems like this all
> self-corrects within a couple seconds.
>
> Do you have some clear reproduction that makes an obvious wrong effect,
> or was this just some static analysis?
>
> It's "not wrong", but I'm trying to understand what impact this actually
> has.


This was found by code inspection, but it is related to the same class of
stale numa_faults_locality problem Eric fixed for update_task_scan_period():

https://lore.kernel.org/all/OS7PR01MB139144C7E07C97B3F3B47016796D52@OS7PR01MB13914.jpnprd01.prod.outlook.com/

That patch clears locality feedback after the scan-period update, so stale
locality and migration-failure information does not affect later scan-period
decisions. This patch handles another reset boundary: execve() already calls
task_numa_free(p, false) to reset NUMA balancing state for the new 
image, but
that path leaves the current-window counters and numa_faults_locality 
behind.

So a newly exec'ed image can consume locality or migration-failure feedback
from the old image during its first placement update. I agree that the 
impact
is likely transient, especially once Eric's fix is present. The intent 
here is
to make the execve reset path complete, rather than to claim a severe 
runtime
bug.

Thanks,
Zhe


>
>> The non-final path clears p->total_numa_faults and the averaged half of
>>
>> Clear the whole retained p->numa_faults array and p->numa_faults_locality
>> together in the non-final reset path.
>>
>> Fixes: 04bb2f947505 ("sched/numa: Adjust scan rate in task_numa_placement")
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>   kernel/sched/fair.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 57360f5cdde4..1053437933ee 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -4177,8 +4177,9 @@ void task_numa_free(struct task_struct *p, bool final)
>>   		kfree(numa_faults);
>>   	} else {
>>   		p->total_numa_faults = 0;
>> -		for (i = 0; i < NR_NUMA_HINT_FAULT_STATS * nr_node_ids; i++)
>> -			numa_faults[i] = 0;
>> +		memset(p->numa_faults_locality, 0, sizeof(p->numa_faults_locality));
>> +		memset(numa_faults, 0, sizeof(*numa_faults) *
>> +		       NR_NUMA_HINT_FAULT_BUCKETS * nr_node_ids);
>>   	}
>>   }
>>   
>> -- 
>> 2.20.1
