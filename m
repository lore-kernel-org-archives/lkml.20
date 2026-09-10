Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49BE3C5DB6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022046; cv=none; b=FAFC9IA38TVkjcrShXJIbLwdovliF4d1MLI90oZ2LGGh/cD6WLY8/PhZ+Xyl0UHJXibYiPIqIb8JQrKM6AlsEs01r3u25Fm+SImWIByEaxOWoklRMmDWAIfiYwezi9SifKolDSjjAfLHMdT667+Lo1nJfkxD2j/BwWBCaeeQyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022046; c=relaxed/simple;
	bh=GRsV9hB2Anw7rd7yPDrYvEG4Zy5T32i/Dx5yOBTdbQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grwX0vhU38TrxakkBDh8GXrkc0FMKshbkzOQHmQQv637w7JiFjdOc8ngMRJyzA+rBg9qqHByQuhVBHrNIjg34R7T6eooaNaZ7qUYz/O0s818Sdl5Joozu87LGcQEyhqnY27wId4v5dZrf5KmQqba1MhN3i5QXLc+9AOq0Qlk/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SMt+PNkV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SMt+PNkV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so5658057a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022037; x=1789626837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsqJXB+7FTTz0HgjrZ7vjc10S/x3pwFsj1u1bd3Xfng=;
        b=SMt+PNkVL6dehtXWCQnEghv3vwihiTw37Pl2zMBgG9ClHE0tU6fMS9Wr9K+7XkfLeo
         q/r727qnvLrQF7lOsX9p532ON7Z5x6fDZgrjeNwWyySqLQlx/K3j+Bw0t90iaUlb07vk
         1x4lblovCod5p3XYzy398wn0jgreiov96EQ4D6zb80oh+7Vmm+viAEiyPY9yl1iU0jgl
         ablodC7RnSk6X/M3YQj1iooNOeCYnLBVnWY6O9lV7AMWkyUXtW1VD4IepfnCm0I43WUx
         hXKBZOh0cvsAvvOfF8xIhiguISIJeYDqz22Rt3bAz2KfLYHpFOJmUaaNDgECMRqqs1gd
         Q9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022037; x=1789626837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BsqJXB+7FTTz0HgjrZ7vjc10S/x3pwFsj1u1bd3Xfng=;
        b=KPqkIfPdoYsOFPg4Wz1rJm52bAbl2jg1XVTv7TA7+R0odrzNmMdl4uuVwa7NcCPlFd
         0N7p9/T7LzJnP09SmmcZ/jMoRGhZ3bhJ6CkafXIdxWi3BstsAnT2qsqJRC/+rTJI5Nuq
         dPkRgwFu/ZmpgQ/qpyLiG+JvCibHFsC0oaYEhNzRxgAAWHDAxLoShFeEfwhW3K+76x01
         QNs3yZxZ2mDhUcqWyA5Fv5AVI+jeRGoIB19dzepcuW9PATlMfF0HvxtM8cm20r4nvOp6
         dGEvfCvT4GUGYpyw3l+OtUCn2bUU90gBeYGISWWpuROKF+f+9ZQ/wLoX6h+8Lf759VmP
         Amhg==
X-Forwarded-Encrypted: i=1; AKwUvBwTgI43GoEd5RHp72ZRMvGlfypGVHN2fy3DQEMzPm/MTPtd2hBfREQq+6zRD1RNrsbQNI4alLby8evOQ2s=@vger.kernel.org
X-Gm-Message-State: AFuF++n40/RYyLBB54RXAB3Pn430pcuvnRW7D4IjwdFa1KNqnhnaWlGk
	Xv9SAA/x2Kynje6fiw60Vm1HMbm2RutCtDsj7hu6oMcWHHsjxxD8zMQ2XcXvmT8ycnk=
