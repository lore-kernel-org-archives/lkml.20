Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60F43546EB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493588; cv=none; b=fhXqf07frSeJ9tX9Tzz1QqEDsGSIpILlJSkzVK/HK6UQB52tfEdxh+f0ewOSbGgEee4bDAWBLpYlJTA82kkjVVQQR18a3+CeXQcKID2UiBGLMY02Y11f8rov1HWuS3BLmvW7JQYIkfue4w42PtNYY1pCRhjZ1nYmTeA5gzGuCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493588; c=relaxed/simple;
	bh=EM+aG+yWfzm6igvMiw3Sluv2MfuOq6zvpVWV7arL9Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWmzbdWp1QscOmi4XWKLWAATTIJdBtpBQKSxbrhSIdWEtLnBhbvE49rFAfIEjRwI8K09ByTH2ad4sMOyJVUHzy39Z6QXFdiYF3UUHWY2/gZYpSNNQvqYnWwSVhwWv3yeatcKItc/Jt4MV5ef8fy4Dl3Pv+TD5hwDcqFoklQsbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Do6AqAKu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Do6AqAKu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6433153B;
	Thu,  3 Sep 2026 20:46:20 -0700 (PDT)
Received: from [10.164.148.37] (MacBook-Pro-3.blr.arm.com [10.164.148.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EB3F3F882;
	Thu,  3 Sep 2026 20:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788493584; bh=EM+aG+yWfzm6igvMiw3Sluv2MfuOq6zvpVWV7arL9Ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Do6AqAKuTFSA+TQLVdkujGV3kkrfvURPaimfzoeAacZ1nJ7LnUQyOXq2sjQ3xdpf6
	 RWe3342+gzzBgjAyJEYnzNb056VUm9egV8DnlBVsLaGmrEQjAPFT0RTEADDOyLKHCq
	 fXfLi3sNVVLQQBMyTrBwToH5/OR1FT5XxhySt1C4=
Message-ID: <f9c41141-308d-4688-99ce-643c34729c47@arm.com>
Date: Fri, 4 Sep 2026 09:16:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] mm: move anon-exclusive batch helper to mm.h
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, chrisl@kernel.org, kasong@tencent.com
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
 baolin.wang@linux.alibaba.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
 baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, pfalcato@suse.de, ryan.roberts@arm.com,
 anshuman.khandual@arm.com
References: <20260901054358.4049095-1-dev.jain@arm.com>
 <20260901054358.4049095-4-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-4-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/09/26 11:13 am, Dev Jain wrote:
> In preparation for optimizing large folio unmapping, we need to reuse
> the page_anon_exclusive_batch helper in rmap.c and rmap.h and obey the
> existing use in mprotect.c .
> 
> Therefore, move it from mprotect.c to mm.h. Gate with CONFIG_MMU since
> both rmap and mprotect users are built only for CONFIG_MMU.
> 
> While at it, change start_idx and max_len to unsigned long type for
> future proofing against THP support at >= PUD level. Also shorten
> expected_anon_exclusive -> anon_exclusive.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/mm.h | 19 +++++++++++++++++++
>  mm/mprotect.c      | 17 -----------------
>  2 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dd09c438fa23e..63da8813bc5df 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -244,6 +244,25 @@ static inline unsigned long folio_page_idx(const struct folio *folio,
>  	return page - &folio->page;
>  }
>  
> +#ifdef CONFIG_MMU
> +/*
> + * Get max length of consecutive PTEs pointing to PageAnonExclusive() pages or
> + * !PageAnonExclusive() pages, starting from start_idx. Caller must enforce
> + * that the PTEs point to consecutive pages of the same anon large folio.
> + */
> +static __always_inline int page_anon_exclusive_batch(unsigned long start_idx,

Sashiko says to make the return value unsigned long here, I'll do that. Now we
have an unfortunate mix of int's in existing callers, but keeping nr_pages
unsigned long everywhere eventually seems like the right thing to do.


> +		unsigned long max_len, struct page *first_page, bool anon_exclusive)
> +{
> +	int idx;
> +
> +	for (idx = start_idx + 1; idx < start_idx + max_len; ++idx) {
> +		if (anon_exclusive != PageAnonExclusive(first_page + idx))
> +			break;
> +	}
> +	return idx - start_idx;
> +}
> +#endif
> +
>  static inline struct folio *lru_to_folio(struct list_head *head)
>  {
>  	return list_entry((head)->prev, struct folio, lru);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 2888ee638d872..75c2b1a00eb36 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -138,23 +138,6 @@ static __always_inline void prot_commit_flush_ptes(struct vm_area_struct *vma,
>  		tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
>  }
>  
> -/*
> - * Get max length of consecutive ptes pointing to PageAnonExclusive() pages or
> - * !PageAnonExclusive() pages, starting from start_idx. Caller must enforce
> - * that the ptes point to consecutive pages of the same anon large folio.
> - */
> -static __always_inline int page_anon_exclusive_batch(int start_idx, int max_len,
> -		struct page *first_page, bool expected_anon_exclusive)
> -{
> -	int idx;
> -
> -	for (idx = start_idx + 1; idx < start_idx + max_len; ++idx) {
> -		if (expected_anon_exclusive != PageAnonExclusive(first_page + idx))
> -			break;
> -	}
> -	return idx - start_idx;
> -}
> -
>  /*
>   * This function is a result of trying our very best to retain the
>   * "avoid the write-fault handler" optimization. In can_change_pte_writable(),

