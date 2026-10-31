Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443882;
	b=j5vIvwJdU9EskAcEDiCKacXv+wU4Y0WfH0GJy2Fvtdk36etp3aExDdxiyI5UJ5X93+TG
	 CGPCg4gBlzU44Oyfjy5yALOjw6qnC48Z0PPvxnTBhGQmPduz5YrEbw0zZ06lFBT+x134h
	 JsXdbsY1r92oj6kspDgcFzOSwFFOElNFa/3UZaiRzUtm9lKp9xMWmwBse+silSNFu2oHR
	 rzbTplps9Lqgo8PXNC4DyUYHwgAf9bTVSMpu1vz4yObnAnxEQ+xNthwQRHHsFo1Zp9M9c
	 LoYX8drp0b6qB82fB02HAE1eQ5YpiR7H4vKQomzKV7rGmPV0lITU3crKQceJO4yCWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443882;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GJfWazGdUI7keV3g8AbsyvSUWQ0SKJj/fzlMxSdGma8=;
	b=e2n89H/o8eR5zvCYnnSY6WvuS+xoPEbQJV1v+g2cjUPjymVZy5hf4Ci/l+GbYzGJ19Nj
	 XL3OHOoA1JaqXqV6f0xWenR26l72+1IM+ZMEtpvefCEv5x+83na0MYz8k32IdmAfCLEGC
	 mTk6P3hPR7rAHwRZQFvl6d6cDyF+fAuRY6MAcbhbzwdCDxABqxkBzXiqb1twxSL+77JAg
	 74894sKx/StS1bA4Aa+OWsMslmyOFmpdsbgXHSA2Hv2iUo5OGSeiGk/Ky5UAjPYxjYW+n
	 VLmLxucVrgA9zOaU1ZVkQXZeZ4O8L2yvAtBUkOYOJf9Jlw19tX06YhQoh5kfA/E1vBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APx9dNUb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DCF606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APx9dNUb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E37F1F00919;
	Sat, 31 Oct 2026 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793443881;
	bh=GJfWazGdUI7keV3g8AbsyvSUWQ0SKJj/fzlMxSdGma8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=APx9dNUbT7yZLB/p2GSjvVjuw7LZThTTfcI0IfJOtAItDN44ti8ZXwWN/0c7by3tN
	 p4+LL9UVyELty38TxXOBsRGVLacUu9NNoJ9oB7guKvq1atTb755L6myuZ5PKejS9mj
	 Rz3/jd+XHdmj6hi3rxbOoY+5jOuMqpM+BjAvYjVGqcYCz7hhsPXtO3Jsfgm1LeGFcx
	 2+B5RkkIi9ziKbLkktFBECWAQap7Fe50mAdoFoz65Www1BSZGF/Hp2MNwV1bWbsYbo
	 i9vIOK2RPNuMHhN9Prsw+WbKpA1fT1yy0xXFzs5M9kszTgEl2oWrkw9ag0D2NOkawU
	 eTw4ornuUwqyw==
Date: Sat, 31 Oct 2026 10:51:06 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Byungchul Park <byungchul@sk.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Dave Chinner <david@fromorbit.com>, David Rientjes <rientjes@google.com>, 
	Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Matthew Brost <matthew.brost@intel.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, Nick Piggin <npiggin@gmail.com>, 
	Nico Pache <nico.pache@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
	Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Will Deacon <will@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 7/7] MAINTAINERS: route more MM changes through
 mm/core.git
Message-ID: <auWz3J5Jrv3_grER@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-7-97278f8a5f54@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-maintainers-v1-7-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:31PM +0100, David Hildenbrand (Arm) wrote:
> Let's start routing more components I (co)maintain through mm/core.git.
> Update the git trees by pointing them at the for-next branch:
>
>  - MEMORY MANAGEMENT - BALLOON
>  - MEMORY MANAGEMENT - CORE
>  - MEMORY MANAGEMENT - GUP (GET USER PAGES)
>  - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>  - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
>  - MEMORY MANAGEMENT - MIGRATION
>  - MEMORY MANAGEMENT - NUMA PLACEMENT
>  - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>  - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>
> Leave out MISC for now.

Aww :(

We do need to move as much as we can out of there over time, is really the
catch-all obviously.

>
> This change doesn't imply that all changes to these components will
> immediately be routed through that tree; in particular changes that cover
> other components, or severe conflicts will require coordination with
> Andrew's tree.
>
> So this marks merely the start of "mm/core.git will start picking
> relevant material for these components".
>
> Remove Andrew from these components to set the expectation that he won't be
> the primary person picking stuff for these components; he is listed as
> maintainer under the generic "MEMORY MANAGEMENT" and will get CCed on most
> changes, and can keep an eye on stuff that falls through the cracks
> (thanks!).
>
> While at it, drop the link to http://www.linux-mm.org: it's not
> particularly useful in 2026.

:))

