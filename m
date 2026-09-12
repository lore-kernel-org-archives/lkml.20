Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47418364049
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201585; cv=none; b=BrQqd0QhEEoSQHsC12Mz7QqoKywE3X6f+jnuRKKqWujRmyT42Qf13yAueI9DVHXyTlAZ3mVTRbSmLxEy/0y1FkRIgT2/7W5HxsyCkJMnDCvJ04vfEJIFhPQZvcrG/V+4IOWZt3lUQSkFfA7ZrLhJldp5JUOgK7Mpyj/VhmMM4NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201585; c=relaxed/simple;
	bh=HiCLigrb3JPgZqO0yJoGKQgmzJo9QYRctcjHZfXqCrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1ez6xKcEgFaACoR6orC10DZFauJB4HXJGnBpVzQscKbeLLr6pDoTNbqGKFZrsC0yD/8ehelXSNfmBaB0PmSnpcbVJob7Jwes6ROTTzdWV/oALB83hBVImY6WnJ8SXa1syibATjYx1kDL1CLMGadVadl8afyo9Z+5M7gy/GbfgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=p+QhlJEF; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="p+QhlJEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zB
	ogXOhOlG1kMkxMqII2ZbwGmlciHENob2EpVE6bVCc=; b=p+QhlJEFq21IlZxo+c
	NxJyxgDg8fE6y/NEaX/XoL6bTwDF+tDVS++xpBFt/OaZSZY0SSExhsUc+C5k1hHI
	kNDk49X/U5ZtJRXr/AwtjCu6H1R1oPNh8g201lbpGjrw3gnoG6yLSG0avCaek5yv
	QKgmBzdwo8jjm+x6m996fAOI4=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnr7FODKVqmfMoSQ--.44660S3;
	Sat, 12 Sep 2026 16:24:48 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	chengming.zhou@linux.dev,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	harry@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nico.pache@linux.dev,
	peterz@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH RFC 1/3] mm/pagewalk: allow folio_walk_start() under a vma read lock
Date: Sat, 12 Sep 2026 16:24:05 +0800
Message-ID: <20260912082407.75875-2-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912082407.75875-1-xialonglong2025@163.com>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
 <20260912082407.75875-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDnr7FODKVqmfMoSQ--.44660S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur15Xr1rZr4xGr18GF1UAwb_yoW8Kw45pF
	Z2ka4FqFWvkr1I9w18Aa12yr45u34kKFWUC3ZFgry7ZrnIya1fKF1kt3Wjqa45Gr4xAFZ5
	XrWDKrWkuF18Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSv38UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+BAbFGqlDFCUsQAA3R

From: Longlong Xia <xialonglong@kylinos.cn>

Allow folio_walk_start() to use a vma read lock by replacing
mmap_assert_locked() with vma_assert_locked().  This lets KSM look
up pages without taking the mmap read lock.

The vma lock stabilizes the mapping, while page table locks serialize
entry updates.  Callers walking another mm under the vma lock must
also hold an mm_users reference to prevent exit_mmap() from freeing
the page tables.

Assisted-by: Zcode:GLM-5.3
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 include/linux/pagewalk.h |  3 +++
 mm/pagewalk.c            | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index b41d7265c01b..cafd7b15f480 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -151,6 +151,9 @@ typedef int __bitwise folio_walk_flags_t;
 /* Walk shared zeropages (small + huge) as well. */
 #define FW_ZEROPAGE			((__force folio_walk_flags_t)BIT(0))
 
+/* The caller holds the VMA read lock instead of the mmap lock. */
+#define FW_VMA_LOCKED			((__force folio_walk_flags_t)BIT(1))
+
 enum folio_walk_level {
 	FW_LEVEL_PTE,
 	FW_LEVEL_PMD,
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index cc07fcf50e87..57ffaf2a85b8 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -894,7 +894,11 @@ int walk_page_mapping(struct address_space *mapping, pgoff_t first_index,
  * huge_ptep_set_*, ...). Note that the page table entry stored in @fw might
  * not correspond to the first physical entry of a logical hugetlb entry.
  *
- * The mmap lock must be held in read mode.
+ * The mmap lock must be held in read mode.  Alternatively, with
+ * CONFIG_PER_VMA_LOCK and @FW_VMA_LOCKED, the vma lock may be held in read mode: the
+ * page tables of a read-locked vma cannot be torn down while the mm has
+ * users, so a caller that walks an mm other than its own must also hold a
+ * mm_users reference for the duration of the walk.
  *
  * Return: folio pointer on success, otherwise NULL.
  */
@@ -912,7 +916,10 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 	pgd_t *pgdp;
 	p4d_t *p4dp;
 
-	mmap_assert_locked(vma->vm_mm);
+	if (flags & FW_VMA_LOCKED)
+		vma_assert_locked(vma);
+	else
+		mmap_assert_locked(vma->vm_mm);
 	vma_pgtable_walk_begin(vma);
 
 	if (WARN_ON_ONCE(addr < vma->vm_start || addr >= vma->vm_end))
-- 
2.43.0

