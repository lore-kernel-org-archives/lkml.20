Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33C93B992C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083011; cv=none; b=Alvz1GBH1LiIVU7h/+IxUjnJVJzwffly3haluYNmj2zv5HYZVo4A4616OImMhz8uSaI+eDf5cMCzeP9unZgMqMMVXkYez0WzLCkHfab8QEdhZlLO+LirYaoTI+AhlImUW8qxwImg6qV31ATAzHLnts+jheBG/pPDweSjlhSy9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083011; c=relaxed/simple;
	bh=Jwr5K51ukqdtnHr4Uin+bWG/FzAyJskE0K5YWYJSjM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHbOzBz9ic7OY6hc3lSq0fDrJ90jt/4F/auyfXbA6Lmmh3eIe//svJFvRhuqPLk7CpAe6Q9zVcGQMgFW8oFf9HRxHdqPn5zQ36TR4iJLa9z0o+tZmS9HGhRpF5BaRwyYaADB0xP72mggjLo2ql6q3LKsyq8UH2eBIqdDkcXxmjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wdmSdBh5; arc=none smtp.client-ip=95.215.58.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wdmSdBh5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jwr5K51ukqdtnHr4Uin+bWG/FzAyJskE0K5YWYJSjM8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791083004; v=1; x=1791687804;
 b=wdmSdBh5jKz9+Rc2sr38SD3flaJQM6XLAntVnBoQU7AvDZgGkANKNVRnq7kAwzK6kCNSnTLG
 6zG63tAVaNulyvm21VKt9Dl/olPIbJR6fBKhdefrCCCVLhkcaCWjwbquP7XQGnIeGBMsStUieIU
 Np0glmuYZoU6/I+C51rF2ApQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f5c2ae1123ce7d6d;
	Sun, 04 Oct 2026 03:03:24 +0000
X-Mizu-Trace-ID: f5c2ae1123ce7d6d
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	rppt@kernel.org,
	kas@kernel.org,
	david@kernel.org,
	andrew+kernel@donnellan.id.au,
	rmclure@linux.ibm.com,
	debug@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	usama.arif@linux.dev,
	wangruikang@iscas.ac.cn,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexghiti@rivosinc.com,
	viro@zeniv.linux.org.uk,
	ajones@ventanamicro.com,
	arnd@arndb.de,
	axelrasmussen@google.com,
	brauner@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	jack@suse.cz,
	liam@infradead.org,
	ljs@kernel.org,
	mhocko@suse.com,
	paul.walmsley@sifive.com,
	peterx@redhat.com,
	robh@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	yuanchu@google.com,
	stable@vger.kernel.org,
	pasha.tatashin@soleen.com,
	linux-mm@kvack.org,
	me@ziyao.cc,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] riscv/mm: fix soft-dirty migration PMDs being treated as present
Date: Sun,  4 Oct 2026 11:03:12 +0800
Message-ID: <20261004030312.90163-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V uses _PAGE_EXEC for swap soft-dirty tracking when
CONFIG_MEM_SOFT_DIRTY is enabled and Svrsw60t59b is available. That's
a problem for PMD migration entries, since pmd_present() also checks
_PAGE_LEAF (R/W/X) to recognize THPs with _PAGE_PRESENT temporarily
cleared during splitting.

When a soft-dirty THP is migrated, set_pmd_migration_entry() preserves
soft-dirty with pmd_swp_mksoft_dirty(), setting the X bit in the
migration PMD. Even with _PAGE_PRESENT clear, we end up treating a
migration PMD as a present THP! The fault handler skips
pmd_migration_entry_wait(), and a write fault can end up in
do_huge_pmd_wp_page(), where pmd_page() decodes the migration entry
as a mapped PFN.

Move the swap soft-dirty bit to bit 12 and start the swap offset at
bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled. This keeps R/W/X clear
in migration PMDs and lets us keep the existing pmd_present() check
for invalidated THPs. Leave the offset at bit 12 when soft-dirty
tracking is disabled.

Fixes: 2a3ebad4db63 ("riscv: mm: add soft-dirty page tracking support")
Cc: stable@vger.kernel.org
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
I found this while reviewing Usama's PMD-level swap entries series [1]
and comparing the swap flag bits with the PMD presence checks across
architectures.

[1] https://lore.kernel.org/all/20261002095503.3585565-1-usama.arif@linux.dev/

 arch/riscv/include/asm/pgtable-bits.h |  6 +++---
 arch/riscv/include/asm/pgtable.h      | 10 ++++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index d5a86b4df3ce6..d84b459e010c1 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -27,12 +27,12 @@
 	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
 	 (1UL << 59) : 0)
 /*
- * Bit 3 is always zero for swap entry computation, so we
- * can borrow it for swap page soft-dirty tracking.
+ * Bit 12 is reserved for swap soft-dirty tracking. The swap offset
+ * starts at bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled.
  */
 #define _PAGE_SWP_SOFT_DIRTY						\
 	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
-	 _PAGE_EXEC : 0)
+	 (1UL << 12) : 0)
 #else
 #define _PAGE_SOFT_DIRTY	0
 #define _PAGE_SWP_SOFT_DIRTY	0
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b644db16bda94..acaf6d3b54d04 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1178,18 +1178,20 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
  *
  * Format of swap PTE:
  *	bit            0:	_PAGE_PRESENT (zero)
- *	bit       1 to 2:	(zero)
- *	bit            3:	_PAGE_SWP_SOFT_DIRTY
+ *	bit       1 to 3:	_PAGE_LEAF (zero)
  *	bit            4:	_PAGE_SWP_UFFD
  *	bit            5:	_PAGE_PROT_NONE (zero)
  *	bit            6:	exclusive marker
  *	bits      7 to 11:	swap type
- *	bits 12 to XLEN-1:	swap offset
+ *	bit           12:	_PAGE_SWP_SOFT_DIRTY (CONFIG_MEM_SOFT_DIRTY)
+ *	bits 12/13 to XLEN-1:	swap offset (without/with CONFIG_MEM_SOFT_DIRTY)
  */
 #define __SWP_TYPE_SHIFT	7
 #define __SWP_TYPE_BITS		5
 #define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
-#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
+#define __SWP_OFFSET_SHIFT \
+	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT + \
+	 IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 
 #define MAX_SWAPFILES_CHECK()	\
 	BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > __SWP_TYPE_BITS)
-- 
2.49.0

