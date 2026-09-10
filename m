Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3194249B1FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054432; cv=none; b=I7gQao+mGHtIsdyb7WNyCh9kxXYGk8amLiKKL2l12vFGcHhwvVokG9kTZJK04TviVDJ7l3oyarwhUZEqg/cnAHuts4pHdj6hM3fumAiNaYogRc93rmwammRcsTgGj0hqMIhiEYej0z0Pb13HExCq22H8gNw4OCSqn/bPKlNBRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054432; c=relaxed/simple;
	bh=63eXMjFSxU46dijcDcgENaPFQu7PNrK8mcNokUz2jrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWxrwlIH2MHqkNzccq2943TOc/e7ahK6QswAuLaitTjHT3fdGnB3/4TbJXD1bJJvRU4WTALP7/C0WTjRqUKt+SxS2lrWuZE2ZSttTk9R+w7RSpkxtwqv3e9zHfADi+dNFqxl1NLpSKxwqrvbxucAS/LNaTh6eOTIq7z22ydH2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdDDbRML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdDDbRML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418FB1F0089A;
	Thu, 10 Sep 2026 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054431;
	bh=T0epqV5gbHkPz2d74NV+5dIcH3lf6pVLxkh4OQ+Eipw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KdDDbRMLbED9Znx79eAKT5mp0g8Y4nWLAM1RwHJ7AmB0lBDamspPwv36II27PhxOn
	 TFLSmoTAZQjnwKCnmroedpKF5cKvou9fGm1H6UJImd43xLglNADC73mU4aDK6VQoJR
	 57VRcYAAzV70o5fcf0uQb/arAtrocMlUfsaLJ2kdz7Qst4AJQv3QY6I3pJnOFolc6M
	 Zf143W1ASLG22ydPxnmBOqspFy1T0ksAefvQ71Mr/0p81qOshGnATZ7iMX2EvAJXZG
	 JNfDrhd3rM+WplgOdTlzlVzGC0n7rSkXqV4rjKIF1L54pYkbNsMcCeLsOeG/AAU1XP
	 e+NjTLkQ3qTwA==
Date: Thu, 10 Sep 2026 16:33:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/memory: simplify error handling in
 insert_pages()
Message-ID: <aqLN0q5MpB1kQKKC@gremlin>
References: <cover.1788022178.git.thnkslprpt@gmail.com>
 <dd3a672c858b38c7525541b19a919e120c4e5a0e.1788022178.git.thnkslprpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd3a672c858b38c7525541b19a919e120c4e5a0e.1788022178.git.thnkslprpt@gmail.com>

On Sat, Aug 29, 2026 at 08:11:12PM +0300, Avi Weiss wrote:
> Initialize error return status to zero and then set it as needed at each
> point of failure.
>
> Assign -ENOMEM explicitly when pte_alloc() fails as the pte_alloc()
> macro returns a boolean.
>
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/memory.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 9cbce5c90bff..2561dc6bdde6 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2565,20 +2565,22 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
>  	unsigned long curr_page_idx = 0;
>  	unsigned long remaining_pages_total = *num;
>  	unsigned long pages_to_write_in_pmd;
> -	int ret;
> +	int err = 0;
>  more:
> -	ret = -EFAULT;
>  	pmd = walk_to_pmd(mm, addr);
> -	if (!pmd)
> +	if (!pmd) {
> +		err = -EFAULT;
>  		goto out;
> +	}
>
>  	pages_to_write_in_pmd = min_t(unsigned long,
>  		remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
>
>  	/* Allocate the PTE if necessary; takes PMD lock once only. */
> -	ret = -ENOMEM;
> -	if (pte_alloc(mm, pmd))
> +	if (pte_alloc(mm, pmd)) {
> +		err = -ENOMEM;
>  		goto out;
> +	}
>
>  	while (pages_to_write_in_pmd) {
>  		int pte_idx = 0;
> @@ -2586,15 +2588,14 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
>
>  		start_pte = pte_offset_map_lock(mm, pmd, addr, &pte_lock);
>  		if (!start_pte) {
> -			ret = -EFAULT;
> +			err = -EFAULT;
>  			goto out;
>  		}
>  		for (pte = start_pte; pte_idx < batch_size; ++pte, ++pte_idx) {
> -			int err = insert_page_in_batch_locked(vma, pte,
> -				addr, pages[curr_page_idx], prot);
> +			err = insert_page_in_batch_locked(vma, pte, addr,
> +							  pages[curr_page_idx], prot);
>  			if (unlikely(err)) {
>  				pte_unmap_unlock(start_pte, pte_lock);
> -				ret = err;
>  				remaining_pages_total -= pte_idx;
>  				goto out;
>  			}
> @@ -2607,10 +2608,9 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
>  	}
>  	if (remaining_pages_total)
>  		goto more;
> -	ret = 0;
>  out:
>  	*num = remaining_pages_total;
> -	return ret;
> +	return err;
>  }
>
>  /**
> --
> 2.43.0
>

--
Cheers, Lorenzo
