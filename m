Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558843F091
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277983; cv=none; b=m3kGhlHleZVieALaC2eluMP6JrM4JaA920t0PIyo0rnkUar3SFQ4VhjDqiDr1p3ahsxas8qCY/LGy2d9/tPcBPlRSBMVvQwdqOu6fISFlCobaoBJURdOTYwWM7SW0SWgo9dC81Exr+EUpga2mp44jDyofghb8SG3Lp92sXaqAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277983; c=relaxed/simple;
	bh=RbcmM8ZoEvsTKoZXspKBBcq3EhLvJpLTO//GDpFpuWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMEdhDXFELJAcq+sNy6tMBaWal1LAIFNCg9OkH0myC7y+FDBhCZJ9As4WJwy+N2IlPdMdVGg0x9swgGfKpZbiN+kkBBQ/ZNL7Hg9sYOvybeJ+wQNf3QLDD1tV09fJzaKKIO3X1PwtFL2LKtix67rKEsiRIUpfMWRHasdOwdEoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRQuSAMH; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRQuSAMH"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso12138a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277981; x=1788882781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Jo2uC7uDlmBwKEsPN4k4PRcGubFpOSoa8lkLopgm0c=;
        b=GRQuSAMHC06DXNSEUoI4YMAu2UFvv4uCpIW8GseTxh3dSlJxIc0dIBPv8fNPV77lyr
         Cg7ArxbSKqaIMHAGQcHWexV3Xl08SXKXh8L9ExPPseNizoOESpEPRMZgyObmFF4rFA1D
         EecwCDvA44XNeRd9K3Viu+/eoCSdVtngtPdhftbOi/98XloH0lgqETVY36DyyeY2+fuh
         C8iPFsESmH8AGZA4MUnTQcxETXB9IQdtV8jOWRSV8Of5NVHYdZ6UOStit903KL0rx7F7
         ey2mxDRXQuP5aMVs4op5jMovdidbhstqzMOXcj8gZ0qVC2bigNrtdrkZPLNsYGY69tHN
         PEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277981; x=1788882781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Jo2uC7uDlmBwKEsPN4k4PRcGubFpOSoa8lkLopgm0c=;
        b=ZfeFvUyGAcyOvavBiRvM72YQUUeIpf3r43zI9DA3YhOXp7PfKejU1CAEZ8n0hljlh7
         FTLdkhRwEZmd1wUXRoDFkulC2z8PImeZvB9jZePh7WlEMYsrIGzHx9BaSduvDm4YeDnZ
         JWadrjg6gnWFzuBH9TrBG+boKeNFm019B226m1c66Hf6SVa59J/Klm8T+vYiL3/5DMp0
         Jo2HyBnx24er9Z++AFQUJXPRjHkTkJ+QG67/6IqORUPATnE4UUUKFCy4/YP/RJsPtL8T
         IqaeLZ9d4qU6UfLFnBcqoIYFRPh2mw/WB76IwO7R4yDf4s599qeF853wqvXU0aA3q3wQ
         Bw/A==
X-Gm-Message-State: AFuF++mF7a7zIJ4kXyqSGbwILHDoV8/1FWKCMjuKHTTGBQ1Abajxan9j
	vvcck/QN5nry1FoSTS/KbWy0XIH0cbR1SVqB6mIRv33PNDFkU5JRgH/d0IbPDQ==
X-Gm-Gg: AR+sD1050GB7dPLa34q1+rdWrQDeuzzakHDTqp9208Qy0eilPsuCDHorLnhlkfVtFQq
	2WZYUWkJAYS3Sskc7zDfgJCc8pAPQ6fac2Cp75BzANGggLHRHbDoYCYRms+lAokO3o2hDruOG67
	tSvd8dltfGlrNJKLzRU5ciGVE2JpWmEtw6Ng4dfNrNMtT9MghloE0pqgFSTWp56MVDJ9uRHWIIl
	tcBOAKGasLb2RSO/2xuDYiwOKCf2U1OEoc6+RmU+xdpvcDDpy7RmfZf7Y8OgxDmrnGAbE0iAG6c
	q9uEok2CfY+hlZfQje08XuZAlIghEb5conG2p0t1A6k6wU1F8q6Y8aYXzBxuNYFZpSnv2Ch51rU
	R3CvlU2d/8BUlyhARnx7BmlNf1SVEAwHkQ9iUc/wgM+7Zk5nTwmU44ayVUhhEaBTicsHwyLPZPz
	lpcX3edV/oYNIpAQ2Hf71TquzCt8iSq4eAqVwWsV1ast3EFmU4uBk13mmycsdExFMkiSRMJU5sV
	rpgFM9FXDpyb+uYib1o916F+hGeO7eRbqHG58RysY8FIijfEtmOYYzwqpHXM/Nxap4LQyOMfgjJ
	UamzprqfaYUA
X-Received: by 2002:a05:6a20:c793:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3d7ad7825fbmr15538475637.5.1788277980739;
        Tue, 01 Sep 2026 08:53:00 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:94f2:e160:f659:7f83])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm63853707c88.14.2026.09.01.08.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:52:59 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Wenjie Qi <qiwenjie@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] f2fs: drop pending discard commands before reserving device alias
Date: Tue,  1 Sep 2026 08:52:56 -0700
Message-ID: <20260901155256.1212298-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
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
v2: fix use-after-free and 32-bit overflow issues.
---
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/file.c    |  1 +
 fs/f2fs/segment.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

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
index ac0ed8609c1f..54bc0c64e158 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1873,6 +1873,50 @@ static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
 	return discard_blks;
 }
 
+void f2fs_drop_discard_cmd_range(struct f2fs_sb_info *sbi,
+					block_t start, block_t len)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
+	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	struct discard_cmd *dc, *wait_dc;
+	u64 end = (u64)start + len;
+
+	if (!f2fs_realtime_discard_enable(sbi))
+		return;
+
+next:
+	wait_dc = NULL;
+
+	mutex_lock(&dcc->cmd_lock);
+	while ((u64)start < end) {
+		dc = __lookup_discard_cmd_ret(&dcc->root, start,
+				&prev_dc, &next_dc, &insert_p, &insert_parent);
+		if (!dc)
+			dc = next_dc;
+
+		if (!dc || (u64)dc->di.lstart >= end)
+			break;
+
+		if (dc->state == D_PREP) {
+			start = dc->di.lstart + dc->di.len;
+			__remove_discard_cmd(sbi, dc);
+			continue;
+		}
+
+		dc->ref++;
+		start = dc->di.lstart + dc->di.len;
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
2.55.0.897.gb25b4bd76c-goog

