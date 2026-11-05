Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881943;
	b=iTlbZsNC8BHwx+xIjpykiOYB+KEHs3nAHBfmGQcSGjFUgksqqG58TeuaWDYy4RG8anGy
	 DRJp45HSpI8D3xiv86MCtDaFYtsI11q9E6j0/dC3hoztp+//9fk3R7gJrHsMuqv195LEO
	 3SPTDfz20mqKZMzFI3697UJ0twekM3yATfTTR47LRmQcGQ1TlcX+UfqCNEv5u+zZRRDJG
	 M2kck3k7pxCHo8tvPuyP56qhSMtPakcjS2svgt04941IFWOqbXEUyOq+uBxRLJGGWucAp
	 s7xt3WfZGpp4Fa8+zoSj4FI+6aSIB4DySgcnGKnnIiWmkjhaxzMu+17c5G7XIXSumEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=bKGuzAUaHML6wkJsYB/5ryGtpKz03dwMg3XqSc0JR10=;
	b=bZs+Duj5X2wrQHCZoTMuaSsrEEqJcciFir2tu9KMeGKaVAHvQwOoIb4kB1BZsiMoB37C
	 3qqeJnScCvV3MS464UmBt1mhT7tdbVSoHmcyVpabU88Yl/IRgcEJxuNFBCT//O6OIotHb
	 c0COznx4kqNb6/LCX3mVVi0efRoCsFl7R6mw23AkhFtNh2S6UKy0rKMt3wlQJB0r8UT1X
	 93tiYdqOhp+CcRIWsYw6FumSBnECbYoLM2reOrfEKm68gWxqnkIXUR8qmAy25t4Bqisgn
	 zBTpzoddMicKZTPzRZl9/oC+ex7P3ppg/cmbwo+tohU9ynGdPLjkiLcO1IShTTc4Dkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsiszkq6;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E08606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsiszkq6
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36d6765756fso2063849eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881942; x=1794486742; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bKGuzAUaHML6wkJsYB/5ryGtpKz03dwMg3XqSc0JR10=;
        b=qsiszkq6wgIIY5dymhJ4OwntnzIgN8ILM1ZAEE82nyw6pVYBkmwXLfW/TcMzLKdeCU
         VjnQTl3z0Ke0lsEJoO1TScDJznH3zSPY4btbU/84M7l+VQRH87B4HgDBswDI0RqkcBlH
         +vF4U8R4NScWGa3kgCUUEaGhFH2id7qOTlf3Fa7agxAhg3D0T/eCUFf5E4IWS/aJ39+c
         4HWDap0OM0za/fAKrPsDLgFgpO4OtMjFmHz8siBZK8tpHKygxrM5X1DQVZjGwhwpPoKp
         WbpZZsmJDRztlm1b8qS3z1cvMuOvA8GeQ7s6vKrsxeeR03HvyaI/3m8bI8/RpyYE2uZC
         hGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881942; x=1794486742;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bKGuzAUaHML6wkJsYB/5ryGtpKz03dwMg3XqSc0JR10=;
        b=0Vu7XNJz0Zo2LnEUNoLL4JC+s6TqnkoMEaigqa8q3bYSsLFV/Ds6TLkRA6mLhA5E3K
         0Cj9Rm6n+0Z0N+O5hC4kgwitNJg4GHA2momA8EsC0sAIpWvm8h7PAkEruDaTu0omRC5+
         NUzrfjUvtMdceYPD1mdkC/zfZbx6c/1C2GcI9cCnaqwtnf5iGpXDPDFRg8ke2qan+yVw
         BGjWp1FzSrhOvG8GDSESapKFjIF+pqUmRGpEGUqLtQguGn6d2Ycdjd6hWJymGmw7LJy4
         vQFKZ9An1+CbU+buCcBrhUY1cnYy+3mZfhnF/1bzvusuoKslt8vNrE75N9b77zMKc8Kj
         z5bA==
X-Forwarded-Encrypted: i=1; AKwUvBxH7KDG3z0658JTd2dQRJrJ39CsKPWaWEdr//9St+DUIlIzbPynoVilvgfx1WmG0tvNWCnPM5JhNQSBSp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f4N7eRMyXb1d2iSZ3o29jCyX9SXWhftOhkgxv6Td+QPqlcaKq
	eEmH/kBQVGDYn/1idTohhr29wBftYEfMmdxb9YexwR6O6hufsUIxAKJk
