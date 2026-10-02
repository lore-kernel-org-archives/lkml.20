Received: from mta0.migadu.com (out-11.mta0.migadu.com [91.218.175.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E347D948
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934982; cv=none; b=N8Na/q/rP/sj6wbhz6P1CpoeGIn0RZKmNQPAV4Ku7uBNh6fyItbfFSUXDaI62uP+Y99ABxqdVJOx4oh32HVXU3rq5CityJMGoJ2HVBxuSTFfq6ONhRzmcWTGwApFkSf4h1oOHkzvqsIwYetUIx9EF72lMLlZ4PbJXj8tYcKgDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934982; c=relaxed/simple;
	bh=xqdIzLB/9KznEhopQquMssJDqyXlY4vTk76sJe/wA9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpusZ90Ae7WDHxgrkqq1cDlTqwn8BokaseJPU6kv51PWxYP+I/3JJa+R7/0JYniHISHiBeLvVeKwL9ZZyX+6W8MFVSY0GUcTeftAaNTHj7JJuwULiUgXiOIdt0+Jn+Z+VLF41uzEeOHn8I9RauwwBuVtnnXe8g8V5yeXfGNtfS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SCdvevtt; arc=none smtp.client-ip=91.218.175.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SCdvevtt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xqdIzLB/9KznEhopQquMssJDqyXlY4vTk76sJe/wA9s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934978; v=1; x=1791539778;
 b=SCdvevttvzgw/8nriyFT50wVEiiFuaAlmo0i46b4D03U90Hn02Ig8OPvNR2WzzUn5pdOvkr+
 qMYQ0n621IrIf+lASnj6mDbpf5FxTB5Mi2WEa45aa6gGXGTTOUW4To+pf8ZDZAsyHs72wfvRYN1
 /O8zLgAL2uXydSuXZT2UG61Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id af85c43b694ca49b;
	Fri, 02 Oct 2026 09:56:18 +0000
X-Mizu-Trace-ID: af85c43b694ca49b
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
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v8 07/30] x86: mm: add PMD swap-exclusive helpers
Date: Fri,  2 Oct 2026 02:52:21 -0700
Message-ID: <20261002095503.3585565-8-usama.arif@linux.dev>
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

x86-64 encodes a swap PMD exactly like a swap PTE, so the new helpers reuse
_PAGE_SWP_EXCLUSIVE, bit 3, which the swap-entry layout already reserves
for PG_anon_exclusive. 32-bit x86 aliases that bit to _PAGE_PSE and does
not select ARCH_HAS_PMD_SOFTLEAVES; assert that, because an exclusive swap
PMD would otherwise be pmd_present().

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/x86/include/asm/pgtable.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d551120a7c889..c35dfa6ceda05 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1525,6 +1525,26 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+/* 32-bit aliases this to _PAGE_PSE, making an exclusive swap PMD present. */
+static_assert(_PAGE_SWP_EXCLUSIVE != _PAGE_PSE);
+
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return pmd_set_flags(pmd, _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return pmd_flags(pmd) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return pmd_clear_flags(pmd, _PAGE_SWP_EXCLUSIVE);
+}
+#endif
+
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
 {
-- 
2.53.0-Meta

