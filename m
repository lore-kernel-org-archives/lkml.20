Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878888;
	b=CQhh3Sa7ncNlC443oEby1J5ckGUVjzT8We2SStbsxP5LVHgYKnyDqKDUFJxCUReR3lQ8
	 fKwd/v3w1tTUarl3pvxhYVbykrDCa6zQDLLjfxpo8XPnZbXnTGStvT/EzivZaewoVv5GZ
	 /bjbtEjdKH5GW2yOWrUth8slzDxzhtU9mgIKKCZNbhcAwaQXv/Pdn3brqJ/KRLybnnHrQ
	 CrGvlBY3ZbIW024QpwE+kqxf1FWOtE0eGaemw/+ysynsi4QmP8q6XuaUGmAuckQrhaPa6
	 7G/uAK9yphwRkJM80Xb8dzAULX7su5xhNcFb85sQuzd32w5bCXTZMg3VyE5InSvbsKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878888;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QmAbNwXwVHKYRGMSj8CZoXUjCMLaxZm0XCmxx04BOWQ=;
	b=W/pE8JDE5KNGVxz+gtJx2jsavpUHNG5vZW1GdmosX5mio2KsdAuUWqN1yznuVX3CQy1A
	 VyI1aklKcpy/zbLvImo4M1o3liJxcouhSW7W7E0MhJuq7AnzbHdnXZuLMyMv/ACDp336H
	 HHvfTL4aXgnxYRX2fV4iQ3U7px8VaCvbcHgfy/axAfsMZ42nLgpN9LVBEo23xU8p+ZBHQ
	 iuCyH+V5LJDTNd28JtkO9ZSJ8PHUQJNspTzSAEEjUzvcKJoFe+RlWsoU9EQB7Wj/jkdye
	 6qTSclW67dqjU5vvKeYyjXO2T+HyKeQwu0rhWmNq2U7eCnV4kojHiMsfggskNk7qDPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T2HkiMbw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A10606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T2HkiMbw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A729E1684;
	Mon, 16 Nov 2026 17:28:02 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4EB3F673;
	Mon, 16 Nov 2026 17:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794878885; bh=KzMaiatZ60aUw4I9YCheBFeaBAMkbjLBB/ZnXewLexQ=;
	h=From:To:Cc:Subject:Date:From;
	b=T2HkiMbw3Cp/t7RF62dARcK9xmXS5m0gMnCJVLQslW/+zARqeAZagU8k58OmxAi1v
	 n1zP+IAiqaYZEjNGgtoj+gkRg/Ot5Z9qbojXgvQzOTQ4ZZHEZ8iK8DjQMNIKBHGy8o
	 CPMuhjhVbRdpLjbmtgq1VRhxZFJwBZPCSYItCols=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V5 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
Date: Tue, 17 Nov 2026 06:57:54 +0530
Message-ID: <20261117012758.3814093-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
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
V1 series. There are no functional changes here, and besides mm kselftests
do not show any regression.

https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/

This series applies on v7.4-rc3 and have been hosted below for reference.

git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v5)

Changes in V5:

- Dropped previous code movement into C due to Sashiko reported KASAN problems
- Reverted back to V3 series but with const arguments in pxdp_get() overrides
- Updated commit messages as required

Changes in V4:

https://lore.kernel.org/all/20261105043403.3326445-1-anshuman.khandual@arm.com/

- Dropped pxdp_get() platform overrides per Catalin
- Moved pmdp_test_and_clear_young() and [pud|p4d]_offset[_phys]()
  helpers inside arch/arm64/mm/mmu.c
- Updated all commit messages as required

Changes in V3:

https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/

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

