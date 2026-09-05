Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED133D51A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 04:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788583761; cv=none; b=bSv8FD1uLdNcgl8Gb55ehy7s/hZZDUoFap5/mDg0J+1L49YMKXMMOZXzO0t/jiKnJNx/ktgXHgfZbbCGGtrE0hCxsHFf6Xuk2DINCN3c0LdS9+aRSuDYVfDAuEDwmuC1+HZ1cB5g8quobWwhaVX5KsYanGrcMu5R6NE9B1l3YLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788583761; c=relaxed/simple;
	bh=Jj9kUn5qhvVJUdifRsunS/tN56R4uuxK9bdK99KID7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iOIbgoTWFyX018j0Ku3vb0idaP09DMFhVNZh8QdDiN5udJ4LlH1tMCSJofnR9Y6+zB440JUTz4+GUx3jjJtMFN8+EdTKTL6J/YUf4uktxoCNmvLjF+MF8Bz//ypzmcq921o/UMTN8qcdOto2vGEA/OURD5UF0vYkHoA6+fuR1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmAu3dHT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmAu3dHT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4858303de5dso2095073f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 21:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788583758; x=1789188558; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cazmnr8+WSnK+Laj1qZm2xa964waI/P+EGpnlZ4TgYM=;
        b=CmAu3dHTyB/ii+ZHQ1EE3t/v8s/xWfm3rWRxbBb5DaewKsWDJMQTFOiAGZGiLDSjmz
         4VUduiDpmR9vV0grRmYC7b/UHw8IzgHwfvOASxmKT5vcLJPe5dhIuomZ/PuS44I31bHi
         398enntDs0Oqs4q0Zw5LJs7mLUBWDTgggSoSQZTJFvI0Mf4ln2CqWbH7Sd8yUGa3qrkF
         j4CDoq5uxuRXnyvH8i5+gQcciUPAgZ2m1xo6rLknIP9aG/bK8wTl6TYo0HsK3J55iIWH
         KBvsF/zK13W3u6jWlPtrlJABA9OEBJbEbRmsF91zlMD1YHLwvetcXbTh/62k7vk/RTqC
         Iegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788583758; x=1789188558;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cazmnr8+WSnK+Laj1qZm2xa964waI/P+EGpnlZ4TgYM=;
        b=FrIeSu3Fdo7mB2YrsDf2/1nvoLzyiVuF8M7WCELGIvfyTTWmKnFupTZ2W5VO66Ligi
         ghy29hvsGYSfRr5Am28hXMEDOaHlbTGMN8wMgnNJpTRNOH/kY1GqBt412jVVB8BMI0Vv
         hBF+zLUldj83bJhWOo9m5oUYP3zaVHuWSM8REObrybu82UgZAmhVNVOKIITatyaFscYC
         Tm8eeKS454+JE45imwuKzj/mTFmgA4Oefa6Ukhf3pZLtXWvZA5aklNVh06qGddGZrtJD
         SITGnYXXBZ46PQjQflDVCnDJm2t9K9+qznZtSa5m+OF/XhThslmUAAuxj4NDD98RoWuj
         xiqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAdXDn/LXofr55np47teI4pT5WIDPKTV4p5pg5T9/YqeNd1IJE4BURVUAeZoXqOOTr+eFDzZ8VX06fMKU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWgZZSZ+Xh/c8QRpm4UqMgSdAYmROHRvSaHVZojZFX5hGB4cqi
	u8JMvrko02srKUlBdJQnUh924r7GpUInrPIjPvrdv7Z2RWiB/IUiMm4aDfpw1lw+TBA=
X-Gm-Gg: AYBFou1JqV4szqZmi/sH+q6scZoj7Shq1QMf4hU+FK6wDaJBYFKvxK+yGo/eUWwjhiN
	uzxFs8yJeA8MnXHwkZc80FMvzazFx1FqMnwaOBWS1Xs9j+QPRlCiv16Rk/UVskN5AvDvO+C6lg1
	/2Ecv9pEvvSDH5/r2RVPToMF/Y62McS9dS7uaHjZjYWF/1CwfcQBeGf5WtQpc4CJy2x0DlpXmZl
	1eqcQ+qo8mCKeLr892DIEYsGfUQsT0jJJeOi9IzTH4azW3mPh2QwoUag1lYSKfsztK8x42OFCOl
	2AEP8AC+r+6jO5Bm1npM7GQPcHY0l9AfnU7XerRd4qLVuO5jN2XcGdP+483e7nz/9N0VbQvQvd8
	8hl4qWdgapAFD2WNla7DUOrykCf8qBd/JEHa1Rf1PAbKVgiC24wkGRdVwoNeYC8t13h7PPjoXAX
	DdqTa4e+9zhW3Nh1OgyFLTPq4WELRqtVhCz8H9O+avUdMk7tX6GqbniBsgl5yunv8BQykg9BL6t
	S4yZ0ysQ3K97zLy/29CDAqgAjzCaQ+Wmj2pcY3LAE8cTGPxNtaVtaPPU5T53+q1xqC3GCOzouzx
	e/3oScqULQnKk899f5cCsfmnE2izK7y0kwE7/nEjYmJzHM/Xy+F+2esMHXXvWLOrVQOgU45+Tv3
	44+EdS198ZLXAGzHzhlX+o06HIbfsGZa7o+978DE=
