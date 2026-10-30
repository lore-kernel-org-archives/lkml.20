Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396162;
	b=1IJykUYxKN5N5xpcgfOCNtwFWmXJvNpMWZiRY6nbPNheq5wk6LeCeC4XKEl1yv7BC0JC
	 HvRf/ihxnienTnbGhHZ7g6mohvNs8urpIcq7S64xGZtTrHKmes4YhPTBV11vq4eQiQfQv
	 ZKlACU0QYLlxFYvou+TvUBl35rZ9kqU38gsuvirNORQ5TQpvWJuQ7CjdCrP+ZIlPdeIyE
	 zU4qSSw/AIXoMKIaR93S9dAsacHml9iYiNTSJBu1HYWjm0rUxAzVidtlLoT3PhXIt5bCo
	 vuBhg2mjIHQlYPXrrlKo0sEmlMcBWoTP46ib0UW1OataO2O3eT/0GGSm7G0GFxs3MgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396162;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q1bSxUxjIuldipfMHFleRTGSs2OhlVbOb3KEpj5IUk4=;
	b=ijkGMwGG/h0Vn4+NAtJBM9r0grlMfeAGpEYuLbGz+I/46lTpau6nhYGes2V/vR+qwyGe
	 u46+Gg8F1CJLCgWZefFgfIf1VmWZHD9y+UiR0IUyGsvbGWLElP5V/gI5RJwxTJE0FUTTc
	 tg5T2rk4XUuuIFu0D3ntdNBVLdlq1BAoNVd7NXCcyoOmVF+XzYRlACXhsNueOFP5UtcLL
	 ULfZaTtxzik+dcTQSRmB0E1qicnMUHSQCBOCUKg+/io96v7Oq2mJL7nKhVwL1sjghzYvA
	 9kepvFPmJ7Hub2r4HA4NtSH5dgDGH5hxifpNCQajdDGPtxqU6GLPG2bChNBghkBC4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSiTggz2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSiTggz2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A10C1F000C1;
	Fri, 30 Oct 2026 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396162;
	bh=Q1bSxUxjIuldipfMHFleRTGSs2OhlVbOb3KEpj5IUk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XSiTggz2XgonprLFd75lEWlz6veEhBFh/SJ8cT1QPkNN9R0MEuyGkPRE6XzSHJWJm
	 nPHZG0AogWzpZ2TZsu6XPeTDFTcU7ZP1x45lRO5JlWObntM/25RW0JPtuqAPrX+ljQ
	 PDXIGTj2Qq4/XOQJhQs1AfW2EbiAu0fNaIwfRRY3c5UZlaBULa7v5vLS1jsQrig55V
	 Q8P7ugHjCERSqvBY3jq9HFE1GU7MAE7oef+WvNZPJb7tehIJcDRb69PRsrzc0dWbSV
	 A6xQM142Tv0ucHICtb6qe41g5BCplPXVAbu7tRFkXUb2Df1Qha5Ys/N5z0p97FWjTR
	 GAzDJlpeiSyMg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 30 Oct 2026 22:34:29 +0100
Subject: [PATCH 5/7] MAINTAINERS: add missing files to MM component
 sections
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-maintainers-v1-5-97278f8a5f54@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
To: Alistair Popple <apopple@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Byungchul Park <byungchul@sk.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
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
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9213; i=david@kernel.org;
 h=from:subject:message-id; bh=MiDg2sLpYMBxExc5N5/sYKkF7msOiq9t7x1deSR2pbw=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8ubZC6jL3Xuxt/dQctBZ5+bUvx1zVv88vGqa44a9X
 0UcY14Gd5SyMIhxMMiKKbIEBd83ePlyXW21Gx8zzBxWJpAhDFycAjCRB60M/wssGlqX9P/4Xii5
 4/b9ac63JuwJmhc9bf/VCSsfHp5Z+/g6w3+nKynqLic1jrTwOvTtYD7O+GDb9MvuqZqN1mKcSz9
 cv8EJAA==
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

We want to make sure that MM components cover all relevant MM files. The
generic "MEMORY MANAGEMENT" sections will probably go away at some
point.

We have a bunch of files that are not explicitly tracked under MM
components. Let's add these missing files.

Split up tools/mm to the appropriate components, but still add it also
under MISC, similar to what we did with selftests.

Don't split up selftests for now. They are covered by MISC and some
sections name them separately.

Some files like

 - include/linux/numa.h
 - include/trace/events/kmem.h
 - Documentation/admin-guide/numastat.rst

are a bit fuzzy. Add them to the best fit for now.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc82ef545e0aa..98948d159173b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6841,8 +6841,10 @@ R:	Muchun Song <muchun.song@linux.dev>
 L:	cgroups@vger.kernel.org
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	Documentation/admin-guide/cgroup-v1/memory.rst
 F:	include/linux/memcontrol.h
 F:	include/linux/page_counter.h
