Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77BA3AC0FC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980803; cv=none; b=GtDK0ZsaDj6djfm49SvVt+eFjuozfXXH0SEyI1LyGLQ2qhoA4qREAkwAXGvjwbldlI01BguWqEglVxd4baAy2LevQukQlL6FNht6U5McWv7LK6Tx/XCmYufUxKAPNLQCJyuHytayDoA9S4HIZuuA+eFmq6erWL5gr0nSsbDepHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980803; c=relaxed/simple;
	bh=B8gnD7LbPTyNwhMyscOG6LlIsKC0sHCRdOwwJQ+nFl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAuLnM7FD0SI8EJ/9PQUUlo26ayke8TBpIns827No+x3emc87cFPZLA1OziBat7HtiCKYPqMHDCFxYDgycRxyvaiBM4ciq2fDRhEGyzAArfxtI2OR/D3W+vcKNcPZXbq7Zhxi3ZjQ0SzOUa4gBLC71xdsOir7jrRDuTqdUDourw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwTCCYMS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwTCCYMS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so9716439a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980801; x=1789585601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=obPkw9dzUR7EZ4PZqPbu4EwHtQ7nPQqg1CfUc0zXxRo=;
        b=cwTCCYMSIJlMgKdrqgT0ZSgzlxqAVDKQ8USYouSwF6Lmix0qgApnNV5MzMIE1GzMyn
         AWDP89ZayPqktXqMGmAi2SAEKk/DGLxWU0nsC4qe2X5jOmIQTXcNJl/9Re1Y6jcLepxp
         EZBnXZA6etAdWHWdk2zLfJ5LILnU20Gf6H+Rdz3SVvQyHWoe6kYNzE2d5yXFAVv+uPT/
         KgxrVme3m28iWkzWcOCowlvsJR4YfGxSdxYBDFJeLrvXMFS7sM6EVBxM3x7i2irivucP
         y1DJfut3aWwKGbe//hUahA1m73JvDIQMpBFXMwyYQf2fM7wlyUuPhfgDpInr/uPdFnUQ
         BMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980801; x=1789585601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obPkw9dzUR7EZ4PZqPbu4EwHtQ7nPQqg1CfUc0zXxRo=;
        b=tT3VA3yziPvXahirDwiGL5bwNi3N0ukPo/VUCyUKo8HnsCUzfceVCQ4VqndxLlu4E3
         cSDQaQaFq/zMHrW/fUTdrs1MRfmUmllDU1UrsB9oBhtEG7j416g6Kq9W7zYMdJEdG7uv
         M/9bEcbKZ48jpjK2zoD0gTkMFieuhUmsfucSDVCiagF0U4xKwy6+HzMBSToDIF6bwf1P
         BpLZwD15hnyXc93drFEwBNkSoPIF18axcGnX842nG6WV7+gZhf4WXmd6qpKzdxWTf5PB
         SGIW8D9nMUzpl4j37FlWElqn4oOT36usGJUIBv1WaBGAece79geewebnN78ZZg15uNfO
         PKnA==
X-Gm-Message-State: AFuF++lhdhhQoM5HggOIKqKOWC7JyUzUvzCtKp3gzA63OrnPsJZbf4Kf
	36ChSC35FIA4P38XRam/jWLp1QuFJWeAqQg4Ex1howFRlfuW791qjx+SfSNTsQ==
