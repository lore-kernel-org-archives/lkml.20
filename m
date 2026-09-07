Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61733F1057
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753063; cv=none; b=Xje/+GEOs/CarTpre6fabPt/HJdLdmpLEfH127B+6Oz8dAh1qyTT9hl7XyoTpnkA0oRL4e/zZ7Hqk9osVTCMMCUCe3BPIJknVdiCdpZHLwApPmKSZVCjrkfCIAIDx8XuqO/Kx1PJKSVmQsOkOsXOuSgNZ2oFZsi6BQK2w5Unkf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753063; c=relaxed/simple;
	bh=6wa5MsZMcn+Z3nxdy5kbv2HZNFuqAlAuRxAc1QrQTkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSJx5km/+1NR4WaEr1sPCt8uDKKhPmJfmj7divz6gkgOJ/+HbGq4S5NZX7O9oEiIomo4EB+ugn64L7vWzHQbtp1z/5xXmekpUx+2Z3MFG+/vOzVMAP2TEGq3bfXQ/HYltbYqNR7H8nolLs/4i8CNA9rKeOLNFH0jk2RIWZhCubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fl8VqLvm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fl8VqLvm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FD881477;
	Sun,  6 Sep 2026 20:50:57 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7793E3F7B4;
	Sun,  6 Sep 2026 20:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753061; bh=6wa5MsZMcn+Z3nxdy5kbv2HZNFuqAlAuRxAc1QrQTkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fl8VqLvmTQZwKkcHorxP+8qDbRaaOF5rpdgiICuln2/D8a52ywJZ2eGm7xYrWI17b
	 lPolpJsYANXrx5502C20P7O6olCTgsRw8X+lqFvgMPBR7Kq/CtPR4KZhbgShkCAeNg
	 832RVk5IAZkPgsN2eikujbI3fztFJ587Xr01fJzE=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 07/14] arm64/mm: Enable pgtable geometry for FEAT_D128
Date: Mon,  7 Sep 2026 09:20:22 +0530
Message-ID: <20260907035030.2839978-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index b5a51b0ef944..306e6c803471 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -284,14 +284,18 @@ config MMU
 
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
@@ -362,6 +366,16 @@ config FIX_EARLYCON_MEM
 
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
@@ -1594,7 +1608,7 @@ config ARM64_PA_BITS
 
 config ARM64_LPA2
 	def_bool y
-	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
+	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES && !ARM64_D128
 
 choice
 	prompt "Endianness"
@@ -2289,6 +2303,19 @@ config ARM64_HAFT
 
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
index 72f31800c703..1ee1a6d9db6d 100644
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
index 7a5d6a14bb52..4b534be3f288 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1075,6 +1075,8 @@ static inline bool pgtable_l4_enabled(void) { return false; }
 
 static __always_inline bool pgtable_l5_enabled(void)
 {
+	if (IS_ENABLED(CONFIG_ARM64_D128))
+		return true;
 	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
 		return vabits_actual == VA_BITS;
 	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
-- 
2.43.0

