Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877984;
	b=NMaF9pqOZrRXXo5Ti/xiBKyzgG/cBJsHzDMinhg6aKQVnbQcmJn9WLtbU4CuQ9N8MmMc
	 vpu9wQ4kFX2vQpx6O/JgCU0fIZRuCEqdtfahLQ3Jxe9LXTj/UmHzFmt2cXRXfDknsxBib
	 UMfp848O7HH8OTBVQZeeW7gqhjCFcx+HcAzRJjmtZ62K8AzUq/xL6hSMG5wQe0DvFj50X
	 eu/z7LvjVR5gWt9IUxAc/UG75nb+4re7TX+nA+479erQ+K8BwIwXN33TJ2bzhBu/DqEs5
	 8aXtlLzR4dKK7lzHKXA7qUhmBJE5gHdtPHPCudT5pEniZV6bxMfPM+A0EWCtrAbtCuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877984;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7PH/1R2E//KGI4z2Br/DeDo0D1Ypy1FTj3nhUxyqjSE=;
	b=OdTxonHoWGrZonyU8z/3iuT5Knk90fDBrTZ+9cc7TAOBsO/bT/exIWTH+wPDdk02GktT
	 ebpsWxOsbpaqOchk4dNA3tFiMlPAqsfTw/W6xaBa3vWLAt/D63QM40p4NdYthadCoruRQ
	 6rczX4lWObLttNbiNnaXmw2m7y60/obbLFiAWEHhl0OrZ6a+VLC69m9/tVz778LhOE84/
	 sZTAMSIVIAfYiSpJss5vdTgfkRmj42hZYkUoXUJHXkB+pGbvzg0A4yZJgd8Rb7uUXiwFQ
	 Px3lg/z4jvLPSWpdDM0i3G5/qUsnCG4o4WbQ3GQn1YPH8/2iYXv1hleSvtUDpIZSAHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fs1ynA5O;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB924606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB924606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fs1ynA5O
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 006121595;
	Thu,  5 Nov 2026 03:26:20 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 621BD3F628;
	Thu,  5 Nov 2026 03:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793877983; bh=10W/InQm/aAm2y+k02PdzfKJPwAxej5pbhisj8esRGE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Fs1ynA5OLQdhBVaT7A7C5NE6YLSjsWxjyOKLBENHpAZzTXgO8clqPLqAtShAMum4N
	 Oe0w3ewq7/VQkVGQbIX0QWVUiZ+H/Bmybasf1KW0iJf8avfClxixhl0DXLxQqyNp/e
	 svT6yCg1FJcfxk493Ha+ZLOqNalGh+yZBvPE5Z2A=
Message-ID: <d34a5211-1a8e-43de-9afc-6abab72caa2e@arm.com>
Date: Thu, 5 Nov 2026 11:26:20 +0000
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
Subject: Re: [PATCH v4 1/3] fs/resctrl: Report a temporary RMID shortage per
 CLOSID
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, bp@alien8.de, tan.shaopeng@fujitsu.com,
 zengheng4@huawei.com, gshan@redhat.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
 <20261105070934.2258613-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261105070934.2258613-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 05/11/2026 07:09, Jinjie Ruan wrote:
> An RMID that is freed is held in limbo until its cache occupancy drops
> below the threshold, after which it returns to the free list. A request
> that fails because of limbo is thus temporary and worth retrying, which
> resctrl reports to userspace as -EBUSY. A request that fails because
> every RMID is in use is permanent and reported as -ENOSPC.
> 
> Where an RMID is only meaningful together with a CLOSID, a request can
> only be satisfied by an RMID belonging to the requested CLOSID, so the
> distinction has to be drawn per CLOSID. Instead it is drawn system wide.
> -ENOSPC is reported when the free list holds no RMID for the requested
> CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
> when the free list is empty and another CLOSID has an RMID in limbo,
> even when the requested CLOSID has none. Userspace is thus told to give
> up on a shortage that may clear on its own, and to retry one that cannot
> clear until it removes a group itself.
> 
> Architectures where the RMID is independent of the CLOSID always match
> the first entry on the free list, so neither case arises there and only
> MPAM systems are affected.
> 
> Draw the distinction from the number of RMIDs the requested CLOSID has
> in limbo where the RMID depends on the CLOSID, and from the system wide
> count otherwise. Drop the separate test for an empty free list, which
> the search handles on its own.
> 
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Thanks for fixing this MPAM oversight.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> ---
>  fs/resctrl/monitor.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 04e4ea612b7c..b8f4e1ff4083 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  	struct rmid_entry *itr;
>  	u32 itr_idx, cmp_idx;
>  
> -	if (list_empty(&rmid_free_lru))
> -		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
> -
>  	list_for_each_entry(itr, &rmid_free_lru, list) {
>  		/*
>  		 * Get the index of this free RMID, and the index it would need
> @@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  			return itr;
>  	}
>  
> -	return ERR_PTR(-ENOSPC);
> +	/*
> +	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
> +	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
> +	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
> +	 * delays the allocation.
> +	 */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
> +		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
> +						       ERR_PTR(-ENOSPC);
> +
> +	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
>  }
>  
>  /**

