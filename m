Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5827541A569
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373814; cv=none; b=TcJUuvHr891fRamnN3255m6rRapnHx1eQNKgBeNbvYXnkNL1TnstzhtmcyafMvqmAJXMSoZBRgACD7UWVxZq4PHaDOTmCPSTzO429HpaNBzcFic/ocGbeP7LeTS17+fmFS/s616c3thU888HeIGR1m5XwLvGRSEzEN3SsfZNK3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373814; c=relaxed/simple;
	bh=wGr9t/s4DyDBnQa9SPI4d2fCf7BpY9oSx1ZJPLeAXWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhb4K9VRmXSH/vZ55zorNZDdonMsMBCvgAk5NZVkQ8sh/dlmY6g7NP9DDluA+oUVyOD01RM1xwWUksNcnj4Wz7RTEYYY98hGotw2jL3bdQSR1GbYKLOIRUiQe8BiKEB6ZV3R4JBTfdYfjpZSHrGSMnuzl6hjaM2kyRspt1uzmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RreF8+oR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RreF8+oR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DBF1F008A0;
	Wed,  7 Oct 2026 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373800;
	bh=x41muMHTfMYZOVwgw5U3Ok4EV+qcMUNKpCjaY2C03kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RreF8+oRw/MjNGMozbyaHuQ1Huy01BkG5v0ePhuNVvkMBwvM3RcfcoOM/B2ykFLCF
	 bP8ZrC3DiSMkCQlqrqFnhwqUktIc1k01bVPmPglJsti+zUDUs8DcjOAPBtmFjXTmM3
	 CIgGb0n//562HDLc9CiL2WkHL6nM1D6EvMSKPi8G5RYIZoxwfGGhhQg4V39uzEdxVR
	 Isw0S6a5U3sHW2LbE4pzxXn8l2lMjdQGZiOaGra34BkHfGs/boZAZIX2pgSBJvbYPI
	 VtXgKCaPv8i5+ftRW25SJ6jxe4KZRi7yyjtsKla/SU9ybQTWul8R8k9nKNAr3wr+pX
	 ZwDk/vkboQqaA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 4/5] f2fs: cache: support asynchronous write_end_io
Date: Wed,  7 Oct 2026 11:49:48 +0000
Message-ID: <20261007114949.2428048-4-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261007114949.2428048-1-chao@kernel.org>
References: <20261007114949.2428048-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

Currently, f2fs_cache_write_end_io() synchronously traverses all
cached blocks in the write bio to perform node footer sanity checks,
warm node cleanup, and writeback completion. If called from atomic
context (e.g. interrupt context) with a large batch of metadata
blocks, this traversal can induce significant IRQ latency.

Furthermore, f2fs_write_end_io() already implements asynchronous
offloading via workqueue when in atomic context and exceeding the
max_atc_write_bio_size threshold.

To avoid code duplication and mitigate atomic context latency for
metadata cache writes:
1. Unify the write completion handler by pointing all write bios to
   f2fs_write_end_io() with bio->bi_private = sbi.
2. In f2fs_write_end_bio(), check f2fs_is_cache_bio(bio) to dispatch
   to f2fs_cache_write_end_bio().
3. Simplify f2fs_zone_write_end_io() to call f2fs_write_end_io() directly.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 92 +++++++++++++++++++++++---------------------------
 1 file changed, 42 insertions(+), 50 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d4ba5e77906..0a6aa24caa07 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -298,6 +298,40 @@ static void f2fs_read_end_io(struct bio *bio)
 	f2fs_verify_and_finish_bio(bio, intask);
 }
 
