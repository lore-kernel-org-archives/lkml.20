Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85F440633
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321254; cv=none; b=UT7KNsLegqyDnrADuylrhRb0IGRjl1Uws9DLRV4c1kfMapIKCAfaPnbnXSYZ0vEDxrh3KvaiNcmgI6Q3axcV5kF7h1O4UIZpGg5dguwtCsCchiJNdxtICjgADmvxWR7lwu/7VDW3GQaVYdWZrONnbfam5N4O69ZmTV4bfabzWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321254; c=relaxed/simple;
	bh=MczutNopvym+aLd4VAnmq1I5ltfQNC54OxZUv3eO/Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bToyIuFWP30GrFS+hd5w3RMm74PLRgRh1D2BuBBnCKthPZ4AzLkQNmC5l3bMCuJ/85RiOTZJWFv/CP2P962lBMRSHjJ2tM7yybKbCVnQVm+JHvXJ/0JYbBMn2IY6uXWZ4o64rgryZXI/93DyQ+wuPfK7Ekxxu5/BuzOksFq2f0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOf4S515; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOf4S515"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso7433215e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790321250; x=1790926050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qVH4xy3bEZql7DbItAa1RNXdUwDHnSm6EwoBaYYWu8=;
        b=DOf4S515/yhwS/QujdmHf3yOEhSrsImHQepITDLRqCd1k0Cxy0BsbKbfMdfiQ03TdT
         FlRAVsRxRpdcMOkZIjF/AmmVvJLRtrTk/6jKYB/00w/5vZmecm/+iQXAbEe0+JBSrBpa
         QrV3kYSsCGEefJP32cqLOTg45A0+POnUB+wzI9J2FfbVImv1gXPbJXfTUuOJii4uEHvl
         dTs+7i3/ErMl6kesbAuEZ/CPG9+aQ1S5LISNaQTyJPGsG7oDM/g1B7Jt6iZg/VZpD10W
         4beyvaVirkW2yMzKPZU+jf+oqes9yHfAW9EVnHYfXhQ2CCvMSsDmTEMwKbLxX//sbY4a
         tSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321250; x=1790926050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qVH4xy3bEZql7DbItAa1RNXdUwDHnSm6EwoBaYYWu8=;
        b=PhZEDz+FEsyGwGhNt9aPTUlEino7uidKOgyymy8x2JDizhLlsjm4USsRAp83MoZggs
         adF6l0y+f+c3ZvJWCbzeiTZ8u+ZqxNrioCCmYwz+ux4o2gtOZp/3xVaXWlt0c0CJji0v
         P39DI1MTt+2JX1g8crlE1PisE8vueHo9FYfOgLQ9UdTJy5m07wwCVzNOMmZAr84Hoowp
         jexiaE03RoHyqfOTyPIfPsQO6MU+7N6+RH8LdS1LtVKlXf6toRjkZi9JaFx6DVQXucjh
         W2TOBJvsSzbIwSXqpApzFX1Cq4AWUTHwGmKscBo6EoQuKtqho+QOS2Fhnw3OqpAbl/1x
         jmQg==
X-Forwarded-Encrypted: i=1; AKwUvByPYrYMGbRv4xQIbSodDokqvlfph7ToNwtI00zRR7T/GNVb/MahlUS0vvB+fCyTKpUS9TvcmDPQpbz+Pq0=@vger.kernel.org
X-Gm-Message-State: AFuF++mw4K9wvoZMFbkbhg8KoutrIUnzAQdCYCAbkXmH03H17eqIUeoD
	uzO6bqJhcam5/mfJNGCLfGtAbYuuJ2jdxyd04Q524MAKMmoBsiheNjYq
X-Gm-Gg: AYBFou3+OD8bbctoS95xz5j9bM1YrF2BkE18h90lxgLWbKi2EmuV/3DcOoL95XzvvEx
	Nk974tzKhI36CSy9t+sDhhz+I4o9iqX0pUNRwYMP3A/uoHEWIn68lPf4AHyu6lMOivK80QVnT0m
	SgPv0ru9v+lOsm7Z1FqwtgSdEX54i6RVxdkRc9PA47oE6vlSrgwiuevDso/IeJ9u1lzdjKw2D3U
	9Sxm6fR9CV+Sbgj7nOd1pYX4+Vex6hoHd3RocX5XYxnQbE5PGuH0aXJ6pxQt+WDVNlh7ZiJWFD/
	sl2pk2Qfr+5fLB4dLZIOeeMeaS5XhAfo9lpO4BRVgrT62kd79bKVrD83uErgwWUeiapI8fPtzlS
	gTh3dJuvQFj6pyU9bBDGm6K0+5SqN2FCFldnYqLEaDP1Z7DT6UcAG4wa5OgaA2qR7qZYMPV0Beu
	D/OTqrHELn6XfMmWO1t73/+d8WMFYQAWBqEXOui+lPlOITppPYn97aP3wm8tc=
