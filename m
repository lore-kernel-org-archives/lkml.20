Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868434;
	b=XZpCvOZTYTeY1r8bbvyD8ZdYAfXn1l9hAbpOT8bRiloEVhXR1cRsuZb+QmVcXjIs4JeE
	 0YVxndQaONO2Gu+JzxMKdq8xeQ/+D9rZwoVyXKylZSNQi/Lh5LRa01v4TheBS3tXY18SE
	 CZ8hUXz9IjI5viq/+SyFS8tZHF7kexoRwtJlEKxmwIco5KIIebtWbGiZRwRR6Dx1Cr0ro
	 f7ts1KNqQ2YkzjzjwO86JzZdOXH0JPIpAz0yJGg24IpIjm8Z74AuefX5kpjVh/XORHWw+
	 2NQfW446zgyhqM6vUEq4QjoZBWc0pGc4rWLaCIzhoON83lbSGcRNk1iOnnIZE+sqIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868434;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gIs9aYB6nzGonVZAd7ZA/+llOqexhh5JotKT03ZQpgc=;
	b=xFhMHf8nn/GmIDZLfa2SYCPfEzTs+cJGQL3hhUbVOsdZH4MYN37LuY4LVlJHNSZFkD11
	 0aV6EuSyjmVoUxh1dWCB+0oHWVKniWOlTh+/EYEbIQicYlWW1lhZx0EjouOlR+47c3b8Y
	 bj4UD1ZIWuNVs+M/T49fmfw5HYNC45NSE/YVRBv8hQTSDU9x/3fYUtWIZlKO2NcH3QDww
	 CgWlR034L5V0m4h4fcogtg7HhvPQNAUaPSaNcKR0uGP71eaGWAX970Fms0ZYT3cJuf8ZS
	 7wzGwB9QNl5560oJLQb6U5mYN7IXPGJ9YPO1cLOEeCDMJ68Au5WZps5ybcT4RHyU3FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlJ0BJon;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49D9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlJ0BJon
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7791F000C1;
	Thu,  5 Nov 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868433;
	bh=gIs9aYB6nzGonVZAd7ZA/+llOqexhh5JotKT03ZQpgc=;
	h=From:To:Cc:Subject:Date;
	b=JlJ0BJonjo7QumWoY9HZw9k2a3FAbhDXriZUpC/EIBanmGi641oRI8J8wU27hPzXa
	 HC1Q3lpmOwzIPILEunTTWzYmzdrTdSUOlGb6wkEU2JG71454MJ4MefROxYjKAK7bPV
	 Lq78DmQbGdibPmW+COWPHpPgUR5aLeaFkA1gyKjaY4oa/AuMSE9h4Tr2dldsjBQdks
	 sm9dUSvZjmvKugJr7Rf7LRP0P4cmyQDSfYbJRovBBU6Qz1Q0AgJB53QL4dLQvvQK0v
	 QE0Jt6mX2FJJxAZ0PnGsjCQU/JYGgHGHIJWqvOVAD65EXhpoc8Mt2kTgBg4+YE/F0y
	 tib/wabIYGAnA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [GIT PULL] Core MM updates for 7.4-rc2
Date: Thu,  5 Nov 2026 09:47:02 +0100
Message-ID: <20261105084704.5703-1-david@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

as discussed via mail, here is a bigger set of MM fixes that we didn't
manage to have ready for -rc1. All fixes are stable-worthy; the majority
fixes nasty long-standing bugs instead of being purely hotfixes.

We have some more of these kinds of stable-worthy fixes in the pipeline,
but we'll focus on the really urgent fixes as we get closer to the release.

(leaving urgent MM fixes lurking for various weeks is not good,
but having too many changes close to the release is also not good, it's
tricky ...)

Most issues were reported by Anthropic. Others were found while reworking
proposed fixes, and of course some of the fixes were just reported and
fixed on the mailing list.