+F:	include/trace/events/memcg.h
 F:	mm/memcontrol-v1.c
 F:	mm/memcontrol-v1.h
 F:	mm/memcontrol.c
@@ -12349,6 +12351,7 @@ R:	David Hildenbrand <david@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
+F:	Documentation/admin-guide/cgroup-v1/hugetlb.rst
 F:	Documentation/admin-guide/mm/hugetlbpage.rst
 F:	Documentation/mm/hugetlbfs_reserv.rst
 F:	Documentation/mm/vmemmap_dedup.rst
@@ -12360,6 +12363,7 @@ F:	mm/hugetlb.c
 F:	mm/hugetlb_cgroup.c
 F:	mm/hugetlb_cma.c
 F:	mm/hugetlb_cma.h
+F:	mm/hugetlb_internal.h
 F:	mm/hugetlb_sysctl.c
 F:	mm/hugetlb_sysfs.c
 F:	mm/hugetlb_vmemmap.c
@@ -12379,6 +12383,7 @@ M:	Miaohe Lin <linmiaohe@huawei.com>
 R:	Naoya Horiguchi <nao.horiguchi@gmail.com>
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-memory-page-offline
 F:	include/linux/memory-failure.h
 F:	include/trace/events/memory-failure.h
 F:	mm/hwpoison-inject.c
@@ -17424,6 +17429,7 @@ M:	Oscar Salvador <osalvador@suse.de>
 L:	linux-mm@kvack.org
 L:	linux-cxl@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-memory
 F:	Documentation/admin-guide/mm/memory-hotplug.rst
 F:	Documentation/core-api/memory-hotplug.rst
 F:	drivers/base/memory.c
@@ -17480,10 +17486,13 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	Documentation/admin-guide/sysctl/vm.rst
+F:	Documentation/core-api/gfp_mask-from-fs-io.rst
 F:	fs/proc/meminfo.c
+F:	include/linux/cacheflush.h
 F:	include/linux/folio_batch.h
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
+F:	include/linux/highmem-internal.h
 F:	include/linux/highmem.h
 F:	include/linux/leafops.h
 F:	include/linux/memory.h
@@ -17493,11 +17502,16 @@ F:	include/linux/mmdebug.h
 F:	include/linux/mmu_notifier.h
 F:	include/linux/mmzone.h
 F:	include/linux/pagewalk.h
+F:	include/linux/pfn.h
 F:	include/linux/pgalloc.h
 F:	include/linux/pgtable.h
 F:	include/linux/ptdump.h
+F:	include/linux/sched/mm.h
+F:	include/linux/vm_event_item.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
+F:	include/trace/events/mmflags.h
+F:	include/trace/events/pagemap.h
 F:	kernel/fork.c
 F:	mm/Kconfig
 F:	mm/debug.c
@@ -17516,6 +17530,7 @@ F:	mm/ptdump.c
 F:	mm/util.c
 F:	mm/vmpressure.c
 F:	mm/vmstat.c
+F:	scripts/gdb/linux/mm.py
 N:	include\/linux\/page[-_][a-zA-Z]*
 
 MEMORY MANAGEMENT - EXECMEM
@@ -17536,6 +17551,7 @@ L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/core-api/pin_user_pages.rst
 F:	mm/gup.c
 F:	mm/gup_test.c
 F:	mm/gup_test.h
@@ -17613,6 +17629,7 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/linux/migrate.h
 F:	include/linux/migrate_mode.h
+F:	include/trace/events/migrate.h
 F:	mm/migrate.c
 F:	mm/migrate_device.c
 
@@ -17636,13 +17653,20 @@ F:	Documentation/admin-guide/mm/
 F:	Documentation/core-api/memory-allocation.rst
 F:	Documentation/core-api/mm-api.rst
 F:	Documentation/mm/
+F:	fs/proc/page.c
+F:	include/linux/backing-dev-defs.h
+F:	include/linux/backing-dev.h
 F:	include/linux/cma.h
 F:	include/linux/dmapool.h
 F:	include/linux/ioremap.h
+F:	include/linux/kernel-page-flags.h
 F:	include/linux/page_idle.h
+F:	include/trace/events/cma.h
+F:	include/uapi/linux/kernel-page-flags.h
 F:	mm/backing-dev.c
 F:	mm/char-mem.c
 F:	mm/cma.c
+F:	mm/cma.h
 F:	mm/cma_debug.c
 F:	mm/cma_sysfs.c
 F:	mm/dmapool.c
@@ -17655,7 +17679,9 @@ F:	mm/page_idle.c
 F:	mm/pgalloc-track.h
 F:	mm/process_vm_access.c
 F:	tools/lib/mm/
+F:	tools/mm/
 F:	tools/testing/selftests/mm/
+X:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 X:	Documentation/admin-guide/mm/damon/
 X:	Documentation/mm/damon/
 
