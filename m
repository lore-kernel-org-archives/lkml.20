Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529547253A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386231; cv=none; b=dW8D4PCnjtkIjtW2E4NMPQuPD3d18V/7193G8Xu2QrdIwBAOXobpPHcOBV3nv6ZfAqMotRsC5yJiD477pR7m2IjgsFAOrfcgFtNpMXT6yBjMFAl5Tpo4f2E9AvBxFb+BHVI5ef1rWM0KMG3Ib91V+hDuxCXuzeV8D08zspxtyMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386231; c=relaxed/simple;
	bh=BtQeHE2SZzfUtIrg0bS6PVLMNQTg1JxKJHlqS6nP29w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NI6+P2btvMh6lSqzJ7nh4W3wrfWs02L/K37cy8hieFiHLgalN9OWjqEazbQp6VIIrJQsXNu+zvBCK2fRHleHwRZOVIIhDJmPx3msqqNBsj+bKOgsUlq03NAV21+DFSoKy87HPxhSHlRAJHeVEUF7aLAdB4gnADaAoXfxkUbkaSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mIEWS7Dy; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mIEWS7Dy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BtQeHE2SZzfUtIrg0bS6PVLMNQTg1JxKJHlqS6nP29w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386228; v=1; x=1789991028;
 b=mIEWS7DyI1HdBqd/B705U9Wj33XGUsvSw68vua1JedC2RDHy5PMVlkOqsKsSaQV/Uk6WP6Rh
 ngqIjQTCecZMPwCFSl+E3CgpcLAOS8cTxcJMGTZ05gCN/wrIngCKU9qse18Hw9zjlNRFvthXvif
 scBfxg5hIHRkp51mzpPAYsc4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 3c083accddd22eea;
	Mon, 14 Sep 2026 11:43:48 +0000
X-Mizu-Trace-ID: 3c083accddd22eea
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
Subject: [PATCH v7 04/29] powerpc: mm: add PMD swap-exclusive helpers
Date: Mon, 14 Sep 2026 04:41:56 -0700
Message-ID: <20260914114320.12988-5-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914114320.12988-1-usama.arif@linux.dev>
References: <20260914114320.12988-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
not just in a swap PTE.

book3s64 builds a swap PMD by running the PTE encoding over pmd_pte(), so
the PMD helpers use the same _PAGE_SWP_EXCLUSIVE bit. It is also the only
powerpc variant that selects ARCH_HAS_PMD_SOFTLEAVES, via PPC_THP.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dff8790a047db..28943ef3c1c80 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -699,6 +699,23 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_SWP_EXCLUSIVE));
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return __pmd_raw(pmd_raw(pmd) | cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return __pmd_raw(pmd_raw(pmd) & cpu_to_be64(~_PAGE_SWP_EXCLUSIVE));
+}
+#endif
+
 static inline bool check_pte_access(unsigned long access, unsigned long ptev)
 {
 	/*
-- 
2.53.0-Meta

