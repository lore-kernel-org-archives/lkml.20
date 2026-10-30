Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352215;
	b=Rbn5OfrZgdDyJko0aV91AehcMXbByG5pev1TgqZD+3MZcpoiNhi0NirfOPw5BJ/GSmgH
	 RbLDxdXouBEkaN0M7rvVHqxyDUkhnRLL7KBm0lbea5TH/Q8zkAeFS3mOPUYlP/9O/mUQ4
	 sm2uohBb86K3PGP2fNJ08cd9io+pfQaMJNIxw4C6v5f3sMTY9UtXP49YyZ4S6nU5l67J5
	 p4buXF7n8S8N8two9iIPrDkAvtjMU0teogCmieFALdbeykSWbotHgHGdkVSYraulGLObr
	 JBwmh2N67iXCVOz6jt9hpio56vi6LDG5X4mPNbtAvz1il86O0Pq2iKIYd++UxlGsurw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352215;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=KaYjOPsAP+zlSY31b5kmtktFHEHWELAnshXsQjT6SZk=;
	b=s48f+zM2nFWiYxH6FmmYtoxkwBnSDuJq8UMIaUQvIVzMFpFhlctye1zfQbLnaj/zboHI
	 CiVROO6cHi1u1v3IoGN8MFCVKWNaJRoTSF8N7KD1KWCP4TMmaLXR9Iy+NE+ovdXS9cA2E
	 yXtg+4a71uK5mQkmBp53PbSdrBF8Iinn9a1cIVMgNuCarQwjJ9YkK6TZLt5tSnefwaugG
	 QopN5TBiFgEe9Vkn55EnVs36i77R6CWmdfd+ocSNfBVj4X28rlsLsoDJrsaF5ptCpHQuJ
	 oJux+2GIbS0nHOJ+6cWm2tV70HTB7qmkWr2/9n5ahwamF0DNJgef7YmPELc8pjmppmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=uyNdHHuW;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB0606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DB0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=uyNdHHuW
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KaYjOPsAP+zlSY31b5kmtktFHEHWELAnshXsQjT6SZk=;
	b=uyNdHHuW1nf/ASJJ3pPByNMnQEt9sJyQHIjOVGrUh8e33boJIoMhJUMmlsMT6wmvIMD3bug0Q
	+HekYZqkdVF6iIs1U+NRG+/LFU5cqTBGOlAvdatzmccrYNdbXRIIJjWd0I3w6STNwUFBWJ3DUI6
	uJtAQtatWf/o+24uIa1YGRY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jGFyT0Cn4zKm4X;
	Fri, 30 Oct 2026 17:23:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8934240572;
	Fri, 30 Oct 2026 17:23:31 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 17:23:30 +0800
Message-ID: <35cf1ff3-5e83-423f-9f6d-0f337e539206@huawei.com>
Date: Fri, 30 Oct 2026 17:23:30 +0800
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
Subject: Re: [PATCH] fs/resctrl: Do not allocate a monitor context when
 releasing limbo RMIDs
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261030092144.1233551-1-ruanjinjie@huawei.com>
 <20261030092144.1233551-2-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261030092144.1233551-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Please ignore this patch.

