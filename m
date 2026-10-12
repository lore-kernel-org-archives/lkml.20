Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AA49158B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815772; cv=none; b=At/s2HqzsG/AQA3kNsU74X7VBBozUThbKfS9AO8Q0zXwzqVXHdgIrwce09p+jEUcXnMFqsobSIUEQ3B3CWRCo3yNWga1j5T7BTV4fv1eYKyK6UNwLC2KwKM7fc2mUqOaOHzIc4YrDxSQUPpCCV9ZyfKhbcx2HNBZSTk4YwwL+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815772; c=relaxed/simple;
	bh=jLvx7f5taPCknuZA6yoWw8CpXgAbuJM5Q76HWKuwL/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbL0CVIPhOTmGFju0O5gX8/RBOIMhP1JOh7GHDkWTne/Hs7XVKv4+4faE0vN/VDTGlrWKRaFXVL8dAB9f7ZpbuOhmqiKkGBGJLgvU6yfGKhv4m+D+dYTXnrNXiMPEr6/Y6YEmn8d2IRhpvP3nSk5XIFfjxfmuDANnYSpwRoyQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJvclqtx; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJvclqtx"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1243133a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815771; x=1792420571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=av3TApRLwlCgI/0NoDjmsZVXaSjZejMi2rqFbu1zbcM=;
        b=IJvclqtxWGwiswfOIOMqzvRzpDUsAGkKkLJUHkrq1vq6ug4juOkyoAT1EO5jvegMRT
         J8Ye5Pp83DDQIOLhRympP8TX0Iq0t77g4FDrIfJRxRJ1WqM9DNMA1Mufb3AQ62IIXGig
         T5xloM8uEGhNu67uhVXgP9aCSZDE3I8RZQQ5n2EoS+bMOBkhgNhOhw32E2rFsKOL+4p5
         LrKdou+7BUnSJyAZnjwqEkj0FU3eW+P/HVWEzHZ2YFKug1IgFxPanbemj7oVFAZ74ruI
         WY2vN7tWKaOzOys4TUON92IK/S1OH4z0BXXp/12QypgjfWHbZC8GDX6NTvyMo3lbSHGR
         C3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815771; x=1792420571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=av3TApRLwlCgI/0NoDjmsZVXaSjZejMi2rqFbu1zbcM=;
        b=iocjUohxtsH5p7oZrsrc7VuJNMP0v0OvW+5QGvXYB0orS32hV5Jui7XasxxQfkT8aV
         KvqQntq1oUpeC84XIPqpmlV9vQxGeq4B5GffAIlUHQ2WIU27J64YzyKrekK/DLPbVr/y
         psPC/cO4onyuAPLCeOkEDoZeIZucPt1MdcufRj1F8YOY+DMA0M29rLXLOkM1FHb3YdI2
         FrqFuxQq6y8svg59evgduSAj0BqsvaMNOQcIidjb5mMCFthdSq/K5xohFPbRP83NExNc
         B5IxVAP5XNQjbX6m8Cq8zyyrIMAWH9EyGHS+7AnJsv2LGHA/JcWdgf2IXPugO+CqaKKH
         pACw==
X-Forwarded-Encrypted: i=1; AKwUvBw6eIzDhct3tUv/97z31mQ8aIFaRIR1/oXegv2HNIVkriplTTFWH3nMVh1aCAhQSzchGbw1/xh80HzVOfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxZz+y+3voq2PZbJbT5dC241/bmbjM2MxDRzG69D5vWUMTyuca
	/rlwdB6KSNFdna+B+k07vWsZDYgynEe7Krofuv756AYqhlGbM6E6+ctY
X-Gm-Gg: AYBFou0Kr0vRFtsaCUiypubNBID6Sf1PGZkc+EqaLBjgazcAiIDQFA0NwTV+ayxdMkB
	/5ZL1MClgzRqG47dABfK/V324wD14kEcl/V0DoOek+g1AJG2p532SLNiUA3faMVZXe1HZZlL2l/
	qph7kbRXfvoHnznDUs3ce1GR8DMgdiWfQZ0RFY2PSRjNK4oKB8r17Vn0BeJp6fvCirnUKyzOmQZ
	A10jYdHGLTDMFqPu38JIqTVzLjLswQpoZMnwXGOvarXKCo1r5wCzdA1KRIVGEoIT/ZJLHTYlXX6
	qGNuqmvmj3cdO7P+8NqV2kNPlWalJd38JoTQLzMhhFygCv5D7sVWGsIzBz0mA9cTFfrJMR1YsA7
	zgyfifDKISSRiezo4VktpizVw77c1NeHM6kcLvvc2I1opKfioD4SCrujsoqbpWv/UOacLH/InZ0
	nnYgEIVjy/74siXFEL74Ypx2MEsIK9cgh6oNDdr7+I5KNvCixm030rHYRbTawjpHDkQB8DXA==
X-Received: by 2002:a17:902:e790:b0:2dd:ad74:ac1d with SMTP id d9443c01a7336-2e842cfc98dmr86470415ad.24.1791815770679;
        Mon, 12 Oct 2026 07:36:10 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::3cf:23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4ebfsm45043745ad.78.2026.10.12.07.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:36:10 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Subject: [PATCH] workqueue: annotate the lockless nr_running read in need_more_worker()
Date: Mon, 12 Oct 2026 21:36:05 +0700
Message-ID: <20261012143605.281358-1-ngocthang2710.1999@gmail.com>
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

The race is benign: nr_running only goes 0 -> 1 here, and a stale 0
merely causes a spurious wakeup of an idle worker. Annotate the read
with data_race().

Reported-by: syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8922e6b8343f70be92e8
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 kernel/workqueue.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..18e74d9a0696 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -951,7 +951,11 @@ static unsigned long work_offqd_pack_flags(struct work_offq_data *offqd)
  */
 static bool need_more_worker(struct worker_pool *pool)
 {
-	return !list_empty(&pool->worklist) && !pool->nr_running;
+	/*
+	 * wq_worker_running() bumps nr_running without pool->lock. A stale
+	 * read at worst causes a spurious wakeup, so the race is benign.
+	 */
+	return !list_empty(&pool->worklist) && !data_race(pool->nr_running);
 }
 
 /* Can I start working?  Called from busy but !running workers. */
-- 
2.43.0

