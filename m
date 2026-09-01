Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06FF20DD51
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241454; cv=none; b=dWNW2MZvuOAvvYY2ZFc06dtlb1b2LaO1wxMw5MWir74xRmTFo2ScU3bZzc/eXQPn2a1ixh95WckaaejKpxAME7ZAtPXzBeydjbqPovnzKxmGW+WG4p4j5brr80PqfUpGMv/Odx3Omdt3IWkaYObxbFKyqfEzZ/ABzjeT6EJrli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241454; c=relaxed/simple;
	bh=z7SnY/TZcfUbJoxXT3hWEUw/QWVK2bD8Px83AhPKn9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhYAZ4eh2viyhbdB8wb6RdY7iQdcdDSMfkcWVzqfRwhDQYyHjzE5v3NF8C3MSbHUtVDfm24yFbKs4IN/dEBs4n5AaKd79AaZjmcpY08Mdi4Bd8aF48vqaYm2LWYk/QD142RzObuSgjMvJiNUdpYh/Xky7dmdayDJ5fDmbYB7lhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dX1ar1mV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dX1ar1mV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 176641756;
	Mon, 31 Aug 2026 22:44:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF2D53F85F;
	Mon, 31 Aug 2026 22:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241450; bh=z7SnY/TZcfUbJoxXT3hWEUw/QWVK2bD8Px83AhPKn9o=;
	h=From:To:Cc:Subject:Date:From;
	b=dX1ar1mVnXf7HIsO6+jtrW8k2z+MuNX8sdIo503mCQWJFqJC7UYVjHnU2lUwECCrt
	 HiBaEyk/3gSZN+CutLEcl5kmeRIq6/20yjyLHcF/HVnRyqW58vjFMKRCUR96OUbDnS
	 tO6kLX5luNQ26ME5RzGA4GyNvwOm1a7TUK6PA30s=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 0/8] Optimize anonymous swapbacked large folio unmapping
Date: Tue,  1 Sep 2026 05:43:47 +0000
Message-ID: <20260901054358.4049095-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Speed up unmapping of anonymous swapbacked large folios by clearing
the ptes, and setting swap ptes, in one go.

The following benchmark (stolen from Barry) is used to measure the
time taken to swapout 256M worth of memory backed by 64K large folios:

 #define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/mman.h>
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
 #include <errno.h>

 #define SIZE_MB 256
 #define SIZE_BYTES (SIZE_MB * 1024 * 1024)

 int main() {
     void *addr = mmap(NULL, SIZE_BYTES, PROT_READ | PROT_WRITE,
                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
     if (addr == MAP_FAILED) {
         perror("mmap failed");
         return 1;
     }

     memset(addr, 0, SIZE_BYTES);

     struct timespec start, end;
     clock_gettime(CLOCK_MONOTONIC, &start);

     if (madvise(addr, SIZE_BYTES, MADV_PAGEOUT) != 0) {
         perror("madvise(MADV_PAGEOUT) failed");
         munmap(addr, SIZE_BYTES);
         return 1;
     }

     clock_gettime(CLOCK_MONOTONIC, &end);

     long duration_ns = (end.tv_sec - start.tv_sec) * 1e9 +
                        (end.tv_nsec - start.tv_nsec);
     printf("madvise(MADV_PAGEOUT) took %ld ns (%.3f ms)\n",
            duration_ns, duration_ns / 1e6);

     munmap(addr, SIZE_BYTES);
     return 0;
 }

Performance as measured on a Linux VM on Apple M3 (arm64):

Vanilla - Mean: 37401913 ns, std dev: 12%
Patched - Mean: 17420282 ns, std dev: 11%

resulting in more than 2x speedup.

No regression observed on 4K folios.

Performance as measured on bare metal x86:

Vanilla - mean: 54986286 ns, std dev: 1.5%
Patched - mean: 51930795 ns, std dev: 3%

I tried magnifying the difference on x86 by using 1M large folios, but
can't spot an obvious improvement (looks like my system is too fast to
benefit from batched atomic operations!), hinting that the benefit lies
mainly in the reduction of ptep_get() calls and the reduction of TLB
flushes during contpte-unfolding, on arm64.

No regression is observed on 4K folios on x86 too.

---
Applies on Linux 7.3-rc1 plus below:
https://lore.kernel.org/all/20260831082849.3573957-1-dev.jain@arm.com/

mm-selftests pass.

This breakout patchset is the final completion of
https://lore.kernel.org/all/20260526063635.61721-1-dev.jain@arm.com/

The extra addition is the generic set_softleaf_ptes() helper.

v1->v2:
 - Add WARNs for folio span in folio_*_swap_pages
 - Trivial changes to page_anon_exclusive_batch
 - Add two sanity checks in patch 4

Dev Jain (8):
  mm/swapfile: add batched version of folio_dup_swap
  mm/swapfile: add batched version of folio_put_swap
  mm: move anon-exclusive batch helper to mm.h
  mm/rmap: Add batched version of folio_try_share_anon_rmap_pte
  mm/internal: rename swap offset helpers to softleaf offset
  mm/internal: add set_softleaf_ptes
  mm/memory: use set_softleaf_ptes for uffd-wp markers
  mm/rmap: batch unmap anonymous swap-backed large folios

 include/linux/mm.h   |  19 ++++++++
 include/linux/rmap.h |  56 +++++++++++++++-------
 mm/internal.h        |  62 ++++++++++++++++++------
 mm/memory.c          |  20 +++-----
 mm/mprotect.c        |  17 -------
 mm/rmap.c            | 110 +++++++++++++++++++++++++++++++------------
 mm/shmem.c           |   8 ++--
 mm/swap.h            |  35 ++++++++++++--
 mm/swapfile.c        |  35 +++++++-------
 9 files changed, 247 insertions(+), 115 deletions(-)

-- 
2.43.0