All fixes were in linux-next for several days without changes. Some commit
IDs changed recently when I had to drop some non-stable fixes, rebased to
-rc1 and picked up more trailers.

Please let me know if anything looks odd or if you would prefer things
differently going forward. I'm still learning while dealing with all the
bugs we're finding.

Cheers,

David

----------------------------------------------------------------

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc2

for you to fetch changes up to 71555ae8c7572fd99158013ca2e29187c5d2508d:

  mm/gup: check folio->mapping under folio lock in memfd_pin_folios() (2026-11-03 20:20:53 +0100)

----------------------------------------------------------------
Core memory management fixes for 7.4-rc2

This includes fixes to:

 - THP (Transparent Huge Pages)
 - GUP (Get User Pages)
 - KSM (Kernel Samepage Merging)
 - USERFAULTFD
 - SHARED MEMORY (shmem/tmpfs/memfd)
 - HUGETLB
 - Core MM, PAGE CACHE and MEMORY RECLAIM

The main changes are:

 - Prevent information leaks through memfd pinning, and out-of
   bounds writes in GUP.

 - Fix data loss in shmem, THP collapse, KSM and memfd pinning.

 - Fix corruption and reference-counting errors with huge PMD/PUD
   mappings, and incorrect TLB flushing and unmapping.

 - Fix various use-after-free bugs, deadlocks and unkillable loops,
   witha a focus on shmem swap handling.

 - Fix execution-seal enforcement for memfd (incl. hugetlb).

Other changes fix accounting, quota and userfaultfd (un)registration
handling.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

----------------------------------------------------------------
Chris Mason (15):
      mm/mempolicy: charge shared policy nodes
      mm/shmem: honour F_SEAL_EXEC when an ACL is set
      mm/shmem: stop retrying folios that cannot be split
      mm/shmem: preserve data in clean folios when splitting fails
      mm/huge_memory: fix truncate racing with PMD zapping
      mm/huge_memory: fix zapping migration entries for device-private THPs
      mm/khugepaged: preserve dirty bits when collapsing PTE-mapped THPs
      mm/gup: fix clearing folios in memfd_pin_folios()
      mm/gup: fix out-of-bounds write for nr_pages == 0 in GUP-fast
      mm/mmu_notifier: set ->mm only after mmgrab()
      mm/memory: reject remote COW faults on PFN mappings
      mm: fix unkillable fault loop on MAP_DROPPABLE memory
      mm: fix deadlock of mremap() against UFFDIO_MOVE
      mm/ksm: check large swap-cache folios before mapping them
      mm/vma: call ->may_split() before a partial merge

David Hildenbrand (Arm) (26):
      mm/shmem: discard whole new large folios on fallocate rollback
      mm/shmem: rescan after nonuniform folio splitting
      mm/shmem: fix truncate hang in large swap entry
      mm/shmem: preserve allocation errors when swapping in large entries
      mm/shmem: fix truncate loop after boundary swapin failure
      mm/shmem: fix accounting of swapin-error markers
      mm/shmem: fix truncation of files containing only swapin-error markers
      fork: take mmap_lock before copying mm_struct
      mm/shmem: make shmem_file() check the file's inode
      mm/truncate: look again if a folio left the mapping
      mm/filemap: finish fault cleanup before dropping the fault lock
      mm/rmap: handle device-exclusive entries in folio_referenced_one()
      mm/huge_memory: fix list corruption when deferred_split_scan() races with deferred_split_folio()
      mm/huge_memory: properly handle refcounted PUD mappings on fork
      mm/gup: recheck the PUD under PTL in follow_pud_mask()
      mm/gup: check for overflow when converting nr_pages to bytes in GUP-fast
      mm/userfaultfd: write-lock the VMA before waking waiters when unregistering
      mm/userfaultfd: wake waiters when registration modes are removed
      mm/mremap: use pudp_huge_get_and_clear() when moving huge PUDs
      mm/mremap: recheck PUDs under the page table lock
      mm/madvise: fix data loss from MADV_FREE on a KSM page
      mm/ksm: reset the unstable trees of all nodes
      mm/ksm: fix use of a freed anon_vma at swap-in
      mm/huge_memory: split huge PUDs when adjusting VMA boundaries
      mm/vma: don't leak the charge for stack growth
      mm/memory-tiers: unregister empty tiers outside memory_tier_lock

