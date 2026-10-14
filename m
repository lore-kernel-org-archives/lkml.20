Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BC379C32
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956857; cv=none; b=IpErN4q5XEBANieKTX7PTJeUrBMm3tStWK4J/luEeD+eD34CRsRqBUvsfGfUDlchEOPUUD/5cRlPJUaBNByeHU5eqaAFJ3opDIVtHm7qEryc0QWQBpPD1gSTZD3MxgQUyrryQRURRLCtMV08GOYxXfEHEr0BZvG4ompcJNj6Pgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956857; c=relaxed/simple;
	bh=adjEG/5up+VaBDeMxhQ9NveHqc9666Ylt0WZyCArG78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQQw9wZSailcViTXDZQO1mGZ9ahMAOiZFUuowMVITuO4QqR97J7jvnoTNBy5lzTFTrhscaKlt5MoRXVQuhXp1VvIrCf76ayda7r+rJKpOczYg5zK6BluarCQBdNrgfD9UT4brZuS6EWCGwNJT7Zxs2G3xpAGKu8PPOqgz2fZetM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoSv7T9g; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoSv7T9g"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso6385a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791956856; x=1792561656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Te6l21hW9qV56/tTnd6h/0gZVDPhgs1uIbxUt8nEzU=;
        b=OoSv7T9gyU3Zdcn3aaq+4c32EFUPwP497IRGTTX4KOxF+azbS+jBoUhlpqHUO8fFFr
         J57Hry0v8dPuQVd7SY/0Ldn3ehS0cRTRoK3qGeU+m7LKmaD3c9wx3gk/cJLP9Wf6T8tK
         GHtF5XxUfNnb4Z5e7+/nrrDI/WLr0S+gfeOKCjhneNVijZGmCDGteiZtXO72uPaozGS3
         MQnIGnBGMfZqKiNbFN6hqdTd27YCj/7YFHX6VpdKfdu141HtsKURUJ6skRFWCvNERnvz
         3Ofqk57MJnNQbliSFQefXVQc6g2eFxG+wjh1JZ7YTYd+lgAaQy0phvxiFek0VCFXU5fW
         QhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791956856; x=1792561656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Te6l21hW9qV56/tTnd6h/0gZVDPhgs1uIbxUt8nEzU=;
        b=a4FSnANRv1M7VOGm+nzWGP4PPEkYy+EMjT5bmoLfyO75l6obUIktJqg+zRvVrAQcoo
         mF4YgNJV3wAVMyUKoSdcfsmZtvCwpFII3CEDgLGo5/i1PBbts2+Ow8946GTAFhQKPNfi
         gTzxVdk2zW55Bdf2XZ3IL4bEerOBVGVpb2v3eLZZ132AzzWEJoEGYH0a8YJfVoMHzMA6
         HgJEzwz1pEyfqNlatEj//gmxmbIsBlf7AyOvjoYYTm4W/Q4XanqiYJBGQHWLoll1R2lm
         jlpCsS73g/mozO5r1cWbb07kyxqP88iYSmK02U+ty2EeaH90IGiqXYviSDVwja9/r0sA
         WQEg==
X-Forwarded-Encrypted: i=1; AKwUvByAUnseh19hX94ef/SclBAiYNK9G40Tl6XHcPKZrTW/+l1CnFlWmI336xPEOuiRGajS6lu9OpVoiUGlyvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAn08y1EvluaJoOFccO23Z2pVQyucZEXsjEnW3P6PAID51s56d
	P7htgWBkICRX6EXnXuyVtscJSST1t+Rek/46m3snNc4VJiOhr+RalHzP
