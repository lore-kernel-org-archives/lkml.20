Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314B37998A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294312; cv=none; b=B7XNBbgQhI7ljcCp5eU+B+wZa4jRmUcKrOAHRcmfGkEyAzfb70QAnY9wgRTkFxpCfk96z4BtROOpOtYj8A356sNMQ1DUK9Tyxo2W8N7kK6avBcEDf4xQIKystTz6ieecKPFIdgpqjd+uuGh+O78JQdzxngLKKA2GhGcsxBCLFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294312; c=relaxed/simple;
	bh=KietCs4BX3lxyQLZunvdOXE6odQUFp6p2hpUdp5Ba4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uf1bpkCbZaOikc6U4Ci8+4ehyXpAmcNvzB4qwuR2pyN+4vODvX5BAnsHTioQQzHp68yMIYXbgNPvOCkUztsAnWFAqncI5pf7B1cM+BBgRtCea4tJpZKPu6c2MuEkRXbSQnQrzgNN6srxoxjjnQUDZPrgCFYzcuMYul4ok/vz/fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdasHIvF; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdasHIvF"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so832616b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789294310; x=1789899110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwdi/6Fr4s2UCykzftMpLqN1YkG8FoctaI5sNGgltcw=;
        b=BdasHIvF45QisrakrWhtyLr2pSAu6kBKMhmncqKz8N+5G5LN6DXeeMTomJZwhrbXYS
         mHFA05nwONniswfBSwrTckqGEMsi/Xs91TbWFDilCjyiJzFXKBejcEPz+wKVag6a3FIB
         yo64Y2IHGDws7bw6eYwwSib+DyB+UKjAPLZ85UARPb0PPfVMBx82vtNdCx6/LdG7+VVc
         4Zfu6asDVARlgx82zkhHcC3X+DqZVIjgIiNJxUOLCRCV1v4AFBLEKXg5joAxNG0elXE5
         ig115llSFloNx9Cf33pgwwE2rKuZYb1UJnBG60u6MOLkn89c8RXGPO9rCehruxJuZ2Ez
         eXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789294310; x=1789899110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwdi/6Fr4s2UCykzftMpLqN1YkG8FoctaI5sNGgltcw=;
        b=dAL/kFL4GH+edjjQ43wYfYNvKOAKm5sTARz7oNVD10LT6YRqKllaxfrf202AY0wfsz
         yj08uUBcGHsH/WiYF8/+vZx/xDWawyOmbfV8oKoeUZgHIRpFBMTjF4GCFqqjqf0etIRM
         nq4LJFRUEcGN6U2pkYIJo5YK8gmRITC9W23quooG0wz6fTLQfbX6wdwVWaxJ7ZjWvKLe
         KlexOVxMb9G2wXkW9bYZRHqB9xYekBvqWRa0cBjGYEY4NJxi3/lKKA8AzuwuvRD3I9IY
         Lye1glXpBXXVr4IUUioBU/j9tsRykysMhTgiKGEAxiNaeo6clXrY+ZO2YxbrKNu/WBC9
         0OSQ==
X-Forwarded-Encrypted: i=1; AKwUvByVSG2Yy/zL5LyPzLLrmm0O1EA8G5JsTKnK1rVc9v1w5SgNfRZPUTfOgSaRhjbCBcOWob5P6+HV1FKTisI=@vger.kernel.org
X-Gm-Message-State: AFuF++nXzefv5Hr2Bx7Ct37dFR39FP96GFtXPnA3lzmojsiDN9aEwzWp
	tWsACq0iY3JEK/SwW83k9s23V02RLjI3zgpgk7HOH8ZsBC6XrI2peoR+
X-Gm-Gg: AYBFou0mNoEcljAyl30dOM61UkCm84kotSHvr+919wpxWETFew/Ad9193GUZnEljEMU
	7+VNhgt+PTkhgacqB/3uSitvlpi62wauwyX5pvtWPQfTpoCpDh3RzjE8IREmpjamFwCdmmn2eV+
	1X5ke9rEHj0mgivGMSbbI+5QVeLtN1rfieSxEoi6KGvBADe5F1yJAT7JWGr10QBQiN7Sir39JCq
	tFWBvtYfLfPZn2pndbyp246Gtar4btGOOuN0miN5Ksgb+ynEQuxEU1sCYWfaL8zKy1uDehsffu4
	h17hFynj5yceWZ15BsF7my7ELnU41oL/OTLoOW4mgEVfDxOaSo7LsQnAO8QZuwfDf8J+b6/rQL+
	t/Vbd7Wt0/t1oWAD48xHT+NWSu7OvhV/cSsjk/54EUTe8OTJDP4X5dnpuwipVN3VU3Cx58R2kWq
	YQL8OY49uixNQVO05swZ0DvWEJRfwcJDokEbuq/ry7U6e/iIBhYHAhDObnBOgdgw3NBsfYbu3fY
	JOwZRO5XFuvJe40yA==
X-Received: by 2002:a05:6a00:4f85:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-86b318fd2e4mr17232792b3a.16.1789294310240;
        Sun, 13 Sep 2026 03:11:50 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:f608:4e94:6df6:c8b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3141397b3a.42.2026.09.13.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:11:49 -0700 (PDT)
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
Date: Sun, 13 Sep 2026 17:11:42 +0700
Message-ID: <20260913101142.28802-1-ngocthang2710.1999@gmail.com>
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

