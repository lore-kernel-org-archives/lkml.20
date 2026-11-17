Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899225;
	b=ZOAgDf83EIE0vlm84AZs8eoPdx11FChg4mqv6TBmM0B9rVadKE9HKM6jshCCb3zt7soV
	 D1b3GizfZGeYigE0aiwx7LUOqjRczmJzMWMrgpOIvCSoLzOToiXgPm5fdBdCUzheb+7Hm
	 Hkav1gcVCA7dqIrTm/dIEe8JPKKJoNV7josCpv0R2LjqARrBdFJjtNqlZIN4XTKvPahI/
	 HU4hfFOloL+D033PcKBSlp+HtIL4voPClxqHFALEDR9Qo3XNZafXbPrHtNGQb6EeMz+np
	 ginccIcDNgMLABU2oH2nnvoY0yZJv+hbiCEPKi956OZ5xQseO1BeFhAH0HkMOYH3mPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899225;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iv8DY4asFhTjzipaQVYQqam4Cbb+8XuirWHT+xFO2vo=;
	b=lci5T3Hue7clcqgfD5P4YF4fGSgmtvue4iQEbQn0UFz1Mw2oM7UWbKoIbchwpc/8NSzx
	 AbGOJlYH466HDwuRV/JpoDNuxqqaRpGHwJcZl5I9JmYFrGrCTnp1aLWjWXGBfZoy8PyY/
	 TzW8vDtQjAO+trrcx3Aat5KIzWh4v2sYEqU5zTvnUGWO6WTnRhDoRd/cw/ZaBQCyYeml+
	 It6fM0aAydlAe3cU9LZj7TGNijt4FaHH4tk59S7vOA39E/xim4XE/Y831qSQWaQuAuw3R
	 PjOKivyh/sgMYFOq/MV+4VrHlBI1G4iLMoEfb75kUWDH5gtL7TF24Ai1f3G1e18ev9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sh0MlkhJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EB1606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57EB1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sh0MlkhJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4C01476;
	Mon, 16 Nov 2026 23:07:01 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F4733F763;
	Mon, 16 Nov 2026 23:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899224; bh=gWd3VSKQGcmDL0rND+7miFz0510CU52wEGtyXPxoBxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sh0MlkhJYda5X1jALRTVT5SvRmycezCCIhbm8p177NP2BlcMJjCiUDiC4RBhdFhfe
	 VkiqnTrU0lsjjF/kIqlsHyjzifa5Amj9xoyY8Ft6CFOG6m/Eg88bOG3jhBVJH3vB0a
	 WDX0Jg+x0cp1/3EkuDCW+AWpbPGMvxOqWZ9VMtHM=
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
	linux-mm@kvack.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH V3 11/14] arm64/mm: Enable TLBIP instruction based TLB flush
Date: Tue, 17 Nov 2026 12:36:10 +0530
Message-ID: <20261117070613.1183243-12-anshuman.khandual@arm.com>
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
index e46bebeb230d6..a440a8fd0ebcf 100644
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
 
@@ -479,19 +515,33 @@ static __always_inline void ripas2e1is(tlbi_arg_t arg)
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

