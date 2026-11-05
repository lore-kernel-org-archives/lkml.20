Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904114;
	b=qEBjc/cHiWoNYbw7BJ3u1ZLt8kwnurVADmBQBJCtTbSTyZ3c4QM+PVr3NhZ0dpYxhekT
	 4XuiZHP8dXWnMP7g1UKorOX9curOz8c+V4UhnePGB98jqC2W2+sahrdEh336P1UKdgi0q
	 iPSVLV9qOG1dFZ7kGNp+mCDeAac3HLzeom9SC0u/oE7kDTnUT18OirDHfh38uTAJk9tTR
	 u21KRFzoVjsk1FjKm2eLX+C4qYLFeBq3AeXxcUyZgWD80n5nE9TCiplxm7IS8WmItTYYJ
	 su7/6ewvpUuYjkVKsZ/F/PPofweWn2KKVMRpcnfGeRgLOjzqzgs/ON8h1E48nPNA1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904114;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=72FcthPtRbjzoeXj7bzWyrfckYFlHv/yxS6YCWw2V4k=;
	b=eIMkL05OcPR1tK3Qb7vQK14c2CIG/dbpAgTLupoCYPJw5M9FzXBdYuhMRAGqAlNlryzF
	 Adp9UhSi2gkx8/rMqeweLBlyj8V8yP9wLx/qEi7gXxRWVk+fJ1Lzh1GqSgLXYfp2v9dtY
	 z1QfzCSJFHEJMe9OHZqnqHhnRZR+WVKgV9O6vhu3UotbJSOUAplI8nGCnSHxCGXAnEcrO
	 vy23l1jf2A9mdYtL9+nTibsiZ8it5nupeiFueKqLDBHtsW9M60ghBYHA7vXrWo6KxhYQl
	 qBMVZ8KRFko1pAjWivQM4q4fIf/plcuhP7bzV4uLVV0njphz0kFhGzQ3Dai/B1VuOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=exLV5Wbp;
	arc=none smtp.remote-ip=91.218.175.249
Received: from mta0.migadu.com (out-249.mta0.migadu.com [91.218.175.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B6606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=exLV5Wbp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LWCe31d6tLOa8H3T4JFmDGQaqeDnOZg0P/wGm47hWCs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904112; v=1; x=1794508912;
 b=exLV5WbpW30nR7sv2X/mdA1wCDd+SFwkq02C5lPP9SDYbyGQeJorAwVVRVlycDtcpg+6t95F
 Lxr+MiFHi6L30I4ONArx8WuPLXJosmjqBA9Rwy8GaGpVRQZiMhwQ0FqS4pY5abgwFFLgLx/YYI4
 SYkeXPDBOwE0sf+BVJqnX870=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f43eb12c10da9a94;
	Thu, 05 Nov 2026 18:41:52 +0000
X-Mizu-Trace-ID: f43eb12c10da9a94
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 21/32] mm: free PMD swap entries in zap_huge_pmd()
Date: Thu,  5 Nov 2026 10:39:05 -0800
Message-ID: <20261105183940.2236717-22-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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
index 101ec72944cbf..f8df5cd723f01 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2594,6 +2594,16 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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
 	has_deposit = vma_has_deposited_pgtable(vma);
-- 
2.53.0-Meta

