Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822624;
	b=LV30yUAbQ8M4fmT+095gASMbKevbjoE9mSsCah/toYvCeHv+xuR39Ns+Gnxv+XNQnmIl
	 83Jh/Eo5HZcjUQs6/4Op9sxKFdNcmIugOBdr5sIblnawjn4cvOfGzRD+K2xHIsmARqlvP
	 FIHJFD7M9mnvCQf3kJo7ck/lLAePOlNpOJ1rdKpnJN6dcThtCvG5PJXo2r3YY8Aa4X8mF
	 2/L00Z14TBm9D80ObMa9XG57oxGb4fRFfBZMi8h2S5Yqtr6UQdQo1v2YmksMsT7kjaWfQ
	 50XXervLwxOumcHCFS200QeT9+heETJVERl4mbcQ9ewCfXB9o8QZKub0g/kU31z2EWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C5A0lqtK+Mtifsjo6m0FKzz+TIKe/pUlM6bIYuB14yE=;
	b=HBnjzpicF9H7/yW0K1iqIKuyIttMaw61dxeL6NUsYWTc0/x4n2jcUYmpzTmgQAIpIzED
	 ObxzD7fIz2BPa363JKfVhtRxv2XyNnE2XQUiCKgJMOXN0PXzpoqoGm+7ZP2xHGmmKSmSr
	 BhBtlzF+vxyHM8atAc+bCuhdYTvN05+y939mjnj9kaSl/A+YWS5lcnY772HY1pw+Tc6t9
	 8AqXDHXIcXKy/t18a270KDn3Cp5oePnLy33psmKQhPHs/FbHqys3PmQgfw7DuxhVCGlvF
	 QlF0V0ikMXiEg+mx/R7NVHg7mrNMhBmYxK3yXOb5dRQ0NLOqa8XBUxBmPMLamkcmXGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGnLyHMU;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678DC606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGnLyHMU
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1461442a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822624; x=1795427424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5A0lqtK+Mtifsjo6m0FKzz+TIKe/pUlM6bIYuB14yE=;
        b=XGnLyHMUWvmrgiDnZNg/54VlZIw7LLL8G5EMqXpDiG1mMSSRQMsPkSE9E2BsQ27jau
         UyEhUIXWeqEAjnMPLkkOC6EFbqwOGE1226rMO+mF3n/9syYxz40VkPzrQKGLmzTD1+fz
         CPDCrF5MCjcd6TSO8JyRqrHKKw7vH+5MKd/+aqq913ghksqL4JQEoD8zQI1rszA6wEFH
         tJ8oNXXS5bSzU4hL2QK2bgVk505P7WFoxAtG6Smtr/PJqUEzQqoU8xWVUdAWFo+20aje
         Hsrr4LCMuvunaqqHZHdcRZ9cMMatwlg4Rmd3o2ha1to1uIQ20nHpw0KSvjvhpqlwgaCV
         PNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822624; x=1795427424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5A0lqtK+Mtifsjo6m0FKzz+TIKe/pUlM6bIYuB14yE=;
        b=ce5n9i+W4FvkL3Ot53dVzCZXZNiFpRo5IZH3y0nnCFzD9iXJsj+Ly0y1PP8OJPMSYv
         KJyc0CqmZAhLI27v/g4r633OPBMrSpSEorrZhE0c0mZ/BJMf0OUIvcdyyGvTFnQzGx8N
         92PUwNTfFaMoFdB1D+zyi+gMTiybDM6DBxa+vx+IYctKuICJFcyIC4Axg6/zzDvCWNPL
         YGT8zFaVBZu9Cd/KupARjPFSxq+nIMYU322K1HJJUnmTA4HFFp5hgcgJK1V+IBv7g3Zt
         h1zFngO7axGHjUwKIwJ9m7GAQrQFwQsQO/Y5ZnWuwG/2FmF0iuyqKiA7sSJ/zI8VepNP
         oxOw==
X-Forwarded-Encrypted: i=1; AL+hErHtaIv2b3wXPeetcFzkbP7TgxlqMH1bVfVHHUWcBz3i8RkpPmYBoa4P01EaSgDIeN1uo6IK4GmD+fnJ22g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W+iZb03Yw48gDil3JMxRqrWihZnTFSRwuq9cw3dGznNpOcDBm
	BHYhzorCmXnbkJxsjRslpQDS23wPCb02f+YDZeSsk8wWuLJC7Qbjh28d
