Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730BE3ACA46
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534184; cv=none; b=NdrSz9OWser77PSshUqsWxrFzdggHmAZ9SwiloFOqwHtr/ZklGfVbUfowzlg2DHEAfIK7HwuKAmRtiOn/hufCDsgMFDJSYDHz9UYvDeyn6Pr58XU8lX02l6g1FEW58PTla5e3XQqYNOPztHXVuTOV179A1yD4UAYdpS8i8zWEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534184; c=relaxed/simple;
	bh=/pynzF0A3gZILFAu4wuFpsBCz7QyOd1/gAxCI9UIRGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3PbL5dT086w2FXL+7an14K37EuiQCXN1AiSP1jNTVfuEl6k0NCvypooyKP2mM3wnTNYEdhyTXFvTH5deTBfU03ljZYaLO3bW1RrWhj7RTRlyD+TIzSyJwfn/YHUE5fm7Ug9+mxUx9/3suyjkFF9uYlj0CoCuKiIvDQ5/gYL0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gcpjFB6E; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gcpjFB6E"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5423D152B;
	Tue, 15 Sep 2026 21:49:38 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33D933F86F;
	Tue, 15 Sep 2026 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789534181; bh=/pynzF0A3gZILFAu4wuFpsBCz7QyOd1/gAxCI9UIRGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcpjFB6EgLvQQVAFiWJc8GHNZZgIW6kwwYhOxBKre7nN2mtyeWpyRg+BCImi50PGh
	 HfHu0/cnEG81lfmENos4pw2ekoatxNvdJtd035uvXlaYXjm2xhWLAYVijOMiyv38ZT
	 RyFeLq/DuiBES1nv+O5LXQOwfxWnF+hNe4FK8FzU=
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
Subject: [PATCH V3 1/2] arm64/mm: Move __check_safe_pte_update()
Date: Wed, 16 Sep 2026 10:19:32 +0530
Message-ID: <20260916044933.2689426-2-anshuman.khandual@arm.com>
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
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
 arch/arm64/mm/mmu.c              | 44 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e89ec5f4787b..763c5a411d64 100644
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
+#endif /* CONFIG_DEBUG_VM */
 
 static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..cb49469707a8 100644
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
+#endif /* CONFIG_DEBUG_VM */
 #endif
-- 
2.43.0

