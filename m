Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824354;
	b=skZpTCrB2esbHtYeC5qETI0lh/KwySuKvwZ8q1MG+rwlV7Y0TJ78BW//mEeazHOWbkmZ
	 BYb6FVERO6jQZrJ5fI0ueR6nxOXusT1q2U49952HPvFjZIZdjWQpueK2McsM/EToUtIbZ
	 vx10gJ+swSXqCBGs+A/mqrRr6DhSJw+6f6m4CV1NJai+Ye9eSTAzckq2NCTE7UcUZ+sds
	 IPsOMfjSCPESeSzHBj8V/SNDjY5mWFI4cQNac+yyHIDgZJbdE415RB9+w9v3R7oI/F6lq
	 xnqLn536EGkBT6SC16Z3HwhnlFxPSjdrnRkwr+O2LZ4FyLK4p4zc5moGk5AkRnLWbeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824354;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=I3dgu4sJ5j0i8iuAWSr5Xv5VZDVuEVHCMp+jfORUzD8=;
	b=u1aT1y5B65a9IbvH9OFfVEVsbN6M5wUJzV1FbZmu4CZzMoBsffGMtiUzJU3DEPqsdf5e
	 1t5WK0ZisrK913CztkZ5jCjvbqkCstzIajb/CwNKQzdmp1C2pwBbZhQWSn8z3SEjoB4rE
	 1VikxSuMz67tc2rRnVI8JrbLiksmKF7vAc3jYwBsB2fjg5IHoo9+vceYLhUfC44u4GI6R
	 YweXosy91iOT/EtdshATKK4S1/4PSlERewag38FW+De860vyJsa4v2MH4CVRsLS+GhOxj
	 K5In4jFdTtANFnLXRPUBlCiuoBCqjwasKYseB3CeyvNgMmIzzcLxA6hHB5q9rkyMFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vZbu2+xG;
	arc=none smtp.remote-ip=95.215.58.52
Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545BC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vZbu2+xG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dAkZ1pi6os0A3n/isJiL0EDETLn5Jfcuu+R3wOlJ064=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794824351; v=1; x=1795429151;
 b=vZbu2+xGJQRrpkoKjjnmzVkQK4sDovQi/wVw4K4dovxLrMNbDR375q8QoZXrssepKEK0FBM6
 agIH4qQQW7Q/rsD1FumG0Df5hMeqqj8EShjUccU6uR5l+qW+aCHo00bCMaPTr0VV9VH+LfTDOnV
 BeF+ANITgbEigidtrhG+X3hs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc8e9ceddc689f5f;
	Mon, 16 Nov 2026 10:19:10 +0000
X-Mizu-Trace-ID: fc8e9ceddc689f5f
X-Migadu-Flow: FLOW_OUT
Message-ID: <be80dba8-aeab-4e2a-92ac-bd5bb560a887@linux.dev>
Date: Mon, 16 Nov 2026 18:19:05 +0800
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
Subject: Re: [PATCH-next v4 1/6] cgroup/cpuset: Fix incorrect partition
 invalidation logic in cpuset_hotplug_update_tasks()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-2-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261116012330.2271010-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/16 09:23, Waiman Long 写道:
> When most of the active CPUs of a system are allocated to
> sub-partitions below the top_cpuset partition, it is possible that a
> CPU offline operation may remove the last active CPU in the top_cpuset
> partition. When that really happens, cpuset_handle_hotplug() will clear
> the subpartitions_cpus to make sure active CPUs are present in the top
> partition and let the other sub-partitions get invalidated and then
> competes for their exclusive CPUs again.
> 
> In cpuset_hotplug_update_tasks(), the current code use
> "cpumask_empty(subpartitions_cpus)" to determine if that partition
> should be invalidated. That is fine if there is only one sub-partition.
> As reported by sashiko that when there are more than one sub-partitions
> and the first sub-partition will get invalidated and then it will
> try to acquire the exclusive CPUs and become valid again. When this
> happens, the subpartitions_cpus will no longer be empty. The remaining
> sub-partitions will assume their exclusive CPUs are safe and proceed
> as normal. As a result, active CPUs owned by those sub-partitions
> remain in both top_cpuset.effective_cpus and the sub-partitions'
> effective_cpus while missing from subpartitions_cpus, breaking partition
> CPU exclusivity and triggering WARN_ON_ONCE() in generate_sched_domains()
> and remote_partition_disable().
> 
> Fix that by checking if the sub-partitions' effective_xcpus are subset
> of subpartitions_cpus to determine if they should be invalidated. Also
> remove the obsolete WARN_ON_ONCE() call in remote_partition_disable().
> 
> Fixes: 0c7f293efc87 ("cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/bug/linux-bf69cd3c-833a-4599-a1f9-8dd9e044cd7c
> Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 1b88a93b3db4..631fb449cef8 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1768,15 +1768,6 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
>  static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
>  {
>  	WARN_ON_ONCE(!is_remote_partition(cs));
> -	/*
> -	 * When a CPU is offlined, top_cpuset may end up with no available CPUs,
> -	 * which should clear subpartitions_cpus. We should not emit a warning for this
> -	 * scenario: the hierarchy is updated from top to bottom, so subpartitions_cpus
> -	 * may already be cleared when disabling the partition.
> -	 */
> -	WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, subpartitions_cpus) &&
> -		     !cpumask_empty(subpartitions_cpus));
> -
>  	spin_lock_irq(&callback_lock);
>  	cs->remote_partition = false;
>  	partition_xcpus_del(cs->partition_root_state, NULL, cs->effective_xcpus);
> @@ -3983,9 +3974,9 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  	if (!tmp || !cs->partition_root_state)
>  		goto update_tasks;
>  
> -	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
> -				       (cpumask_empty(&new_cpus) &&
> -					partition_is_populated(cs, NULL)))) {
> +	if (is_remote_partition(cs) &&
> +	    (!cpumask_subset(cs->effective_xcpus, subpartitions_cpus) ||
> +	     (cpumask_empty(&new_cpus) && partition_is_populated(cs, NULL)))) {
>  		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
>  		remote_partition_disable(cs, tmp);
>  		compute_effective_cpumask(&new_cpus, cs, parent);
> @@ -3997,12 +3988,12 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  	 * 1) empty effective cpus but not valid empty partition.
>  	 * 2) parent is invalid or doesn't grant any cpus to child
>  	 *    partitions.
> -	 * 3) subpartitions_cpus is empty.
> +	 * 3) effective_xcpus isn't a subset of subpartitions_cpus.
>  	 */
>  	if (is_local_partition(cs) &&
>  	    (!is_partition_valid(parent) ||
>  	     tasks_nocpu_error(parent, cs, &new_cpus) ||
> -	     cpumask_empty(subpartitions_cpus)))
> +	     !cpumask_subset(cs->effective_xcpus, subpartitions_cpus)))
>  		partcmd = partcmd_invalidate;
>  	/*
>  	 * On the other hand, an invalid partition root may be transitioned

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
