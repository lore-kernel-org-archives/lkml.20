Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E53B776F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696017; cv=none; b=AByvDj5MVUuLggPFFwo6/+ET/TEB4IMCcZRwMEY3nzv5rkov5nd+eO2GTub8S+eG7wF/+u0i7Yx7sFJe0eAz8WLBSt/MK8DBFvhwCvRNTis8coWdiadPrkiLQ2GWILWWmfqtxyyNMpv8CWmxMOlAFC7hQ+cZ+f01YAvWND2E2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696017; c=relaxed/simple;
	bh=VrK40d3DX0MI93+9+A4bVTCrmHDC97LRJVGDMMY3b2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jn4BguQszwg8kipESHvMjZsHqT315IAKpDhrue3Np+ybRXuQ6T0xTkXZYFH2oD/qW1gf9rH6e3NcZ3sw/BxfY6r0UBCnAsGkEpc9rOip9ztBN0NAc0yIlF0g2Y2u2sAcPjULsIT8KbUCk0Ro263ik0zjH8t7sj+sEZEUuXKShcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RZrgbdtq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RZrgbdtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789696008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2dWVXBpZG49NjWH2QMhsNOO3sOsZgIwbcpTmyxFl0I=;
	b=RZrgbdtqxR1iRDFen0o34NyRcDy9cYdyi/2XjOoY/5Nqq+0qhKSnXQ7DS9NX45v9SK8SET
	3ZjEeesvyXM/qIUl4GghYuefegbdCBm0CNw0pY1ujxWMu9/Fodm7Kl55p6MeFK4/L5jIX6
	5C+z/KdXxgZGLJGqRKQ/vJ2hxcPIJKQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-475-9O-xqn6wNoWNUpA0430b-Q-1; Thu,
 17 Sep 2026 21:46:45 -0400
X-MC-Unique: 9O-xqn6wNoWNUpA0430b-Q-1
X-Mimecast-MFC-AGG-ID: 9O-xqn6wNoWNUpA0430b-Q_1789696002
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9415195FCFB;
	Fri, 18 Sep 2026 01:46:42 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3F74B18002A6;
	Fri, 18 Sep 2026 01:46:39 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev
Cc: corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com,
	usama.arif@linux.dev
Subject: [PATCH v8 09/14] powerpc: move has_transparent_hugepage() out of THP guard
Date: Thu, 17 Sep 2026 21:45:30 -0400
Message-ID: <05a71b6011a6eab7b096f262485fcb8b4987976f.1789695931.git.luizcap@redhat.com>
In-Reply-To: <cover.1789695931.git.luizcap@redhat.com>
References: <cover.1789695931.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

A future commit will introduce a kernel API to allow for checking if the
CPU supports PMD-sized pages. This API will be based on the
has_transparent_hugepage() implementation but will be orthogonal to THP
and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.

Move its definition out of the THP guard.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 +++++++++---------
 arch/powerpc/include/asm/book3s/64/radix.h    | 14 +++++++-------
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  4 ++--
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 8e5bd9902bed..79511e6abfca 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -165,9 +165,9 @@ extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pmd_t *pmdp);
-extern int hash__has_transparent_hugepage(void);
 #endif
 
+extern int hash__has_transparent_hugepage(void);
 #endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_4K_H */
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index 7deb3a66890b..a4a44a112ff9 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -278,9 +278,9 @@ extern void hash__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 extern pgtable_t hash__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 extern pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pmd_t *pmdp);
-extern int hash__has_transparent_hugepage(void);
 #endif /*  CONFIG_TRANSPARENT_HUGEPAGE */
 
+extern int hash__has_transparent_hugepage(void);
 #endif	/* __ASSEMBLER__ */
 
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_64K_H */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dff8790a047d..522bb58b6241 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1114,15 +1114,6 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
 {
 }
 
-extern int hash__has_transparent_hugepage(void);
-static inline int has_transparent_hugepage(void)
-{
-	if (radix_enabled())
-		return radix__has_transparent_hugepage();
-	return hash__has_transparent_hugepage();
-}
-#define has_transparent_hugepage has_transparent_hugepage
-
 static inline int has_transparent_pud_hugepage(void)
 {
 	if (radix_enabled())
@@ -1434,6 +1425,15 @@ static inline bool arch_needs_pgtable_deposit(void)
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+extern int hash__has_transparent_hugepage(void);
+static inline int has_transparent_hugepage(void)
+{
+	if (radix_enabled())
+		return radix__has_transparent_hugepage();
+	return hash__has_transparent_hugepage();
+}
+#define has_transparent_hugepage has_transparent_hugepage
+
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
 pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, pte_t *);
 void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..50545cf519bd 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -298,22 +298,22 @@ extern pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 pud_t radix__pudp_huge_get_and_clear(struct mm_struct *mm,
 				     unsigned long addr, pud_t *pudp);
 
-static inline int radix__has_transparent_hugepage(void)
+static inline int radix__has_transparent_pud_hugepage(void)
 {
-	/* For radix 2M at PMD level means thp */
-	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
+	/* For radix 1G at PUD level means pud hugepage support */
+	if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
 		return 1;
 	return 0;
 }
+#endif
 
-static inline int radix__has_transparent_pud_hugepage(void)
+static inline int radix__has_transparent_hugepage(void)
 {
-	/* For radix 1G at PUD level means pud hugepage support */
-	if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
+	/* For radix 2M at PMD level means thp */
+	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
 		return 1;
 	return 0;
 }
-#endif
 
 struct vmem_altmap;
 struct dev_pagemap;
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index d9b5b751d7b7..50316f3fc5d3 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -391,6 +391,8 @@ pmd_t hash__pmdp_huge_get_and_clear(struct mm_struct *mm,
 	return old_pmd;
 }
 
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 int hash__has_transparent_hugepage(void)
 {
 
@@ -422,8 +424,6 @@ int hash__has_transparent_hugepage(void)
 }
 EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
 
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-
 #ifdef CONFIG_STRICT_KERNEL_RWX
 
 struct change_memory_parms {
-- 
2.55.0

