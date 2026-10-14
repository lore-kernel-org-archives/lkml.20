Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D69371CE3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959257; cv=none; b=MWs1iLM/yJq48rCPoYtdfDx1weRnJmUEdfs1ZC/TrJ8Vh678ODMi6LVQC3zUpXYqJMtVlEvwcXdxXS6ailqO3LbuRNjNcmTuUyjThUEHBOgqGcoplw9yfZ2CsfSLfUeu5R4s5KIPjuwg8JHkx3lxVeHVr/ZGpGINcDUnFhzi/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959257; c=relaxed/simple;
	bh=j+Fhb7oNWnc6Lnsy1MD9fOXnAvxSDJrGaj0Qa8eS5eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4MvCrV+/6yf35mDyDdaZ6C4mJsPMwdwg2lDzy0502RFLoBVJ0r+PNwtku9Iy0x9GXLYfEcK+19/NV8stS0qtwhaEbR5e5RgnK/YWudsqDH+X9kJiTcd9q1lWvTtCQACnc26TkMczrreMOaemc7vGyHXG0WclVNUoj+tnvDxA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U5WQBKp+; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U5WQBKp+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791959239; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=nA0Tq6TsyCuuH3RRXnooXAd6RrQa+o73yVVwUSKY6AA=;
	b=U5WQBKp+ptqKFtG9k5ENjEB2UuK64LKEeSKV8b/ycvsMpRO5kPJRoNfttoirzeDCJMPA6Zi7QWTY/jWHo3Z2MueTU7xP4+fwMgTNXl3uyKVH0/8tEWsS2d2oFkXXGCAPCtMnqkQZ4iRpl+L1ZVGLe/CBrcHC7pYL/CUpjb2T5xU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XCo6Yfx_1791959228;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XCo6Yfx_1791959228 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 14:27:18 +0800
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
Subject: [PATCH] ipc/shm: fix RSS accounting for hugetlb shared memory
Date: Wed, 14 Oct 2026 14:27:05 +0800
Message-ID: <20261014062705.1997201-1-tongweilin@linux.alibaba.com>
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

Use mapping->nrpages directly and remove the unused hstate variable.

Fixes: a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in filemap.c")
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>

---
 ipc/shm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ipc/shm.c b/ipc/shm.c
index 25190965c9a50..5ed2beef0f1d2 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -943,8 +943,7 @@ static void shm_add_rss_swap(struct shmid_kernel *shp,
 
 	if (is_file_hugepages(shp->shm_file)) {
 		struct address_space *mapping = inode->i_mapping;
-		struct hstate *h = hstate_file(shp->shm_file);
-		*rss_add += pages_per_huge_page(h) * mapping->nrpages;
+		*rss_add += mapping->nrpages;
 	} else {
 #ifdef CONFIG_SHMEM
 		struct shmem_inode_info *info = SHMEM_I(inode);
-- 
2.43.5

