Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701526;
	b=5EV8cqsU90EynvzKYZSz5Hj0YdGJrasTnjC5hKbR5JFDsReg0j2cxIcvLz05K6TsRBnI
	 krzbubPC4rdQyeUMEkPh8ToFKp1EqAfmsXvf29IxwJiLvX9v5tBmYORhxKiSrowoYO1F0
	 qQzbxEe7z5A+0OWU6rErMwYLKqpGZaJCm6nDpU33qC/O4s97K4zDwBZ+EoNhYi/BFZnac
	 zJXc3Vm59HowUGDLU9BADMC9V+FAgJRsCZBxnxnhK5FA5WnPvhUEj8Aqh4nDd46OO8b4j
	 2nx21rR+oQ8Hqg/lcUp75Fk8lO1Uut9RfWCDtOl0z/DY3aFvpM9gHkaz8KYxzWuW/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701526;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+J0rJ4vWuXzYWLgoaYEslPExHaXtpToRbQqZMZ4m7gc=;
	b=joPmmMVAwxrIVX1jZmmiolupt46XlbuOthsE8Pkrd4yyMf81g2AMkEEzZPQxL7yRIQK1
	 avWD2iF0kDpnvOFvvLo7RQRh9MVNG0gIMb1R9pf6GQ143FbzVQMKXYXF0v820xc20XMAo
	 r71sNLwE8JERsB9TPIRSi9DmDSaEmujkN3y30Hq1/svQHl9jgEZ7jfTCJU0O6W1PKkv4p
	 zAl26a2D7AR/WHreJrToNmoJQ7mksrK9FnJBTXNax/tu6Z0NW+3rWGyTCp0BE+w7QT9nO
	 dM0/yKrG/U2JzN3uhCcgkdfT+Tu6QOZAv3A8rt4QtuNkdTLN+/IvUN/jRL0AcVIelzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luIMJgvt;
	arc=none smtp.remote-ip=95.215.58.118
Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986D606A82E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E986D606A82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luIMJgvt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gaHv0TLl0rmOaOhD7yTvVPALO1ybZo6FJXe/7G4QswA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793701524; v=1; x=1794306324;
 b=luIMJgvtGwFHDUGkSz6ynQWcQc4VtW2U8iEQeIlj1Qkf/px9/oipHJb14cK1gCUbrKgYtytv
 xhw226d579b9r5L4fwKWlnTY56DPmZQMND/Qp0LllX7Ip4fwjKSzmvzxMFr3mkakZ6zwiySYYB9
 tGK5GeehmvyZ8A2jQcN7QKdM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0487e6aa01e77fbc;
	Tue, 03 Nov 2026 10:25:22 +0000
X-Mizu-Trace-ID: 0487e6aa01e77fbc
X-Migadu-Flow: FLOW_OUT
Message-ID: <950ad328-d16d-4cfc-b130-6a43530507ae@linux.dev>
Date: Tue, 3 Nov 2026 18:25:15 +0800
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
Subject: Re: [RFC PATCH -v4 03/22] cpuset: generalize the validate_partition()
 interface
To: Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Koutn? <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Ridong <chenridong@huawei.com>, Ridong Chen <chenridong@xiaomi.com>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
 <20261101114206.2434398-4-ridong.chen@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261101114206.2434398-4-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/1 19:41, Ridong Chen 写道:
> From: Chen Ridong <chenridong@huawei.com>
> 
> Refactor validate_partition() to take the parent partition, the new
> partition root state, the new effective exclusive CPUs and the CPUs to
> be deleted, instead of a trial cpuset. A NULL parent stands for a
> remote partition, whose CPUs come from top_cpuset. This makes the
> interface flexible enough to handle both local and remote partition
> validation.
> 
> The housekeeping conflict check is folded into validate_partition(). It
> is skipped when the parent is not a valid partition root, as @cs can't
> be a valid local partition in that case.
> 
> Use the new interface for local partition enablement in
> update_parent_effective_cpumask() and in partition_cpus_change(),
> replacing the open-coded checks there. The order of the checks is now
> the same for both paths: empty CPUs, housekeeping conflict, then no CPU
> left for tasks.
> 
> Signed-off-by: Chen Ridong <chenridong@huawei.com>

nit: is this old tag still needed?

Thanks,
Guopeng

> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  kernel/cgroup/cpuset.c | 112 +++++++++++++++++++----------------------
>  1 file changed, 52 insertions(+), 60 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index df9fc126e391..df52f6e5e99f 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1438,6 +1438,41 @@ static bool prstate_housekeeping_conflict(int new_prs, int parent_prs,
>  	return res;
>  }
>  
> +/**
> + * validate_partition - Validate a cpuset partition configuration
> + * @cs: The cpuset to validate
> + * @parent: Parent partition of @cs, NULL for remote partition
> + * @new_prs: The proposed new partition root state
> + * @new_excpus: The new effective exclusive CPUs mask to validate
> + * @del: exclusive CPUs to be deleted from @cs, can be NULL
> + *
> + * The housekeeping check is skipped if @parent is not a valid partition
> + * root as @cs can't be a valid local partition in that case.
> + *
> + * Return: PRS error code (0 if valid, non-zero error code if invalid)
> + */
> +static enum prs_errcode validate_partition(struct cpuset *cs,
> +		struct cpuset *parent, int new_prs,
> +		struct cpumask *new_excpus, struct cpumask *del)
> +{
> +	int parent_prs = parent ? parent->partition_root_state : PRS_ROOT;
> +
> +	if (new_prs == PRS_MEMBER)
> +		return PERR_NONE;
> +
> +	if (cpumask_empty(new_excpus))
> +		return PERR_INVCPUS;
> +
> +	if ((parent_prs > 0) &&
> +	    prstate_housekeeping_conflict(new_prs, parent_prs, new_excpus, del))
> +		return PERR_HKEEPING;
> +
> +	if (tasks_nocpu_error(parent_cs(cs), cs, new_excpus))
> +		return PERR_NOCPUS;
> +
> +	return PERR_NONE;
> +}
> +
>  /*
>   * cpuset_update_sd_hk_unlock - Rebuild sched domains, update HK & unlock
>   *
> @@ -1955,18 +1990,10 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>  	if ((cmd == partcmd_enable) || (cmd == partcmd_enablei)) {
>  		new_prs = (cmd == partcmd_enable) ? PRS_ROOT : PRS_ISOLATED;
>  
> -		/*
> -		 * Enabling partition root is not allowed if its
> -		 * effective_xcpus is empty.
> -		 */
> -		if (cpumask_empty(tmp->delmask))
> -			return PERR_INVCPUS;
> -
> -		if (prstate_housekeeping_conflict(new_prs, parent_prs, tmp->delmask, NULL))
> -			return PERR_HKEEPING;
> -
> -		if (nocpu)
> -			return PERR_NOCPUS;
> +		part_error = validate_partition(cs, parent, new_prs,
> +						tmp->delmask, NULL);
> +		if (part_error)
> +			return part_error;
>  
>  		/*
>  		 * This function will only be called when all the preliminary
> @@ -2432,32 +2459,6 @@ static int parse_cpuset_cpulist(const char *buf, struct cpumask *out_mask)
>  	return 0;
>  }
>  
> -/**
> - * validate_partition - Validate a cpuset partition configuration
> - * @cs: The cpuset to validate
> - * @trialcs: The trial cpuset containing proposed configuration changes
> - *
> - * If any validation check fails, the appropriate error code is set in the
> - * cpuset's prs_err field.
> - *
> - * Return: PRS error code (0 if valid, non-zero error code if invalid)
> - */
> -static enum prs_errcode validate_partition(struct cpuset *cs, struct cpuset *trialcs)
> -{
> -	struct cpuset *parent = parent_cs(cs);
> -
> -	if (cs_is_member(trialcs))
> -		return PERR_NONE;
> -
> -	if (cpumask_empty(trialcs->effective_xcpus))
> -		return PERR_INVCPUS;
> -
> -	if (tasks_nocpu_error(parent, cs, trialcs->effective_xcpus))
> -		return PERR_NOCPUS;
> -
> -	return PERR_NONE;
> -}
> -
>  /**
>   * partition_cpus_change - Handle partition state changes due to CPU mask updates
>   * @cs: The target cpuset being modified
> @@ -2471,33 +2472,24 @@ static void partition_cpus_change(struct cpuset *cs, struct cpuset *trialcs,
>  				  struct tmpmasks *tmp)
>  {
>  	enum prs_errcode prs_err;
> -	int parent_prs = is_remote_partition(cs)
> -		       ? PRS_ROOT : parent_cs(cs)->partition_root_state;
> +	struct cpuset *parent = is_remote_partition(cs) ? NULL : parent_cs(cs);
>  
>  	if (cs_is_member(cs))
>  		return;
>  
> -	prs_err = validate_partition(cs, trialcs);
> -	if (!prs_err && (parent_prs > 0) &&
> -	    !cpumask_empty(trialcs->effective_xcpus)) {
> -		int prs = cs->partition_root_state;
> -
> -		/*
> -		 * Check for housekeeping conflict by passing the whole
> -		 * effective_xcpus as well as those CPUs that are to be
> -		 * removed from cs as delmask.
> -		 */
> -		if (prs > 0)
> -			cpumask_andnot(tmp->delmask, cs->effective_xcpus,
> -				       trialcs->effective_xcpus);
> -		else
> -			cpumask_clear(tmp->delmask);
> -
> -		if (prstate_housekeeping_conflict(prs, parent_prs,
> -						  trialcs->effective_xcpus, tmp->delmask))
> -			prs_err = PERR_HKEEPING;
> -	}
> +	/*
> +	 * Check for housekeeping conflict by passing the whole
> +	 * effective_xcpus as well as those CPUs that are to be
> +	 * removed from cs as delmask.
> +	 */
> +	if (is_partition_valid(cs))
> +		cpumask_andnot(tmp->delmask, cs->effective_xcpus,
> +			       trialcs->effective_xcpus);
> +	else
> +		cpumask_clear(tmp->delmask);
>  
> +	prs_err = validate_partition(cs, parent, trialcs->partition_root_state,
> +				     trialcs->effective_xcpus, tmp->delmask);
>  	if (prs_err) {
>  		WRITE_ONCE(cs->prs_err, prs_err);
>  		trialcs->prs_err = prs_err;

