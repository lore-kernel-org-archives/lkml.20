Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A643C7C5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232383; cv=none; b=O0t06MsfILNMK9pp3CcKVn854qImbPQOYTM+fZ5yVmjor3b/o50DKCWjW4t8Ha1lKt2xMRFfNbVNtgeiZLSj5H2V2Bx48uLxeAK7aBVBNAv7WnknR+VfXh5MeFE/yk8fPYnAp+q25KSEbujI2kFpr8jWH/wlV57xnVYw3NJ4HYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232383; c=relaxed/simple;
	bh=02J+Qe5fyesF586IwRP1eymetPveRTZQ6LiTFPk0jts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrUVSmi2JwT6kibJirFFWVXGH2pTpKRQyZ7vZYC+arpMRzCoKOu6WaEt5vB167cr/PL0KiuRvRm31o7CM6rOmnT9hnKOExdpQvkzYqVoUPyh4/obSRmvvi4wJv71mQqwlhDhz5ttdqjciYaUS6fCuHh9CO+hvcs3WYNMW/3EV8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QHUvRZlq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QHUvRZlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/uIoSPqM2R1drx5bO2xtSm3XMBl+fSHryO7BumUdVU=;
	b=QHUvRZlqnYsa1Loj/63v+JK7mz7to2UvqBv5Sr8MDna210xa6YFncmXd2Z1Igwk5Iq1yx/
	pfJNdLblXB59JNBQw8/P0TYF+tcXtnw26VwUbC6t6S7YhuWsEuxO+Z+vD1BPXQo2r5RxrD
	evcQ7pcVnZ6JW3jIaH4eY6oUYiuVAQw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-8Qe_BjHDOQeJU0moI1Z-Vg-1; Mon,
 31 Aug 2026 23:12:57 -0400
X-MC-Unique: 8Qe_BjHDOQeJU0moI1Z-Vg-1
X-Mimecast-MFC-AGG-ID: 8Qe_BjHDOQeJU0moI1Z-Vg_1788232374
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C6EC1843AD1;
	Tue,  1 Sep 2026 03:12:53 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0738018005B7;
	Tue,  1 Sep 2026 03:12:48 +0000 (UTC)
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
Subject: [PATCH v7 03/14] mm: introduce pgtable_has_pmd_leaves()
Date: Mon, 31 Aug 2026 23:12:07 -0400
Message-ID: <57cfee4b4c203b8c5219739d5da1ba7d118d2d23.1788232334.git.luizcap@redhat.com>
In-Reply-To: <cover.1788232334.git.luizcap@redhat.com>
References: <cover.1788232334.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
 include/linux/pgtable.h | 16 ++++++++++++++++
 mm/memory.c             |  9 +++++++++
 mm/mm_init.c            |  1 +
 3 files changed, 26 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a..4c00cf53e183 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -14,6 +14,7 @@
 #include <linux/mm_types.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
+#include <linux/jump_label.h>
 #include <asm-generic/pgtable_uffd.h>
 #include <linux/page_table_check.h>
 
@@ -2313,6 +2314,21 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 	}
 }
 
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
index bc14cae3c49d..69ab1bb54853 100644
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
index 33ff95141adb..0476d54d0b6f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2645,6 +2645,7 @@ void __init mm_core_init(void)
 {
 	arch_mm_preinit();
 	init_zero_page_pfn();
+	pgtable_leaf_support_init();
 
 	/* Initializations relying on SMP setup */
 	BUILD_BUG_ON(MAX_ZONELISTS > 2);
-- 
2.55.0

