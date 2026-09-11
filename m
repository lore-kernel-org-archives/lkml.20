Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB323D6673
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099490; cv=none; b=X946v2YR5FahQ884eNqRfBzCETDtCih1VDiLenA4nSzG1HiddSeknfPApWG1KSqF+wkDn0cqphC5OAJS6MDW36GR5xkD1Ek/LNrWTH9lt0O0cvfyO0UWP3vkYKAGI/hpwh45abH5rUvnVnhiXh8DYhZl2ZKPu2BsQmlrqgLu4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099490; c=relaxed/simple;
	bh=DtMYe9mZ+/SlmprZCY/J2tmg4c0JTQ1OxKUEGVgtSJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kixMZHTZPiI7AvPXn7/c1VwGaNV82Mr0JgxY5UFTJQhoZpqfucgg17cUEAbttic24jZ5bNKJ4fzeRjjF4hGkJa5Pv+KdpcqNjbciQgyv0l0OVeZQmgKWh64GNPbcZd0AGlHKrj3aDV3GdTPP5G7c4srLUEjKerG5nnLe3nqIRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rqPv8Y6P; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rqPv8Y6P"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789099484; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=WxGjPVKwOym3MlqJVMtkM10psiQ4ZkXMSmP8hxUXTp4=;
	b=rqPv8Y6PwevoDufsdcDqgD2Jsi2rNtjjfXR00iAJJRgJ6IAiKACxVvdtNiw4j+wWo41YRtmepq9pBvzw50fbr6Ho9FKNf7ky2Ij9TAcpnzFM1I3nd4JIzlq8RDAo5Rz2LLL/P037WfdRSEeNP/EzwQnZTwHJFl0daU/7dLLDYTs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R571e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XAj7wOz_1789099483;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAj7wOz_1789099483 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Sep 2026 12:04:43 +0800
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
Subject: [PATCH] mm: shmem: ignore sysfs configs for shmem forced collapse
Date: Fri, 11 Sep 2026 12:04:33 +0800
Message-ID: <b1829ac0d3f38217f031854ff0f40abef614ac0d.1789098446.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
ignore any THP or mTHP interface settings.

However, after commit 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled()
into shmem_allowable_huge_orders()"), performing MADV_COLLAPSE on shmem
will depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
(although that is the default), which can cause MADV_COLLAPSE to fail
unexpectedly.

Fix this by returning the result of shmem_huge_global_enabled() directly
when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
shmem THP/mTHP settings.

Fixes: 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled() into shmem_allowable_huge_orders()")
Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Hi Kiryl,

I did not update the selftests, as I hope this fix will be merged first.
After this fix has landed, I can send a patch to update the selftests.
---
 mm/shmem.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index c92ed17dbc4a..b572c60f2af8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2049,8 +2049,11 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 
 	global_orders = shmem_huge_global_enabled(inode, index, write_end,
 						  shmem_huge_force, vma, vm_flags);
-	/* Tmpfs huge pages allocation */
-	if (!vma || !vma_is_anon_shmem(vma))
+	/*
+	 * Tmpfs huge pages allocation or forced collapse ignores
+	 * sysfs configs.
+	 */
+	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
 		return global_orders;
 
 	/*
-- 
2.47.3

