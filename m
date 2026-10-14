Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0D37E5CB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966158; cv=none; b=iQ+GWgIhnzj30PbOSjzJ5s2eyNjvmG9K0qUlb8QLbuS1zJuYJcycIn9jEcVdTet10IwQRKXIe4RdB7L2wCA64rrTZX69dpCHgfvVowyYV5VmATiykooS50bS/7QJOR/ZJ2WHLM9QSP2fLAPpZb5r8wj/w4DPUs++sSw0cihLlIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966158; c=relaxed/simple;
	bh=HxdJhNqtBFk2gEtTq15ruPrA9lgDO/8jukXy2bVYzks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BbQ3nkI4Wndurr0Ol7dOy2Twrf6NPLqddfK2DNwrXdhpHvOjwemaptDAj6YAo6e7M+yq4DlZkUjZL2l1lCxser45UHYdjO+abo2o1tInTIaIViGp5r1XlQx36XSYHO76a6zWlzwnqDhhAJAqPzMLQuCrrWh9d7W0LH91lak886c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nL6McoPc; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nL6McoPc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791966151; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=9whjSmFeVrtGFJkwGOlXSWXEQUcqRKBWx6oJqixE8N0=;
	b=nL6McoPcVyUJNJUwMcOsCegPDLf5wSDTmoXmu37zJY53HnyMvsV1wjGGM4ps1+laKgrydAqP0Wjw3uIwECaCTdcqYugaAkW9IEXewnLBRpZ8w9pJS//LkFChC+t+vkbOFNfrTM79FwVQ3G4qzvTodb0hHJ5r4B2B+Uv36qZtExM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XCoX3b3_1791966139;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XCoX3b3_1791966139 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 16:22:31 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Weilin Tong <tongweilin@linux.alibaba.com>
Subject: [PATCH v2] ipc/shm: fix RSS accounting for hugetlb shared memory
Date: Wed, 14 Oct 2026 16:22:18 +0800
Message-ID: <20261014082218.2236088-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in
filemap.c") changed mapping->nrpages to count base pages for hugetlb
folios. However, shm_add_rss_swap() still multiplies it by
pages_per_huge_page(), overcounting RSS in both SHM_INFO and
/proc/sysvipc/shm.

Use mapping->nrpages for RSS accounting across all backing types, and
account swap only for non-hugetlb shmem. Use READ_ONCE() for both counters
instead of info->lock, which does not protect nrpages and cannot provide
a consistent snapshot.

Fixes: a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in filemap.c")
Suggested-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
---
Changes in v2 (suggested by Muchun Song):
- Share RSS accounting across all backing types, leaving only swap
  accounting conditional on CONFIG_SHMEM and non-hugetlb files.
- Replace info->lock with READ_ONCE() for both counters.

v1: https://lore.kernel.org/linux-mm/82f099d8-e46d-481e-bba5-95bff118ffbb@linux.alibaba.com/T/#mf511e253ce84ad64a9b7fcfe7bff51bc7ed23f12

 ipc/shm.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/ipc/shm.c b/ipc/shm.c
index bb1a721..6862f68 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -936,26 +936,11 @@ static inline unsigned long copy_shminfo_to_user(void __user *buf, struct shminf
 static void shm_add_rss_swap(struct shmid_kernel *shp,
 	unsigned long *rss_add, unsigned long *swp_add)
 {
-	struct inode *inode;
+	struct inode *inode = file_inode(shp->shm_file);
 
-	inode = file_inode(shp->shm_file);
-
-	if (is_file_hugepages(shp->shm_file)) {
-		struct address_space *mapping = inode->i_mapping;
-		struct hstate *h = hstate_file(shp->shm_file);
-		*rss_add += pages_per_huge_page(h) * mapping->nrpages;
-	} else {
-#ifdef CONFIG_SHMEM
-		struct shmem_inode_info *info = SHMEM_I(inode);
-
-		spin_lock_irq(&info->lock);
-		*rss_add += inode->i_mapping->nrpages;
-		*swp_add += info->swapped;
-		spin_unlock_irq(&info->lock);
-#else
-		*rss_add += inode->i_mapping->nrpages;
-#endif
-	}
+	*rss_add += READ_ONCE(inode->i_mapping->nrpages);
+	if (IS_ENABLED(CONFIG_SHMEM) && !is_file_hugepages(shp->shm_file))
+		*swp_add += READ_ONCE(SHMEM_I(inode)->swapped);
 }
 
 /*
-- 
2.39.3 (Apple Git-146)

