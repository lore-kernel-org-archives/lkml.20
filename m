Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08F549F13E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289946; cv=none; b=NtuH1Q9fkY0QSbrpiltoA6eCGIAPRYdbjQX7ggtt0+45ZN51CA1e85deaQOanm3yq7jvS1c06PQEayilZ8lQjRzwR4tKsuT53RQzYdTZtMdL6NgUs3nnB+ceYfq5zfsBVjhG+4KidUvYBPIBbr4fDPQuVJZBXt/fj8ZkmQBbVWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289946; c=relaxed/simple;
	bh=1Bct/eYotZ5onSD+9MiW+994kAjYNbAylDxmTAwzXaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgMbPqQe3EmYIdFR+xL1wtyr7FiOv/XjZUhyQ/Yt4kn346l3erpcvqEzQHON1q2QMaYDUoQI0/32rZwzfY/e7NdpsF2/GQL2140GVzWeee2/cCf3MeA7MEe9qTaZt/o7lzlP/BkA9loRjiHUJUUJqWdIpN9uT6kMvssaSMtD+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q3U6W42N; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q3U6W42N"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1309565e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788289937; x=1788894737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/zPvklJyA4CfeLH5aidlGEqSmPD1mECtHvc2+1X4NxU=;
        b=Q3U6W42NYGAYUewk1cEaeKZd+QMg0XyF+Dp6dmmrp4uIF+ZwFuZ9FkN2hMymSnjME+
         +EvcjZ0gNiyAFvD7hJrV4rczEFhljvqNafloDTAzkuaIv3U2tQVsqWoWa64pTqjPTjT+
         BybjBesBMrIy//M+BV2gM4Q7v4SRbolqQKJbGWGq/DUrs8UtlWRh0uV4c3Xa6bWkwC/X
         x6orqDIyRU3nixdm+ZhID9yS3NFRGR2Eqgd+1wF0J+Me9L45yjc8EtFNFfFBneNdxvOV
         XWuHn8O1Gi7OYrCk7w6+T5xZNtK2N75K9UjlYf5hk2NJqfkC0d7adyI8NZQHERQmytFx
         HoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289937; x=1788894737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zPvklJyA4CfeLH5aidlGEqSmPD1mECtHvc2+1X4NxU=;
        b=VC8kCCfIfe8XduCj9gqRnB8LMiCyM0KSp9D8i1HwY804EAbEDnbZ1sXwF9cTBYeEkP
         B0cBepYueOSDibzW3FyglkeYm8KCIe0WZtVeKW5o7GPCqX5DtOm5MBKWqPBgteRGNzbZ
         Ars8uw146s5QRYc07qIBZV+JsR5MWCjIArnLXGDzvEpR3nCMJsQ1kTBW6ZR0qFNGSS6u
         K51sqLEleQ4hkXwZyoUzx2EpTGSk1d0HnJGecbj6Kgg57mAD/18cBsFk2j9Uk8E27q+O
         wqoOyRlZbW1kMrYDXpMjhtyjMaaoj2lbO22TUZwz4bw2+R4wHWQBnVyvaSkJR14zgNxB
         nglg==
X-Forwarded-Encrypted: i=1; AHgh+RqNYoY/4vPJzBQAaF9toiwBFsDijehFvF74e1NmAJ08zGCzMyeMoWbt700o13e5VI5ULeuDOy1YkBhUouU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBaIgJq1JypXPkftC9LAK+GlLMFBnRXAZq6H0xHzNiuHy8lpIN
	l4BehAumRIoKfeLyre99qNQySo5vnEcl0VAMSNBHrJhzl2inZMdWMLj/xfpIlmw9YAY=
