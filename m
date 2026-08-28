Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C146941D65E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916521; cv=none; b=jN4rjLCnP2RwH4TBsx8k+V+q/vyI5BOKYrOVCI59gy/ZnfAmVRXeqifsoj7X9n4LDtbgFKV0ozEtTe7dyiYexCNPalmWqt2krdY1bxtOplSFZFOLq9GOSJu3MlJ/WS1cCn8P7hIFQVcUGUDVLh4zRw41V+dtb455zL4H0UePaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916521; c=relaxed/simple;
	bh=GJhmhpryd3ovgR9+SNmIzHiF+9qNsGbKcn1Bxct3aEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UH91VwB6zA7LdzhooJJ2erNOeETZW79ZHByC6ogpsqnZ3c955tNQRpr5FSOx54Ekjpt9clxkZrINWEKPE0D6TOW9xNSjz25knveuMzS6N4oW2RDP7Xqcf0wm2GJN+D1vhqW3yW4ff6JTuTbMbOOu12cLm/dGxO7uZt2/UssdXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xhMAqNUs; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xhMAqNUs"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787916506; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3tYc4yYO/f82yRU3a/2G8udVSpfIsAg03Xb74wg1EN4=;
	b=xhMAqNUs6xOF1NguX3Wu5R/JbCHSizqH1tjOCREmRlNfDBIEu16LCffT9AaTnn/6C5oubp2NChSDQxwWnsJapimm23ky4yIt9YH1XG3u3s1aDko7WEvBdcU4zVqJxDF1ucV7R65UUozfmdz+SuaBiQzcfEvtg6BiU8cvC54Qpvo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X9mBi6L_1787916505;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X9mBi6L_1787916505 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Aug 2026 19:28:26 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>,
	Li Zetao <lizetao1@huawei.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ocfs2: exit recovery thread on mount error path
Date: Fri, 28 Aug 2026 19:28:23 +0800
Message-Id: <20260828112825.666097-1-joseph.qi@linux.alibaba.com>
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
Cc: <stable@vger.kernel.org>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
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

