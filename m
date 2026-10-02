Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCF489FAA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935041; cv=none; b=NmOP722rA8ejR6sHS1NEof29IvjVASSzJAiB64yXs+KG7NEyPssH2ka4kAEmjMYTLIM8sv0c/YLbkziZtFEx4vb8UDQTrCbzqXJD2CNCoub7d0Q1hHUiLD2kLZlqJqmZRfJ/C9hCZOLD7kV2Wm5bRUx7IkM9Ll5AJRHvkmdatYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935041; c=relaxed/simple;
	bh=PmpEBPMCGBePeR65tGhRvp39CU+cDN/bw2BxnAbshOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDQAMHWmO0VkMeIAC8Q6fTxuws0EfUYY+okOXxXvsc9WWFTQGwfQwKeD66HmzISFwSUNel8Sl1QJjBDNIyDaR50Z4X0Nl0C6NJwEBa8RaleyYCqTaP93N/vdc0mFwhvCn7J+V8+al7oX3RxZnrqxQD5Mfz8CYOu+VIHbcO8pfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WrgzEM+W; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WrgzEM+W"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PmpEBPMCGBePeR65tGhRvp39CU+cDN/bw2BxnAbshOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935037; v=1; x=1791539837;
 b=WrgzEM+WqqX2w4ih9Nppu1PuXJh6gY3cTNdLTTt0viSvXSQRPpAig7v1uKhVJqNOHSX/Od0j
 KhKBXStEwPvEqoDfe8NPKUSgnrp2VRopSRcF0iq9HarykFtqh4qqEhhhg7nOKuTwJwusBApcWcV
 9ZJGJPOoCWVvWiUrqV6hCHn8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 46590f4179113d43;
	Fri, 02 Oct 2026 09:57:17 +0000
X-Mizu-Trace-ID: 46590f4179113d43
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
Subject: [PATCH v8 22/30] mm/madvise: keep PMD swap entries whole for MADV_GUARD_INSTALL/REMOVE
Date: Fri,  2 Oct 2026 02:52:36 -0700
Message-ID: <20261002095503.3585565-23-usama.arif@linux.dev>
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

Both callbacks test bare pmd_trans_huge(), which is false for a PMD swap
entry, so they return without consuming the PMD and walk_pmd_range() splits
it - only for the PTE callbacks to find the range populated and abort, or
to find no guard markers and do nothing.

Both already short-circuit at PMD level for a present THP. Do the same for
a swapped-out one: it is just as populated, and just as free of guard
markers.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/madvise.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index d3b5ed7e3cffb..64019668d69fb 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1269,8 +1269,12 @@ static int guard_install_pmd_entry(pmd_t *pmd, unsigned long addr,
 {
 	pmd_t pmdval = pmdp_get(pmd);
 
-	/* If huge return >0 so we abort the operation + zap. */
-	return pmd_trans_huge(pmdval);
+	/*
+	 * If huge return >0 so we abort the operation + zap. A PMD swap entry
+	 * is a swapped-out THP: also populated, and splitting it here would
+	 * only demote it before the zap.
+	 */
+	return pmd_trans_huge(pmdval) || pmd_is_swap_entry(pmdval);
 }
 
 static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
@@ -1409,8 +1413,12 @@ static int guard_remove_pmd_entry(pmd_t *pmd, unsigned long addr,
 {
 	pmd_t pmdval = pmdp_get(pmd);
 
-	/* If huge, cannot have guard pages present, so no-op - skip. */
-	if (pmd_trans_huge(pmdval))
+	/*
+	 * If huge, cannot have guard pages present, so no-op - skip. The same
+	 * is true of a PMD swap entry, which must not be split just to discover
+	 * there is nothing to remove.
+	 */
+	if (pmd_trans_huge(pmdval) || pmd_is_swap_entry(pmdval))
 		walk->action = ACTION_CONTINUE;
 
 	return 0;
-- 
2.53.0-Meta

