Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790847F2D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451839; cv=none; b=CqWXSY+2vF2GqSmOcO7qqhnYTSk/+8xxnkF1ZUqUrZwRP8GiOCYgBdKHUhsxNag/2F+Cb53VnRTmDSq1tIDi3dSKd1WDFAE61GC1BhWhhEN4Hu0v/UZLRXiaQ0LcIITJzRS5L2uLGj5KNX8E/3xLPL57p+nsqhuyBFJw1Tl11NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451839; c=relaxed/simple;
	bh=rCaRKPhaOn99/iag3XMaeLxKT54bETdWgH66PLP9b2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFbx0Ig9P+xk4tTGRmHYBKXzYkA5EbEnHw0o3mg/8dG8io6P4eDpIlDH0lQA79NP6zgYopp16KWTdNNGJm6Q4kHtRN8GkqWE7dClEVhHykIaEN9r+huYSwQB0hpjQKf5aB+jCxY28NAmqXX5QF3i3SSetfHD2n2xKTYc/zHC0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+/GtrFA; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+/GtrFA"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so4162101a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451837; x=1789056637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXanvf9fn64ahqaOzPNe+rDqChzGMSkELygw9RPMno=;
        b=o+/GtrFA5fniRkmtZtD1z8CvosgqwnPO8zkFijWGg8bExGGvtfVm4ctAvQyroanLBQ
         DpMVnRzquKX5FFP28rKoKyypkLCkAzn+uqhEJDpegRW5WYJHW/8VeiJG3YeY/uhShdGK
         Ogk5S0ZA38tMVbbz2R6BAuffXwYAmw42n/8cSDEKvBUdfahbFRFwcI77TJr5NqXv53WG
         NyP+jGGAqu4AtW2atpiDosMxSaYlBf2dr60DDmXwZIEc6B7W8zZzGlj6vWNhQ2T7X0jw
         CZok1ciOWVegjVWdgN+kST1mXPMdsplhRt5Kip1EjePPlpjzwsbqp0obMuaPv/gNmXTT
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451837; x=1789056637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXanvf9fn64ahqaOzPNe+rDqChzGMSkELygw9RPMno=;
        b=V9NKIgrqahigXduPIohIwLTBm+Xt+E/Kze0K8NbyASAwjuAD8kU5DRfJzpSRFwO4WP
         IFyVmZ5RGVU1OdN1svxMcGfkE6um8i3lg7WNv922P2h1rg9Ub/n9C+HgYNuJBBOo3E0m
         BpR5pwRBsLmX+cwBUgRQXrHC8CEz1vzCs1+lg1lZqNExg6K6tpHO6yMuphuJlUOA5dah
         uWdssiTAMUj4WILpDYWUAUjTP2ShVEFycc34uqVuqwGkltq0iTRaI+O29ZR4nDU0ul2g
         v32E2/VBy2cbCkBAwxYjdf7o8jhyDyerSa6Og451/Vq+bkqkS7EtTDbwrM9DMxSI+LrC
         YTuA==
X-Gm-Message-State: AFuF++kNnZjg/SxwfaKiBiFHKI4OJ8JwpxPhDBboS2ZajkwE9Eqs9owA
	JvYQEiZ7s0XHJYhtgNGk0hitIVRbrkpdS9w6zu8/jLiqpMYsWzYkGVFM74LRQg==
X-Gm-Gg: AYBFou15CRxlMlCGt4Aq1u1oJYqufyATCBWNzpOwcrN0c/D+m2iFGehKthujzdasaVY
	dQtXwKyG4nUaf5jmDfYXxpEDmWyG8ueUvdH2d/bO8LWGcwOtWNHk7l+lLvF8snHdInuesjsCQn0
	9Y0urD07m5fbDIEoniCHsJ0H6R2a+H/qd0Mw1SCRs8vfHqA+vzapTnMD0ygt/y7sCACqK8MXkR5
	DHci1YPGvAWh+HKe4ZOyLKygkZbOPuhvs0IilwbuQwE8CUOKyusQQg9v9pN3cX80i0j7oFA7jiO
	Th0AYw5ZBGD0al8DFmKlNbTxmB3nD+jq+W6gDZfyuLPTvRem/j4oeIS/GPGndviVS/U1/M//9dE
	NKrJrFzFwj5TLpCRdwJUhbXXYLyKdIYWHVX4nDuB6lwURSzBX7pLxPHZCmRbkG0GVxO1LyEu+GY
	gyfyIu15q5ychzD/NGLqxTPKrAb6jApPcyLlit4fqfmlp9k9Z9ILc2SLhUHnnh5srtLYNaHBtsy
	FiJrQ/jtpW6DOev9OoYpsXovsyX26RdsG//4lj0r2j2+v2DLhykoHr5GH8dieokIYwSSxNDMpyK
	cH/hjt+PvTM=
