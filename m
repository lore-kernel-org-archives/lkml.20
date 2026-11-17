Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899222;
	b=qaw1jm8E//MBIeicBJf2jrfoO+d08O6sIlhS0D2jTPOhuixfIKgIBLKZXTB9hRt9hDuC
	 /YI8qSnk8a4H3AjSRxjEJ7wa8o7T4YAqOSuS8wxe3rwan0FdOdsk5K3SSxg4l2NsNaetX
	 AjmDPE379MG0USWHC8E9UEUZy63zS2aoLEk5hy/oApbQdcAmbPUU8iWPMGLqm6YajP75E
	 bLSiXyz3vxqa9gWeX2HrRGcVlTF7ZehA5k4lMWlclHQR3GTgyYBqj683qq6WzV+ncpHUl
	 zWo8sRQmK/AuOIgZsGsMuwWM7Lin6+h716FtYyiBKzo3G7u1MYIG+AexcUGwVjNtRNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899222;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9XHNTvsxvTs29hz6BcMFjPlN/wv+sbJF4QuCIXu6oQQ=;
	b=F4SNDIk56oeAiBiZaqbXeEyx8S7rgid8pZUbMRyNHt/RYhdoKNy013mqksGk/mEKJ52V
	 t0B8FdsYxnTXGL90NrlbHUADkC9U0QoMeZImF9Es3TSfgE0bkp7BI+QsiX4yRycOBF81r
	 PbxKFPSL9osbJhhQITgVonogsUmjGaQryRllaXrYdfTJwRhj97MDkPAYEAkE7N4+xParU
	 rVosbf2/szg5sugcU9ny9Ln3F8q2eU3EyxOAfctKhrMi2pWoOIyMEhitnOxJJmwHYd5sA
	 i3yvsVt0PMLS/pwAHVdYzz936YwYK5JDrraDPNjhrPNzaCYe+7ox7TsVIkxfnzJdp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vW35PPri;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A500606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A500606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vW35PPri
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07FBD1BD0;
	Mon, 16 Nov 2026 23:06:58 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DC053F763;
	Mon, 16 Nov 2026 23:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899221; bh=hn3PA/FHiJccaTPVEin+J5IcUo1zFJdOxKnT8wtz+xI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vW35PPriYm7NahrJU5oPMNGIRSEKeVAmNAUxuWBxWFPUWYAMtihBpIg3yzJaKagb/
	 hQM249eT2uubKC73o+LX/+Jqtjlz+53e8UAcU7O4EbNPhc3qvDh/MiH4Ru9HVaPnME
	 I/FcwBN/1c/Y8OukF6ZX1zitFJMADP88nzkPO/5U=
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
Subject: [PATCH V3 10/14] arm64/mm: Add an abstraction level for tlbi_op
Date: Tue, 17 Nov 2026 12:36:09 +0530
Message-ID: <20261117070613.1183243-11-anshuman.khandual@arm.com>
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
index a05520d3a0131..e46bebeb230d6 100644
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
@@ -447,32 +451,32 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
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

