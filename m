Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FB73EE1FC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036212; cv=none; b=hRlXYXh7aBQryYd8omVwKn+DvEnc+bCsZfYb+ixXeDkuXWoFHk70Zed9GkwwL7vhjmBDSM6w29CJTaVtXQ6qxYmzgkNZUqZYV6cnMGLJMQocNbIc0Urf7C9V/jahhocWbl3jWG6rFSd18hxVnKINFuKMncSWrm0DmZFXGaCZDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036212; c=relaxed/simple;
	bh=jHIpP8m8Fuscpg5gvqfH9E/D3yufuKsQ5zb0J7Ryd90=;
	h=From:Subject:References:To:Cc:Date:In-Reply-To:Message-Id:
	 Mime-Version:Content-Type; b=S0Jc8dAWLiCfUZKyjzpLnDAt0OAfzNVCDPkUNRExrQcE9W5LE63uR2KfPlZvSJvfhMtRYUNBtA2Q7S6XqFgOQnJ6NmexkbtPcIF5oKCYVhGX4tAjMK5Hw3puMAm/tgudMlqsdkl7lK3dQkSHSC169p9mHO8FHfme3SDXpwPbFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dxwdwJln; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dxwdwJln"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792036200; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=6Om/DEKPFgRQsjS9jvWBk11FC4wZN19UjaH+0CqwpAI=;
 b=dxwdwJlnYCvYFuDN0uI3dvjULpWjZ2U6A372BqgWqi6XJfySB2uOVrMU+NFI7qqAvSG463
 JIw6LGFL7kmBPv7V3WcggWfUW53ZJOaFtWyelh03b2MaZqb8dD/AUyTdnDJz3omqRW4czQ
 KKMcGnTWpbdFHNx8yFJUf0YIX+fGZPgr6Jo3hj/EAy8ilW8RceI5SUn7CkLJOYdv8F4RjN
 I3vx4QvFrxYYimjUcRYOO1uosFuB3ZghKyfFX2dIlq/9kwSS5uwjc+nBrqRl19eEru2SVK
 VjaG4/QLyYVy99e9OYtnHpQn0QVXDNZjpHJeM3NpMYgedfIAA9Q/J02pBEZhmA==
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH 2/6] sched/numa: fix scan-period ratio denominator checks
References: <20261014094347.99157-1-lizhe.67@bytedance.com> <20261014094347.99157-3-lizhe.67@bytedance.com> <as97rD5uxYva4ayg@gourry-fedora-PF4VCD3F>
To: "Gregory Price" <gourry@gourry.net>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, <mingo@redhat.com>, 
	<peterz@infradead.org>, <mgorman@suse.de>, <riel@redhat.com>, 
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Date: Thu, 15 Oct 2026 11:49:34 +0800
In-Reply-To: <as97rD5uxYva4ayg@gourry-fedora-PF4VCD3F>
Message-Id: <4231150e-ea20-473b-bec7-cf2787c1b567@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26ad04d66+4ee2f8+vger.kernel.org+lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 8:56 PM, Gregory Price wrote:
> On Wed, Oct 14, 2026 at 05:43:43PM +0800, Li Zhe wrote:
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 1053437933ee..76532b8202dc 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -3698,6 +3698,8 @@ static void update_task_scan_period(struct task_struct *p,
>>   
>>   	unsigned long remote = p->numa_faults_locality[0];
>>   	unsigned long local = p->numa_faults_locality[1];
>> +	unsigned long locality_faults = local + remote;
>> +	unsigned long type_faults = private + shared;
>>   
>>   	/*
>>   	 * If there were no record hinting faults then either the task is
>> @@ -3706,7 +3708,7 @@ static void update_task_scan_period(struct task_struct *p,
>>   	 * migration then it implies we are migrating too quickly or the local
>>   	 * node is overloaded. In either case, scan slower
>>   	 */
>> -	if (local + shared == 0 || p->numa_faults_locality[2]) {
>> +	if (!locality_faults || !type_faults || p->numa_faults_locality[2]) {
>>   		p->numa_scan_period = min(p->numa_scan_period_max,
>>   			p->numa_scan_period << 1);
>>
> This does more than just change the div/o below, it changes the behavior
> of the function overall.  It's not clear to me this change is correct.

Yes, this intentionally changes the fallback condition.

The old local + shared check mixes two independent dimensions. The
ratios below are computed from local + remote and private + shared, so
those are the denominators that decide whether the sample is usable.

The old check can also classify a pure remote-private window as an
unusable sample: local == 0 and shared == 0, while remote and private
are non-zero. That is exactly the kind of signal that should go through
the normal scan-period decision, since commit 37ec97deb3a8 wanted to
speed scanning up only when many private faults are on remote memory.

So the fallback is meant to be used when one of the actual ratios cannot
be computed, i.e. when local + remote == 0 or private + shared == 0.
Otherwise the sample should not be discarded before the ratio logic.

Thanks,
Zhe

>
>> @@ -3723,8 +3725,8 @@ static void update_task_scan_period(struct task_struct *p,
>>   	 *	 >= NUMA_PERIOD_THRESHOLD scan period increases (scan slower)
>>   	 */
>>   	period_slot = DIV_ROUND_UP(p->numa_scan_period, NUMA_PERIOD_SLOTS);
>> -	lr_ratio = (local * NUMA_PERIOD_SLOTS) / (local + remote);
>> -	ps_ratio = (private * NUMA_PERIOD_SLOTS) / (private + shared);
>> +	lr_ratio = (local * NUMA_PERIOD_SLOTS) / locality_faults;
>> +	ps_ratio = (private * NUMA_PERIOD_SLOTS) / type_faults;
>>   
> This otherwise looks fine.
>
> ~Gregory
