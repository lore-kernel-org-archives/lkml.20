Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027343;
	b=f/irBQ+ktj3uO4hBxTdkNEbeywvXr5C7ftdXspdKXtTgTPUD0c0QX0+WoonYqf+fzicB
	 D1VJyOMlNvWCuVZO+sOzYgtffXL9d+ix+LbQwglF13PS2iV6mD9qcK7YZ3fUBSguVkbO/
	 VcwfepXsggwYkeVNQ1ZAqqliTWf0/Y4v0zcQjbBeYAQIcXRvMJWWYqW4IzS3FXfYyNKc9
	 J4VToJh9dPsKCLkR4TELiK//R+TjfErtoDFLd+29+SyhQlJuBowBxSu52dYImspjW7Gfg
	 WhQNbzTH6NYE2MvGpH7m5NEb3l0DZO/Wf5njl2McNFxVSaO363rvrMM/E+hAinutHOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027343;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lhobV5d97Tc8zp7DCHMSRz1AieY67twsTZgEbtGxvrI=;
	b=hWjZEqwyNF7JxbEhBofI/l1S6VvarnGzHYUPn00t5oBBhuudG1gnwlXQGau4n1479GrJ
	 5dW2ClrfgTADdcaD1xDHXzC1Ma9L6kFsQpXUTV0OzvcM5dRnkXQvlz8SG8p8nr0Ap/o/L
	 +sGzfgN0RTuGtvTAGhjWtzjqiI81l7ciB6Jjlour3ykgAbdrlx4Nrh17Sj2BQJv68mlj3
	 p45GOdZI4A2jm8VyQ1uRX2BxvaLdyiZOqAwbRLvcGnKuPyQEqITMEbmCYlxnUykFyGIMG
	 wMQh8lVgvYoYs3nGkq03mZ1rxC4qeu6SiBiQwzVLvk5ZqrKrC6JGC/9Bn8JPK5v03xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tdHDppj1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363B7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tdHDppj1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 287AF165C;
	Mon, 26 Oct 2026 08:08:59 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A570C3F59E;
	Mon, 26 Oct 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793027342; bh=sRREsyRSBM31+whIkxjyBnXLG8dsEQuKng2plat32pI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tdHDppj1ESmrf1xgetU+DgnG+ySskExZAgLxY9z95byQ0pa7EzdZNBFbym3etDDia
	 EYLmpfIOuq9UIj4QUEhPwVY9HwJrBOCW99Q5+hcxRNzc6MF+U3qdh77g9/uKiCax/I
	 ipguXuzaWgqkTseVf8SQy3fh/UnxIfvBnn4/7fyg=
Message-ID: <8f6fdcad-912d-49f6-babe-e428290f0cce@arm.com>
Date: Mon, 26 Oct 2026 15:08:58 +0000
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
Subject: Re: [PATCH v10 RESEND 06/15] fs/resctrl: Unmount resctrl with the CDP
 state it was mounted with
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-7-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020134239.3921377-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 20/10/2026 14:42, Jinjie Ruan wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> resctrl disables CDP before the control and monitor groups are torn down
> on unmount. The architecture translates between CLOSID and PARTID using
> the CDP state, so the RMIDs freed by rmdir_all_sub() and
> resctrl_fs_teardown() are parsed with the wrong mapping. On arm64 the
> RMID limbo handler can still be running, and a CLOSID left in the limbo
> list is re-interpreted with the CDP state of the next mount. Enabling
> CDP doubles the CLOSID on arm64, which can push the stale value out of
> range and take an MPAM error interrupt.
> 
> Disable CDP after the groups have been torn down, so every CLOSID freed
> on unmount is parsed with the CDP state it was allocated under. Return
> the RMIDs still in limbo to the free list and stop the worker, so
> nothing carries over to the next mount.
> 
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  fs/resctrl/rdtgroup.c | 46 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5dcbb0a964e8..40821cf07649 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3145,6 +3145,41 @@ static void resctrl_fs_teardown(void)
>  	rdtgroup_destroy_root();
>  }
>  
> +/*
> + * The RMID limbo handler keeps running after unmount. Any CLOSID still in
> + * limbo would be re-interpreted with the CDP state of the next mount. MPAM
> + * doubles CLOSID when CDP is enabled, which can push the stale value out of
> + * range. Force the limbo list back to the free list before the CLOSID state
> + * is torn down.

If the limbo list is being emptied then the limbo handler is effectively not being run. This is a
reduction of functionality of resctrl. We either need a way to keep it running or rebuild the list
at mount. There was some discussion at
https://lore.kernel.org/all/20260413085405.1166412-2-zengheng4@huawei.com/

This is a fs/resctrl patch that doesn't directly relate with the subject of the series and so
unlikely to get much attention from the resctrl maintainers. If you respin I'd suggest posting this
separately. I note that Tony Luck has a patch in the same area, [1].

[1] https://lore.kernel.org/lkml/20260928221509.68002-14-tony.luck@intel.com/

Thanks,

Ben

> + */
> +static void rdt_flush_limbo(void)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct rdt_l3_mon_domain *d;
> +
> +	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
> +		return;
> +
> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
> +		return;
> +
> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +		if (!has_busy_rmid(d))
> +			continue;
> +
> +		/*
> +		 * The limbo handler acquires rdtgroup_mutex. Release it
> +		 * here to allow the handler to complete, then reacquire
> +		 * to maintain lock ordering for __check_limbo().
> +		 * This matches the pattern used in resctrl_offline_cpu().
> +		 */
> +		mutex_unlock(&rdtgroup_mutex);
> +		cancel_delayed_work_sync(&d->cqm_limbo);
> +		mutex_lock(&rdtgroup_mutex);
> +		__check_limbo(d, true);
> +	}
> +}
> +
>  static void resctrl_unmount(void)
>  {
>  	struct rdt_resource *r;
> @@ -3152,13 +3187,20 @@ static void resctrl_unmount(void)
>  	cpus_read_lock();
>  	mutex_lock(&rdtgroup_mutex);
>  
> -	rdt_disable_ctx();
> -
>  	/* Put everything back to default values. */
>  	for_each_alloc_capable_rdt_resource(r)
>  		resctrl_arch_reset_all_ctrls(r);
>  
>  	resctrl_fs_teardown();
> +	rdt_flush_limbo();
> +
> +	/*
> +	 * Clear the CDP state last. free_rmid() translates between CLOSID and
> +	 * PARTID using the CDP state; clearing it first would make the
> +	 * translation inconsistent for the RMIDs being torn down.
> +	 */
> +	rdt_disable_ctx();
> +
>  	if (resctrl_arch_alloc_capable())
>  		resctrl_arch_disable_alloc();
>  	if (resctrl_arch_mon_capable())

