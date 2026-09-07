Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657393F1057
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753079; cv=none; b=AoRBsHKomAELw/iADV4Jxvv/luh9Xha8i7nMRNJo0xSMmffJC+6PxD7MnJxgLdIdSxP0uWFul4yOno1sTeIIPzbs8WU0zMvZp3BqMfzZ4VaGAiPixJLy2C+dBCr2jZPlxycSXxi4sjWSZlQ3bwIe9BM15jwRtH+y1lns/gcJf60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753079; c=relaxed/simple;
	bh=LhsC0NhjKIdOi9rcgt72ehmDXHWyJcPL2hu83ddAkXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgnwtspDz7ocDp8kBkJfawZ/AlevRzx6uaw3VrwG5JDYepFyBxu8N+sONadhhME5ug85vfzMfBEEo9d10YjLMUcFxAniK/WB5CphhT7f8FCaxHm0oTmOiecdZDmOTreAAkdDYuZF8tgNn1R9BNHjtXeEGwP+npD/iZh03+XUWH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GDH1iVaD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GDH1iVaD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1AF1AED;
	Sun,  6 Sep 2026 20:51:12 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C28233FBF5;
	Sun,  6 Sep 2026 20:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753076; bh=LhsC0NhjKIdOi9rcgt72ehmDXHWyJcPL2hu83ddAkXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GDH1iVaDTX9uj2NicaktrTaa+TO516GXCUn6g6G08VZgnHdHZUl1DRy1eGFL6TTxv
	 5QfnhHYRlF7ub/R7VFyqpPlgoON0Xu9Hhf6wHW0ROHaudZTmb5DVQB+JS16u+qgWDk
	 bTw9+mPbTyJtpWzYfQuf/x3Ux/JhZoSnBhnxP2t0=
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
Subject: [PATCH V2 11/14] arm64/mm: Enable TLBIP instruction based TLB flush
Date: Mon,  7 Sep 2026 09:20:26 +0530
Message-ID: <20260907035030.2839978-12-anshuman.khandual@arm.com>
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

From: Linu Cherian <linu.cherian@arm.com>

Add TLBIP instruction support for TLB flush operation updating all relevant
macros as necessary. This enables back pgtable level hint and address range
support during TLB flush operation for D128 translation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 68 +++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 88ae4e443ed6..f31a555760f0 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -41,6 +41,25 @@
 
 #define __tlbi(op, ...)		__TLBI_N(op, ##__VA_ARGS__, 1, 0)
 
+#ifdef CONFIG_ARM64_D128
+#define __tlbip(op, arg) do {		\
+	asm (ARM64_ASM_PREAMBLE		\
+	".arch_extension d128\n\t"	\
+	"tlbip " #op ", %0, %H0\n"	\
+	: : "r" (arg.full));		\
+} while (0)
+
+#define __tlbip_user(op, arg) do {		\
+	if (arm64_kernel_unmapped_at_el0()) {	\
+		arg.low |= USER_ASID_FLAG;	\
+		__tlbip(op, (arg));		\
+	}					\
+} while (0)
+
+#endif
+
+#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
+
 #define __tlbi_user(op, arg) do {						\
 	if (arm64_kernel_unmapped_at_el0())					\
 		__tlbi(op, (arg) | USER_ASID_FLAG);				\
@@ -130,9 +149,15 @@ static inline void sme_dvmsync_batch(void)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
+#ifdef CONFIG_ARM64_D128
+typedef union __u128_halves tlbi_arg_t;
+#define __tlbi_wrapper(op, arg)		__tlbip(op, arg)
+#define __tlbi_user_wrapper(op, arg)	__tlbip_user(op, arg)
+#else
 typedef u64 tlbi_arg_t;
 #define __tlbi_wrapper(op, arg)		__tlbi(op, arg)
 #define __tlbi_user_wrapper(op, arg)	__tlbi_user(op, arg)
+#endif
 
 typedef void (*tlbi_op)(tlbi_arg_t arg);
 
@@ -179,17 +204,28 @@ static __always_inline void ipas2e1is(tlbi_arg_t arg)
 	__tlbi_wrapper(ipas2e1is, arg);
 }
 
-static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
-					      u16 asid)
+static __always_inline void __tlbi_update_level(u32 level, u64 *arg)
 {
-	u64 arg = __TLBI_VADDR(addr, asid);
-
 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
 		u64 ttl = level | (get_trans_granule() << 2);
 
-		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);
+		FIELD_MODIFY(TLBI_TTL_MASK, arg, ttl);
 	}
+}
+
+static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level, u16 asid)
+{
+#ifdef CONFIG_ARM64_D128
+	union __u128_halves arg;
+
+	arg.low = FIELD_PREP(TLBI_ASID_MASK, asid);
+	__tlbi_update_level(level, &arg.low);
+	arg.high = addr >> 12;
+#else
+	u64 arg = __TLBI_VADDR(addr, asid);
 
+	__tlbi_update_level(level, &arg);
+#endif
 	op(arg);
 }
 
@@ -475,19 +511,33 @@ static __always_inline void ripas2e1is(tlbi_arg_t arg)
 	__tlbi_wrapper(ripas2e1is, arg);
 }
 
-static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
-					 u16 asid, int scale, int num,
-					 u32 level, bool lpa2)
+static __always_inline u64 __tlbi_range_args_encode_comm(u16 asid, int scale, int num, u32 level)
 {
 	u64 arg = 0;
 
-	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
 	arg |= FIELD_PREP(TLBIR_TTL_MASK, level > 3 ? 0 : level);
 	arg |= FIELD_PREP(TLBIR_NUM_MASK, num);
 	arg |= FIELD_PREP(TLBIR_SCALE_MASK, scale);
 	arg |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());
 	arg |= FIELD_PREP(TLBIR_ASID_MASK, asid);
 
+	return arg;
+}
+
+static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
+					 u16 asid, int scale, int num,
+					 u32 level, bool lpa2)
+{
+#ifdef CONFIG_ARM64_D128
+	union __u128_halves arg;
+
+	arg.low = __tlbi_range_args_encode_comm(asid, scale, num, level);
+	arg.high = addr >> 12;
+#else
+	u64 arg = __tlbi_range_args_encode_comm(asid, scale, num, level);
+
+	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
+#endif
 	op(arg);
 }
 
-- 
2.43.0

