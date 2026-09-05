Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B50738E5DC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616941; cv=none; b=qwqVG3Fx5uSa6k/SzBqR6rXPI/bAHjpYa5eYsN4csNZ7TpYWXjN5fcgHvtVY59p2aPaikb/rRiT/o1CeFgGb6ZL8dhxFhayE8oZdEXYEt2iAgFsKdNfKiBTD3o7m2f1cxmpWWNAil+5rLZYt28Fy6Kg3P63cm7plgLtIQA4ZSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616941; c=relaxed/simple;
	bh=/HG9Myx+SswQeekFwNoyEv5medtLqspzxw3pTIkbj3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZZWEVVjS8V27vvKVt4HnH0iI1t2cw6jp33+d05BpcX3O2tTReRzgrXDJy3TNZJXjPWi2KjImgp1uSd4jlr48f6AoSxK+h/wW3vsrduaYoTCec7jJklBqRWzjednxkb48KgW1Uc4nLMCGe8qUFQfd6Dlg1NQLttWzia/jDibW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXBSGrv6; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXBSGrv6"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49ccf0fbf41so8261355e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616929; x=1789221729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icDFr+1kJOyXzKJSmWL1jSVXiQ38MI3ua/+Z5tbVNKM=;
        b=QXBSGrv63wfSJdBhvfnVHS0A0Ukvr2MIRyNoAnu7h/aIf3FTmv88YXexQ1zK/3X68h
         uedPGBcqpeIc107SEgLYHvdLacAtw19Udn4fL3+YrJxyoNGPgzsl8ZjeNh9ukOhfzOWU
         AG+hhjmgIZnUgYaLmyHzO2RKVwW57VTOvWocC/YSzwdM1xwM+Qnxk2ppzN/j6Wzl1Y3X
         LzNQTsxcxcPdSbc/BKMkM50niW6ceLax/sMg2NKvnP+D39YIiFsJ4QqAcf3ks1oLYNPS
         IRZ8aEI/uHZfUxI0iiN/aH1iDajaXYCe+QwXZJgV5lmPU15ADgeLE6U5NkWA1QjvzdtZ
         2Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616929; x=1789221729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icDFr+1kJOyXzKJSmWL1jSVXiQ38MI3ua/+Z5tbVNKM=;
        b=rDeou+v6K/0Q52/F2hXZPna+OfMjpzgsgWq669pD39U7h5R2qT28wR5k0GeGYI7cHg
         5M5aQQ7bwQ4nV4+dr9U/+EFrq1gHLElK5zZljoEDE6PCL9I21GAhh2pZ00wlfI454caG
         uJYvjLjFePtpSGBmZXle3dPS1aHHno+RBFKAtG/8ii0Illisfxy59m6tJKGlfRl/mSHW
         qT1T+83k/7FG3WIzsJ1Xma/LLldUZi/TZlxboM/5Wv2Ngc2WU3jv/DUJFRTp+SADKVOa
         y3WHUTpGCa/EtOkM/d+V7QY3Xb5/z1PNOYYaCCHDlk5X1XqlCn1f+CBT9o26KqS4yw4J
         7c2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmxoyquYPcnrdmhZ6BLF2Vx3lq0K3zk5c/zNX48EIhaIDf2gy7OT7u4n5cFRQP0oq3AzsP5ycGoH+CP5s=@vger.kernel.org
X-Gm-Message-State: AFuF++nRoN42L2uW+SXFLvYV/e9cQ/LlwxNiXjFGvZtzxi83GNUFpb3e
	NrLs6ZcdcrteK9BNfn6jwLQiXUWqh6dIP4Yt4ab7J6p7N5Azmiadnlxl
