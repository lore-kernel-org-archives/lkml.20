Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899195;
	b=MSlXZ5rKhnSKeoYLGc1rl3FIch7sOnuHzZsi2K9pDucjceLgONL+pY8Srd3euRNZTUFb
	 /k3UWotXlHzjkJqFnNOS5ULPm1hx+FC3G/jZXzbqvZlLdxHlxEp8zatvE9X23FdMxjp1F
	 pwu6MSncd1bt413tHyyX3sr5dKqst2QaDDPi8rhZEcQJiaciK77kWFg0zy+7GUCuowbSq
	 K09Jab4r1QkYGkDIvAQweb9wW76vHKSEn7AVsB0v3O+cfcRlC/Ps2ishWudP1f40a3eRc
	 iIGhJL6GztGtw5WfaF/qAlzL2FDdcg/04FjJkj5iddKXzGeYe8PCq4PKXLtd1v6ZCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899195;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RImp/fV3D3InxuUTVuaSs0rWb42FA9SO6Wnjy1jVERc=;
	b=tf9eGq6FqFvAoTtvnJYYVHqEFJvMorcA0iXvpVrQz88iOUEKaRZzTOiC9yrIYgZLqoCX
	 HTRKhltz2x144tLz2dBz3ITZGzo1fbNxN8gh/m4Xx1BHh7IvJFXroz+W8K0WZupnp0C9K
	 wicWpPzc3usE4xIPmlLhe74bixV3gXqgshnVRqv6W6pvK71S06FyrzZhppNZ3xakRz7bz
	 9tX6Mn7/r5Qs6EYhcunPPJupCdZ9LSrSEfU6TEDEyT6ZCTbO3FVoopDkVgkzJIWRHiCLc
	 dNQasRkHApHR712YxXVPw4ohiA/r5WHVyoPy89/pJmvG0oHT+ffviFtnsPsgIuJwKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QtAAKAKJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF149606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF149606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QtAAKAKJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68A041476;
	Mon, 16 Nov 2026 23:06:31 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F28E3F763;
	Mon, 16 Nov 2026 23:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899194; bh=DlYI5zPVBJe6EC0DN2RG1Fj9YuDqCOwNKOBIujdfKiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtAAKAKJrk1BBv8Kv36+Hc9xlP7OjDbU9LJUZh89SIlom0HQ7BYjyTQUeHt2gOV6d
	 Pj3X+i8Bqc/q6SAE5tdkM+ASpfQxoMNDcPUktMfey+zOgzlDgF/4C/GkC3WO0l99y/
	 VcdEv3jZhSZIMTXJ6U3iaWhtZvXqNLZZ8E+gWvb8=
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
Subject: [PATCH V3 03/14] arm64/mm: Route all pgtable writes via ptval_set()
Date: Tue, 17 Nov 2026 12:36:02 +0530
Message-ID: <20261117070613.1183243-4-anshuman.khandual@arm.com>
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
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 11 ++++++-----
 arch/arm64/mm/mmu.c              |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1c982ccc1e5e3..0ce2e59e09198 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -85,6 +85,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
 }
 
 #define ptval_get(x)		READ_ONCE(x)
+#define ptval_set(x, val)	WRITE_ONCE(x, val)
 
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(const pmd_t *pmdp)
@@ -386,7 +387,7 @@ static inline pte_t pte_clear_uffd(pte_t pte)
 
 static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
 {
-	WRITE_ONCE(*ptep, pte);
+	ptval_set(*ptep, pte);
 }
 
 static inline void __set_pte_complete(pte_t pte)
@@ -815,7 +816,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 	}
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-	WRITE_ONCE(*pmdp, pmd);
+	ptval_set(*pmdp, pmd);
 
 	if (pmd_valid(pmd))
 		queue_pte_barriers();
@@ -877,7 +878,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 		return;
 	}
 
-	WRITE_ONCE(*pudp, pud);
+	ptval_set(*pudp, pud);
 
 	if (pud_valid(pud))
 		queue_pte_barriers();
@@ -956,7 +957,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 		return;
 	}
 
-	WRITE_ONCE(*p4dp, p4d);
+	ptval_set(*p4dp, p4d);
 	queue_pte_barriers();
 }
 
@@ -1081,7 +1082,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 		return;
 	}
 
-	WRITE_ONCE(*pgdp, pgd);
+	ptval_set(*pgdp, pgd);
 	queue_pte_barriers();
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d0a4b8961c7d1..b5bff68dff764 100644
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

