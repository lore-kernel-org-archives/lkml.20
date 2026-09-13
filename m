Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2B3A1CF8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294111; cv=none; b=CvpJz9VHBfh+zR9f7dK6RVwDT5YQrGZapHrfL8rztObug4OL+5BUO+KLcbV1YViPnLeTmAH43xGTJ1bsEI1IrRUtOdS/lH95M2urnK9a49Ln2aygoMeITFC7Ce88aZhktZlpAPKTAiZ/Gtafs3f4NgtKQjSyDOpy+aky1rlhAKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294111; c=relaxed/simple;
	bh=KietCs4BX3lxyQLZunvdOXE6odQUFp6p2hpUdp5Ba4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8cThGfxD4Zwfauo6dFm4UPjqOSZvIw0dZZaeLjYb8I0fzpcMWUcCnuzRPRE9KBGeKfkSJRXICJFwccFxCO9SBGVigkEtbsS7Gmbz3B8MbMgLsMlbxR7I3z1CxN4+dHJC6Oa3eM8tJ7yLkvz1ATmsPaUJEX6g21zOgK9wpzO4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnFgQpsz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnFgQpsz"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b350c6920so761202a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789294109; x=1789898909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwdi/6Fr4s2UCykzftMpLqN1YkG8FoctaI5sNGgltcw=;
        b=qnFgQpsz9HWBn6c9oYUc5yCnEmYV6RM1FBRTDZE66pw0dKcWC45LYgPqh6ivBPrOQO
         C4oCURS2IiJ6KcQIVlcSpfC1BkPm5HHDba6vcrM2Gq7wayBu663zigcy16dmwWx4qOac
         AV/nulB341N4d7zqrXm13rwaNpgJejnLWg6iemzzkWmSVFtPsSqlwbzo2mveqAI8UfWm
         mWgzbSQSl3kZipC2iGlw0fTfCLYPezvbV9JyHcZ/Ps4je1k9AlTO+o4LuxXvzFy8UuvG
         HFB/cioyYZfU9mzrlwkRVJ/AH9i0Oe7szWNaSBbtQPoQBS6FZTN1qqa9w9+WFIP382ga
         bi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789294109; x=1789898909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwdi/6Fr4s2UCykzftMpLqN1YkG8FoctaI5sNGgltcw=;
        b=TY7gBcjN25tMVEUSM5YXkVkFHDMnlapef63ftt+04pR/b9bAUbrQYBUuRy5vF7PRT9
         MX67sRqqOdUlmNKgON7G5w17qssRnkRRsqjV9R6uHDYWliESZ+ewfNaGrhBjef510Zwo
         CmbkmLYuyjp4MMRhWzU8IcKohe9tC+pav+6JXQ6bz554TEpCvFtmcQiCKxKXQuoCJBuh
         AT0YMETQe3zvd4Mha5M309wcZOxldsZ8pKL+Q1nGrUcbkbeMZxE3QIxj7Zqwi7aQ7QrM
         m/tUERk+5gnSeEXjy4RC0n+dAYcR898V7aRZXPgDPviP/jhKDnowPjDqKl1Nl0Ld4R6+
         cO+A==
X-Forwarded-Encrypted: i=1; AKwUvBzmCSitthF577/Y3HtA+QoGMWR5dEplw4Mmth5StDJ55KNuWChtDyElxf5KBKHdUhG5lA9+8TGv4X67MjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++no39iM6b4S6h0JSzizNtCBxmqXifIWN7sP5P/0PBMRldYUxiXx
	AbUGizHdKijTj1Nec2xrm/DPRy0//pDPeSDygM/2zJbZ9DSx5VC4UHzB
X-Gm-Gg: AYBFou0d2jdflXE7Bg9HLtjTpZg0Omies+ICiQmM3vqcNqPQO9U5PEtyPWSDAKaYAD8
	TeSIfPBUt6ZMlZMEibhQMtCBs4P4Xo8edycfhvJ+IwQD7nBfEP9ll8rbDfqHQEby0d3bGE+MoGe
	O/vS5SN4LivlQvCWTy2rE8EpjenH+xU+9rkcYZ4EgDsoRMbBiS7WIRV304NxgLWPl3mHQtabJ+2
	TVNmIMz1XLHdvSlKjftgrEJFJfUwJuzn/JzGyDYT2h6hjWngoJrKGFbI+sOREnpKoKv2PuPNEMa
	QYwLVORVgCnTpR/agFcHF5rLRNGq+ejcIpkshOWr6BEuDtrF4wAMJLGMG8QOOS3+wgEtwT6nsaD
	IQGFRJ/YEBA9rZBatTtCfCdJ5kYa3GNvYAuWq2U4H2QonX4GMfcaUIvX3dIAOOs7fKOjWa/RgFn
	XaIo7znLZwpGMfuB21zOV9Blx9Qr/5fRPh9F3rG/I9OpOEcO7DWu7JAhPcM4j5ZslqO3pL8w4ID
	f7CUBxcOte+NFEwxA==
X-Received: by 2002:a17:90a:e7cc:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39dbbe86048mr11329558a91.1.1789294108871;
        Sun, 13 Sep 2026 03:08:28 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:f608:4e94:6df6:c8b4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d5cce86sm4597773a91.4.2026.09.13.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:08:28 -0700 (PDT)
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
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] khugepaged: hold invalidate_lock across collapse_file() readahead
Date: Sun, 13 Sep 2026 17:08:20 +0700
Message-ID: <20260913100820.28654-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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
invalidate_lock again (e.g. on the next iteration, or via a nested
readahead call), the two paths can deadlock/hang on each other's lock:
truncate blocked on the folio lock collapse holds, and collapse
blocked waiting for invalidate_lock that truncate holds.

Reproducing this over ~150,000 collapse iterations with truncate
racing concurrently reliably hits hung_task: blocked tasks within
about 20 seconds on an unpatched kernel.

Fix it by taking invalidate_lock_shared once for the whole scan, before
locking any folio, and using page_cache_ra_unbounded() directly in the
readahead call site instead of page_cache_sync_readahead(), since the
latter would try to retake the lock we already hold.
page_cache_ra_unbounded() does not clamp to EOF like the helper it
replaces, so clamp the requested range explicitly.

Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 mm/khugepaged.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 11ff98d55c76..690ccbcdf593 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2267,6 +2267,13 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
 	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
 
+	/*
+	 * Take invalidate_lock before any folio lock: the readahead below
+	 * needs it, and truncate holds it while waiting on folio locks.
+	 */
+	if (!is_shmem)
+		filemap_invalidate_lock_shared(mapping);
+
 	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
 	if (result != SCAN_SUCCEED)
 		goto out;
@@ -2337,10 +2344,20 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
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
@@ -2672,6 +2689,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	folio_unlock(new_folio);
 	folio_put(new_folio);
 out:
+	if (!is_shmem)
+		filemap_invalidate_unlock_shared(mapping);
 	VM_BUG_ON(!list_empty(&pagelist));
 	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
 	return result;
-- 
2.43.0

