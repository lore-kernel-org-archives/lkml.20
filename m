Received: from mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04F747D948
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934987; cv=none; b=C9rsjdzt5/gYB+6t7ELH+KqoFizxysCgIo5/lpBcDdM0meFYrChMmP9vs183nw73hwKbLa77XlynFge0Ufqq4buV4zjNGF88Ex359uiVgyYHgWbNzhakiEWYZL259lWmceM+oCYMN8s1/1RCm1hTUgew1l2hnBq3d1Md66vxyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934987; c=relaxed/simple;
	bh=tZ9+wDL6rWNTsZNFf4VIK3WwHrcNDZjVqDRCGrUUBnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKB2Mu2okE25RC7SWwqWl54C5e/JPinK1nRtCgGNB2UNfvZFPTsKsE3oJlmHvCvFzloOqVDL0X3+6jWjyl8398CEpBhwqkMYKUJrc8qPsZ2Lsq+qQWHp3UyapX0P22qpS1QnxOikx7UZDcp1o/bE7Vht686opN6HYdmYimpL4TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P3cgA1ar; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P3cgA1ar"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tZ9+wDL6rWNTsZNFf4VIK3WwHrcNDZjVqDRCGrUUBnU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934983; v=1; x=1791539783;
 b=P3cgA1arufy0XFSaVdY3EeZqsSQWwCVF9/2rCfXFQMLW9SKHf3b6zbcE5lL+oqj+eEs7egAG
 YL3vlwkznYQm61fA/eTRWV+vlX0fLp6LWomEGqoh8d3dHXPxsiB5k7ZtTMoxkmG2xrkU4N76eIC
 jwtek618cHbMJIeoXnyNOMZc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6322d5cd786ef910;
	Fri, 02 Oct 2026 09:56:23 +0000
X-Mizu-Trace-ID: 6322d5cd786ef910
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v8 09/30] mm/debug_vm_pgtable: test PMD swap-exclusive helpers
Date: Fri,  2 Oct 2026 02:52:23 -0700
Message-ID: <20261002095503.3585565-10-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An architecture that picked a PMD exclusive bit overlapping the swap type
or offset field would otherwise only be caught by data corruption at
runtime. Mirror pte_swap_exclusive_tests() at PMD level.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/debug_vm_pgtable.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 2875fd22d7bb0..863111c6d4eb3 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -802,6 +802,45 @@ static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
 	WARN_ON(memcmp(&entry, &softleaf, sizeof(entry)));
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static void __init pmd_swap_exclusive_tests(struct pgtable_debug_args *args)
+{
+	swp_entry_t entry;
+	softleaf_t softleaf;
+	pmd_t pmd;
+
+	if (!has_transparent_hugepage())
+		return;
+
+	pr_debug("Validating PMD swap exclusive\n");
+	entry = args->swp_entry;
+
+	pmd = softleaf_to_pmd(entry);
+	softleaf = softleaf_from_pmd(pmd);
+
+	WARN_ON(pmd_swp_exclusive(pmd));
+	WARN_ON(!softleaf_is_swap(softleaf));
+	WARN_ON(memcmp(&entry, &softleaf, sizeof(entry)));
+
+	pmd = pmd_swp_mkexclusive(pmd);
+	softleaf = softleaf_from_pmd(pmd);
+
+	WARN_ON(!pmd_swp_exclusive(pmd));
+	WARN_ON(!softleaf_is_swap(softleaf));
+	WARN_ON(pmd_swp_soft_dirty(pmd));
+	WARN_ON(memcmp(&entry, &softleaf, sizeof(entry)));
+
+	pmd = pmd_swp_clear_exclusive(pmd);
+	softleaf = softleaf_from_pmd(pmd);
+
+	WARN_ON(pmd_swp_exclusive(pmd));
+	WARN_ON(!softleaf_is_swap(softleaf));
+	WARN_ON(memcmp(&entry, &softleaf, sizeof(entry)));
+}
+#else  /* !CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
+static void __init pmd_swap_exclusive_tests(struct pgtable_debug_args *args) { }
+#endif /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
+
 static void __init pte_swap_tests(struct pgtable_debug_args *args)
 {
 	swp_entry_t arch_entry;
@@ -1322,6 +1361,7 @@ static int __init debug_vm_pgtable(void)
 	pmd_leaf_soft_dirty_tests(&args);
 
 	pte_swap_exclusive_tests(&args);
+	pmd_swap_exclusive_tests(&args);
 
 	pte_swap_tests(&args);
 	pmd_softleaf_tests(&args);
-- 
2.53.0-Meta

