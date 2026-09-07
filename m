Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4753F107B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753075; cv=none; b=OoQbrDsQawOTBemNGm8SlwFord2/oOTDd4DCo4a/tc34Kt3CRPblvjroMEgJketoC86OX5YRaZV/ScGyOR020xyiBaDFtDKFU+eMFN11Q96VTwwkk4EzuDDELem1M/Zgm+DD+T5C3OkFL0VrELlGa2ZW5kqM0qPQrjjkE1vUFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753075; c=relaxed/simple;
	bh=e60cWCqWvU5usBlVAuNQW11xubuWlhpocNAxI1B8G28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+y8UOFx7VavK/hfKVaZ2zG7Giv/t7whNW2LuLvizrFlWutS5BkVyRkJ3qNxczvY+hmIEZ99h0XIVFFpwJeecMunwXrIXqPw3AhLd6Yl54tKKvJaoXJ6i8+7ZZbA3s+D23scsiYEPzhF4tZfeaVrZ7remunmhygfWAKRlQys1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GoO/h9TL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GoO/h9TL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0018B1516;
	Sun,  6 Sep 2026 20:51:09 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBE743F7B4;
	Sun,  6 Sep 2026 20:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753072; bh=e60cWCqWvU5usBlVAuNQW11xubuWlhpocNAxI1B8G28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoO/h9TLo5WxQU44DjPignv1t1V1GPmlyG79AXj0rqAGEsV1VdWickcqE4TMSYxKb
	 e0iIuExCyFmFHPnmczA8v3nVJeUJ1HA9VAXFwEGmE7WaYEZXk/vp0Prb41nDO6V5jP
	 z3hOjL0pkiO6NZlaJ4aoiMB+agf8MRlGxZ7t6X4k=
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
Subject: [PATCH V2 10/14] arm64/mm: Add an abstraction level for tlbi_op
Date: Mon,  7 Sep 2026 09:20:25 +0530
Message-ID: <20260907035030.2839978-11-anshuman.khandual@arm.com>
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

With FEAT_D128, a new instruction aka TLBIP is being introduced for the TLB
-by-range operations which has an argument size of 128 bit.

Add an abstraction level to void (*tlbi_op)(u64 arg) helpers to support the
D128 variations when applicable.

No functional changes are introduced with this patch.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 70 ++++++++++++++++---------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 14a78ac0f800..88ae4e443ed6 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -130,49 +130,53 @@ static inline void sme_dvmsync_batch(void)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
-typedef void (*tlbi_op)(u64 arg);
+typedef u64 tlbi_arg_t;
+#define __tlbi_wrapper(op, arg)		__tlbi(op, arg)
+#define __tlbi_user_wrapper(op, arg)	__tlbi_user(op, arg)
 
-static __always_inline void vae1is(u64 arg)
+typedef void (*tlbi_op)(tlbi_arg_t arg);
+
+static __always_inline void vae1is(tlbi_arg_t arg)
 {
-	__tlbi(vae1is, arg);
-	__tlbi_user(vae1is, arg);
+	__tlbi_wrapper(vae1is, arg);
+	__tlbi_user_wrapper(vae1is, arg);
 }
 
-static __always_inline void vae2is(u64 arg)
+static __always_inline void vae2is(tlbi_arg_t arg)
 {
-	__tlbi(vae2is, arg);
+	__tlbi_wrapper(vae2is, arg);
 }
 
-static __always_inline void vale1(u64 arg)
+static __always_inline void vale1(tlbi_arg_t arg)
 {
-	__tlbi(vale1, arg);
-	__tlbi_user(vale1, arg);
+	__tlbi_wrapper(vale1, arg);
+	__tlbi_user_wrapper(vale1, arg);
 }
 
-static __always_inline void vale1is(u64 arg)
+static __always_inline void vale1is(tlbi_arg_t arg)
 {
-	__tlbi(vale1is, arg);
-	__tlbi_user(vale1is, arg);
+	__tlbi_wrapper(vale1is, arg);
+	__tlbi_user_wrapper(vale1is, arg);
 }
 
-static __always_inline void vale2is(u64 arg)
+static __always_inline void vale2is(tlbi_arg_t arg)
 {
-	__tlbi(vale2is, arg);
+	__tlbi_wrapper(vale2is, arg);
 }
 
-static __always_inline void vaale1is(u64 arg)
+static __always_inline void vaale1is(tlbi_arg_t arg)
 {
-	__tlbi(vaale1is, arg);
+	__tlbi_wrapper(vaale1is, arg);
 }
 
-static __always_inline void ipas2e1(u64 arg)
+static __always_inline void ipas2e1(tlbi_arg_t arg)
 {
-	__tlbi(ipas2e1, arg);
+	__tlbi_wrapper(ipas2e1, arg);
 }
 
-static __always_inline void ipas2e1is(u64 arg)
+static __always_inline void ipas2e1is(tlbi_arg_t arg)
 {
-	__tlbi(ipas2e1is, arg);
+	__tlbi_wrapper(ipas2e1is, arg);
 }
 
 static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
@@ -443,32 +447,32 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  *    operations can only span an even number of pages. We save this for last to
  *    ensure 64KB start alignment is maintained for the LPA2 case.
  */
-static __always_inline void rvae1is(u64 arg)
+static __always_inline void rvae1is(tlbi_arg_t arg)
 {
-	__tlbi(rvae1is, arg);
-	__tlbi_user(rvae1is, arg);
+	__tlbi_wrapper(rvae1is, arg);
+	__tlbi_user_wrapper(rvae1is, arg);
 }
 
-static __always_inline void rvale1(u64 arg)
+static __always_inline void rvale1(tlbi_arg_t arg)
 {
-	__tlbi(rvale1, arg);
-	__tlbi_user(rvale1, arg);
+	__tlbi_wrapper(rvale1, arg);
+	__tlbi_user_wrapper(rvale1, arg);
 }
 
-static __always_inline void rvale1is(u64 arg)
+static __always_inline void rvale1is(tlbi_arg_t arg)
 {
-	__tlbi(rvale1is, arg);
-	__tlbi_user(rvale1is, arg);
+	__tlbi_wrapper(rvale1is, arg);
+	__tlbi_user_wrapper(rvale1is, arg);
 }
 
-static __always_inline void rvaale1is(u64 arg)
+static __always_inline void rvaale1is(tlbi_arg_t arg)
 {
-	__tlbi(rvaale1is, arg);
+	__tlbi_wrapper(rvaale1is, arg);
 }
 
-static __always_inline void ripas2e1is(u64 arg)
+static __always_inline void ripas2e1is(tlbi_arg_t arg)
 {
-	__tlbi(ripas2e1is, arg);
+	__tlbi_wrapper(ripas2e1is, arg);
 }
 
 static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
-- 
2.43.0

