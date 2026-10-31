Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471002;
	b=KMnehEUtKecFrmb197U8xywfW0dTtYuLEH39afZpxNzaUBaunKZib+Dj4CENQupOM3Eg
	 Q3bI7/FbnSy66/PWIKxRaGnValn9ASJmj+P4/z8Sl20Co5hWqVFYAjJ2isuZnerq9XXWu
	 Mz0yjZkuquHjQ8h84wtxwE6/pNDC0eZffCMfd4wjoKb1/aAe28V8UNBWRmCdAMgHY2bAm
	 U6CEvtg8F8UbrqyIsj92MZjd92b2ZtGb6/z2roaBQYXIdAT1w4xLFAd2HZzoQ5zP5elQB
	 AOZxJdbIzzDxBlvcdjDp4KjRzI9Dbe2HMhus4DPfrrW1hWguE8tpEQ8ySBeAVUIsXJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471002;
	h=DMARC-Filter:DKIM-Signature:From:Mime-Version:X-Lms-Return-Path:
	 Content-Type:Date:X-Mailer:X-Original-From:Content-Transfer-Encoding:
	 Cc:Message-Id:To:Subject;
	bh=vXDRVZFCX5eXPv5+rEujKnF1AW3QkNUi2OD2EgtvPTE=;
	b=ZiSYYriNloyCVfBVDBCJN4emu4Pa4l7++xArz9CE6CcAA1AHEKW892THy8KNwHQrL2nN
	 qRR7sH9pgi04pPblF9Ah5EuOag9UEJfQww4AjHLnChuBkHhDTtdX0w1HQhX2U5DWNzark
	 vcl8XSJqF4wRHlrykQIwQhZqTOdSYNbZ79vjEZlN0o97DsfMXxrJF4i9x4SzD1/mon+cy
	 6du/5uXjJUmnLQZhtCRfCUP8bHCB/o8vjCdHQ50CzHaJo7lKFbU5+tt5nukmN8llLJ4yy
	 ggMF7Ripy6QuhsCV+pWTIjM3sxP6fpe/ag56lngEmbmSTyr/W96gWwa1JINMbnbp21g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XrsGCPuM;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09ED5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XrsGCPuM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793470996; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=vXDRVZFCX5eXPv5+rEujKnF1AW3QkNUi2OD2EgtvPTE=;
 b=XrsGCPuM38VRdyljtUfiHBIpNl0ymbf1a8Q2dBGVEEaEWpP9LN1kYcgnJMUAS4EzVEDQy1
 8AIECxw/zZwtl5GAkeZEDkkQFKgdzepJpIMMesZ3fuw4kf2kK+v7K9jQVDavHp4PT+34GI
 okUDMSsDKqJwlcC+A93kB9/J3vrg6D01FlzJw1mj/OlA6/9m130RnaE3S5Z/r+F71X3XY2
 nqe8TmGusSbF5PBI7rQtH+jDhmjVYZ7MtoorjmE0xbCmsLvJ7ELQOHuEivPUQdUn8Tu262
 r7+wrtswUWj8nlbwZL9K320ZDti+TftYw/lK0SUOZrWQPi+stENfnEt39e3JYg==
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae63212+378e21+vger.kernel.org+zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Date: Sun,  1 Nov 2026 02:22:56 +0800
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <xu.xin@linux.dev>, <chengming.zhou@linux.dev>, <aarcange@redhat.com>, 
	<riel@redhat.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <20261031182256.40205-1-zhaogongyi@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>
Subject: [PATCH] mm/ksm: avoid anon_vma UAF during page merging

KASAN reports a use-after-free in page_address_in_vma() while ksmd
merges pages. ksmd keeps a folio reference across an mmap_lock drop,
during which mremap() can remove its last mapping and free its
anon_vma. page_address_in_vma() then dereferences the stale pointer
from folio->mapping.

KSM needs only a candidate address. write_protect_page() checks that
the PTE maps the folio, and replace_page() verifies the saved PTE
before replacing it. Compute the candidate from the folio index and
VMA instead of dereferencing the folio-side anon_vma. Reject KSM
folios because their page index is not meaningful.

Fixes: 21d0d443cdc1 ("rmap: resurrect page_address_in_vma anon_vma check")
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Testing:
  Unpatched mm-new: fixed-pool KSM/mremap reproduced the KASAN UAF.
  Patched mm-new: the same workload ran for 12 minutes without KASAN,
  BUG or WARNING; fork/COW KSM smoke passed.

 mm/ksm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index d6f736a..f8af5ee 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1307,7 +1307,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 	if (WARN_ON_ONCE(folio_test_large(folio)))
 		return err;
 
-	pvmw.address = page_address_in_vma(folio, folio_page(folio, 0), vma);
+	pvmw.address = vma_anon_address(vma, folio_pgoff(folio), 1);
 	if (pvmw.address == -EFAULT)
 		goto out;
 
@@ -1408,7 +1408,7 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
 	int err = -EFAULT;
 	struct mmu_notifier_range range;
 
-	addr = page_address_in_vma(folio, page, vma);
+	addr = vma_anon_address(vma, page_pgoff(folio, page), 1);
 	if (addr == -EFAULT)
 		goto out;
 
@@ -1515,7 +1515,7 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
 	if (page == kpage)			/* ksm page forked */
 		return 0;
 
-	if (!folio_test_anon(folio))
+	if (!folio_test_anon(folio) || folio_test_ksm(folio))
 		goto out;
 
 	/*
base-commit: 243e8cdab64129d6207c398f8cf5fbb1962ff7e1
-- 
2.39.5 (Apple Git-154)