+static void f2fs_cache_write_end_bio(struct bio *bio)
+{
+	struct f2fs_cached_block *entry = F2FS_BIO(bio)->entry;
+	struct f2fs_sb_info *sbi = entry->cache->sbi;
+	struct f2fs_cached_block *next;
+
+	if (bio->bi_status != BLK_STS_OK)
+		f2fs_stop_checkpoint(sbi, true,
+			STOP_CP_REASON_WRITE_FAIL);
+
+	while (entry) {
+		next = entry->next_entry;
+		entry->next_entry = NULL;
+
+		if (f2fs_is_node_cache(entry)) {
+			f2fs_sanity_check_node_footer(sbi, entry,
+				entry->index, NODE_TYPE_REGULAR, true);
+			f2fs_bug_on(sbi, entry->index != nid_of_node(sbi, entry));
+		}
+		if (f2fs_in_warm_node_list(sbi, entry))
+			f2fs_del_fsync_node_entry(sbi, entry);
+
+		dec_cache_count(sbi, F2FS_WB_CP_DATA);
+
+		if (!get_nr_caches(sbi, F2FS_WB_CP_DATA) &&
+				wq_has_sleeper(&sbi->cp_wait))
+			wake_up(&sbi->cp_wait);
+
+		f2fs_end_cache_writeback(entry);
+		entry = next;
+	}
+	bio_put(bio);
+}
+
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -306,6 +340,11 @@ static void f2fs_write_end_bio(struct bio *bio)
 	if (time_to_inject(sbi, FAULT_WRITE_IO))
 		bio->bi_status = BLK_STS_IOERR;
 
+	if (f2fs_is_cache_bio(bio)) {
+		f2fs_cache_write_end_bio(bio);
+		return;
+	}
+
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
 		enum count_type type;
@@ -404,45 +443,6 @@ static void f2fs_cache_read_end_io(struct bio *bio)
 	bio_put(bio);
 }
 
-static void f2fs_cache_write_end_io(struct bio *bio)
-{
-	struct f2fs_cached_block *entry = F2FS_BIO(bio)->entry;
-	struct f2fs_sb_info *sbi = entry->cache->sbi;
-	struct f2fs_cached_block *next;
-
-	iostat_update_and_unbind_ctx(bio);
-
-	if (time_to_inject(sbi, FAULT_WRITE_IO))
-		bio->bi_status = BLK_STS_IOERR;
-
-	if (bio->bi_status != BLK_STS_OK)
-		f2fs_stop_checkpoint(sbi, true,
-			STOP_CP_REASON_WRITE_FAIL);
-
-	while (entry) {
-		next = entry->next_entry;
-		entry->next_entry = NULL;
-
-		if (f2fs_is_node_cache(entry)) {
-			f2fs_sanity_check_node_footer(sbi, entry,
-				entry->index, NODE_TYPE_REGULAR, true);
-			f2fs_bug_on(sbi, entry->index != nid_of_node(sbi, entry));
-		}
-		if (f2fs_in_warm_node_list(sbi, entry))
-			f2fs_del_fsync_node_entry(sbi, entry);
-
-		dec_cache_count(sbi, F2FS_WB_CP_DATA);
-
-		if (!get_nr_caches(sbi, F2FS_WB_CP_DATA) &&
-				wq_has_sleeper(&sbi->cp_wait))
-			wake_up(&sbi->cp_wait);
-
-		f2fs_end_cache_writeback(entry);
-		entry = next;
-	}
-	bio_put(bio);
-}
-
 #ifdef CONFIG_BLK_DEV_ZONED
 static void f2fs_zone_write_end_io(struct bio *bio)
 {
@@ -450,10 +450,7 @@ static void f2fs_zone_write_end_io(struct bio *bio)
 
 	bio->bi_private = io->bi_private;
 	complete(&io->zone_wait);
-	if (f2fs_is_cache_bio(bio))
-		f2fs_cache_write_end_io(bio);
-	else
-		f2fs_write_end_io(bio);
+	f2fs_write_end_io(bio);
 }
 #endif
 
@@ -548,13 +545,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 		else
 			bio->bi_end_io = f2fs_read_end_io;
 	} else {
-		if (fio->is_cache) {
-			bio->bi_end_io = f2fs_cache_write_end_io;
-		} else {
-			bio->bi_end_io = f2fs_write_end_io;
-			bio->bi_private = sbi;
-		}
-
+		bio->bi_end_io = f2fs_write_end_io;
+		bio->bi_private = sbi;
 		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
 						fio->type, fio->temp);
 		bio->bi_write_stream = f2fs_io_type_to_write_stream(bdev, fio->type,
-- 
2.49.0

