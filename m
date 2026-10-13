Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121343BDC2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887064; cv=none; b=MC+7LMNwZTN5IAqeFYs6hH31nAmYz82LI2Xxo87fY0kTJhV78ddqo645YlZ4bp6UjptJ9FG0UZBAcdXR50JlgdwRumcUlV+pXJt5ZYnTMTQ7yo/YkZ3UY2FNZAgX/CZu1pyLAwRG9R00QqYpbR/Uo3BSp9W9iopg23/ogSBQDfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887064; c=relaxed/simple;
	bh=spag7+cY1FrF3GtaOZa/igiyOaTN7Izv6Jj3riy+sCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eymvPO02pTrGwUHIFfkxFydRjUIlIXgNLGyRuSOXiEufJ3lvrWKBvRoN0vQ3iamFMHNpcPBc1wr4SN8bxos0HAlAezwBsjVsR4vMMzuZYRBg7XWJmwvxqo+y+lzPh5LEwW6vmZyG/zX/nUbJfiuIYrQZ0zr+5w7yqN7YBgx9p64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h26yLnY2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AO4B44qH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=srLXcw6u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D4zxZd1k; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h26yLnY2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AO4B44qH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="srLXcw6u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D4zxZd1k"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D66F121F40;
	Tue, 13 Oct 2026 10:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791887061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0ZM+dv93LM/1manblR0kAOPbmB0f1yirbC7X2E9OwQ=;
	b=h26yLnY2pB46aC1kCvpYvK84GpQY2fr+wAIaCzYhmmla+hBBKKBqUwbI7m3QGGlXAzpIwq
	PK4lzNuOpVSDyp2A/Lduxha+Jp5iFe40y1RUVnuv5xKIwdlRl31p9+hPMtT34ZL1arO7M5
	Jd8Dobb6n5tZ0SPoe0ymF1B2pNoTdBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791887061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0ZM+dv93LM/1manblR0kAOPbmB0f1yirbC7X2E9OwQ=;
	b=AO4B44qHte1/CYj9esv2X3tCBnNcO0RaAmpCqa8/K6axP6XJKTIcO2J1UsfJUF6bYV/VmU
	9+VhFpdgekpvKGCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791887060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0ZM+dv93LM/1manblR0kAOPbmB0f1yirbC7X2E9OwQ=;
	b=srLXcw6u+ci93ILb95A8hpj6oCi2PypBoz8xpuSYDHk+ycBFzy7WAeN+VlyDM1M2kVt1z7
	8EEeZgd51zDbfsPLWVk7M4ZLKalea7oZKZKccyGiLxhkFu3AI1+qHUzOS+fLU4QpiZlWSm
	zNibU8X7TdaZ/f39tebQT7ylsS+qIvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791887060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0ZM+dv93LM/1manblR0kAOPbmB0f1yirbC7X2E9OwQ=;
	b=D4zxZd1kRwjJknytL9V8LKmYE5UUsiBC/0bzU7jxQrtktp26Q07hwZ/Vlim8jZrsC6Mcau
	fzhat25oS/A7GODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2E4513432;
	Tue, 13 Oct 2026 10:24:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 87bTI9MGzmoiJAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 13 Oct 2026 10:24:19 +0000
