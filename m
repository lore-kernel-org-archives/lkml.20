Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F93F44D7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169119; cv=none; b=b5otD5k0yPyzdydfFoG3oQZ9MXFshmHx4oZbAgZWXUwif4veRfVyQ5gaq5lLIr81pqHT5mY56XgP+GXUtto0q5OPHkuMtNlwdjjc/bW1bz09xV+tSteHXUloxgnHS7hmlmZpKyUwMXxKAhNaVxY3HeqklqJpx8JG+Zb4BS5gYLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169119; c=relaxed/simple;
	bh=5RpeFiY9cpO3G9Z6NFNb4NWsUA+rPIt4tRZ/ncElZ60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3pWlPM+Z7ltrb8jSMMQLGKQRdXNMe30ZNpBnm9G4N/sArsmB5D4VAIW1NCKeZcBVisrk+KK6sQmmRxyHWVYxgYvq/cyvb9mDoILZ2JX0+FwzzeXpjwRlgKJ1BGBrugXDtFHD2mzebzgXHtlgy6t7yF3RzCYcGHNthK45YjuNDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbzHL/2t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbzHL/2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FD41F0089A;
	Fri, 11 Sep 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789169117;
	bh=OgQazA9zNz6iwqVAc6Q5Mh7H/5A+J00LljQ2qLc0+To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BbzHL/2tQE3bWtGnCsU3CCE6V37fveqzOlyRPTvsFEhtMQ6evXj6WJO8oUz71760X
	 WmQA+Bu4Vp474eqYLITl+IlLwEn3S067ELQurzttti5a1Plw+JB1L0AxsKNO8Afki9
	 DSffLKB6lFDGqAe4dB2PC18YEkzCtwe1Xr6zx1KslYrBSoKu0ywU4tJKxHajfTV7MQ
	 uB3kd9CsARI5sYFJJW7137I7CHDhN7qc3Sje6yxklEh/qzUW8ntgxVrNqbWAANti3A
	 OLarB5vKDBKzFW0w5OT7VKstYOx6kcxj0U9rPsJxj1MukUgiO4eY7qJ9toebRtJCjZ
	 1JQMBPHtGeXPg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: rename nr_pages_to_skip with nr_caches_to_skip
Date: Sat, 12 Sep 2026 07:25:10 +0800
Message-ID: <20260911232510.1816298-2-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
In-Reply-To: <20260911232510.1816298-1-chao@kernel.org>
References: <20260911232510.1816298-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaegeuk Kim <jaegeuk@kernel.org>

The skipped count does not indicate the number of pages anymore.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/data.c       |  2 +-
 fs/f2fs/node.c       |  2 +-
 fs/f2fs/segment.h    | 10 +++++-----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1ff9f241085a..a898258f6308 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -591,7 +591,7 @@ void f2fs_write_meta_caches(struct f2fs_sb_info *sbi)
 
 	/* collect a number of dirty meta caches and write together */
 	if (get_nr_caches(sbi, F2FS_DIRTY_META) <
-			nr_pages_to_skip(sbi, META))
+	    nr_caches_to_skip(sbi, META))
 		return;
 
 	/* if locked failed, cp will flush dirty caches instead */
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 49fe48ae823d..fe7138797a61 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3797,7 +3797,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 
 	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
-			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
+			get_dirty_pages(inode) < nr_caches_to_skip(sbi, DATA) &&
 			f2fs_available_free_memory(sbi, DIRTY_DENTS))
 		goto skip_write;
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a185b794b7b5..1f023522474a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2270,7 +2270,7 @@ int f2fs_write_node_caches(struct f2fs_sb_info *sbi)
 
 	/* collect a number of dirty node caches and write together */
 	if (get_nr_caches(sbi, F2FS_DIRTY_NODES) <
-					nr_pages_to_skip(sbi, NODE))
+					nr_caches_to_skip(sbi, NODE))
 		return -EAGAIN;
 
 	if (atomic_read(&sbi->wb_sync_req[NODE])) {
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index b77fc79907f8..526764ba31ae 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -977,13 +977,13 @@ static inline bool sec_usage_check(struct f2fs_sb_info *sbi, unsigned int secno)
 }
 
 /*
- * It is very important to gather dirty pages and write at once, so that we can
+ * It is very important to gather dirty blocks and write at once, so that we can
  * submit a big bio without interfering other data writes.
- * By default, 512 pages for directory data,
- * 512 pages (2MB) * 8 for nodes, and
- * 256 pages * 8 for meta are set.
+ * By default, 512 blocks for directory data,
+ * 512 blocks (2MB) * 8 for nodes, and
+ * 256 blocks * 8 for meta are set.
  */
-static inline int nr_pages_to_skip(struct f2fs_sb_info *sbi, int type)
+static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
 {
 	if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
 		return 0;
-- 
2.49.0

