Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17613D332A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167218; cv=none; b=QvRWrX3pBVGgUT0LxECLMd3koG1PxOBKSpX19tf96dQKs009bh5FFfhZXwhaZFxpBVZFZrlF/jp+4Tu/jf8t6xdaav84GIm1F9eHoP4Z3VEfxMPeiYj/rmuLdAmpLoBYBh6jUbb+H84GfU47Luest3b4VNKJLzOniuJa1c2SUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167218; c=relaxed/simple;
	bh=Ay756BWLfvfN9kwsl9VEisA10j5cWcMCG782Tfg2UzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DAgyY5sB7r42dcmozjXCJ70R3wWBVAIieBzIUBI/m5WarSK71b19YwBTdCxV/NfCTgj9lkMMOn9+Hee7PBPGo4OdsQ9HTRGSl9GLD07fLsRhWQYRrFVaDIKuF5zozP0QTB3c2jJ3qMNv7+Qard4KcZ0zt2vYH+hVBeHWLBHjNFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LB2AA/Ev; arc=none smtp.client-ip=91.218.175.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LB2AA/Ev"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ay756BWLfvfN9kwsl9VEisA10j5cWcMCG782Tfg2UzM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788167214; v=1; x=1788772014;
 b=LB2AA/Ev9SQYA2GlWJb9apZEO35ewz7AFMMOmEQEclNyT56m7q1trzlFRH5RLto0/GqGk7Pf
 9dCade1Ej2bRN3a4EbKGbhFVXPNySoE9nHBbFSjsei9CR7fr2pZq1NI174zQvTQQb2rqeSn10xc
 eS77RCvV0+rmmg6mhCx3HmwU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 589db87ed55c533a;
	Mon, 31 Aug 2026 09:06:53 +0000
X-Mizu-Trace-ID: 589db87ed55c533a
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	vivek.kasireddy@intel.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] mm/memfd: don't unreserve hugetlb pages on -EEXIST in error path
Date: Mon, 31 Aug 2026 17:06:31 +0800
Message-ID: <20260831090631.29227-1-hongfu.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongfu Li <lihongfu@kylinos.cn>

If hugetlb_add_to_page_cache() fails with -EEXIST, a concurrent fault has
already instantiated the folio in the page cache, and the reservation now
belongs to that folio. Calling hugetlb_unreserve_pages() in that case
incorrectly removes the region backing the cached folio, and a later
truncate or inode eviction passes a negative (chg - freed) into
hugepage_subpool_put_pages(), corrupting subpool and resv_huge_pages
accounting.

Skip the unreserve on -EEXIST; failures other than -EEXIST leave the
reservation unconsumed and still unreserve it.

Fixes: 717cf9357325 ("mm/memfd: reserve hugetlb folios before allocation")
Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 mm/memfd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/memfd.c b/mm/memfd.c
index c708d92533f4..1b65bc22fb19 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -128,6 +128,12 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 
 			if (err) {
 				folio_put(folio);
+				/*
+				 * On -EEXIST, a concurrent fault has cached the folio,
+				 * which now owns the reservation; don't unreserve.
+				 */
+				if (err == -EEXIST)
+					return ERR_PTR(err);
 				goto err_unresv;
 			}
 
-- 
2.54.0

