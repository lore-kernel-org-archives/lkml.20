Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2C4FECDB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992630; cv=none; b=Uc/S3+pFvl9Cfv9l5uR9i0mg9ga7vPYrZG1b4M7v6WdaU7MUH4Gy+Q2iF4r0CA0P+ZI7P8nC6D17WwhqTCK+l+sFv1ANrocLjBSbeFciyQrkQ2opOhueK3NQ6Wz6EI6PB+7kN7ugk/hNhMflHK9YGd/T87H4zNmDBA8jRDo4LhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992630; c=relaxed/simple;
	bh=U4WG5pb8sxZibKg3wNFp1m21yyOvLw8ruZUZnFXKUns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgjNgjmm5nEuNorT2zZj1tNpCyDUoG7dRzF11MqktXOrmvya1LRavUeFzftMQUZq7RC1FnPvduDqwGrbqw76mRHvvnSP7OLFyXUZFJHs3xCH/jMlTGhxn5/iB0EzjiL1Nd302pk1nwf+kpfCk41IuTdMC/NUL3/U72dw64SCnks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcP4Iwiq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcP4Iwiq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so484238a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992628; x=1792597428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBbdX1z9eYdKjghsytWZId37PkdX6IOBXVBWgE/X6Po=;
        b=CcP4Iwiq/mUou/CbnOi0VH+o/Dp9Hko4S5lCD/wzhde6j27Ef3CHkZBJEtOHlXiEWS
         dB7tgOrngmse8Bi1HqEC8SOw8dxSOSY+42Z79XnQk4fGYND3QKLZ97BXn/1pW7E6o632
         TwAd/tBb1tMZf6IUZs4stOY7fNW7/oX4ipCWK96QlkjMdDAvDDosfcgDvNqH+2fE77MU
         e75yKA1KVzkCgnHH+USS3TVimF5ruQl0+iDdwv9wAVAWnZhCfMOT2QqIWplZgF8mArcF
         3fJZ+PNYJBXtLaexqnQ+UQ+LjWLaJE7bxjMsU1cOoTUTP3+iOJq8vq09u/lC+wM2FI0d
         dskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992628; x=1792597428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBbdX1z9eYdKjghsytWZId37PkdX6IOBXVBWgE/X6Po=;
        b=ypjU4PoHJFumLfWdOfttzUo/YljoQ8Z7/kMSZ+jZFDXn7xLI071ibsX7w6qQmBLNpW
         HBklLMGbqObZ8seEmMgY6QP2bzXnmEjlf9TMRTxAXMBHXMhiupIhPkJrwCk4M0fGc8Fj
         ZiedX6CG7uc+oo5gwrssNSWFGo6seZy5J7JBiTwlwcENH5D1bRT+u8qVPFqPNenzoH6f
         XCZAf9qTJwo5873KXAtp5YR5Cu48HqHDTXkIN8bUd1XdoX4mMzEhZZ74Vpg3A1IkdaMx
         pRhxMJH5raBmhBJgtmAKhexo8P3OpAZ6+7M7grO+YLYK00pB1qLfcm3vrfej8fWYjoPo
         YYew==
X-Forwarded-Encrypted: i=1; AKwUvBz/WENdg76zNJ2JxxFFDTzhCuTrbHm9Qms/k2pWV3E+HIgcM//f70lU8VslJ1HFAJaB0FIDDmD3Zj5pP7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyr0hESGJm6fI5/LiCKkuC5Nfg2qw7vSN6ohonZRWeXZq16Vpa
	999wrHQH4eaz1X2Z4uDFdvsTBjva4vwDSVxbtyXcD/edWAcPdIL8kZOH
