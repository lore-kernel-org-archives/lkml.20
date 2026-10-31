Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436949;
	b=4/bQY/plAZPpirNIDIhgoY2W5k27pdFDieajQ/3omc4s2/GOuIVEI6+8AL4qiKaMwWYc
	 6Q9L8/ecbZm2V2txvdFHuheiC5JTbOQJXB+AewKVrYS9aXY/wKrN0Sv7X3H1QCd5wenJv
	 c1mewL50PhEkPnian4NCjwaO7UM9yTGQbxxzHUfPeulU2P1XFwOuR1sgkgiPTtOT6WQRQ
	 osX+dxBMcDrkeWJooM5WHEsNVAlAuWvHdA2ByhE+PTcmKwzb1lA4RzX5fMOCMwRYkCW+N
	 lzq+tWnTT3Jd58VBLlcztIGHtUvZi7+DgAq7uYY241Zmu8E5wWXy0z5qu5ySoy9ZdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436949;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fS7XURTcWggfWp6dQC3jfd2C5c5AXRPdyf6P61qt0XU=;
	b=3cXefCLhR2eOrvikMb1B9uwXLHM3UtjSM1Bx0lMHTxKX5nnLiHIvbPwq49hXVfHuKc1v
	 VOlK5QXWZAkHc0KksDWYnq4ixa6hHX5gD0RqaN/wAKgGC9G8l7J1o5wdU3LJq9p5oX7b0
	 cNYncvcR6mcEEjL2gge53DahO58+8+k84X1ZtiEga364G7svPlBRUEcoiqLfdN4NwCD8l
	 XUtHnpO2SdkUj6xfRbXlCWaBCZxg+EtrmdeZ7GXCqevKqIcv0KmURx3pQggTGoRpGq8TE
	 Gmp+G9F9iXIZpucI/68zv96LdHXJzE8QcNflE25OwLdY96Dvzcx/+sem9Fp8vmf366A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HKmXs3AZ;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HKmXs3AZ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793436944; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fS7XURTcWggfWp6dQC3jfd2C5c5AXRPdyf6P61qt0XU=;
	b=HKmXs3AZZJ8RKJ4qG1geCjSUB2hZ9FPo51eXFCpJBmASPck9X2Cekv1EtMTeOcoHIbjL06SdyHwCf+RRe6oZRhara3+RIOIHnZR7w9XBF1heqnErNS1Kl4LCZGemdeFOpugtfCtPrQqsSJ+kabsVDLpnpXNMU2bRutRDJK207Fg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDo6dzb_1793436942;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo6dzb_1793436942 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:55:43 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	joerg.roedel@amd.com,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	dan@reactivated.net,
	vasant.hegde@amd.com,
	kevin.tian@intel.com,
	Ankit.Soni@amd.com
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guoren@kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2] iommupt/kunit: Skip the page-table leak check on SMP
Date: Sat, 31 Oct 2026 16:55:36 +0800
Message-Id: <20261031085536.18555-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

NR_SECONDARY_PAGETABLE is batched per-CPU on SMP, so the global counter
can change as pending updates are folded, even when a test has freed all
its page tables. Comparing the global counter before and after a test
can therefore report a false leak. A failed teardown assertion also
aborts cleanup, causing subsequent tests to fail because the test driver
is still registered.

Only perform the leak-check assertion on non-SMP configurations, where
there are no per-CPU vmstat deltas. Keep the tests and resource cleanup
enabled on SMP without accessing MM's internal vmstat data structures.

Fixes: bc5233c0904e ("iommupt: Add a kunit test for the IOMMU implementation")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
Changes in v2:
  - Replace the hand-written vmstat snapshot with a non-SMP-only
    assertion, as suggested by Jason.

Link to v1:
  https://lore.kernel.org/linux-iommu/20261015132024.43998-1-fangyu.yu@linux.alibaba.com/
---
 drivers/iommu/generic_pt/kunit_iommu_pt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/generic_pt/kunit_iommu_pt.h b/drivers/iommu/generic_pt/kunit_iommu_pt.h
index 9fc71db74234..d90e57b2cd7b 100644
--- a/drivers/iommu/generic_pt/kunit_iommu_pt.h
+++ b/drivers/iommu/generic_pt/kunit_iommu_pt.h
@@ -470,8 +470,10 @@ static void pt_kunit_iommu_exit(struct kunit *test)
 	 * Look for memory leaks, assumes kunit is running isolated and nothing
 	 * else is using secondary page tables.
 	 */
-	KUNIT_ASSERT_EQ(test, priv->orig_nr_secondary_pagetable,
-			global_node_page_state(NR_SECONDARY_PAGETABLE));
+	/* Per-CPU vmstat batching can cause false leak reports on SMP. */
+	if (!IS_ENABLED(CONFIG_SMP))
+		KUNIT_ASSERT_EQ(test, priv->orig_nr_secondary_pagetable,
+				global_node_page_state(NR_SECONDARY_PAGETABLE));
 	kunit_kfree(test, test->priv);
 }
 
-- 
2.50.1

