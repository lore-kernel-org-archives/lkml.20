Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF1131E49
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481371; cv=none; b=tlRIynS3CXakXpK2b+SzwpEGOORj1P236nOz7gFh+KM1N3JmH5hwsr7xQeRdBqTj3DfZHVGZfqU6N1lduCVEU7VkJC5EhMsKGc8kLMh9PS+DEHSw4pouxPCbR3NSEb392QcNMFPv+hXAP7nSfsrX+gK7FXnjxpQXileHEZ/SYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481371; c=relaxed/simple;
	bh=2uROdXStm7aU7V/9xNpd1opPDVNPcCkRwe09yn3xaCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z6Fkhd+qMfLkRUdkvJr6x1/cZYpzZNn/jYRMEpOiRgcUesBKoZYDXhaRJaRwMFCIUGeY0iLUN7kiFjsnVFkZiCD48XseloH4Mwm9ujhd+/eIsg9FWbly+6QmJsGMh4QVNd9cB7XUADM8Nfu6/ytKSD08w+qcZ9DNqC8ESAJbPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gicqvsBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gicqvsBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B7B1F000E9;
	Fri,  4 Sep 2026 00:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788481369;
	bh=y2BAzD5wHFMDI0Tdchm9F35oeS9pHKExb3hvTSPu/hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gicqvsBymTvjdLcjuS1ruinp8U4tujPXFLCOwmT4AVkN1uVesOw6xKE3DeWiorxrY
	 VZ8U9LWPIvHU6ZIPH5I9drRjGboN+okakuA3rcJks41cdgbB8uCoTjIDf7zkNzPNxR
	 WgaMG41cZAraxhybtzI4zcT8J7B6VqrpJ3zhJVWFbSKe5e4zoHfiXrKJdkR1lLVXxa
	 LIyK4NnyzV0Rx9+M7Oh3Y5pxd3LTB2OcnJdYZfZQ2Ttg8FD/mm7X6NTb8Gi8XhBN51
	 X1s7SCEMnxqG7XoSMl0bMJCtZYYjQ0/ESwVVmNcCJJ98QIfyTEPJAPDyolmquxhBlg
	 EZ6avSmxjLR2A==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm/memory: fix hugetlb_zap_begin() call in zap_vma_range_batched()
Date: Thu,  3 Sep 2026 17:22:35 -0700
Message-ID: <20260904002237.114959-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904000028.149656-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  3 Sep 2026 17:00:26 -0700 SJ Park <sj@kernel.org> wrote:

