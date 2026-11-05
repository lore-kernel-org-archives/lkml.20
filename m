Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904057;
	b=ovMGodQ1izHL15u/NSRk1BZ84eexl/LZ9q7cH/5e6AZmf9aSGFVkVBbqMC+1sIiHCLsB
	 bZeodjo5YkVKVju8XoRbtsPRkbwGBkufFLBWMkMusBl4gVYnv9TpF56IpcCndC0tYoUCR
	 XGi3ElkaxszXCAhBhzr0X47LF0v6HGeC+jP7vgnweHC4V05UDI72YEeu359RZP1d/rQAH
	 dZX+Ol4/GlbLoZ/uLE5s+zjGUP981BHssVuuliInRpdlxujyeeWtoNAhsS7gYTupxjC+G
	 ud7zNmJSqdNHEyohepW/MvRaJugZv2mIUD8+yTc4CqTxLkVetebDXXKGG18cqYXZNOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904057;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DvTGmyE44d4TGcIZqimy1jlaInJo0SJ57S1SRdbg5dY=;
	b=n567ktXSt7hdXKwCD1iFkazwZc8IDrqjKpP1JZxWsuz2QvWKguIOCp9WI6XmKVCgqgGF
	 uGX+pKUiAPfQBYVKV1LzOi8G2VbvQnrDrPCbKVWhdsZC/cRhroMAVg2Fue38fbrSMnA/G
	 h0Tk5kGGAI3AAABvRJw1/jwctjEZ26gRntWX8ELJF37oGnNDV4q6dv1x9fCIWpm5nHtrX
	 I3FmgfdSY0V3m7pPkIWzxyIr29cY3aQvpxAJJ0SNndch0MSwzIBFM2QG3Bc8FpsUJzWQj
	 djmLVETV2gCpcNJw97BhJZ/FAOKFj0zxf3B49HRrimQ8axGgcrkWugp1Msm+XQbvCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m2Mou8ST;
	arc=none smtp.remote-ip=91.218.175.126
Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E7606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084E7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m2Mou8ST
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eEH8jln6expy/CyMNQ1Q/mpIEWoqGKF30ttnWbqCltU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904055; v=1; x=1794508855;
 b=m2Mou8ST63tx8+MQPzX2yUAeXRbPhAayP+txUc06uItSapl3qvoT4Y25sP4E7qISMzK5+9eT
 1mZdA8DgMvO8G1Dw532r7f9R7gEdJbE37P6RC3quNTJZ4oa8npQJfHG5ABasCJ4s9oHU5RVCAhE
 DwV+Lr5OIMfgNTY8VEVmbVVw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3feb19a193c6dd22;
	Thu, 05 Nov 2026 18:40:54 +0000
X-Mizu-Trace-ID: 3feb19a193c6dd22
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 09/32] mm/debug_vm_pgtable: test PMD swap-exclusive helpers
Date: Thu,  5 Nov 2026 10:38:53 -0800
Message-ID: <20261105183940.2236717-10-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An architecture that picked a PMD exclusive bit overlapping the swap type
or offset field would otherwise only be caught by data corruption at
runtime. Mirror pte_swap_exclusive_tests() at PMD level.

Also check that setting swap soft-dirty leaves the PMD non-present.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 mm/debug_vm_pgtable.c | 44 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 2875fd22d7bb0..80686e2baaa14 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -762,7 +762,9 @@ static void __init pmd_leaf_soft_dirty_tests(struct pgtable_debug_args *args)
 	WARN_ON(!pmd_is_huge(pmd));
 	WARN_ON(!pmd_is_valid_softleaf(pmd));
 
-	WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pmd)));
+	pmd = pmd_swp_mksoft_dirty(pmd);
+	WARN_ON(!pmd_swp_soft_dirty(pmd));
+	WARN_ON(pmd_present(pmd));
 	WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty(pmd)));
 }
 #else  /* !CONFIG_TRANSPARENT_HUGEPAGE */
@@ -802,6 +804,45 @@ static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
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
@@ -1322,6 +1363,7 @@ static int __init debug_vm_pgtable(void)
 	pmd_leaf_soft_dirty_tests(&args);
 
 	pte_swap_exclusive_tests(&args);
+	pmd_swap_exclusive_tests(&args);
 
 	pte_swap_tests(&args);
 	pmd_softleaf_tests(&args);
-- 
2.53.0-Meta

