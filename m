Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437702;
	b=bReg7ZF141urFdG+ru7Zz5xgto/hE9el2dM8YHCs91ANf6nTFqKpj4WpeJsZ7lnEogjc
	 OoyJysYbxo7YGLt2NnOqtiW8E/n5QN2b6mE1YDlKM7DNy0dGtzRJHQ5qrgUV+ZP949OoK
	 TfeepSSlLyiBXaAmX4R2Hw12LqAdfFsAM2exDGiBKAxM8Seaus0sk5jsjTS9kLSCFN84T
	 EyaSoQI5sQqAZulAbjQWwLFuXzVosA0SJXmGq0lno5ghRQuV4mkbm3NLjU6Fi7iWG+nVU
	 GmEm91RxYb8QPZySUicpH0l/sOVsvdcRImSnxzlCjnAvWJNsWQ3BC+Xp9KKOoAvf+Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437702;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tm5Bg/j5fUgwCZIJXEdNeBM4C4IjSDPmSRohlhbzh7o=;
	b=OWa0MjMcX6fsE/Vg+CtHM6b/yK84/akc/HPxbVlsK7KZb2xJ0QHb5AEPHD5QbvQ9Zbw6
	 zokXf8GhR60kBIN80z+7ylbBcp1/CcAE/GK65KhWHPTJYK+5XbnOf3ypGBtvfjKx4QJIm
	 H+B+gIH0/Y0ck5TEtN9/MmqFXvni7HE7uV5Hp2VaDCLlVgeBTOL2Qe4pHCDQsN7Al2Ogi
	 dPKyyMKOmmAdlHPK9W5cHJGJQlQwJjWMd8G+wL3WG37FsWbbZDCSl1L1KsMzA6GSb19nn
	 xju9D4zVQaX1Eg67suP9c+EAlFm/wJ5wboYuEbhAdNshVYefAZwkHzdLtWzIOEkppEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Za6UBL4q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBB5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Za6UBL4q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087B31F000C1;
	Sat, 31 Oct 2026 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793437702;
	bh=tm5Bg/j5fUgwCZIJXEdNeBM4C4IjSDPmSRohlhbzh7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Za6UBL4q5Ycah54CTfxr5+sWHe8Spk6G9/PM8TWndexFEz4xe8Ia9QhE7YgOeQfLx
	 QBjpQpZ7zK42HjwtQcv9q5H9iWUAmJoCvett6ZnZ2h1EPXySuTupdbvUejz6CSLyAv
	 ps+J1YQJbUkNmxcYDEnK42bZy0HyeREwHmwQaWQGcPq11yLz76vkzKY5N8egBtrAvm
	 OuJOqZ+3a0o6YiWKa0H73L8AQNSsOZLegMy9g0P5BpVVnGKvj8I3yOiQDMVp2lPB66
	 /nFghzHltrl/jL2BYEVTXpNGTeHPsu2kQ0zIZ8FEWTGgjsuofVB6JTJ2KsXJdV+9pV
	 9nOGaDV2cw20w==
Date: Sat, 31 Oct 2026 09:08:06 +0000
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
Subject: Re: [PATCH 4/7] MAINTAINERS: sort entries in MM sections
Message-ID: <auWqPPYNQlwAOAnm@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-4-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-4-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:28PM +0100, David Hildenbrand (Arm) wrote:
> We try to keep these entries sorted; let's sort the MM related ones.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Oh damn, checkpatch warns for this so I'm surprised these exist, maybe legacy
stuff?

Anyway:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 02b5b542f81ee..bc82ef545e0aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6843,9 +6843,9 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	include/linux/memcontrol.h
>  F:	include/linux/page_counter.h
> -F:	mm/memcontrol.c
>  F:	mm/memcontrol-v1.c
>  F:	mm/memcontrol-v1.h
> +F:	mm/memcontrol.c
>  F:	mm/page_counter.c
>  F:	samples/cgroup/*
>  F:	tools/testing/selftests/cgroup/memcg_protection.m
> @@ -17429,8 +17429,8 @@ F:	Documentation/core-api/memory-hotplug.rst
>  F:	drivers/base/memory.c
>  F:	include/linux/memory_hotplug.h
>  F:	include/linux/memremap.h
> -F:	mm/memremap.c
>  F:	mm/memory_hotplug.c
> +F:	mm/memremap.c
>  F:	tools/testing/selftests/memory-hotplug/
>
>  MEMORY MANAGEMENT
> @@ -17480,6 +17480,7 @@ S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	Documentation/admin-guide/sysctl/vm.rst
> +F:	fs/proc/meminfo.c
>  F:	include/linux/folio_batch.h
>  F:	include/linux/gfp.h
>  F:	include/linux/gfp_types.h
> @@ -17488,16 +17489,15 @@ F:	include/linux/leafops.h
>  F:	include/linux/memory.h
>  F:	include/linux/mm.h
>  F:	include/linux/mm_*.h
> -F:	include/linux/mmzone.h
>  F:	include/linux/mmdebug.h
>  F:	include/linux/mmu_notifier.h
> +F:	include/linux/mmzone.h
>  F:	include/linux/pagewalk.h
>  F:	include/linux/pgalloc.h
>  F:	include/linux/pgtable.h
>  F:	include/linux/ptdump.h
>  F:	include/linux/vmpressure.h
>  F:	include/linux/vmstat.h
> -F:	fs/proc/meminfo.c
>  F:	kernel/fork.c
>  F:	mm/Kconfig
>  F:	mm/debug.c
> @@ -17636,14 +17636,12 @@ F:	Documentation/admin-guide/mm/
>  F:	Documentation/core-api/memory-allocation.rst
>  F:	Documentation/core-api/mm-api.rst
>  F:	Documentation/mm/
> -X:	Documentation/admin-guide/mm/damon/
> -X:	Documentation/mm/damon/
> -F:	mm/char-mem.c
>  F:	include/linux/cma.h
>  F:	include/linux/dmapool.h
>  F:	include/linux/ioremap.h
>  F:	include/linux/page_idle.h
>  F:	mm/backing-dev.c
> +F:	mm/char-mem.c
>  F:	mm/cma.c
>  F:	mm/cma_debug.c
>  F:	mm/cma_sysfs.c
> @@ -17658,6 +17656,8 @@ F:	mm/pgalloc-track.h
>  F:	mm/process_vm_access.c
>  F:	tools/lib/mm/
>  F:	tools/testing/selftests/mm/
> +X:	Documentation/admin-guide/mm/damon/
> +X:	Documentation/mm/damon/
>
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
> @@ -17810,8 +17810,8 @@ F:	include/linux/swapfile.h
>  F:	include/linux/swapops.h
>  F:	mm/page_io.c
>  F:	mm/swap.h
> -F:	mm/swap_table.h
>  F:	mm/swap_state.c
> +F:	mm/swap_table.h
>  F:	mm/swapfile.c
>
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> @@ -17883,10 +17883,10 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> -F:	mm/char-mem.c
> -F:	include/trace/events/mmap.h
>  F:	fs/proc/task_mmu.c
>  F:	fs/proc/task_nommu.c
> +F:	include/trace/events/mmap.h
> +F:	mm/char-mem.c
>  F:	mm/mincore.c
>  F:	mm/mlock.c
>  F:	mm/mmap.c
> @@ -29842,9 +29842,9 @@ S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	include/linux/vmalloc.h
> +F:	lib/test_vmalloc.c
>  F:	mm/vmalloc.c
>  F:	mm/vmalloc.h
> -F:	lib/test_vmalloc.c
>
>  VME SUBSYSTEM
>  L:	linux-kernel@vger.kernel.org
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
