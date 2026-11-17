Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919042;
	b=M/p/5mEcjsxE1HcC76l1vPNn0YMzSQzXW0V+5azpcR9NDa3Q51jyrWX6gQRMxO2Zjjr4
	 YkpqXMyLxbGZitPgo3cnPHEsOTW2LrGF9G2JPJu7HLoggCkuBX9PSx0PMrUv2SgnEqJCK
	 vR5Eo2JqDgUZkIOyAPvkDsR9ePDgtGJaWIS0bT2v5pwwHvLth9fvdRYXZJFHBuH2xXgBC
	 iwGHhbOptvXZfKOQRbOUGwfBHEsVz9Ef8aoLfkR+37uf2Ui67bQe09mpj6L0KQLPTslIs
	 uo7B734U6XxE7wPZa9dY6kElE7iE7ZoekgQEii18l/dTdemavbCzpQh3iWchjFJw0nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919042;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hXSEIu+BwV1S8tPxayHCJW+kRFznr7QmQ/f2L6iJRlQ=;
	b=WS6CB5jk2uBasuNQy63N4V3S0CRdeyB83eSWFFgM4ec7ThuZsHS8FdqYJf/U189JUupN
	 LcFA9aZEZTAjKB5wGyonk1tGkHHAfW3HXnl55JbawvRo3fCFuf0rg1xaJSghRS56HVimc
	 NFXH3fMZ2OaLJjrNTz8OCFtOsqofSR3/ve0fmA2FE+43E3jIK4pkW8S3+0z+S2A0mIPAP
	 dPcMFJA8Rt3hEsH+b8qdcjALK1vqj4vwZFtq6P6Blupw9jQpUxDKp08tofYAxJ5PcrMPE
	 cRVBBvTtFeXER9MxFBE0ol2RZgNIKJXnshX8k9RTbWCf4l+d6kfhQ9lTS4CfAnbeNRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2Eja1XU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2Eja1XU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD021F000C6;
	Tue, 17 Nov 2026 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919042;
	bh=hXSEIu+BwV1S8tPxayHCJW+kRFznr7QmQ/f2L6iJRlQ=;
	h=From:To:Cc:Subject:Date;
	b=b2Eja1XUJTUdCidd1n03CptFLQI3lvHVjocRxQIwnkHozMgc6D/fvjlERtAHfMQRH
	 XODOczW2lLykerwRiSiDVXMfQezSmOb1HLWOuopYuCDfdatFHK9/94p5kcgmV4wNJg
	 qX1JKG/Qzy/ELcvHgqbRgIeL7dL09AUnsX/Y9AQLwh9Rg5kNLLYB+S9fU9l8Vl1UDU
	 54PVq5+BXNDp4+3p2I141BJtXtqgnuXB+9+CyMlCz6OmC5pcS2bOi+rzl+rkEX8Sfw
	 FtRio08+KyXt5MxU9lfR1dWZeOL75gomPf/bvDsXk/PExOM7WnGWN69Tg+A0oQOjjw
	 L2mnsW1eBvyfw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [GIT PULL] Core MM fixes for 7.4-rc4
Date: Tue, 17 Nov 2026 13:37:14 +0100
Message-ID: <20261117123716.7567-1-david@kernel.org>
X-Mailer: git-send-email 2.56.1
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

please pull these core-MM fixes for 7.4-rc4.

I wanted to have them ready for -rc3, but decided to give some of them
a bit more soaking time in -next. These are all urgent fixes; non-urgent
fixes are getting piled up for the next merge window.

The biggest piece is the folio refcount overflow prevention, which you
should be aware of and which I want to have fixed ASAP. What's missing from
that work are the net patches.

I'll try getting more attention from net maintainers on the net changes
next, so they can go through the net tree.

Cheers,

David

----------------------------------------------------------------

The following changes since commit f66469d9905b39d2c260a15d7d6db450f4db67c1:

  Merge tag 'net-7.4-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-11-05 18:00:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc4

for you to fetch changes up to 25f5c92e1ac06496679ea229e5c825aa88968efd:

  Merge patch series "mm: limit pagecache folio refcount" (2026-11-14 16:36:05 +0100)

----------------------------------------------------------------
Core memory management fixes for 7.4-rc4

This includes fixes to:

 - THP (Transparent Huge Pages)
 - GUP (Get User Pages)
 - USERFAULTFD
 - SHARED MEMORY (memfd)
 - Core MM

The main changes are:

 - Prevent folio refcount overflows with pagecache folios, mostly
   relevant for large folios today. The networking changes for this will
   go through the net tree.

 - Fix out-of-bounds page table accesses with folded PMDs in 3
   scenarios.

 - Fix write-sealing of memfd to detect GUP pins with concurrent
   (un)mapping more reliably, preventing writes through GUP pins after
   write-sealing.

 - Fix lost wakeups when splitting large folios.

 - Fix exposing uninitialized data through MADV_COLLAPSE to user space.

The refcount changes also include a related iommufd fix for properly
cleaning up when pinning memfd folios fails, which is now easier to
trigger.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

----------------------------------------------------------------
David Hildenbrand (Arm) (11):
      mm/khugepaged: don't map folios that are not uptodate in MADV_COLLAPSE
      mm/memfd: handle GUP pins more reliably when write-sealing
      mm/userfaultfd: fix PTE table overruns in UFFDIO_MOVE
      mm/rmap: fix PTE table overruns during batched unmap
      mm/rmap: fix PTE table overruns during batched reference checks
      mm: limit pagecache folio refcount when mapping pages
      mm: limit pagecache folio refcount when splicing into pipes
      mm/mmu_gather: flush pending references early before the folio limit
      iommufd: fix cleanup when adding memfd folio pins fails
      mm/gup: limit pagecache folio refcount when grabbing references
      Merge patch series "mm: limit pagecache folio refcount"

Zi Yan (1):
      mm/huge_memory: prevent losing PG_waiters in __split_folio_to_order()

 drivers/iommu/iommufd/pages.c | 15 ++++++--
 fs/fuse/dev.c                 |  4 +-
 include/asm-generic/tlb.h     |  4 +-
 include/linux/mm.h            | 89 ++++++++++++++++++++++++++++++++++++-------
 include/linux/pgtable.h       | 24 ++++++++++++
 mm/filemap.c                  | 28 +++++++++-----
 mm/folio.c                    | 26 +++++++++++++
 mm/gup.c                      | 32 ++++++++++------
 mm/huge_memory.c              | 64 ++++++++++++++++++++++++++++---
 mm/internal.h                 |  6 ++-
 mm/khugepaged.c               |  6 +++
 mm/memfd.c                    |  7 ++++
 mm/memory.c                   | 48 +++++++++++++++++------
 mm/migrate.c                  | 11 ++++++
 mm/mmu_gather.c               | 10 +++--
 mm/page_alloc.c               | 17 ++++++++-
 mm/rmap.c                     |  4 +-
 mm/shmem.c                    |  7 +++-
 mm/userfaultfd.c              |  8 +++-
 19 files changed, 336 insertions(+), 74 deletions(-)
