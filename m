Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E3361976
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789317414; cv=none; b=YWTeWtxvonGWodnc2XRkMsoAAeBcgIJjNWYoskyGQYnQCVNqp6XXCh354Bak9CIvL0teHCmG9WsoLH2lvKL5SeMUOJ8J18I57P+J2RSWJcu+Ouexzhyqiw4ndeTF/gSCoKeU32B1U+tBwg2TIiG8e6r+9N+DdydEU+FM3xWdNME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789317414; c=relaxed/simple;
	bh=omTRyQ8KIHKlmOf/y8PXJ5ubt3DfOl/Jptz4Gjg0qb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDYlES6e9QGOZ30IhzokHq/KaoFysRE49xAtYBsa09pJxt4095FBbhUmCtesNFl/tyCLK+j6PRLjoRcNvfEJW23h1vj9zkCdgHTUhozBRItJA27X9+fwK760slf8/VsrZXsQA50KWG67EG39A46lE/F3OVm0SS44FRUbAr/hFS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVuP130Q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVuP130Q"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so9917145ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789317413; x=1789922213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OFZoxZdendLiI0c2ZwgOt1fV1G7t70nnE2lAiT2KzM=;
        b=hVuP130QawHudpY+AIbAA1bD43aVbuAYP2NEqWp/KTXMPDNhinqx0ghfdV55A1j+7v
         6FAsmQLxaTlJVObxXaYhWaLlN9XmysSQCbMomqPEvxLmq7PTNLTgiuKv0kReRhhHOkNz
         ulR1sE5f3RW1C778EoJb8lQrcCDpjrqjfBABR0zEvFOcXAXDIemx9XejGqfQPQDImyht
         7RGgQCMspPEntftCjc1V6MrkTJd7fdQ2w+Cndr5+I6jMK2yqVxOhtzD+BeJzZ3OX15qx
         j1JE224qTdoQWwcYgL8pCV4qPF02NodGTZDxSsMxO1ICTsIre8cSo3uetjrJjMN75SoT
         2Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789317413; x=1789922213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3OFZoxZdendLiI0c2ZwgOt1fV1G7t70nnE2lAiT2KzM=;
        b=Yi/fFTU+17j5+4n3Q4LmIV02IU9pmrUPvs4NnGiLtKEFZwtz9tg+2kgfveaZvHBmzI
         yRP5hXhpEmMYx606xn7IArH7fsFTSrKlnGRKn0E8LOV5VeExTM6KCRTBDnLQYSl4A/vX
         fSRCfyU/8iPDyUK1coUZRIoVdJ5r9MlqbmsfBvcP6LqueJt0f3GeBv4zOUV0Q/EeSRbH
         elfn6hZNv3SMvIkuDTqrBXl/jej8wkFGn/rx1r8G7OYzKRBhHypB3jyZb+xzgP6pKN54
         d77MvR8LGw3M39Tov18BKnt9fDGeTCMQ7X8d2n3FrxX1ColPPmx4zAVrxw3z1XF8hOD3
         skpA==
X-Forwarded-Encrypted: i=1; AKwUvBywlXY9CC+0uhetFdA9A9P1/q9cn107yZD4ZhYM08EEq6wf00yIIBkevhfRbKTkYRxpMwHHs9/7cvheJjI=@vger.kernel.org
X-Gm-Message-State: AFuF++nx7Hbi4anb+mVHIUCGiv60AwElA8VbiVG4GWoMAxUh5psEk2A+
	+LeynasOkQEv7dSxRQrY+rriq+9t5IcLO3g+4+ehiqToy7SWeVQHcBXM
X-Gm-Gg: AYBFou2BMVO4iboI4xsb/wuvNVdCFzPxPYFfg3uLBis+vgqqHKKITSF4Ew1nRhfDIv0
	R/AuM2npFssa1fHWv4eMD1MSIBPe0K4MF3M1G9ZtTw4O8vehws9PA8NCdkMWTnTtOqWgzngbWkG
	+wIS9mOIb+m6Ca9wVJDswOO8J9jB6jGvBQFb6jc8newT0W+hZH0gKuN3Tp3414RnpzYINq1N564
	kUk8dHvcamBTdvM7UBYRoxV1ebaAnpqUNxY0CQZcIrOeqqq2tlYmWHGMCmTF+XSphb03rOTVvqb
	naFk4nN83eSuARTzCharjDt5Z3N/v8slpKe1WJFThCHpW/4iqf43mXl6DSxHW04AxBcLpvP1Fx7
	twuVPKz4LRVTtOL7IMnkGtNkk7Ruyyan+1+TdGDXT+Kgah4TTFc1B5ITjW5F4xWJEnH0WbRlZUx
	4XqXjrPzKgll4lG5YD00UucSlroEHDMfPoNBRqy8sPAM1ziGw1+q9VKi4h78piSMY+zMDDsek1s
	O1G4S9LRfk0VOavmg==