Date: Tue, 13 Oct 2026 11:24:18 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz, ayushr@modal.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
Message-ID: <as4FIaQlxb_nqyX9@pedro-suse.tail5790ac.ts.net>
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Sat, Oct 10, 2026 at 03:22:18PM +0800, Baolin Wang wrote:
> Ayush reported an issue that shmem/tmpfs folios are still mapped when
> truncating them on production:
> "
> BUG: Bad page cache in process ...  pfn:...
> page dumped because: still mapped when deleted
> "
> 
> I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
> branch, and I got the following crash info. From the dump message, we can
> see that truncate_inode_folio() is really trying to remove mapped folios,
> which is incorrect.
> 
> "
> [  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
> index:0x3880 pfn:0x191647
> [  189.171995] memcg:ffff0000cc073d40
> [  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
> [  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
> workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
> .......
> [  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
> [  189.172026] ------------[ cut here ]------------
> [  189.172027] kernel BUG at mm/filemap.c:155!
> [  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> .......
> [  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
> 7.3.0-rc4+ #277 PREEMPT(lazy)
> .......
> [  189.183986] Call trace:
> [  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
> [  189.184391]  __filemap_remove_folio+0x34/0x160
> [  189.184633]  filemap_remove_folio+0x4c/0xb0
> [  189.184859]  truncate_inode_folio+0x34/0x58
> [  189.185087]  shmem_undo_range+0x220/0x658
> [  189.185308]  shmem_fallocate+0x2f0/0x470
> [  189.185527]  vfs_fallocate+0x128/0x328
> ......
> [  189.187078]  el0t_64_sync+0x184/0x188
> "
> 
> After analysis, I believe the race exists between truncation and MADV_DONTNEED,
> and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
> MADV_DONTNEED synchronously releases the pagetable page before calling
> tlb_flush_rmaps(), this could cause another thread's truncation to skip
> zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
> as non-zero. A possible race scenario is as follows:
> 
> CPU 0                           CPU 1
> shmem_fallocate                 madvise_dontneed_single_vma
>   unmap_mapping_range            .......
>   ......
>   (filemap_map_pages() remap folios)
> 				  zap_pte_range
>   truncate_inode_folio		    zap_empty_pte_table(pmd clear)
>     unmap_mapping_folio
>     ......
>       zap_pmd_range (saw pmd none, skip)
> 
>   filemap_remove_folio
>     BUG_ON(folio_mapped)
>                                     tlb_flush_rmaps(remove rmaps)
> 
> To fix this issue, we should move the pmd clear operation (via zap_empty_pte_table())
> to after tlb_flush_rmaps() and add smp_wmb()/smp_rmb() memory barriers, so that
> when we find a pmd_none() while unmapping a folio without holding the PTL, the
> folio's mappings are guaranteed to have been removed via tlb_flush_rmaps().
> 
> [1] https://lore.kernel.org/all/20260925065013.3682431-1-ayushr@modal.com/
> Reported-by: Ayush Ranjan <ayushr@modal.com>
> Closes: https://lore.kernel.org/all/20260924061708.1645968-1-ayushr@modal.com/
> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Mostly LGTM, thanks!

> ---
> Changes from v1:
>  - Add an smp_rmb() to pair with the smp_wmb() (Per Lorenzo and Pedro).
> ---
>  mm/memory.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 6a8e7772b8d6..c3a1faf580c8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2036,6 +2036,15 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		}
>  	} while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
>  
> +	add_mm_rss_vec(mm, rss);
> +	lazy_mmu_mode_disable();
> +
> +	/* Do the actual TLB flush before dropping ptl */
> +	if (force_flush) {
> +		tlb_flush_mmu_tlbonly(tlb);
> +		tlb_flush_rmaps(tlb, vma);
> +	}
> +
>  	/*
>  	 * Fast path: try to hold the pmd lock and unmap the PTE page.
>  	 *
> @@ -2044,16 +2053,13 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  	 * to ensure they are still none, thereby preventing the pte entries
>  	 * from being repopulated by another thread.
>  	 */
> -	if (can_reclaim_pt && direct_reclaim && addr == end)
> +	if (can_reclaim_pt && direct_reclaim && addr == end) {
> +		/*
> +		 * The rmap changes need to be observed before PTEs get zapped.
> +		 * Pairs with smp_rmb() in zap_pmd_range().
> +		 */

I'd amend this comment to something like:
		/*
		 * rmap changes need to be observed before page tables get zapped.
		 * Pairs with smp_rmb() in zap_pmd_range().
		 */
> +		smp_wmb();
>  		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
> -
> -	add_mm_rss_vec(mm, rss);
> -	lazy_mmu_mode_disable();
> -
> -	/* Do the actual TLB flush before dropping ptl */
> -	if (force_flush) {
> -		tlb_flush_mmu_tlbonly(tlb);
> -		tlb_flush_rmaps(tlb, vma);
>  	}
>  	pte_unmap_unlock(start_pte, ptl);
>  
> @@ -2108,6 +2114,11 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
>  			sync_with_folio_pmd_zap(tlb->mm, pmd);
>  		}
>  		if (pmd_none(*pmd)) {
> +			/*
> +			 * Order this PMD read before the folio's mapcount read.
> +			 * Pairs with smp_wmb() in zap_pte_range().
> +			 */

and this one to something like:
			/*
			 * Order this PMD read before any (possible) mapcount/rmap read.
			 * This isn't a problem in most cases, due to us synchronizing on
			 * the PTE lock, but such doesn't happen when PTE tables are zapped.
			 * Pairs with smp_wmb() in zap_pte_range().
			 */
> +			smp_rmb();
>  			addr = next;
>  			continue;
>  		}

Also, as a note, I would suggest we hold off on this fix until the merge window.
I don't think it's that urgent, and it seems like there is a possibility of a
nicer, cleaner fix. That and we need to audit pmd_none() sites for other
possible smp_rmb()'s...

-- 
Pedro
