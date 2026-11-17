Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899191;
	b=0gjWXHkJSdS0piDp/VlrqD6HsACDu7Juv9oMm9nahuO18WGlZu9AEv/0AKI6IcAM6nLc
	 7G+DYWEZXQsIc0C4wiFptvBLJ24p4iVp4oBJJtf6OMQyplSdvt6fDO5cdXBG1mWl+2a2x
	 hrrkWjkUFH0Ig1yKt9Tv0A5S21WBreYq20BCwkWtR1jLvdIxzU/5Y+TeIvi59cc3RvwYy
	 5GXIlPK2nhLMmeru2Um+CWnrlcKDxMbubwnCs23E+v6BTeOagn5uIEEOwdOnlUdizmnCc
	 02HfQpSLpg2Ec4iM8dxcjoYYRh3g8QPB9NxLsu++7CnOSYQvda8wrvlH2JyaM0TFqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899191;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3NItBReUtOBWpHO0nf0rUAjTdM1Dh5h3BZRHNSIgwrA=;
	b=Cd+yFvJf9rWhuxI94NPlc3X+sNcRCYTAwSciaR9tOrmEaBLYsgKw3mnn1A97b86wLcv7
	 AjE6+91A7UOfX8Y5qZvPmczUCc2vOhlydqwP3u5D5zbuAcEiYtDT5Txxz4UIcEdKDRaLD
	 Sj39TFSMo21xPYQ4Q7VsohlRYeobGZIA6tnXYLzDYh0fvVwVImU/ODOdgbBvVmm4vZv5B
	 IOwunPV51fiTTM9TkqJxrwEGa1ecjuP4m03U54EcBcYqKrcpytZuLAOuEEp3sSdssDgUi
	 i8fvjW62f7qSvEOXRip5BzExwA4DDmQ936pTZr/nHrrQZ1QDxPJUXbPCwTXz4X3e5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D0K5hEkf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A840606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A840606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D0K5hEkf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985761682;
	Mon, 16 Nov 2026 23:06:27 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDF1E3FB7F;
	Mon, 16 Nov 2026 23:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899190; bh=QAGXNbzD0g0sHHdjDN/4c/Sx+cC3l60UDdZ0bXS07ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D0K5hEkfCw9m9shseCLzkHCVRdi1eAy7puGMYpkj4yj2DQMdwmMeOxPNOdJW0aDB6
	 APo5YxDzM3z1YOuhWdAOf/Ep7TwFuoMvRYhoyIK59POQa2foDTv3dXMI0YYGUujhVd
	 4qGB7+5QaQgdd5g6+fmGLhnJ3hQ9M7fcwd6uoVsE=
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
Subject: [PATCH V3 02/14] arm64/mm: Route all pgtable reads via ptval_get()
Date: Tue, 17 Nov 2026 12:36:01 +0530
Message-ID: <20261117070613.1183243-3-anshuman.khandual@arm.com>
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

Define arm64 platform specific implementations for new pxdp_get() helpers.
These resolve into READ_ONCE(), thus ensuring required single copy atomic
semantics for the page table entry reads.

In future this infrastructure can be used for D128 to maintain single copy
atomicity semantics with inline asm blocks.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a760c65de5cbe..1c982ccc1e5e3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,28 +84,30 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	arch_flush_lazy_mmu_mode();
 }
 
+#define ptval_get(x)		READ_ONCE(x)
+
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(const pmd_t *pmdp)
 {
-	return READ_ONCE(*pmdp);
+	return ptval_get(*pmdp);
 }
 
 #define pudp_get pudp_get
 static inline pud_t pudp_get(const pud_t *pudp)
 {
-	return READ_ONCE(*pudp);
+	return ptval_get(*pudp);
 }
 
 #define p4dp_get p4dp_get
 static inline p4d_t p4dp_get(const p4d_t *p4dp)
 {
-	return READ_ONCE(*p4dp);
+	return ptval_get(*p4dp);
 }
 
 #define pgdp_get pgdp_get
 static inline pgd_t pgdp_get(const pgd_t *pgdp)
 {
-	return READ_ONCE(*pgdp);
+	return ptval_get(*pgdp);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -405,7 +407,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 
 static inline pte_t __ptep_get(pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return ptval_get(*ptep);
 }
 
 extern void __sync_icache_dcache(pte_t pteval);
-- 
2.43.0

