Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D980D3546F9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926422; cv=none; b=CcKpw39gOlE0OkfcFsPUDx1vXIVb8OvNuFJjRJGlU7Tu3e4vFKCMqB7jBRWG1lgqPIgbuAgMp1NmKlo8LzVvsx/qPHCDbFjv+pRh0UuVzasmJbNUZuNpKi3vE3X8k3DpJO6YljsoTaV+z8c9DwNNQTK5KrAvc/xHWIdan3dp2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926422; c=relaxed/simple;
	bh=U8t03BH95uIReM5gGaLf+aJqwm/RpI+Qj5wFNcim6XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awRdqBIo4x47HnRUTA1WFnZh7pjGQZOaO1XkyiW8IG+0cE7uewqHM4Kw9TQ1WEAesQMF5akgAgzU+wfEUOIZWKB0JQgqfv7RBSMLOolF3ZcRGMHRkzGnz8Ys8kYgV1QvC1z3feDfEKR8/guX621mjG/YHH8wyRpt0MNsHJFxQx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ug+EtDLP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ug+EtDLP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EC1D1477;
	Tue,  8 Sep 2026 21:00:14 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0382A3F528;
	Tue,  8 Sep 2026 21:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788926417; bh=U8t03BH95uIReM5gGaLf+aJqwm/RpI+Qj5wFNcim6XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ug+EtDLPJOfYjPOWsAmFFj9LTsUzGcUTlKj5w2+XZfk95JRIYfU2PaZcCUb8/j/cp
	 FTk88wBGOJpq/uW/ersOaw782hG69BZfGZCvQppHf/hhjgkTTQazRsn4wTM6CwCf5P
	 VTxYPV2buK/Cg+Tgtkge2y4SP+GHXDKVMk5c0y6g=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 2/2] arm64/mm: Standardize printing for pgtable entries
Date: Wed,  9 Sep 2026 09:30:05 +0530
Message-ID: <20260909040005.4148136-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909040005.4148136-1-anshuman.khandual@arm.com>
References: <20260909040005.4148136-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize printing for pgtable entries using recently introduced generic
helper ptval_bytes_to_hex_str() in core MM which automatically enables 128
bits entries when added later.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:

- Replaced pgtable level specific strings with pxd_str[] in show_pte()

 arch/arm64/mm/fault.c | 16 +++++++++++-----
 arch/arm64/mm/mmu.c   | 16 ++++++++++------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 75c3e463df2e..2cecf6ba6df7 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -131,6 +131,7 @@ static inline unsigned long mm_to_pgd_phys(struct mm_struct *mm)
  */
 static void show_pte(unsigned long addr)
 {
+	char pxd_str[PTVAL_STR_MAX];
 	struct mm_struct *mm;
 	pgd_t *pgdp;
 	pgd_t pgd;
@@ -160,7 +161,8 @@ static void show_pte(unsigned long addr)
 
 	pgdp = pgd_offset(mm, addr);
 	pgd = READ_ONCE(*pgdp);
-	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
+	ptval_to_str(pxd_str, pgd_val(pgd));
+	pr_alert("[%016lx] pgd=%s", addr, pxd_str);
 
 	do {
 		p4d_t *p4dp, p4d;
@@ -173,19 +175,22 @@ static void show_pte(unsigned long addr)
 
 		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
 		p4d = READ_ONCE(*p4dp);
-		pr_cont(", p4d=%016llx", p4d_val(p4d));
+		ptval_to_str(pxd_str, p4d_val(p4d));
+		pr_cont(", p4d=%s", pxd_str);
 		if (p4d_none(p4d) || p4d_bad(p4d))
 			break;
 
 		pudp = pud_offset_lockless(p4dp, p4d, addr);
 		pud = READ_ONCE(*pudp);
-		pr_cont(", pud=%016llx", pud_val(pud));
+		ptval_to_str(pxd_str, pud_val(pud));
+		pr_cont(", pud=%s", pxd_str);
 		if (pud_none(pud) || pud_bad(pud))
 			break;
 
 		pmdp = pmd_offset_lockless(pudp, pud, addr);
 		pmd = READ_ONCE(*pmdp);
-		pr_cont(", pmd=%016llx", pmd_val(pmd));
+		ptval_to_str(pxd_str, pmd_val(pmd));
+		pr_cont(", pmd=%s", pxd_str);
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
 
@@ -194,7 +199,8 @@ static void show_pte(unsigned long addr)
 			break;
 
 		pte = __ptep_get(ptep);
-		pr_cont(", pte=%016llx", pte_val(pte));
+		ptval_to_str(pxd_str, pte_val(pte));
+		pr_cont(", pte=%s", pxd_str);
 		pte_unmap(ptep);
 	} while(0);
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 0b2d190d62c3..26f4cf7b753e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2411,6 +2411,8 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 #ifdef CONFIG_DEBUG_VM
 void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 {
+	char pte_str_old[PTVAL_STR_MAX];
+	char pte_str[PTVAL_STR_MAX];
 	pte_t old_pte;
 
 	old_pte = __ptep_get(ptep);
@@ -2425,15 +2427,17 @@ void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 	 * (__ptep_set_access_flags safely changes valid ptes without going
 	 * through an invalid entry).
 	 */
+	ptval_to_str(pte_str, pte_val(pte));
+	ptval_to_str(pte_str_old, pte_val(old_pte));
 	VM_WARN_ONCE(!pte_young(pte),
-		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: racy access flag clearing: %s -> %s",
+		     __func__, pte_str_old, pte_str);
 	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
-		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: racy dirty state clearing: %s -> %s",
+		     __func__, pte_str_old, pte_str);
 	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
-		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: unsafe attribute change: %s -> %s",
+		     __func__, pte_str_old, pte_str);
 }
 #endif
 #endif
-- 
2.43.0

