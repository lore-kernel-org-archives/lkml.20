Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C3355F42
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801399; cv=none; b=HOEi26mBMZJFWi0l+EZBgumvz/Vu662EZ5WcVgvVvsuzp6ImM7kXroIGQNIMR9t5qxhD0HEiJvIOVbyxi72nCSIWysTph16TCJqmeD2zxq3boMQc0Y3l6E+mIOCzcF8GkMZVjgh0PUrR3/16FYP/oavswc/oZLnrmqyHgGz53P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801399; c=relaxed/simple;
	bh=vo0Hl07Qqko7mQZRjYiWFQP4SZWCCuH0QSkXVILJeyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=trw7LyYUKgKBrzlkN1O8j8H6BJQDMXgcHwZfU/OkASgdydIu34K9mHi7F4MCptNrcSP3Aiwc50I7zBJPfQtK6I3WJ87UQl9I3GWGoGYzrtd0BuKw9kqR6XgEsC7R5KPxIu2arIG8lyrP2mnYSa8flnqx1hyE10ywuB3+8Q+FcDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqipxnQy; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqipxnQy"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8917c712f32so706942b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801396; x=1792406196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYAbLfcSF4SvwtGMEqZtL/vm+XSKpgh03MXVN46JE/A=;
        b=MqipxnQy1+m2axV8MIzADNTBxfHw4UnA2F+roj3C6z2QBLM+RixPvxGHPGBDkik+dA
         vJm9whXqRJTfcFEPXwOTEpFEv9lqOtqpZ0WAL0IOeiJ8SeLLI6ScLyl8HTbnVHJKZL1c
         xnjLhIsrO6yiOcmBSKw9mNC3uiZG049TOIRBazEYnmK2JQh0SZjceHAweFYOVN3Rlf8j
         oTPjkJIR6+A+19JSas7XvLBpGKwXpZ1JQsj5bh08LYRMvqGLRkVvVunSkcFQ+7xaU7S5
         xFBmW80NL5XBCHAPowhl/u0w9mfhBL2qJd2ivospesr3kZADilAch6nfNdCtFfI5uxuE
         8PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801396; x=1792406196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYAbLfcSF4SvwtGMEqZtL/vm+XSKpgh03MXVN46JE/A=;
        b=nY5MhZBp6gCCbe3hxWqpLUB20iyXxt2K8PUqBC7LIZurb0mEqDEKGBBJwlID273pps
         qxIb0QMHynuJ/kE7g+F3BMGEqDhh8mf30pLlVMKIDd21WPY6kRRvFP3A73+XSiqamUgv
         HTC+9A7FWgFi6S0XxiGSvQLaXqufBf9qamTi7gdNCJ5XSpkAJFJwuN2Dq8DMLZArypL2
         KpeqVwDHn8kQAnfp4/7Y1gBmyHi480ttrgXvoOV9eW/IlgedxG/n+2zM+tG8jOUpJrXz
         aAPxqq90mWmHWez4bG93ngMvUBp8AIBLauhVLoAP9GPxvriGU78n6vCzx34QpqldcoXC
         psEg==
X-Forwarded-Encrypted: i=1; AKwUvBwLEwNNr/JmRFDBoxstdJuNBV2n+d5y9v+x9hSKa0IlfgciCHqg2lYRP5+oBZ8AIIuLlKF0Pu2/W08Ia2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb+josJS4TkgBYBW4HWAryMScDqolqzUC9nxHVVRFqLSV9WUqu
	Ywz6JrklAVw24anTpsZquwdhn3rp6KfmmAlggmAvsDiFG8KhR9y6eWMP
