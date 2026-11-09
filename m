Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219139;
	b=ANHdJYJvio5tteQHtj8h+xnvGckFH929a2YN6bF0n8ibgsoW5Gsp4PiVZfU0hXo5Dw56
	 hk0fexSFpyNp6M6y6wNwA6jbAOxL86MUWb14wsNjh5u2XEfSdgZ1J4WtOMW487Gm1fzEK
	 4TNiuXuoOyO3hz7sCr5m+vya5SrYa34EIPqjiYrhSBarAAjHFP2mLp/cmibMSzacueD8c
	 66kMvFo7TFgaONZYU79Gk8hD/X0n/kcDpoAoN3vqlGPA9bF5nWRQfSkFO64fHS05GvgTJ
	 1x3P6fn1vIcsSkJ+hZWq3b1Vwmyz8tOiBBLkyazA/8cdDs0AnvPBAY3E1QD2O/nlSZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219139;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=CcNnVVf8GaxnGaipb5Ipmx75ZcIBQfMWDRTlKTdY4Y0=;
	b=20hlH4d1nBKXi9ccaRnZE3p/ecUOnqvjVbZQBsgC0B7F0mLEIGnJQTnjpf/vaqWH6pH/
	 eKACl6s302VhjZTyNCQmp5jz94GiFhGrQdVCBC4gn8rBb5358cqW3NQrVllSTMI9IEd2G
	 05QORUSlY1C9Qgc4tPBWPYyPazdnSnEbS5fR/t/pviFEAxKCy8RVeOO2ksvYFw8lt+nuJ
	 SIuQoMMvYV8Irq5wUzsV/720E6p3/oun297Vc26T8KjoZWFQurWu3Yp+E13bsKtJCF1LF
	 yO66JGs+mRueqc1vhg5ZrR4z32M61u8WzrdmnllrhG9o4P1XEuWFgycVKf8NdmR4f+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PwxPLG5U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7tbgkPtz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PwxPLG5U;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7tbgkPtz;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PwxPLG5U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7tbgkPtz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PwxPLG5U;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7tbgkPtz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1F60821F99;
	Mon,  9 Nov 2026 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794219137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CcNnVVf8GaxnGaipb5Ipmx75ZcIBQfMWDRTlKTdY4Y0=;
	b=PwxPLG5UHtTluzJwz9PeJgwQ1XCnDltU6H8jm39PKA8+7wwFU74rMssjdsBRKWsOrGIqWZ
	Mc8HVSiF/2fLR7zwbKBzgbWe76rMiJ5Kr9e+cbi0wjMqr9VOr/rCWVDztFcA6Ucm1uHv4B
	ASdH6bY1K0n7mY8IkCDXiX76LaJ+oDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794219137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CcNnVVf8GaxnGaipb5Ipmx75ZcIBQfMWDRTlKTdY4Y0=;
	b=7tbgkPtzYszADqt4XU0z2mqJfahPafpXMV3iiA9q1E6AJJnGZoXd9dgyd3znwiolmfKTnV
	kGvhHvYk/OpvvjDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794219137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CcNnVVf8GaxnGaipb5Ipmx75ZcIBQfMWDRTlKTdY4Y0=;
	b=PwxPLG5UHtTluzJwz9PeJgwQ1XCnDltU6H8jm39PKA8+7wwFU74rMssjdsBRKWsOrGIqWZ
	Mc8HVSiF/2fLR7zwbKBzgbWe76rMiJ5Kr9e+cbi0wjMqr9VOr/rCWVDztFcA6Ucm1uHv4B
	ASdH6bY1K0n7mY8IkCDXiX76LaJ+oDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794219137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CcNnVVf8GaxnGaipb5Ipmx75ZcIBQfMWDRTlKTdY4Y0=;
	b=7tbgkPtzYszADqt4XU0z2mqJfahPafpXMV3iiA9q1E6AJJnGZoXd9dgyd3znwiolmfKTnV
	kGvhHvYk/OpvvjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D96F613319;
	Mon,  9 Nov 2026 10:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0Q0dKX+c8WpKVwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 09 Nov 2026 10:12:15 +0000
Date: Mon, 9 Nov 2026 10:12:14 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Bharata B Rao <bharata@amd.com>, 
	Hrushikesh Salunke <hsalunke@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-ID: <avGbPpm3-Yrapry8@pedro-suse.tail5790ac.ts.net>
References: <20261109-clear-pages-batch-v2-1-2e62c4f84f94@amd.com>
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
In-Reply-To: <20261109-clear-pages-batch-v2-1-2e62c4f84f94@amd.com>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,amd.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Mon, Nov 09, 2026 at 06:51:07AM +0000, Shivank Garg wrote:
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
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

with a question below.

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
> Changes in v2:
> - Rebased on mm-next/for-next, and drop RFC tag.
> - Link to v1: https://lore.kernel.org/r/20261022-clear-pages-batch-v1-1-13d3bd0b876e@amd.com
> ---
>  include/linux/mm.h | 28 +---------------------------
>  mm/memory.c        | 29 ++++++++++++++++-------------
>  2 files changed, 17 insertions(+), 40 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d89e6f823c9f..59bc3685aac5 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5242,7 +5242,7 @@ static inline void clear_page_guard(struct zone *zone, struct page *page,
>   *
>   * When running under preemptible models this is not a problem. Under
>   * cooperatively scheduled models, however, the caller is expected to
> - * limit @npages to no more than PROCESS_PAGES_NON_PREEMPT_BATCH.
> + * clear one page at a time and call cond_resched() in between.
>   */
>  static inline void clear_pages(void *addr, unsigned int npages)
>  {
> @@ -5253,32 +5253,6 @@ static inline void clear_pages(void *addr, unsigned int npages)
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
>  #ifdef __HAVE_ARCH_GATE_AREA
>  extern struct vm_area_struct *get_gate_vma(struct mm_struct *mm);
>  extern int in_gate_area_no_mm(unsigned long addr);
> diff --git a/mm/memory.c b/mm/memory.c
> index c46482e35418..9bfd49ea990f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -7612,27 +7612,30 @@ static inline int process_huge_page(
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
> +		clear_user_highpages(page + i, addr + i * PAGE_SIZE, 1);

I think we can use clear_user_highpage() here. I don't know if that's
necessarily desirable, but it would make this a little simpler.

-- 
Pedro
