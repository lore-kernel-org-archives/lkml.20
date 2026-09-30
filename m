Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D7C4D9540
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782130; cv=none; b=aWzDJYFwoqq1lsqoGGgfY12pPSaU+gzOPuHmivFsN/hjg92FTe/dhbaDxZb7znbuHoy6Wc9iGih3NU+pqBif/yAgviKXsQ0QmmAQd0thQEvs2hLeVdYz/cHCWiL8PKcp4I+bAfa93T22WsPNVhruu3n8mXoSJEPrBloXgf6h1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782130; c=relaxed/simple;
	bh=sA52Gqn0buZwxHLds94/NX8mfulTVkBxcquIO/y3RbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiI1ARPDhkSlejMdpwV8Tjt3HZZCu/FB7esO00dCDewvBHUizghhnHmByRuft1YNpLpvuJS9iT/7MmW9BctoRAmv+NvUNfjTTmEveqlhBY7kkKKe+AsEuyDtzzI+ln+TiPvRKeQqZdP0dR6peWKqsrTJJASJqP4fvZCn5WxsWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NcKljh/j; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NcKljh/j"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 790D9497;
	Wed, 30 Sep 2026 08:28:23 -0700 (PDT)
Received: from [10.0.130.165] (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38573F86F;
	Wed, 30 Sep 2026 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790782106; bh=sA52Gqn0buZwxHLds94/NX8mfulTVkBxcquIO/y3RbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NcKljh/j+W7VNviS3xwIYWcEmAy0XWXpVOR46OtXggJ/jkfoAy6EsSpBzjIY803ZO
	 tqZ+9eoKeNbRFoKGHA+o0/GMjQMUVhNGOQCU+WkHS3NFU9BwyUH1upR20wwXiEruaE
	 +DxNGvd+KGFYvtWBRxlISYv7TGa5PUf5SHu8ceno=
Message-ID: <e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com>
Date: Wed, 30 Sep 2026 16:28:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/eevdf: Keep expired protection expired across
 reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, vincent.guittot@linaro.org
References: <78ce8f8ceb4f5c7fda14216d3dff9d74e17f55ac.1790756779.git.christian.loehle@arm.com>
 <20260930133716.214471-1-kayracizmeci@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20260930133716.214471-1-kayracizmeci@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/26 14:37, Kayra Cizmeci wrote:
> Hi Christian,
> 
>> reweight_eevdf() rescales live slice protection, but leaves an expired
>> vprot unchanged when moving vruntime. A reweight can move vruntime behind
>> the old vprot. For example, reducing the weight of an entity with positive
>> lag can do so:
>>
>>     before reweight:       vprot <= vruntime
>>     after reweight:        vruntime < vprot
>>
>> protect_slice() consequently becomes true again, even though no fresh
>> protection was granted.
> 
>> This also happens from task_tick_fair() after a queued HRTICK has
>> requested a reschedule. A four-task rt-app workload with 100 us, 1 ms,
>> 10 ms and 100 ms requests can then repick current despite a runnable,
>> eligible entity having an earlier deadline. The stale protection takes
>> precedence in pick_eevdf(). Cgroup weight changes also expose this with
>> HRTICK disabled.
> 
>> Separating vprot from vlag allowed the expired absolute boundary to survive
>> the lag update and rescaling. Previously, those writes to vlag overwrote
>> the shared storage. Commit ff38424030f9 ("sched/eevdf: Update se->vprot in
>> reweight_entity()") subsequently handled live protection, but left the
>> expired case unchanged.
> 
>> Keep an expired current entity's protection at its new vruntime:
>>
>>     after reweight:        vprot = vruntime
>>
>> This keeps protect_slice() false. Retain the existing rescaling for
>> protection that was still live and leave non-current entities alone.
>>
>> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
>> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
>> ---
>>  kernel/sched/fair.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 868c3911337a..d10eeea75f13 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -4951,6 +4951,9 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>>  		se->deadline += avruntime;
>>  		se->rel_deadline = 0;
>>  		se->vruntime = avruntime - se->vlag;
>> +		/* Reweighting must not revive expired slice protection. */
>> +		if (curr && !rel_vprot)
>> +			se->vprot = se->vruntime;
>>  
>>  		if (!curr)
>>  			__enqueue_entity(cfs_rq, se);
> 
> 
> Okay, so scene:
> 
> we have a rq like this:
>       +----+
>       |root|
>       +----+
>        /\
>       /  \
>      /    \
> +------+  +------+
> |task_a|  |task_b|
> +------+  +------+
> 
> When, sched_change_end() activates for task_a, (Assuming it's Fair Class and weight is different than h_load.weight)
> enqueue_task_fair() calls reweight_eevdf() with on_rq = false so the block never works. Then we call place_entity() and vruntime goes back.
> On normal enqueue, this will be tolerated with vprot getting written over. But, sched_change_end() calls set_next_task()
> that calls set_next_task_fair() with SNT_NORMAL. On that case set_protect_slice() is not called. reweight_eevdf() is called
> again on that path, but because the first call did the job this one just returns early. 
> 
> I could be missing something tho. If I'm not, should we fold this into 2/2 or should I send a patch about this?
> 

Thanks, looks legit to me and I did a quick rt-app + trace analysis to confirm.
I'll fold that in with you as a reporter if you don't mind.

I might start including the rt-app workloads in the cover-letter before I
lose track of them myself...
