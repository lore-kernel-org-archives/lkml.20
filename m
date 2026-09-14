Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640D2E7165
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351982; cv=none; b=hUK9htYeohI9Nn2sO81GV0ZW+K9dOuU9oMlvvu215FKSbNTXPCjToaN7pDQOJ22UoI/KY2LnfQQAeqz88hzbqjeTtFv4KKHy2XEh8yxPWEzki2jhR5u0XrBU+VjdZt6tkseykptvOJovqy/ir35uBvIzTVX+gF82FQTyILkyXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351982; c=relaxed/simple;
	bh=V2rsfeLZpm8xn3VH7t1leM24nu/j5im0/EZzhCY1pew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3oZbRc3JQRwACOKP0rWq0+DHz53v/qQNmbOgWEr7CdXt0eM9U/Lje+cqoGzaYbpHUcTu5viJktnl/KpfXZykUN1FXd7uTt8PhBI+uUrLxTw2xj0ijrxaRjaD8A7B3Frpw2JtfnxWLbYVtpYwxTy8oD76FquV9Hjk3PVzROvwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QjQww+gx; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QjQww+gx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789351969; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=AapbX71K+AOCTga7+D27TAlEiW7241CrDMio+nr39S0=;
	b=QjQww+gxD2MuKINETfD3syMfOWfqUuIi1SgYFWNdxC1TK1dzrEvDyNuI9YT81xtKorwuM1gnLu8qAoXByaR29c00p66z1wALrqgDxTkNNypa2/msXn0y0zjsonnzpJKXSW2o57Q5oVNU94jkTtydZ2DbtxB4xehBMYiwTHYh7GQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XAq.rRE_1789351968;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAq.rRE_1789351968 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 10:12:49 +0800
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
Subject: [PATCH v2] mm: shmem: ignore sysfs configs for shmem forced collapse
Date: Mon, 14 Sep 2026 10:12:41 +0800
Message-ID: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
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

However, after commit 26c7d8413aaf ("mm: thp: support "THPeligible" semantics
for mTHP with anonymous shmem"), performing MADV_COLLAPSE on shmem will
depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
(although that is the default), which can cause MADV_COLLAPSE to fail
unexpectedly.

Fix this by returning the result of shmem_huge_global_enabled() directly
when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
shmem THP/mTHP settings.

Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v1:
 - Use the correct fixes tag (per Kiryl).
 - Collect reviewed tags from Kiryl, Zi and Lance. Thanks.
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

