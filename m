Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1535F170
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077447; cv=none; b=LOgtaXjLDPXWpmE7YYTc7p198oIf223dDoq5S8TzMbIFEEj71XfH7PP2/Q5KSp+XBlyfJkv/quk9WjsU34oa5EJZ/ZeaN6IIDXBQhG8BKcGcHQgDVEEP8fJrUNYRhUX1vU0ZGNlxq16+pFu5MeaN3+WoG1LW7rknIjjrTtOZwe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077447; c=relaxed/simple;
	bh=vQrYJ4nE2Cel6h951zAr5etcWvIvDq6+aPxFk6o02GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdTQapQWGgkVDcnqHerGH/9wGlzrdiU3HRXnURC0rNmvNtpV5o+f555w8ost6HRYYXuNjZ7zZYdwltTCsKrDwI+B5WbdGIbqXmV79WKwWqg/kw8ymui1AQohXGRQlEx1lPD9leQII+uGBCE+BThAQQoOBMSWcg0Ci3CapslhoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE4XcNzC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE4XcNzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6A31F000FF;
	Tue, 22 Sep 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790077445;
	bh=L5RLJmkn3UUvLlQqkDra9TAVkTvT0dlAwtedfHtKnSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oE4XcNzCMl2sJfDqV9RFSJEjYfMfdqq/nMwYZ1MWsXGUmE7SwiOLl6k/Aj+lTQjTV
	 j+b4WrodzYdyDKW6yVZzQ3pYgJ7zb43b9PXkuyoLiVGw7WEnVM1BzgY2e3lVfnhlql
	 CUPCbVUTH45BQT4Kc8U98iy49kLjdc9g75pgfthUJ7jlvljBiOvT/MyWz89wKfVy1Y
	 z5Ux/PPjRKas0tuKelx6PCc3xwwuoWmb899JEIKHDyg9Byw8rZkwyMDSa92oWr+IK6
	 fIvHpaVtLFfzDQHY2vpvMajsVMNKg+gwQ/7SKds1DkZa1isoHneT8o8KMd0k0bHpzi
	 sR21x5WiIJm5Q==
Message-ID: <625348f9-97c6-4996-8ddd-2e41867e07a0@kernel.org>
Date: Tue, 22 Sep 2026 13:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix typos in various comments
To: Zhijian Han <hanzhijian1991@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 SJ Park <sj@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Alexander Potapenko <glider@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260922031843.2857104-1-hanzhijian1991@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260922031843.2857104-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 05:18, Zhijian Han wrote:
> Fix spelling errors found by codespell in several mm source files:
> 
> - "aray" -> "array" in include/linux/mm.h
> - "indiciate" -> "indicate" in include/linux/mm_types.h
> - "aggresive" -> "aggressive" in include/linux/mm_types.h
> - "progated" -> "propagated" in mm/huge_memory.c
> - "Pressumably" -> "Presumably" in mm/hugetlb.c
> - "fime" -> "time" in mm/hugetlb.c
> - "farest" -> "farthest" in mm/list_lru.c
> - "trivally" -> "trivially" in mm/madvise.c
> - "atmost" -> "at most" in mm/memcontrol.c
> - "splited" -> "split" in mm/memory-failure.c
> - "appliable" -> "applicable" in mm/memory.c
> - "incase" -> "in case" in mm/page_io.c
> - "contigous" -> "contiguous" in mm/vmalloc.c
> - "probablity" -> "probability" in mm/kfence/core.c
> - "widnow" -> "window" in mm/damon/core.c
> - "makrs" -> "marks" in mm/damon/core.c
> - "possesss" -> "possesses" in mm/util.c
> 
> No functional changes.
> 
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> ---
>  include/linux/mm.h       | 2 +-
>  include/linux/mm_types.h | 4 ++--
>  mm/damon/core.c          | 4 ++--
>  mm/huge_memory.c         | 2 +-
>  mm/hugetlb.c             | 4 ++--
>  mm/kfence/core.c         | 2 +-
>  mm/list_lru.c            | 2 +-
>  mm/madvise.c             | 2 +-
>  mm/memcontrol.c          | 2 +-
>  mm/memory-failure.c      | 2 +-
>  mm/memory.c              | 2 +-
>  mm/page_io.c             | 2 +-
>  mm/util.c                | 2 +-
>  mm/vmalloc.c             | 2 +-
>  14 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 87feaa5a2..5b2215e24 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4501,7 +4501,7 @@ static inline void mmap_action_simple_ioremap(struct vm_area_desc *desc,
>   * @desc: The VMA descriptor for the VMA requiring kernel pags to be mapped.
>   * @start: The virtual address from which to map them.
>   * @pages: An array of struct page pointers describing the memory to map.
> - * @nr_pages: The number of entries in the @pages aray.
> + * @nr_pages: The number of entries in the @pages array.
>   */
>  static inline void mmap_action_map_kernel_pages(struct vm_area_desc *desc,
>  		unsigned long start, struct page **pages,
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 939b5ea8c..6c21bab3b 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -759,7 +759,7 @@ static inline struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  /*
>   * While __vma_enter_locked() is working to ensure are no read-locks held on a
>   * VMA (either while acquiring a VMA write lock or marking a VMA detached) we
> - * set the VM_REFCNT_EXCLUDE_READERS_FLAG in vma->vm_refcnt to indiciate to
> + * set the VM_REFCNT_EXCLUDE_READERS_FLAG in vma->vm_refcnt to indicate to
>   * vma_start_read() that the reference count should be left alone.
>   *
>   * See the comment describing vm_refcnt in vm_area_struct for details as to
> @@ -1968,7 +1968,7 @@ enum {
>  /*
>   * MMF_HAS_PINNED: Whether this mm has pinned any pages.  This can be either
>   * replaced in the future by mm.pinned_vm when it becomes stable, or grow into
> - * a counter on its own. We're aggresive on this bit for now: even if the
> + * a counter on its own. We're aggressive on this bit for now: even if the
>   * pinned pages were unpinned later on, we'll still keep this bit set for the
>   * lifecycle of this mm, just for simplicity.
>   */
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 644daf5a1..c01b7e2a1 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2328,7 +2328,7 @@ static bool damos_valid_target(struct damon_ctx *c, struct damon_region *r,
>   * This function checks if a given region should be skipped or not for the
>   * reason.  If only the starting part of the region has previously charged,
>   * this function splits the region into two so that the second one covers the
> - * area that not charged in the previous charge widnow, and return true.  The
> + * area that not charged in the previous charge window, and return true.  The

"that not" sound weird. Fix that while at it.

Apart from that LGTM.

-- 
Cheers,

David