> Commit f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during
> final unmap") added zap_details parameter to hugetlb_zap_begin().  But
> the hugetlb_zap_begin() call in zap_vma_range_batched() is not updated.
> As a result, build fails as below.  Fix it.
> 
>   CC      mm/memory.o
> .../mm/memory.c: In function ‘zap_vma_range_batched’:
> .../mm/memory.c:2308:9: error: too few arguments to function ‘hugetlb_zap_begin’
>  2308 |         hugetlb_zap_begin(vma, &range.start, &range.end);
>       |         ^~~~~~~~~~~~~~~~~
> In file included from .../mm/memory.c:48:
> .../include/linux/hugetlb.h:253:20: note: declared here
>   253 | static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
>       |                    ^~~~~~~~~~~~~~~~~
> 
> /* TODO: move below to commentary */
> 
> I didn't read the broken commit in depth.  This fix is only
> build-tested.  I wanted to report the issue with this as a temporal fix,
> but the broken commit doesn't have Link: tag.  So directly posting this
> temporal and not very well verified fix first.
> 
> Fixes: Fixes: f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during final unmap")
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index fcf893f4b55e2..151a1bf512e00 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2305,7 +2305,7 @@ void zap_vma_range_batched(struct mmu_gather *tlb,
>  
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>  				address, end);
> -	hugetlb_zap_begin(vma, &range.start, &range.end);
> +	hugetlb_zap_begin(vma, &range.start, &range.end, details);
>  	update_hiwater_rss(vma->vm_mm);
>  	mmu_notifier_invalidate_range_start(&range);
>  	/*

And this is not enough for some configs.

# /home/lkhack/linux/mm/memory.c: In function 'unmap_vmas':
# /home/lkhack/linux/mm/memory.c:2272:3: error: too many arguments to function 'hugetlb_zap_begin'
#  2272 |   hugetlb_zap_begin(vma, &start, &end, &details);
#       |   ^~~~~~~~~~~~~~~~~
# In file included from /home/lkhack/linux/mm/memory.c:48:
# /home/lkhack/linux/include/linux/hugetlb.h:322:20: note: declared here
#   322 | static inline void hugetlb_zap_begin(

Below change fixes the build on the config, too.

'''
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 63c85f2540c9f..0cdccafb83983 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -321,7 +321,8 @@ static inline void adjust_range_if_pmd_sharing_possible(

 static inline void hugetlb_zap_begin(
                                struct vm_area_struct *vma,
-                               unsigned long *start, unsigned long *end)
+                               unsigned long *start, unsigned long *end,
+                               struct zap_details *details)
 {
 }

'''

So more complete version of the patch would look like below.  Forgive me
posting v2 as a reply for this case.  I think this doesn't deserve a new
thread.


Thanks,
SJ

=== >8 ===
From hackermail Thu Jan  1 00:00:00 1970
From: SJ Park <sj@kernel.org>
Date: Thu, 3 Sep 2026 16:52:06 -0700
Subject: [PATCH v2] mm/memory: fix hugetlb_zap_begin() call in zap_vma_range_batched()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Commit f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during
final unmap") added zap_details parameter to hugetlb_zap_begin().  But
the hugetlb_zap_begin() call in zap_vma_range_batched() is not updated.
As a result, build fails as below.

  CC      mm/memory.o
.../mm/memory.c: In function ‘zap_vma_range_batched’:
.../mm/memory.c:2308:9: error: too few arguments to function ‘hugetlb_zap_begin’
 2308 |         hugetlb_zap_begin(vma, &range.start, &range.end);
      |         ^~~~~~~~~~~~~~~~~
In file included from .../mm/memory.c:48:
.../include/linux/hugetlb.h:253:20: note: declared here
  253 | static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
      |                    ^~~~~~~~~~~~~~~~~

It also fails on !CONFIG_HUGETLB_PAGE config.

    .../mm/memory.c: In function 'unmap_vmas':
    .../mm/memory.c:2272:3: error: too many arguments to function 'hugetlb_zap_begin'
     2272 |   hugetlb_zap_begin(vma, &start, &end, &details);
          |   ^~~~~~~~~~~~~~~~~
    In file included from .../mm/memory.c:48:
    .../include/linux/hugetlb.h:322:20: note: declared here
     322 | static inline void hugetlb_zap_begin(

Fixes: Fixes: f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during final unmap")
Signed-off-by: SJ Park <sj@kernel.org>
---
I didn't read the broken commit in depth.  This fix is only
build-tested.  I wanted to report the issue with this as a temporal fix,
but the broken commit doesn't have Link: tag.  So directly posting this
temporal and not very well verified fix first.

Changes from v1
- v1: https://lore.kernel.org/20260904000028.149656-1-sj@kernel.org
- Fix !CONFIG_HUGETLB_PAGE build.

 include/linux/hugetlb.h | 3 ++-
 mm/memory.c             | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 63c85f2540c9f..0cdccafb83983 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -321,7 +321,8 @@ static inline void adjust_range_if_pmd_sharing_possible(
 
 static inline void hugetlb_zap_begin(
 				struct vm_area_struct *vma,
-				unsigned long *start, unsigned long *end)
+				unsigned long *start, unsigned long *end,
+				struct zap_details *details)
 {
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index fcf893f4b55e2..151a1bf512e00 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2305,7 +2305,7 @@ void zap_vma_range_batched(struct mmu_gather *tlb,
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				address, end);
-	hugetlb_zap_begin(vma, &range.start, &range.end);
+	hugetlb_zap_begin(vma, &range.start, &range.end, details);
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
 	/*

base-commit: 2d1388907095f676b59fe6dd22f244abc08408cf
-- 
2.47.3