X-Gm-Gg: AYBFou00G4VgDlH2NzrITiPVLGHb2WOtVsxnzG/KNSE0f3L1nl4eLwtfoTXXkdrrq5v
	Ug5VEns6XV/KIKxeTb1t2agxdEN93y83P4tOTh6pQImgHeUQPAj5U+J/dobq7He9eoAMqFpBXm/
	P5heIhOXn2WxglzJ8LQ2YFMxpkO1n4Mm4cHzq08bPLtbALbkjwMMeenQIAeCNInfUC9NBZ1uJdg
	cK96SMMWCCSWdukszM0uM+/Nuo51H0jyO0ypiCxqirHPzCvoKTfgQ5gekBh1ZN/CqSq7NcFFcHM
	+7b5sBUrEJkEnW0ic2hs5zP3qnBqy5X9O/ndlasB/LyaIrP5siMHSP5JYz/DLHpIi3V8RXjd/c3
	VCENsW72R3AjECvJgYuSDyfe9gIeNSQyNZFJKmI8uvmbBYSyL5ZjeNZOCQUNoCVXiK8Am0AaGaa
	Ag2+FMnQjD9Trr4KjXd5Q0cfq8swG4YyiSoEw0axYA2YFfSPY4tMzgSfP8mI6CRTYGKXJxbyfIe
	TJvFHkE+y2spdUMpXnDgU64gr/Or+BNAMRsUtQd/St7+pPkYcWK2kIt8YMbTabDvmnI+kz5Evyh
	acSNGcFTQiRz77UVV85VIo0=
X-Received: by 2002:a17:90b:3d48:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-39b260e13e0mr55280731a91.3.1788980800923;
        Wed, 09 Sep 2026 12:06:40 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:406a:f8f3:9059:8330])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm45915355eec.19.2026.09.09.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:39 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2] f2fs: fix livelock in syncing dirty inodes
Date: Wed,  9 Sep 2026 12:06:36 -0700
Message-ID: <20260909190636.3151580-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

During checkpoint, f2fs_sync_dirty_inodes() and f2fs_sync_inode_meta()
iterate over dirty inodes in their respective lists. If igrab() fails on
an inode (e.g. because it is in the freeing state), the loop continues
without moving the current inode to the tail of the list. As a result,
subsequent iterations pick the same inode repeatedly, preventing other
ready dirty inodes in the list from making forward progress and leading
to a livelock.

Fix this by moving the current inode to the tail of the list
(list_move_tail(&fi->{dirty_list,gdirty_list}, head)) before attempting
igrab() in both f2fs_sync_dirty_inodes() and f2fs_sync_inode_meta().

Additionally, if igrab() fails, yield the CPU with cond_resched() to
allow the evicting thread to finish eviction. Remove the redundant
f2fs_submit_merged_write() call, since .writepages already submits cached
bios via f2fs_submit_merged_write_cond().

v2:
- Also apply list_move_tail() to f2fs_sync_dirty_inodes().
- Remove redundant f2fs_submit_merged_write() calls from both functions,
  keeping only cond_resched().
- Update commit title and description.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/checkpoint.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index ef22692cef0a..d16988150a8c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1410,6 +1410,7 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
 		return 0;
 	}
 	fi = list_first_entry(head, struct f2fs_inode_info, dirty_list);
+	list_move_tail(&fi->dirty_list, head);
 	inode = igrab(&fi->vfs_inode);
 	spin_unlock(&sbi->inode_lock[type]);
 	if (inode) {
@@ -1432,11 +1433,6 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
 		else
 			ino = cur_ino;
 	} else {
-		/*
-		 * We should submit bio, since it exists several
-		 * writebacking dentry pages in the freeing inode.
-		 */
-		f2fs_submit_merged_write(sbi, DATA);
 		cond_resched();
 	}
 	goto retry;
@@ -1460,6 +1456,7 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 		}
 		fi = list_first_entry(head, struct f2fs_inode_info,
 							gdirty_list);
+		list_move_tail(&fi->gdirty_list, head);
 		inode = igrab(&fi->vfs_inode);
 		spin_unlock(&sbi->inode_lock[DIRTY_META]);
 		if (inode) {
@@ -1469,6 +1466,8 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 			if (is_inode_flag_set(inode, FI_DIRTY_INODE))
 				f2fs_update_inode_page(inode);
 			iput(inode);
+		} else {
+			cond_resched();
 		}
 	}
 	return 0;
-- 
2.55.0.1003.g10538fe699-goog

