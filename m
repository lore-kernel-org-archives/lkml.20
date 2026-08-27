Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940C45518A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835141; cv=none; b=PB6jPWEv1X/QVmUqfsxKoTun0oOMGd0dX2mlogZnhNi6IrDjrKpX9GeeOaLcWKb0MvruTTW+AEfj/abekhfc8cMMOD4WnFSvkWuXVNlzdI8DcscAICUOdTUZo/UmlkafMG8YyT0j5e7P7OSPd/C8NnLG4gWWC0hTBbVAnFzkvmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835141; c=relaxed/simple;
	bh=K9axMah5qz+QEVhEz4bEKeBDM+BV3dE8rnC3WGnMggw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxQGfMmDMqjPLV2SK+82uPHEg6/q9wVca7dG56nV8+qbg5BW7MPJcC+6gzkJXWkh4MYQr78N0CSA8VncZ3PHLm/PxxemsOtGDCD/OMrhMgDgkLPRZqLEsXm/PjaQVt/KkUEi+kvJPzFMxbilAwkZ8RmwKu2dvGaxD7UC+wDgyfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZS2CEG7+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZS2CEG7+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2178399a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787835126; x=1788439926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78hHrlgtsKFYxigQeu7K4G0bR4FTknBfS+NNz2iRaEw=;
        b=ZS2CEG7+6FnT9MHh1t/rl43R87L+VNge9wqQsrIrWM/0hFZSyA3efgywPBlgCvNHbr
         FkSzAmkJcTrIcl+6SgOqeE2Ds6IatWVsA7ivi2FkbmdFhB/xgBeET6wcoYcmFr2DSFsA
         FOZ/BWx+9nvV72liq7NtbZJpvHT/xcxIk7Px8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835126; x=1788439926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78hHrlgtsKFYxigQeu7K4G0bR4FTknBfS+NNz2iRaEw=;
        b=tAfj1XCOYQ5hEbPnCbbebOBjjV/NB5mTOiyg7KerlH8Bl2LVM+tW6dqnBVnL/QQ73Q
         K5qgpS1grRLFo3rcgI2/0xB1kiCtpEzV/9c6OU8kXGUdG01qWFK8JE1EdtqFFgPDQoPt
         8FyhBLuj4x+gO+W+v9UPu6o78W59Y3OWOdcipXqkuXvz4WY7+GchMB61Fj9PqY0M+MCr
         7TnrdiM016R0tRoAr4SFPPIDHFMcsoFrfehxRcEFWxWbMxaCg/q292VTKoiKTrKp5aje
         DbXKkzeM1ryi2+IKrgTYuZs9UBlEVIttYVAYEGnFMCTZ9EIG6ftRWLO3XnQOf9SRid+e
         hyag==
X-Forwarded-Encrypted: i=1; AHgh+RpzxrNLir4+gBhzKkKRSIXsOKXmWuG8q0J3SLHlY3hiMNkXMux1hQv39D7h9sA9VMs1nHkgVzEYOPqUiDU=@vger.kernel.org
X-Gm-Message-State: AFuF++kKkvTlfwxhCtHybnZ1+nPSrq8NB4bwTmqfGEzLBgdAfLQdSSyy
	4sU01J7/tRZ7IDjZyFYt+qO3G2xrY3a+yi8e3vWXTbT8ye+aCmw0fVvKrLpMmDawAA==
X-Gm-Gg: AR+sD1280a0CwAyOIoFruIPlchsTC+A0I9qqxICEq2G+ARxbL9/j6Wp1Hd3iD6jF6Zf
	IEVvxktdmgt4eRTwJtToKy7/Pk2IcwdLxY9nHpWBqbcPWvcEbf1FC4wofC2SV3sUBTXVAOD/nQj
	IyZNnCt1KRDUlZ15JXl6+/RRMVG/vGsdcqtXT+yf/Ad4/P9EkWICRatiIpOmf/eAMMK1L9orf//
	r6L3qYZVWFYigTXAg6aUiTVvtycsnlez7e09KkD49UiHCuKB+RFzYBagBmUNqm76JJwAjGLd/ml
	hd0/xO4xI3+S+5bDuxDHd0vBz/9FBQqxA7OfmPtFk8asL65USSgN2chsKy0uvgFDODY1P/BuwMQ
	Z4NKH7pd2ZZucF2tna06iHj0vbH4YZe8msjebs6mz5D9fNlypCZHLay2Gng52R3jx1taSIXjuGC
	fYglu9T+wtOqS6ZXsH7SFtzmblnEHDAub/OMZSHngpLy6XZuf6OM+Cc75IlBRin6BOnKsd0QAqh
	J5eMFe3jV1Mh2QB0xBFzudOD7YchVAAuu2pRkmoYS161aDOKYs=