X-Gm-Gg: AR+sD10XmieTqj/fnmy6hziWjKYgWkVyF/3XslVhbSyZA3ewBte7cbHveDx3VOaQw9J
	afUUH3GA02lAS98sJ4Y8inbgECNn0iFH7LjmbD/4eXXlHPXTT02rzVqFZklNTED7z7iT376fOTJ
	SbhHotfprQGuV9DNDhgZmj5eQbxovkjZER2VyGWpix4jXe6DaO9jsbodt9vtuaoQm3KBwf+em37
	FWeZu3ZpF87xjZoT2JUshp/oHFKGTPe0xR+xm4t/jRoI8graw8vNXQOvOxuhMDgQ1/AxUA4cQA2
	RqcbxBmrX4J/krdC34/J/hnsVjRcvpjmIm4kRQfTdM5wqClt6MSXVHzNSGmA3WPTLSDn4R4LZbp
	vQ4lsfb/MZTL/69M/Ga9zsnHHJkvfldIK+lUjLrTI/JXz66gATNJPI6UihHtTUp/Co2AnkLtkYu
	LKcaaGm7xuM8NS0kjtNsL60YkF8Axltp4YsRkm5js6wuBNB94DLrOu9CJSVCQOOMs2eWyY0x8=
X-Received: by 2002:a05:600c:c3cf:10b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49b91c47b76mr454139925e9.12.1788289937383;
        Tue, 01 Sep 2026 12:12:17 -0700 (PDT)
