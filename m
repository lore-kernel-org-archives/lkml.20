Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1DF463B6D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293868; cv=none; b=pbi2KUKwxMzBUhIyxs/f6sbNsnjSpN5Dya9PeR4viEoIw2ETf3ydh8mO934g0Qcyr1a49zvgQYoB1LZ7LS9sjKS2KB9F4eQ4zmdhwQSXQR17PyWRr7UzP7JQ9eJ+z5nCsk0T5jeXAdRYbYMpJjC8rs5w16kTSHC3JRvrDbRq/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293868; c=relaxed/simple;
	bh=ao0geNQfQ091yqvOLDBvv1Kp6w8cfteYX9Pud0tbUbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odS2yPAB/d4MaC9DOYDYuca9cpibD990fAhZiq0itUQB8fROYxyR8HaoLPRvgPdDMtMH2h7semoXCLfzwQvdn0b4xn9XC8627I6Ehql2m3b6II6qgqgGoqVPAAjApszLHFEFaaYLThfQl7huUBLDWfR2nz3FiLKzeChdiT65Eoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqZEhzn6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqZEhzn6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so411775a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788293867; x=1788898667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCHdjulyHGSeG6kfdMtjlvttn40PrSMapdL4xPEQrl8=;
        b=sqZEhzn6HDyTI9QkICueuU4mrPby+QJHldwZH+57E1dFWKJO6NqGU3Zbg+4ilbJB88
         cFS6i4IgvuiyA7sak4OopU65/kfhurx7obPlhClPd1ngvBNES27B6nt+ejTYtb9FOGSN
         I8LXNKRp2z/41M73ZHLKUwAv0+1gtuoI7qJNii3ioiuvonUr9FhD2SgUD6WUMMhKfpYF
         wWH1H0lUOkouHScJxHBLt91a3auFOSN0yl0OQ+duaehiZFVgemmKZby5XSffC0xDCy4U
         gmrCFcHLPcTAsMv1kds0LK9ueAQIeCXLi24VqcLnHlD4CseS/pZw5eIheuKSUTQCz46P
         NqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788293867; x=1788898667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCHdjulyHGSeG6kfdMtjlvttn40PrSMapdL4xPEQrl8=;
        b=ObKIcIbMC/V6olWHKQRaBKJsCns5MLGnnGfIxAKRN1Pd5c5tFMtTCn+Od9YhrB1RmX
         fPjTdAZgl80iw1eGME907x4mgcW0pjws9bKQk221EwFP13TFXcmJupAgoWPTcLDjn1Js
         4L9eztDZ0hMKygZFattxle2SmiYGq5x397liH+YQjiErOn1uUizG4GHE5QObJex5eBy1
         6DehYWsReEedg+VQ6CoZALsB0rCl7yZqo/xVEM+moHZy/0IwRJuPgRF/dxrJZTcStUeO
         zGmARmmM+eldeddWq4S/WRvF9cVLR0aZ/EbV3UU6G29CUD6Wh7NuIxAg/wYET+DW2duH
         F79w==
X-Gm-Message-State: AFuF++kqfbdaKXCsrTbovfaPFclqz1lcuVBIUpX7f1YVvu9neUZtbQQ/
	GXEyLIX2yHEBu09SqVQ3y+8Mel0dFZbD4jiVSrVypWLzuNe115V7RrpgE2WWDg==
X-Gm-Gg: AYBFou2dA8D0UmVpZPWTGZIeU6BGWFZg/dZEU6zbZNK7hl3/kptgkcM2xxzFeEu+KKs
	6o8VLtPn7pc3ltalk9f3tYBfVoYWJeG8cb1xjiaETrxUliSCrp1DpeAzoVVz3XdIXxR4ZBaWgxt
	EDN082cVZSVPzlG26JqfXnHLT8mDJyHRn9DtoYqFwdBxFP/3J7ZgMBOTh6rS+Jz1pfeQR2dX6sc
	XCaAvbQhgHfsM4YG/dgc0b5QC3Qde6W/Ijf1GXAwcScJFVriXUkG8HQZKzEZtX66RQRCZrQd2NG
	MaKLYnsSJ8lhh3O99mxTOUcSrcPEbzZVGGCEuOFaeKvK9bn6WGPsGggVJVvBIAjrzNa524LOyY7
	y0EHtuLdanJNLkEdWS3PRL7EJtnKt5hCCap6SA2Vnm6eDPzWD0sdlOJ4MLMcjWrbKzfH0oW+cBb
	XkGUgQGbHGXUZ6ytgE7lZ1FwnzUJeBUgHkHZTgXUMm5vGShA59miqaqP6smtOtcz2nGdxj7QQTh
	Hi7btj0i3bijBL8Dbg3kwSkvSoK6on8SMnGzvVZpxJ+AMTQg8O5rnkv64X4qHcMBr+oI+jZCF/6
	yp79zTc83WN4
X-Received: by 2002:a17:90b:2f0f:b0:380:fead:448d with SMTP id 98e67ed59e1d1-396d0fd2a75mr57572694a91.13.1788293866915;
        Tue, 01 Sep 2026 13:17:46 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:4b8f:b403:e030:fcca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bdb15bsm430330eec.26.2026.09.01.13.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:17:46 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Wenjie Qi <qiwenjie@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] f2fs: drop pending discard commands before reserving device alias
Date: Tue,  1 Sep 2026 13:17:40 -0700
Message-ID: <20260901201740.4040807-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
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
v3: introduce cur to prevent 32-bit overflow.
v2: fix use-after-free and 32-bit overflow issues.
---
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/file.c    |  1 +
 fs/f2fs/segment.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 511286432483..ae109d3ae571 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4122,6 +4122,8 @@ void f2fs_reserve_device_alias(struct f2fs_sb_info *sbi, block_t addr,
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
index ac0ed8609c1f..6826cb7ab34d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1873,6 +1873,51 @@ static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
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
+
+	if (!f2fs_realtime_discard_enable(sbi))
+		return;
+
+next:
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
+}
+
 /* This should be covered by global mutex, &sit_i->sentry_lock */
 static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
-- 
2.55.0.966.g6673acef38-goog

