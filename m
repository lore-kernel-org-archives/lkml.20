Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EC23E325
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125326; cv=none; b=ZNzgr5Q0q44F0Hqwp8c1ls/xsrW7TSwUKWiyVrpn+VpuHDZvhq6EJr7bTlu6Q9QKIXnfgRQBAP5uHHaCV2RsqMqb8rjpB5x/zWa54OaXVoP+LsJGwEUDkuRHPDSXTaCdz66UcotGF1tkQ04mDGnLBWAnCHc79u8cVaBuj5g9nDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125326; c=relaxed/simple;
	bh=g5xcydA97f+ee/JF0zyKLsb3WhMtWj7f7tTrgYbQgQM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XYE7jIl1fq3aqCFgHaOzaDFq3MoQD2zWFuU0ZRiucGm1v8zw7SiKH0hdRtZkTDVx4FJgoO7J1xtc8JBkxqlt/7Lgy+f8G6XWqluzXAxQZtG9q5t91C8PHxHSygJ/H75ppJ1lkE+V2lnkuXgd4t2sFtKG0z1T/V+tsXY7c/qgawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC6JwG5a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC6JwG5a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so1843275e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790125323; x=1790730123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzUk3hOlPTMJFXJSKd/vs6aKarXFG2BSvANvmfCI/LM=;
        b=JC6JwG5aEM5U1ziu/otVCPhBmkJvETua8qHX9xK45NVlUyMUjbPtHPQvYuiDvbXGKo
         VHDjRE5EB3BlDZRDy5HEmOsTn7cTBtxlCOGXlw8LlMsOsV/3GmGKgjoEdOSNQ/GhHln5
         8P9X1zmeF52zPBSVGNS6pvcKeFiU0XfUV0jaZ57xDIC3hBYOi9mXm9ow1m80NfxNQtZu
         6EzEID1BQMYiDGvZkgnGa3UvchDNLH3wdQ5nKXI5ot/czXtG4MlCPv41UX7eZU2n0LZv
         lk71P7pqoii18r0LULTbxUZvSRy3RIEdxYUMXnTyqwoxNFIICharB2mMILmFRoIK7Hk2
         cCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125323; x=1790730123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzUk3hOlPTMJFXJSKd/vs6aKarXFG2BSvANvmfCI/LM=;
        b=oo1OWjrB9B+g+09/dV1qodxZd8pmJr6gbcrddconzXHkHEcScfvZjpxbTTRCGZ//VT
         QYdDeffOxRpJwbAv4VsTMEoOmq8ahJ+sGY2wGYQIw8GpmiMLffF3GoeGvPyjvqnfMG7Q
         gLbX3ZoVFXUh1uO88/Oc6wr54nV8jCtR8H2aywK4EmTWGrS72Iwz1kD/U929XnJuVHU4
         UUcNtfL4qHBfNJHExyqv2VY/fsVNcmAYqWN1DMFXiDm+r/p89vXHRqry5PhP9Fspyd4T
         Ru8vjkBqV401Yc1JRzd6pPw1c+s6mhmhxT6IB1a010SYpyFGAeNU2SgKTnZGcouhSk5Z
         FWAA==
X-Forwarded-Encrypted: i=1; AKwUvBxEbqQu+l7aEx200DqdBLN/PXbauPJorSChkP/mMReJ/WK/3whkwVrdQoFWdtdurVIkzrWZmzK2xQsI6JU=@vger.kernel.org
X-Gm-Message-State: AFuF++k15fgQJ1tn32trcrC52rDmKYx6gOJ7IiTjLLDwzo7DA+KGHepn
	ttXORIaxZ+Ot+Tb+IPAJ4mgIpRQeAlHqSyap6+0xlj20eOQMKjayKnw7
X-Gm-Gg: AYBFou1RfY8YJsNj8HPizUTllo75WRY7tNNW57HpLUbtsIvFRZaPL7SRZynChXHnY0J
	uTa0Zbly26a270fTeqEPSGOcVhH/sBT0MWB36CM5GUVk2jGQKlItN0i3UeB2f0bTj+2Koet10TX
	izW6+7q27W1KQVqmnE0/Y7NQMKwAWSbgL9603zjvOR+nvCevXKyvqpmEbih5LqbbgwIQFMkPItD
	O9h4NxLfAO3jvfuxbdidn9gT09gmmYPCC4qW7/IEprfJa/xN8HYwd+kZ+6vzxkUUt7GbcGXnJf2
	CSEiaoBhD9lPwJUHMiCmDAudUTCME8PUrwX92LO80YdqwHk73CI4LenPzQh0ZDLAvx5tyZwmCeS
	xlm/Z9GlLl9KjUYkpFTfebEGP7bUFidoLpMtlpDJP+NAF41CYtuCVycQ39XpuGDV1updApghDH+
	R7aFaodCKTnOgc6O31YKwBRBwZ4nFVYb99DTrC7eNp6olYdEHZ6jGbJTRzziaPbtcR8gE7dqQdK
	8A3tb6Lq8uusqJ3c43yLbR2/IXJmRzwIE15Spz/ii55gFMt8z+k5IsMitnByIdc3jMXtZJ3z1cp
	e20EfnKNdmR3Eyhh1lH23BKwks/PkEf5sjgifK4D/FTPvIEf0WwBn9FltIMP9JQm69OKOeKjsS+
	DacO0QJrtwmt7
