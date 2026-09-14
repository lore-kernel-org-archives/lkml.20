Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478C442369
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386242; cv=none; b=eQcUqXdg4dwykYK9GaUCHqAIYwqiRXMy6pZU+KTOVqkw2TNyJrL+aCKJ+JhywEaMozQ3ydqlocVzVs3Hf0LSxdIaB55qxqmSPHq28msjz8dOHInsp0lYQ2r7yA3CkbzeBQtf99znk625EjWCPyb2UbNZBxS1eIWT/P+sgRvC64o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386242; c=relaxed/simple;
	bh=N+dRbJAiKiCxpTGr27ho63g/6orT5YaFsO8QYoCGDoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3w47b4OQjCOJq1cW73WndN8hy/N6DackCZXg7/0liD8PqypsIeoQwIcFAedU8/yxJB01hDcR2Fzpr17f0/lb+WWbZWZxClYpyx2u3yhiEI5rVOSRCXJd1yEtRezB+41l0JmIGE6uTr6oWOAmfaf57H9wz0faKEMM/h+AEhkYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kjmzxUBU; arc=none smtp.client-ip=91.218.175.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kjmzxUBU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N+dRbJAiKiCxpTGr27ho63g/6orT5YaFsO8QYoCGDoE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386237; v=1; x=1789991037;
 b=kjmzxUBU2iQUdeBTLej9Kb4RLRkXidKFp3pWrExf0h6c79YFxSK3fURyNvl3mghBFZFcHF71
 XO8AUH7boJ/6zlGsbsxL2vd24ctXbuUmBoQk+ARlkV0I/G+wWl/7kxhIKKJEBQUIWRaq10oh53k
 4/+ugpPudakdr66jNpzwaskQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8319a445ae2ffcea;
	Mon, 14 Sep 2026 11:43:57 +0000
X-Mizu-Trace-ID: 8319a445ae2ffcea
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
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v7 06/29] s390: mm: add PMD swap-exclusive helpers
Date: Mon, 14 Sep 2026 04:41:58 -0700
Message-ID: <20260914114320.12988-7-usama.arif@linux.dev>
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

s390 is the one architecture where a swap PMD is not a swap PTE in
disguise: it is an RSTE with its own layout, converted to a fake PTE swap
entry for the common code. Give it its own exclusive bit rather than
borrowing the PTE-format macro. The two happen to have the same value, but
that is a coincidence. Bit 52 was documented as unused; document what it
is now.

Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/s390/include/asm/pgtable.h | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 2d5c2ab06de98..0790a0884cfab 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -333,6 +333,7 @@ void setup_protection_map(void);
 /* Common bits in region and segment table entries, for swap entries */
 #define _RST_ENTRY_COMM		0x0010	/* Common-Region/Segment, marks swap entry */
 #define _RST_ENTRY_INVALID	0x0020	/* invalid region/segment table entry */
+#define _RST_ENTRY_SWP_EXCLUSIVE 0x0800	/* SW exclusive swap bit, see mk_swap_rste() */
 
 #define _CRST_ENTRIES	2048	/* number of region/segment table entries */
 #define _PAGE_ENTRIES	256	/* number of page table entries	*/
@@ -859,6 +860,28 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return clear_pte_bit(pte, __pgprot(_PAGE_SWP_EXCLUSIVE));
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+/*
+ * A PMD swap entry is an RSTE, not a PTE, so it needs its own exclusive bit
+ * rather than the PTE-format _PAGE_SWP_EXCLUSIVE.  The two happen to have the
+ * same value; see the RSTE swap layout above mk_swap_rste().
+ */
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return set_pmd_bit(pmd, __pgprot(_RST_ENTRY_SWP_EXCLUSIVE));
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return pmd_val(pmd) & _RST_ENTRY_SWP_EXCLUSIVE;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return clear_pmd_bit(pmd, __pgprot(_RST_ENTRY_SWP_EXCLUSIVE));
+}
+#endif
+
 static inline int pte_soft_dirty(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SOFT_DIRTY;
@@ -1900,15 +1923,16 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
  * Bits 59 and 63 are used to indicate the swap entry. Bit 58 marks the rste
  * as invalid.
  * A swap entry is indicated by bit pattern (rste & 0x011) == 0x010
- * |			  offset			|Xtype |11TT|S0|
+ * |			  offset			|Etype |11TT|S0|
  * |0000000000111111111122222222223333333333444444444455|555555|5566|66|
  * |0123456789012345678901234567890123456789012345678901|234567|8901|23|
  *
  * Bits 0-51 store the offset.
+ * Bit 52 (E) is used to remember PG_anon_exclusive
+ * (_RST_ENTRY_SWP_EXCLUSIVE), mirroring bit 52 of a swap pte.
  * Bits 53-57 store the type.
  * Bit 62 (S) is used for softdirty tracking.
  * Bits 60-61 (TT) indicate the table type: 0x01 for REGION3 and 0x00 for SEGMENT.
- * Bit 52 (X) is unused.
  */
 
 #define __SWP_OFFSET_MASK_RSTE	((1UL << 52) - 1)
-- 
2.53.0-Meta

