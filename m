Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898833;
	b=iq6F7J3yEij229tRqpkmxjYPRlljbA1LF7W7MEGpu7alXwMeZuSmnqmpJqsjjPrSO9pL
	 wzSf8ptzr1PdaCJZFKkGMvRsDno1e4W9a8/gKzdQYBEJ0tPmotDiB+FKc+mA0FIA+etN+
	 PzczEk1uu0/bHb4M2OpMXj2e8yQsz5cJBx27XpFHIkD6YrewMSwX0JNJ+gj1Z7MY/z1fs
	 NVe+t933XP3qgDwnHmD4ppvTHF7TkXDUbK2PDTUXWgcYgJlCQadfrcP1V8aFsxtFcKjOp
	 i2xZeWtJnnzbBoGvnPjwgFoeQ80LpofbWz2o6wkn7WTZGky99lyqe0+cRleGvqxeINA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U3P0AtUP4KhdIQUUOen9w3NNVWGFvqPKse8JMMmbPrs=;
	b=xzpmRJFtO3pQnNE5yX833rgpfL2nvMKGXYE4TqqOVCGlcQEV3928DlFbJmWvFqUyPjwk
	 f/kunxNV1ZgZUwvfTSMRy7/GbbeIivRNTNQrymxWsb5beo5zelBBb1Njg6t0TR3jE0BDm
	 DV/iwtA0O4gZYPTdRV4+OhYzJmedoaAJxi7jbOnny2ZTs1GKaCyLqJHkinb3OM/LFLB17
	 FBHkqKtnMlExx6Q74VHMYpjL0swkuK7exjMA6tzH9bTODAt2hVZc5xDUVQAuMSBPV/oQO
	 Lcb2AkaBG6W2reZcWtxZeNl6Et0O6c49cY2x959oumkqZc2SgtbQj5eMMbSeb/85uqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyJIe8xr;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138B1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyJIe8xr
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so3598466a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898832; x=1795503632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U3P0AtUP4KhdIQUUOen9w3NNVWGFvqPKse8JMMmbPrs=;
        b=JyJIe8xrk8xiPUcvsHsEcRidnCdGZFjXxFdcxtG9o/wo/7nJen4lULHEYLucXN892I
         brfSu6eMC3cvnBddRolr9i9OaBVwWnKHwjS+MGhD+4BS/0IgLpqf+e/PUnvtdB0ZVExf
         fjTe/a2Ryz5+eu3H8kO7D24iao8U1xUZW3YgNLpGfwS3CY7/Ug6fOffhKeLK+QXydZgl
         UQMdGanFjm88jDaG91628TPNrjrCguTiZEVSjIYkZ7yvpv8fNhNNLDRVF58fUURAxa03
         wNuf3M+CVZD7JKbQGGS8ATay8rWNbUzcQRqHgaIZEHKJiDlB/uHL/gkCGDHi4Q2vq4Yv
         5ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898832; x=1795503632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3P0AtUP4KhdIQUUOen9w3NNVWGFvqPKse8JMMmbPrs=;
        b=kXZir7xW3RBaRxrh881x/90fgSSGEgknVZZLM+gYUHUdOzC7fjbVPBbJUz6e0rQL5Q
         nfmqHv7+RGThpJ9pFxqiCMxM8z64UdhgZ+xgsTvvZxsQUhRJpPt4LFbLlIE6FgYkVD++
         MsgX965af5GEQGsGXIVatxDnvOuiiUbs2iecypsc3qhBG51Ofjnvz5RYnRoBa86a3m4x
         z9KMfDSaicntomJPY5OMf9/tTYc39iDfPg5y1sSWnD6tBKgct+iywPuBw8Q69AvZCpgd
         gjI+6EmHp1Nd8dlmkawd3cYZfl8qNDM+n4qwUrCBFrqMA5L4flqeQnVaXAX4aKe9BZEy
         B7pw==
