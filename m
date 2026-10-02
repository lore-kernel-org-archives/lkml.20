Received: from mta1.migadu.com (out-133.mta1.migadu.com [95.215.58.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6D1429CD0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934979; cv=none; b=cpuBxyDnMlMfpaS9sDaaiYb8LGryc9tJcZBVdVHQn8G4+3Et0nv4Zv4LhQef/UJpDlOJ9m1l/eejb9dKPB20YZuIZG1Bq9XSV39Bt6Iw1k6UEPQpXjW4BFmq89ub8RIH72/jRTePLdvGLNSPt6vcvT2whs8WC8a2Dy5xXELVIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934979; c=relaxed/simple;
	bh=SkgwF13s5EnjFfE2w6anFKj/c3HQiyeMzlP/C9PzmRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBHMz1WBXdBQr9R5bw+YfhZiuLNGa4vHqlOgYt+z7XaAf5w+a39dq9IttYovZUcG8ryCdBvAyrV9O+52FktkIVt6mRoTTYHOvQUSSzKjRvxSCJ81+1IXjVn3EdeING0lP2Vt2YajlrwbasGQzMgCILhb4//j13F4seQjfLaJCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CuHMNmxG; arc=none smtp.client-ip=95.215.58.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CuHMNmxG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SkgwF13s5EnjFfE2w6anFKj/c3HQiyeMzlP/C9PzmRQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934976; v=1; x=1791539776;
 b=CuHMNmxGwDzovHCPpmYq0OU+8pKjbPHyaZDRLNY8jLggyma2xBxp9Gs0H/k4yxS4G0S8JBYM
 bfS2/k+gMMzry6s8J8uKvkPriaDmIoLs3Qr/ED8a4OZBz22tmOvi9RF23qr8LxD1RFfmAA7tyWf
 ZtfabgqOOJ0sbQ6HehR03UsI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a7de3ec2297c0b41;
	Fri, 02 Oct 2026 09:56:15 +0000
X-Mizu-Trace-ID: a7de3ec2297c0b41
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
Subject: [PATCH v8 06/30] s390: mm: add PMD swap-exclusive helpers
Date: Fri,  2 Oct 2026 02:52:20 -0700
Message-ID: <20261002095503.3585565-7-usama.arif@linux.dev>
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

s390 is the one architecture where a swap PMD is not a swap PTE in
disguise: it is an RSTE with its own layout, converted to a fake PTE swap
entry for the common code. Give it its own exclusive bit rather than
borrowing the PTE-format macro, and document it in the RSTE swap layout,
where bit 52 was listed as unused.

Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/s390/include/asm/pgtable.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 2d5c2ab06de98..afd886edf0594 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -333,6 +333,7 @@ void setup_protection_map(void);
 /* Common bits in region and segment table entries, for swap entries */
 #define _RST_ENTRY_COMM		0x0010	/* Common-Region/Segment, marks swap entry */
 #define _RST_ENTRY_INVALID	0x0020	/* invalid region/segment table entry */
+#define _RST_ENTRY_SWP_EXCLUSIVE 0x0800	/* SW exclusive swap bit, see mk_swap_rste() */
 
 #define _CRST_ENTRIES	2048	/* number of region/segment table entries */
 #define _PAGE_ENTRIES	256	/* number of page table entries	*/
@@ -893,6 +894,21 @@ static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
 }
 
 #ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
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
+
 #define pmd_swp_soft_dirty(pmd)		pmd_soft_dirty(pmd)
 #define pmd_swp_mksoft_dirty(pmd)	pmd_mksoft_dirty(pmd)
 #define pmd_swp_clear_soft_dirty(pmd)	pmd_clear_soft_dirty(pmd)
@@ -1900,15 +1916,15 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
  * Bits 59 and 63 are used to indicate the swap entry. Bit 58 marks the rste
  * as invalid.
  * A swap entry is indicated by bit pattern (rste & 0x011) == 0x010
- * |			  offset			|Xtype |11TT|S0|
+ * |			  offset			|Etype |11TT|S0|
  * |0000000000111111111122222222223333333333444444444455|555555|5566|66|
  * |0123456789012345678901234567890123456789012345678901|234567|8901|23|
  *
  * Bits 0-51 store the offset.
+ * Bit 52 (E) is used to remember PG_anon_exclusive (_RST_ENTRY_SWP_EXCLUSIVE).
  * Bits 53-57 store the type.
  * Bit 62 (S) is used for softdirty tracking.
  * Bits 60-61 (TT) indicate the table type: 0x01 for REGION3 and 0x00 for SEGMENT.
- * Bit 52 (X) is unused.
  */
 
 #define __SWP_OFFSET_MASK_RSTE	((1UL << 52) - 1)
-- 
2.53.0-Meta

