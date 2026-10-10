Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DE4718D4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634922; cv=none; b=sYsBfvgoNuMl+rorgt+z4dc8i9R/pft+FvgsltKnACPXvxx8LKH6xohIB3FtEYJWQzERo4qdt1jYCQAr6xv+snnDh9qYQf21azg51h1DPC8A8BYaXGgAcalY0KtQe2HHu5eCSSypQ7om6TetT/wDYSJ7RyqLVygrF2CRJh5gKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634922; c=relaxed/simple;
	bh=Gd/lGpEkzz6ApCfxq8AmXLvd5ZHlUG2+sFtOdzhhBvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SjuGjLbpiCaW8R2fkEoAx2G488+PCpGJQV4iPbkVp+X8tYGpQpjZkybJocm1AOYUD6H0JKgpTyeZuMCfh6CI48U6qPc/Dr+GAiv5AXmbl6rZDa2G02CgwlrU1Mb0+ln/cUNwYuM8VN37ILoOyqF2f9gHk1x7VN2lZmzuyXYnBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq8UB471; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq8UB471"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so1213245eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791634919; x=1792239719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TWFeRXhI9U2gCQnYURwRZ/xBRhQqIxrja99sCT1wuU=;
        b=Mq8UB471k1xkAsJnIdxlevBm/zDpD9Nlwm8fQBDBMpxAyLIdBhB/9KyovMnpgYvfUh
         EGAE/+o5eLCAlhvDTM5L2wBKIssZfHFvwoD0s1kKUiD6TSbnS8ApLAKe/5rajeVjxIEK
         BlslG4pIPxJUASW5aus3MiFPb/h2Fjv11/JzDEF/8AqqeYn5urrbvfl5uKWOuAuSi/24
         P+aHHKBhbAe5UvtGLjm63vaTcFBvcL1IMiewEKVIVueGRsPR/qgBvEws/qKnh5cyLBKs
         6loR8jrlZ68WrRtVG1YrA1XECkTzpYHWePSafH0L7EeOYr+3fO7ZgHRFfyhQswg09X85
         P6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634919; x=1792239719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TWFeRXhI9U2gCQnYURwRZ/xBRhQqIxrja99sCT1wuU=;
        b=VBZ5MhO1FI1NHXkSeu1jQptwNenfQTA2mL78T56oZlYCxyiCt8Ful7VRbwywl2dJIp
         RJowtJYbu1XUi0U+VWHqLyZGn7TEpplMN1IGuE6NQt8PMFAFjt6aZmHH3OSOFID6CQNr
         WkFCWXFJ+U7qG/pPJySdwRoMU9mFVyLAiA2Cjywuyx+s1QxYCp7NDD0C2kj5P+E6hmNp
         ZZKsP983OQiln6GViKE9fuRyZVH66UjeUgjbQDLCgMMuN7BGU0vSIVwduuB7a5dbgSFf
         tH6fyZlF07Xc3zyN7smJPZvL6ja8zXbFSGjadp8u/LcLw3V58OQLkOoo9eRAEEA8Yk62
         DPkQ==
X-Forwarded-Encrypted: i=1; AKwUvByDMgXosLjpzXnv+z5P40DqCpOMg1lrx7LJNYMbNWR3F5q+GhVP9m28llyCQDvHQvT/CWvtvzZPCssqwUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqUQmk9BYLVrR6vShPwhQ0Wz6vqyLdJyqfO8KOqlSu7HS8h1N0
	BwmAx443GLuzH9FqvFSUh7UYrrmszYIJeOYCpt5uA91gEtL/R4AX5Zi6FuXPB2Iw
X-Gm-Gg: AYBFou1ALluqLv0+jj4i9PkMJ0nJ70LhcNTbfuxouy5LylUJMWURkShqFI0N8UD2KpU
	OIkueicENJkosJhoUKE6rexuHt5weHzKSbOo5IbbvFx/IGRPETXn7TkNnXSxEn9XXhXv6CdLotW
	Ukn2aTEiMXSlcLIgOV5SKm0Ubuu1pnaFwL1Ct89DCActKjEwLQFeVO0NbXjdpOefz6E2ebne+Lu
	T9NWZmfADrphPIQs1fNlDgWT3wwRQgS+DblyhiKxismEObXjU4l6n3qa6zUZIqd3cQSbG4tqUZg
	70Mipw5TyvHih9Pp9TD4alUTJwEuwJCzK45s0pP4Cw8ZUK8457W5dp7iAaJAyDWfjUWzsl137Rc
	fiYl853WwUEREi7uCfBXVayV+sS4NdR1nwD6LAYjcyb3jv3jZ4/LpCefN5PAdYCUXYwCAvTZ/UN
	onGHaVK3acQPJRI8C/ZRiNoMG0VZF+EgRSilaIKZlt0lZO3cmo/71iRnyjdaZczjHCu97fKRqdO
	uAgaTBt4Sor6Mra/Wvor1swcAjfEl2TyML2WhO6vBLqrtSxTo8uQs5G2FZl
X-Received: by 2002:a05:7022:1507:b0:15b:53a4:3495 with SMTP id a92af1059eb24-16a60bf1f13mr8414869c88.35.1791634919405;
        Sat, 10 Oct 2026 05:21:59 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm15401816c88.5.2026.10.10.05.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:21:58 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 2/4] powerpc/64s/radix: Implement ARCH_HAS_SET_DIRECT_MAP
