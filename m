Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614721;
	b=a3HJhPfphVZqp3c8WRNeXJ46UYDYnkAn1FuKLtJ5LDiZzq60vh0RCGWt3HUOYYhsWEIz
	 mSRF71QGLKZUVED6q8Z+DN0qSqdZgUBS620DfxHxl+9c5l0AR8r+MDaup1xKU6TZerKa6
	 yAVCc8Q4LlxRXMW8cfQoDx+PP03QZNSfiVKDhufVTPxNUCSskqm5LrN/GqIiCiJ/1ZiSv
	 SXs4HESL1Qk41dxiWJUoJ22n/FhrAWufdgIz9AsgrB7ZfA4/LQpknjM0hN6i2wIG93O2N
	 cC0k0awNXk8AMi222fr0ZVfghQkfmxwcZOTKSa1I/yAK9qGW7HpwsPmTL5Ov66jp1eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614721;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=AhUm2tRgdmS7ZkPk5TUVWoc0pWoU9lL6iWD8QKMf5pM=;
	b=b1dKqUb9q4WeKTSMSgYhlyXitBVEkXPET6M1Aq56fWBv8BxhJ5zvrQFvN3HH2ceOBes5
	 eY/d6Tk0DYunWgaac0o4DAoHaAcX3Wtsk8IjMXV2KPV99blfJad3wLXOS9yNldHzSk0Uo
	 oc1cKRC9ERQaelwIKsAwJl8d0SzDl0aGtrKmx8Qx8R5i7UfNmlfISlVqaUAuqYPGYi6hj
	 B8MDh000mFH4NAy3otS1oDwJdPANKy1ngTwHzzqJWGu89KQ6SRXTIceN/uFNVHQFWvuLI
	 bxsPoP0NYtg7APawkZVNe/8wpE361REAtqVsIyE2B5EOs73D7bstx+Edzzo7kj+NAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=am21LAGB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351C60A2605
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=am21LAGB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D58A1F0093A;
	Mon,  2 Nov 2026 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614721;
	bh=AhUm2tRgdmS7ZkPk5TUVWoc0pWoU9lL6iWD8QKMf5pM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=am21LAGB5HRWVCWqnzuh7hVK0cQAmPz5dPPwvgfhJ+LNbm+kmxRyM1nrj/cayH9pa
	 +vBfMVhno74jeDQKsFDXNcDIX/mWNPW0ULJhZ3UT/nV9eRGvwiLU6N8TCrnduf2PzC
	 GHln9Gza4A/xSHIsThHNfW6ipW6QFJfmNmKkSGXackF3ObYvHk6/jF4o6kMNOwyMbA
	 WTFCeY47F81AXa6ao0VEHuHrXSjPDofVuTVlW1pP4MXLZ1bB4T2cxxszl6o5ac2WRJ
	 /vZPTNvDdZt+lm62aBQ5j60rt8gFmGvc5yTCeVGK9FwKeJgtcH+fxQIyGmNHfDh8wE
	 D/3oLIPaZNWCA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-3-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-3-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471103.1337633.14353990207430443405.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi Muchun,

> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
> describe fully independent choices. A split-only walk can defer the
> PMD-split flush to a later global flush, and a remap-only walk can
> defer the final remap flush. However, when a PMD split is followed
> by PTE remapping, the split flush must happen before the PTEs are
> changed, because stale large-page translations must not overlap with
> new small-page translations that map different physical pages.
> 
> Replace the two flags with a single VMEMMAP_DEFER_TLB_FLUSH flag. The
> new name reflects that only safely batchable flushes are deferred. Keep
> split-only walks able to defer the flush, but force the split flush
> whenever a remap_pte callback is present. Callers that batch HVO work
> can still defer the final remap flush and issue their own global flush.
> 
> Current callers keep the same flushing behavior.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> ---
> v2:
> - Rename the unified flag to VMEMMAP_DEFER_TLB_FLUSH and update its
>   comment (suggested by Qi Zheng)
> - Update the commit message for the new flag name
> - Collect Reviewed-by from Lance Yang and Qi Zheng
> ---
>  mm/hugetlb_vmemmap.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 4b73d6ec8dcea..63e899cfaac3a 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
>  	struct list_head	*vmemmap_pages;
>  
>  
> -/* Skip the TLB flush when we split the PMD */
> -#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
> -/* Skip the TLB flush when we remap the PTE */
> -#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
> +/* Defer safely batchable TLB flushes to the caller. */
> +#define VMEMMAP_DEFER_TLB_FLUSH	BIT(0)
>  	unsigned long		flags;
>  };
>  
> @@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
>  		/* Make pte visible before pmd. See comment in pmd_install(). */
>  		smp_wmb();
>  		pmd_populate_kernel(&init_mm, pmd, pgtable);
> -		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
> +		/*
> +		 * Modern MMUs allow overlapping TLB entries with different mapping
> +		 * granularities only if they map the same physical address. So
> +		 * remapping must not proceed without first flushing the TLB.

Are we certain that *all* modern MMUs for *all* architecures that 
support hugetlb are fine with skipping TLB flush after a split?

AFAIU, x86::set_memory always flushes TLBs after a large leaf is split.

-- 
Sincerely yours,
Mike.

