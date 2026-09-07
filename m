Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E61B3E9F93
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753058; cv=none; b=HihgL1Cmm953lWxzRzu7iXVHyOajBNdvVnDymfJKnfO9p8NWn6B0FO62xZfraZPMnvnsUYlmmk5nossJViavaVvHlAir8b7xQ+NQEjOTWUaORZs6xZv53ZE4pKwsjLofD9HrnWjMqcvVNvrCQeg9p0AlZg/GlJubzJHvPdzzWy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753058; c=relaxed/simple;
	bh=/rjGzAt748dsaT36LBnwBIEZW4gfjkEspNbbmVlfxKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imMWYJzUjziH8GmvG/iRpH0qoatYBXKMO0ynKI045LAhv4ZtxQNsZNzljGsq7qZpspXDY47Hs48zoLkAqbbvIWYKnUtCxs8FDDzS2+94vMNcSJIMIfEPnJlrSAMynyu95wmqF5hTSNcpJ3rtgv6fteay0TmSuCDc0xsdNWy63pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sMy811HE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sMy811HE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5DE61477;
	Sun,  6 Sep 2026 20:50:49 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB6B53F7B4;
	Sun,  6 Sep 2026 20:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753053; bh=/rjGzAt748dsaT36LBnwBIEZW4gfjkEspNbbmVlfxKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMy811HEo7xsqsm1p6JcAzLBb1J9PIdm3/h3H35Mn7WqMv0uYuDIVHpZ3IQqhy+bA
	 sWeT+NJFvEID6NFJBlSkLv1xwq/uGZiqo3RpydBbivEGHiwYUfOgUUsd4NohfsU0vo
	 apZdfIn31OFzbtwwAWTrajkO9WPqqLFAmPjA/4BU=
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
Subject: [PATCH V2 05/14] arm64/mm: Override read-write accessors for vm_page_prot
Date: Mon,  7 Sep 2026 09:20:20 +0530
Message-ID: <20260907035030.2839978-6-anshuman.khandual@arm.com>
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

Override pgprot_[read|write]() accessors using ptval_[get|set]() providing
required single copy atomic operation for vma->vm_page_prot.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 66bf5bbe484e..2b457db19be0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -122,6 +122,18 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 	return ptval_get(*pgdp);
 }
 
+#define pgprot_read pgprot_read
+static inline pgprot_t pgprot_read(pgprot_t *prot)
+{
+	return ptval_get(*prot);
+}
+
+#define pgprot_write pgprot_write
+static inline void pgprot_write(pgprot_t *prot, pgprot_t val)
+{
+	ptval_set(*prot, val);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
-- 
2.43.0