X-Received: by 2002:a17:90b:1c07:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39b232e2f86mr997833a91.25.1788451836896;
        Thu, 03 Sep 2026 09:10:36 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:21b:5fca:ed1b:b798])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae9087d3dsm2865695a91.3.2026.09.03.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:10:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Wenjie Qi <qiwenjie@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] f2fs: drop pending discard commands before reserving device alias
Date: Thu,  3 Sep 2026 09:10:31 -0700
Message-ID: <20260903161031.1280195-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

When reserving a device alias via f2fs_ioc_reserve_dev_alias(),
f2fs_reserve_device_alias() bulk-marks all blocks in the target device
range as valid in SIT.

However, if the device was previously in the released state, stale
pending discard commands covering that range may still exist in dcc->root.
When f2fs_issue_discard_thread later processes those commands,
__check_sit_bitmap() detects valid blocks in the discard range and
triggers a kernel BUG().

To fix this:
1. Introduce f2fs_drop_discard_cmd_range() to traverse the discard rbtree,
   drop all pending D_PREP discard commands in the range,
   and wait for any in-flight discard bios under dcc->cmd_lock.
2. Call f2fs_drop_discard_cmd_range() in f2fs_ioc_reserve_dev_alias()
   before f2fs_reserve_device_alias().

Reported-by: Wenjie Qi <qiwenjie@xiaomi.com>
Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v4: limit discard commands to drop per lock round and call cond_resched().
v3: introduce cur to prevent 32-bit overflow.
v2: fix use-after-free and 32-bit overflow issues.
---
 fs/f2fs/f2fs.h    |  3 +++
 fs/f2fs/file.c    |  1 +
 fs/f2fs/segment.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 511286432483..dda70234bf2d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -466,6 +466,7 @@ struct discard_entry {
 #define MAX_PLIST_NUM		512
 #define plist_idx(blk_num)	((blk_num) >= MAX_PLIST_NUM ?		\
 					(MAX_PLIST_NUM - 1) : ((blk_num) - 1))
+#define MAX_DISCARD_DROP_COUNT	512
 
 enum {
 	D_PREP,			/* initial */
@@ -4122,6 +4123,8 @@ void f2fs_reserve_device_alias(struct f2fs_sb_info *sbi, block_t addr,
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
 int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
+void f2fs_drop_discard_cmd_range(struct f2fs_sb_info *sbi,
+					block_t start, block_t len);
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29cf82d02c77..0b2d173d9597 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3855,6 +3855,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	write_unlock(&et->lock);
 	clear_inode_flag(inode, FI_NO_EXTENT);
 
+	f2fs_drop_discard_cmd_range(sbi, ei.blk, ei.len);
 	f2fs_reserve_device_alias(sbi, ei.blk, ei.len);
 
 	i_size_write(inode, (loff_t)ei.len << sbi->log_blocksize);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ac0ed8609c1f..50b2f8465595 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1873,6 +1873,60 @@ static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
 	return discard_blks;
 }
 
+void f2fs_drop_discard_cmd_range(struct f2fs_sb_info *sbi,
+					block_t start, block_t len)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
+	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	struct discard_cmd *dc, *wait_dc;
+	u64 cur = start;
+	u64 end = (u64)start + len;
+	int count;
+
+	if (!f2fs_realtime_discard_enable(sbi))
+		return;
+
+next:
+	count = 0;
+	wait_dc = NULL;
+
+	mutex_lock(&dcc->cmd_lock);
+	while (cur < end) {
+		dc = __lookup_discard_cmd_ret(&dcc->root, cur,
+				&prev_dc, &next_dc, &insert_p, &insert_parent);
+		if (!dc)
+			dc = next_dc;
+
+		if (!dc || (u64)dc->di.lstart >= end)
+			break;
+
+		if (dc->state == D_PREP) {
+			cur = (u64)dc->di.lstart + dc->di.len;
+			__remove_discard_cmd(sbi, dc);
+			if (++count >= MAX_DISCARD_DROP_COUNT)
+				break;
+			continue;
+		}
+
+		dc->ref++;
+		cur = (u64)dc->di.lstart + dc->di.len;
+		wait_dc = dc;
+		break;
+	}
+	mutex_unlock(&dcc->cmd_lock);
+
+	if (wait_dc) {
+		__wait_one_discard_bio(sbi, wait_dc);
+		goto next;
+	}
+
+	if (count >= MAX_DISCARD_DROP_COUNT) {
+		cond_resched();
+		goto next;
+	}
+}
+
 /* This should be covered by global mutex, &sit_i->sentry_lock */
 static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
-- 
2.55.0.970.g62bdec98f9-goog

