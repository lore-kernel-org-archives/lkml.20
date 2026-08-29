Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809829405
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973448; cv=none; b=SqqL6AuooWvTvEFCFPKbPY5JUb0rqGlkhHrLTCf2jjLzc7MbPYM5kySYLsh5gbc9Zkh3hKmN+aPQ/sbfPOQao8IK3Vn56vjsMV5Hr4sdKyfg3kJki56Bq4fF8bymxwGv2qiLC4qex66QxSxI/cPDD/ufIYh9huTQF0Zd003F0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973448; c=relaxed/simple;
	bh=6vYwyqVDAxvBNs7Py4kbFQNUhLbrxua0QULkNBNcdNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gowSKxWX3zzbkbSwMyWpedro8DY3x/jNEacJS0ocisGLvtTUZJg9aP+MTOHE722beH7CTYF2KLOYZtjYDpF9IH0GnLfC6IJjSmffoLuJqlUMO6vTBN4GKbrvrR6BBRylawzSMHB/grZa3sPA0mgOizrS24Qj4n44TiQQyt4drQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+8vPcOT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+8vPcOT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacb8416a1so15013705ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787973446; x=1788578246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+pAIvIz0j1h3+ZHONm2U01i3bhktkPsbx0YPPt36+Q=;
        b=Q+8vPcOThGN94KHY8NoxGCjyuGyXaoX6KhKNlebmLCrUiFdU75h7jvjTZOgjeWqIwi
         s8VfBLF2+dDWmIrRG21kaeDTVVeXy/cIL85EcAAPS+RHXRyqVKmd5C00VqOI2f+46zzo
         c5NrzjYQ5VhKDJwCeV0+2tBjTTUUowHDNZpWIoo8BkXDZpvH+udgZT6cGRPffDIMf+rK
         1N3OYVxgOh6q+44mkNKEwbR3gJfcK59QHaJhZBumcb5QGNxGiGMvwGsavoIXHU/HH901
         X2OKO0PfzCApOMSUYBp/rC0j/8nSKfMcZo8lbmtWM2InpJb3tEXyjDl6pKwjewEbal5x
         IScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787973446; x=1788578246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+pAIvIz0j1h3+ZHONm2U01i3bhktkPsbx0YPPt36+Q=;
        b=KI0nmRMHHh3RfcNJxSDXvgS3q5xSkMdK0JVwCVs+vzGHsMqjYwaPaKyyUW3p4XYfrc
         Jb3hIIzZ36cPJAT1C04ZzJiQiaj/83tt+8KK3h9Be351zlw0bLpp3kHFkoxt23TK96vV
         Gs47UNIVfGFKk0HnPzdciOv6pgeDz6YYaZ3wI5/JS9VT3utZYaMX+r2oS+1MszL0Bhg4
         4A9ecC53YmuNQGr7fglOx4b0Umf0xKzEranNzprZqKBwKxOvJwBAJtehh1N/m+FmxWff
         kcI4ZMvEJYalFpebCQviIfkJEkusoKFHR6DUf0ArSqIJBZmGZX+QxdS4K33scY5M9vVg
         OsjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS80hVMldvKu+258bFbfUTsN5ja3kdFvwN8mNwWZoW8bXIBGBpme7HaDSqXPRjzQ3pPLhQewz4UBcEFWw=@vger.kernel.org
X-Gm-Message-State: AFuF++mf/Rfyg1t7nDJ9MkgRyUx1i4Wvkt10sRjN0keK2Ty7Oa4/Q1MG
	gLaOvF3+28UiN3WOtnJ6cjqUTzTV2Srjgm7RJByX1Ycqvs8yUA0UQ7D8
X-Gm-Gg: AYBFou0/Q5EyO1lESsSnMNR3SBarLEjBccHAfhzYtK5q3zh/jTuUNuCaGs+hRYr1M3i
	/7jNgDeyAbf83AIf+5AujndD7cCBoHV8tTn1lZqqgVwgDNEmnUj/g/mm9lOq9Cvo6Q+hUlu2s5W
	hx4MgKtLWGVE1RlZjJo2wDWfcEZ0zZPmcz6mckMEYWLHOm2PJOIoJcZRbmgtUzAm5ikCc87eJpc
	vw72TWtOV+D9cgzw7fLT/EMVE+xeTZqJ1Gih+nLZQRbZ7eZLmlpQiq51roIJSGToJ2RPhGVFN3e
	DX8xeYzv2AovnPVXuiga9oUcREZi35Nj9Zge2JDn+skJBHCRSJKbo5AKk77VYkHR2KkNWX4yApo
	qOAuEeguTvI+rTA8455SMfuSZbACuWXIOQs8Jrs6epKueVZQRGT754uWbsy66PeBI15BNioXJLo
	VRbQhbhMEYWf91jEotjugchsx6HVdU9NTOFnwtKF/mvg+lA5okt6CvyGxpMa97YbTmnr6AlQuBG
	vTfgdQGHXJf6ia7mqeRzmDr5gil1Rw/6wg=
