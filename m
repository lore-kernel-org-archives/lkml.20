Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41FA3955D6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245709; cv=none; b=VgY/mIuTW6VZy/F9oCTLhyl3MEHw5W+wwbjwh11LnKvDfip6TTiU2DK9Jjhrs0YGsNeZOisT3gRXNp9EAQY0DnP7yRiatjoFHmMUAk0gJOm4XtrHb3NXP3iCXY+XL6XL48Llcmwea0LszfySlEwd4D6MvySXDC+/795qpb9MAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245709; c=relaxed/simple;
	bh=2hzv/NqRxDU4SWdVB7ecExnD8ZoMIIlhEra3AsMGD9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlS/BxUYp+BvjlheFC+lKn+9cx2D1XTmnyAmA2zLR6ijGDc+xKBdkoBinQctHt05loeU4BMb5I+wI8r2Bwi5QuyKaGddwgxJ8fYcwGhBIot1YrC6eukAdYMH0Hslksl4Mp908nJWiAweQfUhzLgzFWGj1iLQdexlugPzkcBk0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DA90OAk6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DA90OAk6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E721AED;
	Mon, 31 Aug 2026 23:55:03 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F83C3F85F;
	Mon, 31 Aug 2026 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788245707; bh=2hzv/NqRxDU4SWdVB7ecExnD8ZoMIIlhEra3AsMGD9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DA90OAk6s7/d4f58uVk/xDIOuXs7qXRsRUqf64Mwqa1i2VsbAZOrj5nZNc8g/zTwm
	 S9hjBOZlCgnRHyb86ea8deaMVTDR9vfmTC6fytQTUp3tNlv2H/usJ2b9+X0/5yK+3I
	 zJljC9GrQ1xoaNT62eeLSvKdSRUbbB/tS89uYr/0=
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
Subject: [PATCH 2/2] arm64/mm: Standardize printing for pgtable entries
Date: Tue,  1 Sep 2026 12:24:54 +0530
Message-ID: <20260901065454.1906343-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901065454.1906343-1-anshuman.khandual@arm.com>
References: <20260901065454.1906343-1-anshuman.khandual@arm.com>
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
 arch/arm64/mm/fault.c | 20 +++++++++++++++-----
 arch/arm64/mm/mmu.c   | 16 ++++++++++------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..c75bab3c2f4b 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -130,6 +130,11 @@ static inline unsigned long mm_to_pgd_phys(struct mm_struct *mm)
  */
 static void show_pte(unsigned long addr)
 {
+	char pgd_str[PTVAL_STR_MAX];
+	char p4d_str[PTVAL_STR_MAX];
+	char pud_str[PTVAL_STR_MAX];
+	char pmd_str[PTVAL_STR_MAX];
+	char pte_str[PTVAL_STR_MAX];
 	struct mm_struct *mm;
 	pgd_t *pgdp;
 	pgd_t pgd;
@@ -156,7 +161,8 @@ static void show_pte(unsigned long addr)
 		 vabits_actual, mm_to_pgd_phys(mm));
 	pgdp = pgd_offset(mm, addr);
 	pgd = READ_ONCE(*pgdp);
-	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
+	ptval_to_str(pgd_str, pgd_val(pgd));
+	pr_alert("[%016lx] pgd=%s", addr, pgd_str);
 
 	do {
 		p4d_t *p4dp, p4d;
@@ -169,19 +175,22 @@ static void show_pte(unsigned long addr)
 
 		p4dp = p4d_offset(pgdp, addr);
 		p4d = READ_ONCE(*p4dp);
-		pr_cont(", p4d=%016llx", p4d_val(p4d));
+		ptval_to_str(p4d_str, p4d_val(p4d));
+		pr_cont(", p4d=%s", p4d_str);
 		if (p4d_none(p4d) || p4d_bad(p4d))
 			break;
 
 		pudp = pud_offset(p4dp, addr);
 		pud = READ_ONCE(*pudp);
-		pr_cont(", pud=%016llx", pud_val(pud));
+		ptval_to_str(pud_str, pud_val(pud));
+		pr_cont(", pud=%s", pud_str);
 		if (pud_none(pud) || pud_bad(pud))
 			break;
 
 		pmdp = pmd_offset(pudp, addr);
 		pmd = READ_ONCE(*pmdp);
-		pr_cont(", pmd=%016llx", pmd_val(pmd));
+		ptval_to_str(pmd_str, pmd_val(pmd));
+		pr_cont(", pmd=%s", pmd_str);
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
 
@@ -190,7 +199,8 @@ static void show_pte(unsigned long addr)
 			break;
 
 		pte = __ptep_get(ptep);
-		pr_cont(", pte=%016llx", pte_val(pte));
+		ptval_to_str(pte_str, pte_val(pte));
+		pr_cont(", pte=%s", pte_str);
 		pte_unmap(ptep);
 	} while(0);
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e9c66d26bc0a..b5de4095d650 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2410,6 +2410,8 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
  */
 void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 {
+	char pte_str_old[PTVAL_STR_MAX];
+	char pte_str[PTVAL_STR_MAX];
 	pte_t old_pte;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_VM))
@@ -2427,14 +2429,16 @@ void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
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
-- 
2.43.0