Eva Kurchatova (1):
      hugetlbfs: enforce F_SEAL_EXEC in setattr

Gregory Price (1):
      mm/userfaultfd: compare exact registration modes before skipping

Josef Bacik (14):
      tmpfs: keep the quota soft limits of an unused id
      tmpfs: preserve explicitly disabled quota limits
      mm/shmem: hold off eviction in shmem_writeout()
      mm/mglru: don't use stack pointers when walking PUD and PMD tables
      mm/memfd: make f_pos accesses atomic
      mm/filemap: read mapping->a_ops->free_folio under i_lock
      mm/filemap: don't lose a folio lock wakeup to a signal
      mm/khugepaged: always recheck the pmd in try_collapse_pte_mapped_thp()
      mm/khugepaged: fix PMD table lock leak in try_collapse_pte_mapped_thp()
      mm/userfaultfd: wake all waiters on unregister
      mm/mmu_gather: fix flushing ranges with 4 GiB or larger
      mm/mmu_notifier: finish non-blocking interval invalidation on error
      mm/mremap: fix moving PUD leaves
      mm: fix unmap_mapping_range() beyond 4 GiB on 32-bit

Lance Yang (1):
      khugepaged: fix readahead lock inversion in collapse_file()

Rik van Riel (1):
      mm/cma: don't release CMA pages still in use

Ritesh Harjani (IBM) (1):
      mm/huge_memory: set the mmu_gather page size in zap_huge_pud()

Samiullah Khawaja (1):
      mm/gup: check folio->mapping under folio lock in memfd_pin_folios()

 fs/hugetlbfs/inode.c          |   8 ++
 include/asm-generic/tlb.h     |   3 +-
 include/linux/huge_mm.h       |   5 +-
 include/linux/ksm.h           |   6 +-
 include/linux/memfd.h         |   9 +++
 include/linux/mmu_notifier.h  |   3 +-
 include/linux/shmem_fs.h      |  15 ++--
 include/linux/userfaultfd_k.h |   2 -
 kernel/fork.c                 |  20 +++--
 mm/cma.c                      |  10 ++-
 mm/filemap.c                  |  84 ++++++++++----------
 mm/gup.c                      |  68 ++++++++++++-----
 mm/huge_memory.c              | 146 ++++++++++++++++++++++++++---------
 mm/hugetlb.c                  |  14 +---
 mm/internal.h                 |  28 +++++++
 mm/khugepaged.c               |  65 +++++++++++-----
 mm/ksm.c                      |  56 ++++++++++----
 mm/madvise.c                  |   9 +++
 mm/memfd.c                    |   2 +
 mm/memory-tiers.c             |  29 ++++---
 mm/memory.c                   |  30 +++++---
 mm/mempolicy.c                |   4 +-
 mm/mmap.c                     |   8 +-
 mm/mmu_notifier.c             |  24 ++++--
 mm/mremap.c                   | 103 +++++++++++--------------
 mm/nommu.c                    |   2 +-
 mm/rmap.c                     |  23 +++++-
 mm/shmem.c                    | 173 +++++++++++++++++++++++++++++-------------
 mm/shmem_quota.c              |  28 +++----
 mm/swapfile.c                 |   3 +-
 mm/truncate.c                 |  13 +++-
 mm/userfaultfd.c              |  75 +++++++++---------
 mm/util.c                     |  13 ++++
 mm/vma.c                      |  24 ++++--
 mm/vmscan.c                   |   4 +-
 35 files changed, 717 insertions(+), 392 deletions(-)
