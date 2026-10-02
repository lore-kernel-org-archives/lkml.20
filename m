Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530948125B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935029; cv=none; b=OF1K46liyo1Onrg3qxnPZaI6C0mgt5KAYuSuyio2VY4YSjeMt3FdLue+eDQYwd5SaWAU5ZrY+WtVHxpt7q9va7XhfEY9wmq9oTMUxx/AXae2yUOtW3oF+FT6rPITwvjHpgTTk+d3GI9gwf954OXt8Q05ublIQugP7Uz1jrMl4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935029; c=relaxed/simple;
	bh=52my7Ds1LJ1DHVTSsdRA7MBIeNU6HZuTroAZD3VRoTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgoclkhdCVicKlnFBiaEtADEi1RICjlKsho5qWNQL2i5SwNoj5f6xB+pX37dj+EJWgyr2J//MGOwJ5gjmV5mEE9ApD54U7ytn6/lQa5b1ETKrWCbCllSCwQ9BjvxoHehyIHfKjCJ7sf7GviOliADCaNHp2roGI4M7J7vPNIdEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LY39kZdC; arc=none smtp.client-ip=91.218.175.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LY39kZdC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=52my7Ds1LJ1DHVTSsdRA7MBIeNU6HZuTroAZD3VRoTc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935026; v=1; x=1791539826;
 b=LY39kZdCizl4I+vJLqnY3cigY21QEBTwI/SdtMwl0Mqmxodx9AQJxTxhI0+hK5hY+9MjRh5O
 7dHtbBAsyvI62Mm4ApfSy3uMI7Ahy4GZklhc9E0qKfUJVyr7vadGQD3+gyPFaaGvN4VKvmaCW/U
 BNHQ3Rra5wHKIoXpwYwWLAEk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 97a2097a84c32ae4;
	Fri, 02 Oct 2026 09:57:05 +0000
X-Mizu-Trace-ID: 97a2097a84c32ae4
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v8 19/30] mm: free PMD swap entries in zap_huge_pmd()
Date: Fri,  2 Oct 2026 02:52:33 -0700
Message-ID: <20261002095503.3585565-20-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zap_huge_pmd() assumes any non-present PMD it clears references a folio, so
a PMD swap entry would reach normal_or_softleaf_folio_pmd() and warn.
Worse, nothing would release the slots it points at: unmapping a
swapped-out THP would leak the whole PMD's worth of swap.

Handle it before the folio lookup, as zap_pte_range() already does for a
PTE swap entry.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 56eb87fa98376..9cf7c4747cac9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2605,6 +2605,16 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	arch_check_zapped_pmd(vma, orig_pmd);
 	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 
+	if (pmd_is_swap_entry(orig_pmd)) {
+		softleaf_t entry = softleaf_from_pmd(orig_pmd);
+
+		zap_deposited_table(mm, pmd);
+		spin_unlock(ptl);
+		swap_put_entries_direct(entry, HPAGE_PMD_NR);
+		add_mm_counter(mm, MM_SWAPENTS, -HPAGE_PMD_NR);
+		return true;
+	}
+
 	is_present = pmd_present(orig_pmd);
 	folio = normal_or_softleaf_folio_pmd(vma, addr, orig_pmd, is_present);
 	has_deposit = has_deposited_pgtable(vma, orig_pmd, folio);
-- 
2.53.0-Meta

