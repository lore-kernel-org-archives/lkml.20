Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514129;
	b=LWQRbmIFRB0IDdaP56gbhzhqf2LDuHHfdBL0yPZpT/ZxO/7QSZFqx/I5EfuSpA3CxMGf
	 omHeiL2jPIblVIEjzFQ6AQR58fPJRowiXRev733xulisAwTIQAbhZFFJE78gEhuJ6B72A
	 zMeHgYhCY103Hl1fM/Jv2iTUENbS9P7LaBzS3MOsl9ZqDArOep0tPfMEJzj8QBdL9yTq+
	 uGOP/9g9Eohdd7GF4J55GI49tmPQorA8iejQDb0t3EYcb1GHoCTch0+WirSe2NKh5/mjN
	 qaQIZC9TYfUWaPVnofEiI/8CfECGGbiyzYjsz57/w4h8VflZCAo9Ym23qrt5IjlL4xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514129;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=blO6k0GV9t7jq832MC9mTaWTEhU4J8juq8TCxnkK4WQ=;
	b=onmXVa+Lb96P+EwBXecK0y5+Vc04EFizJA60qXUS46Dv+ZlJKCNCPM7aaNULwrLfNnu8
	 +hIG9p8buiRHptPo7ybQn2E0Xm38qhZiFuGbDlAzkmWQ1fK5Q/9uBvCagiadOIdlDkZnG
	 STg+tN7VVBW1z2pypbq3F4cZiwdkEGo2KM1UIZ+PzyOBaa+d0ZnbtgXx8RbLxvsJsdfmv
	 dFCSINL+4vvTo4bBXdQZl4ikMPXaxwkhMsu8EdJQmEJW8URjrivwXtfePn/QzE1ay/BFs
	 yftXo6CUXQqQVToSydIBdxUhyuvMZ/Jv83i2vdZWAOxoMvxlaGabdtm6sP+lV20E8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tit538k9;
	arc=none smtp.remote-ip=91.218.175.24
Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE396606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE396606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tit538k9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gaF9RaTUlWJnz0Kz7eSN92fdFpU4AaHftDt4HKXl/YY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793514127; v=1; x=1794118927;
 b=Tit538k9XfHYAjy4otnRC7vAz5Cj/Lshaoxkkk8Ghq1rfQBmNwtxsywKDb9yCi4afi7pP4H2
 azVrDg4QS5ZtzmVl643fP8STHG/kKplwbnGDLa/Y6/LSRHQbsSx6TbqgXQyIEcr3izcualOTZCZ
 zJw5W9KJF/mRI50gqQiw4csM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ef06936bde13713;
	Sun, 01 Nov 2026 06:22:07 +0000
X-Mizu-Trace-ID: 5ef06936bde13713
X-Migadu-Flow: FLOW_OUT
Message-ID: <86d9a986-58ea-44f5-a8af-514abff12c2a@linux.dev>
Date: Sun, 1 Nov 2026 14:22:00 +0800
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
Subject: Re: [PATCH 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
> describe fully independent choices. A split-only walk can defer the
> PMD-split flush to a later global flush, and a remap-only walk can
> defer the final remap flush. However, when a PMD split is followed
> by PTE remapping, the split flush must happen before the PTEs are
> changed, because stale large-page translations must not overlap with
> new small-page translations that map different physical pages.
> 
> Replace the two flags with a single VMEMMAP_REMAP_NO_TLB_FLUSH flag.
> Keep split-only walks able to defer the flush, but force the split
> flush whenever a remap_pte callback is present. Callers that batch
> HVO work can still defer the final remap flush and issue their own
> global flush.
> 
> Current callers keep the same flushing behavior.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 1105aa925acc..8b3abb562599 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
>   	struct list_head	*vmemmap_pages;
>   
>   
> -/* Skip the TLB flush when we split the PMD */
> -#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
> -/* Skip the TLB flush when we remap the PTE */
> -#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
> +/* Skip the TLB flush while updating the vmemmap page tables. */
> +#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)

Since this flag is now also used by the split-only path, the
VMEMMAP_REMAP_NO_TLB_FLUSH name is somewhat misleading. Moreover, the
flag does not suppress every TLB flush, as the PMD-split flush is still
mandatory when remapping follows.

Would VMEMMAP_DEFER_TLB_FLUSH better describe its semantics? It
indicates that flushes which can be safely batched are deferred, without
implying that all TLB flushes are skipped.

Thanks,
Qi

>   	unsigned long		flags;
>   };
>   
> @@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
>   		/* Make pte visible before pmd. See comment in pmd_install(). */
>   		smp_wmb();
>   		pmd_populate_kernel(&init_mm, pmd, pgtable);
> -		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
> +		/*
> +		 * Modern MMUs allow overlapping TLB entries with different mapping
> +		 * granularities only if they map the same physical address. So
> +		 * remapping must not proceed without first flushing the TLB.
> +		 */
> +		if (walk->remap_pte || !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
>   			flush_tlb_kernel_range(start, start + PMD_SIZE);
>   	} else {
>   		pte_free_kernel(&init_mm, pgtable);
> @@ -272,7 +275,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>   {
>   	struct vmemmap_remap_walk walk = {
>   		.remap_pte	= NULL,
> -		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
> +		.flags		= VMEMMAP_REMAP_NO_TLB_FLUSH,
>   	};
>   
>   	return vmemmap_remap_range(start, end, &walk);

