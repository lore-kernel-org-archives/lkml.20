Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA05470457
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389087; cv=none; b=ApDVkt2LqvDaRgWB/4dnRmwb8Wtf2ao60v4A79QNSN+WZCgjvW5r1WniG+mJlIyMbWkg+xHo25Otysx/dtuIimLz4dXnrR295COPGc3PdaW8gTXOeMLXvinuzgSW+N8A5RdZKo0+AYdJ0C7h7IVNFZyEs6MG92a5Qtr5KZcKOWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389087; c=relaxed/simple;
	bh=9WXF5SfkPGIzLBw1Y4CC+Epd6KLA6VeaEGUz3MVaYfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kf3oFw+FQOW5P/mmSZga1iRSZ102W9wif9cHesPGylsO8DLQVMu+m4zXQ+DrtMNQISOivurtoVr6kOwOUPvseEtQgNyiY6KXiTL25Nh/b2y1KnB9b5uLPN4F6vFYK+1ZcOYyIJO8s/C2H1vH8LdwiybHZmeaNdUbEO/epzJWVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I+bc+CII; arc=none smtp.client-ip=91.218.175.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I+bc+CII"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9WXF5SfkPGIzLBw1Y4CC+Epd6KLA6VeaEGUz3MVaYfc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389078; v=1; x=1789993878;
 b=I+bc+CIIOmoLhHSDqxqajR21J1BpzQ1rEwFoAsC6RfZhPblFk9rXgPkOKWNs5naVzcDLjEa7
 fsZHcGW8XVYAa9umoE197PRNT/sXuSJByFW/4XCfW/l2pNshpRs+Vlgq6T275i4kUHtUkU3LQqx
 guUK7gr5EcjQhk2dIs4zF3Go=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 60a161468f8d634e;
	Mon, 14 Sep 2026 12:31:17 +0000
X-Mizu-Trace-ID: 60a161468f8d634e
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
Subject: [RESEND v7 09/29] mm/debug_vm_pgtable: test PMD swap-exclusive helpers
Date: Mon, 14 Sep 2026 05:27:59 -0700
Message-ID: <20260914122950.3283997-10-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
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

