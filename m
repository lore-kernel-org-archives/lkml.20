Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBA43B8BD7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788415625; cv=none; b=A4lTIj2CKMtFck+D6MlTWqCkkvcfaNXo42tSwL30KVQofPTZPwRcUgdpxP+brJGZpX0Fy+3c+3CaywvGxQr+bEtROYkF7CPx6bt5B5D0oWo68kBiE6htkVoAj5FWHvm1F9Md8Zx/fdLKxSfdViPyG04K2h5vnWHXibvkmGny8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788415625; c=relaxed/simple;
	bh=OKX3pM6qPR5VwfjZ2I5q4WvBQf//Z/2s1Np9M3JJ/8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGuDrSrSPDb+Sa+wio7md8YhO/24kokL/WG5CAZ5oh8KgaBJxmbeQ+5li6Rg58Z0jRmgG0Uun3oDRUqweY+epVKH5NaHK6UB5FuvvMgRwJ6miBf0CCuQHYQgAI0DnH3VsmJIjDaSGNyU33EIwLb44oVQyatTF4fsH8pEHd6K+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F7O3rR7i; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F7O3rR7i"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251071596;
	Wed,  2 Sep 2026 23:06:58 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ADF93F673;
	Wed,  2 Sep 2026 23:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788415621; bh=OKX3pM6qPR5VwfjZ2I5q4WvBQf//Z/2s1Np9M3JJ/8s=;
	h=From:To:Cc:Subject:Date:From;
	b=F7O3rR7i0pqlWDozf/2IUt/ocHu0IMjyjDgb81pOXi74+CU/741Fi0vprY0V679yy
	 DdoQq86W98uQah//jiMjAmhsAFzzYyvjs0YrptVhAbTfdk1bD8KBenREHbLrjL2ERm
	 N1wc0qnGl8BhdfpI9DsVVQ+oFOgepqy7qfFT1jSw=
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
Subject: [PATCH 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
Date: Thu,  3 Sep 2026 11:36:53 +0530
Message-ID: <20260903060657.2717457-1-anshuman.khandual@arm.com>
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
current D64 translation.

This is similar to generic MM, where all atomic accesses have already been
converted from READ_ONCE() into pgtable level specific accessors.

These are preparatory patches for D128 enablement, although standing their
own for D64 translation as well. These patches are split from earlier D128
V1 series. There are no functional changes here, and besides mm kselftests
do not show any regression.

https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/

This series applies on v3.7-rc1 but after applying the following patches
related to pgtable entry print standardization posted earlier.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

https://lore.kernel.org/linux-mm/20260901065454.1906343-1-anshuman.khandual@arm.com/

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
  arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
  arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
  arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
  arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD

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

