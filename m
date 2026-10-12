Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156164779B1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798732; cv=none; b=PVp7+JLlcbXRn7kC8Pjj2zqyBum9HT0TjkOapk89/EsheM0P7x73Z7oG/g/X06M6+um9K2qXSXKbRcLr1LiI3B20jfSQS80bCdLV547sBu4k7tG6Bc2WmUjVQWAndMW9sTN+mhpg3S++e6q8UmSymmOpGwZ73SnAW7u00mry+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798732; c=relaxed/simple;
	bh=lyNEUIfOOV8CCcma+col5p8udJ7MQBe7JD2s3+fTC7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXJqvn/BIcKLOvYYEr7HRpt4KbwaPjyXVRBZCC6gmZ+8cno7ot6zH3g/E/YK0NilK0aw7qL/WhbMaUb8FJiGZjcWDmJSA5TvM3pKdFoHGaaWFGCyT9li39gA6pjc7ryCnJJqbN93z9PVudYfCofNREiBB/OvmBu6cNCAIQyYmOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qv5n5VDS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qv5n5VDS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc751eddf25so965219a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798729; x=1792403529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LROCyt0+QHWtXH+zBhZ3dcjjP0w1s/UVlhWoFjFikoc=;
        b=qv5n5VDSDrR/stik47mb8H0Bv/3di5vLJSOkD2Ap9qVT3mDTgkQ8BZlx99wsvlJw5v
         BgmMo0ra+fzNFA9N4kAcBirQ3KfhdGRufV/XopaWBE6D0W4DsEN/TPg+06+zaczRaYpZ
         o337mYGGjwqEw5vXV95KPkvbpcQuzOdimgiz8f9nZvVnS7nRMOHXAddKqz0u5OOILg/3
         KONTrDwx/xKgan+IB1fiyuITK7Add3G6eivIYtq4eEbUsN8FoKoizLkzHqkaSA+lkapr
         70FqQPt5idMbHvA7VLnxgrzRO5oYR6WH87QST1eDdmuj5H8CShBeJtJHPk7vTmpvMe5r
         nfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798729; x=1792403529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LROCyt0+QHWtXH+zBhZ3dcjjP0w1s/UVlhWoFjFikoc=;
        b=CNj2HgHgyYOQJAx6RuaQQ66SfsZPiAZE+Vdh6slQz1xX62RehhcSTeeWyBI6AXn6Zb
         JGdtx18lX+gngvwIPSUlyuC7ZERI6IKPcp5jsm5M/IfFozEmA7PFnOoklZnQJozKJrV5
         iiT0uMpYyx0pjUsvi+WbUQgZUpyMFN6BO30cowJhc2v877X6YxtbaM80pC/ZQuBlUtWY
         zAJAEDoUBBKLgWvaF4ic/4eOaIe/nKPNN50p0kXU3azpyWEWYJMY4MGn1tEls8fHIx8l
         u6ea1kzfvnJlQTaaEWcB4doXx3G+Ok1UfJkrl4RKzdS7Uv4JTsa4CQLehJ75px5TVqw9
         aSdg==
X-Forwarded-Encrypted: i=1; AKwUvBwR7AVXzslg80OvCmP7OhtkKO0mguV0AHk1Bw6evlAtwhXNifNdLag+OPu2QFScMtbNzXF1Itvp6neLEbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVWoK3KAaGV6GZnWI+kHEYpghWB44eACikshrpDrIkQ2PsCbFU
	YxGTvoQGYKTr2173l9eHjM8L6J9ofbrvewVhMNvNP4ydbnARrFeGQu5t
