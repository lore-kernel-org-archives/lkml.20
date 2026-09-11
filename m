Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D3A46AA9A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118064; cv=none; b=V6MR5+ozRJtm6Y7NV3cnpIieStt26/8CMgeG9oPWP4RpTnygFWUOsPkASa/ht/R0j/zu5f1jjMJ8eFtKj+D+5ptorghNRYN5Pz3xWQ4a1ioMpzjiw+L19s0IJK3Yt9HLR0gw5tWwc0UeE++KXqSu3V8NLPHBGd3hKXwIFo8cWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118064; c=relaxed/simple;
	bh=QyDiNCYlYOZb31l7DmrQOOYMFu4Z0v07nGxYRyrtdtc=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=twwmxFe6goufSgCheXewKldo5x+XC9VGwEhWYjTe4T99xB2xtT3+3X4ljq6Mw89xZZl1RuEan+h90KloSM8jISpdRx458q5XK3/gMwh6ITVVMRisGK/ETpnFwxVq1wQVlMDFyZAxc5hLiA13VjNt0fbffeUjHO7RNwcgL89ei3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hh84W5WYJz8Xrr9;
	Fri, 11 Sep 2026 17:14:19 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68B9E6JT058032;
	Fri, 11 Sep 2026 17:14:07 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 17:14:09 +0800 (CST)
X-Zmail-TransId: 2af96aa3c661ec0-35e31
X-Mailer: Zmail v1.0
Message-ID: <20260911171409340O9nQbxkRZ18MVTGcrJgjV@zte.com.cn>
In-Reply-To: <20260911160942109wy2iDTGJslK6rHl8E56si@zte.com.cn>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn,20260911160942109wy2iDTGJslK6rHl8E56si@zte.com.cn
Date: Fri, 11 Sep 2026 17:14:09 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xu.xin16@zte.com.cn>, <ljs@kernel.org>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
        <surenb@google.com>, <rppt@kernel.org>, <ziy@nvidia.com>,
        <baolin.wang@linux.alibaba.com>, <nico.pache@linux.dev>,
        <dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
        <chengming.zhou@linux.dev>, <usama.arif@linux.dev>,
        <gourry@gourry.net>, <harry@kernel.org>, <vbabka@kernel.org>,
        <peterz@infradead.org>, <borntraeger@linux.ibm.com>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzRdIG1tOiBtYWtlIGZvbGlvX3dhbGtfc3RhcnQoKSdzIGxvY2tpbmcgYXNzZXJ0cyBzY2FsYWJsZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68B9E6JT058032
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 11 Sep 2026 17:14:19 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA3C66B.001/4hh84W5WYJz8Xrr9

CC: Lorenzo Stoakes <ljs@kernel.org>
----
From: Xu Xin (ZTE) <xu.xin@linux.dev>

Add an additional member 'walk_lock' to folio_walk to indicate
locking requirements for the walk. Similar to commit 49b0638502da0
("mm: enable page walking API to lock vmas during the walk").
But no change is made on any existing locking behavior,
all existing folio_walk_start() callers are currently still
under mmap_read_lock() protection.

This change is prepared for the latter patch to enable VMA locking
asserts. folio_walk_start now operate under write-locked mmap_lock.
With introduction of vma locks at the next patch, the vmas have to
be locked as well during such walks to prevent concurrent page
faults in these areas.

No functional change intended.

Signed-off-by: Xu Xin (ZTE) <xu.xin@linux.dev>
---
 arch/s390/mm/fault.c     |  4 +++-
 include/linux/pagewalk.h |  1 +
 kernel/events/uprobes.c  |  4 +++-
 mm/huge_memory.c         |  4 +++-
 mm/ksm.c                 |  4 +++-
 mm/migrate.c             |  8 ++++++--
 mm/pagewalk.c            | 10 +++++++++-
 mm/rmap.c                |  4 +++-
 8 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 46d828926009..968f128a5232 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -412,7 +412,9 @@ __context_unsafe(/* folio_walk_end() not instrumented */)
 	unsigned long addr = get_fault_address(regs);
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	struct folio_walk fw;
+	struct folio_walk fw = {
+		.walk_lock  = PGWALK_RDLOCK,
+	};
 	struct folio *folio;
 	int rc;

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 1c397be0d092..455428eaf1fc 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -184,6 +184,7 @@ struct folio_walk {
 	};
 	/* private */
 	spinlock_t *ptl;
