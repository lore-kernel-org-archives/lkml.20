Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313613;
	b=WSav0UN1t3v0Zzv446Vy4Yf39Y64rr1gCn1WwzWmFRY8db/AvlgMKOWP83BwSd98z0NS
	 X5gO75d66SnQuvG5EF6+gYZQ66TolctKiANvnSwZGEfNWkuWpoAdhbSrA608qoI6+v2HN
	 JvYxZ4V0tkfHr6ko6ladoTxbREEnU8XrVzX/1Pb6kvi7KT8jneF4I6AZ95RMrymJvdtXe
	 eb9XcKA1uRamQoeurL367qvR6fHgxFfP2M/9Ci0NjxTOpKkGNQoFDdM1xl51jYJnRlJd+
	 nu+6btwa6wZyWaS37G1+oEP9QG9eF2f9GjJpfCcJUGix0+5lpOSWDKo+CrEXoy4ZA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313613;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=28sGp94tB7+IhB+9l8EsVNP6ycTUbA9Myz4BYRq9KRQ=;
	b=HEGzUHU4dWnv7wB/ub3ln9Rtq44cgERblHzQvYc0YMdioZpWOZQOTb5JzIxvy4Tbl2r+
	 V5SXgFHkhbJVMZvDWaq1gcatUvkIfElwTa8pvUPIjqg3YIPISvLpiohSVWv57Yi2atnb6
	 vICLPGb/rUgaT6kgNSOwKBSYSUzc9HCQU6p8yoJdQ8aroGsimJcP/r0wFbjjotOoy3NbO
	 0GcOi03hK/5WCa67ucYR6JthJqEosgmDuk8rfbLaxwbXk24JE2vkumEAItjlLOX78VbzD
	 uEDSAX2PVZl/3LyY/J90ynrGuzkFJ+ebzAI5YgggQ37yImoTPCNsd4EovzZViMrnovg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nNTMQvVV;
	arc=none smtp.remote-ip=95.215.58.33
Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nNTMQvVV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NCdTdpmEhDXCpYswlDrvsbAlShAGzLjABHUDQP5sSb0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794313610; v=1; x=1794918410;
 b=nNTMQvVVeAC1i8sMsLB+5AuP2lG1OvGYeMqJVvCmO6SPtecc/lBQtR5V4LIlzFQVnTNM0Gqg
 FesuNJUQAdp5Ox6Dg874N2rEpRQNUywOXcTw4giN1HEdkqGjSRrzBq5W7SEnPPzDf71iUAqB+Gq
 cjR6XazRuoFObP9EEclN38as=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 554be337fc97911a;
	Tue, 10 Nov 2026 12:26:50 +0000
X-Mizu-Trace-ID: 554be337fc97911a
X-Migadu-Flow: FLOW_OUT
Message-ID: <f416f84a-03de-49fd-ab67-d86ed4dec633@linux.dev>
Date: Tue, 10 Nov 2026 20:28:10 +0800
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
Subject: Re: [PATCH v4 3/9] mm/vmalloc: BUG_ON() on an unaligned range in
 vmap_range_noflush()
To: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Dmitry Vyukov <dvyukov@google.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Tejun Heo <tj@kernel.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dennis Zhou <dennis@kernel.org>, Christoph Lameter <cl@gentwo.org>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-4-hao.ge@linux.dev>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-4-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/11/10 19:25, Hao Ge wrote:
> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
> late, because the upper levels may already have installed page
> tables for a range that is rejected anyway.
> 
> The pte loop maps whole pages and stops only when addr lands
> exactly on end.  An unaligned end lets addr jump over it and the
> loop keeps mapping past the range.  An unaligned start maps the
> page below the range and usually misses end too.  Such a range is
> never a legitimate request, and the corruption it leaves behind is
> hard to attribute to the caller afterwards, so bug out on addr and
> end at the entry of vmap_range_noflush() and drop the check from
> vmap_pte_range().
> 
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 093b8d5f7b0e..27f2674a5556 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size;
>  	unsigned int nr_pages;
>  
> -	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> -		return -EINVAL;
> -
>  	pfn = phys_addr >> PAGE_SHIFT;
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
> @@ -347,6 +344,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  	 */
>  	might_sleep();
>  	BUG_ON(addr >= end);
> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));

I know BUG_ON() is ugly and it was not my first choice either, but I
have not figured out a better way to handle __vunmap_range_noflush().

If an unaligned range is passed to it, the pte loop may clear PTEs
adjacent to the range. Say a caller passes [3, 12) while [0, 3)
belongs to somebody else. The loop operates on whole pages, so it
starts at the page containing 3 and clears [0, 3) with it. That
silently corrupts a live mapping, and the corruption is not detected
until the owner touches the page. Bugs like that are nearly
impossible to debug afterwards.

It is not feasible for __vunmap_range_noflush() to just return an
invalid-argument error upfront. Its job is to clear PTEs, and an
early return leaves the residual PTEs behind.

I also thought about warning and returning -EINVAL on the map side
and keeping BUG_ON() only in __vunmap_range_noflush(), but the
rollback kills that idea.

int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
                pgprot_t prot, struct page **pages, unsigned int page_shift,
                gfp_t gfp_mask)
{
        int err;

        if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
                return -EINVAL;

        if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
                page_shift = PAGE_SHIFT;

        err = vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);

        /* Undo the PTEs installed before the failure. */
        if (err)
                __vunmap_range_noflush(addr, end,
                                       gfpflags_allow_blocking(gfp_mask));

        return err;
}

If the walk WARNs and returns -EINVAL for a bad range, the undo
above passes that same range to __vunmap_range_noflush(), and we
BUG right after the WARN. vmap_page_range() runs into the same
thing on its error path.

So the map side cannot warn while the unmap side BUGs, the rollback
drags the rejected range into the unmap anyway. And the unmap side
cannot warn and skip either, that leaves the stale PTEs.

Also, these checks are the last line of defense. All in-tree callers
pass page aligned, non-empty ranges, and I am not aware of anyone ever
hitting this line. So for correct code the BUG_ON never fires at all,
no user will ever see it. The only one who can trip it is the developer
who just passed the bad range, and for him a stack trace right at the
spot is much better than chasing a silent corruption afterwards.

I settled on BUG_ON here. It may not be an ideal solution, but if anyone
has a better idea or alternative approach, please let me know.
I would greatly appreciate it.

Thanks
Best Regards
Hao

>  
>  	start = addr;
>  	pgd = pgd_offset_k(addr);