X-Gm-Gg: AYBFou1Qy4YB+lw3Aw9mbWVE+zpDKtfZFOaN1FIQTIO8uhcDe+S0Nh2w9UPLVGWQE6t
	6h7vJDN/9SzxQZZDIxfmXX5923SRdo08PBQ7UXya1LCotBlqlbcC3CPGKXwYgJbJ3wGObIHNpkR
	teLDb3CNj5C6jRdLIMKrJjVqP1CVS0n1J3cgSrmx6GCkeFwhdbJEMHER3RdZgEhJGKPYGwuqHno
	UWy9NsG10RKkBW3OUob6vQ+m+/U75xDbmhD0ZXkFtxIWtW2NClaQe7rqSMyt8dTzXuqroQUjDrm
	5WPi6dI5yy9IHm88KXgJ6Iuggls2A5v8mCAAnC/lAMpULY8hMSIQ6y94eA3kcTlSZ7OP9d+i84q
	fc16aR0ITnG33yRZkMVvh+207AfYm6snmyR1W9tli3rodseBfmXLBxXaqLWRzOugOw9QV6vuT/x
	fNfQ8sndh7qxx0G2YU/gN2lhCNRW5c5lpKYxbGwtFKHDbAJicE+/FRQNOWwNcJ7PyLvIdGO5SNo
	lry3yyAGvMlNkierEZTRouv89kd6fQaUb9tXT4Vq7Qmg6D4QFBxk4of2xQFtxPzdjvbpKh3vg==
X-Received: by 2002:a17:90b:5830:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3ab3acea00dmr8175486a91.61.1791798729006;
        Mon, 12 Oct 2026 02:52:09 -0700 (PDT)
Received: from codespaces-2362ac.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([23.97.62.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca1e04sm16506403a91.1.2026.10.12.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:52:08 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] f2fs: detach remaining IPU bio on error in f2fs_inplace_write_data()
Date: Mon, 12 Oct 2026 09:51:30 +0000
Message-ID: <20261012095130.17231-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add_bio_entry() adds an IPU bio to bio_list and takes an additional
reference. However, the drop_bio path in f2fs_inplace_write_data()
only calls bio_endio() and clears *(fio->bio), without removing
the bio_entry from bio_list or releasing the additional reference.

This leaves a completed bio on the bio_list, allowing a later
submission path to submit it again.

Add a helper to detach the bio_entry from bio_list and release the
caller's reference regardless of whether the entry is found.
Call this helper in the drop_bio path and call bio_endio() only if
the helper successfully removes the entry. If another path has already
removed the entry for submission, leave completion to that path.

Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/data.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c |  6 ++++--
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d4ba5e77906..ca8fce5ad778 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -989,6 +989,47 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 	return ret;
 }
 
+bool f2fs_detach_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio)
+{
+	enum temp_type temp;
+	bool found = false;
+
+	for (temp = HOT; temp < NR_TEMP_TYPE && !found; temp++) {
+		struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
+		struct list_head *head = &io->bio_list;
+		struct bio_entry *be;
+
+		if (list_empty(head))
+			continue;
+
+		f2fs_down_read(&io->bio_list_lock);
+		list_for_each_entry(be, head, list) {
+			found = (bio == be->bio);
+			if (found)
+				break;
+		}
+		f2fs_up_read(&io->bio_list_lock);
+
+		if (!found)
+			continue;
+
+		found = false;
+
+		f2fs_down_write(&io->bio_list_lock);
+		list_for_each_entry(be, head, list) {
+			found = (bio == be->bio);
+			if (found) {
+				del_bio_entry(be);
+				break;
+			}
+		}
+		f2fs_up_write(&io->bio_list_lock);
+	}
+
+	bio_put(bio);
+	return found;
+}
+
 void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 					struct bio **bio, struct folio *folio)
 {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054ea..63da4c2a9553 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4357,6 +4357,7 @@ void f2fs_destroy_bioset(void);
 bool f2fs_is_cp_guaranteed(const struct folio *folio);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
+bool f2fs_detach_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio);
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 			  enum page_type type);
 int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 794e0d99fc7c..6bd60746d140 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4300,8 +4300,10 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	if (fio->bio && *(fio->bio)) {
 		struct bio *bio = *(fio->bio);
 
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
+		if (f2fs_detach_bio_entry(sbi, bio)) {
+			bio->bi_status = BLK_STS_IOERR;
+			bio_endio(bio);
+		}
 		*(fio->bio) = NULL;
 	}
 	return err;
-- 
2.53.0

