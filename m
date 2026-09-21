Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F230E0FB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969358; cv=none; b=R/83NcI2IWJ6U9Pil93Qk+H7pJBto++aRGaHSpKonU52+Yh8nLy1RkHGg/q7aoVb+T4dRNKlYwZTxEm578mg3qViIAfzjq26su4Y1VvXKWUyShf7hSWgfGdIWVwVyZCEzoZxjr99m2Bpop5PF/KfSWo35UyjAUbwYz6uX/e4oZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969358; c=relaxed/simple;
	bh=dJPrO7Nw3VzzKVit/1YL9fAEnbejIvHCUFAGxCCzIG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S1jroaJF38hY3RgRPalGyirDbLxCbnz/vAWClXkS9zZZZCnZUTAxwvLQHQiam09/AQyBmWAezAGx23zbv9pGaiEq2AxgJT9jDBjCON8m9I7Lk7jDkfkLOnVy94xnF7bNr0E8uy30/qWF3l6P6wRC3FVPU8nm3kz0FCrfSdFtxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y96xcgCg; arc=none smtp.client-ip=95.215.58.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y96xcgCg"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dJPrO7Nw3VzzKVit/1YL9fAEnbejIvHCUFAGxCCzIG0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789969353; v=1; x=1790574153;
 b=Y96xcgCgu5hSDbEI9y+gBbk2QT84/vG9Ke6lID/JKh96yrKI0UAbbN1hc7/8ULmsdTB2RGPq
 dsgrFvQ3Ha06fxQCrkR2IKBpQ1mmHUg43Idd0DUtz3gj6LkMeqdFegfK5a0Kyzu8fNtmOkbzbI9
 LhkiWPdqzHDkK7uXrF4eAj8A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7dc0d847ad9390a3;
	Mon, 21 Sep 2026 05:42:33 +0000
X-Mizu-Trace-ID: 7dc0d847ad9390a3
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
	ljs@kernel.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] mm: disallow raw PFN mappings of huge/shared zeropage
Date: Mon, 21 Sep 2026 13:42:25 +0800
Message-ID: <20260921054225.28537-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

Handling the huge/shared zeropage correctly in vmf_insert_pfn_pmd() and
vmf_insert_pfn_prot() is more involved. We would need to check whether the
VMA allows it and keep the mapping read-only, similar to the checks in
vm_mixed_ok().

No in-tree user needs that support, so reject these mappings with
VM_FAULT_SIGBUS rather than complicate the code for now.

Link: https://lore.kernel.org/all/20260917121010.60966-1-lance.yang@linux.dev/
Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
v1 -> v2:
 - Reject the shared zeropage in vmf_insert_pfn_prot() (per Kiryl) - thanks!
 - Explain the VMA validation and read-only requirements (per David) - thanks!
 - Pick up Kiryl's Reviewed-by tag.
 - https://lore.kernel.org/all/20260917121010.60966-1-lance.yang@linux.dev/

 mm/huge_memory.c | 3 +++
 mm/memory.c      | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8aa2daba3739..1d4fe4452c98 100644
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
diff --git a/mm/memory.c b/mm/memory.c
index 926276d41920..7d821b110df0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2860,6 +2860,9 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
 	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));
 
+	if (unlikely(is_zero_pfn(pfn)))
+		return VM_FAULT_SIGBUS;
+
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;
 
-- 
2.49.0
