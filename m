Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAAD41685B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791664945; cv=none; b=VpLN8MipQBzz5447lNUTIfCU0/OxtR/mRsnzKc5/f/z0sSCaDgMbNVFRgzA1J28cdCdXUtQlfyOahNxlrK/CkBJHI2Tghg0hs0GT4TFjxbfUkSh2jeEzCDHrZj7cdMBp7Ezfg9DxX4tjtMjeFQshnn7o/8RMGdyJkWRWYQDVsZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791664945; c=relaxed/simple;
	bh=v1ymWsKW63A8MOrrRvFTmqsOaMqs2jH6fAtmQ+2ssag=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=P0dK/ClvZXVXmU+tfRwzPLDbzSlHT74mXtTLBOkK6YIzRgxyJJQPsGcypY2BaLKd/YjrcnZSbpUvFkD3nqwRA6kb7M2yHDjZhrC8llUt+9wWFWaJbf7+gMQ1JChc90bfAYOAqjdGVUT67R3d3fTIZ8jpU0MNzx/P8wKVVT0XT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RmLqUv8s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RmLqUv8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A691F000FF;
	Sat, 10 Oct 2026 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791664943;
	bh=KaeVwRqfGMljaxW8Ah6Cx9zT6uiRBSSC1dP0zE7Q/ko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RmLqUv8syW5KCaLrBRHaqB+hdxZmebnLFbyFQcAzsE8K8GyM/v72kmzM2p52+uyUk
	 JY4X3rsdpU0z8m/Mytez5hAFfN73+lJQkTAJ2ZdwOIQwtDH7dUz67d2wNhBrUxR1xC
	 zb3jPxE5vNJ3UNmy+gKrU8kH2wFXF/E3KA17J4EE=
Date: Sat, 10 Oct 2026 13:42:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport
 <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, Lance Yang
 <lance.yang@linux.dev>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
Subject: Re: [PATCH v4 0/6] mm: Unify device DAX and HugeTLB vmemmap
 population paths
Message-Id: <20261010134222.b6fdcb20d8fec5aaceab66ec@linux-foundation.org>
In-Reply-To: <20261010075755.83339-1-songmuchun@bytedance.com>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 Oct 2026 15:57:49 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> This v4 is based on mm-new commit d5207c6d152c, which contains v6 of
> "mm: Switch device DAX to section-based vmemmap optimization" [1].
> 
> This series is split out from the earlier, larger series "mm: Generalize
> HVO for HugeTLB and device DAX" [2]. While the parent series generalizes
> vmemmap optimization across HugeTLB and device DAX, this subset addresses
> a single, self-contained step: unifying their vmemmap population paths.
> 
> After the preceding Device DAX conversion, both HugeTLB and Device DAX
> describe optimized vmemmap mappings through memory-section metadata and
> use per-zone shared tail vmemmap pages. The generic code, however, still
> carries a Device DAX-specific population flag and compound-page population
> path, along with arguments and helpers needed only by that path.
> 
> This series first removes VMEMMAP_POPULATE_DAX and moves selection and
> reference handling for the shared tail page into the common vmemmap
> population path. It then removes the generic Device DAX-specific
> compound-page population path and routes section vmemmap population
> through vmemmap_populate(). The powerpc radix path continues to use its
> architecture-specific compound-page population implementation for
> optimizable sections.
> 
> The remaining patches remove the unused ptpfn argument, open-code
> vmemmap_populate_address() now that no caller needs its returned PTE, and
> add a warning for inconsistent zone initialization of shared tail vmemmap
> pages.
> 
> This is the fourth smaller step toward the broader HVO generalization.
> After this series, HugeTLB and Device DAX use the same population model
> instead of parallel generic paths, while powerpc keeps its
> architecture-specific implementation.

Thanks, I've updated mm-unstable to this version, including the -fix.

> v4:
> - Rebase onto mm-new commit d5207c6d152c, which contains v6 of the Device
>   DAX section-based vmemmap series.
> - Factor the zone mismatch check into a local helper as suggested by Mike
>   Rapoport.
> - Collect Reviewed-by tags from Lance Yang.

Here's how v4 altered mm.git:


 mm/mm_init.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

--- a/mm/mm_init.c~b
+++ a/mm/mm_init.c
@@ -593,6 +593,15 @@ out:
 	node_states[N_MEMORY] = saved_node_state;
 }
 
+static inline void vmemmap_optimization_verify_zone(struct page *page)
+{
+	const unsigned int order = pfn_to_section_compound_order(page_to_pfn(page));
+
+	VM_WARN_ON_ONCE(vmemmap_optimizable_order(order) &&
+			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
+			page_zone_id(page));
+}
+
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid)
 {
@@ -609,9 +618,11 @@ void __meminit __init_single_page(struct
 	if (!is_highmem_idx(zone))
 		set_page_address(page, __va(pfn << PAGE_SHIFT));
 #endif
-	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
-			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
-			page_zone_id(page));
+	/*
+	 * Shared tail struct pages are initialized during vmemmap population,
+	 * before retained struct pages reach here.
+	 */
+	vmemmap_optimization_verify_zone(page);
 }
 
 #ifdef CONFIG_NUMA
_

