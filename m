Received: from mta0.migadu.com (out-234.mta0.migadu.com [91.218.175.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8EA2AEEB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934966; cv=none; b=q7jksubUqkOkQhGGMwO4GtJEvG2hEKZQxI++8ehrokEHjqSpf+PfS6/WDLS1iNU4m5yy4AQneb0/FVl4NV9iktbdnFneg3AjT5hxtZE0pSovmdVCBTmUeJeh6mssog7eIAR6SQzUkROt4O0sMAOlWPh0Ak0JNjeUdgcRkTnETTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934966; c=relaxed/simple;
	bh=+539FMbDWr/qpvdIvQSVHv0n+KmhLVFRnsglmFqW/I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eU7EXIc4u228Vy2bxWGINRO+eQr66r+KXNb6/WPh1WMAw53v9OvSvT6XoWjlpTFZCH43zIbe10mbhy6L7Ip+ZpdT2iGRgzACZQB9wgN8N0j03Oc2/zmqxylFU8lH2SBztqSLmDfgbVcFk0AdkLw4z9HLSFFRkKhyyNfla6ejnLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=do/z2PmR; arc=none smtp.client-ip=91.218.175.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="do/z2PmR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+539FMbDWr/qpvdIvQSVHv0n+KmhLVFRnsglmFqW/I0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934962; v=1; x=1791539762;
 b=do/z2PmRkJ7t40I/oAiYXZRXQCdMDu0jJ/kg+x5NyNb25IjzyCqaSZUx8pUJoKPpASMbG7h8
 OwxcZGlIK0yevjzstUNGsgYrg2FCyUJHeyBixroGbpCJCL8i5vHBWV8zIIu7R4QO8i78/5vzVC9
 uN1Fj9Ecvom4k/FFsXNLJIzo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9ba74d8f9c205fbe;
	Fri, 02 Oct 2026 09:56:01 +0000
X-Mizu-Trace-ID: 9ba74d8f9c205fbe
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
	Usama Arif <usama.arif@linux.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v8 04/30] powerpc: mm: add PMD swap-exclusive helpers
Date: Fri,  2 Oct 2026 02:52:18 -0700
Message-ID: <20261002095503.3585565-5-usama.arif@linux.dev>
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

Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
swap round-trip, which makes PG_anon_exclusive have to survive in a swap
PMD and not just in a swap PTE.

book3s64 builds a swap PMD by running the PTE encoding over pmd_pte(), so
the PMD helpers wrap the PTE ones and reuse _PAGE_SWP_EXCLUSIVE, exactly
as the soft-dirty PMD helpers next to them do. It is also the only powerpc
variant that selects ARCH_HAS_PMD_SOFTLEAVES, via PPC_THP.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dff8790a047db..458c85cebfa65 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1060,6 +1060,12 @@ static inline pte_t *pmdp_ptep(pmd_t *pmd)
 #endif
 #endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+#define pmd_swp_mkexclusive(pmd)	pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)))
+#define pmd_swp_exclusive(pmd)		pte_swp_exclusive(pmd_pte(pmd))
+#define pmd_swp_clear_exclusive(pmd)	pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)))
+#endif
+
 #ifdef CONFIG_ARCH_HAS_PTE_PROTNONE
 static inline int pmd_protnone(pmd_t pmd)
 {
-- 
2.53.0-Meta

