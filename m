Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396149;
	b=s8Muz9KjWYXxwEdeUFbyy3P8zUgPeVUc6rayIWz6/pOZpMJIovnA6DPok+aGfLUBX7xY
	 PsQpn/cWbXDiJq0eiHv6cYtdvt67+ZXLbOIdMKhHYHS5xdl0EQE3xXsABODQcDpgBiHVb
	 MTX8r7Ib9Pv7wYKyU3+7cZWqaIJ7N44tfXjZVhX3PetROQWGluAAZOkBqG1bTeP7/6WNY
	 hPk58zVhVK0y/l+W3jCjO9mA3p7cnmewP08SOt8JzbDYOORP5gYGoNDiDyU/towf13PSl
	 gR3eoLQPEAXQvBdYe6KpV2+24mog4aI2iLpgrlQQnTxVbn2+CwQ5eb9clpvAafqHBxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396149;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6/LfQJ1TJsio8yhVdZU1peotIELVQPC1CM6M1FIq84k=;
	b=Z3JVMKoAEIn0DBpkoVgBEk435RmiJyFM7HyRft48FlUeikOmse9QZRqlMKdKtBScGhMX
	 Kazm9HRoVqaICm54p8BNdEwRf4ritztTX1GbAPJIY1Dk11Cs5IdEQ1U0qSMTXESYBc6cJ
	 IqepVRKwhYw70TGAaWoi/NwBL+02gRgi0Cs9cg0+Li1bZZdWrbUGl31yxY+S5hXLg/EJe
	 a+6YOkgeKkoB9C/C3WiHsqfTkxC9C7zstqs/1tKqAO8wt3KuakC0AuLfFpjo3bm1PcUsh
	 /pr3jQEkdFLPQemlooMtlnDwZazocnqPQdwREZYLi+PD4U5yzsCXxkM6VPPjjAhLJhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYQQpvIB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E2606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYQQpvIB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C031F0093A;
	Fri, 30 Oct 2026 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396148;
	bh=6/LfQJ1TJsio8yhVdZU1peotIELVQPC1CM6M1FIq84k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oYQQpvIBGQvzkEBOrWpRz+XW6hHjJYe9aB4wSQJ1UGIRnk/mzJHaOOrLcwujR7dLh
	 qrz+Ca8ICmXyT9Ho7KWa2s9QIsnuwcbmq63DD+JCxPUni4xD6+MLu/XyVR1qJBW9VK
	 3zK1IB2p8txSC7Q0ZCbJCQyQ9xQJEkNtvXpb1DcSL8EZaTfsz0IS9muLO+Snm3I0kj
	 HSLxCoQlfK6FPOHyCOd0zzV5VOfZHXxnawej6+G1CDdFU9uiCETytCK0tsj89dpN7F
	 tBFFPhsZOMQpB2SZGQjnsFjodbr/HRYhoPlpFF4812O7jhZZhX7X2z/knFFLBzoSqZ
	 7OMK6CDho9c7Q==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 30 Oct 2026 22:34:28 +0100
Subject: [PATCH 4/7] MAINTAINERS: sort entries in MM sections
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
Message-Id: <20261030-maintainers-v1-4-97278f8a5f54@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3448; i=david@kernel.org;
 h=from:subject:message-id; bh=XPzkNHx34lg5uSbAutRqCm9C+R2SNyW16o9VWM8IMHA=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLKe8ubt4mNzXnpcxdT+6Yqt7976+bjob108s6Tnvf/9j
 9Ze85zWdZSyMIhxMMiKKbIEBd83ePlyXW21Gx8zzBxWJpAhDFycAjARzvuMDBu0g5r93ps8yBSv
 ETmnuTJz27OEo5mJOx+vrGwutFLIkWZkONU3+912JWPO58mR89qmr0oxzzhwpLPmRkq3wusLPnJ
 vuQA=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