Date: Sat, 10 Oct 2026 17:51:10 +0530
Message-Id: <744ed18f924d7aeb1a92993e90971120f0b7d4d4.1791608423.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791608423.git.ritesh.list@gmail.com>
References: <cover.1791608423.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memfd_secret() keeps a secret by taking its page out of the kernel
linear map. The process that owns the page can still read and write it
through its own mapping, but the kernel no longer has a translation for
that physical page, so a kernel read or a speculative walk of the linear
map cannot see it.

Note that set_memory_np() and set_memory_p() already clear and restore the
present bit for debug_pagealloc and KFENCE, so the same direct-map helpers
are used here to implement ARCH_HAS_SET_DIRECT_MAP for radix.

Note that they can only run when the linear map is already made of base
pages. For implementing this feature when the linear map is mapped with
2M (PMD) or 1G (PUD) mapping - a 2M or 1G leaf would have to be broken
into PTEs first and doing that while the large translation is still in
the TLB installs a second translation for the same address at
a different page size.

On this, the processor architecture manual says that it is fatal:
  If a given virtual address is mapped by two overlapping pages of
  different sizes (for example, a small page is mapped initially but is
  later re-mapped into a larger page without invalidating the original
  TLB entry), a machine check interrupt can result with an indication
  that either a parity error or a multi-hit occurred when the TLB was
  accessed to translate the address. The error condition can be
  corrected by invalidating the entire TLB and SLB.

The same multi-hit applies if the large page was installed first and is
then replaced by PTEs without invalidating that TLB entry. Since today
there is no support for doing that split safely, so can_set_direct_map()
stays false unless the linear map is already page-sized.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/include/asm/set_memory.h |  9 +++
 arch/powerpc/mm/pageattr.c            | 96 +++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2580e27e4328..3c5c07c67a5b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -150,6 +150,7 @@ config PPC
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
+	select ARCH_HAS_SET_DIRECT_MAP		if PPC_RADIX_MMU
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
 	select ARCH_HAS_STRICT_KERNEL_RWX	if PPC_85xx && !HIBERNATION && !RANDOMIZE_BASE
diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index 9c8d5747755d..24779c00c1ca 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -48,4 +48,13 @@ static inline int __must_check set_memory_rox(unsigned long addr, int numpages)
 }
 #define set_memory_rox set_memory_rox

+#ifdef CONFIG_ARCH_HAS_SET_DIRECT_MAP
+bool can_set_direct_map(void);
+#define can_set_direct_map can_set_direct_map
+
+int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
+int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+bool kernel_page_present(struct page *page);
+#endif
+
 #endif
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index ac22bf28086f..a85ac2419e6d 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -103,6 +103,102 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 					    change_page_attr, (void *)action);
 }

+#ifdef CONFIG_ARCH_HAS_SET_DIRECT_MAP
+/*
+ * Removing a single page from the linear mapping requires that the linear
+ * mapping is built out of PAGE_SIZE mappings in the first place. Radix only
+ * does that when explicitly asked to and there is no support for splitting
+ * a live 2M/1G mapping yet.
+ * TODO: Hash is also not supported yet.
+ */
+bool can_set_direct_map(void)
+{
+	if (!radix_enabled())
+		return false;
+
+	return linear_map_uses_base_pagesize();
+}
+
+/*
+ * Note that the set_memory_p()/set_memory_np() helpers below already flush the
+ * TLB for the range they touch, so the _noflush() naming is not honoured
+ * literally here.
+ * Since as of now this is not in the performance path, so it should be ok.
+ * Later, once the support for breaking the large mappings (PUD/PMD) into PTE is
+ * added, then this can be improved since it will anyway require a custom
+ * implementation for walking the page table and breaking the mapping.
+ */
+int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (!can_set_direct_map())
+		return 0;
+
+	return set_memory_np(addr, numpages);
+}
+
+int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (!can_set_direct_map())
+		return 0;
+
+	return set_memory_p(addr, numpages);
+}
+
+/*
+ * Walk the kernel page table looking for the entry that translates @addr.
+ * Currently secretmemfd is the only usecase for this.
+ */
+static bool radix_page_present(unsigned long addr)
+{
+	pgd_t *pgdp;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+	pte_t *ptep;
+
+	pgdp = pgd_offset_k(addr);
+
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = READ_ONCE(*p4dp);
+	if (p4d_none(p4d))
+		return false;
+
+	pudp = pud_offset(p4dp, addr);
+	pud = READ_ONCE(*pudp);
+	if (pud_none(pud))
+		return false;
+	if (pud_leaf(pud))
+		return pud_present(pud);
+
+	pmdp = pmd_offset(pudp, addr);
+	pmd = READ_ONCE(*pmdp);
+	if (pmd_none(pmd))
+		return false;
+	if (pmd_leaf(pmd))
+		return pmd_present(pmd);
+
+	ptep = pte_offset_kernel(pmdp, addr);
+	return pte_hw_valid(ptep_get(ptep));
+}
+
+bool kernel_page_present(struct page *page)
+{
+	/*
+	 * Nothing ever removes entries from the linear mapping in this
+	 * configuration, so everything is present.
+	 */
+	if (!can_set_direct_map())
+		return true;
+
+	return radix_page_present((unsigned long)page_address(page));
+}
+#endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
+
+
 #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 #ifdef CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
--
2.39.5

