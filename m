Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331905;
	b=0SC8Q2wz8/vsx7nkChgeUtzzydwkJvzjcHmntA26YXWJccIHMvGIYMyljXw5tbaHE+5M
	 Mr2egn7W5KqcJUpq1LapKvLIBOcvYhCk9r7B8mHvK12bzHyRlC0HytVTmOUgouAGhHZ5j
	 ejgG3+wteN0mj0MWbgzOzC2F3Acf5IUnq+L2XuccpcYXPsvqda0QHydzAZpR6JKIJ9tip
	 Oa9ReGFfr9I0XLjMtfAFF+aRt5q0jHi7CrClwIOsadeh2I1ORnqOmPahtMycnbkWxoKZu
	 ZFRUlwAVdrT9CZ4Z0JqfJEEgbg8VG1JV/q3+U/N9ed3vPbavwx0OB1KI4+57VkuKsew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=XtTfodCHuVaVxXQYCj+jpdhwMxAv9AL4leDlwu5qJfs=;
	b=Wq5SFiDdmJ5coVEbcnUOk+G19m61F2aiePRjOzYWB4DWRDlZu45+xXgyAQiaGHoCfyQz
	 4v2HyZdkApCyNLtVOETiX+p/SY+zGc7Ijeh6ClXBm8+Fv1SOyeuIJd/O+VzNSzQNl1jIq
	 f5+h68GgOPR5ENAJ0g5/ovwVVWfEVCdh5twSUUuCFCSjoZ9oa8YgyjfvI+Fzv1S9qFCRn
	 u1rzK7dq2T9esRQs5LwNJYxCr5MLMErCgRkHVykwdO7NEtUCR5JTnfjV809+XXfIkfDNC
	 MM0+HRRD/PN9RLSS7J4VHLiHZxlOViqCIQcPEApECl1CrU2v6S8T4fmIjcVw5iZguyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PABT4ghd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8255A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PABT4ghd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso504529eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793331905; x=1793936705; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XtTfodCHuVaVxXQYCj+jpdhwMxAv9AL4leDlwu5qJfs=;
        b=PABT4ghdsdEaAbxcck22S9YOkFFbrVGSoysOtNnGZC6p4e7k7dwv+OQSy6q+Y7/ejd
         svT7Y+G4XctRZwkKrKiOlnL0z6qn498DowhfqQpSx3pPIgemwYeenvzjr/UR8UYTIGvg
         yGw7Bb+x7/rAn32XqGuhPBo6wzlnuJ7o9PYuUWBkwU2ZMuK0OdQDrWB6qdvcKI1FjZ/N
         Trx/MBJbben51Spfts0XgjAxjitB/Y10m3JExk141IdJpppfD/C+jEyf/3kHd8pDuVkh
         J+PWZ5Mq8iVOpn0rEzmxuDI0+MP+jCzbqF6wVYaQ4+qHk39AZGNgWE/uRzWj+ZmjGJCf
         ehfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331905; x=1793936705;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XtTfodCHuVaVxXQYCj+jpdhwMxAv9AL4leDlwu5qJfs=;
        b=uW0vfwgg7TCyT1X5lXEVklopke0voKdZiJc+9JC+simfxCZcdwLBbJlBosrXUIdGBl
         d67sT8BmLlQonOozkrO3EU79Ue62zs3mMEJQ9ORSW7mPrlRV78OmqCBamvmxmctFQP+5
         KRpseJ/5fzIsAqB+tQNGCkLVwkqew83tRRzXyFB0Zfr2ugPPBUGyQrlcnXLuiA9Y8laJ
         c1DGAfgVeuq+/oG1QWa9LX0J0BH8Nn2+S6b1v2BNkx6P/AOjrKsoBtACDBGbTgtd40b8
         2hpPB/PPzbXgGjKwPQMboCQVgSvwmNiHnXg9taDy4622fxamoVtOxKe2mTYxYqtkk7nG
         J27g==
X-Forwarded-Encrypted: i=1; AKwUvBzFCxY21sStggozYRsdnY+5TGfbx3BdVii4vrqHhxx8+43Nl1rOad9P36YSGYNSOW7o0mRIyd0lCBTblHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGWRWXLou7Rr3VSyl8gCCDnhfmu1ndVi+b2de31yUnlJ+FazE5
	THhbE+v6YXkE1WRYsMkUMwkvpDY8csX2qDZpfepEzaDt2/rl+eahj8tB
X-Gm-Gg: AYBFou3SFWiyS7yyQvYlbgT05jpdWKHEeHhGQYtetfz98BA36yj1tc9B59Uvbmrlsfx
	aaQafEUPThOetegwyLyVRfJ51t2SzOWQ1gzMU05ctg5ACJe78ep75fQV3AF1cCxvgRu4Nf/cZ1w
	0ZfD5sNI1CZaHkqUxDnVFnt7CE870p291FWY9iXlNRYNOq9dK7cTUsXqSlTVEX3MPszwyqlJ5Eg
	z9xfZ3R+voEz5otqZa0ogvVepPULUk/pZLXmgvxejzbGfI6EEsJwMU1vbKyUydhi7aMpiqYSc1r
	EkVmXXfs6ELKlBVxhDwHDh0phw6yJMO+EYedvxmKY0pXBC9YXK17rvVG9BWpv98XBEloPa/OqPF
	KklYxmDp/xfX25IqmDpqu5LFvK74yYVXTszCYqVs7FK/DLal79pdZNtE2TC/WRA/Kqz24mdl4Ux
	TBdTpF3GnuP8w1INpWPniLLu6L/nd14l/q/fDnPK5uWbzZXwsE4ZpSzqquqnbBgy6I4YB6SJTKZ
	W2mUdJ0phJGEoLJXIyiXgIpoSxzPTOYh4ZwKi38+vvP903ZpnUqd5MRGS4EdkKaXClilZMk3Trx
	5NB4FjW+hcoVFSojQ8jF/IGE
