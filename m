Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D5A95E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647061; cv=none; b=RY+x9KMtADyBEOXaI3n7QBb5TVjvQSgetk8JOjl2QFiA60sfUo/J4iwFLiASezizUX15uQtbhZqwg8GC0HBw2LKa0nUOkeb/OdMzzf4rxQd9pK7YUxFGkJIZKXv62kSsr1bWbMrgeoJgvSKv2gEsuNLWcgKgFTf94al836D3AmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647061; c=relaxed/simple;
	bh=47vcZ904lW3a6rNy/Fy96vjfGFEJ8yr3KRqKx1ywsiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yv1T77MurGEM8/iF7m3ABG9oBkDgziy2gXcz7Lxvpi42YraVk1mqSXF0WMck3pNAkY8izw5P+lk7si+sumbLvmMWnrEmb0LrTT2tPCexn7UGBHLM03YW/J/Rw6mntMbnF6v7NqPSXvqnkxz/EXKd6SSq30caRy84rFES20nMdLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u1YnfjAG; arc=none smtp.client-ip=91.218.175.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u1YnfjAG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=47vcZ904lW3a6rNy/Fy96vjfGFEJ8yr3KRqKx1ywsiU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789647035; v=1; x=1790251835;
 b=u1YnfjAGiN5FUhnln2+X/676E2irZhLeKYEPvFPpUaHzWhYAYIheDL21c0PBRGXXBpoc/oD4
 SMnPtdlGZ1+xn2iCciyZbvjqQQZfOCHJLS2iHBIzlUxKuQ32z/Jy3f+L+vSNgX1pARRhBiRRhOm
 ptcY+6DhH8x9L9kQI2AR+m5I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44dfbe1cd77953d7;
	Thu, 17 Sep 2026 12:10:18 +0000
X-Mizu-Trace-ID: 44dfbe1cd77953d7
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] mm/huge_memory: disallow raw PMD mappings of the huge zero page
Date: Thu, 17 Sep 2026 20:10:10 +0800
Message-ID: <20260917121010.60966-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm_mixed_zeropage_allowed() validates zeropage insertion into
VM_MIXEDMAP VMAs. No in-tree user needs to insert the huge zero page
through vmf_insert_pfn_pmd().

Return VM_FAULT_SIGBUS if vmf_insert_pfn_pmd() is asked to map it.

Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 mm/huge_memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bfd972b997f9..c02f21ce4f4c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1728,6 +1728,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
 
+	if (unlikely(is_huge_zero_pfn(pfn)))
+		return VM_FAULT_SIGBUS;
+
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
 	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
-- 
2.39.3 (Apple Git-146)