X-Gm-Gg: AYBFou13JBYugLRD9b8rWady+8pd/eihqePggMtuQL5pQ7hD6sg9b89DIcD52vcC6rD
	VHwGeOlK3T5XbPpMddFIGlfjpxaaWJHCn/oEB1vox1RfqC3Q5tb0dX1snENX3EpklZb6zM/Ros+
	vIBiqtnkFe4Tg7xzRXMDRr/b0YS0QbKNWxx2gGbCiORhygNO/xH8I/9fUqmMv86t//PomInEt9f
	nGEEipwMBVW89bic2P8SAjJT6pBgUscQhZVfAFVQ3xJiahp7hJrc5txut7PHyV4HO0zekBe8els
	XzRKu4+cM4UL9XNiGXCvkH6SAYtZ+DNYOhBUceaHD+kTKBP+ofQ6NNqhWizUG5hB0MbpIfK1LUV
	8kYMXWCwFjpoO9Cpw4DdHbE4DGBe9ZnigaPZG9GSgwFTLA5NjHwF44g4WicXaYqkwsRSMdqYIdy
	g1gEFzMWSeBO4JKlo78Nms4MUfd3NXKCNeddkPTrAcbp/K4k9rxY1vCx8z93KOb5Lf7WGsVuno3
	JKHgocD45I=
X-Received: by 2002:a17:90b:50:b0:3a7:d9d9:b305 with SMTP id 98e67ed59e1d1-3ab3acfd905mr12568374a91.52.1791992628214;
        Wed, 14 Oct 2026 08:43:48 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:2e1e::498:19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94f939ca6sm4342365ad.17.2026.10.14.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:43:47 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org,
	syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Subject: [PATCH v3] workqueue: mark pool->nr_running as __data_racy
Date: Wed, 14 Oct 2026 22:43:41 +0700
Message-ID: <20261014154342.20661-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wq_worker_running() increments pool->nr_running with only preemption
disabled, while kick_pool_pick() reads it via need_more_worker() under
pool->lock, so the two can run concurrently on different CPUs. KCSAN
reports:

  BUG: KCSAN: data-race in kick_pool_pick / wq_worker_running

  write to 0xffff888059c2af24 of 4 bytes by task 3007 on cpu 0:
   wq_worker_running+0x114/0x130
   schedule_timeout+0x16e/0x180
   io_schedule_timeout+0x4c/0x70
   submit_bio_wait+0xd7/0x110
   blkdev_issue_flush+0x4c/0x70
   ext4_sync_file+0x60d/0x6c0
   aio_fsync_work+0x7f/0x270
   process_one_work+0x4ae/0xa00

  read to 0xffff888059c2af24 of 4 bytes by task 3001 on cpu 1:
   kick_pool_pick+0x7a/0x3a0
   __queue_work+0x72d/0xcf0
   queue_work_on+0x9d/0xb0
   schedule_on_each_cpu+0x11a/0x2d0
   vmstat_refresh+0x23/0x140
   proc_sys_call_handler+0x2b9/0x4f0

The race is benign. The increment in wq_worker_running() is the only
lockless write to nr_running; decrements and the reset are done under
pool->lock, so a reader holding the lock sees either the old or the new
count. A stale 0 costs at most a spurious wakeup of an idle worker. A
nonzero count is correct because the incrementing worker is running and
re-checks the worklist under pool->lock before it stops counting. The
increment can also go 1 -> 2, e.g. when a worker sleeping in a work item
wakes up after kick_pool() woke another worker.

The lockless increment is part of how nr_running is designed to work,
as the comment above the field documents. Mark the field __data_racy
so that every reader is covered, not just need_more_worker().

Reported-by: syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8922e6b8343f70be92e8
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v3: (Breno)
 - Annotate the field with __data_racy instead of using data_race() at
   the read in need_more_worker(). That covers every reader, and the
   lockless increment is already documented above the field.
 - Retested with KCSAN in QEMU: the baseline gives 13 reports in 1 run,
   v3 gives 0 in 2 runs.
v2: https://lore.kernel.org/all/20261013112905.9673-1-ngocthang2710.1999@gmail.com/
v1: https://lore.kernel.org/all/20261012143605.281358-1-ngocthang2710.1999@gmail.com/

 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..f285e68d6ee2 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -208,7 +208,7 @@ struct worker_pool {
 	 * but w/ pool->lock held. The readers grab pool->lock and are
 	 * guaranteed to see if the counter reached zero.
 	 */
-	int			nr_running;
+	int __data_racy nr_running;
 
 	struct list_head	worklist;	/* L: list of pending works */
 
-- 
2.43.0

