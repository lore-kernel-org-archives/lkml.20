Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788C446852
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917307; cv=none; b=O1uS1cnafM/GcYCym/TeSLH8hoecYGrtGG2a6NYV7z2HpxJho7Rk1LCVJf65dFZwK4B8na34ezxDrUY9g05Lf9cXhwfVmQEgfur+7UO2Ba8c1dCNWv2RFmkh1RvE+K4Skf5NUYbv3iHzxH2ZklescJ02E6tAGKBtcrNCWWdvGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917307; c=relaxed/simple;
	bh=ZP6xotN5uZtQbHX3m25BhnIUixzq566HNZAVTOsxM3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inEwXU/cntywWLepM/a4vbgXitzjRXn/BjFVF3Ueg+geglY2OnabdIuNtnI2FQRwOskmQbAkaYo/32RJWUGKwohaUeKsYKRiZUsQmAmY0QNtr4G3FONNGdL+gsw1D+w3zntyiEwA7AksL4mItf3mxGCJEe9OvLMBaphuLtv+dSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcdRDsQv; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcdRDsQv"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso859612a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787917292; x=1788522092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYlvfP1aWzjYvT/xolEYx3UQdxCu1UNNLVMYIqVN0H0=;
        b=TcdRDsQvF21WbY8MHHN5JdW2pTh+h3AKpqoshxDLvGnjaXbriSI+yJ+mLO7zGv5AKY
         Kjv97BaZvi5o7yhInkc/2DCl2XnjdEnwuTHyw+9BdPOIyvZPm39scb/EnWJrZ5HoFa9M
         gip2Rj1eDyNcso+MHrPfowo+QcZBgUDfemed6DOY95+ZQHtWiK/R/UedNZDs6x9BAZiK
         j1F/TLbSLY/prRIkyHzynRD1oAsVzDJiE7TT2PYvU8/UTGT8IOwKidPG8Z74A4AzTciN
         BkW2DWbZr3U4FeoDsduBT75reZrr8nvYwPbxicn3BilTSJn4vAZ43cPld5iCRQxo4Q4Z
         ypPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917292; x=1788522092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYlvfP1aWzjYvT/xolEYx3UQdxCu1UNNLVMYIqVN0H0=;
        b=I80jBonyPQN1k+c1gWpsApDl2h0iey1cvjLRw1aejXqkVaB3dhNm7woqzCYWP7C3ZQ
         HOZ3hjm/q/pD2rBw3nN5aKtomFODc35x+RBGe3uB8co7dRm/BJwWc8jstW43o/pN7J/9
         7zOTO8OtryI3FRAWC51Nm90Eco05nkPYJCszALqIe5+0E/dF5I1JCCWM1CLey7ViWynx
         pw/2WLwzzo4BES7FiuBBe1Eznr78sEl4P8rlwHyLqGvR4QR3q+xz3eDxebOuiJqMlB27
         gyCJ6nUZ0feiV4mYqpv1sS+CwTeF7ey6K6L1m7BBUlQJUdXMN1xZ1IIWe0gw1rvDgRfp
         gkHg==
X-Forwarded-Encrypted: i=1; AHgh+RpTRdTTGurVHUq1A8fK0TdtYgXFYS7ZlUbUBvGbCnCdwFIZmy0LAnRFbHN55ynTshGms93k5c4kZYIrwLI=@vger.kernel.org
X-Gm-Message-State: AFuF++k1e3WXRpg9Qg9qbJ8lEE1o7mYWm41KU/dqQ3ZFc2OUdje6m2K0
	jvQHY/sRDpRsjwwILfGlyMUC3hfmKoipxyWkFR2yE/3vB8PWFgdDHQE1P3HYnBgU
X-Gm-Gg: AR+sD10hQI23n6tEc9GVGkNARu5zMVJP8IVSfril4v1t0dzulkLp8XWRaahWKkd5+W6
	kvK0olFbv7kYXDK2OrxCh70tTq/10AqD1UgY+Rmgj0W3vVkJyb8KC2ZhR69wbtRgJBTxjnaZm7F
	iDCzmllBRH/pRKiXEHN6gap2O9FrWpo+j78LtykPEsrvmrthOkfGnd0frqwg20WQ16alU7SqjPl
	aR5GdjtygmfLX1gmQHJKW6NNutiDUcPjODSwd3Mjsjma1NCaXElfnE6gFsW06xCNlOuPeK85pqd
	Ow7ehKswhOFBcHpZdyinEzd6+xMVWablOa4oVfh0lm+r342uwZ2NUrSn+c+pu5iQGDkXdoyc0HI
	gL/tiTcnVg3i83M6SxLBr1nZSHvOzuVkZekiSAuhKt9ksbdOHgal6CnIvthI8Y21zUtoi3Pnd6L
	5/dJSbJGMuGZFuTkNAVvbhZLn/ihjqAji3VEPJaZjjMy3sRPR/ODe45kA33mY23x1NlR82QJs4l
	IqfCbYfsC1IR1/RXp3vPGXG
X-Received: by 2002:a17:90b:4fc7:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-396d0e26cb3mr13722493a91.3.1787917292018;
        Fri, 28 Aug 2026 04:41:32 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm6888747a91.6.2026.08.28.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:41:31 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	daehojeong@google.com,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: sync pending discards before reserving device alias
Date: Fri, 28 Aug 2026 19:41:25 +0800
Message-ID: <20260828114125.637513-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A released device-alias range can accumulate pending discard
commands. The reserve path then marks the same range valid again
through f2fs_reserve_device_alias() without first synchronizing
those discards.

If the discard thread later submits one of the stale commands,
__check_sit_bitmap() can still see valid blocks in that range and
trigger a BUG.

Synchronize pending discard commands in the alias range before
making it valid again.

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
  kernel BUG at fs/f2fs/segment.c:1228!
  Oops: invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
  CPU: 1 UID: 0 PID: 79 Comm: f2fs_discard-25
  RIP: 0010:__check_sit_bitmap+0x2e1/0x4e0
  Call Trace:
   __submit_discard_cmd+0x921/0x1140
   __issue_discard_cmd+0x524/0x12f0
   issue_discard_thread+0x686/0xe20

 fs/f2fs/f2fs.h    | 2 ++
 fs/f2fs/file.c    | 1 +
 fs/f2fs/segment.c | 9 +++++++++
 3 files changed, 12 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16720f1f0a9..2b9c6bf310b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4067,6 +4067,8 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check);
+void f2fs_wait_discard_bios(struct f2fs_sb_info *sbi,
+			    block_t blkaddr, unsigned int len);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
 void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d440231b8cb..58cea2aa314 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3847,6 +3847,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	write_unlock(&et->lock);
 	clear_inode_flag(inode, FI_NO_EXTENT);
 
+	f2fs_wait_discard_bios(sbi, ei.blk, ei.len);
 	f2fs_reserve_device_alias(sbi, ei.blk, ei.len);
 
 	i_size_write(inode, (loff_t)ei.len << sbi->log_blocksize);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1e7e745be71..7f4fe8c34c2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1916,6 +1916,15 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 		__wait_one_discard_bio(sbi, dc);
 }
 
+void f2fs_wait_discard_bios(struct f2fs_sb_info *sbi,
+			    block_t blkaddr, unsigned int len)
+{
+	block_t end = blkaddr + len;
+
+	while (blkaddr < end)
+		f2fs_wait_discard_bio(sbi, blkaddr++);
+}
+
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-- 
2.43.0