X-Forwarded-Encrypted: i=1; AL+hErGS8TyN8k8euvNIjNoRNvaYdJTAXOowOgOvqjT9tKQRSkHxWSq/c7msPg1mU1e9wlo5A9mtASKUZNnSr1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ywRZoGax+ddwveQ04gQd0gIl5TSKsG3MXQh7SqYpJ0qipUEvZ
	WeQ+x3yAREHsmLRwe/7QRiR59MjE2fSmqsFvyYepTMJ6n3ItHBdNTVDj
X-Gm-Gg: AZFdTZewYTfSjPSiKvPeHtu8eTna/nIlYyJ64+h0vVlEJzhMkCEeMXrJLxPHkSQVSF7
	bSMRvmbsc0o+wCfGmF4TEmxay7xOPqg2/YFn3qAyVXU8PhaV9HNGOWSwKq9S1bNSHSIPX3NGie0
	BkvVYeDJiBV7YOt93zvj2jBf6kAgJ0RmkK10i8+i8WWNqXFBsvbT4ngUbCAbe9xrwPsoA59eva4
	jlO3iK1/0EHijem5jWA29IhMR0p1c9ljjLhrK2uGMq53B+MQOm/4Y1EiNDvthxm4tvuczEaX+f3
	7RZHavghr1fBGE1nWpiqsJiEtkYmdPNnSSq2mYs0lPqUH8Ha+soH8oOauxyGFI0/o4bJtXbpCeD
	qaKjoMK0LIkCue//WIZYYMo38OHotE8FVc82ppFi8LL/pyWGJtxZSJqQxpZQfiXwrjN2kzI0ITZ
	ogIBTw8izjASg8Qf01Xt1gCGW0SE5KA1hPh4fg+7egSwU+kT+r7m7+v4uYlSEO5A/5CBpQ4kOMW
	V3K1CFkEVJx7IWyWswlnOK7fuO7EAwqGiw80cqtSVW3mM/1cwidJA5sLeYVnvZOag4+SK3GGHai
	KN94DMBz6ZnsxPEj80hhaOx8iKpXctBijurJzQ==
X-Received: by 2002:a17:90b:3c4e:b0:3ae:c413:c07e with SMTP id 98e67ed59e1d1-3b1b0b667bfmr11646462a91.14.1794898832250;
        Mon, 16 Nov 2026 23:00:32 -0800 (PST)