We try to keep these entries sorted; let's sort the MM related ones.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 02b5b542f81ee..bc82ef545e0aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6843,9 +6843,9 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	include/linux/memcontrol.h
 F:	include/linux/page_counter.h
-F:	mm/memcontrol.c
 F:	mm/memcontrol-v1.c
 F:	mm/memcontrol-v1.h
+F:	mm/memcontrol.c
 F:	mm/page_counter.c
 F:	samples/cgroup/*
 F:	tools/testing/selftests/cgroup/memcg_protection.m
@@ -17429,8 +17429,8 @@ F:	Documentation/core-api/memory-hotplug.rst
 F:	drivers/base/memory.c
 F:	include/linux/memory_hotplug.h
 F:	include/linux/memremap.h
-F:	mm/memremap.c
 F:	mm/memory_hotplug.c
+F:	mm/memremap.c
 F:	tools/testing/selftests/memory-hotplug/
 
 MEMORY MANAGEMENT
@@ -17480,6 +17480,7 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	Documentation/admin-guide/sysctl/vm.rst
+F:	fs/proc/meminfo.c
 F:	include/linux/folio_batch.h
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
@@ -17488,16 +17489,15 @@ F:	include/linux/leafops.h
 F:	include/linux/memory.h
 F:	include/linux/mm.h
 F:	include/linux/mm_*.h
-F:	include/linux/mmzone.h
 F:	include/linux/mmdebug.h
 F:	include/linux/mmu_notifier.h
+F:	include/linux/mmzone.h
 F:	include/linux/pagewalk.h
 F:	include/linux/pgalloc.h
 F:	include/linux/pgtable.h
 F:	include/linux/ptdump.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
-F:	fs/proc/meminfo.c
 F:	kernel/fork.c
 F:	mm/Kconfig
 F:	mm/debug.c
@@ -17636,14 +17636,12 @@ F:	Documentation/admin-guide/mm/
 F:	Documentation/core-api/memory-allocation.rst
 F:	Documentation/core-api/mm-api.rst
 F:	Documentation/mm/
-X:	Documentation/admin-guide/mm/damon/
-X:	Documentation/mm/damon/
-F:	mm/char-mem.c
 F:	include/linux/cma.h
 F:	include/linux/dmapool.h
 F:	include/linux/ioremap.h
 F:	include/linux/page_idle.h
 F:	mm/backing-dev.c
+F:	mm/char-mem.c
 F:	mm/cma.c
 F:	mm/cma_debug.c
 F:	mm/cma_sysfs.c
@@ -17658,6 +17656,8 @@ F:	mm/pgalloc-track.h
 F:	mm/process_vm_access.c
 F:	tools/lib/mm/
 F:	tools/testing/selftests/mm/
+X:	Documentation/admin-guide/mm/damon/
+X:	Documentation/mm/damon/
 
 MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
 M:	Andrew Morton <akpm@linux-foundation.org>
@@ -17810,8 +17810,8 @@ F:	include/linux/swapfile.h
 F:	include/linux/swapops.h
 F:	mm/page_io.c
 F:	mm/swap.h
-F:	mm/swap_table.h
 F:	mm/swap_state.c
+F:	mm/swap_table.h
 F:	mm/swapfile.c
 
 MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
@@ -17883,10 +17883,10 @@ L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
-F:	mm/char-mem.c
-F:	include/trace/events/mmap.h
 F:	fs/proc/task_mmu.c
 F:	fs/proc/task_nommu.c
+F:	include/trace/events/mmap.h
+F:	mm/char-mem.c
 F:	mm/mincore.c
 F:	mm/mlock.c
 F:	mm/mmap.c
@@ -29842,9 +29842,9 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/linux/vmalloc.h
+F:	lib/test_vmalloc.c
 F:	mm/vmalloc.c
 F:	mm/vmalloc.h
-F:	lib/test_vmalloc.c
 
 VME SUBSYSTEM
 L:	linux-kernel@vger.kernel.org

-- 
2.43.0

