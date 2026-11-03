Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709892;
	b=GH9Hqvvd8ic5bZq2IhsSFPLB/zrEye+XS4MBCvVdZKNfmRor0Mc5rYDMjQa+LxWFT/Hf
	 tU7xlFpW4VffU42nzssy8a2KbGiS/RlWN3me2+USM0bl+pp0W+lDDRUgsb/8zthtVWcbO
	 kDdSXUk1NnPBNYua8wmBT+9biJbK/GYoZw/Ef1zxkThWni4wxbYqdIWu5bQEl9syIT5Q7
	 ujGV942pVyjtuY3ihAACcW1GveMNQeNEO0KfTpSbiMFMZ3KkKM25SqlxjPxIKV7rAHuSY
	 fXHC8GD+28UGarqHBbEYr06IGLC7IOitBvN0kGwzLvS+k4RwsghHNRG/qCLu4EmtMQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709892;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uMxkatsy/czDTqYorXReGkN6RnEno+dYymzBkF085A8=;
	b=Ft183K0CWZfhrZPzKTKxm1+RkhB0twAwrRAkRvTSoSeGO8+tHCjmICNQkDazXdchw59l
	 NZaljyD5sv2AT56mZrynTZgsCJc3NxfZSziGfAZvn5HrZnOEmQmLNGhCq5/ax8hvNIKuN
	 y96XhS2vX/z/edC512DqA7IcMvTpUt7bCOUbf0lxWm9QHmHWRmIXVXiwG26r28FwfCgLe
	 n1apWah+uOTh9z+D4q9gMQRQzqPKCXYcPTBKKaLXscXARGZmHj5YEU9ZSiCTHNjBr7unE
	 U6tjjuOi9DSnB1bp/C4jnRhqc8PzJSin9w9gwcTsk6Q0FShoyxJCse49BeFnWQpU+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B15FyiFs;
	arc=none smtp.remote-ip=95.215.58.199
Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A495606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A495606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B15FyiFs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P6NJig/U2qoMxYmMT3pXpewN3IICUxnb6l0LNzfrpD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793709889; v=1; x=1794314689;
 b=B15FyiFszR9sIYIsNZtE67J+QX1fUCAdiXMvVHNhHIq9WIIvfDW6qqRAzoKwtNiyB7cycs1+
 x9jO66Sbj7Rg8Ge8YpMsxJ1hT5h+tC/cOfzcZplhzdyCDj4AFZJx1Pkri4SXh4cG67+I5LwW5TT
 uH+mD3CMB2+i9gNTJLVBooPM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50e634d3f232c597;
	Tue, 03 Nov 2026 12:44:49 +0000
X-Mizu-Trace-ID: 50e634d3f232c597
X-Migadu-Flow: FLOW_OUT
Message-ID: <55ffbca4-985f-4838-a668-9ac84e0a0c95@linux.dev>
Date: Tue, 3 Nov 2026 20:44:34 +0800
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
Subject: Re: [RFC PATCH -v4 04/22] cpuset: introduce partition_enable()
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Waiman Long
 <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Koutn? <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Ridong <chenridong@huawei.com>, Ridong Chen <chenridong@xiaomi.com>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
 <20261101114206.2434398-5-ridong.chen@linux.dev>
 <b2caa92c-9e10-4e36-bd73-b71621d60108@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <b2caa92c-9e10-4e36-bd73-b71621d60108@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/3/2026 6:26 PM, Guopeng Zhang wrote:
