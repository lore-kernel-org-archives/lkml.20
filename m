Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372113DA5B3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887883; cv=none; b=dZYfw3NaTdJeLM4JnIsMpqUcmRyta8lJKAeKE+wEJqQlk/CcaI950SQLwVaWEQn5uIQqgJR8KROe8Bde+IaewN2+KLVGTeRmytI1K1jHcgs+9kPTogdeBxox6PMeW/hLI8NtSBkzIrr59+4EuxUdAKUBruq+HAl2Zz3s/9liha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887883; c=relaxed/simple;
	bh=jIL5Xm0hBwRJq72+13iYyBKNUWWSaRe7RMggUGRje9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdfBW2heS3urWK5cNXiUoPfJz7gzAkJOL8tdIj2Nhnu00neJNVOAsh8oEk2mE/fmTn1eYm9dJ2ClxDXw8Nd/+/nr1GUHeeb33kx3p4YD/PWBlbOfYRYZpbDu4gUhLolvRBECU0xmH0Jxwaf1qrlcrgzP/w4lLsA4AkQH1rTmq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YcGvSh8Q; arc=none smtp.client-ip=91.218.175.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YcGvSh8Q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jIL5Xm0hBwRJq72+13iYyBKNUWWSaRe7RMggUGRje9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789887878; v=1; x=1790492678;
 b=YcGvSh8QsWadQB0J+34j8xfNqv5nMkEJSQzAOxQT6GAzk8K1uktWkjhY03kKaFJz7dxoRUCD
 rQqNQRrnpZVQNk65eQLwAsmc5OlJjgJiMStY9eZRQHOzUS8JblST78ioZGc2cBXaErh3S+Df0LT
 9ZHr4fF0IRbyMTNgTsWAe5hE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd1bdbb1ac128f27;
	Sun, 20 Sep 2026 07:04:38 +0000
X-Mizu-Trace-ID: cd1bdbb1ac128f27
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH] mm: Add CONFIG_SPARSEMEM_CLASSIC
Date: Sun, 20 Sep 2026 15:04:06 +0800
Message-ID: <20260920070406.95354-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Several MM paths identify classic sparse memory by testing
CONFIG_SPARSEMEM while also testing that CONFIG_SPARSEMEM_VMEMMAP is
disabled. Repeating the compound condition obscures the memory model being
selected and requires the local SECTION_IN_PAGE_FLAGS alias for the same
state.

Add CONFIG_SPARSEMEM_CLASSIC as a hidden derived option and use it at the
conditional sites. Remove SECTION_IN_PAGE_FLAGS and test the new option
directly.

The x86 32-bit vDSO build starts with the x86_64 configuration and then
undefines CONFIG_SPARSEMEM_VMEMMAP to emulate a 32-bit configuration.
Kconfig-derived symbols are not recomputed by the C preprocessor, so define
CONFIG_SPARSEMEM_CLASSIC there when CONFIG_SPARSEMEM is enabled. This
preserves the existing behavior.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |  3 +++
 include/linux/mm.h                            | 12 ++++--------
 include/linux/mmzone.h                        |  2 +-
 include/linux/page-flags-layout.h             |  2 +-
 mm/Kconfig                                    |  3 +++
 mm/util.c                                     |  2 +-
 6 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
index 72a92cb9b53d..3e07389c4d2b 100644
--- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -20,6 +20,9 @@
 #define CONFIG_PAGE_OFFSET 0
 #define CONFIG_ILLEGAL_POINTER_VALUE 0
 #define CONFIG_NR_CPUS 1
+#ifdef CONFIG_SPARSEMEM
+#define CONFIG_SPARSEMEM_CLASSIC 1
+#endif
 
 #define BUILD_VDSO32_64
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ae56d6a2c9f9..b786ee73a20f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -201,7 +201,7 @@ static inline void __mm_zero_struct_page(struct page *page)
 extern unsigned long sysctl_user_reserve_kbytes;
 extern unsigned long sysctl_admin_reserve_kbytes;
 
