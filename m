Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0B3F54CB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706600; cv=none; b=M+pN/CoaQVR3G5c55khUEiQPwBk6FqIUD79vb40it0hhV9EWzRLipwRU9q70+zKBUfi4dhxup30mWOtS5a26ohPu3BFjjzT0oIElGXP2X9cSXul1/bO+NoJTRDpLpMpVURWRaQQSPZSXcue3TErwIL5Ev7U2+aeAjojxuIyljRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706600; c=relaxed/simple;
	bh=46ET4W7WJ3gYq2z7JdfR+Os2FMA405rRKsHy5lfud0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnj224HcqCGCA/07xfMeiuHyJLHBxQsHKNv6SkmFCQlrFW+oEx495yQgyRuEQNiWOwHYvR5mB6odxcMj1CO9zxoMEYdgWF4m2mTdIOc2iwCmbsC745tK4gb69hsrBJnC8Ed5yvTs5kCcyBM90hV7wpT4lj5V4IJg8HTzWZjEghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnOCwXv1; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnOCwXv1"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so2715806a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790706598; x=1791311398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkglm9OMtLLq8niEy0BQYMv0TQkm+fqKISht2nS4MWE=;
        b=NnOCwXv15gciJx5mhXX1kiZ6j0NC6jXmKCHu1LA+zXJE5A+4PwcNYMquJ4vhrVBDVs
         Kh6xXm4tv/EIpW1WV22UUpaSylSJOjmnGwOvEEEPwB9DG+D9R4rCf7YURkCuCzRc3VO4
         tWBqehVH2+D27q3Kv/W4aDhOkQEn3m0bjifB7bLaHm7SSdEPg+plLRzBnu8IeSGIi42G
         kJIZ87Lfrku/dFKCPcABzsn5WrsUlZWco9y6HLK1yZSHOk55C4jWCaZO7cf1MlxnBhbl
         iRpjz1tlK8HSxyF1PJMi3QnJpyyFEx8ZG8yA+gCgNn9Nk+8TtzhTRW7rSmgqnMpChjDl
         GgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706598; x=1791311398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkglm9OMtLLq8niEy0BQYMv0TQkm+fqKISht2nS4MWE=;
        b=Rqkb/PWSw7rUOpZqRjEFBIcahnn1FU/UbO5g4f0VzXISJfGkwRMJpECu2LMjfz/v+V
         H1atiKSiRs2C5IYe1x03brCUDhBQ/ZItF4KaA4rGHJ55nyIhIZ+yUV1dklMdZrv17zM2
         UsFRsYzgVakQMSm/UTlNs3LfgaN3ofpEVVGQ0wdetuyCcXaakOc+WgEfb8yfqay1RHyE
         NhI2ahxN977pK9oV1xpb8LpIu3h/pgFdsAUGy63bCvUTIIObUdiF6W/32r9aP6nuqJYX
         gu5szJmPGcnYeOuE7RidZbHVMUYSJymDcaQaOKlG4mh2yshaU633d7a9TO2HsZrG0aVd
         ucfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDVCW9sH1gGKHE9ZYTAxiee+2ID0a8hMLXjUXgMKLBy82zIMvSccvOCwvm/VgtRtYxpccFaM8kVS5JEzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvn4mtY41lDotKSyMwkmGP36B58cy/eX1MxhmnVcE7PPxkHpsp
	t3BIXorUEIErHhXZ3ACvpw3VL1HW0KbQwHDMnI0bvX3wGgDJY96X1AW/
X-Gm-Gg: AYBFou0m1ZRdYQrTtzlZHR80+y8MzV4UXiHWu+D9OPh3dKegtWwVZS/uSz6NIrpFlKM
	l3TgYQHy/wAztnn9ajyXcO3+UunG78QG6U+NTi3F6vu7GKZ5ojb7tURKOoaSkKDIXiJ+/c8tNx5
	DEjDO+KM/v9RmIDaRY9Ak6i2XWIJv3Kclzx7QnDvXwA1zKy7A6sIH6iVOS235lutkogpl2kk7C0
	O/NrHguJXEVsWlF9ce9ZYlRI5siMTS2melMsinwJWN3fZRUS4sPPC5hlQUcZZk19Vu7HUvRzQMQ
	y8vJI6847vUTv5S35a4AklEJ4mFoQYaByJcFmEsHe/QDQmRPe61aMeXqcSqKz1KHjYx/zcX1ICc
	yO1NN+Yonr2Z+xzVO8U/7zmx5pAQc39rjva7jpxMgT8g/4EYZe2Crw2ZzA91/wznp4GE9QWI7o1
	ptwP8TEDiZ10raAf+l5bpW2jk6I2fwDQLKQnWD6L2Wo0Ymcj4sl3LSnusKFHJiNY7DzylPPxX3c
	pfsHWLKFZSmADuBrS0Krd2WyhLdWFf5
X-Received: by 2002:a17:90b:2f4d:b0:3a0:e8ac:9f7e with SMTP id 98e67ed59e1d1-3a4bfe21605mr162597a91.35.1790706597837;
        Tue, 29 Sep 2026 11:29:57 -0700 (PDT)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4bf8a3d6csm377766a91.6.2026.09.29.11.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:29:56 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Wang Jianjian <wangjianjian3@huawei.com>,
	syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] nilfs2: ignore non-fatal signals during synchronous log write wait