> 
> 在 2026/11/1 19:41, Ridong Chen 写道:
>> From: Chen Ridong<chenridong@huawei.com>
>>
>> Add partition_enable() to consolidate updates to key cpuset structures
>> during partition enablement, including:
>> 1. remote_partition
>> 2. effective_xcpus
>> 3. partition_root_state
>> 4. prs_err
>>
>> Key operations performed:
>> 1. Invokes partition_xcpus_add() to assign exclusive CPUs
>> 2. Maintains remote partition flag
>> 3. Syncs the effective_xcpus mask
>> 4. Updates partition_root_state and prs_err
>> 5. Triggers scheduler domain rebuilds
>> 6. Sends partition change notifications
>>
>> This helper also handles the transition between root and isolated
>> states of a valid partition. In that case the cpumasks are unchanged
>> and only isolated_cpus is updated.
>>
>> A partition_state_update() helper is added to set partition_root_state
>> and prs_err, and to reset the partition data when the new state is not
>> a valid partition.
>>
>> Signed-off-by: Chen Ridong<chenridong@huawei.com>
>> Signed-off-by: Ridong Chen<chenridong@xiaomi.com>
>> ---
>>   kernel/cgroup/cpuset.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index df52f6e5e99f..052a131731dd 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -1716,6 +1716,57 @@ static void compute_effective_nodemask(nodemask_t *new_mems,
>>   		nodes_copy(*new_mems, parent->effective_mems);
>>   }
>>   
>> +static void partition_state_update(struct cpuset *cs, int new_prs,
>> +				   enum prs_errcode prs_err)
>> +{
>> +	lockdep_assert_held(&callback_lock);
>> +
>> +	cs->partition_root_state = new_prs;
>> +	WRITE_ONCE(cs->prs_err, prs_err);
>> +	if (!is_partition_valid(cs))
>> +		reset_partition_data(cs);
>> +}
>> +
>> +/**
>> + * partition_enable - Transitions a cpuset to a partition root
>> + * @cs: The cpuset to enable partition for
>> + * @parent: Parent cpuset of @cs, NULL for remote parent
>> + * @new_prs: New partition state to set
>> + * @new_excpus: New effective exclusive CPUs mask for the partition
>> + *
>> + * Transitions a cpuset to a partition root, only for v2.
>> + * It also supports the transition between root and isolated partition.
>> + */
>> +static void partition_enable(struct cpuset *cs, struct cpuset *parent,
>> +			     int new_prs, struct cpumask *new_excpus)
> Should we consider the bisection case here? With CONFIG_WERROR=y this
> patch fails to build on its own — partition_enable() is defined but not
> used.
> 

Hi Guopeng,

Thanks for catching this. You are right, each patch should build on
its own, and with CONFIG_WERROR=y these helpers trigger
-Wunused-function until they are used in patches 7-9.

The helpers are introduced in separate patches on purpose: Waiman
suggested having them complete when introduced, and then converting
remote and local partitions to them in later patches, to make the
series easier to review [1]. To keep that and still build cleanly,
I'll mark them __maybe_unused when they are introduced, and drop it
in the patch that first uses each of them.

[1] https://lore.kernel.org/all/e8018984-96ed-49fa-8571-79a0d39cb218@redhat.com/

> 
>> +{
>> +	int old_prs = cs->partition_root_state;
>> +
>> +	lockdep_assert_cpuset_lock_held();
>> +	WARN_ON_ONCE(new_prs <= 0);
>> +	WARN_ON_ONCE(!cpuset_v2());
>> +
>> +	if (old_prs == new_prs)
>> +		return;
>> +
>> +	spin_lock_irq(&callback_lock);
>> +	if (old_prs > 0) {
>> +		/* Switch between root and isolated, cpumasks are unchanged */
>> +		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
>> +	} else {
>> +		/* enable partition should only add exclusive cpus */
>> +		partition_xcpus_add(new_prs, parent, new_excpus);
>> +		/* enable remote partition */
>> +		if (!parent)
>> +			cs->remote_partition = true;
>> +		cpumask_copy(cs->effective_xcpus, new_excpus);
>> +	}
>> +	partition_state_update(cs, new_prs, PERR_NONE);
>> +	spin_unlock_irq(&callback_lock);
>> +	cpuset_force_rebuild();
>> +	notify_partition_change(cs, old_prs);
>> +}
>> +
>>   /*
>>    * remote_partition_enable - Enable current cpuset as a remote partition root
>>    * @cs: the cpuset to update
> 

-- 
Best regards
Ridong