-#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+#ifdef CONFIG_SPARSEMEM_CLASSIC
 bool page_range_contiguous(const struct page *page, unsigned long nr_pages);
 #else
 static inline bool page_range_contiguous(const struct page *page,
@@ -2531,10 +2531,6 @@ static inline bool is_nommu_shared_vma_flags(const vma_flags_t *flags)
 }
 #endif
 
-#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
-#define SECTION_IN_PAGE_FLAGS
-#endif
-
 /*
  * The identification function is mainly used by the buddy allocator for
  * determining if two pages could be buddies. We are not really identifying
@@ -2805,7 +2801,7 @@ static inline struct zone *folio_zone(const struct folio *folio)
 	return &folio_pgdat(folio)->node_zones[folio_zonenum(folio)];
 }
 
-#ifdef SECTION_IN_PAGE_FLAGS
+#ifdef CONFIG_SPARSEMEM_CLASSIC
 static inline void set_page_section(struct page *page, unsigned long section)
 {
 	page->flags.f &= ~(SECTIONS_MASK << SECTIONS_PGSHIFT);
@@ -2823,7 +2819,7 @@ static inline unsigned long memdesc_section(const memdesc_flags_t *mdf)
 	ASSERT_EXCLUSIVE_BITS(mdf->f, SECTIONS_MASK << SECTIONS_PGSHIFT);
 	return (mdf->f >> SECTIONS_PGSHIFT) & SECTIONS_MASK;
 }
-#else /* !SECTION_IN_PAGE_FLAGS */
+#else /* !CONFIG_SPARSEMEM_CLASSIC */
 static inline void set_page_section_from_pfn(struct page *page,
 		unsigned long pfn)
 {
@@ -2833,7 +2829,7 @@ static inline unsigned long memdesc_section(const memdesc_flags_t *mdf)
 {
 	return 0;
 }
-#endif /* SECTION_IN_PAGE_FLAGS */
+#endif /* CONFIG_SPARSEMEM_CLASSIC */
 
 /**
  * folio_pfn - Return the Page Frame Number of a folio.
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ebbda6f31139..c83529ad6e35 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -68,7 +68,7 @@
  * memory sections).
  */
 #define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
-#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+#elif defined(CONFIG_SPARSEMEM_CLASSIC)
 /*
  * Only pages within a single memory section are guaranteed to be
  * contiguous. By limiting folios to a single memory section, all folio
diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
index 760006b1c480..536003b364a7 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -49,7 +49,7 @@
  *      " plus space for last_cpupid: | SECTION | NODE | ZONE | LAST_CPUPID ... | FLAGS |
  * classic sparse no space for node:  | SECTION |     ZONE    | ... | FLAGS |
  */
-#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+#ifdef CONFIG_SPARSEMEM_CLASSIC
 #define SECTIONS_WIDTH		SECTIONS_SHIFT
 #else
 #define SECTIONS_WIDTH		0
diff --git a/mm/Kconfig b/mm/Kconfig
index 30170a936f1f..c7bbcf086f21 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -461,6 +461,9 @@ config SPARSEMEM_VMEMMAP
 	  pfn_to_page and page_to_pfn operations.  This is the most
 	  efficient option when sufficient kernel resources are available.
 
+config SPARSEMEM_CLASSIC
+	def_bool SPARSEMEM && !SPARSEMEM_VMEMMAP
+
 config VMEMMAP_OPTIMIZATION
 	bool
 	depends on SPARSEMEM_VMEMMAP
diff --git a/mm/util.c b/mm/util.c
index c5ee52aede1e..6910b47ca415 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1590,7 +1590,7 @@ unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
 }
 #endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+#ifdef CONFIG_SPARSEMEM_CLASSIC
 /**
  * page_range_contiguous - test whether the page range is contiguous
  * @page: the start of the page range.
-- 
2.54.0 (Apple Git-157)

