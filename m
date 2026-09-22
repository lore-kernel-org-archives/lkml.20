Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3744BEE58
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057807; cv=none; b=H3Ddxzhj+tzIhCkxG6+FFo5++Rpbh17JB+KVCRNE7sTxd9erli+OGZJdMimWXqzCOwYsNVxougAdsU/BpRLBxvp5BBlhgORNuyJ3rAHEnPWam0ktPKulGE0M1Lo8ftR/tgDW4f/GmtsNP1MdXKdEZ/oYTQbbDhEqxC+5EskKXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057807; c=relaxed/simple;
	bh=JzDwOfDq7AeFzF7O9lfDqkWJ63pkoijMhPDQ15y0zR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pH6Vouyk/d7UfguWF8X2E/VthF3bY9rIgP6XLTE8ZVzgfFzEtyB/JMhp7OCmmiKZ47QMaUyywI1A6MzgWtDeGOtigNPlzPSByBjGuouIxnBEqH0+f0Bjh4m4kjL7fybR/GEDxhCNGZAt6+BQTDZmVPKTqI41wwF31GbXD/7g6/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DYnorSFw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DYnorSFw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7329A152B;
	Mon, 21 Sep 2026 23:16:40 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FB443F632;
	Mon, 21 Sep 2026 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790057804; bh=JzDwOfDq7AeFzF7O9lfDqkWJ63pkoijMhPDQ15y0zR8=;
	h=From:To:Cc:Subject:Date:From;
	b=DYnorSFwJzWKUOVKOfEXAceBAus9Bn2Z7oVKCObx1wayxTnPlfu9RildUNRHGYZI2
	 GfTIdzLh0OKkjWBKNKgO+GpYNmt8es67/ZVKRBSfjMTGEjHWaBAUYyFDyHINRxuWsY
	 nuobtJnML9vTkixRBIpBD6WwQlhi8hl7NNTLdtno=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
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
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
Date: Tue, 22 Sep 2026 11:46:34 +0530
Message-ID: <20260922061638.3967467-1-anshuman.khandual@arm.com>
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

git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v2)

Changes in V2:

- Rebased on v7.3-rc4 along with all latest dependencies
- Updated commit messages per Ryan
- Added tag from Ryan

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

 arch/arm64/include/asm/pgtable.h |  6 ++--
 arch/arm64/mm/fault.c            |  8 ++---
 arch/arm64/mm/fixmap.c           |  6 ++--
 arch/arm64/mm/hugetlbpage.c      | 10 +++---
 arch/arm64/mm/kasan_init.c       | 18 +++++-----
 arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
 arch/arm64/mm/pageattr.c         |  8 ++---
 arch/arm64/mm/trans_pgd.c        | 14 ++++----
 8 files changed, 66 insertions(+), 64 deletions(-)

-- 
2.43.0

