Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323226;
	b=A3PQQE1vkliqzNAzg1/4mHNVl5vWQD2IUl7axDWP/mNzgVvwuRH4VgNKs3/EyrU7pVwS
	 xm09xHvJCNwVZpzQNJyMnSgP3NJiwbgKVLr42yxSKMLe53HKSQMiO1yNUp3USmiKg7VOz
	 JQVPnxH2oSkfH5VTnv3pBgVjCxgPpgLrDIbNk/HqNv7zJZqQU7tGKZ1FJ/nHj1xKbT9eq
	 fL4AD632LXre271li/EALMQG6nzTNBSlcYgezNMgeEI3cvGlsMH4UMdRE2vQrEpSbMH16
	 vSEEjofANoTESQr8WrfUXEPArLsxTA+XGeVEj6uZvqWz8fYAtU4QBdAjfy2El49GOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323226;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3fnjfujQ/pzlwEGTHqO6MVLdM4zSJpqzQo1FTTutvu0=;
	b=h68dZcPujNMqSOLp3jwrfH/LHz+kYQm9Z49/KAbeSnQBz8Qd6y/0b/QgWsOvDvnOlv69
	 /ZpgQAR5Jri0hyuA9ya86bgOpK4j0hGFfXW7lhHWfEhQrTFGnl8Rovnwi6HC0rc/BF7lf
	 OZTkklNCMK84ZGjpmBU3PURMbd3BudrS+iIqO2qXJmSI4xxi0tyIWbo/fSQOdPDI7h8MP
	 ykmcOcCwTIjkn2BfucvDx4x3T+8usiSWJ9Eyq09zBMHTrDr2r7GzwoJy7Q10+hJSNOYOx
	 /tdHdKO8Vf0dclNkgZeGFZ9zAqsQ32K2+dldE2fHVoGSNeP2CpJ7pE553vro+sU6M0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvQQp3du;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05E2606AA43
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvQQp3du
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097EE1F0089F;
	Tue, 10 Nov 2026 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323225;
	bh=3fnjfujQ/pzlwEGTHqO6MVLdM4zSJpqzQo1FTTutvu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EvQQp3duvHQl6jDz5kOlsTmP08H/wuHF5yTsADpur58rOhzYTHwx/0MyO8PkLd6Cx
	 NEYAMPMQy18BPZperR1LssjjyHjqm72z9DYiLM1M0y8Qyzry60CcYsbcCS3KIsaJBB
	 MJIkmJ9YDXFgAVaCl7MrfZVnmC20DZHNW2uHbx+l0AYzBXSAgD7yBhpSk311ewXeCZ
	 lEw8M0EhNlQoBsSZ5kcQhsfGZUxMnCtAegkOfqDsthAkHA9kN1Tio4G3VhU3UMbzzY
	 6nChIB7vKDdkXv0mTBCq/YRroxhgr+FQVaTYkjSY1HgWZgViqY8sucXoN4B7mx7ttN
	 rDGdYdpEscetQ==
Date: Tue, 10 Nov 2026 15:06:58 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ankur Arora <ankur.a.arora@oracle.com>, Pedro Falcato <pfalcato@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Bharata B Rao <bharata@amd.com>, 
	Hrushikesh Salunke <hsalunke@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-ID: <avMxawZfHRAqgKA4@gremlin>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>