X-Gm-Gg: AYBFou31mLEYC8zlcCEz6RAqueHjZWUMTtCHTyP3k9N2eZrv/GrQP4wNGo1Vp1Wp3K9
	zs73WHwqc9BdgFo7O5969Kopk/Zi8KFXn15MV/+ToLzTem3ohrYuIHaE2zuk6nDcwcg2TzOFpsf
	IAMCrU/7ZCV6SdsB6hWvrlcU0iKnWf1WvwRId2rDt+Oyu2ulf6F1H65g16pSehZ8sk67Z02q2KQ
	zPB9PySXCogvS87vBFiaJIjG7hsyY7AclpbC4nSVGWkQAm7tiQ1VpQLEAelzYrSsHv35XUHFIZQ
	BSUlX8M9pte/Bv1mu//O5s9jWxJEA8iez0LGRCuaY/vL+8PTgBHKQMkig6LUHYXpKzZsnaRGcRP
	DCZmvOIRC1nPs0WtUZwICRHhbP+F21nrEm3+ENkWmU12SEvvMPPHgYYy//haaFpMiL1gIBqJdy2
	Dyvca8SLFeeRs3LSksyNXJpMspMuBSZo8zsLnsI3nRwcLlpUpJGsUa4XH/kz/FbLGqW281kxuqf
	E7pt21NSZAyspKp196cgTC5CV5njonJtGDJo9Ssoi6tFCkYTrXpaI5bSVW+EWq+NBlK8ty/+hLa
	p1bxpU+o7HdEfvDPONuusIbLGoHkWqZ/lp8K1YY2WDu5UZA=
X-Received: by 2002:a05:7300:de06:b0:36d:2b02:86a6 with SMTP id 5a478bee46e88-36d2b028b7bmr5063810eec.4.1793881941559;
        Thu, 05 Nov 2026 04:32:21 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm21742977eec.23.2026.11.05.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:32:21 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 05 Nov 2026 07:32:11 -0500
Subject: [PATCH v2] mm/shmem: remove truncated folios from the page cache
 in batches
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
Message-Id: <20261105-bug-mm-shmem-undo-batch-v2-1-ae5f89ced044@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEp37GoC/4WNQQ6CMBBFr0Jm7ZhOVRRX3sOwgHagk1hKWiAaw
 t2tXMDle8l/f4XEUTjBvVgh8iJJwpBBHwowrhl6RrGZQStdktIVtnOP3mNynj3Ogw3YNpNxaFk
 pspUpO2LI6zFyJ++9/KwzO0lTiJ/9aKGf/d9cCAkvVXs6a9IdX2+P3jfyOprgod627QtJLB9xv
 gAAAA==
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
  ftruncate() to 0     1150 ms   917 ms
  hole punch           1165 ms   919 ms
  close() of a memfd   1153 ms   921 ms
  unlink()             1152 ms   921 ms

Files of PMD-sized folios take 18-27 ms with or without this change.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
V1 -> V2:
- Unlock the folios after folio_batch_remove_exceptionals(), as Jan
  suggested
- Rebase onto v7.4-rc1-132-g05441d697f7f and update the numbers from a
  new run

v1: https://lore.kernel.org/r/20261029-bug-mm-shmem-undo-batch-v1-1-59b34212fe78@gmail.com

To see it, fill and remove a large /dev/shm file:

  fallocate -l 8G /dev/shm/f && time rm /dev/shm/f
---
 mm/internal.h |  1 +
 mm/shmem.c    | 13 ++++++++++---
 mm/truncate.c |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

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
index af21a89abb0f6..2e51cc9c4c24e 100644
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
 
@@ -1363,11 +1366,15 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 				continue;
 			}
 
-			if (!unfalloc || !folio_test_uptodate(folio))
-				truncate_inode_folio(mapping, folio);
-			folio_unlock(folio);
+			if (!unfalloc || !folio_test_uptodate(folio)) {
+				truncate_cleanup_folio(folio);
+				folio_batch_add(&remove, folio);
+			}
 		}
+		delete_from_page_cache_batch(mapping, &remove);
 		folio_batch_remove_exceptionals(&fbatch);
+		for (i = 0; i < folio_batch_count(&fbatch); i++)
+			folio_unlock(fbatch.folios[i]);
 		folio_batch_release(&fbatch);
 		cond_resched_tasks_rcu_qs();
 	}
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
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261029-bug-mm-shmem-undo-batch-de001d9c6f1e

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

