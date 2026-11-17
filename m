Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899211;
	b=e/or04+kSM1rRLj7nk5ZdWOccVhO196QsAfh40qHQQ8XtZhmSExwW/DL0NBMI+41GXpn
	 aj58AWytzQluCE44APXzO0O/KaQPMq2ZAyfi129xvf0t6e89Av2d1A0Mq6rVo8vWal4tC
	 QA0fbyqkgNmO15GB8tRnOtRnzOD9eJfZ1zJRFJFrU0PEQKT5CMveWI+onA5Dt1x5vbsnK
	 hNAJyv3raKStGdcYntJ01NajX906FFwuSa8pPDCviYOkP93A1WALMHK9MBEwGGNBgJO7U
	 RnxbrLVGNUCbgvFU59MNX6xgV8r9H9zMFVKDZXIbmrJ1xE0F8DldKCyNJs0BfVlxJNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899211;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uPqr0Kb8/zLLbXQWePyEB3+zBFb98bC3Fi1OiT7G+kU=;
	b=KU/cfw+dFXHLXcAZldPa29ynHwlji/qH7KtqzH1hK5VeWcjd4lv6pINNqymga7nuGOsw
	 ZqBrkBa0PLT0ZLGRzCLjowXfEktzJsB5OTtrdD4mGxC8VV7xhM2qkWQLtTNdnJ+OZSUtY
	 KGFjCQl9KwZig7vOqR5ikkUDaZQG2vTQWXw3XtUDFfcXcCAjDiQw8Mzbc/De/oeOF4XCW
	 4LBE0t7GIt92YSDdPQzATobZqtwVEvhm6APyID5Kfth1fh8c0Gzy8qLfeEDWqPZ2gFJuO
	 tNinx1QaJPeBaLRVKzL6poOL5g69uXhgnn4m3MvkXLG4Vf54mSamFo1mJKG28fMpREQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Czs8bkSq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21908606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21908606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Czs8bkSq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D341476;
	Mon, 16 Nov 2026 23:06:46 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE8C53F882;
	Mon, 16 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899209; bh=gdVTWnm9aG0Cay0F+b7IneTsiFz5Oxc1mfFiGUFXEI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Czs8bkSqNqmqyO2k1vt9iXnL/MSq8J6IWx3r/NJZX2lBiySrLwt/TzpnkKIi+/54U
	 hXrfGa5FnQri67gW6m2wltZcur5mrhKJ0wJ2fBZCiHI85naU0rHtAXsW8lxjtWFD7l
	 13kHnuQKOelzKd006uSxoYMQkGbixqev7KKCg2SU=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 07/14] arm64/mm: Enable pgtable geometry for FEAT_D128
Date: Tue, 17 Nov 2026 12:36:06 +0530
Message-ID: <20261117070613.1183243-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
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

Add build time support for FEAT_D128 page tables with a new Kconfig option
i.e CONFIG_ARM64_D128. When selected, PTE types become 128 bits wide and
PTE bits are mapped to their new locations. Besides the basic page table
geometry is also updated since each table page now holds half the number
of entries (aka PTRS_PER_PXX) as it did previously. Similarly update the
geometry relevant macros ARM64_CONT_[PTE|PMD]_SHIFT, PGTABLE_LEVELS, and
PTDESC_ORDER.

Although for now config ARM64_D128 remains disabled while all the required
dependencies are getting created in subsequent patches.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig                     | 37 ++++++++++++++++++++++----
 arch/arm64/include/asm/pgtable-hwdef.h |  4 +++
 arch/arm64/include/asm/pgtable.h       |  2 ++
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9b08b2457a555..e54cff118f8a8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -280,14 +280,18 @@ config MMU
 
 config ARM64_CONT_PTE_SHIFT
 	int
-	default 5 if PAGE_SIZE_64KB
-	default 7 if PAGE_SIZE_16KB
+	default 4 if PAGE_SIZE_64KB && ARM64_D128
+	default 5 if PAGE_SIZE_64KB && !ARM64_D128
+	default 6 if PAGE_SIZE_16KB && ARM64_D128
+	default 7 if PAGE_SIZE_16KB && !ARM64_D128
 	default 4
 
 config ARM64_CONT_PMD_SHIFT
 	int
-	default 5 if PAGE_SIZE_64KB
-	default 5 if PAGE_SIZE_16KB
+	default 6 if PAGE_SIZE_64KB && ARM64_D128
+	default 5 if PAGE_SIZE_64KB && !ARM64_D128
+	default 4 if PAGE_SIZE_16KB && ARM64_D128
+	default 5 if PAGE_SIZE_16KB && !ARM64_D128
 	default 4
 
 config ARCH_MMAP_RND_BITS_MIN
@@ -366,6 +370,16 @@ config FIX_EARLYCON_MEM
 
 config PGTABLE_LEVELS
 	int
+	default 4 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_39
+	default 5 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_48
+	default 5 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_52
+	default 3 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_36
+	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_47
+	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_48
+	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_52
+	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_42
+	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_48
+	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_52
 	default 2 if ARM64_16K_PAGES && ARM64_VA_BITS_36
 	default 2 if ARM64_64K_PAGES && ARM64_VA_BITS_42
 	default 3 if ARM64_64K_PAGES && (ARM64_VA_BITS_48 || ARM64_VA_BITS_52)
@@ -1697,7 +1711,7 @@ config ARM64_PA_BITS
 
 config ARM64_LPA2
 	def_bool y
-	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
+	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES && !ARM64_D128
 
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
@@ -2369,6 +2383,19 @@ config ARM64_HAFT
 
 endmenu # "ARMv8.9 architectural features"
 
+menu "ARMv9.3 architectural features"
+
+config ARM64_D128
+	bool
+	default n
+	help
+	  ARMv9.3 introduces FEAT_D128, which provides a 128 bit page
+	  table format, along with related instructions.
+
+	  If unsure, say Y.
+
+endmenu # "ARMv9.3 architectural features"
+
 menu "ARMv9.4 architectural features"
 
 config ARM64_GCS
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 72f31800c7030..1ee1a6d9db6d4 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -7,7 +7,11 @@
 
 #include <asm/memory.h>
 
+#ifdef CONFIG_ARM64_D128
+#define PTDESC_ORDER 4
+#else
 #define PTDESC_ORDER 3
+#endif
 
 /* Number of VA bits resolved by a single translation table level */
 #define PTDESC_TABLE_SHIFT	(PAGE_SHIFT - PTDESC_ORDER)
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 290aefcf0f0f1..bd31211624d4d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1081,6 +1081,8 @@ static inline bool pgtable_l4_enabled(void) { return false; }
 
 static __always_inline bool pgtable_l5_enabled(void)
 {
+	if (IS_ENABLED(CONFIG_ARM64_D128))
+		return true;
 	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
 		return vabits_actual == VA_BITS;
 	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
-- 
2.43.0