Date: Wed, 30 Sep 2026 03:26:54 +0900
Message-ID: <20260929182954.109470-1-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on a syzbot report, Wang Jianjian pointed out that following a
successful directory operation in nilfs_rename(), a synchronous write
requested within nilfs_transaction_commit(), triggered by a sync flag
set by nilfs_commit_chunk(), could be interrupted by a user signal.
This interruption leaves in-memory metadata updates intact while
returning an error, causing inconsistency with the VFS dentry cache and
ultimately triggering a kernel warning.

According to "signal(7)", local disks are not classified as "slow
devices" (such as terminals, FIFOs, or pipes) and their I/O operations
on disk devices are not interrupted by signals.  In kernel space,
waiting for such disk I/O should therefore not be aborted by ordinary
(non-fatal) signals.

Suppress this issue by modifying nilfs_segctor_sync(), which waits for
the log writer thread to complete synchronous writes, to catch only
fatal signals via fatal_signal_pending() and return -EINTR rather than
-ERESTARTSYS.  To complement this change and prevent the wait loop from
busy-looping when schedule() returns immediately due to a pending
non-fatal signal, switch the wait state from TASK_INTERRUPTIBLE to
TASK_KILLABLE.

This serves as an effective interim stabilization measure without
structural changes until a comprehensive fix for metadata consistency
is implemented.

Reported-by: syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f6c7e1f1809f235eeb90
Fixes: 9ff05123e3bf ("nilfs2: segment constructor")
Tested-by: syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com
Cc: Wang Jianjian <wangjianjian3@huawei.com>
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
Hi Viacheslav,

Please queue this for the next cycle.

This is the first step toward addressing the state inconsistencies
during directory operations reported by syzbot or on the mailing lists.
It improves stability by preventing errors caused by user interrupts
while waiting for log writes, which are triggered by synchronous write
flags following operations such as rename().

As this does not fully address the underlying issues in error handling,
I intend to continue exploring changes that allow directory operations
to be properly canceled or rolled back.

Thanks,
Ryusuke Konishi

 fs/nilfs2/ioctl.c    |  2 +-
 fs/nilfs2/recovery.c |  2 +-
 fs/nilfs2/segment.c  | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 01a04080ef70..b2b67d6a1f09 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -965,10 +965,10 @@ static int nilfs_ioctl_clean_segments(struct inode *inode, struct file *filp,
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
  * * %-EFAULT		- Failure during execution of requested operation.
+ * * %-EINTR		- Interrupted.
  * * %-EIO		- I/O error.
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  * * %-EROFS		- Read only filesystem.
  */
 static int nilfs_ioctl_sync(struct inode *inode, struct file *filp,
diff --git a/fs/nilfs2/recovery.c b/fs/nilfs2/recovery.c
index 9a70c28ec94c..abe4101f7550 100644
--- a/fs/nilfs2/recovery.c
+++ b/fs/nilfs2/recovery.c
@@ -790,11 +790,11 @@ static void nilfs_abort_roll_forward(struct the_nilfs *nilfs)
  *
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
+ * * %-EINTR		- Interrupted.
  * * %-EINVAL		- Inconsistent filesystem state.
  * * %-EIO		- I/O error.
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  */
 int nilfs_salvage_orphan_logs(struct the_nilfs *nilfs,
 			      struct super_block *sb,
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 2f0e59847d02..af0c3560444f 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2259,7 +2259,7 @@ static int nilfs_segctor_sync(struct nilfs_sc_info *sci)
 	wake_up(&sci->sc_wait_daemon);
 
 	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
+		set_current_state(TASK_KILLABLE);
 
 		/*
 		 * Synchronize only while the log writer thread is alive.
@@ -2273,11 +2273,11 @@ static int nilfs_segctor_sync(struct nilfs_sc_info *sci)
 			err = wait_req.err;
 			break;
 		}
-		if (!signal_pending(current)) {
+		if (!fatal_signal_pending(current)) {
 			schedule();
 			continue;
 		}
-		err = -ERESTARTSYS;
+		err = -EINTR;
 		break;
 	}
 	finish_wait(&sci->sc_wait_request, &wait_req.wq);
@@ -2311,10 +2311,10 @@ static void nilfs_segctor_wakeup(struct nilfs_sc_info *sci, int err, bool force)
  *
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
+ * * %-EINTR		- Interrupted.
  * * %-EIO		- I/O error (including metadata corruption).
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  * * %-EROFS		- Read only filesystem.
  */
 int nilfs_construct_segment(struct super_block *sb)
@@ -2341,10 +2341,10 @@ int nilfs_construct_segment(struct super_block *sb)
  *
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
+ * * %-EINTR		- Interrupted.
  * * %-EIO		- I/O error (including metadata corruption).
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  * * %-EROFS		- Read only filesystem.
  */
 int nilfs_construct_dsync_segment(struct super_block *sb, struct inode *inode,
-- 
2.53.0

