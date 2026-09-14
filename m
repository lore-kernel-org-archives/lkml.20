Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252E45D1A8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389117; cv=none; b=I9bdFK+5b0DE7KsHL4VTnW0PtRgHrm2dzBnIF3GTxBkDPFfsNbWfMsMkOOXoxLZOKKWAxWKBkcgUTPMBXxkljadBDBtG/N0oEny1HVll7YyQqPxcLfjkVyWs48op4J/libVUqUcECj4Axe2Iizx5O0GIdMgVEUVUT1FJC0rWc4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389117; c=relaxed/simple;
	bh=0pxvz2tA8d/MqnhA+ARBMVfrRyK0IVtO3kcKq5jVvyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmZTSM1OeUHElDfzrs5HiU/QbkiJyB3z3ui4CWdCqsIsxj5hAxnX0xoIo2jMyxD4E9GP8IGjRIYaowXiCBQ/8Kq0UC3rPNUPh0pnAxXD326VbY5Ia0OFxiG/rvUdsKXb9MHS5CfpMmVZxLR8FPMPCOnvtGAG1KFC1DTIuyrgAr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cUeMcohk; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cUeMcohk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0pxvz2tA8d/MqnhA+ARBMVfrRyK0IVtO3kcKq5jVvyM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389105; v=1; x=1789993905;
 b=cUeMcohkP1jsBtxE6fis2Pimxgeg45wvpSINk23Rh9u406i7JrWBmjRGOU3FLpGJil5tQs34
 Y27hM6JDd30TjiXdkGpgQR2wCV/TAZjVMnElrtxK+mKnmfvZQax78mkl+4MNh4kAKDzHPp8pMWQ
 LVFNKoDG/PvexTPaz3c7SExU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a8f2f31ac8e52b34;
	Mon, 14 Sep 2026 12:31:45 +0000
X-Mizu-Trace-ID: a8f2f31ac8e52b34
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
Subject: [RESEND v7 18/29] mm: free PMD swap entries in zap_huge_pmd()
Date: Mon, 14 Sep 2026 05:28:08 -0700
Message-ID: <20260914122950.3283997-19-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
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
index d3d0fec9a5ff3..689a1f4286471 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2628,6 +2628,16 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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

