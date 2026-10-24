Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840905;
	b=z2jbktpzMHyoG7Rci3VJhruWL17Gx2dr5oPa8PkVt6cwIytYVJQMRKSRtN2TMJnp3TsR
	 SAELFvN3ZyBefJrnNJ57PV0ULxDxT0LQcX652GBLqHSngHjMxGDAiWCKqGdRnTyVqVERA
	 y9toBKQob0BcSn+JbFBZy6+D4+QSAoZxlZBcDNbIdTOEY0PjJ/xHdfEuRp2MCA05nZVKP
	 q/omNyjEBJrj4gklBmbLXvArmW8BTi64+nbi3AP2RD8Gq0alE6tWJ2HexyOoHTmTeh2LL
	 mWWHJEj0q3gAH2j32OuYZhR8OXlENGya8/og3ZdowQUsENmltkNmF45kJK3ex48wGqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840905;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iDDeg9qjHmGV6IXYQKG3+nLfuCV82jMJnayxqcQwlbI=;
	b=STs9Mzu+MWJyHkbUYR204bjqDphBl08BTivxh+H3egGVGvK4kH4B7IFP8QhQutI7Laej
	 d6nYca9YGWtwYtQEuW3bES+tO0Xu4RmtE86H9Kxpny5fp8J5CcN8eGDjsQ7QZdyevtUbn
	 FLOB+/WUtgmiojSLQxh013TvNdpCZMB8l/JjSeNhZPxsY1QCT0QyLbGryXpK7Yq3Zqtt6
	 OYTOM0s+Uz0b4YvgwvvweQvXimBOkkMQ1++rXcZUmiqoXvxRIXPiXQWkdIUYrKVPmg3VV
	 M1KhtpAuD+rRTKmQ/LOY0zbz3MyrxupzS9BkkPa18O8OuZUGwiyBF0kVVbQ3LBC/RCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWeHkD3B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWeHkD3B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500221F01829;
	Sat, 24 Oct 2026 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792840904;
	bh=iDDeg9qjHmGV6IXYQKG3+nLfuCV82jMJnayxqcQwlbI=;
	h=From:To:Cc:Subject:Date;
	b=BWeHkD3BxXtLiI7xqTS7+XkJgaANCXW93y9p4EzdaFJ1wuLgNj5IJLtyL4UukLqee
	 A1Uk9MK+qPb8qIScenE4BJNTXaFXVx+p8/uRSUPTMTKWFqXGMTzpZIyeb18AFoK61c
	 UZsTxMqJymOvLFCf1FZrl00MIz0/KjWMbgcISrhTf9+t7DtdvK3M1sGPe5FxnAH108
	 SDurcjRm3GtrL0dcNTDFWITE3PdxpKQrEMw3ssB2/D9NF44HvPGJtSScv95UdKbl/H
	 8dkDjQbv6zi4RjdqQ0swEDBJP4TylEJEQI/CQH7LyE8a8lua1amC6mhD+QGIBk9aYF
	 Ys9yKuxnzjsmA==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memblock: updates for 7.4-rc1
Date: Sat, 24 Oct 2026 14:21:29 +0300
Message-ID: <20261024112131.3384572-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The following changes since commit 6e33dc90df108c76899dc544a42d17adcba61668:

  MAINTAINERS: update memblock tree URLs (2026-09-09 20:28:14 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git tags/memblock-v7.4-rc1

for you to fetch changes up to 7933ad3f669670ca5f5f13de2b5cb0f92b91abf5:

  memblock: use binary search to locate candidate regions (2026-10-15 09:39:37 +0300)

There is a conflict in mm/sparse-vmemmap.c and here is how my resolution shows
up with git diff --cc 17bb0e2f6c804  -- mm/sparse-vmemmap.c:

diff --cc mm/sparse-vmemmap.c
index 5a2469fb1838c,23b31bc4bf94a..0000000000000
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@@ -78,8 -62,7 +62,7 @@@ void __ref *vmemmap_alloc_block(unsigne
  		}
  		return NULL;
  	} else
- 		return __earlyonly_bootmem_alloc(node, size, size,
- 				__pa(MAX_DMA_ADDRESS));
 -		return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), node, false);
++		return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), node);
  }
  
  static void * __meminit altmap_alloc_block_buf(unsigned long size,

----------------------------------------------------------------
memblock: updates for 7.4-rc1

Performance improvement:

* Use binary search in memblock_add_range() and memblock_isolate_range()

Cleanups:

* Several simplifications in memblock and mm_init that remvove redundand
  code.
* After rework of sparsemem buffer preallocation, memmap_alloc() does not
  require exact_nid parameter. Remove that parameter, drop now unused
  memblock_alloc_exact_nid_raw() and ajust memblock tests accordingly.

memblock test updates:

* add coverage for lowmem allocations
* fix 32-bit build warinings

----------------------------------------------------------------
Kaitao Cheng (3):
      mm: Remove unused exact_nid parameter from memmap_alloc()
      memblock tests: Move exact nid tests to memblock_alloc_range_nid()
      memblock: Remove unused memblock_alloc_exact_nid_raw()

Mike Rapoport (Microsoft) (3):
      Merge patch series "memblock tests: cover low-address allocations"
      Merge patch series "memblock tests: fix BUILD=32 address conversions and warnings"
      Merge patch series "memblock: Remove unused exact nid allocation API"

Sang-Heon Jeon (4):
      memblock: simplify reset_all_zones_managed_pages()
      memblock: remove conditional return with no effect
      mm/mm_init: remove zone_absent_pages_in_node()
      memblock: reject non-page-aligned reserve_mem regions

Tarun Sahu (2):
      memblock: drop for_each_memblock_type() and open code its users
      memblock: use binary search to locate candidate regions

Tianyi Chen (6):
      memblock tests: model the low allocation limit within dummy memory
      memblock tests: cover allocations below the low address limit
      memblock tests: use physical addresses for region removal
      memblock tests: zero-extend simulated memory addresses
      tools: use __pa() in virt_to_phys()
      memblock: initialize the region merge end index

 Documentation/admin-guide/kernel-parameters.txt    |   3 +
 include/linux/memblock.h                           |   4 -
 mm/memblock.c                                      | 127 +++---
 mm/mm_init.c                                       |  38 +-
 mm/mm_init.h                                       |   4 +-
 mm/sparse-vmemmap.c                                |  17 +-
 mm/sparse.c                                        |   2 +-
 tools/include/linux/mm.h                           |   2 +-
 tools/testing/memblock/Makefile                    |   3 +-
 tools/testing/memblock/README                      |  12 +-
 tools/testing/memblock/TODO                        |   5 -
 tools/testing/memblock/asm/dma.h                   |   6 +
 tools/testing/memblock/main.c                      |   2 +
 tools/testing/memblock/tests/alloc_exact_nid_api.c | 454 ++-------------------
 tools/testing/memblock/tests/alloc_low_api.c       | 148 +++++++
 tools/testing/memblock/tests/alloc_low_api.h       |   9 +
 tools/testing/memblock/tests/alloc_nid_api.c       |  20 -
 tools/testing/memblock/tests/alloc_nid_api.h       |   1 -
 tools/testing/memblock/tests/basic_api.c           |  20 +-
 tools/testing/memblock/tests/common.c              |  12 +-
 tools/testing/memblock/tests/common.h              |   2 -
 21 files changed, 294 insertions(+), 597 deletions(-)
 delete mode 100644 tools/testing/memblock/TODO
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.c
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.h