+	enum page_walk_lock walk_lock;
 };

 struct folio *folio_walk_start(struct folio_walk *fw,
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 7709ea882477..054fdcb52136 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -507,7 +507,9 @@ int uprobe_write(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
 	int ret, ref_ctr_updated = 0;
 	unsigned int gup_flags = FOLL_FORCE;
 	struct mmu_notifier_range range;
-	struct folio_walk fw;
+	struct folio_walk fw = {
+		.walk_lock  = PGWALK_RDLOCK,
+	};
 	struct folio *folio;
 	struct page *page;

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index dd66c6ad5af1..b714677e2f20 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4795,7 +4795,9 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 	 */
 	for (addr = vaddr_start; addr < vaddr_end; addr += PAGE_SIZE) {
 		struct vm_area_struct *vma = vma_lookup(mm, addr);
-		struct folio_walk fw;
+		struct folio_walk fw = {
+			.walk_lock  = PGWALK_RDLOCK,
+		};
 		struct folio *folio;
 		struct address_space *mapping;
 		unsigned int target_order = new_order;
diff --git a/mm/ksm.c b/mm/ksm.c
index 624f37975e12..8df66b4e5de0 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -817,8 +817,10 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
 	unsigned long addr = rmap_item->address;
 	struct vm_area_struct *vma;
 	struct page *page = NULL;
-	struct folio_walk fw;
 	struct folio *folio;
+	struct folio_walk fw = {
+		.walk_lock  = PGWALK_RDLOCK,
+	};

 	mmap_read_lock(mm);
 	vma = find_mergeable_vma(mm, addr);
diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa..fa638adfb0de 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2302,7 +2302,9 @@ static int add_folio_for_migration(struct mm_struct *mm, const void __user *p,
 		int node, struct list_head *pagelist, bool migrate_all)
 {
 	struct vm_area_struct *vma;
-	struct folio_walk fw;
+	struct folio_walk fw = {
+		.walk_lock  = PGWALK_RDLOCK,
+	};
 	struct folio *folio;
 	unsigned long addr;
 	int err = -EFAULT;
@@ -2464,7 +2466,9 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 	for (i = 0; i < nr_pages; i++) {
 		unsigned long addr = (unsigned long)(*pages);
 		struct vm_area_struct *vma;
-		struct folio_walk fw;
+		struct folio_walk fw = {
+			.walk_lock  = PGWALK_RDLOCK,
+		};
 		struct folio *folio;
 		int err = -EFAULT;

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 7411702a37f5..8eb29fba20ad 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -910,7 +910,15 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 	pgd_t *pgdp;
 	p4d_t *p4dp;

-	mmap_assert_locked(vma->vm_mm);
+	/*
+	 * Other locking modes except for mmap or vma read locking are not
+	 * expected.
+	 */
+	if (fw->walk_lock != PGWALK_RDLOCK && fw->walk_lock != PGWALK_VMA_RDLOCK_VERIFY)
+		WARN_ONCE(1, "walk_lock is not expected!\n");
+	process_mm_walk_lock(vma->vm_mm, fw->walk_lock);
+	process_vma_walk_lock(vma, fw->walk_lock);
+
 	vma_pgtable_walk_begin(vma);

 	if (WARN_ON_ONCE(addr < vma->vm_start || addr >= vma->vm_end))
diff --git a/mm/rmap.c b/mm/rmap.c
index 5fefe5b060b1..fd8e1c9e4424 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2871,7 +2871,9 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	struct mmu_notifier_range range;
 	struct folio *folio, *fw_folio;
 	struct vm_area_struct *vma;
-	struct folio_walk fw;
+	struct folio_walk fw = {
+		.walk_lock  = PGWALK_RDLOCK,
+	};
 	struct page *page;
 	swp_entry_t entry;
 	pte_t swp_pte;
-- 
2.25.1