On Mon, Nov 09, 2026 at 07:15:51PM +0000, Shivank Garg wrote:
> clear_contig_highpages() clears the whole range at once under
> preemptible models. Otherwise it clears PROCESS_PAGES_NON_PREEMPT_BATCH
> pages at a time, with a cond_resched() in between. The batch is 32MB if
> the architecture defines clear_pages(), and one page otherwise.
>
> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
> modes"), architectures that support lazy preemption only offer the
> full, lazy and RT preemption models, also with PREEMPT_DYNAMIC. x86 is
> one of them, and it is the only architecture that defines
> clear_pages(). So the 32MB batch is never used: whenever
> clear_contig_highpages() runs under a cooperative model, the batch is
> one page.
>
> Make that explicit. Clear the whole range when CONFIG_PREEMPTION is
> set, and one page at a time with cond_resched() in between otherwise.
> Drop PROCESS_PAGES_NON_PREEMPT_BATCH, which has no other users.
>
> PREEMPT_DYNAMIC kernels also have CONFIG_PREEMPTION set, and
> cond_resched() does nothing on any of these kernels. So a build-time
> CONFIG_PREEMPTION check is enough, and preempt_model_preemptible() is
> not needed.
>
> No functional change intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Nice cleanup! LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> This came up in review of the copy_mc_highpages() series [1]. Pedro
> pointed out that most architecture run with full or lazy preempt, so mm
> does not need to check the preemption model at runtime or batch the copy
> for cond_resched(), and a simple per-page fallback is enough for
> non-preemptible models.
> David suggested doing the same for the zeroing path, and this patch
> does that.
>
> [1] https://lore.kernel.org/all/20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com
> ---
> Changes in v3:
> - Use clear_user_highpage() in the per-page loop (Pedro).
> - rebase on mm/core.git/for-next.
> - Link to v2: https://lore.kernel.org/r/20261109-clear-pages-batch-v2-1-2e62c4f84f94@amd.com
>
> Changes in v2:
> - Rebased on mm/linux.git/for-next, and drop RFC tag.
> - Link to v1: https://lore.kernel.org/r/20261022-clear-pages-batch-v1-1-13d3bd0b876e@amd.com
> ---
>  include/linux/mm.h | 28 +---------------------------
>  mm/memory.c        | 29 ++++++++++++++++-------------
>  2 files changed, 17 insertions(+), 40 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e6da76fbe8e8..8d14e45fcf24 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5250,7 +5250,7 @@ static inline void clear_page_guard(struct zone *zone, struct page *page,
>   *
>   * When running under preemptible models this is not a problem. Under
>   * cooperatively scheduled models, however, the caller is expected to
> - * limit @npages to no more than PROCESS_PAGES_NON_PREEMPT_BATCH.
> + * clear one page at a time and call cond_resched() in between.
>   */
>  static inline void clear_pages(void *addr, unsigned int npages)
>  {
> @@ -5261,32 +5261,6 @@ static inline void clear_pages(void *addr, unsigned int npages)
>  }
>  #endif
>
> -#ifndef PROCESS_PAGES_NON_PREEMPT_BATCH
> -#ifdef clear_pages
> -/*
> - * The architecture defines clear_pages(), and we assume that it is
> - * generally "fast". So choose a batch size large enough to allow the processor
> - * headroom for optimizing the operation and yet small enough that we see
> - * reasonable preemption latency for when this optimization is not possible
> - * (ex. slow microarchitectures, memory bandwidth saturation.)
> - *
> - * With a value of 32MB and assuming a memory bandwidth of ~10GBps, this should
> - * result in worst case preemption latency of around 3ms when clearing pages.
> - *
> - * (See comment above clear_pages() for why preemption latency is a concern
> - * here.)
> - */
> -#define PROCESS_PAGES_NON_PREEMPT_BATCH		(SZ_32M >> PAGE_SHIFT)
> -#else /* !clear_pages */
> -/*
> - * The architecture does not provide a clear_pages() implementation. Assume
> - * that clear_page() -- which clear_pages() will fallback to -- is relatively
> - * slow and choose a small value for PROCESS_PAGES_NON_PREEMPT_BATCH.
> - */
> -#define PROCESS_PAGES_NON_PREEMPT_BATCH		1
> -#endif
> -#endif
> -

Nice to remove this :)

>  #ifdef __HAVE_ARCH_GATE_AREA
>  extern struct vm_area_struct *get_gate_vma(struct mm_struct *mm);
>  extern int in_gate_area_no_mm(unsigned long addr);
> diff --git a/mm/memory.c b/mm/memory.c
> index c9d64170e47a..fcc7ea2a00d1 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -7650,27 +7650,30 @@ static inline int process_huge_page(
>  }
>
>  static void clear_contig_highpages(struct page *page, unsigned long addr,
> -				   unsigned int nr_pages)
> +		unsigned int nr_pages)
>  {
> -	unsigned int i, count;
> +	unsigned int i;
> +
> +	might_sleep();
> +
>  	/*
>  	 * When clearing we want to operate on the largest extent possible to
>  	 * allow for architecture specific extent based optimizations.
>  	 *
> -	 * However, since clear_user_highpages() (and primitives clear_user_pages(),
> -	 * clear_pages()), do not call cond_resched(), limit the unit size when
> -	 * running under non-preemptible scheduling models.
> +	 * clear_user_highpages() (and primitives clear_user_pages(),
> +	 * clear_pages()) do not call cond_resched(). That is fine on
> +	 * preemptible kernels, where the scheduler can preempt the clearing
> +	 * at any point, so clear the whole range at once. Otherwise, clear
> +	 * one page at a time and reschedule in between.
>  	 */
> -	const unsigned int unit = preempt_model_preemptible() ?
> -				   nr_pages : PROCESS_PAGES_NON_PREEMPT_BATCH;
> -
> -	might_sleep();
> +	if (IS_ENABLED(CONFIG_PREEMPTION)) {
> +		clear_user_highpages(page, addr, nr_pages);
> +		return;
> +	}
>
> -	for (i = 0; i < nr_pages; i += count) {
> +	for (i = 0; i < nr_pages; i++) {
>  		cond_resched();
> -
> -		count = min(unit, nr_pages - i);
> -		clear_user_highpages(page + i, addr + i * PAGE_SIZE, count);
> +		clear_user_highpage(page + i, addr + i * PAGE_SIZE);
>  	}

Very lovely :)

>  }
>
>
> ---
> base-commit: 2683df3b7eac1d91380194955ad0c9751454610c
> change-id: 20261021-clear-pages-batch-77f72ef808e4
>
> Best regards,
> --
> Shivank Garg <shivankg@amd.com>
>

--
Cheers, Lorenzo