X-Received: by 2002:a05:600c:3556:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fe6708a46mr82223855e9.31.1790321250356;
        Fri, 25 Sep 2026 00:27:30 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm32571675e9.1.2026.09.25.00.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:27:29 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:27:26 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Vishal Moola <vishal.moola@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org, linux-mm@kvack.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: don't schedule deferred kernel page table freeing
 while booting
Message-ID: <arYhPon5nrixAm3I@gmail.com>
References: <20260925050647.86913-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925050647.86913-1-mikhail.v.gavrilov@gmail.com>

On Fri, Sep 25, 2026 at 10:06:47AM +0500, Mikhail Gavrilov wrote:
> Booting with a boot-time function tracer and a filter, for example
>
>   ftrace=function ftrace_filter=pud_free_pmd_page
>
> panics on 7.3-rc4 as soon as the tracer starts:
>
>   [   23.531178] Starting tracer 'function'
>   [   23.675800] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN NOPTI
>   [   23.819917] KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
>   [   23.964025] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.3.0-rc4-fe2ec83746e5-with-fixes-v2+ #195 PREEMPT(undef)
>   [   24.252248] RIP: 0010:__queue_work+0xab/0xf00
>   [   25.981629] Call Trace:
>   [   26.125727]  <TASK>
>   [   26.413912]  ? pagetable_free_kernel+0x20/0x120
>   [   26.990283]  queue_work_on+0x97/0xf0
>   [   27.134382]  __cpa_collapse_large_pages+0x501/0x6f0
>   [   27.566662]  cpa_flush+0x394/0x620
>   [   27.998953]  change_page_attr_set_clr+0x321/0x4a0
>   [   29.151729]  set_memory_rox+0xa2/0xf0
>   [   29.584018]  create_trampoline+0x431/0x6f0
>   ...
>   [   44.343347] Kernel panic - not syncing: Attempted to kill the idle task!
>
> The boot-time tracer is started from early_trace_init(), which runs
> before workqueue_init_early().  Making its trampoline read-only splits a
> large page, and CPA collapses it again right away.  The split table has
> been a kernel page table since commit 9e4a3ec3411b
> ("x86/mm/pat: Allocate split page tables as kernel page tables"), so the
> collapse frees it through pagetable_free_kernel(), which queues work on
> system_percpu_wq - still NULL at that point.  That commit is correct in
> itself; it only lets CPA reach pagetable_free_kernel() before the
> workqueue that function relies on exists.
>
> Keep putting the table on the list, but don't schedule the work while
> the system is still booting.  A core_initcall schedules it once to free
> whatever was queued by then.
>
> Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
> ---
> v3:
>  - Schedule the work once from a core_initcall to free whatever was
>    queued during boot (Lorenzo Stoakes, Dave Hansen, David Hildenbrand).
>    late_initcall would work just as well; workqueues exist from
>    workqueue_init() on.
>  - Keep the fix in pagetable_free_kernel() rather than skipping the
>    collapse during boot (Mike Rapoport): that would only avoid this
>    caller, and any other early free would still need a workqueue.
> v2: https://lore.kernel.org/20260924092307.22813-1-mikhail.v.gavrilov@gmail.com
> v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
>
> Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX (lockdep, KASAN),
> 7.3-rc4 plus unrelated local changes, by booting with
>
>   ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func,kernel_pgtable_drain_early
>
> The boot that panicked without the fix completes, and the trace shows
> kernel_pgtable_drain_early() and then kernel_pgtable_work_func() before
> any other kernel page table is freed.
>
>  mm/pgtable-generic.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..cd227fc05d2d 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -438,12 +438,30 @@ static void kernel_pgtable_work_func(struct work_struct *work)
>  		__pagetable_free(pt);
>  }
>
> +static void schedule_kernel_pgtable_free(void)
> +{
> +	schedule_work(&kernel_pgtable_work.work);
> +}
> +
>  void pagetable_free_kernel(struct ptdesc *pt)
>  {
>  	spin_lock(&kernel_pgtable_work.lock);
>  	list_add(&pt->pt_list, &kernel_pgtable_work.list);
>  	spin_unlock(&kernel_pgtable_work.lock);
>
> -	schedule_work(&kernel_pgtable_work.work);
> +	/*
> +	 * The workqueue may not exist yet while the system is booting.
> +	 * kernel_pgtable_drain_early() schedules the work once it does.
> +	 */
> +	if (system_state != SYSTEM_BOOTING)
> +		schedule_kernel_pgtable_free();
> +}
> +
> +static int __init kernel_pgtable_drain_early(void)
> +{
> +	/* Free the kernel page tables queued while booting. */
> +	schedule_kernel_pgtable_free();
> +	return 0;
>  }
> +core_initcall(kernel_pgtable_drain_early);
>  #endif

tested it, boots cleanly and the panic is gone. LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

--
cheers, jose a. p-a
