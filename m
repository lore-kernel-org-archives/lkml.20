Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899206;
	b=JYOWzWtqvh9MHUdqXEj0yo8NDdkHBLuxfJ3MRluzcuBiqn1ueyP9exT5Mn6AomriGHpe
	 26kWKyA2UykQLsAWZgsC7vh+MmW/AMyd3cwh0YSmNJXyyV6FYktB46zkDfWEvEZiYdxW0
	 34yzWmDTTlvdld3BqkdSNFluddJMwXY8yzQjD5BLGsf4pxTseMP9DEFCj3zPMXbHvGXzZ
	 J1u3q6hOjp5/B+AnuCzy8TQznMCnxNUSaAaNSwqLkNgB0tv4O6R446L5Y4eLNCn8Dm+G2
	 GfECcD3rQ9DC1nQ1c5dX780g9vBKlTqkm3r4EJBQGIo3oRSA3VALZzTDg+4u0pH4nqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899206;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eRJMwvDmLa0Mxt7lUvodHEIfZ5kLtrx4K/1ogYaxsoQ=;
	b=hQMsapTrt6IkV0QapWDsjw0beGLeDwXkHqKW6khIcczOKSbCRJxUAjv2v47V764BqnrP
	 Cv8l6mutPpfZ6UjWcJd/l6DDlpjMAnv6kILSCcqciuMlg+OJaQGFFEwdVBZWGRO+I7MGx
	 BwAwVXsQBpyIAs7Hws/sO2Cy5cIqdqZspVi1VKESN/+oi48JyxSMjyhkCTHn9U9h97wkY
	 /SEfJoV/3KWZW4hv0byRJUHZ/SYHgej4cu9GlOngEHQDECWZ5U4vJduY7Cez7WIf1nqgg
	 9vUSZ1NhGASPUeq8gHF3uGcNLuvZ4LOUvMgP4W/teB5XHBHQS50vikB6opP6pIdgX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EV89ErD8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACE8606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACE8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EV89ErD8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7AF91476;
	Mon, 16 Nov 2026 23:06:42 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B04F3F763;
	Mon, 16 Nov 2026 23:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899205; bh=cjFCjsGjjj3NFQXfJiX7x6ODC1OdEC1eKFuR2TOwJ+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EV89ErD8dmhrCVbgTiKEkJd0dmsZr5W+dUysQu7rq6Ef38hr1a8eEIJaRa9uVoDhJ
	 /Z/yaKebEMMt2WXEM8qXKJjo5Mg+j1a8Y3Vwn0PPF+PuGvprw8y24H1oqjdNvtPscF
	 4xgqMzOlIz4KoSBzl3lkSqgDicQ4ryI07hf66H6o=
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
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 06/14] arm64/mm: Enable fixmap with 5 level page table
Date: Tue, 17 Nov 2026 12:36:05 +0530
Message-ID: <20261117070613.1183243-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
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

FEAT_D128 halves PTRS_PER_PXX thus shrinking the VA range coverage for each
pgtable level. So in order to preserve all existing VA range configurations
for various base page sizes, some pgtable configurations now need to become
5-level which were 4-level earlier.

Since fixmap builds and manipulates kernel page tables early on during boot
these mappings must also gain that additional level, which was not required
earlier.

Changes in the page table geometry can result in the P4D table covering the
fixmap range no longer being populated by other kernel initialization code.

Enable this scenario by allocating and populating a static P4D table during
early fixmap initialization, similar to the existing handling of other page
table levels.

Add a pgd_page_paddr() fallback stub when (PGTBALE_LEVELS <= 4) which helps
in intercepting any unintended usage.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V3:

- Updated the commit message

 arch/arm64/include/asm/pgtable.h |  1 +
 arch/arm64/mm/fixmap.c           | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 737e1e42f1ec0..290aefcf0f0f1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1184,6 +1184,7 @@ static inline p4d_t *p4d_offset_kimg(pgd_t *pgdp, u64 addr)
 #else
 
 static inline bool pgtable_l5_enabled(void) { return false; }
+#define pgd_page_paddr(pgd)	({ BUILD_BUG(); 0; })
 
 #define p4d_index(addr)		(((addr) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
 
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 2a0fe0b0f7710..5512521fef8fa 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -34,6 +34,7 @@ static_assert(NR_BM_PMD_TABLES == 1);
 static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
 static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
 static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
+static p4d_t bm_p4d[PTRS_PER_P4D] __bss_pgtbl __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
@@ -95,6 +96,19 @@ static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
 	early_fixmap_init_pmd(pudp, addr, end);
 }
 
+static void __init early_fixmap_init_p4d(pgd_t *pgdp, unsigned long addr,
+					 unsigned long end)
+{
+	pgd_t pgd = pgdp_get(pgdp);
+	p4d_t *p4dp;
+
+	if (pgd_none(pgd))
+		__pgd_populate(pgdp, __pa_symbol(bm_p4d),
+			       PGD_TYPE_TABLE | PGD_TABLE_AF);
+	p4dp = p4d_offset_kimg(pgdp, addr);
+	early_fixmap_init_pud(p4dp, addr, end);
+}
+
 /*
  * The p*d_populate functions call virt_to_phys implicitly so they can't be used
  * directly on kernel symbols (bm_p*d). This function is called too early to use
@@ -107,9 +121,7 @@ void __init early_fixmap_init(void)
 	unsigned long end = FIXADDR_TOP;
 
 	pgd_t *pgdp = pgd_offset_k(addr);
-	p4d_t *p4dp = p4d_offset_kimg(pgdp, addr);
-
-	early_fixmap_init_pud(p4dp, addr, end);
+	early_fixmap_init_p4d(pgdp, addr, end);
 }
 
 /*
-- 
2.43.0

