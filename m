Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B81A681B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560790; cv=none; b=AhKSvPxjQSAMvsRviAiNnLJ3tUMxHcoefDInWTftqr6XqyeCDreNLcVNP9RNoS7KFVqNiLQ9t3r6lMD4/UGD3Gsxtjrlh8RNre43CFRFRAaJhP7K7WKJE6owthtvJHYDV0k3yEj3qbUQixHUHpr+S435u9+ypZh5MdhY5X/4q40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560790; c=relaxed/simple;
	bh=BcqFNljILjUCpRPkdS11OgSUczWkfuZ6jLqgRCapH/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cU8Jwqsg+T7VaORDsimTlcyInVUPqAgdsj7XFAtetuQNLEIyAC03wTzOe+rCY7a2gG8zjbUnYccgh8sbHJH/owZljFhmY03wLYq3B8ncKfo6WgUz+XvSfIciJEwmE/oEZIAUpkHs1SWkwn+1LF3kisNjFbzfOKrOLndFGKSjuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uElmx2Qu; arc=none smtp.client-ip=91.218.175.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uElmx2Qu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BcqFNljILjUCpRPkdS11OgSUczWkfuZ6jLqgRCapH/U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790560786; v=1; x=1791165586;
 b=uElmx2QurfqyOBKvVv01kL0GN9zGPkXnf6SJYkbAl1EmIrE5DScIEK6w8GFWLZB8CFXbXkrY
 sDWlS6JocYM9T976nT3Mc9pvDCu7aM+4NgwIvB+nTy0ugAiogEk96kDKqow7fM6hNj++5I0W2HV
 LqoTNJX7I/WGo9C6SQ93x8aw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8140d4f261078bf9;
	Mon, 28 Sep 2026 01:59:46 +0000
X-Mizu-Trace-ID: 8140d4f261078bf9
X-Migadu-Flow: FLOW_OUT
Message-ID: <5b775a0f-322c-45f2-939c-ad508490b4ff@linux.dev>
Date: Mon, 28 Sep 2026 09:59:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mm/mm_init: add zone mismatch warning during page
 init
To: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
 <20260924075259.2013039-7-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260924075259.2013039-7-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/24/26 3:52 PM, Muchun Song wrote:
> For vmemmap-optimized sections, tail struct pages may be backed by
> shared vmemmap pages. Those shared pages must carry the same page zone
> ID as the struct pages initialized for the section.
> 
> Warn in __init_single_page() if the shared tail page has a different
> page_zone_id(), which would indicate inconsistent initialization.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - New patch.
> ---
>   mm/mm_init.c | 3 +++
>   1 file changed, 3 insertions(+)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1650d6bc1211..bd02e8d06965 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
>   	if (!is_highmem_idx(zone))
>   		set_page_address(page, __va(pfn << PAGE_SHIFT));
>   #endif
> +	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
> +			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
> +			page_zone_id(page));
>   }
>   
>   #ifdef CONFIG_NUMA

