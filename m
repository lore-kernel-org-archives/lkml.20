Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765AF3905E0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696028; cv=none; b=hlESbPSLeoQmScj9H36LggHJhWxzHPosIIZXl7NzmVL8CXfGNt8Hte5TsbqepRrN3fTdKXG33rKziT9h3knKOvDBGYQVdK6QUKQpr10t+FbZcz5+wnzV1L7ozFYV39fg1ouN5K7p3KjrbCr/PAuKsJqku5pmT1RWFS2f101vMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696028; c=relaxed/simple;
	bh=cG7huj9TDwRQunHViZnWICqhigwv6Nb0Her5yfGDYOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aX2cMkHA8/0R9OjmAmxXYgW3/ctzHMVukj2W6Q/xdAkKCfIT3KjZi6/5PNpQPSxfzdtphIGnCCG5G48Elgfiy0COEdYec4p9bopgBEGKRQN2GM/Nxejf7K+3ognNduNx3n1s7bdRdMdeu/AiIiQuEqgC88HJslYDHO2UwDP4/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SbVAKnGF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SbVAKnGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789696013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rsETOCxsnGoxp5I/fBy/awngfGJ8vwYAl7i19XvMBac=;
	b=SbVAKnGFmlnsA0JqY4Mkm8WBl0dfPMZjNQpE9M0rlfRui63f+6pMLaUBuC6L6CocvBDQzY
	ZH9fY8HlzDVv/MEziLW8NJMs32+SI/XFjjT7XZvUhh8SQiUdMiBJy97BW7xOBk36CCHRYF
	KI9p7RKATmfvopHNDZEjWIFGOY8hros=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-7Wjpv7WeOSKWc1MHEwt8QA-1; Thu,
 17 Sep 2026 21:46:49 -0400
X-MC-Unique: 7Wjpv7WeOSKWc1MHEwt8QA-1
X-Mimecast-MFC-AGG-ID: 7Wjpv7WeOSKWc1MHEwt8QA_1789696006
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B658187A5F6;
	Fri, 18 Sep 2026 01:46:46 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF113180034C;
	Fri, 18 Sep 2026 01:46:42 +0000 (UTC)
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
Subject: [PATCH v8 10/14] mips: move has_transparent_hugepage() out of THP guard
Date: Thu, 17 Sep 2026 21:45:31 -0400
Message-ID: <13b8b68cde4d6cccd6eb9b73cfe083145bd1f014.1789695931.git.luizcap@redhat.com>
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

This commit moves has_transparent_hugepage() definition to
arch/mips/mm/pgtable.c under CONFIG_CPU_SUPPORTS_HUGEPAGES guard in
order to ensure that it's only used in CPUs that support the register
operations performed.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 arch/mips/include/asm/pgtable.h |  6 +++---
 arch/mips/mm/pgtable.c          | 25 +++++++++++++++++++++++++
 arch/mips/mm/tlb-r4k.c          | 22 ----------------------
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index fa7b935f947c..b038da872ec6 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
 /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
 #define pmdp_establish generic_pmdp_establish
 
-#define has_transparent_hugepage has_transparent_hugepage
-extern int has_transparent_hugepage(void);
-
 static inline int pmd_trans_huge(pmd_t pmd)
 {
 	return !!(pmd_val(pmd) & _PAGE_HUGE);
@@ -743,6 +740,9 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define has_transparent_hugepage has_transparent_hugepage
+extern int has_transparent_hugepage(void);
+
 #ifdef _PAGE_HUGE
 #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
index 10835414819f..4515fa42f0b3 100644
--- a/arch/mips/mm/pgtable.c
+++ b/arch/mips/mm/pgtable.c
@@ -23,3 +23,28 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pgd_alloc);
+
+#ifdef CONFIG_CPU_SUPPORTS_HUGEPAGES
+int has_transparent_hugepage(void)
+{
+	static unsigned int mask = -1;
+
+	if (mask == -1) {	/* first call comes during __init */
+		unsigned long flags;
+
+		local_irq_save(flags);
+		write_c0_pagemask(PM_HUGE_MASK);
+		back_to_back_c0_hazard();
+		mask = read_c0_pagemask();
+		write_c0_pagemask(PM_DEFAULT_MASK);
+		local_irq_restore(flags);
+	}
+	return mask == PM_HUGE_MASK;
+}
+#else
+int has_transparent_hugepage(void)
+{
+	return 0;
+}
+#endif
+EXPORT_SYMBOL(has_transparent_hugepage);
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 24fe85fa169d..625f1c0dd71e 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -432,28 +432,6 @@ void add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
 #endif
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-
-int has_transparent_hugepage(void)
-{
-	static unsigned int mask = -1;
-
-	if (mask == -1) {	/* first call comes during __init */
-		unsigned long flags;
-
-		local_irq_save(flags);
-		write_c0_pagemask(PM_HUGE_MASK);
-		back_to_back_c0_hazard();
-		mask = read_c0_pagemask();
-		write_c0_pagemask(PM_DEFAULT_MASK);
-		local_irq_restore(flags);
-	}
-	return mask == PM_HUGE_MASK;
-}
-EXPORT_SYMBOL(has_transparent_hugepage);
-
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
-
 /*
  * Used for loading TLB entries before trap_init() has started, when we
  * don't actually want to add a wired entry which remains throughout the
-- 
2.55.0

