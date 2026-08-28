Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9930FF1D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901360; cv=none; b=aIzOX7BwECBDY9BzTaz/OwjzPc39+rKBttmQoIZAPJgqHouYkm5G98YlSSXA69OKulLJqnYNG4SMjYGcIWIlAus6Dn4oHaOXj7um85T0NRDA7xkBGWLy5P+LTcJsD9+GqthrnZi4OTmb42wo/3x2Ah0CtdsR5eFnG+G/mp3Mhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901360; c=relaxed/simple;
	bh=PWLZ+CE3dv5IFcp/a0oJlyOsMWGwPov2tnjrChR3ww8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=keL74ktGMRjCP8nU3BGsdJ3xbaYo9oJWhgLfRBHYZHCuDlnpR0IqhaZLmP2c00LgpxdHyybC9IlsbkGg2NIV5LMlsOUDWhpwWeZCNGcSAyA62/esggsyEf3hZaZfOUYLoeXJZnaYNolHRZmuFRgPpyl+CkyRl8qAbrmeztSwLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VuK0sVNW; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VuK0sVNW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787901354; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=+7D8C9pA9elrVvFxQo7rD6FRsZzvsRY9ieAvO3P0uUU=;
	b=VuK0sVNW5zglQo8pyCqt+QgMqgg/i6p5sPPn6P1rer6giCCHExT5WeV9S2jioYvoLuegRwxqw1YPyUQ8J92nQW9GpCIfrobNxo0jotp+dCTc+04d0b3AoK3xz5g5ykagHlUbXkw2oFWqqSyfDC31V/vE6nlIQIHXiUkdrx490os=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X9lfHGN_1787901353;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X9lfHGN_1787901353 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Aug 2026 15:15:54 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ocfs2: exit recovery thread on mount error path
Date: Fri, 28 Aug 2026 15:15:52 +0800
Message-Id: <20260828071553.262254-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a mount fails after the cluster connection has been established,
e.g. in ocfs2_mount_volume(), ocfs2_fill_super() unwinds via
out_debugfs/out_super and frees the osb without disabling recovery.

A node failure event can concurrently launch the recovery thread, which
blocks in __ocfs2_wait_on_mount() waiting for the volume state to
become VOLUME_MOUNTED or VOLUME_DISABLED.  As the mount error path
neither sets VOLUME_DISABLED nor wakes osb_mount_event, the thread can
never make progress: the kthread leaks and stays blocked on the wait
queue embedded in the freed osb, which may then be accessed as freed
memory.

Fix it by setting VOLUME_DISABLED and waking osb_mount_event on this
path so the thread bails out, and replace the plain
kfree(osb->recovery_map) with ocfs2_recovery_exit(), which waits for a
running recovery thread to exit before the recovery map is freed.

Fixes: f1e75d128b46 ("ocfs2: rewrite error handling of ocfs2_fill_super")
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/super.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index c62e389d4dd6..f785c39d1fb8 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1169,8 +1169,17 @@ static int ocfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 out_debugfs:
 	debugfs_remove_recursive(osb->osb_debug_root);
 out_super:
+	/*
+	 * A recovery thread launched by a node failure event may still be
+	 * waiting for the volume to be mounted.  Set VOLUME_DISABLED and
+	 * wake it up, then wait for it to exit before osb is freed,
+	 * otherwise the kthread would leak and stay blocked on the wait
+	 * queue embedded in the freed osb.
+	 */
+	atomic_set(&osb->vol_state, VOLUME_DISABLED);
+	wake_up(&osb->osb_mount_event);
 	ocfs2_release_system_inodes(osb);
-	kfree(osb->recovery_map);
+	ocfs2_recovery_exit(osb);
 	ocfs2_delete_osb(osb);
 	kfree(osb);
 out:
-- 
2.39.3