X-Received: by 2002:a05:7300:c8c2:b0:36a:117:522a with SMTP id 5a478bee46e88-36a423bf71cmr1949263eec.22.1793331904245;
        Thu, 29 Oct 2026 20:45:04 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm2836585eec.5.2026.10.29.20.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:45:03 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 29 Oct 2026 23:44:57 -0400
Subject: [PATCH] mm/shmem: remove truncated folios from the page cache in
 batches
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-bug-mm-shmem-undo-batch-v1-1-59b34212fe78@gmail.com>
X-B4-Tracking: v=1; b=H4sIALkS5GoC/x3MQQqAIBBA0avIrBtQF4JdJVqUjjkLLbQiCO+et
 HyL/1+oVJgqjOKFQjdX3nOHGgS4uOSNkH03aKmNktriem2YEtaYKOGV/Y7rcrqInqRU3joTFEG
 vj0KBn/88za19Dg1HF2kAAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

truncate_inode_pages_range() takes the folios it finds out of the page
cache with delete_from_page_cache_batch(), which takes the inode's
i_lock and the i_pages lock once for each batch of up to
FOLIO_BATCH_SIZE folios.

shmem_undo_range() calls truncate_inode_folio() on each folio instead,
so filemap_remove_folio() takes and drops both locks once per folio.
Truncating, punching or freeing a tmpfs file or memfd made of small
folios, such as a large /dev/shm segment, pays for that on every page.

Clean each folio up as truncate_inode_folio() does, collect the ones to
remove and take them out with delete_from_page_cache_batch(), which
needs truncate_cleanup_folio() outside mm/truncate.c. Swap entries, and
the folios kept when undoing a failed fallocate(), stay out of the
batch. Dropping an 8 GiB file of 4K folios, median of five runs,
averaged over two boots of each kernel, in a 32 vCPU VM:

                        before    after
  ftruncate() to 0     1163 ms   913 ms
  hole punch           1155 ms   914 ms
  close() of a memfd   1161 ms   914 ms
  unlink()             1162 ms   916 ms

Files of PMD-sized folios take 20-25 ms with or without this change.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
To see it, fill and remove a large /dev/shm file:

  fallocate -l 8G /dev/shm/f && time rm /dev/shm/f
---
 mm/internal.h |  1 +
 mm/shmem.c    | 16 +++++++++++++---
 mm/truncate.c |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 566cbd2dce485..abe64e49a4170 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -628,6 +628,7 @@ unsigned find_lock_entries(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, struct folio_batch *fbatch, pgoff_t *indices);
 unsigned find_get_entries(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, struct folio_batch *fbatch, pgoff_t *indices);
+void truncate_cleanup_folio(struct folio *folio);
 int truncate_inode_folio(struct address_space *mapping, struct folio *folio);
 bool truncate_inode_partial_folio(struct folio *folio, loff_t lstart,
 		loff_t lend, pgoff_t *pstart, pgoff_t *pend);
diff --git a/mm/shmem.c b/mm/shmem.c
index af21a89abb0f6..16b6e38503bc3 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1352,6 +1352,9 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 	index = start;
 	while (index < end && find_lock_entries(mapping, &index, end - 1,
 			&fbatch, indices)) {
+		struct folio_batch remove;
+
+		folio_batch_init(&remove);
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
 			folio = fbatch.folios[i];
 
@@ -1363,9 +1366,16 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 				continue;
 			}
 
-			if (!unfalloc || !folio_test_uptodate(folio))
-				truncate_inode_folio(mapping, folio);
-			folio_unlock(folio);
+			if (!unfalloc || !folio_test_uptodate(folio)) {
+				truncate_cleanup_folio(folio);
+				folio_batch_add(&remove, folio);
+			}
+		}
+		delete_from_page_cache_batch(mapping, &remove);
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			folio = fbatch.folios[i];
+			if (!xa_is_value(folio))
+				folio_unlock(folio);
 		}
 		folio_batch_remove_exceptionals(&fbatch);
 		folio_batch_release(&fbatch);
diff --git a/mm/truncate.c b/mm/truncate.c
index 733d2713a875a..c6bf4aa0b91e8 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -151,7 +151,7 @@ EXPORT_SYMBOL_GPL(folio_invalidate);
  * its lock, b) when a concurrent invalidate_mapping_pages got there first and
  * c) when tmpfs swizzles a page between a tmpfs inode and swapper_space.
  */
-static void truncate_cleanup_folio(struct folio *folio)
+void truncate_cleanup_folio(struct folio *folio)
 {
 	if (folio_mapped(folio))
 		unmap_mapping_folio(folio);

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261029-bug-mm-shmem-undo-batch-de001d9c6f1e

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

