Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE503DE43B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485886; cv=none; b=aKacXr8p/osbsYVrXniUT6NlDPOXcOJnFZ7WR8SVI08VqOwq3J4m/T1d6j4CPDxOUzQ4diI3rrgym9BOi4UQFsq9kD8OUoBWmVO+tgT+xIf38V4D5TXaqjHrKPb8WL/6La+cI7mU0rPt4GgCGwbNUyH90XzTckwkCe0MBC+NHkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485886; c=relaxed/simple;
	bh=etGtnSWZgJt0HPDqk/NB+D243/kHXNwRXgeVfRlwx3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KETSXFcLaFAqD9Zkz97z6DO3S7JIv3qNiSBd5WA/x7++EmzRCPYab4KjAkaUnzfzrjHucF8KsOSBUk4wBwErf9GJSoYCEDklzVYYctn0O27p80hAlbasNLCV064zXVlJCsFV3F2hjYE/ymvbfZE9WveYF2Vsy2BTFttVwQGsB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WpFtdi1k; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WpFtdi1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I+
	EDjYdUiVp47imiKeO3dfc9fxyKX7XcOzgelislojA=; b=WpFtdi1kkpqGrSKW5z
	9kmemIcYj4hWSDkCRiqij3OogB3ekvGwvisBCNQ+WrT1Y8qtIVEwdS0zIVq0ZU51
	II9/hbduMCdb+W96ei/JRzFOSakFa5NJ0TgPAaPP+a5R+FMB4ednD87cpOxWs5Sx
	SoA++PXVuEWvJrJ4QGfW+XD+E=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHvVwYY6lqm28iAw--.18968S5;
	Tue, 15 Sep 2026 23:24:10 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] mm/ksm: update merge helper comments for folios
Date: Tue, 15 Sep 2026 23:23:50 +0800
Message-ID: <20260915152351.7955-4-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915152351.7955-1-xialonglong2025@163.com>
References: <20260915151236.5200-1-xialonglong2025@163.com>
 <20260915152351.7955-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHvVwYY6lqm28iAw--.18968S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1ftw4UAryrur13KF4kWFg_yoWrJr47p3
	ZF93sIyrZ5JryxWw1xtrW09343Z397tr4UArWDC34fC3Z8tryvgF12v34YvFy5JFW8Ca1Y
	vr4jqF109a1vy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHCJPUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+Brj3GqpYxp+IAAA35

From: Longlong Xia <xialonglong@kylinos.cn>

Update stale page names and the put_page() reference in the folio
helpers' comments. Correct stable_tree_search()'s return-value
description to match its folio and error-pointer results.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

---
 mm/ksm.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 937d1ffea4cc..8deb1abd64c2 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1707,8 +1707,8 @@ static int try_to_merge_with_ksm_folio(struct ksm_rmap_item *rmap_item,
  * try_to_merge_two_pages - take two identical pages and prepare them
  * to be merged into one page.
  *
- * This function returns the kpage if we successfully merged two identical
- * pages into one ksm page, NULL otherwise.
+ * This function returns the KSM folio if we successfully merged two
+ * identical pages into one, NULL otherwise.
  *
  * Note that this function upgrades page to ksm page: if one of the pages
  * is already a ksm page, try_to_merge_with_ksm_folio should be used.
@@ -1797,7 +1797,7 @@ static struct folio *stable_node_dup(struct ksm_stable_node **_stable_node_dup,
 			found = dup;
 			found_rmap_hlist_len = found->rmap_hlist_len;
 			tree_folio = folio;
-			/* skip put_page for found candidate */
+			/* Skip folio_put() for the selected candidate. */
 			if (!prune_stale_stable_nodes &&
 			    is_page_sharing_candidate(found))
 				break;
@@ -1870,13 +1870,13 @@ static struct folio *stable_node_dup(struct ksm_stable_node **_stable_node_dup,
 
 /*
  * Like for ksm_get_folio, this function can free the *_stable_node and
- * *_stable_node_dup if the returned tree_page is NULL.
+ * *_stable_node_dup if the returned folio is NULL.
  *
  * It can also free and overwrite *_stable_node with the found
  * stable_node_dup if the chain is collapsed (in which case
  * *_stable_node will be equal to *_stable_node_dup like if the chain
- * never existed). It's up to the caller to verify tree_page is not
- * NULL before dereferencing *_stable_node or *_stable_node_dup.
+ * never existed). It's up to the caller to verify the returned folio is
+ * not NULL before dereferencing *_stable_node or *_stable_node_dup.
  *
  * *_stable_node_dup is really a second output parameter of this
  * function and will be overwritten in all cases, the caller doesn't
@@ -1917,8 +1917,8 @@ static __always_inline struct folio *chain(struct ksm_stable_node **s_n_d,
  * This function checks if there is a page inside the stable tree
  * with identical content to the page that we are scanning right now.
  *
- * This function returns the stable tree node of identical content if found,
- * -EBUSY if the stable node's page is being migrated, NULL otherwise.
+ * This function returns a referenced folio with identical content if found,
+ * ERR_PTR(-EBUSY) if the matching folio could not be locked, NULL otherwise.
  */
 static struct folio *stable_tree_search(struct page *page)
 {
@@ -2005,11 +2005,11 @@ static struct folio *stable_tree_search(struct page *page)
 			}
 
 			/*
-			 * Lock and unlock the stable_node's page (which
-			 * might already have been migrated) so that page
-			 * migration is sure to notice its raised count.
+			 * Lock and unlock the stable_node's folio (which
+			 * might already have been migrated) so that
+			 * folio migration is sure to notice its raised count.
 			 * It would be more elegant to return stable_node
-			 * than kpage, but that involves more changes.
+			 * than tree_folio, but that involves more changes.
 			 */
 			tree_folio = ksm_get_folio(stable_node_dup,
 						   KSM_GET_FOLIO_TRYLOCK);
-- 
2.43.0

