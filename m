Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602082;
	b=LmE4hnxtUV7KI8f2Ek3swo3Z0nrlOAoX64iU3rvSAM9BkjXn/RQ20K8Mw8MBK/d/aSfy
	 0yqRN7ohTB8i2094Jkbu+vtTFyhP+5vIe+vwHRiuBVHZZtJloNF6Oh2HatJDbIDUTFXxD
	 VVrsi+iG04bibv/S0Eb73f0XcAszlcFyRqa5CAakZtzpypX8NL3CsGNLzJ9aUcQpfSdg0
	 /RMv9nt8P+mO6AzSzvJXF3DXwj9i+O/vYjOu1xZCezp1GTplyW8/kEUrxirqD+ZJo78mv
	 URz0eok39ZlMT6yzjbrU8Vvwk5PbK04cZHkwpk2wWJe7JerBuEpChp5qZzVxDaKcYMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602082;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tARIC+dAqyWZfQ7V1iPzSWAawgTGQCpeaoo4vLHJExw=;
	b=MEcepwozdA+co2fb0+JZ0zZ2qgKGq59LuIMYT2bvs+Q9VwcdaRNyvEFjI2Ms0m4egXL7
	 njyXWYhdBdh1hxGE8Y3EKH+9hivD7wVs6WTq1MIsPH5AMx66356u+Alug38OpNFJMwB+J
	 szXab44+REqIKJavcKzz+cudSU1v55mPKZ0JTHGxGwiysBAbFnIIqcsq9RZNMPgVRQdqt
	 wZ7IjMK2nzh6yCWEQoLdEcpsAWoVZdp08CbY0AhaGiYRXSAjJtkIjySxFc5bNmy+S4QCO
	 HyhQcBYj6bK54sfJE1DZL6nkNHzYfUZy1Um1de1VrcU1/RY1M0/7pHh2yTQV8Uy21Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMQT24qP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE92A606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMQT24qP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC031F000C1;
	Mon,  2 Nov 2026 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602080;
	bh=tARIC+dAqyWZfQ7V1iPzSWAawgTGQCpeaoo4vLHJExw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZMQT24qP57yVV1Fsp6lQWEI+yKTzT7CiP70FBa2wkk3XJBkLivBqhfbLQVU1b792l
	 egkKr+nwcg0yL5I90QDj9SWoJXrPZDfgaU9Ahpw+yeSoGKxW8p+Q645OpGOm+Ou9Rs
	 FfBagOWRyEId8evM2qdx3ErknKAqs74guNA34QRawkHi7rkGXGxU8yXKPYcTHnYYA9
	 wdVQzt7YGtEyqqQmDX1wcHnx6jRr5hRGFqckBAf31Okx6m7VLHkDv/l/TjYBYehsRl
	 65I1ahuEWCW8aBoEA2Bn/7l3v0kWD4b4gH9chLTWw5Hs0b8RvE7YrJAOU/rI1coRTD
	 7Jhsoe/O4ITUg==
Message-ID: <1b4d0299-4232-43eb-9229-7d2a2a7ce2fc@kernel.org>
Date: Mon, 2 Nov 2026 07:47:46 +0100
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
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Byungchul Park <byungchul@sk.com>, Chengming Zhou
 <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>,
 Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>,
 Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>,
 Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>,
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>,
 Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
 Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>,
 Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <1c46e678-1da8-473d-960e-5aa22d4d7e73@kernel.org>
 <20261101123025.4d8133d5321820f2202c8f1a@linux-foundation.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261101123025.4d8133d5321820f2202c8f1a@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/26 21:30, Andrew Morton wrote:
> On Sun, 1 Nov 2026 14:33:57 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> 
>> On 10/30/26 22:34, David Hildenbrand (Arm) wrote:
>>> Hi,
>>>
>>> several MM updates:
>>>
>>
>> @Andrew, should I pick these or do you want to route them through your tree?
> 
> I'll grab for now, thanks.  As a hotfix.
> 
> Because I'm whacking away at MAINTAINERS at present.  First step is to
> consistently name the components, below.
> 
> This is a two-patch series.  The first renames components so everything
> starts with "^MEMORY MANAGEMENT", leaving MAIINTAINERS incorrectly
> sorted.  The second patch only moves things around, to restore the
> alphasorting.
> 
> So people only need look at the first patch.  Please review that.
> 
> After this I'll have it identify the various files under include/linux,
> mm/ and lib/ which can fairly be described as "mm".  That's looking
> like about 50 files at this time.

[...]

> 
> Then I shall have it ensure that all these not-yet-covered files are
> entered in the appropriate place under an MM component.  This may
> require creation of new components for the purpose, tbd.
> 
> After that I needs to have it cover Documentation/
> 
> After that I need to have it whack away at selftests, shudder.

