Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B6D3E4C94
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703938; cv=none; b=NI4NGcCMal0sekMnSLtTfisG5iefq3duQdFrNRtAuNdFuAGtJA0Qafr1WW+qEl+iwIivbHXy1w1ndWwG6MGZSL5s+0BxXrrDblHyd2KLlkXc+9bJIS0eSUcJQjauk0INxXo063QxBz1vGp2HpLN+F9JJ1GZurMlylGDZYo/s0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703938; c=relaxed/simple;
	bh=+uGabi91fPc2iZkUaNG0TbXcnhEcpURISeL0ADO/qxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3QjgMaNai0QL6GpYpFosx6JrspHw9zb/hct8xo401cBq44IBX3df8sAAqofTw8l1FxcH1Z9s1GnIiKVJljPAbdfNfBlZD4XWO/TFTApr0bfBElYYVi82J50fW3ybRpQAmrkX8QLucScXeXiErD8CcdQ4ta2Cn6JFFMgqe2Kg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=TG4D4lbq; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TG4D4lbq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703934; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=8mmUDsC9rv2Qg56cTGaMzYYkxCmY4QHyGj8J02CULg0=;
	b=TG4D4lbqOWZ4jnC7P5U/02gc4wY8srbpS1MLMDVaQ4o7bLLdOM+7gpa/wvdPF/NZywKIb8cevkWQ/d0le1gIRc2MrtAuptqaL2jCrEcjXAJIpv5fAX2kjCOI2ea8hsvkbuzvMAL3CFqiwmeS1dersQ9Wzp/QoHtexFkznAMBLUo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9o3bp_1789703932;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9o3bp_1789703932 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:53 +0800
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
Subject: [PATCH 07/12] mm: khugepaged: add an order check for PMD-sized THP statistics
Date: Fri, 18 Sep 2026 11:58:38 +0800
Message-ID: <880d5e981b8af49f956cea49074ef6dc553a575a.1789701677.git.baolin.wang@linux.alibaba.com>
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

In order to support shmem mTHP collapse in the following patches, add
an PMD-sized THP order check to avoid PMD-sized THP statistics errors.

No functional changes.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a987d233ec47..6c648ede24c4 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2518,8 +2518,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 
 	if (is_shmem) {
 		lruvec_stat_mod_folio(new_folio, NR_SHMEM, nr_pages);
-		lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
-	} else {
+		if (is_pmd_order(order))
+			lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
+	} else if (is_pmd_order(order)) {
 		lruvec_stat_mod_folio(new_folio, NR_FILE_THPS, HPAGE_PMD_NR);
 	}
 	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, nr_pages);
-- 
2.47.3

