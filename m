Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023507;
	b=pbyIthvfpXgNQySccGUjV9cFMuJSX3AQWIOKJy3+XZ5A0EflCMaw1LEGkJCPjFOuX2az
	 HdZOg1fGOy1tHdL4NZsepo1Gcm+jzhBOMduIAEX/MTsye2i/609Zp618WfCN7O7zOpPUK
	 L+FFAO4C1hp/sShIRWkDMjAvpDhonW3/55OWBvG2/rj+wOTxi8cMTB+mGwbXmwCBq1zqT
	 APLnDGWzgFu4EcwxmcaBIAsKxSMRsYvuLK0hDoekx7bQvp5nf7KMOzqAylwNX0n7v8UAs
	 flTDWMYD0U3kK5AppG4eLVhBTWO/goBlHiHkEq8g7ha69wP7z3aI6oYKn2viZWfXNMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023507;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BkQwxegoRMOd1GCfVoTOGhoSJ4VyKQPCHguHKah43lE=;
	b=MXncfZfVwv5KGx5G0+PYLUJBPkljOpLQxzYE/ZzwgE3VYRQ/hx4745ftiF1XCsdNrutC
	 fVIX31QE+qctO7UueXReC+5FXjW9iYL/0abmuZU2IpTTnVDv/q0dAkilylvvm+5UwQT0n
	 nBL0zmsbFOsFqSsYu6MigSZyOtzTYKWAD8SywjBVm0vDxf12qfdxpy+sqPUEgpihwz1xX
	 p6fMwr2QsoizKP9InYuhwdTXPxKqO/FJj/U7RHAs9ORLwlhCjV1pK0h96s4f5ILGCGPAQ
	 Nqny2+CXihZbIzOvMiuqWNb3jbRC1kBlre+OvQOv/69IabZ/u9wqIjJitlWqW5NgAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g71p6+n8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D39606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g71p6+n8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 893E72720;
	Mon, 26 Oct 2026 07:05:01 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1430E3F7B4;
	Mon, 26 Oct 2026 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793023504; bh=3IUUrH2FTySlI66DGVS+Ss41CPixbJOMNYfUDgjzOZE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=g71p6+n8NZgxgf9gdpWmR3NFO97/R3e79wBtNQLVJMFtz7koqPYeNZQY6S4W237x9
	 3CClKooX8gR8DOJJfAutaRJlHw1cJjl6I9M7xdcMiEuhzB+83lFaYnQ36DJVUu7dhA
	 7OXQUlfJJWGm43MbCetdvdibrmy6a3Ag+/wBoDjc=
Message-ID: <e47868eb-e5df-4c6f-a968-e80e5199b611@arm.com>
Date: Mon, 26 Oct 2026 14:05:00 +0000
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
Subject: Re: [PATCH v10 RESEND 01/15] fs/resctrl: Return -EBUSY when
 per-CLOSID RMIDs are in limbo
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020134239.3921377-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 20/10/2026 14:42, Jinjie Ruan wrote:
> resctrl_find_free_rmid() returns ERR_PTR(-ENOSPC) when no matching RMID
> is found in the free list. On systems where RMIDs depend on CLOSIDs
> (CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID), the target CLOSID may have RMIDs
> temporarily in limbo rather than permanently exhausted.
> 
> When userspace attempts to create a new monitoring group, a permanent
> -ENOSPC failure prevents retry even though the CLOSID's RMIDs may become
> available once the limbo handler completes.
> 
> Check closid_num_dirty_rmid[] before returning -ENOSPC. If the target
> CLOSID has dirty RMIDs, return -EBUSY to signal a retryable condition.
> 
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  fs/resctrl/monitor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..da883adc3adc 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -225,6 +225,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  			return itr;
>  	}
>  
> +	/*
> +	 * If this CLOSID has RMIDs in limbo, return -EBUSY so userspace can
> +	 * retry. Otherwise, the CLOSID is genuinely out of RMIDs.
> +	 */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
> +	    closid_num_dirty_rmid[closid])
> +		return ERR_PTR(-EBUSY);
> +
>  	return ERR_PTR(-ENOSPC);
>  }
>  

This seems like a sensible change to me. I ran into this myself the other day. For both cases the
last_cmd_status is "Out of RMIDs".

On a related, I have a patch, which I need to dig out and post, to add a flag so that the user can
know from the resctrl interface alone the maximum number of monitor groups can be created in a given
control group. It just displays the value of CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID in
info/mon_id_includes_control_id.

For this patch of yours, and the next one, it would be good to post them with a series title with
the prefix 'fs/resctrl:' so that they are easily seen to be generic resctrl changes and discoverable
by the resctrl maintainers.

Thanks,

Ben