在 2026/10/30 17:21, Jinjie Ruan 写道:
> Busy RMIDs of a monitor domain are normally released by the limbo
> handler once their cache occupancy drops below the threshold. When a
> domain goes offline, its busy RMIDs are released without checking
> occupancy, since the domain is going away and the RMIDs must not be
> left behind.
> 
> On the monitor domain offline path, __check_limbo() allocates
> the monitor context that an occupancy check needs before it scans
> the busy RMIDs, but without using it, and returns early when that
> allocation fails. Then the caller destroys the domain's monitoring state,
> including the bitmap that records which RMIDs are busy, so nothing can
> clear those bits afterwards and the busy counts never reach zero. Those
> RMIDs never return to the free list and, where the RMID depends on
> the CLOSID, the dirty count of their CLOSID never decreases. The allocation
> can also wait for a monitor to become free, which stalls the CPU offline
> path on a context that is not going to be used.
> 
> Only MPAM systems are affected. An architecture that can always read an
> RMID allocates nothing for the monitor context, so the allocation can
> neither fail nor wait there.
> 
> So move the release of busy RMIDs into a separate function that does
> not take a monitor context and leave the occupancy check to
> __check_limbo().
> 
> This is not a revert of the fixed commit. It preserves the original fix's
> intent of not reading a counter in the offline path.
> 
> Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>  fs/resctrl/internal.h |  2 +-
>  fs/resctrl/monitor.c  | 72 ++++++++++++++++++++++++++++---------------
>  fs/resctrl/rdtgroup.c |  2 +-
>  3 files changed, 49 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index e62a277dee85..1c85e06f09bf 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -405,7 +405,7 @@ void cqm_handle_limbo(struct work_struct *work);
>  
>  bool has_busy_rmid(struct rdt_l3_mon_domain *d);
>  
> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
> +void release_limbo_rmids(struct rdt_l3_mon_domain *d);
>  
>  void resctrl_file_fflags_init(const char *config, unsigned long fflags);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 88674e28b2f8..3c9f65888004 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -124,18 +124,42 @@ static void limbo_release_entry(struct rmid_entry *entry)
>  		closid_num_dirty_rmid[entry->closid]--;
>  }
>  
> +/*
> + * Release the RMIDs that are marked as busy for this domain without
> + * checking their LLC occupancy. Cache lines may still be tagged with
> + * these RMIDs and will be accounted to the next user of each RMID.
> + */
> +void release_limbo_rmids(struct rdt_l3_mon_domain *d)
> +{
> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> +	struct rmid_entry *entry;
> +	u32 idx, cur_idx = 1;
> +
> +	for (;;) {
> +		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
> +		if (idx >= idx_limit)
> +			break;
> +
> +		entry = __rmid_entry(idx);
> +		clear_bit(idx, d->rmid_busy_llc);
> +		if (!--entry->busy)
> +			limbo_release_entry(entry);
> +		cur_idx = idx + 1;
> +	}
> +}
> +
>  /*
>   * Check the RMIDs that are marked as busy for this domain. If the
>   * reported LLC occupancy is below the threshold clear the busy bit and
>   * decrement the count. If the busy count gets to zero on an RMID, we
>   * free the RMID
>   */
> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
> +static void __check_limbo(struct rdt_l3_mon_domain *d)
>  {
>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>  	struct rmid_entry *entry;
> -	bool rmid_dirty = true;
> +	bool rmid_dirty;
>  	u32 idx, cur_idx = 1;
>  	void *arch_mon_ctx;
>  	void *arch_priv;
> @@ -161,30 +185,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>  			break;
>  
>  		entry = __rmid_entry(idx);
> -		if (!force_free) {
> -			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
> -						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
> -						   arch_priv, &val, arch_mon_ctx)) {
> -				rmid_dirty = true;
> -			} else {
> -				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
> -
> -				/*
> -				 * x86's CLOSID and RMID are independent numbers,
> -				 * so the entry's CLOSID is an empty CLOSID
> -				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
> -				 * (PMG) extends the CLOSID (PARTID) space with
> -				 * bits that aren't used to select the configuration.
> -				 * It is thus necessary to track both CLOSID and
> -				 * RMID because there may be dependencies between
> -				 * them on some architectures.
> -				 */
> -				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
> -							      d->hdr.id, val);
> -			}
> +		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
> +					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
> +					   arch_priv, &val, arch_mon_ctx)) {
> +			rmid_dirty = true;
> +		} else {
> +			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
> +
> +			/*
> +			 * x86's CLOSID and RMID are independent numbers,
> +			 * so the entry's CLOSID is an empty CLOSID
> +			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
> +			 * (PMG) extends the CLOSID (PARTID) space with
> +			 * bits that aren't used to select the configuration.
> +			 * It is thus necessary to track both CLOSID and
> +			 * RMID because there may be dependencies between
> +			 * them on some architectures.
> +			 */
> +			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
> +						      d->hdr.id, val);
>  		}
>  
> -		if (force_free || !rmid_dirty) {
> +		if (!rmid_dirty) {
>  			clear_bit(idx, d->rmid_busy_llc);
>  			if (!--entry->busy)
>  				limbo_release_entry(entry);
> @@ -843,7 +865,7 @@ void cqm_handle_limbo(struct work_struct *work)
>  	if (cpumask_empty(&d->hdr.cpu_mask))
>  		goto out_unlock;
>  
> -	__check_limbo(d, false);
> +	__check_limbo(d);
>  
>  	if (has_busy_rmid(d)) {
>  		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5dcbb0a964e8..20c800e678d5 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4592,7 +4592,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
>  		 * the RMID as busy creates RMID leaks if the
>  		 * package never comes back.
>  		 */
> -		__check_limbo(d, true);
> +		release_limbo_rmids(d);
>  	}
>  
>  	domain_destroy_l3_mon_state(d);

-- 
Best regards,
Jinjie