X-Gm-Gg: AYBFou2PNARW641L6jIwTm0CsyWUEfEJu7vDF4wjUwsbmnxHxZiJddnIUQkl4j4zZ5k
	8pFDD3ccGB/2gxxcZ7UKcWbfyYTr6NAa96vlzcr3jZg6CMIfCBE3tumOYTnus69P/3vlE6Iib0A
	3Xf7OjNLfVadBYZEpQx8O+W68BdYdCmlJKokbcAM3aUsH/fvu+2pGa8V8qXyolRM8gXDv8elp8b
	t1LRcxadR9zbyrfO3qPCRS8swu5d2/2pyw8klfIgtPpJz9I0mTsDN8T+j49KsgDl025kyjuFTzz
	qVcWvOb9XGLCOxWZL+/jiNX2n2TZu6FMcJXdLS8RvccBZ08QT0I7TlmDD0OW7jTBBHE9LN1BbsP
	rIXzAYpstgUBVqaCPm/uKpDvkje5pkAnbrrnntE/uSstK7WxMVaMj+k8E2FmQ9tE2kDoEKyjHLn
	ZhVKrvJMdb895L808XUgCSFY7+BCc0oXBX2lh4ZPojcBw2ES22T/4pKB0bCfdwTqFgCMEFLpf5g
	vBK5ghfvqS7Z7O9uPBspDUr8Y0cTODhw8A=
X-Received: by 2002:a17:90a:616:b0:39d:8222:6436 with SMTP id 98e67ed59e1d1-39d82226893mr1803358a91.7.1789022036378;
        Wed, 09 Sep 2026 23:33:56 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:55 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 09/17] mm/sparse: initialize memory sections earlier
Date: Thu, 10 Sep 2026 14:32:48 +0800
Message-ID: <20260910063256.64386-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upcoming HugeTLB bootmem changes need sparsemem section metadata before
the HugeTLB bootmem allocation path runs. The memory sections are
initialized from sparse_init(), which is called too late for that setup.

Move the code that initializes sparsemem section metadata for memblock
ranges into mm_core_init_early(), before free_area_init() and the HugeTLB
bootmem setup. Rename the helper to sparse_sections_init() so the new
caller describes the sparsemem-specific initialization step.

This is a preparatory change.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Drop the inaccurate sparse_sections_init() comment
  (suggested by David Hildenbrand)
- Collect Acked-by from Qi Zheng

v5:
- Collect Reviewed-by from Mike Rapoport

v2:
- Rename the helper to sparse_sections_init() to describe the section
  metadata initialization (suggested by Mike Rapoport)
- Fix the !SPARSEMEM stub name so SPARSEMEM=n builds compile
  (reported by Sashiko)
---
 mm/mm_init.c | 1 +
 mm/sparse.c  | 9 +--------
 mm/sparse.h  | 2 ++
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index ee3bd7921768..304c88da5cce 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2642,6 +2642,7 @@ void __init mm_core_init_early(void)
 {
 	kho_memory_init_early();
 
+	sparse_sections_init();
 	free_area_init();
 
 	hugetlb_cma_reserve();
diff --git a/mm/sparse.c b/mm/sparse.c
index e6cb67ca9c8d..428d81838ece 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -191,12 +191,7 @@ static void __init memory_present(int nid, unsigned long start, unsigned long en
 	}
 }
 
-/*
- * Mark all memblocks as present using memory_present().
- * This is a convenience function that is useful to mark all of the systems
- * memory as present during initialization.
- */
-static void __init memblocks_present(void)
+void __init sparse_sections_init(void)
 {
 	unsigned long start, end;
 	int i, nid;
@@ -322,8 +317,6 @@ void __init sparse_init(void)
 	unsigned long pnum_end, pnum_begin, map_count = 1;
 	int nid_begin;
 
-	memblocks_present();
-
 	if (compound_info_has_mask()) {
 		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
 				    MAX_FOLIO_VMEMMAP_ALIGN));
diff --git a/mm/sparse.h b/mm/sparse.h
index 74dd79c51e75..e998347867f4 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -59,6 +59,7 @@ static inline bool vmemmap_optimizable_order(unsigned int order)
  */
 #ifdef CONFIG_SPARSEMEM
 void sparse_init(void);
+void sparse_sections_init(void);
 int sparse_index_init(unsigned long section_nr, int nid);
 
 static inline void sparse_init_one_section(struct mem_section *ms,
@@ -104,6 +105,7 @@ static inline bool section_vmemmap_optimizable(const struct mem_section *ms)
 }
 #else
 static inline void sparse_init(void) {}
+static inline void sparse_sections_init(void) {}
 #endif /* CONFIG_SPARSEMEM */
 
 /*
-- 
2.54.0