X-Received: by 2002:a17:903:3b88:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2d8df44b118mr42713655ad.20.1787973445964;
        Fri, 28 Aug 2026 20:17:25 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952e015sm11360005ad.23.2026.08.28.20.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 20:17:25 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daeho43@gmail.com,
	daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] f2fs: sync pending discards before reserving device alias
Date: Sat, 29 Aug 2026 11:17:17 +0800
Message-ID: <20260829031717.2581247-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Releasing a device alias can leave pending discard commands covering
its range. Reserving the alias makes the same blocks valid again. If a
pending command is submitted afterward, __check_sit_bitmap() observes
valid blocks and triggers a BUG.

The reserve ioctl is the ownership transition from F2FS allocation to
external use. While the range is released, normal F2FS allocation
already synchronizes a pending discard before reusing each block. A
release-time drain would also not cover commands generated before a
later reserve, so synchronize the range at the reserve boundary.

Synchronize discard commands for the alias range under sentry_lock
before marking the range valid. Walk overlapping commands instead of
every block, cancel prepared command intervals in bulk, and wait each
submitted command once. Use a 64-bit cursor and exclusive end so a range
ending at 2^32 blocks does not wrap.

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v2:
- Walk overlapping discard commands instead of every filesystem block.
- Use a 64-bit range cursor and exclusive end.
- Make the commit message describe the standalone final change.
- Clarify reserve as the ownership transition to external use.

  kernel BUG at fs/f2fs/segment.c:1228!
  Oops: invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
  CPU: 1 UID: 0 PID: 79 Comm: f2fs_discard-25
  RIP: 0010:__check_sit_bitmap+0x2e1/0x4e0
  Call Trace:
   __submit_discard_cmd+0x921/0x1140
   __issue_discard_cmd+0x524/0x12f0
   issue_discard_thread+0x686/0xe20

 fs/f2fs/segment.c | 159 +++++++++++++++++++++++++++-------------------
 1 file changed, 94 insertions(+), 65 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1e7e745be71d..c4fb1e5f9a34 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1069,26 +1069,6 @@ static bool f2fs_check_discard_tree(struct f2fs_sb_info *sbi)
 	return true;
 }
 
-static struct discard_cmd *__lookup_discard_cmd(struct f2fs_sb_info *sbi,
-						block_t blkaddr)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct rb_node *node = dcc->root.rb_root.rb_node;
-	struct discard_cmd *dc;
-
-	while (node) {
-		dc = rb_entry(node, struct discard_cmd, rb_node);
-
-		if (blkaddr < dc->di.lstart)
-			node = node->rb_left;
-		else if (blkaddr >= dc->di.lstart + dc->di.len)
-			node = node->rb_right;
-		else
-			return dc;
-	}
-	return NULL;
-}
-
 static struct discard_cmd *__lookup_discard_cmd_ret(struct rb_root_cached *root,
 				block_t blkaddr,
 				struct discard_cmd **prev_entry,
@@ -1114,7 +1094,7 @@ static struct discard_cmd *__lookup_discard_cmd_ret(struct rb_root_cached *root,
 
 		if (blkaddr < dc->di.lstart)
 			pnode = &(*pnode)->rb_left;
-		else if (blkaddr >= dc->di.lstart + dc->di.len)
+		else if ((u64)blkaddr >= (u64)dc->di.lstart + dc->di.len)
 			pnode = &(*pnode)->rb_right;
 		else
 			goto lookup_neighbors;
@@ -1472,42 +1452,56 @@ static void __relocate_discard_cmd(struct discard_cmd_control *dcc,
 	list_move_tail(&dc->list, &dcc->pend_list[plist_idx(dc->di.len)]);
 }
 
-static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
-				struct discard_cmd *dc, block_t blkaddr)
+static void __punch_discard_cmd_range(struct f2fs_sb_info *sbi,
+				      struct discard_cmd *dc, block_t lstart,
+				      unsigned int len)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct discard_info di = dc->di;
+	u64 end = (u64)lstart + len;
+	u64 di_end = (u64)di.lstart + di.len;
 	bool modified = false;
 
-	if (dc->state == D_DONE || dc->di.len == 1) {
+	f2fs_bug_on(sbi, dc->state != D_PREP || !len ||
+		    lstart < di.lstart || end > di_end);
+
+	if (lstart == di.lstart && end == di_end) {
 		__remove_discard_cmd(sbi, dc);
 		return;
 	}
 
 	dcc->undiscard_blks -= di.len;
-
-	if (blkaddr > di.lstart) {
-		dc->di.len = blkaddr - dc->di.lstart;
+	if (lstart > di.lstart) {
+		dc->di.len = lstart - di.lstart;
 		dcc->undiscard_blks += dc->di.len;
 		__relocate_discard_cmd(dcc, dc);
 		modified = true;
 	}
 
-	if (blkaddr < di.lstart + di.len - 1) {
+	if (end < di_end) {
+		block_t right_lstart = (block_t)end;
+		unsigned int right_len = (unsigned int)(di_end - end);
+		block_t right_start = di.start + right_lstart - di.lstart;
+
 		if (modified) {
-			__insert_discard_cmd(sbi, dc->bdev, blkaddr + 1,
-					di.start + blkaddr + 1 - di.lstart,
-					di.lstart + di.len - 1 - blkaddr);
+			__insert_discard_cmd(sbi, dc->bdev, right_lstart,
+					     right_start, right_len);
 		} else {
-			dc->di.lstart++;
-			dc->di.len--;
-			dc->di.start++;
-			dcc->undiscard_blks += dc->di.len;
+			dc->di.lstart = right_lstart;
+			dc->di.start = right_start;
+			dc->di.len = right_len;
+			dcc->undiscard_blks += right_len;
 			__relocate_discard_cmd(dcc, dc);
 		}
 	}
 }
 
+static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
+				struct discard_cmd *dc, block_t blkaddr)
+{
+	__punch_discard_cmd_range(sbi, dc, blkaddr, 1);
+}
+
 static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 				struct block_device *bdev, block_t lstart,
 				block_t start, block_t len)
@@ -1872,48 +1866,82 @@ static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
 }
 
 /* This should be covered by global mutex, &sit_i->sentry_lock */
