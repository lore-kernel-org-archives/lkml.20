Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18703ED3BA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753051; cv=none; b=qoZhu8+pTJlTc+QpPQCGNVoEUl90sphZfl5HJfGzZRSxxb/gRGLTC8k1DzjiEbJ3JGz6DMGd6Z87+wMCNUnwfKZ3X1/BYAGkSvXCjL6h7XZFdPfDSXh53Jp+cquXenwFYVsIx1CBfcztEjTWbDnmPeMwB4qHVerySHr6iAzgVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753051; c=relaxed/simple;
	bh=mxuT7trp1ApTgSVX4oHgcsRIN1m6b9BgozIHOrKR1EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCxNCx6xFUYPRXVCzYu4mGyU/ozGCJfewOPAsMu89X/hX63r2+W5kfwsXJF4imZO+QzpaX2LVWAsUk9B6D/1B5hTZu0Ozj869obJmVOclliyFAtbNbO7M9/5bFgYcLeYqxO/RjSttXv10jtsbyeYuqpErvWfd9n3pYptKCKHt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FY/dl/yz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FY/dl/yz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 397EC1477;
	Sun,  6 Sep 2026 20:50:42 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FA7E3F7B4;
	Sun,  6 Sep 2026 20:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753045; bh=mxuT7trp1ApTgSVX4oHgcsRIN1m6b9BgozIHOrKR1EA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FY/dl/yzk9KpGi6X+UbeUc4pMhX7cBqWiiGAe7E7rqPNhPI2JJmNjvO4oJOoANJwi
	 e4/vDeO1cADKeq983cahV1Vwor9bXY8kPPJOPael7133LRm23AJ2le9iagrrKEuS4P
	 J7Rt3c7sXHcfdFyA34V4X+bqRHvRLaq+iDaMtY14=
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
Subject: [PATCH V2 03/14] arm64/mm: Route all pgtable writes via ptval_set()
Date: Mon,  7 Sep 2026 09:20:18 +0530
Message-ID: <20260907035030.2839978-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently ptval_set() is defined as WRITE_ONCE() but this will change for
D128 pgtable builds, for which WRITE_ONCE() is not sufficient for single
copy atomicity.

In future this infrastructure can be used for D128 to maintain single copy
atomicity semantics with inline asm blocks.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 11 ++++++-----
 arch/arm64/mm/mmu.c              |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index f764132ca34e..692669ea2d29 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -85,6 +85,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
 }
 
 #define ptval_get(x)		READ_ONCE(x)
+#define ptval_set(x, val)	WRITE_ONCE(x, val)
 
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(pmd_t *pmdp)
@@ -386,7 +387,7 @@ static inline pte_t pte_clear_uffd(pte_t pte)
 
 static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
 {
-	WRITE_ONCE(*ptep, pte);
+	ptval_set(*ptep, pte);
 }
 
 static inline void __set_pte_complete(pte_t pte)
@@ -809,7 +810,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 	}
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-	WRITE_ONCE(*pmdp, pmd);
+	ptval_set(*pmdp, pmd);
 
 	if (pmd_valid(pmd))
 		queue_pte_barriers();
@@ -871,7 +872,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 		return;
 	}
 
-	WRITE_ONCE(*pudp, pud);
+	ptval_set(*pudp, pud);
 
 	if (pud_valid(pud))
 		queue_pte_barriers();
@@ -950,7 +951,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 		return;
 	}
 
-	WRITE_ONCE(*p4dp, p4d);
+	ptval_set(*p4dp, p4d);
 	queue_pte_barriers();
 }
 
@@ -1075,7 +1076,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 		return;
 	}
 
-	WRITE_ONCE(*pgdp, pgd);
+	ptval_set(*pgdp, pgd);
 	queue_pte_barriers();
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 46ff9a92e73a..44af53dc9ba8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -75,7 +75,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 	 * writable in the kernel mapping.
 	 */
 	if (rodata_is_rw) {
-		WRITE_ONCE(*pgdp, pgd);
+		ptval_set(*pgdp, pgd);
 		dsb(ishst);
 		isb();
 		return;
@@ -83,7 +83,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 
 	spin_lock(&swapper_pgdir_lock);
 	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
-	WRITE_ONCE(*fixmap_pgdp, pgd);
+	ptval_set(*fixmap_pgdp, pgd);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
 	 * our new entry before set_p?d() returns. The fixmap's
-- 
2.43.0

