Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753A83EE1E5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703939; cv=none; b=jOVxCdN+9NG1yjsGzeASyXNDhqqv4CuTnGe6S3J2DOoFh3iFtxOPaPyNd768fE8QDeRx6GfKPPGqHmNFgTIK+hnvLsbO4W9c4Um0vU9yMcYfIjLBLGysIZfTcU63YsOePHr2CW9rgbNWMdIPlffz4BLaqZqxATufVagzJRUGKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703939; c=relaxed/simple;
	bh=V8Rfzzs7GBde0fLUTqjYqNwT4mcz2/NcO59aZ+lqhXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OapI2g3H05xpAD2pZJCq95Fqtnu7GnaYXVFSG1sGjJomGcMINsDU2kPMwPencP0CN6+B1G6GNFxbnAq0HsF9CrOWEbEl0PBi+dngxPcAqY+STRI7o6G4YAIF81bqT6OyT9G02n4nqvrOWgbKOsXWIZiBwMpzTwpRYrkZhIj3+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eJiNIiVn; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eJiNIiVn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703934; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=kIKdO5bjBZZP6x4MDEA3rAxUaYok98mp4CY02zuEzqA=;
	b=eJiNIiVn4n6ersp4SK0Jw3gy2Ai2C3+JXlOjP9M5DpPGhae4hSrQLhfvweA4Ws/VXuP6peQHTs/i6exYtDQPrfbuihWzgY5MnyGSI0DSurjouOB4yqpB5h17yVzcyJfX5/CDMRecHK7vaNTmOzjojxsXtyCXzfnrW9tJqmtkaOQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9tap2_1789703933;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9tap2_1789703933 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:54 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] mm: khugepaged: add a helper to get the minimal collapse order
Date: Fri, 18 Sep 2026 11:58:39 +0800
Message-ID: <4b97f478b7569014ec52196a17532c4b664b97c1.1789701677.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem mTHP collapse will need to support order-1 collapse in the future,
so add a helper to retrieve the minimal collapse order as a preparation.
Also rename KHUGEPAGED_MIN_MTHP_ORDER to KHUGEPAGED_MIN_ANON_MTHP_ORDER
for better readability, and add a new COLLAPSE_MIN_FILE_MTHP_ORDER for
the shmem minimal collapse order.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/collapse.h   |  3 ++-
 mm/khugepaged.c | 10 +++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index e52969965262..d2fff6b5e1ec 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -8,7 +8,8 @@
 #include <linux/types.h>
 
 #define COLLAPSE_MAX_PTES_LIMIT		(HPAGE_PMD_NR - 1)
-#define COLLAPSE_MIN_MTHP_ORDER		2
+#define COLLAPSE_MIN_ANON_MTHP_ORDER		2
+#define COLLAPSE_MIN_FILE_MTHP_ORDER		1
 
 enum scan_result {
 	SCAN_FAIL,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 6c648ede24c4..64605a72ac2b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -302,6 +302,14 @@ static bool pte_none_or_zero(pte_t pte)
 	return pte_present(pte) && is_zero_pfn(pte_pfn(pte));
 }
 
+static unsigned int collapse_min_mthp_order(struct file *file)
+{
+	if (file)
+		return COLLAPSE_MIN_FILE_MTHP_ORDER;
+
+	return COLLAPSE_MIN_ANON_MTHP_ORDER;
+}
+
 /**
  * collapse_max_ptes_none - Calculate maximum allowed empty PTEs or PTEs mapping
  * the shared zeropage for the given collapse operation.
@@ -1485,7 +1493,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long addres
 		 * any smaller order enabled. When at the smallest order
 		 * we must always move to the next offset.
 		 */
-		if (order > COLLAPSE_MIN_MTHP_ORDER &&
+		if (order > collapse_min_mthp_order(NULL) &&
 		    (cc->scan_orders & GENMASK(order - 1, 0))) {
 			order--;
 			continue;
-- 
2.47.3