X-Received: by 2002:a05:600c:34ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49fdece1f43mr10933755e9.13.1790125322471;
        Tue, 22 Sep 2026 18:02:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a5e6-3401-f8e1-409a-a02d-633a.310.pool.telefonica.de. [2a02:3100:a5e6:3401:f8e1:409a:a02d:633a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889130sm2313338f8f.37.2026.09.22.18.01.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 18:02:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Cen Zhang <zzzccc427@gmail.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] ocfs2/cluster: hold a reference on the heartbeat thread
Date: Wed, 23 Sep 2026 03:01:49 +0200
Message-Id: <20260923010149.14391-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 688bc88e2046 ("ocfs2/cluster: keep heartbeat local node
stable"), o2hb_thread() leaves its loop and returns when the local node
changes, for example after "echo 0 > node/<name>/local". The thread
was started with kthread_run() and nothing holds a reference to its
task_struct, so the task is freed once it exits, while reg->hr_task
still points to it.

Reading the region's pid attribute then reads the freed task, and
removing the region calls kthread_stop() on it:

  BUG: KASAN: slab-use-after-free in o2hb_region_pid_show+0xb3/0xc0
  refcount_t: addition on 0; use-after-free.
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:kthread_stop+0xb1/0x390

The thread could already return by itself before, when heartbeat start
was aborted or on an unclean stop, but the local node change makes it
reachable from userspace at any time.

Create the thread parked, take a reference on it and only then wake it,
so the reference cannot race with the thread exiting. Drop it with
kthread_stop_put().

Fixes: 688bc88e2046 ("ocfs2/cluster: keep heartbeat local node stable")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260616074931.3774929-1-zzzccc427%40gmail.com
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Reproduced under QEMU x86_64 with KASAN, using one node over configfs
and a loop device as the heartbeat region:

  echo 0 > cluster/c1/node/n0/local     # heartbeat thread returns
  cat cluster/c1/heartbeat/<uuid>/pid   # reads the freed task_struct
  rmdir cluster/c1/heartbeat/<uuid>     # kthread_stop() on it

With the patch, that sequence, a normal region removal and a start
interrupted by a signal ran clean on two CPUs, five rounds each, and
every heartbeat task_struct was freed.

 fs/ocfs2/cluster/heartbeat.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99bb076..a4c8ea695f5cf 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1966,18 +1966,22 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	atomic_set(&reg->hr_unsteady_iterations, (live_threshold * 3));
 	o2hb_set_region_stopping(reg, false);
 
-	hb_task = kthread_run(o2hb_thread, reg, "o2hb-%s",
-			      reg->hr_item.ci_name);
+	hb_task = kthread_create(o2hb_thread, reg, "o2hb-%s",
+				 reg->hr_item.ci_name);
 	if (IS_ERR(hb_task)) {
 		ret = PTR_ERR(hb_task);
 		mlog_errno(ret);
 		goto out;
 	}
+	/* The thread may exit on its own, so pin it before it can run. */
+	get_task_struct(hb_task);
 
 	spin_lock(&o2hb_live_lock);
 	reg->hr_task = hb_task;
 	spin_unlock(&o2hb_live_lock);
 
+	wake_up_process(hb_task);
+
 	ret = wait_event_interruptible(o2hb_steady_queue,
 				atomic_read(&reg->hr_steady_iterations) == 0 ||
 				reg->hr_node_deleted);
@@ -2022,7 +2026,7 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 		spin_unlock(&o2hb_live_lock);
 
 		if (hb_task)
-			kthread_stop(hb_task);
+			kthread_stop_put(hb_task);
 
 		o2hb_unmap_slot_data(reg);
 
@@ -2208,7 +2212,7 @@ static void o2hb_heartbeat_group_drop_item(struct config_group *group,
 	spin_unlock(&o2hb_live_lock);
 
 	if (hb_task)
-		kthread_stop(hb_task);
+		kthread_stop_put(hb_task);
 
 	if (o2hb_global_heartbeat_active()) {
 		spin_lock(&o2hb_live_lock);
-- 
2.53.0

