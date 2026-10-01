Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C8D383C86
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891525; cv=none; b=AAijb4/Ki0NoAVQcMS34D8FMxBksQ27iOkN+lzHlBysIwE3Y+boDVrU+u1Z5zJhc72gLC2n0QfOEcTSvOSf0lR97jsE4/n8zMvHd9pqDtJm/mUcTLFvXEOZtqiGw0308FCYIGcC/P4LJ/STImYtldbVWITl0C/0AntncU1JfC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891525; c=relaxed/simple;
	bh=9bbuZIylTD89tj+jBaHTvyIjUczFQD4JnagVzgnErfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqCF5PxdHJgn3PUariy0O4oN2EbCLkfS7YaA2UHBRnINFJyflvNN3OymRddOyT5vUaZ9nYzhLzNHBIbDGXvTuuDi0yQM/LrqQ71wvAogjG2ecN1eXj06t153/aR8pNvGGTYiPC7IjYVGAo6sdmHf16Z2d+Kg6slCDRooFVWLr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=t9cEbP3Z; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="t9cEbP3Z"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07C4497;
	Thu,  1 Oct 2026 14:51:59 -0700 (PDT)
Received: from [192.168.0.248] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4563F86F;
	Thu,  1 Oct 2026 14:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790891523; bh=9bbuZIylTD89tj+jBaHTvyIjUczFQD4JnagVzgnErfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t9cEbP3Zebp/pRhPs3qT4Wq+I/aM2JGvZczlb83IywQ0sNVyhM6NGIzeQB6UE9YBt
	 GFcVPPrwU6F+ZpwGx+Rr7cYyOU6o1GFe4tdHNfAzLt1Tsr1SwFgXspAZ3+ElzCgCCM
	 hX3/AUVCzBmeMFHZDo6lyWd/ifdgonI05zGejHnM=
Message-ID: <ac4671ff-18a7-4447-84e6-30d35df1c7af@arm.com>
Date: Thu, 1 Oct 2026 22:51:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] sched/eevdf: Keep expired protection expired
 across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: dietmar.eggemann@arm.com, elif.topuz@arm.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 sh@gentwo.org, vincent.guittot@linaro.org
References: <20261001134016.3881268-5-christian.loehle@arm.com>
 <20261001164609.244156-1-kayracizmeci@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261001164609.244156-1-kayracizmeci@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 17:46, Kayra Cizmeci wrote:
> Sorry for being a bit late :-(
> 
>> @@ -4941,6 +4941,9 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>>  		se->deadline += avruntime;
>>  		se->rel_deadline = 0;
>>  		se->vruntime = avruntime - se->vlag;
>> +		/* Reweighting must not revive expired slice protection. */
>> +		if (curr && !rel_vprot)
>> +			se->vprot = se->vruntime;
>>  
>>  		if (!curr)
>  			__enqueue_entity(cfs_rq, se);
>> @@ -8204,7 +8207,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>>  	struct sched_entity *se = &p->se;
>>  	struct cfs_rq *cfs_rq = &rq->cfs;
>>  	unsigned long weight;
>> -	bool curr;
>> +	bool curr, expired = false;
>>  
>>  	if (task_is_throttled(p) && enqueue_throttled_task(p))
>>  		return;
>> @@ -8237,6 +8240,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>>  	 * XXX comment on the curr thing
>>  	 */
>>  	curr = (cfs_rq->curr == se);
>> +	if (!curr && task_current_donor(rq, p))
>> +		expired = !protect_slice(se);
>>   	if (curr)
>>  		place_entity(cfs_rq, se, flags);
>>
> 
>> @@ -8248,6 +8253,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>>  	if (!curr) {
>>  		reweight_eevdf(cfs_rq, se, weight, false);
>>  		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
>> +		if (expired)
>> +			se->vprot = se->vruntime;
>>  		__enqueue_entity(cfs_rq, se);
>>  	}
>>  
>> -- 
> 
> There are a few thing here:
> 
> This (!curr) branch has been removed from tip sched/core, here: https://patch.msgid.link/20260911155449.1249726-1-kayracizmeci@gmail.com
> So, heads-up.

Duh yeah, and the fixes I needed are also on sched/core by now, so
no more reason for this awkward base.

> 
> Also, when we have alive (or live, as y'all call it, I think it's better this way tho :>) 
> protection, and (!expired) reweight_eevdf() doesn't enter the on_rq path and
> alive protection is not reweighted. Not tested tho. And I may be getting something wrong.
> This is not about this patch tho.

No, you're correct, do you wanna fold mine into your fix and send that out?
(I think it looks better squashed but feel free to just pick mine up as your 1/2
if you disagree)
With 1/5 and 3+5/5 dropped there's only the refactor remaining and I might
as well send that as standalone.

> 
> Your commit says "Commit ff38424030f9 ("sched/eevdf: Update
> se->vprot in reweight_entity()") subsequently handled live protection,
> but left the expired case unchanged." too. So it's gotta change if I'm not missing something.

Correct!
Thanks!