@@ -17665,6 +17691,7 @@ M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git
+F:	include/linux/numa.h
 F:	include/linux/numa_memblks.h
 F:	mm/numa.c
 F:	mm/numa_emulation.c
@@ -17685,6 +17712,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
 F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
 F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
+F:	Documentation/admin-guide/numastat.rst
 F:	include/linux/memory-tiers.h
 F:	include/linux/mempolicy.h
 F:	include/uapi/linux/mempolicy.h
@@ -17716,6 +17744,9 @@ F:	include/linux/compaction.h
 F:	include/linux/gfp.h
 F:	include/linux/page-isolation.h
 F:	include/linux/pageblock-flags.h
+F:	include/trace/events/compaction.h
+F:	include/trace/events/page_isolation.h
+F:	include/trace/events/page_ref.h
 F:	mm/compaction.c
 F:	mm/debug_page_alloc.c
 F:	mm/debug_page_ref.c
@@ -17732,6 +17763,9 @@ F:	mm/page_reporting.h
 F:	mm/show_mem.c
 F:	mm/shuffle.c
 F:	mm/shuffle.h
+F:	scripts/gdb/linux/page_owner.py
+F:	tools/mm/page_owner_filter.c
+F:	tools/mm/page_owner_sort.c
 
 MEMORY MANAGEMENT - RECLAIM
 M:	Andrew Morton <akpm@linux-foundation.org>
@@ -17743,6 +17777,7 @@ R:	Shakeel Butt <shakeel.butt@linux.dev>
 R:	Lorenzo Stoakes <ljs@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	include/trace/events/vmscan.h
 F:	mm/vmscan.c
 F:	mm/workingset.c
 
@@ -17836,10 +17871,12 @@ F:	Documentation/admin-guide/mm/transhuge.rst
 F:	include/linux/huge_mm.h
 F:	include/linux/khugepaged.h
 F:	include/trace/events/huge_memory.h
+F:	include/trace/events/thp.h
 F:	mm/collapse.h
 F:	mm/huge_memory.c
 F:	mm/khugepaged.c
 F:	mm/mm_slot.h
+F:	tools/mm/thpmaps
 F:	tools/testing/selftests/mm/khugepaged.c
 F:	tools/testing/selftests/mm/split_huge_page_test.c
 F:	tools/testing/selftests/mm/transhuge-stress.c
@@ -17883,9 +17920,15 @@ L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/core-api/protection-keys.rst
+F:	Documentation/filesystems/mmap_prepare.rst
+F:	Documentation/userspace-api/mseal.rst
 F:	fs/proc/task_mmu.c
 F:	fs/proc/task_nommu.c
+F:	include/linux/mman.h
+F:	include/linux/pkeys.h
 F:	include/trace/events/mmap.h
+F:	include/uapi/linux/mman.h
 F:	mm/char-mem.c
 F:	mm/mincore.c
 F:	mm/mlock.c
@@ -18724,6 +18767,7 @@ M:	Peter Zijlstra <peterz@infradead.org>
 L:	linux-arch@vger.kernel.org
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	Documentation/core-api/cachetlb.rst
 F:	arch/*/include/asm/tlb.h
 F:	include/asm-generic/tlb.h
 F:	include/trace/events/tlb.h
@@ -21834,6 +21878,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git
 F:	arch/*/include/asm/percpu.h
 F:	include/linux/percpu*.h
+F:	include/trace/events/percpu.h
 F:	lib/percpu*.c
 F:	mm/percpu*.c
 F:	mm/percpu-internal.h
@@ -25555,6 +25600,7 @@ F:	include/linux/shrinker.h
 F:	mm/list_lru.c
 F:	mm/shrinker.c
 F:	mm/shrinker_debug.c
+F:	tools/cgroup/memcg_shrinker.py
 
 SH_VOU V4L2 OUTPUT DRIVER
 L:	linux-media@vger.kernel.org
@@ -25787,10 +25833,12 @@ R:	Roman Gushchin <roman.gushchin@linux.dev>
 L:	linux-mm@kvack.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git
+F:	Documentation/ABI/testing/sysfs-kernel-slab
 F:	Documentation/admin-guide/mm/slab.rst
 F:	Documentation/mm/slab.rst
 F:	include/linux/mempool.h
 F:	include/linux/slab.h
+F:	include/trace/events/kmem.h
 F:	lib/tests/slub_kunit.c
 F:	mm/failslab.c
 F:	mm/mempool.c
@@ -29842,9 +29890,11 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/linux/vmalloc.h
+F:	include/trace/events/vmalloc.h
 F:	lib/test_vmalloc.c
 F:	mm/vmalloc.c
 F:	mm/vmalloc.h
+F:	scripts/gdb/linux/vmalloc.py
 
 VME SUBSYSTEM
 L:	linux-kernel@vger.kernel.org

-- 
2.43.0