Received: from hp.mioffice.cn ([2408:8607:1b00:8:401e:3331:e6b7:ac3a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4d98b8sm2492672a91.13.2026.11.16.23.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:00:31 -0800 (PST)
From: huang zheng <huangzheng9869@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	huangzheng1@xiaomi.com,
	Huang Zheng <huangzheng9869@gmail.com>
Subject: [PATCH v3] f2fs: add checkpoint step timing statistics to debugfs
Date: Tue, 17 Nov 2026 15:00:16 +0800
Message-ID: <20261117070016.3457670-1-huangzheng9869@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Huang Zheng <huangzheng9869@gmail.com>

This patch adds detailed timing statistics for each checkpoint step
to the debugfs stat_show interface. It displays the time taken by
each phase of the checkpoint process, including:

- lock acquisition
- block operations
- flushing data/node/meta pages
- flushing NAT/SIT
- syncing metadata
- waiting for dirty meta/checkpoint data
- device flushing
- waiting for last checkpoint

This information is valuable for debugging checkpoint performance
issues and identifying which steps are taking the most time during
the checkpoint process.

The statistics show the longest recorded time for each step, helping
developers and users understand where checkpoint bottlenecks occur.

Signed-off-by: Huang Zheng <huangzheng1@xiaomi.com>
---
v2:
- Use the global lock f2fs_stat_lock to keep statistics consistent 
when updating cp stat data in the super block
- The qualify test result as follow:

#cat /sys/kernel/debug/f2fs/status

CP steps (longest):
  - Total : 524(ms)
  - lock : 0(ms)
  - block_operation : 13(ms)
  - flush_data_node_meta : 0(ms)
  - flush_nat : 93(ms)
  - flush_sit : 56(ms)
  - sync_meta : 32(ms)
  - sync_cp_meta : 0(ms)
  - wait_dirty_meta : 0(ms)
  - wait_cp_data : 0(ms)
  - flush_device : 0(ms)
  - wait_last_cp : 0(ms)
  - unblock_operation : 327(ms)

v3:
- As `f2fs_stat_lock` depends on `CONFIG_DEBUG_FS`, `check_cp_time` updates stats even when `CONFIG_DEBUG_FS` is disabled. 
  Revise the stat concurrency protection using `stat_lock` resides in `f2fs_sb_info`. 
---
 fs/f2fs/checkpoint.c |  2 ++
 fs/f2fs/debug.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5c5b45d3c67b..bbf8bc9a9f34 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1738,7 +1738,9 @@ static inline void check_cp_time(struct f2fs_sb_info *sbi, struct cp_control *cp
 					cpc->stats.times[CP_TIME_START]);
 
 	if (cur_diff > sb_diff) {
+		spin_lock(&sbi->stat_lock);
 		sbi->cp_stats = cpc->stats;
+		spin_unlock(&sbi->stat_lock);
 		if (cur_diff < CP_LONG_LATENCY_THRESHOLD)
 			return;
 
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 6fe606e2c70d..4fa44eb38bc8 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -445,9 +445,26 @@ static const char *ipu_mode_names[F2FS_IPU_MAX] = {
 	[F2FS_IPU_HONOR_OPU_WRITE]	= "HONOR_OPU_WRITE",
 };
 
+static const char *cp_time_names[CP_TIME_MAX] = {
+	[CP_TIME_START]		= "begin",
+	[CP_TIME_LOCK]		= "lock",
+	[CP_TIME_OP_LOCK]	= "block_operation",
+	[CP_TIME_MERGE_WRITE]	= "flush_data_node_meta",
+	[CP_TIME_FLUSH_NAT]	= "flush_nat",
+	[CP_TIME_FLUSH_SIT]	= "flush_sit",
+	[CP_TIME_SYNC_META]	= "sync_meta",
+	[CP_TIME_SYNC_CP_META]	= "sync_cp_meta",
+	[CP_TIME_WAIT_DIRTY_META] = "wait_dirty_meta",
+	[CP_TIME_WAIT_CP_DATA]	= "wait_cp_data",
+	[CP_TIME_FLUSH_DEVICE]	= "flush_device",
+	[CP_TIME_WAIT_LAST_CP]	= "wait_last_cp",
+	[CP_TIME_END]		= "unblock_operation",
+};
+
 static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
+	struct cp_stats ct;
 	int i = 0, j = 0;
 
 	spin_lock(&f2fs_stat_lock);
@@ -631,6 +648,19 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - Total : %4d\n", si->nr_total_ckpt);
 		seq_printf(s, "  - Cur time : %4d(ms)\n", si->cur_ckpt_time);
 		seq_printf(s, "  - Peak time : %4d(ms)\n", si->peak_ckpt_time);
+
+		spin_lock(&sbi->stat_lock);
+		ct = sbi->cp_stats;
+		spin_unlock(&sbi->stat_lock);
+
+		seq_puts(s, "CP steps (longest):\n");
+		seq_printf(s, "  - Total : %llu(ms)\n",
+			   (u64)ktime_ms_delta(ct.times[CP_TIME_END],
+					ct.times[CP_TIME_START]));
+		for (j = 0; j < CP_TIME_MAX - 1; j++)
+			seq_printf(s, "  - %s : %llu(ms)\n", cp_time_names[j + 1],
+				   (u64)ktime_ms_delta(ct.times[j + 1], ct.times[j]));
+
 		seq_printf(s, "GC calls: %d (gc_thread: %d)\n",
 			   si->gc_call_count[BACKGROUND] +
 			   si->gc_call_count[FOREGROUND],
-- 
2.43.0