X-Received: by 2002:a17:903:1a4c:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2dd4bc33217mr145184825ad.5.1789317412610;
        Sun, 13 Sep 2026 09:36:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:f608:4e94:6df6:c8b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb3bd7sm35299925ad.34.2026.09.13.09.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 09:36:52 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] khugepaged: hold invalidate_lock across collapse_file() readahead
Date: Sun, 13 Sep 2026 23:36:44 +0700
Message-ID: <20260913163644.122133-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DLEBZ0GIGNQ8.17U563YYJ37AA@nvidia.com>
References: <DLEBZ0GIGNQ8.17U563YYJ37AA@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_file() calls page_cache_sync_readahead() to fault in missing
pages before collapsing them into a THP. That helper takes
mapping->invalidate_lock itself for the duration of the call, then
drops it -- but truncate (e.g. ext4_setattr() -> truncate_pagecache())
takes invalidate_lock and then waits on each page's folio lock while
holding it. If collapse_file() has already locked one of those folios
by the time truncate reaches it, and then tries to acquire
invalidate_lock again (e.g. on the first readahead call, since
invalidate_lock is not yet held at that point), the two paths can
deadlock/hang on each other's lock: truncate blocked on the folio lock
collapse holds, and collapse blocked waiting for invalidate_lock that
truncate holds.

Reproducing this over ~150,000 collapse iterations with truncate
racing concurrently reliably hits hung_task: blocked tasks within
about 20 seconds on an unpatched kernel.

Fix it by taking invalidate_lock_shared once for the whole scan, after
alloc_charge_folio() succeeds and before locking any folio, and using
page_cache_ra_unbounded() directly in the readahead call site instead
of page_cache_sync_readahead(), since the latter would try to retake
the lock we already hold. page_cache_ra_unbounded() does not clamp to
EOF like the helper it replaces, so clamp the requested range
explicitly.

730633f0b7f9 added invalidate_lock acquisition around readahead but
missed collapse_file(), which already locks pages while calling
readahead; later filesystem conversions made the deadlock reachable by
taking invalidate_lock before waiting on page locks during truncate.

Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
Tested-by: Lance Yang <lance.yang@linux.dev>
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2:
- Take invalidate_lock after alloc_charge_folio() succeeds instead of
  before, so allocation/charging stays outside the critical section,
  and skip the unlock on the allocation-failure path (Lance Yang)
- Add Fixes and Cc: stable tags (Lance Yang)
- Add Tested-by (Lance Yang)

 mm/khugepaged.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 11ff98d55c76..a5fcafd57505 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2257,6 +2257,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	enum scan_result result = SCAN_SUCCEED;
 	int nr_none = 0;
 	bool is_shmem = shmem_file(file);
+	bool need_unlock = false;
 
 	/*
 	 * MADV_COLLAPSE ignores shmem huge config, so do not check shmem
@@ -2271,6 +2272,15 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	if (result != SCAN_SUCCEED)
 		goto out;
 
+	/*
+	 * Take invalidate_lock before any folio lock: the readahead below
+	 * needs it, and truncate holds it while waiting on folio locks.
+	 */
+	if (!is_shmem) {
+		filemap_invalidate_lock_shared(mapping);
+		need_unlock = true;
+	}
+
 	mapping_set_update(&xas, mapping);
 
 	__folio_set_locked(new_folio);
@@ -2337,10 +2347,20 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 			}
 		} else {	/* !is_shmem */
 			if (!folio || xa_is_value(folio)) {
+				DEFINE_READAHEAD(ractl, file, &file->f_ra,
+						  mapping, index);
+				pgoff_t eof = DIV_ROUND_UP(i_size_read(mapping->host),
+							    PAGE_SIZE);
+
 				xas_unlock_irq(&xas);
-				page_cache_sync_readahead(mapping, &file->f_ra,
-							  file, index,
-							  end - index);
+				/*
+				 * invalidate_lock held above; don't retake it.
+				 * page_cache_ra_unbounded(), unlike the readahead
+				 * helper this replaces, does not clamp to EOF.
+				 */
+				if (index < eof)
+					page_cache_ra_unbounded(&ractl,
+						min(end, eof) - index, 0);
 				/* drain lru cache to help folio_isolate_lru() */
 				lru_add_drain();
 				folio = filemap_lock_folio(mapping, index);
@@ -2672,6 +2692,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	folio_unlock(new_folio);
 	folio_put(new_folio);
 out:
+	if (need_unlock)
+		filemap_invalidate_unlock_shared(mapping);
 	VM_BUG_ON(!list_empty(&pagelist));
 	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
 	return result;
-- 
2.43.0