X-Gm-Gg: AYBFou2EgKWQfYRMG1CJeZTQS8Pbo0p9Z/nGjlx3m+Tq7Za8VfrjTw1HEmWC+KLGqxb
	St8wMj6017/+yW0xqIBWRk6peaMsKXaGyutpYY2/OYMif+kuf3zVm1vs1u8LXrWvtCndBkksW6b
	/BIt8hVGZgIrHaXhMGjyjVw2N0Cb93OwrJqLsSL+p0KlejK/O4RwC24AB/4RU64m3nrDQb+CIUd
	dIQRojRjJ9CJLy2eH5DuXvBcY64HE+FWiXjRdEFXznOGpdFvS6/jm+9QUaFr0I+FO8drJyNvFd2
	7oDu4xnTzs6939ucIppkEEHCC7DRmeeGTnrymCqty4UNxTJPJM21GdH699baFSmUotuwfyD+UaX
	KTaaEwdpRF3Emzs9rRBBLy3xVwi6dp6pQT/+um0U9xHf7/i7xuooeZhqTffTAOwSgUmhhe5c/ZG
	UFoqjP9w0mZ1H3cE609rr9ssWHe52b06qtyjnODA4jw2iLu8IZNX2U1vi2mw+S12PAaJF6vcAeH
	hisrkvmqUsyN0k=
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr148106805e9.12.1788616928651;
        Sat, 05 Sep 2026 07:02:08 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm149866765e9.0.2026.09.05.07.02.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 07:02:08 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH 1/3] mm/mmap: fix various coding style warnings
Date: Sat,  5 Sep 2026 17:01:38 +0300
Message-ID: <20260905140140.60792-3-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
References: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style warnings and errors flagged by checkpatch.pl script. Specifically:
- Remove the obsolete filename reference in the top comment.
- Replace <asm/cacheflush.h> and <asm/mmu_context.h> with <linux/...>.
- Add missing blank lines after variable declarations and replace spaces with tabs where needed.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/mmap.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 4bf26b0f1e6e..626d3d2493ae 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/mmap.c
  *
  * Written by obz.
  *
@@ -50,9 +49,9 @@
 #include <linux/memfd.h>
 
 #include <linux/uaccess.h>
-#include <asm/cacheflush.h>
+#include <linux/cacheflush.h>
 #include <asm/tlb.h>
-#include <asm/mmu_context.h>
+#include <linux/mmu_context.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/mmap.h>
@@ -526,9 +525,9 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			 * And don't attempt to combine with hugetlb for now.
 			 */
 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
-			        return -EINVAL;
+				return -EINVAL;
 			if (vma_flags_can_grow(&vma_flags))
-			        return -EINVAL;
+				return -EINVAL;
 
 			/*
 			 * If the pages can be dropped, then it doesn't make
@@ -832,6 +831,7 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 				  = NULL;
 
 	unsigned long error = arch_mmap_check(addr, len, flags);
+
 	if (error)
 		return error;
 
@@ -942,6 +942,7 @@ find_vma_prev(struct mm_struct *mm, unsigned long addr,
 			struct vm_area_struct **pprev)
 {
 	struct vm_area_struct *vma;
+
 	VMA_ITERATOR(vmi, mm, addr);
 
 	vma = vma_iter_load(&vmi);
@@ -1017,12 +1018,12 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 
 #if defined(CONFIG_STACK_GROWSUP)
 
-#define vma_expand_up(vma,addr) expand_upwards(vma, addr)
+#define vma_expand_up(vma, addr) expand_upwards(vma, addr)
 #define vma_expand_down(vma, addr) (-EFAULT)
 
 #else
 
-#define vma_expand_up(vma,addr) (-EFAULT)
+#define vma_expand_up(vma, addr) (-EFAULT)
 #define vma_expand_down(vma, addr) expand_downwards(vma, addr)
 
 #endif
@@ -1227,6 +1228,7 @@ int vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec)
 	int ret;
 	bool populate;
 	LIST_HEAD(uf);
+
 	VMA_ITERATOR(vmi, mm, addr);
 
 	len = PAGE_ALIGN(request);
@@ -1290,6 +1292,7 @@ void exit_mmap(struct mm_struct *mm)
 	struct mmu_gather tlb;
 	struct vm_area_struct *vma;
 	unsigned long nr_accounted = 0;
+
 	VMA_ITERATOR(vmi, mm, 0);
 	struct unmap_desc unmap;
 
@@ -1454,6 +1457,7 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf)
 
 	if (*pages) {
 		struct page *page = *pages;
+
 		get_page(page);
 		vmf->page = page;
 		return 0;
@@ -1711,6 +1715,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 	int retval;
 	unsigned long charge = 0;
 	LIST_HEAD(uf);
+
 	VMA_ITERATOR(vmi, mm, 0);
 
 	if (mmap_write_lock_killable(oldmm))
-- 
2.55.0