X-Received: by 2002:a05:6000:41cb:b0:484:4880:449d with SMTP id ffacd0b85a97d-4858703f685mr12931827f8f.3.1788583757828;
        Fri, 04 Sep 2026 21:49:17 -0700 (PDT)
Received: from [10.200.7.52] ([212.89.239.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm492537f8f.15.2026.09.04.21.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 21:49:17 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 05 Sep 2026 06:48:59 +0200
Subject: [PATCH] nilfs2: remove '#if 0' code blocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-nilfs2-dead-code-cleanup-v1-1-348ed97b2443@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB2IUzS0VxEXafJHByRKgqUg3
 t3g8lu8d1JBVhT6NCdl/LToliq6tiG/uDSDNVSTGBnM2/ScdI1FOMAF9lsA+xUuHTt7xC/E2ld
 nhWq+Z0T9P+txuq4b++CfcmoAAAA=
X-Change-ID: 20260905-nilfs2-dead-code-cleanup-cefbe2773172
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788583756; l=2031;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=Jj9kUn5qhvVJUdifRsunS/tN56R4uuxK9bdK99KID7M=;
 b=ggr3TRRy5Y4ktJh/EqYQmoSEzlveccNOC+M28nZ72TOgjUfw4GcxHAHr76TEtHDEBwen51Ru9
 Mk27HEWTBVcDDu4c3x5GvZPmVTFoUXwPhahrG/j6X/PGStyebcLlnby
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

There are two instances of '#if 0' code blocks that are dead code.
Remove these code blocks.

Additionally, remove unnecessary brackets around a single-statement
if per checkpatch rules.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Stumbled upon these blocks when grepping the kernel for #if 0. Not sure
if they are actually used for debugging; if so, I have no issues with
the patch being dropped.

Thanks!
---
 fs/nilfs2/inode.c | 5 -----
 fs/nilfs2/super.c | 8 ++------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 34e6096069ad..c5b0e9f272b7 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -422,11 +422,6 @@ int nilfs_read_inode_common(struct inode *inode,
 
 	inode->i_blocks = le64_to_cpu(raw_inode->i_blocks);
 	ii->i_flags = le32_to_cpu(raw_inode->i_flags);
-#if 0
-	ii->i_file_acl = le32_to_cpu(raw_inode->i_file_acl);
-	ii->i_dir_acl = S_ISREG(inode->i_mode) ?
-		0 : le32_to_cpu(raw_inode->i_dir_acl);
-#endif
 	ii->i_dir_start_lookup = 0;
 	inode->i_generation = le32_to_cpu(raw_inode->i_generation);
 
diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 893a504cb80c..89fa6faa34d2 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -824,13 +824,9 @@ static int nilfs_setup_super(struct super_block *sb, int is_mount)
 	max_mnt_count = le16_to_cpu(sbp[0]->s_max_mnt_count);
 	mnt_count = le16_to_cpu(sbp[0]->s_mnt_count);
 
-	if (nilfs->ns_mount_state & NILFS_ERROR_FS) {
+	if (nilfs->ns_mount_state & NILFS_ERROR_FS)
 		nilfs_warn(sb, "mounting fs with errors");
-#if 0
-	} else if (max_mnt_count >= 0 && mnt_count >= max_mnt_count) {
-		nilfs_warn(sb, "maximal mount count reached");
-#endif
-	}
+
 	if (!max_mnt_count)
 		sbp[0]->s_max_mnt_count = cpu_to_le16(NILFS_DFL_MAX_MNT_COUNT);
 

---
base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
change-id: 20260905-nilfs2-dead-code-cleanup-cefbe2773172

Best regards,
-- 
Kind regards,
Joshua Crofts

