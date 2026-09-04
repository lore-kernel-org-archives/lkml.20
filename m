Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB14E3E9C2F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510645; cv=none; b=EXluMqF2mkCRnOaCLluB1iZB+o8B980zqQdzhmp5BUf9wQHjvkJPynileZA8zMa0CTbLXfX9+Rfd7FN0eWuLswIx2ON4oS0ZOo34Ca4X4PnSyv0lkYPm7imkiNhXIKF44PjoP9YhZASe2lrE6PsVBAMVwQ9Ctm0eRN0+HXCUHjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510645; c=relaxed/simple;
	bh=CFKM/oXZIBvw0BqE9/5yiGP7kLeCWI/z9w+COmstMmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8FPOrZdsweDmj2fJwAwWMNepVKE+x6JcgTaD87ZPhRsb+Cy9a54cM9vdYVSuFtUgBsosLnDuW1LF4ZpA2RvYiSl9RVCYBkDBh1ppF5hlJ8eThlqfR7WAsuM45ICJH3PNsP2kaYf36fNxAodGAn2HTzTE2npKMXjyfWHagCHC+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y6etWUM1; arc=none smtp.client-ip=95.215.58.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y6etWUM1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CFKM/oXZIBvw0BqE9/5yiGP7kLeCWI/z9w+COmstMmA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510641; v=1; x=1789115441;
 b=Y6etWUM1RMTIvN2P7dw85Fry5LCC8U/8IwkjsGKpzZQZ7T/bJLz9a9/zCvGZYb+OTdKWdVgf
 voYRKhnzo7SqYxeWTyHQYfoCRO4CrvSdP6BxvWFyKzg4YnnlP41WXvyQcRPO7KpwsWcopcZ09ej
 HKw1kKmkJa+Ll46FKmaK+SqY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ff74a31b6f5cb41;
	Fri, 04 Sep 2026 08:30:41 +0000
X-Mizu-Trace-ID: 4ff74a31b6f5cb41
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Ye Liu <liuye@kylinos.cn>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] mm/memory-failure: convert process iterator to for_each_process_rcu
Date: Fri,  4 Sep 2026 16:29:56 +0800
Message-Id: <20260904083001.553587-5-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904083001.553587-1-ye.liu@linux.dev>
References: <20260904083001.553587-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

Replace the manual rcu_read_lock()/rcu_read_unlock() pairs combined
with for_each_process() loop in mm/memory-failure.c with
for_each_process_rcu().

No functional change.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/memory-failure.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index a8b03e2920ba..63a2ff08ee33 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -555,8 +555,7 @@ static void collect_procs_anon(const struct folio *folio,
 		return;
 
 	pgoff = page_pgoff(folio, page);
-	rcu_read_lock();
-	for_each_process(tsk) {
+	for_each_process_rcu(tsk) {
 		struct vm_area_struct *vma;
 		struct anon_vma_chain *vmac;
 		struct task_struct *t = task_early_kill(tsk, force_early);
@@ -572,7 +571,6 @@ static void collect_procs_anon(const struct folio *folio,
 			add_to_kill_anon_file(t, page, vma, to_kill, addr);
 		}
 	}
-	rcu_read_unlock();
 	anon_vma_unlock_read(av);
 }
 
@@ -589,9 +587,8 @@ static void collect_procs_file(const struct folio *folio,
 	pgoff_t pgoff;
 
 	i_mmap_lock_read(mapping);
-	rcu_read_lock();
 	pgoff = page_pgoff(folio, page);
-	for_each_process(tsk) {
+	for_each_process_rcu(tsk) {
 		struct task_struct *t = task_early_kill(tsk, force_early);
 		unsigned long addr;
 
@@ -611,7 +608,6 @@ static void collect_procs_file(const struct folio *folio,
 			add_to_kill_anon_file(t, page, vma, to_kill, addr);
 		}
 	}
-	rcu_read_unlock();
 	i_mmap_unlock_read(mapping);
 }
 
@@ -635,8 +631,7 @@ static void collect_procs_fsdax(const struct page *page,
 	struct task_struct *tsk;
 
 	i_mmap_lock_read(mapping);
-	rcu_read_lock();
-	for_each_process(tsk) {
+	for_each_process_rcu(tsk) {
 		struct task_struct *t = tsk;
 
 		/*
@@ -653,7 +648,6 @@ static void collect_procs_fsdax(const struct page *page,
 				add_to_kill_fsdax(t, page, vma, to_kill, pgoff);
 		}
 	}
-	rcu_read_unlock();
 	i_mmap_unlock_read(mapping);
 }
 #endif /* CONFIG_FS_DAX */
@@ -2288,8 +2282,7 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
 	struct address_space *mapping = pfn_space->mapping;
 
 	i_mmap_lock_read(mapping);
-	rcu_read_lock();
-	for_each_process(tsk) {
+	for_each_process_rcu(tsk) {
 		struct task_struct *t = tsk;
 
 		t = task_early_kill(tsk, true);
@@ -2303,7 +2296,6 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
 				add_to_kill_pgoff(t, vma, to_kill, pgoff);
 		}
 	}
-	rcu_read_unlock();
 	i_mmap_unlock_read(mapping);
 }
 
-- 
2.25.1

