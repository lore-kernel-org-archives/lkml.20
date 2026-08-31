Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3308F3B47E2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162883; cv=none; b=Rf1at0BBdlFvQNXIPeF8VEtwlSB9VGDi9clvHPnt+JUd01MdtGMgJ0a3POXkxIeU9hx9enl8Cil0gNkX8cJkSRRphKvknWbtfrqmAUR7ckb1K4QBpe7cYRf/ayoAmHcYVRJvr0Aw/Wd7KhVk/MJFZ9+J97RjXLz6IvmFGcUirUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162883; c=relaxed/simple;
	bh=9VZFInChYy4Z6j6P4cJOG0K1lF4h/rPu4QvJGIxjGyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJaHdFPDsf0YnYYEtZ3GRmIq2tqyZJC80FlrrtmaA454UdGJEnTQBn0ablkxirvZDhRzPsJSr2dudIeeLGC4Om1vkPVqCsPESw3R49RMyX0RUYoWRMWXwowdnsjSDsuEKyux+LLX+PgI7NrPUKc3ZdQtyD+0/U3+qT4jmB6oirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G1xxSAWX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G1xxSAWX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2870596b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162881; x=1788767681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydg9K+ixOLWYvkyYLVa0DgkFjsmj2k1/+Q4MRUoiR6A=;
        b=G1xxSAWXM401imJZB405HrF3O3XW/X2Lj4k0FPMxnSoSeWhRs9tFIHd18E9vQXgAeb
         wX8/tdaLYQhOd5zCs50tXU8/P9071djjpK40BKsGoQfw1aIA0/sGpHX1KGtUJr6Tee26
         zzI0cDyd5ukwKTDhasHSVH9/nGBo6QcmE1uvy26lADxOo5aQKUA2EVUkxhhsX8gPkm0m
         gWe0+lwBiA5FVwIa/LsDGnuKhhN6Jwl3lCPexkkNqkWFqudMXVqx3uc6wMTwSff9nHuQ
         APSANxk4haBQx6MtlNNvT5TraRvrMm0Fz+S4C1RqXvx4yC+aAdjwXfWP8ATG7GTuOk/y
         7ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162881; x=1788767681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ydg9K+ixOLWYvkyYLVa0DgkFjsmj2k1/+Q4MRUoiR6A=;
        b=d8i4eXcu+sdsbWfmHDpBxr71ndPODoOY0QOw/J4J1pPQzVmwe4UpBHOBJGsM0EaCc0
         iE3uRoQ7q1HwgNRycuDIPDjBQ+ubYYLMTpg8PtmQWN8Vxf9RcQISxzv6g6YQZ0Zphi7K
         GTNazF7xyoZ8/Xu0k6/MDcwkln0bnpwZYGK69dNvd5PCTBrqAJSH/8l2N+PSD/Xpibjb
         5yvd++71ePx/gZSpB4TUOcnCXKrdLuQ9PW4kUEFJSoTBNy6Nk8Djy6feOog5wlelUJwt
         0aRe8p/Xda/ei+35QgbXBtAIP5SQ5OgEE8GQamiFez9LmS7CwS25KDaTr0n/tFEC/dao
         PFbA==
X-Forwarded-Encrypted: i=1; AHgh+RrNpWm5VjJgd3JIL7A6jhqTex3kr7gmo81BAB4OWx+AqAZWRjIiz2IscgBLzZDrDpm7Fb7ho8yBuoDcqdo=@vger.kernel.org
X-Gm-Message-State: AFuF++nBqQ661bsJA27FILRNRZDU0t6nSd1mAOh88HYcpgAuc6nirH7t
	ETNcbxsLNVXF1p3vrsUmzHH5IJ5u827N6N2lonMzXI1Q2LkUNX6iMD8tbWcGbCEOLUQ=
X-Gm-Gg: AR+sD12Yj4VAw8UFPSywIPKWOQUXUY0Au8ay5/WMWBkUDOctufvLwUPXn0Ktp1bMxjT
	nU5hTB82sGc1BLCgvLKYtYRN4Je8W5wYqrjUfkIu4iNuIwEVaw/maHa+MFxMnYq1+SLGu1rj1Rp
	WndI8GbDkAiVtN0zcFi4A2ss+1RX5yHJlJmb9YsxEw6WyCIkmbCfvSVl/esbJDMhPT3B+HPzq47
	Vf/Ol0tzw+5duOG3VV1quozr6Y6c5+9aRqyC2KrabproOm1HlO5xnciKBi75L+jVhbBT6KfhM2I
	wgf16ouqfpBA/zj+67Ya5669u2G86JAJR2b4sBV/h0wz6xRkWbvv/r55qIkPSZ9wNFX6O/cqCKn
	6olnNN+NzLONP9+dxiWWKnwnU6cop+jMOSdGxGdJ2INY4Ued9pYWJQ8Z1FrRb4AxGJZ1aAUv+er
	guSbnFORs0Po3jpLouMKAPNdqLE5pvZoYWqz1yjKx+koE8ALbk71AXHWYu/C7CbCV2KyIXEjdhp
	XD2lzuQaiC/9bpoQ92v35RV
X-Received: by 2002:a05:6a00:3487:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-85994491148mr5360786b3a.1.1788162881545;
        Mon, 31 Aug 2026 00:54:41 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:54:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 03/11] mm/sparse-vmemmap: open-code init_compound_tail()
Date: Mon, 31 Aug 2026 15:53:34 +0800
Message-ID: <20260831075342.57563-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_compound_tail() is only used by vmemmap_shared_tail_page(), where
the shared tail page setup intentionally passes NULL as the compound head.

Keeping this helper in mm/internal.h exposes that special case to the rest
of the MM code and can make the NULL head argument look generally valid.
Open-code the initialization at the only call site so the special-case use
stays local to sparse vmemmap optimization.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/internal.h       | 9 ---------
 mm/sparse-vmemmap.c | 5 ++++-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index e16f1250b25c..5ddb49680b06 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -783,15 +783,6 @@ static inline void prep_compound_tail(struct page *tail,
 	VM_WARN_ON_ONCE(tail->private);
 }
 
-static inline void init_compound_tail(struct page *tail,
-		const struct page *head, unsigned int order, struct zone *zone)
-{
-	atomic_set(&tail->_mapcount, -1);
-	set_page_node(tail, zone_to_nid(zone));
-	set_page_zone(tail, zone_idx(zone));
-	prep_compound_tail(tail, head, order);
-}
-
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 70143dd8b579..e453ce4675a0 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -189,7 +189,10 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
 		page = (struct page *)addr + i;
 		mm_zero_struct_page(page);
-		init_compound_tail(page, NULL, order, zone);
+		atomic_set(&page->_mapcount, -1);
+		set_page_node(page, zone_to_nid(zone));
+		set_page_zone(page, zone_idx(zone));
+		prep_compound_tail(page, NULL, order);
 	}
 
 	page = virt_to_page(addr);
-- 
2.54.0