I am not convinced yet that we want that for all tests, which is why I left it
out. There is too much churn that's not really relevant for a component
maintainer POV.

I was rather thinking that maybe we'd want a MM selftest component (likely for
the later MISC maintainer) that picks up the usual selftest churn. Component
maintainers really only have to be CCed on functional things.

> 
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: MAINTAINERS: use a common prefix for MM components
> Date: Sun, 01 Nov 2026 12:13:07 -0800
> 
> Several MM component entries still use standalone headings, so searching
> for headings beginning with "MEMORY MANAGEMENT" misses them.
> 
> Give these 18 entries the common "MEMORY MANAGEMENT - " prefix.  Leave
> them in place for now so that the renames can be reviewed separately
> from the subsequent alphabetical sorting.
> 
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
> 
> ---
> 
>  MAINTAINERS |   36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> --- a/MAINTAINERS~maintainers-use-a-common-prefix-for-mm-components
> +++ a/MAINTAINERS
> @@ -6816,7 +6816,7 @@ T:	git https://gitlab.freedesktop.org/dr
>  F:	include/linux/cgroup_dmem.h
>  F:	kernel/cgroup/dmem.c
>  
> -CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)
> +MEMORY MANAGEMENT - MEMORY RESOURCE CONTROLLER (MEMCG)
>  M:	Johannes Weiner <hannes@cmpxchg.org>
>  M:	Michal Hocko <mhocko@kernel.org>
>  M:	Roman Gushchin <roman.gushchin@linux.dev>
> @@ -7322,7 +7322,7 @@ S:	Maintained
>  W:	https://docs.dasharo.com/
>  F:	drivers/platform/x86/dasharo-acpi.c
>  
> -DAMON
> +MEMORY MANAGEMENT - DAMON
>  M:	SJ Park <sj@kernel.org>
>  L:	damon@lists.linux.dev
>  L:	linux-mm@kvack.org
> @@ -12164,7 +12164,7 @@ S:	Maintained
>  F:	Documentation/ABI/testing/debugfs-hisi-zip
>  F:	drivers/crypto/hisilicon/zip/
>  
> -HMM - Heterogeneous Memory Management
> +MEMORY MANAGEMENT - HMM (Heterogeneous Memory Management)
>  M:	Jason Gunthorpe <jgg@nvidia.com>
>  M:	Leon Romanovsky <leonro@nvidia.com>
>  L:	linux-mm@kvack.org
> @@ -12328,7 +12328,7 @@ F:	drivers/power/supply/huawei-gaokun-ba
>  F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
>  F:	include/linux/platform_data/huawei-gaokun-ec.h
>  
> -HUGETLB SUBSYSTEM
> +MEMORY MANAGEMENT - HUGETLB
>  M:	Muchun Song <muchun.song@linux.dev>
>  M:	Oscar Salvador <osalvador@suse.de>
>  R:	David Hildenbrand <david@kernel.org>
> @@ -12362,7 +12362,7 @@ W:	https://linuxtv.org
>  T:	git git://linuxtv.org/media.git
>  F:	drivers/media/platform/st/sti/hva
>  
> -HWPOISON MEMORY FAILURE HANDLING
> +MEMORY MANAGEMENT - HWPOISON MEMORY FAILURE HANDLING
>  M:	Miaohe Lin <linmiaohe@huawei.com>
>  R:	Naoya Horiguchi <nao.horiguchi@gmail.com>
>  L:	linux-mm@kvack.org
> @@ -17370,7 +17370,7 @@ F:	arch/*/include/asm/sync_core.h
>  F:	include/uapi/linux/membarrier.h
>  F:	kernel/sched/membarrier.c
>  
> -MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
> +MEMORY MANAGEMENT - MEMBLOCK AND INITIALIZATION
>  M:	Mike Rapoport <rppt@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> @@ -17879,7 +17879,7 @@ F:	rust/kernel/mm.rs
>  F:	rust/kernel/mm/
>  F:	rust/kernel/page.rs
>  
> -MEMORY MAPPING
> +MEMORY MANAGEMENT - MEMORY MAPPING
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Liam R. Howlett <liam@infradead.org>
>  M:	Lorenzo Stoakes <ljs@kernel.org>
> @@ -17916,7 +17916,7 @@ F:	mm/vma_internal.h
>  F:	tools/testing/selftests/mm/merge.c
>  F:	tools/testing/vma/
>  
> -MEMORY MAPPING - LOCKING
> +MEMORY MANAGEMENT - MEMORY MAPPING - LOCKING
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Suren Baghdasaryan <surenb@google.com>
>  M:	Liam R. Howlett <liam@infradead.org>
> @@ -17932,7 +17932,7 @@ F:	include/linux/mmap_lock.h
>  F:	include/trace/events/mmap_lock.h
>  F:	mm/mmap_lock.c
>  
> -MEMORY MAPPING - MADVISE (MEMORY ADVICE)
> +MEMORY MANAGEMENT - MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Liam R. Howlett <liam@infradead.org>
>  M:	Lorenzo Stoakes <ljs@kernel.org>
> @@ -18728,7 +18728,7 @@ S:	Maintained
>  F:	drivers/phy/marvell/phy-mmp3-usb.c
>  F:	drivers/phy/marvell/phy-pxa-usb.c
>  
> -MMU GATHER AND TLB INVALIDATION
> +MEMORY MANAGEMENT - MMU GATHER AND TLB INVALIDATION
>  M:	Will Deacon <will@kernel.org>
>  M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>  M:	Andrew Morton <akpm@linux-foundation.org>
> @@ -21113,7 +21113,7 @@ F:	Documentation/core-api/padata.rst
>  F:	include/linux/padata.h
>  F:	kernel/padata.c
>  
> -PAGE CACHE
> +MEMORY MANAGEMENT - PAGE CACHE
>  M:	Matthew Wilcox (Oracle) <willy@infradead.org>
>  M:	Jan Kara <jack@suse.cz>
>  L:	linux-fsdevel@vger.kernel.org
> @@ -21142,7 +21142,7 @@ F:	include/net/page_pool/
>  F:	include/trace/events/page_pool.h
>  F:	net/core/page_pool.c
>  
> -PAGE TABLE CHECK
> +MEMORY MANAGEMENT - PAGE TABLE CHECK
>  M:	Pasha Tatashin <pasha.tatashin@soleen.com>
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  L:	linux-mm@kvack.org
> @@ -21829,7 +21829,7 @@ S:	Maintained
>  F:	Documentation/networking/device_drivers/ethernet/pensando/ionic.rst
>  F:	drivers/net/ethernet/pensando/
>  
> -PER-CPU MEMORY ALLOCATOR
> +MEMORY MANAGEMENT - PER-CPU MEMORY ALLOCATOR
>  M:	Dennis Zhou <dennis@kernel.org>
>  M:	Tejun Heo <tj@kernel.org>
>  M:	Christoph Lameter <cl@gentwo.org>
> @@ -25539,7 +25539,7 @@ T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/rj54n1cb0c.c
>  F:	include/media/i2c/rj54n1cb0c.h
>  
> -SHRINKER
> +MEMORY MANAGEMENT - SHRINKER
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Dave Chinner <david@fromorbit.com>
>  R:	Qi Zheng <qi.zheng@linux.dev>
> @@ -25775,7 +25775,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
>  F:	drivers/nvmem/layouts/sl28vpd.c
>  
> -SLAB ALLOCATOR
> +MEMORY MANAGEMENT - SLAB ALLOCATOR
>  M:	Vlastimil Babka <vbabka@kernel.org>
>  M:	Harry Yoo <harry@kernel.org>
>  M:	Andrew Morton <akpm@linux-foundation.org>
> @@ -29831,7 +29831,7 @@ F:	net/vmw_vsock/
>  F:	tools/testing/selftests/vsock/
>  F:	tools/testing/vsock/
>  
> -VMALLOC
> +MEMORY MANAGEMENT - VMALLOC
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Uladzislau Rezki <urezki@gmail.com>
>  L:	linux-mm@kvack.org
> @@ -30864,7 +30864,7 @@ M:	"Maciej W. Rozycki" <macro@orcam.me.u
>  S:	Maintained
>  F:	drivers/tty/serial/zs.*
>  
> -ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
> +MEMORY MANAGEMENT - ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
>  M:	Minchan Kim <minchan@kernel.org>
>  M:	Sergey Senozhatsky <senozhatsky@chromium.org>
>  L:	linux-mm@kvack.org
> @@ -30887,7 +30887,7 @@ F:	lib/zstd/
>  N:	zstd
>  K:	zstd
>  
> -ZSWAP COMPRESSED SWAP CACHING
> +MEMORY MANAGEMENT - ZSWAP COMPRESSED SWAP CACHING
>  M:	Johannes Weiner <hannes@cmpxchg.org>
>  M:	Yosry Ahmed <yosry@kernel.org>
>  M:	Nhat Pham <nphamcs@gmail.com>
> _
> 

What's up with things like KASAN, KFENCE, KMEMLEAK, KMSAN?

I don't have a good question for that.


-- 
Cheers,

David