X-Gm-Gg: AZFdTZfpDPU/MZEz62QWKAK5L26TxguBN/kyJP3YrxYt4veZqwn3h2gj+1t5NshhHHz
	YNyOKAjFotvrjXNpcIT37GKTCTO5qgOVXg18OeLWvOZWgOEBZ9ACvZ+Tjc6S5zixJywY4CP2DFw
	+3NT7zvUQhsJm0WmyEElRWdLGzPD97UcTVhEXtSTy2MAxcVAwIY5jTvpfiGiLWxjIRUKroXq+3N
	cEHcCwCpZAZgTZISUOqMBenrQQ9crqpWEyQh4AL+f2mH5IHTdjCJg+PQ7O3AqEqxKuUaSNgpZ1p
	Mj7FkiU+55XyC8tAObaG2n5C5qZQsJqHFJpO/hNHcUOR+RTZjfvVbdHR8dt4ZBtuKc9vNpNyJVg
	/JtaU8DPT1FPX5PL6YyRCIxscgKf1mimKoLpJSuvFRCJ5yrCmXpOUf8vz3eiTPFnB0EbZucgKoU
	zVL9f4EGlQqvKXyYrpWIXPBHKhLQezogg7U7Gp4B7T9yZv9s5aTW3w/2iG3n4mrBnazhzWezNcR
	aQllS2MStC8Np8cdqT8wA1CVHuuG1XLkTUzEzzKU/zABKj5xTb4Od9YNs5CoEyiUcLamc9Bd8PY
	19mzdP7Cwh4Lp+Q+FIHqzt5NnY3rTDwaii0=
X-Received: by 2002:a17:90b:3d87:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b1b0a3956bmr9566639a91.40.1794822623621;
        Mon, 16 Nov 2026 01:50:23 -0800 (PST)
Received: from hp.mioffice.cn ([2408:8607:1b00:8:398c:7f:ef48:2423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b2133c5dsm7830877a91.0.2026.11.16.01.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:50:23 -0800 (PST)
From: huang zheng <huangzheng9869@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	huangzheng1@xiaomi.com,
	Huang Zheng <huangzheng9869@gmail.com>
Subject: [PATCH v2] f2fs: add checkpoint step timing statistics to debugfs
Date: Mon, 16 Nov 2026 17:50:11 +0800
Message-ID: <20261116095011.2868219-1-huangzheng9869@gmail.com>
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

---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/debug.c      | 31 +++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h       |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5c5b45d3c67b..b407adb9bf18 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1738,7 +1738,7 @@ static inline void check_cp_time(struct f2fs_sb_info *sbi, struct cp_control *cp
 					cpc->stats.times[CP_TIME_START]);
 
 	if (cur_diff > sb_diff) {
-		sbi->cp_stats = cpc->stats;
+		update_cp_stats(sbi, cpc);
 		if (cur_diff < CP_LONG_LATENCY_THRESHOLD)
 			return;
 
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 6fe606e2c70d..7ff124784c1b 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -414,6 +414,13 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 #endif
 }
 
+void update_cp_stats(struct f2fs_sb_info *sbi, struct cp_control *cpc)
+{
+	spin_lock(&f2fs_stat_lock);
+	sbi->cp_stats = cpc->stats;
+	spin_unlock(&f2fs_stat_lock);
+}
+
 static const char *s_flag[MAX_SBI_FLAG] = {
 	[SBI_IS_DIRTY]		= "fs_dirty",
 	[SBI_IS_CLOSE]		= "closing",
@@ -445,6 +452,22 @@ static const char *ipu_mode_names[F2FS_IPU_MAX] = {
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
@@ -631,6 +654,14 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - Total : %4d\n", si->nr_total_ckpt);
 		seq_printf(s, "  - Cur time : %4d(ms)\n", si->cur_ckpt_time);
 		seq_printf(s, "  - Peak time : %4d(ms)\n", si->peak_ckpt_time);
+		seq_puts(s, "CP steps (longest):\n");
+		seq_printf(s, "  - Total : %llu(ms)\n",
+			   (u64)ktime_ms_delta(sbi->cp_stats.times[CP_TIME_END],
+					sbi->cp_stats.times[CP_TIME_START]));
+		for (j = 0; j < CP_TIME_MAX - 1; j++)
+			seq_printf(s, "  - %s : %llu(ms)\n", cp_time_names[j + 1],
+				   (u64)ktime_ms_delta(sbi->cp_stats.times[j + 1],
+					sbi->cp_stats.times[j]));
 		seq_printf(s, "GC calls: %d (gc_thread: %d)\n",
 			   si->gc_call_count[BACKGROUND] +
 			   si->gc_call_count[FOREGROUND],
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f7423b3f6e4a..0f1255ff93d5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4642,6 +4642,7 @@ void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
 void __init f2fs_create_root_stats(void);
 void f2fs_destroy_root_stats(void);
 void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
+void update_cp_stats(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 #else
 #define stat_inc_cp_call_count(sbi, foreground)		do { } while (0)
 #define stat_inc_cp_count(sbi)				do { } while (0)
-- 
2.43.0

