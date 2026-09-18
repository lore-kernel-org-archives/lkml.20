Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BBD3E5A37
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703939; cv=none; b=iLNI466CCWURv6iVuVwOrMBfgupZ+5e9E05gNWwnNit903QD7k6SWZYb4MJiTyDy7sto72hGsQmnCK1eqamPuuQWjVmzcDp+lduFJ1qY67eA7/x0QVYT3NFFhd92FgSLWXS2P9YImvRsICGRaM78Oa3M14kaewitCAxWmtw1acg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703939; c=relaxed/simple;
	bh=r8oOrlUxtwTPmq2VuAnFugBWXqKKUTdEyZPKnZeizgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEjO26RxFhvCeh/QDAUQsqmsgdSNKSkZLxk7bts9UZhfDcJ5UB2uL0UCRXHnynqGoJ9ohzp9X0A8nk1HmhFtImcosZCBYuiGzfMNOSjkj6U7BYm3lfAuvFq9uIxHvUQGt//z+9SfZzJ+1vKDOiuOP9dzTurFiqfAsavkA0klTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=X4xZ5TU8; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="X4xZ5TU8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703929; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NP5OzPya8rOoaZGJQaokuW0ZH+2iZDJtaFBx3BRmKL4=;
	b=X4xZ5TU8GRODaTfo/CR/IikvwKRzMRXtIgdjvzZldWKLGcgYKF42uJrTaswfjWb9Dm6fmlWyxRCsArcAqDXWd2EfyLW7cN4RDp9gf6LIMKjpQ2rHvpYSX9tYDOH2NaCFkBqtkDu1gPAsM+0mgWUDlCEAqpDRe7hj/kQbUWnlmUA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9uK4L_1789703928;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9uK4L_1789703928 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:48 +0800
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
Subject: [PATCH 01/12] mm: khugepaged: remove outdated comments and check for shmem
Date: Fri, 18 Sep 2026 11:58:32 +0800
Message-ID: <12bac4614aa4b37490e92051d484f4f2cb215076.1789701677.git.baolin.wang@linux.alibaba.com>
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

After commit eb92d97f7e6a ("Revert 'tmpfs: don't enable large folios if
not supported'"), all shmem mounts can support large folios unconditionally,
so drop the outdated comments and the check for shmem in collapse_file().

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a3a9e4d93b46..21d75f5b4b4d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2192,12 +2192,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	bool is_shmem = shmem_file(file);
 
 	/*
-	 * MADV_COLLAPSE ignores shmem huge config, so do not check shmem
-	 *
-	 * TODO: once shmem always calls mapping_set_large_folios() on its
-	 * mapping, the shmem check can be removed.
+	 * MADV_COLLAPSE ignores shmem huge config, so do not check shmem.
 	 */
-	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
+	VM_WARN_ON_ONCE(!mapping_pmd_folio_support(mapping));
 	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
 
 	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
-- 
2.47.3

