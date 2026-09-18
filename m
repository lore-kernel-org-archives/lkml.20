Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49340DB49
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703943; cv=none; b=H6wRD3MGoECqp+Yb9didqI+PO1+HlqdtYVIKR7qrhoshdjbWAV98zuSGFbD+QpBWisvCcmrq61vwApEUM2lW+rxCt6WPufHqw+nXLsjKXpUda7WrRIxFzdGn1WUm2CdDv4aiaMRAlPIaXJqQhHI53P/+jm62hKLnfKCMH3MKqAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703943; c=relaxed/simple;
	bh=t22kCtCu90mhJLe2YH+9tr29Ko8Pvxxghx1jWwrrPGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCagTI5ZSyDjNT7hE4udjKoB252BpWkeNoDyhrUGjf4BV+LXoc9Nnyw6d/ZHjRiQlClnmVuk6dOd2uWydV4dGHSKqPB7M/iyoa8HUo596tnkabCvVfD5XpfhNgWigIZ7a7rR8WJsKbW1eKyXdVjFK4nIw4+xQCCQjeAb78IQnfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=C6/aKmkx; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="C6/aKmkx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703933; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=aTpaE1iWIra8O6SpviNVFAUm/4Np7UYKQjsgFYl6AbE=;
	b=C6/aKmkxcgHvjRd70abnrVGgBVn+jFRf5LILzPYAdhPiKlltfx6KzxoIpB9WR1UZmaHlU9GQReY5mZ97Pl8lyadwe2xN872PLTtqTRRinrjrge1C+COaTFrNLBKtGt/NFX8zXtvPGH2ci2Y6RdX3iXEkin8TU4UstcGRvrIlSfY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9taoO_1789703931;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9taoO_1789703931 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:51 +0800
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
Subject: [PATCH 05/12] mm: khugepaged: add max_ptes_none check in collapse_file()
Date: Fri, 18 Sep 2026 11:58:36 +0800
Message-ID: <56bd2febf013c88e2fedbd653e7cc5dc12c6bc85.1789701677.git.baolin.wang@linux.alibaba.com>
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

Similar to the anonymous folios collapse, we should also check the
'max_ptes_none' when trying to collapse shmem/file folios, which is
also intended as preparation for shmem mTHP collapse in the
following patches.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 249ee91a66f2..f741dec3acc2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2158,6 +2158,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		struct file *file, pgoff_t start, struct collapse_control *cc)
 {
+	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
 	struct address_space *mapping = file->f_mapping;
 	struct page *dst;
 	struct folio *folio, *tmp, *new_folio;
@@ -2222,7 +2223,13 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 						goto xa_locked;
 					}
 				}
-				nr_none++;
+
+				if (++nr_none > max_ptes_none) {
+					result = SCAN_EXCEED_NONE_PTE;
+					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
+					goto xa_locked;
+				}
+
 				index++;
 				continue;
 			}
-- 
2.47.3

