Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6186D286D4D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534188; cv=none; b=fd/7xCWNtwvDboMwkakOxO1GgCiloWthoRzHubVLATOW93KkaydCIAn+tpblHPcnatg1W6lyXzXPmtHHXaexDYQ404+Hf+vJ0xxPzIcPAVsq+dibVqtlCXLOnZba2/uCLVO+ck5PnpVedtsjVUGWGMF/6ECXXnuaggsGPM9V0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534188; c=relaxed/simple;
	bh=+FY3+CYyIjz1fY7lpWOX7WGahZAF+qIh85nM2GpHoxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cp1lVjC6GU7RRSYo62OVxiFAiqiBWVO/OGtLdkS2L/ejH00khM633/BZREVsPE5YzgVSaegxsu0MsN9o+Gxz2zB3NOS+izVdGzIZLdQzNMNgucym+xIqK+lWBmTM0sU5ztN87IykqKGOSJ94IG5MlDnTn5ZCdOei53x2xyrtsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QoW3Rxkp; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QoW3Rxkp"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A7581516;
	Tue, 15 Sep 2026 21:49:42 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 093853F86F;
	Tue, 15 Sep 2026 21:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789534185; bh=+FY3+CYyIjz1fY7lpWOX7WGahZAF+qIh85nM2GpHoxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QoW3RxkpsQUhzNuWJpE9fHmFGXxXHcCADhZagjnTeUrAsuWjZu3BvE1b0VXkt6oCH
	 Z7DrtGW+rhDLXz8RvjAaM/XkeeUEdLNMATwZib3ZL2XmtP2f4+xtTo1nJ0MqnQpFsw
	 mGG/m2mfmR1Y4By6YKd0pxV+28ifmh6+dUbr4lio=
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
Subject: [PATCH V3 2/2] arm64/mm: Standardize printing for pgtable entries
Date: Wed, 16 Sep 2026 10:19:33 +0530
Message-ID: <20260916044933.2689426-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916044933.2689426-1-anshuman.khandual@arm.com>
References: <20260916044933.2689426-1-anshuman.khandual@arm.com>
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
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
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
index cb49469707a8..e589fb00d1e3 100644
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
 #endif /* CONFIG_DEBUG_VM */
 #endif
-- 
2.43.0