>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 31 +++++++++----------------------
>  1 file changed, 9 insertions(+), 22 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0adc674304987..b68bc36267091 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17446,18 +17446,15 @@ F:	mm/alloc_tag.c
>  F:	tools/testing/selftests/alloc_tag/
>
>  MEMORY MANAGEMENT - BALLOON
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  L:	linux-mm@kvack.org
>  L:	virtualization@lists.linux.dev
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	include/linux/balloon.h
>  F:	mm/balloon.c
>
>  MEMORY MANAGEMENT - CORE
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  R:	Lorenzo Stoakes <ljs@kernel.org>
>  R:	Liam R. Howlett <liam@infradead.org>
> @@ -17467,8 +17464,7 @@ R:	Suren Baghdasaryan <surenb@google.com>
>  R:	Michal Hocko <mhocko@suse.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/admin-guide/sysctl/vm.rst
>  F:	Documentation/core-api/gfp_mask-from-fs-io.rst
>  F:	fs/proc/meminfo.c
> @@ -17526,15 +17522,13 @@ F:	include/linux/execmem.h
>  F:	mm/execmem.c
>
>  MEMORY MANAGEMENT - GUP (GET USER PAGES)
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  R:	Jason Gunthorpe <jgg@nvidia.com>
>  R:	John Hubbard <jhubbard@nvidia.com>
>  R:	Peter Xu <peterx@redhat.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/core-api/pin_user_pages.rst
>  F:	mm/gup.c
>  F:	mm/gup_test.c
> @@ -17544,14 +17538,12 @@ F:	tools/testing/selftests/mm/gup.c
>  F:	tools/testing/selftests/mm/gup_longterm.c
>
>  MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  R:	Xu Xin <xu.xin@linux.dev>
>  R:	Chengming Zhou <chengming.zhou@linux.dev>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-ksm
>  F:	Documentation/admin-guide/mm/ksm.rst
>  F:	Documentation/mm/ksm.rst
> @@ -17566,6 +17558,7 @@ M:	Oscar Salvador <osalvador@suse.de>
>  L:	linux-mm@kvack.org
>  L:	linux-cxl@vger.kernel.org
>  S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/ABI/testing/sysfs-devices-memory
>  F:	Documentation/admin-guide/mm/memory-hotplug.rst
>  F:	Documentation/core-api/memory-hotplug.rst
> @@ -17614,7 +17607,6 @@ F:	mm/vmscan.c
>  F:	mm/workingset.c
>
>  MEMORY MANAGEMENT - MIGRATION
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  R:	Zi Yan <ziy@nvidia.com>
>  R:	Matthew Brost <matthew.brost@intel.com>
> @@ -17625,8 +17617,7 @@ R:	Ying Huang <ying.huang@linux.alibaba.com>
>  R:	Alistair Popple <apopple@nvidia.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	include/linux/migrate.h
>  F:	include/linux/migrate_mode.h
>  F:	include/trace/events/migrate.h
> @@ -17698,7 +17689,6 @@ F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>
>  MEMORY MANAGEMENT - NUMA PLACEMENT
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  M:	Gregory Price <gourry@gourry.net>
>  R:	Zi Yan <ziy@nvidia.com>
> @@ -17707,8 +17697,7 @@ R:	Rakie Kim <rakie.kim@sk.com>
>  R:	Ying Huang <ying.huang@linux.alibaba.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
> @@ -17782,7 +17771,6 @@ F:	mm/vmscan.c
>  F:	mm/workingset.c
>
>  MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  M:	Lorenzo Stoakes <ljs@kernel.org>
>  R:	Rik van Riel <riel@surriel.com>
> @@ -17793,6 +17781,7 @@ R:	Jann Horn <jannh@google.com>
>  R:	Lance Yang <lance.yang@linux.dev>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	include/linux/rmap.h
>  F:	mm/interval_tree.c
>  F:	mm/page_vma_mapped.c
> @@ -17850,7 +17839,6 @@ F:	mm/swap_table.h
>  F:	mm/swapfile.c
>
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> -M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
>  M:	Zi Yan <ziy@nvidia.com>
>  R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> @@ -17864,8 +17852,7 @@ R:	Usama Arif <usama.arif@linux.dev>
>  R:	Kiryl Shutsemau <kas@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -W:	http://www.linux-mm.org
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
>  F:	Documentation/admin-guide/mm/transhuge.rst
>  F:	include/linux/huge_mm.h
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
