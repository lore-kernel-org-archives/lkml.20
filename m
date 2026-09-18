Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA278409277
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703943; cv=none; b=AqGqUaeUjwsCL8XO7pv4XzNKhBBluyvyI+OhLfYEU77freUjOXchDJYSANvr+TEveW6URAqNkAqpNpkCiIfkl374tQ5TQmbgrbdw5dDScppc8QweWKXIfI5DcTMNktLFpnqN3eTmuRIkFThuRGZuzH9jDHOxGsQg1NEs5uXFRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703943; c=relaxed/simple;
	bh=HGM5KbtDXMkgnjxwXFsXCRlOvC088Gdr9mgccBzOuC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzMkhngal54oUG+GaOPDRCjcRts6Dn5TNr2DPnGUfgbZpHr6D2YkNdj5mYvjGujSEIoa3NEiWdbeqEdMqp+se7tROhuOssKHEqbjVNMVKIUJ3JMRYkxK6VHnUJ1YeSEW3ZaLuiX5bqTcRRUMzjR9Mri11RPPxVUSTsmeDfhZ6XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ydKkrnd+; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ydKkrnd+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703938; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=loQVaTQd/RKm32T1IKVgII9zZSimhBFrCIUTGWgc3Hc=;
	b=ydKkrnd+BCMCU5dNMiP2CsRm1gZMmejq7P7odVf3kKNqBNGJpW8/RP62/ZKPeytWBQYj/ZIve8qu/ctMuIZpF9utqYtaWY9m+aex95kY0lHmXzQQmdH62W3gmQ/u1tTPwluDPjP5bAnc0a7Xs0Qv6cT4qCTuSHMTpPLoWITc77M=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9tapk_1789703936;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9tapk_1789703936 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:56 +0800
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
Subject: [PATCH 11/12] mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
Date: Fri, 18 Sep 2026 11:58:42 +0800
Message-ID: <b32edd4990591d2f5af75d97bd30827d563029eb.1789701677.git.baolin.wang@linux.alibaba.com>
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

We are now ready to enable shmem mTHP collapse, allowing
thp_vma_allowable_orders() to check all permissible shmem large orders.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 5c477ea16c6f..4b5e1f8ddf87 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -493,9 +493,14 @@ unsigned long collapse_possible_orders(struct vm_area_struct *vma,
 {
 	unsigned long orders;
 
-	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
+	/*
+	 * If khugepaged is scanning an anonymous or shmem vma,
+	 * allow mTHP collapse.
+	 */
 	if ((tva_flags == TVA_KHUGEPAGED) && vma_is_anonymous(vma))
 		orders = THP_ORDERS_ALL_ANON;
+	else if ((tva_flags == TVA_KHUGEPAGED) && vma_is_shmem(vma))
+		orders = THP_ORDERS_ALL_FILE_DEFAULT;
 	else
 		orders = BIT(HPAGE_PMD_ORDER);
 
-- 
2.47.3

