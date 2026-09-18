Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3172F7EF2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695996; cv=none; b=bmdjQTUonrh6p+G7Ua3EMZVOlkw88QvVqraA1WBlHCQQgzABFWkyYIK1o5nL4CH78AtSqq5fZ3mxtnT3/zEotG9v4jkjhE3uc29PaOl7GBifY+6y8TSfSfWKKuIcepxm5gQI46bNh5PRVweOvQ5jsrhzmp92dc0/k+AIVJA/WQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695996; c=relaxed/simple;
	bh=9TtMlKUhC3kUaaYnnbpXQO/bvNgT2A1SIMbNhCWDsDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/F0lpqSqU8GcRAAwOE/YegKPxaCuj3FMvFAUybXTCD43Fkdszso4M9iXJ9LJAzPeo9YWHY+w8stD1C0u4NugNAo2OLe4prR2w8U8sh+ke9Hbgt6rXsAMtEgXW65tEGOtam7vCk75Si4mzQ2G76plbpayeXAi7YPcv6cqJlFpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MtqFvPLn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MtqFvPLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789695984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fp/JTknm2HmMVKkPZDQSkPjhzxNQSd/nlZgjgxUnixc=;
	b=MtqFvPLnFGjdyxttpcszGd4sBzn2fgvP8a85pgRhGxpaIZjGh+evG5eolCruEw+XPBXZeE
	5SutAbp7cqw5p5pG/U5HCTlMt1x8ylNcyq181OHxYZGFty7266vm7Dsgf9h0tIEfF6EMSY
	9ON1PqmR7RXJKDjqI+SXs9KcCXNlsPE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-2mtBXmLqMh6KR07oldneiw-1; Thu,
 17 Sep 2026 21:46:21 -0400
X-MC-Unique: 2mtBXmLqMh6KR07oldneiw-1
X-Mimecast-MFC-AGG-ID: 2mtBXmLqMh6KR07oldneiw_1789695978
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1126195DE67;
	Fri, 18 Sep 2026 01:46:17 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8FBB18002B1;
	Fri, 18 Sep 2026 01:46:12 +0000 (UTC)
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
Subject: [PATCH v8 03/14] mm: introduce pgtable_has_pmd_leaves()
Date: Thu, 17 Sep 2026 21:45:24 -0400
Message-ID: <f0b6d8a8036ee6c2aef2a63e9a03d94292a2c599.1789695931.git.luizcap@redhat.com>
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

Currently, we have two helpers that check for PMD-sized pages but have
different names and slightly different semantics:

- has_transparent_hugepage(): the name suggests it checks if THP is
  enabled, but when CONFIG_TRANSPARENT_HUGEPAGE=y and the architecture
  implements this helper, it actually checks if the CPU supports
  PMD-sized pages

- thp_disabled_by_hw(): the name suggests it checks if THP is disabled
  by the hardware, but it just returns a cached value acquired with
  has_transparent_hugepage() during boot. This helper is used in fast
  paths

A better design would be to separate CONFIG_TRANSPARENT_HUGEPAGE
checking, which can be done with the IS_ENABLED() macro, from checking
if a CPU supports PMD-sized pages.

To this end, this commit introduces a new helper called
pgtable_has_pmd_leaves() which offers the following advantages:

 1. Well defined and clear semantics: it returns true if the CPU
    supports PMD-sized pages and false otherwise
 2. It always returns a cached value, so it can be used in fast paths
 3. It's implemented with a static key: it's a no-op for archs not
    implemeting it and for archs implementing it the static key is
    changed only during boot

The new helper requires an initialization step which is performed by
pgtable_leaf_support_init(). We call pgtable_leaf_support_init() early
during boot from mm_core_init().

The next commits will convert users of both has_transparent_hugepage()
and thp_disabled_by_hw() to pgtable_has_pmd_leaves() and/or
IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE).

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 include/linux/pgtable.h | 17 +++++++++++++++++
 mm/memory.c             |  9 +++++++++
 mm/mm_init.c            |  1 +
 3 files changed, 27 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e3c8ab96941c..ad852a415114 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -14,6 +14,7 @@
 #include <linux/mm_types.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
+#include <linux/jump_label.h>
 #include <asm-generic/pgtable_uffd.h>
 #include <linux/page_table_check.h>
 
@@ -2327,6 +2328,22 @@ void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_
 #else
 #define PTVAL_STR_MAX	(16 + 1) /* Max 64-bit value in hex + NUL */
 #endif
+
+#ifdef CONFIG_MMU
+DECLARE_STATIC_KEY_TRUE(__arch_has_pmd_leaves_key);
+static inline bool pgtable_has_pmd_leaves(void)
+{
+	return static_branch_likely(&__arch_has_pmd_leaves_key);
+}
+void __init pgtable_leaf_support_init(void);
+#else
+static inline bool pgtable_has_pmd_leaves(void)
+{
+	return false;
+}
+static inline void __init pgtable_leaf_support_init(void) { }
+#endif
+
 #endif /* !__ASSEMBLER__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
diff --git a/mm/memory.c b/mm/memory.c
index 9e4a70421a6b..900539acb7d9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -164,6 +164,15 @@ __setup("norandmaps", disable_randmaps);
 
 unsigned long highest_memmap_pfn __read_mostly;
 
+DEFINE_STATIC_KEY_TRUE(__arch_has_pmd_leaves_key);
+EXPORT_SYMBOL(__arch_has_pmd_leaves_key);
+
+void __init pgtable_leaf_support_init(void)
+{
+	if (!has_transparent_hugepage())
+		static_branch_disable(&__arch_has_pmd_leaves_key);
+}
+
 void mm_trace_rss_stat(struct mm_struct *mm, int member)
 {
 	trace_rss_stat(mm, member);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 56bb4567a494..28685f766234 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2693,6 +2693,7 @@ void __init mm_core_init(void)
 {
 	arch_mm_preinit();
 	init_zero_page_pfn();
+	pgtable_leaf_support_init();
 
 	/* Initializations relying on SMP setup */
 	BUILD_BUG_ON(MAX_ZONELISTS > 2);
-- 
2.55.0

