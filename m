Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9E2355819
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926420; cv=none; b=sMTRS53gF3a0+GM3mZF0QsfRcFhVgGVpQdrXEfrqsgNBFXs9aiTqysRNPuZ56d9UBKGMOTVPQIMbRjBviIYHXvbjxqGn3fl/fnNXZp7ZB0raULesIvjOwQVPEXO3htp227mxjsViREq/QRRh/7CV4BsV7oPmdo7ZX49IIkv1IHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926420; c=relaxed/simple;
	bh=p1pm1d0/ykppLNUYpZykAVnZ9mf+hCneD8UXO1pbkTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUkzj0LVc4WpyY3Ek1UFyVEZPbdZkH0N+fB0ytICe8xVMS6QM26L/Q+0xMHfGgH9N3oaqFesH97lq2YhrBBRatMahYp+JnUaFWq7Ja4BmC7jwBDp5GwSoqZuLuQ4MAt2eGSf28dAgLAVxHDX/YmkUKBtCu2fHoXeQ2c5fNNBhGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BK1r/nZO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BK1r/nZO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39DEF1CDD;
	Tue,  8 Sep 2026 21:00:10 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CA863F528;
	Tue,  8 Sep 2026 21:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788926413; bh=p1pm1d0/ykppLNUYpZykAVnZ9mf+hCneD8UXO1pbkTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BK1r/nZOWumKhp01NvJaIOvAke6/uWN7AKuIc2lKbEKvgjJQ4E/iDqW0rzeM2ri22
	 SVz1SVyp3OdpFAZmK1r3EptEcXTuE/M4EhYZ/3OujVAzKSZczu9YQz3upKIndTR+UJ
	 +LQIu5yTabYFIydvi9zFkLedoS/VoWie77P8uerg=
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
Subject: [PATCH V2 1/2] arm64/mm: Move __check_safe_pte_update()
Date: Wed,  9 Sep 2026 09:30:04 +0530
Message-ID: <20260909040005.4148136-2-anshuman.khandual@arm.com>
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

The page table entry print helpers and related macros which are defined in
<linux/pgtable.h> will not be accessible in platform <asm/pgtable.h> which
is basically caused by cycling dependency.

Move __check_safe_pte_update() inside arch/arm64/mm/mmu.c as a preparation
for subsequent usage of the afore mentioned generic MM helpers. While here
drop IS_ENABLED(CONFIG_DEBUG_VM), although wrap __check_safe_pte_update()
inside #ifdef CONFIG_DEBUG_VM that preserves the current code optimization
which is achieved via the static inline functions.

This does not cause any functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:

- Moved __check_safe_pte_update() inside #ifdef CONFIG_DEBUG_VM
- Added empty stub for __check_safe_pte_update() when !CONFIG_DEBUG_VM
- Dropped IS_ENABLED(CONFIG_DEBUG_VM) from __check_safe_pte_update()

 arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
 arch/arm64/mm/mmu.c              | 44 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e89ec5f4787b..281a512f1fc6 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -387,52 +387,13 @@ static inline pte_t __ptep_get(pte_t *ptep)
 extern void __sync_icache_dcache(pte_t pteval);
 bool pgattr_change_is_safe(pteval_t old, pteval_t new);
 
-/*
- * PTE bits configuration in the presence of hardware Dirty Bit Management
- * (PTE_WRITE == PTE_DBM):
- *
- * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
- *   0      0      |   1           0          0
- *   0      1      |   1           1          0
- *   1      0      |   1           0          1
- *   1      1      |   0           1          x
- *
- * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
- * the page fault mechanism. Checking the dirty status of a pte becomes:
- *
- *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
- */
-
-static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
-					   pte_t pte)
+#ifdef CONFIG_DEBUG_VM
+void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
+#else
+static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 {
-	pte_t old_pte;
-
-	if (!IS_ENABLED(CONFIG_DEBUG_VM))
-		return;
-
-	old_pte = __ptep_get(ptep);
-
-	if (!pte_valid(old_pte) || !pte_valid(pte))
-		return;
-	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
-		return;
-
-	/*
-	 * Check for potential race with hardware updates of the pte
-	 * (__ptep_set_access_flags safely changes valid ptes without going
-	 * through an invalid entry).
-	 */
-	VM_WARN_ONCE(!pte_young(pte),
-		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
-	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
-		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
-	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
-		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
 }
+#endif
 
 static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..0b2d190d62c3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2392,4 +2392,48 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 
 	return 0;
 }
+
+/*
+ * PTE bits configuration in the presence of hardware Dirty Bit Management
+ * (PTE_WRITE == PTE_DBM):
+ *
+ * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
+ *   0      0      |   1           0          0
+ *   0      1      |   1           1          0
+ *   1      0      |   1           0          1
+ *   1      1      |   0           1          x
+ *
+ * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
+ * the page fault mechanism. Checking the dirty status of a pte becomes:
+ *
+ *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
+ */
+#ifdef CONFIG_DEBUG_VM
+void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
+{
+	pte_t old_pte;
+
+	old_pte = __ptep_get(ptep);
+
+	if (!pte_valid(old_pte) || !pte_valid(pte))
+		return;
+	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
+		return;
+
+	/*
+	 * Check for potential race with hardware updates of the pte
+	 * (__ptep_set_access_flags safely changes valid ptes without going
+	 * through an invalid entry).
+	 */
+	VM_WARN_ONCE(!pte_young(pte),
+		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
+		     __func__, pte_val(old_pte), pte_val(pte));
+	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
+		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
+		     __func__, pte_val(old_pte), pte_val(pte));
+	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
+		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
+		     __func__, pte_val(old_pte), pte_val(pte));
+}
+#endif
 #endif
-- 
2.43.0