X-Received: by 2002:a17:90a:dfd0:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3966d3a8f3amr32347128a91.8.1787835126108;
        Thu, 27 Aug 2026 05:52:06 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5edbsm2726158a91.11.2026.08.27.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:52:05 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>
Cc: Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Sarthak Kukreti <sarthakkukreti@google.com>
Subject: [PATCH] fs/ext4: fix ABBA deadlock in ext4_rmdir()
Date: Thu, 27 Aug 2026 21:50:20 +0900
Message-ID: <20260827125158.4030598-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We observe the following ABBA deadlock (casefolding enabled):

 INFO: task jbd2/dm-13-8:447 blocked for more than 720 seconds.
 task:jbd2/dm-13-8    state:D stack:0     pid:447   tgid:447   ppid:2
 Call Trace:
  <TASK>
  __schedule+0xc2c/0xe60
  schedule+0x40/0xe0
  jbd2_journal_wait_updates+0x8f/0xf0
  jbd2_journal_commit_transaction+0x321/0x1850
  kjournald2+0xa9/0x230
  kthread+0x226/0x2a0
  ret_from_fork+0x101/0x1e0
  ret_from_fork_asm+0x1a/0x30

 INFO: task Thread-10:4161 blocked for more than 720 seconds.
 task:Thread-10       state:D stack:0     pid:4161  tgid:3848  ppid:540
 Call Trace:
  <TASK>
  __schedule+0xc2c/0xe60
  schedule+0x40/0xe0
  wait_transaction_locked+0x8c/0xd0
  start_this_handle+0x252/0x870
  jbd2__journal_start+0x120/0x280
  __ext4_journal_start_sb+0x11a/0x250
  ext4_evict_inode+0x208/0x760
  iput+0x222/0x5c0
  dput+0x293/0x690
  ____fput+0x145/0x2b0
  task_work_run+0x7a/0xb0
  exit_to_user_mode_loop+0xc0/0xd0
  do_syscall_64+0x14b/0xf10
  entry_SYSCALL_64_after_hwframe+0x76/0x7e

 NMI backtrace for cpu 0
 CPU: 0 UID: 1010216 PID: 4160 Comm: Thread-7
 RIP: 0010:d_walk+0x0/0x290
[..]
 Call Trace:
 <TASK>
  shrink_dcache_parent+0xb2/0x100
  d_invalidate+0x50/0x110
  ext4_rmdir+0x3a2/0x3d0
  vfs_rmdir+0x9d/0x1d0
  do_rmdir+0xf0/0x330
  __x64_sys_unlinkat+0x34/0x50
  do_syscall_64+0x61/0xf10

The problem is that ext4_rmdir() calls d_invalidate() before stopping
the jbd2 transaction handle.  Because d_invalidate() traverses child
dentries it can encounter dying or in-use dentries.  If a concurrent
thread executing __dentry_kill() on a child dentry invokes ext4_evict_inode(),
it requests a new transaction handle via ext4_journal_start(), which
waits for all running handles to close.  However, the thread executing
ext4_rmdir() still holds its active transaction handle while looping
in shrink_dcache_parent() waiting for the dying child dentry to complete
eviction.

Stop transaction handle in ext4_rmdir() before calling d_invalidate().

Fixes: b886ee3e778e ("ext4: Support case-insensitive file name lookups")
Co-developed-by: Sarthak Kukreti <sarthakkukreti@google.com>
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 fs/ext4/namei.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a6386c1d237f..231a274b814e 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -3209,19 +3209,20 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
 	ext4_fc_track_unlink(handle, dentry);
 	retval = ext4_mark_inode_dirty(handle, dir);
 
+end_rmdir:
+	brelse(bh);
+	if (handle)
+		ext4_journal_stop(handle);
+
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at ext4_lookup(), when it is better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
+	if (!retval && IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
 
-end_rmdir:
-	brelse(bh);
-	if (handle)
-		ext4_journal_stop(handle);
 	return retval;
 }
 
-- 
2.55.0.897.gb25b4bd76c-goog

