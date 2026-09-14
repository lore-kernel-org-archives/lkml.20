Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC1472774
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396353; cv=none; b=tWe/P5eHRnFiangeR4UqbRNf0nOSfiHwRdkL51Ry6UlZhwNzktwH9YGHcjTdOjXAUPsD3tk6MMIAmXq8L/IL1HPKuogF1X7wY2jnfw3NiiQOq/koi5V+4ToW0nJ5iQOMfy4uUKv1D2Eudl6Q0EvLCkY6mYM9ldOxk0XJB73HLlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396353; c=relaxed/simple;
	bh=XMuqoQwODLmGDatHyZgBbq7fpq+fODgs2nl780ysEPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NstzjREYzwjk2bG+8tQV8T+W3IMu3UmiooKxGfB8yybyP+6PE8mVFRkZ/cttmqBEYil65DdSvssoRwKZEyHe8gyGjMVFDm0Flh80QEAA5mJ/jJsuaeC+D7CJsqSfxiAdqEDVp+slH/J6x4kh8wXGGx4Emhn3GHlGNCfNB1VSbaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsnxvKxT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsnxvKxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B0C1F000FF;
	Mon, 14 Sep 2026 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396346;
	bh=AqqRR/mVxXB+5iaJ9eNDsazLxdqYVHqBvhuHWtojPDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lsnxvKxTLV4+gEslEsqy0gfCPZACTJwu3G7od1j1RkuanOKgrlHgROjXGWfV+QXPO
	 XrrcbwhfTH6YVMAfbcGtIEF+iAaLUqVGYj6YPHF8MseGsOMyazqdXdbIXmtujxvBrD
	 uQpwbFZ5are1sgqje++pAHI53pVOv8TI8Zyhq/yAqYJGleoO3+Y8hxU+1nESrMSHKw
	 wZIGB/jglYRERzdhfp1JftTVUtgQ5YiSAWnFe2A1u9AzFotRc9opt+hh/1m0Zki4V+
	 LDYSscJxhKovWsbODwcU5acOivZf/7K3fcz/YdP/W4VZrtttvKQSyRZyUgnWG8J8qK
	 d5bpDuiKmyhuA==
Message-ID: <eed70516-e1c3-44f0-a982-327f18303b28@kernel.org>
Date: Mon, 14 Sep 2026 16:32:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind a
 long reap
To: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
 Zhou Yingfu <yingfu.zhou@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260914113239.367200-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 13:32, Jiayuan Chen wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> The oom reaper holds mmap_lock for read while it unmaps the whole
> victim.  Anyone who wants that lock for write in the meantime sits in D
> state until the reap is over.
> 
> With swap enabled the victim can be several times the size of RAM and
> the reap runs for minutes.  LTP oom01 trips hung_task that way for the
> victim and for ksmd, on 6.6 LTS and on 7.3.0-rc1:
> 
> Call Trace:
>  <TASK>
>  __schedule+0x487/0x1870
>  schedule+0x28/0xb0
>  schedule_preempt_disabled+0x16/0x30
>  rwsem_down_write_slowpath+0x1d4/0x750
>  down_write+0x60/0x70
>  __ksm_exit+0xb4/0x230
>  __mmput+0x12c/0x150
>  mmput+0x1e/0x30
>  do_exit+0x283/0xa30
>  do_group_exit+0x34/0x90
>  get_signal+0x952/0x960
>  arch_do_signal_or_restart+0x41/0x250
>  exit_to_user_mode_loop+0xd3/0x560
>  do_syscall_64+0x385/0x470
>  </TASK>
> 
> KSM is just the one LTP happened to hit: __khugepaged_exit() has the
> same write lock cycle ahead of exit_mmap().
> 
> Backing off between vmas would not help either: the victim's memory is
> a handful of huge vmas, LTP's mmap(3G) chunks merge into one, and
> zap_vma_for_reaping() zaps a whole vma in one go.
> 
> So:
> 
> 1. zap_vma_for_reaping() takes a range, and __oom_reap_task_mm() zaps
>    each vma in 1G chunks.
> 
> 2. After a chunk, if a writer is queued on mmap_lock, drop the lock and
>    return -EAGAIN.  The caller retakes it with a trylock, checks
>    MMF_OOM_SKIP as it always did, and starts over; what was reaped
>    already is empty pagetables and walks fast.
> 
> 3. A hand-over is not a failed attempt.  Only a failed trylock counts
>    against MAX_OOM_REAP_RETRIES, so the reaper still never blocks on
>    mmap_lock.
> 
> 4. process_mrelease() shares __oom_reap_task_mm(): on -EAGAIN it takes
>    the lock again and carries on, still reaping the whole mm in one
>    call.  Passing the -EAGAIN up to userspace instead would be the
>    smaller change, if that is preferred.
> 
> __ksm_exit() and __khugepaged_exit() now wait for one chunk at most
> instead of the whole reap.  And the exit path stops waiting for the
> reaper altogether: once __ksm_exit() has had its turn, exit_mmap() runs
> alongside the reaper and the two of them free the victim together, up
> to twice the freeing rate and close to it in practice with LTP oom01,
> so the machine gets its memory back that much sooner after an OOM kill.
> 
> The chunk is a fixed 1G rather than PUD_SIZE, which is 4T with 64K
> pages on arm64.  Each chunk finishes its own mmu_gather; that is the
> price of being able to drop the lock.
> 
> Reported-by: Zhou Yingfu <yingfu.zhou@shopee.com>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>  mm/internal.h |  3 ++-
>  mm/memory.c   | 13 ++++++----
>  mm/oom_kill.c | 69 ++++++++++++++++++++++++++++++++++++++-------------
>  3 files changed, 62 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 05179c4b2090..7ac1728a57c2 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -593,7 +593,8 @@ struct zap_details;
>  void zap_vma_range_batched(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long addr,
>  		unsigned long size, struct zap_details *details);
> -int zap_vma_for_reaping(struct vm_area_struct *vma);
> +int zap_vma_for_reaping(struct vm_area_struct *vma, unsigned long start,
> +			unsigned long end);

It's npw a vma range, so the function name no longer matches.

>  int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  			   gfp_t gfp);
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index 926276d41920..25c35a28a39d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2207,15 +2207,18 @@ static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  }
>  
>  /**
> - * zap_vma_for_reaping - zap all page table entries in the vma without blocking
> + * zap_vma_for_reaping - zap a range of the vma without blocking
>   * @vma: The vma to zap.
> + * @start: The first address to zap.
> + * @end: One past the last address to zap.
>   *
> - * Zap all page table entries in the vma without blocking for use by the oom
> - * killer. Hugetlb vmas are not supported.
> + * Zap the page table entries in [@start, @end) of the vma without blocking
> + * for use by the oom killer. Hugetlb vmas are not supported.
>   *
>   * Returns: 0 on success, -EBUSY if we would have to block.
>   */
> -int zap_vma_for_reaping(struct vm_area_struct *vma)
> +int zap_vma_for_reaping(struct vm_area_struct *vma, unsigned long start,
> +			unsigned long end)
>  {
>  	struct zap_details details = {
>  		.reaping = true,
> @@ -2224,7 +2227,7 @@ int zap_vma_for_reaping(struct vm_area_struct *vma)
>  	struct mmu_gather tlb;
>  
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
> -				vma->vm_start, vma->vm_end);
> +				start, end);
>  	tlb_gather_mmu(&tlb, vma->vm_mm);
>  	if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
>  		tlb_finish_mmu(&tlb);


__zap_vma_range() will VM_WARN_ON_ONCE() on invalid ranges, so that's good.

-- 
Cheers,

David