-static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
+static void f2fs_wait_discard_bios(struct f2fs_sb_info *sbi,
+				   block_t blkaddr, unsigned int len)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_cmd *dc;
-	bool need_wait = false;
+	u64 cursor = blkaddr;
+	u64 end = cursor + len;
 
-	mutex_lock(&dcc->cmd_lock);
-	dc = __lookup_discard_cmd(sbi, blkaddr);
-#ifdef CONFIG_BLK_DEV_ZONED
-	if (dc && f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
-		int devi = f2fs_bdev_index(sbi, dc->bdev);
+	f2fs_bug_on(sbi, end > (u64)U32_MAX + 1);
+
+	while (cursor < end) {
+		struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
+		struct discard_cmd *dc;
+		struct rb_node **insert_p = NULL, *insert_parent = NULL;
+		u64 dc_end, overlap_end;
+		unsigned int overlap_len;
+		bool need_wait = false;
 
-		if (devi < 0) {
+		mutex_lock(&dcc->cmd_lock);
+		dc = __lookup_discard_cmd_ret(&dcc->root, (block_t)cursor,
+					      &prev_dc, &next_dc, &insert_p, &insert_parent);
+		if (!dc)
+			dc = next_dc;
+		if (!dc || (u64)dc->di.lstart >= end) {
 			mutex_unlock(&dcc->cmd_lock);
-			return;
+			break;
 		}
 
-		if (f2fs_blkz_is_seq(sbi, devi, dc->di.start)) {
-			/* force submit zone reset */
-			if (dc->state == D_PREP)
-				__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
-							&dcc->wait_list, NULL);
-			dc->ref++;
-			mutex_unlock(&dcc->cmd_lock);
-			/* wait zone reset */
-			__wait_one_discard_bio(sbi, dc);
-			return;
+		if (cursor < dc->di.lstart)
+			cursor = dc->di.lstart;
+		dc_end = (u64)dc->di.lstart + dc->di.len;
+		overlap_end = min(end, dc_end);
+		overlap_len = (unsigned int)(overlap_end - cursor);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+		if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
+			int devi = f2fs_bdev_index(sbi, dc->bdev);
+
+			if (devi < 0) {
+				mutex_unlock(&dcc->cmd_lock);
+				return;
+			}
+
+			if (f2fs_blkz_is_seq(sbi, devi, dc->di.start)) {
+				if (dc->state == D_PREP)
+					__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
+								&dcc->wait_list, NULL);
+				dc->ref++;
+				need_wait = true;
+			}
 		}
-	}
 #endif
-	if (dc) {
-		if (dc->state == D_PREP) {
-			__punch_discard_cmd(sbi, dc, blkaddr);
-		} else {
-			dc->ref++;
-			need_wait = true;
+		if (!need_wait) {
+			if (dc->state == D_PREP) {
+				if (len == 1)
+					__punch_discard_cmd(sbi, dc,
+							    (block_t)cursor);
+				else
+					__punch_discard_cmd_range(sbi, dc,
+								  (block_t)cursor,
+								  overlap_len);
+			} else {
+				dc->ref++;
+				need_wait = true;
+			}
 		}
+		mutex_unlock(&dcc->cmd_lock);
+		if (need_wait)
+			__wait_one_discard_bio(sbi, dc);
+		cursor = overlap_end;
 	}
-	mutex_unlock(&dcc->cmd_lock);
+}
 
-	if (need_wait)
-		__wait_one_discard_bio(sbi, dc);
+static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi,
+				  block_t blkaddr)
+{
+	f2fs_wait_discard_bios(sbi, blkaddr, 1);
 }
 
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
@@ -2684,6 +2712,7 @@ void f2fs_reserve_device_alias(struct f2fs_sb_info *sbi, block_t addr,
 	seg_num = GET_SEGNO(sbi, addr_end) - segno + 1;
 
 	down_write(&sit_i->sentry_lock);
+	f2fs_wait_discard_bios(sbi, addr, len);
 
 	if (seg_num == 1)
 		cnt = len;
-- 
2.43.0
