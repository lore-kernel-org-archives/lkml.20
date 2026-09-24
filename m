Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8BB1A8F7B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230644; cv=none; b=S5w8N7aIUlNt/872drVFs2jcEE04qL03POwunmU5WCwlSasP0egcPoEjEePp/uJc8+/xueY7mBPdgS3UMdgORSsvyAKsEYvoL1HRQjD0oZW0vK9gMkvxnkRTmtJCdDBDEZ9b/CB+CuKx9IrUDMeVXONI26/srL2SNkN6CgN1NIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230644; c=relaxed/simple;
	bh=AFiGAJeNuge1xk0RxTH5cvykdnaiOpoKLFWNCrc5VLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+cc8+S4P6LAHWtWlVWTZF6KVvMQUHLFgqnrDCtL1VxkGBaMOzQ18LuMioAVvf/DKUmwCOaRl8LxDgt2Qk8b59NqZ4G1E7W7CxGfyv/b3fi5T5Da3yd1P7CztqTgrG95hKlYl2NGjx1E8FEQiLezWXBeFxfZY4scfrwI24Ii7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ux0yMa20; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ux0yMa20"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD251516;
	Wed, 23 Sep 2026 23:17:17 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80A633F86C;
	Wed, 23 Sep 2026 23:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790230641; bh=AFiGAJeNuge1xk0RxTH5cvykdnaiOpoKLFWNCrc5VLc=;
	h=From:To:Cc:Subject:Date:From;
	b=Ux0yMa20xD/2pizKV+EUg6uTTPx9s4FJxxgcbNMmPvekPo8B4aJR9MXoHhH+t2L7W
	 NK4M5t4d13cM+E9F+DNYFh2L09/ftfynSZIxWir6VEM9KcibMaNbHJ/abC9ABx5AkV
	 r62BXL2nyMMp10fBan0L+9IZ45bY3zvaBpC/Ue0I=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
Date: Thu, 24 Sep 2026 11:47:12 +0530
Message-ID: <20260924061716.1634555-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route READ_ONCE() accesses on pgtable entries via level specific generic MM
pxdp_get() helpers which platforms could then override when required. These
accessors on arm64, will help in ensuring page table accesses are performed
in an atomic manner while reading 128 bit page table entries later. But for
now they just default to READ_ONCE(), thus preserving existing behaviour on
current D64 translation a well.

This is similar to generic MM where all atomic accesses have already been
converted from READ_ONCE() into pgtable level specific accessors.

These are preparatory patches for D128 enablement, although standing their
own for D64 translation as well. These patches are split from earlier D128
V1 series. There are no functional changes here and besides mm kselftests
do not show any regression.

https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/

This series applies on v7.3-rc4 but after applying the following patches on
pgtable entry print standardization posted earlier.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

https://lore.kernel.org/linux-mm/20260916044933.2689426-1-anshuman.khandual@arm.com/

These patches have been hosted here as well.

git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v3)

Changes in V3:

- Added overrides for pxdp_get() and replaced remaining READ_ONCE()
- Updated all commit messages as required
- Dropped previous tags

Changes in V2:

https://lore.kernel.org/all/20260922061638.3967467-1-anshuman.khandual@arm.com/

- Rebased on v7.3-rc4 along with all latest dependencies
- Updated commit messages per Ryan
- Added tags from Ryan

Changes in V1:

https://lore.kernel.org/all/20260903060657.2717457-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (4):
  arm64/mm: Use pmdp_get() for PMD accesses
  arm64/mm: Use pudp_get() for PUD accesses
  arm64/mm: Use p4dp_get() for P4D accesses
  arm64/mm: Use pgdp_get() for PGD accesses

 arch/arm64/include/asm/pgtable.h | 40 +++++++++++++++++----
 arch/arm64/mm/fault.c            |  8 ++---
 arch/arm64/mm/fixmap.c           |  6 ++--
 arch/arm64/mm/hugetlbpage.c      | 10 +++---
 arch/arm64/mm/kasan_init.c       | 18 +++++-----
 arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
 arch/arm64/mm/pageattr.c         |  8 ++---
 arch/arm64/mm/trans_pgd.c        | 14 ++++----
 8 files changed, 95 insertions(+), 69 deletions(-)

-- 
2.43.0