X-Gm-Gg: AYBFou2LuUlUPhbHZ0109f37aO35y/rqjiIBtOJ7ImWPlEFla6yBuDYtv85q2vSj5n5
	rQ6kWy854zPlPfWjBQzy/vIouaWAV48tPoYWxQvfQqpSN8i5PLc85yIYnmzuciWTlJv4duYas+H
	XWaIacmrIeWkaT1XKjBzrDClhlHJj17p84li6vLjCWjvVnjNozCDvJBmAZ1ujAEFbuAO/7f3q/F
	srg2T8UDLnriN3sYP2S+TRoGSK9VeEFgZ5gmNPf7TIYON0xU2A64rPnJYaHm/NaIi68wqF9U5+O
	/XYpbQrryyJRkW9VsaOZ3Z2c9SItYR953Wx6oITkvcqlpSoicDrRJ/OvIukPgA0AvI0hfmMQQfm
	0SOkqZ/ZU1n6U76wlLp5BaTfhHdi3B+ghXKS3JIFeNN69HqLa0SRA9Co3eb6JStEvMOEZwkAfAs
	cz8GfbQPQnCrOKzQ+yj8Qyu3QGGzmAgJiJNExp/iU1Usp/cli9XKd0A91S+wLt1BhQh8GOiOR8Z
	Pc5KQngakGeVVXdq77Xeq097z0EA8/f+/c=
X-Received: by 2002:a05:6a00:856:b0:886:b762:8bfd with SMTP id d2e1a72fcca58-897c7cd10efmr7613646b3a.51.1791801396300;
        Mon, 12 Oct 2026 03:36:36 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4996be6sm4019639b3a.58.2026.10.12.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:36:35 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH] f2fs: wake up foreground GC waiters when the GC thread skips a round
Date: Mon, 12 Oct 2026 18:36:29 +0800
Message-ID: <20261012103629.1763003-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With GC_MERGE, f2fs_balance_fs() queues a foreground caller on fggc_wq,
wakes the GC thread, and sleeps without a timeout or condition recheck.

The root cause is that a foreground writer, the GC thread, and fsfreeze
can race as follows:

foreground writer                  GC thread                  fsfreeze
- f2fs_create
 - f2fs_balance_fs
  - prepare_to_wait(&fggc_wq)
  - wake_up(&gc_wait_queue_head)
  - io_schedule()
    waits on fggc_wq                                    - freeze_super()
                                                         - frozen =
                                                           SB_FREEZE_WRITE
                                                         - sb_wait_write()
                                                           waits for writer
                                  - gc_thread_func()
                                   - waitqueue_active(fggc_wq)
                                     returns true
                                   - foreground = true
                                   - frozen >= SB_FREEZE_WRITE
                                   - continue
                                     no wake_up_all(&fggc_wq)

The writer keeps its superblock write reference while sleeping. fsfreeze
waits for that writer, while the GC thread loops because the queued waiter
keeps waitqueue_active(fggc_wq) true.

Wake foreground waiters on each early skip. A skipped foreground-GC round
must not leave its caller blocked.

Fixes: 5911d2d1d1a3 ("f2fs: introduce gc_merge mount option")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Reproduced on a 512 MiB F2FS image mounted with gc_merge, filled and
fragmented under concurrent inode creation. The kernel reported:

  INFO: task sh:1381 blocked in I/O wait for more than 20 seconds
  Call Trace:
    io_schedule
    f2fs_balance_fs
    f2fs_create

The SysRq task dump showed fsfreeze in freeze_super.part.0. An NMI
backtrace reported:

  CPU: 2 PID: 229 Comm: f2fs_gc-254:0
  Call Trace:
    gc_thread_func

The f2fs_gc kthread also consumed 301 ticks in three seconds at
USER_HZ=100.
---
 fs/f2fs/gc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 926e6976bc2..086670f9df2 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -66,6 +66,8 @@ static int gc_thread_func(void *data)
 
 		if (f2fs_readonly(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
+			if (foreground)
+				wake_up_all(&gc_th->fggc_wq);
 			continue;
 		}
 		if (kthread_should_stop())
@@ -74,6 +76,8 @@ static int gc_thread_func(void *data)
 		if (sbi->sb->s_writers.frozen >= SB_FREEZE_WRITE) {
 			increase_sleep_time(gc_th, &wait_ms);
 			stat_other_skip_bggc_count(sbi);
+			if (foreground)
+				wake_up_all(&gc_th->fggc_wq);
 			continue;
 		}
 
@@ -83,6 +87,8 @@ static int gc_thread_func(void *data)
 
 		if (!sb_start_write_trylock(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
+			if (foreground)
+				wake_up_all(&gc_th->fggc_wq);
 			continue;
 		}
 
-- 
2.43.0