X-Gm-Gg: AYBFou29ME4CKSIqhqVFjw/JjyNHxsKOukLKnMLM7p9Bnn9HdzfJaWFzj7ezb/VGetL
	bm0HM+iwxj1nZmJ9pjpbQVLADDsMA50ZprZyLYn7eaE+DSoHB533xXlbGk6bm1n+RxlCqd0p43U
	ldhmg3ai0UoArsrUco9vyQbEQwfBUN5jnbVeX71PgbgXrSxBWo5WNelFZnPvtcrK8Pq+o1hMNVC
	3cwsnG7CmNvaU1vBKOPXTd5f4gjMq2OZ4IEKXbgX8NdXyU1855Pijcn5DAPW23EVwdEwaiW9w1s
	WOt9QjxHB4cHr+2OCsB6/HeJNi29xmJv2v0k3WD3DcJyWjp0AL+DzzpsPfb6EReYqCYX1SuuiCy
	Z2094wOW77whOvxg7BQERSyfz1BaszJDeEwo5SiGpfE2jmGWSFL1t4o+yJlekoTyBrSKDDAxlhN
	Xn+XnwR/1mzMyuidbkoCmknS4IuUjgmiXuUMJkIpodBvGNu8effiPQ6E3nkPPn4Zl+BT0uvrued
	bxDSd17apQg+4foCY1ZiDUDgnzMt0R1lXcjHzAgNdxgtYAVhke0f8dSf6uNmhOpqa9M1nG5slo6
	3AI9FK1AqWl2VKJd43jwsRxJcAwJK1QOWuUYFoaSUoqpGEij
X-Received: by 2002:a17:90b:268f:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3ab3a32cbadmr12480525a91.5.1791956856033;
        Tue, 13 Oct 2026 22:47:36 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f3db2f5sm2852219a91.1.2026.10.13.22.47.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 22:47:35 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] nvmet: take subsys->lock while force-reconnecting in nvmet_subsys_attr_qid_max_store()
Date: Wed, 14 Oct 2026 15:47:27 +1000
Message-ID: <20261014054727.53183-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_subsys_attr_qid_max_store() sets subsys->max_qid and then walks
subsys->ctrls to force every controller to reconnect, but it holds only
nvmet_config_sem (for write).  subsys->ctrls is protected by subsys->lock:
nvmet_alloc_ctrl() adds an entry under subsys->lock, and nvmet_ctrl_free()
removes it under subsys->lock with list_del() + kfree() (not kfree_rcu).
The free path takes no nvmet_config_sem, so the two locks are independent.

A controller teardown (host disconnect, keep-alive timeout or fatal error
-> nvmet_sq_destroy() -> nvmet_ctrl_put() -> nvmet_ctrl_free()) can
therefore list_del() an entry while qid_max_store() is iterating the list,
corrupting the walk.

KASAN, concurrent "echo 128 > .../subsystems/<nqn>/attr_qid_max" racing
nvme-loop controllers connecting and disconnecting, panics in seconds:

  BUG: KASAN: null-ptr-deref in nvmet_subsys_attr_qid_max_store+0x10d/0x1b0
  Read of size 8 at addr 0000000000000090
  Call Trace:
   nvmet_subsys_attr_qid_max_store+0x10d/0x1b0
   configfs_write_iter+0x1a7/0x250
   vfs_write+0x5df/0x940
   ksys_write+0xfd/0x1e0

(also seen as a general-protection fault dereferencing a LIST_POISON
pointer at the same instruction.)

Take subsys->lock around the list_for_each_entry() loop, matching every
other subsys->ctrls accessor.  ->delete_ctrl() only queues asynchronous
controller teardown, so it does not re-enter subsys->lock under the loop.

Fixes: 3e980f5995e0 ("nvmet: expose max queues to configfs")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
Tested-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/nvme/target/configfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 1111111..2222222 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -1683,9 +1683,16 @@ static ssize_t nvmet_subsys_attr_qid_max_store(struct config_item *item,
 	down_write(&nvmet_config_sem);
 	subsys->max_qid = qid_max;

-	/* Force reconnect */
+	/*
+	 * Force reconnect.  subsys->ctrls is protected by subsys->lock
+	 * (nvmet_alloc_ctrl()/nvmet_ctrl_free() add and remove entries under
+	 * it); take it here too so a concurrent controller teardown cannot
+	 * list_del() an entry while this loop walks the list.
+	 */
+	mutex_lock(&subsys->lock);
 	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry)
 		ctrl->ops->delete_ctrl(ctrl);
+	mutex_unlock(&subsys->lock);
 	up_write(&nvmet_config_sem);

 	return cnt;
--
2.43.0