Received: from localhost (109-81-87-32.rct.o2.cz. [109.81.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85892425e9.5.2026.09.01.12.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:12:16 -0700 (PDT)
Date: Tue, 1 Sep 2026 21:12:15 +0200
From: Michal Hocko <mhocko@suse.com>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <apcjj-BbgPuh6j1B@tiehlicka>
References: <20260901190123.3511535-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901190123.3511535-1-noren@nvidia.com>

On Tue 01-09-26 22:01:23, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> heuristic to help keep pageblocks free and reduce fragmentation for THP
> allocations.
> 
> The recommendation scales poorly with larger base page sizes. With the
> default arm64 pageblock sizes, the contribution per eligible zone
> before applying the existing cap of 5% of low memory is:
> 
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Even with that cap, min_free_kbytes can reach excessive levels.
> 
> The automatic min_free_kbytes increase predates proactive compaction
> and many subsequent changes to compaction. Given those changes,
> increasing min_free_kbytes for THP by default is no longer clearly
> justified.
> 
> Remove set_recommended_min_free_kbytes() and all associated
> recalculation paths. With this policy gone, min_free_kbytes is
> controlled only by the page allocator's default calculation and the
> vm.min_free_kbytes sysctl. Users who want additional headroom may set a
> higher value via that sysctl.
> 
> Link: https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.com/
> Suggested-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Nimrod Oren <noren@nvidia.com>

I think this is definitely worth try. Let's see if this leads to any
sort of regressions. I am aware of setups where people were actively
fighting against this increased value so let's see who might just depend
on that without knowing.

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
> v3:
> * Replace the 1 GiB cap with removal of the THP-driven min_free_kbytes
>   increase as suggested by Michal.
> * Remove all associated recalculation paths.
> * Make min_free_kbytes, user_min_free_kbytes,
>   calculate_min_free_kbytes(), and setup_per_zone_wmarks() static.
> * Drop the now-unused declarations and khugepaged's page_alloc.h include.
> * Drop the obsolete v2 documentation addition.
> 
> v2:
> * Use a named constant for the cap.
> * Drop explicit linux/sizes.h include.
> * Update min_free_kbytes documentation.
> https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.com/
> 
> v1:
> * Cap the final recommendation at 1 GiB as suggested by Lorenzo.
> https://lore.kernel.org/r/20260728202014.2517142-1-noren@nvidia.com/
> 
> RFC v1:
> https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/
> ---
>  include/linux/khugepaged.h |  5 ----
>  mm/huge_memory.c           | 14 ---------
>  mm/internal.h              |  8 -----
>  mm/khugepaged.c            | 60 --------------------------------------
>  mm/page_alloc.c            | 11 +++----
>  mm/page_alloc.h            |  2 --
>  mm/shmem.c                 |  7 -----
>  7 files changed, 4 insertions(+), 103 deletions(-)
> 
> diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
> index d7a9053ff4fe..e2a2ccb6cd05 100644
> --- a/include/linux/khugepaged.h
> +++ b/include/linux/khugepaged.h
> @@ -15,7 +15,6 @@ extern void __khugepaged_enter(struct mm_struct *mm);
>  extern void __khugepaged_exit(struct mm_struct *mm);
>  extern void khugepaged_enter_vma(struct vm_area_struct *vma,
>  				 vm_flags_t vm_flags);
> -extern void khugepaged_min_free_kbytes_update(void);
>  extern bool current_is_khugepaged(void);
>  void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  		bool install_pmd);
> @@ -47,10 +46,6 @@ static inline void collapse_pte_mapped_thp(struct mm_struct *mm,
>  {
>  }
>  
> -static inline void khugepaged_min_free_kbytes_update(void)
> -{
> -}
> -
>  static inline bool current_is_khugepaged(void)
>  {
>  	return false;
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index c5d11147b69a..b1f87e005e03 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -499,13 +499,6 @@ static ssize_t enabled_store(struct kobject *kobj,
>  
>  		if (err)
>  			return err;
> -	} else {
> -		/*
> -		 * Recalculate watermarks even when the mode didn't
> -		 * change, as the previous code always called
> -		 * start_stop_khugepaged() which does this internally.
> -		 */
> -		set_recommended_min_free_kbytes();
>  	}
>  	return count;
>  }
> @@ -735,13 +728,6 @@ static ssize_t anon_enabled_store(struct kobject *kobj,
>  
>  		if (err)
>  			return err;
> -	} else {
> -		/*
> -		 * Recalculate watermarks even when the mode didn't
> -		 * change, as the previous code always called
> -		 * start_stop_khugepaged() which does this internally.
> -		 */
> -		set_recommended_min_free_kbytes();
>  	}
>  
>  	return count;
> diff --git a/mm/internal.h b/mm/internal.h
> index e16f1250b25c..6890d7836c68 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -689,11 +689,6 @@ int user_proactive_reclaim(char *buf,
>   */
>  pmd_t *mm_find_pmd(struct mm_struct *mm, unsigned long address);
>  
> -/*
> - * in mm/khugepaged.c
> - */
> -void set_recommended_min_free_kbytes(void);
> -
>  /*
>   * in mm/page_alloc.c
>   */
> @@ -701,11 +696,8 @@ void set_recommended_min_free_kbytes(void);
>  
>  extern char * const zone_names[MAX_NR_ZONES];
>  
> -extern int min_free_kbytes;
>  extern int defrag_mode;
>  
> -void setup_per_zone_wmarks(void);
> -void calculate_min_free_kbytes(void);
>  int __meminit init_per_zone_wmark_min(void);
>  
>  extern int __isolate_free_page(struct page *page, unsigned int order);
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index f49a6710933b..c36b7d0b91d7 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -27,7 +27,6 @@
>  
>  #include <asm/tlb.h>
>  #include "internal.h"
> -#include "page_alloc.h"
>  #include "mm_slot.h"
>  
>  enum scan_result {
> @@ -3086,57 +3085,6 @@ static int khugepaged(void *none)
>  	return 0;
>  }
>  
> -void set_recommended_min_free_kbytes(void)
> -{
> -	struct zone *zone;
> -	int nr_zones = 0;
> -	unsigned long recommended_min;
> -
> -	if (!hugepage_enabled()) {
> -		calculate_min_free_kbytes();
> -		goto update_wmarks;
> -	}
> -
> -	for_each_populated_zone(zone) {
> -		/*
> -		 * We don't need to worry about fragmentation of
> -		 * ZONE_MOVABLE since it only has movable pages.
> -		 */
> -		if (zone_idx(zone) > gfp_zone(GFP_USER))
> -			continue;
> -
> -		nr_zones++;
> -	}
> -
> -	/* Ensure 2 pageblocks are free to assist fragmentation avoidance */
> -	recommended_min = pageblock_nr_pages * nr_zones * 2;
> -
> -	/*
> -	 * Make sure that on average at least two pageblocks are almost free
> -	 * of another type, one for a migratetype to fall back to and a
> -	 * second to avoid subsequent fallbacks of other types There are 3
> -	 * MIGRATE_TYPES we care about.
> -	 */
> -	recommended_min += pageblock_nr_pages * nr_zones *
> -			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
> -
> -	/* don't ever allow to reserve more than 5% of the lowmem */
> -	recommended_min = min(recommended_min,
> -			      (unsigned long) nr_free_buffer_pages() / 20);
> -	recommended_min <<= (PAGE_SHIFT-10);
> -
> -	if (recommended_min > min_free_kbytes) {
> -		if (user_min_free_kbytes >= 0)
> -			pr_info_ratelimited("raising min_free_kbytes from %d to %lu to help transparent hugepage allocations\n",
> -					    min_free_kbytes, recommended_min);
> -
> -		min_free_kbytes = recommended_min;
> -	}
> -
> -update_wmarks:
> -	setup_per_zone_wmarks();
> -}
> -
>  int start_stop_khugepaged(void)
>  {
>  	guard(mutex)(&khugepaged_mutex);
> @@ -3160,17 +3108,9 @@ int start_stop_khugepaged(void)
>  		kthread_stop(khugepaged_thread);
>  		khugepaged_thread = NULL;
>  	}
> -	set_recommended_min_free_kbytes();
>  	return 0;
>  }
>  
> -void khugepaged_min_free_kbytes_update(void)
> -{
> -	guard(mutex)(&khugepaged_mutex);
> -	if (hugepage_enabled() && khugepaged_thread)
> -		set_recommended_min_free_kbytes();
> -}
> -
>  bool current_is_khugepaged(void)
>  {
>  	return kthread_func(current) == khugepaged;
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index c4dc61ec663e..5280784c91a8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -50,7 +50,6 @@
>  #include <linux/ftrace.h>
>  #include <linux/lockdep.h>
>  #include <linux/psi.h>
> -#include <linux/khugepaged.h>
>  #include <linux/delayacct.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/pgalloc_tag.h>
> @@ -272,8 +271,8 @@ const char * const migratetype_names[MIGRATE_TYPES] = {
>  #endif
>  };
>  
> -int min_free_kbytes = 1024;
> -int user_min_free_kbytes = -1;
> +static int min_free_kbytes = 1024;
> +static int user_min_free_kbytes = -1;
>  static int watermark_boost_factor __read_mostly = 15000;
>  static int watermark_scale_factor = 10;
>  int defrag_mode;
> @@ -6663,7 +6662,7 @@ static void __setup_per_zone_wmarks(void)
>   * Ensures that the watermark[min,low,high] values for each zone are set
>   * correctly with respect to min_free_kbytes.
>   */
> -void setup_per_zone_wmarks(void)
> +static void setup_per_zone_wmarks(void)
>  {
>  	struct zone *zone;
>  	static DEFINE_SPINLOCK(lock);
> @@ -6704,7 +6703,7 @@ void setup_per_zone_wmarks(void)
>   * 8192MB:	11584k
>   * 16384MB:	16384k
>   */
> -void calculate_min_free_kbytes(void)
> +static void calculate_min_free_kbytes(void)
>  {
>  	unsigned long lowmem_kbytes;
>  	int new_min_free_kbytes;
> @@ -6732,8 +6731,6 @@ int __meminit init_per_zone_wmark_min(void)
>  	setup_min_slab_ratio();
>  #endif
>  
> -	khugepaged_min_free_kbytes_update();
> -
>  	return 0;
>  }
>  postcore_initcall(init_per_zone_wmark_min)
> diff --git a/mm/page_alloc.h b/mm/page_alloc.h
> index b9259deddb59..86162e6cfa8c 100644
> --- a/mm/page_alloc.h
> +++ b/mm/page_alloc.h
> @@ -227,8 +227,6 @@ void post_alloc_hook(struct page *page, unsigned int order, gfp_t gfp_flags,
>  		     unsigned int alloc_flags);
>  extern bool free_pages_prepare(struct page *page, unsigned int order);
>  
> -extern int user_min_free_kbytes;
> -
>  struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order, int nid,
>  		nodemask_t *nodemask, unsigned int alloc_flags);
>  #define __alloc_frozen_pages(...) \
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 255d69ebceba..92dc770b10e6 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5782,13 +5782,6 @@ static ssize_t thpsize_shmem_enabled_store(struct kobject *kobj,
>  		int err = start_stop_khugepaged();
>  		if (err)
>  			return err;
> -	} else {
> -		/*
> -		 * Recalculate watermarks even when the mode hasn't changed
> -		 * to preserve the legacy behavior, as this is always called
> -		 * inside start_stop_khugepaged().
> -		 */
> -		set_recommended_min_free_kbytes();
>  	}
>  
>  	return count;
> -- 
> 2.45.0

-- 
Michal Hocko
SUSE Labs
