Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F126136D9FE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241497; cv=none; b=SDivkDowxsiHKjdvJpjpjWgOd2u2oRxSRh7Ce1rJ4woeJFjD5bjToI9dUb/A41+uQxx60O90s5llDhJmqlnpHl9DpCqzL/0yUcpxqBed4W4zETuu0+4glJWMPFxC5ZgkfQFMCsWu1E2MlEnBhuauryC/IRB/ex1uTuHv2rcd074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241497; c=relaxed/simple;
	bh=MUViQSYFM/j8MeFADam1qMeEw2VDwtqRRIgpPPWeUZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvNHN3V5FMR/h6fHOZBAUC9Z0kLnEcC8qFKvOyw4Cnmi/o7sfvDKMsrx9l5PtdnLNEJKYEySj6M4kJM8sgthiryFeN2Ke7em3lk+DXEdDNs8OrCVgIQ5jMICInTkYpn9xgMrMbF1CkrVMqFvnCd1PMjF8kyfC6luQYMgAzOobBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nBLhpdqq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nBLhpdqq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DA081756;
	Mon, 31 Aug 2026 22:44:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 559553F85F;
	Mon, 31 Aug 2026 22:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241495; bh=MUViQSYFM/j8MeFADam1qMeEw2VDwtqRRIgpPPWeUZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBLhpdqqTeiLBsehoAgcnw5ytfBWyQ0xm+6HJxkFcOWigjKxlOo00ljikMwNN901B
	 cAROJ+KOhN61lBJivqsFVGsiHbEwUTULpVkJC3sQZ+/EcGS2ohMeraBMHRgGU5LuPz
	 eXikSx8j70m4MiV72hE6xi7jYl9SlkGSd/YPikoI=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 6/8] mm/internal: add set_softleaf_ptes
Date: Tue,  1 Sep 2026 05:43:53 +0000
Message-ID: <20260901054358.4049095-7-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901054358.4049095-1-dev.jain@arm.com>
References: <20260901054358.4049095-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we have a helper called set_ptes() which is used to set
consecutive present ptes in the pgtables. To do the same operation but
to set "consecutive" nonpresent (softleaf) ptes, add set_softleaf_ptes().

The softleaves which have a notion of consecutivity is swap softleaf,
and those grouped by softeaf_has_pfn(). The latter is trivial; future
code can convert present ptes pointing to the same large folio to
swap softleaves with consecutive offsets using this helper.

The other case is softleaf markers. They do not have a notion of a swap
offset or PFN, so future code can use set_softleaf_ptes() to store
multiple (same) markers on the ptes.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/internal.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/mm/internal.h b/mm/internal.h
index cfea888366d58..41cf8b9607e31 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -507,6 +507,39 @@ static inline pte_t pte_next_softleaf_offset(pte_t pte)
 	return pte_move_softleaf_offset(pte, 1);
 }
 
+/**
+ * set_softleaf_ptes - Set consecutive softleaf PTEs.
+ * @mm: Address space the PTEs belong to.
+ * @addr: Address of the first PTE.
+ * @ptep: Page table pointer for the first PTE.
+ * @pte: PTE to set for the first entry.
+ * @nr: Number of PTEs to set.
+ *
+ * Install @nr softleaf PTEs, advancing @pte when its softleaf entry
+ * represents consecutive offsets. Swap entries advance through swap offsets,
+ * PFN softleaf entries advance through PFNs (encoded by swap offset), and
+ * marker entries are repeated unchanged.
+ */
+static inline void set_softleaf_ptes(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, pte_t pte, unsigned long nr)
+{
+	softleaf_t entry;
+	bool advance;
+
+	entry = softleaf_from_pte(pte);
+	advance = softleaf_is_swap(entry) || softleaf_has_pfn(entry);
+
+	for (;;) {
+		set_pte_at(mm, addr, ptep, pte);
+		if (--nr == 0)
+			break;
+		if (advance)
+			pte = pte_next_softleaf_offset(pte);
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+
 /**
  * swap_pte_batch - detect a PTE batch for a set of contiguous swap entries
  * @start_ptep: Page table pointer for the first entry.
-- 
2.43.0

