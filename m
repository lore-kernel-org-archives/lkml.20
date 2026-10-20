Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516703;
	b=Ou187iZpiEwdG+UDxwxM1cgNLgnKh6Vsvm/vB8wt+XiKB8FqMB0vNeqLaDk2v/8LHYOt
	 pnBTYMRDh4+43AHKergFdQgY8OVbVhNUpAJMZr4Yj5vmed0DZN+n6WjxtdR+3mz55TRzo
	 wzYbXjksTbyiIR0P7a0XwsQItAQSkpWQNw7PLp538YAYug5O1c+CW3DHunrqPDXyTKjNG
	 7zFN71cD4NkynXVbj4M8Hdq/bXNoazBnl3b8aKmazYopp4OwZE1mLRN4W2t3WqHYSUDq/
	 S/FbHCtKCfIrz8kxuQGorUAruEh45sYUZI5ycfs2RHXxr3DJKLkNSrvttUXjqmn1fEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ksAqQEt7wgRnrEwMkGEYt7VjPYd0SKMXbelAnKdTXYE=;
	b=kf93lyvaqyKwvzW2LqN0Fu0g0EqsndXM2j9f7QUY8dxMTZBOdCm00yrIwL2RgEvcyFpS
	 QASIDs07YMeKeOfjSqWO2Mf7hhqEQacBwLY05a4k4PcvipUMreC92T6AT8atW4iyICC89
	 JuaM8PZWgv8y50j+S9G8wQxoNYptFzQjyky0uanvsLOh39/St0Z6ifLJWslaKkCyaYqPI
	 eKhlO7zY50FsR/tdK6llBWkQGNHzpdExSYWz5cLKPPhdQta5pxk1aE4z9CAYYn8m+uqBv
	 VHyy4hiWP70AyWABxXp/8i0fZfGW+USBcnFj1VmHCmcAjwd8Y6rKQf++uzHCsPcae8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HhkwCIq3;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F9606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HhkwCIq3
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1246259a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516702; x=1793121502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksAqQEt7wgRnrEwMkGEYt7VjPYd0SKMXbelAnKdTXYE=;
        b=HhkwCIq3/NebM52VHSo0kNeKJVuRmMCULrUqxB5vcsayQ3iHdKSld6IwhsvYSoXuHz
         RqTXdPLFmHnMHy0j6An9h2/1FeRTicYJdfCEQgPKnSFAqesnilUWBWgFHiJjxTbdW4lT
         coMzfApLc+y1RKtYFDt4iIzKyWAJvxPnHAJygaLBT+jCAABgmxx69DL2yQXMANfxbs9p
         Cj7VhCiroXFUYx/wCpD9/vwl8Wct3zGxRj+IrKyse+Yly7GGchP99c9mL78canfchSG0
         fVf93Gt3XMLSdr5nA8FyjuxlYDzp+mypEkri9arcui1X8Aqm3vGRcbPPdnMg9Gox+RTZ
         4FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516702; x=1793121502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksAqQEt7wgRnrEwMkGEYt7VjPYd0SKMXbelAnKdTXYE=;
        b=F/wz3JseWhSlvI9at+Lk2yxP1coYSKDHGOO7BTk7lH4yBnpZhqg8cYXfYo2G2kXvKo
         fZN1wKUG/fmExaORaEKmkgve2lHp6KzBwE8Es+k1wnOB36iRYuKSpa5s3CQW7KNEBrcr
         /aEixKPE/dVFmGT+/AmgEyW5HaMFbcZj54jmrOJmS9XMhWkAO1yDAZVLyL9NcH4EgLMv
         sjNtGk2eRaHguJV5d+jDEY81hGaFCSeCY6Yno5C3CqbCYqA3/vFt+xog6M26EOw0CVCM
         xEnRD2NlzBJinw2KlHqdws4nr4o40666NRIvOnViH5ZuLA0IEdme6f/SlGfMY77mXAYz
         tWkQ==
X-Gm-Message-State: AFq9FYLe/iEicj8+LzqRvSRzDLVdzjhMYkcPPQG8mFvZHAle8pW7SfgH
	PBvqnQO5GruNfL+nA2ZzObWhoHziZ+8//kOcw6i/5p2eXNeF5hb19iC+plBc5Q==
X-Gm-Gg: AYBFou2GlTd09V/hezBqp1N0tIuX2T7E6so0I9sST+xS+8G9NsEQO1aTmD3cSbyaY68
	RsyKn+gL6oGhj5n9V+yMAdpyfb0wJ2M5BYmCyFPA1gfY3M7Hqm5l22JF5ETkGFP4wxxMDwILbqs
	y750JuQd9TZX2hud0TgRMj/kecUohn4IZBrV4JavHz6p5s3aw9RP4uzp+a2zlyLRU7P+uKxzNk6
	RyayzOTEFNwnIwx3Jruz0Rl9z4lcCFhuA9y9xmM4aKszuubAJ1uJnoNeKY6rr28DFdObtlMDpOp
	GLhFdHurMgy6bR4DxP3TPosGR7Plkt0sYPKWKCehLqbUtK51EHhm1ytHBo7TiWWb1FbJygKbTl7
	U5ThON1Gz/Yn61WJLUGQp84dPlPG5sRvmFbA7LcNiv5if96uMe0rHA1fETxvrEiW+CKSsfV3GpC
	6TGw8MYzPXmCV1FXsjUwXfnaGwT4TOtC21FEtKsujKIuz2uIa6O/WQRviGc4hFbOFhteaXcaKoQ
	gJJDO8XABQV+YGhGcFP91TRUzicILZbF1XOF8G8pCnrB1/VDHpmj5dziFtddu+5fAw0vyfYw1sI
	VBPr4wR8ZC9qZViVm7Lixt2/6Q/rUIQ6hxh6o8Ir7ivT1DbED1ap6Ng2UNHkej2cqLnPcYDOlQ=
	=
X-Received: by 2002:a17:90b:4e88:b0:3ac:6fca:f88a with SMTP id 98e67ed59e1d1-3acee728a89mr10522074a91.3.1792516700783;
        Tue, 20 Oct 2026 10:18:20 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035c42fsm417182a91.17.2026.10.20.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:18:19 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: flush devices when a sync checkpoint is skipped
Date: Tue, 20 Oct 2026 17:18:13 +0000
Message-ID: <20261020171813.3162517-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
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

From: Daeho Jeong <daehojeong@google.com>

When fsync needs a checkpoint, f2fs_do_sync_file() writes and waits for
the file data and then relies on the checkpoint to flush the device
write caches. syncfs works the same way through f2fs_sync_fs(). But
f2fs_write_checkpoint() skips a CP_SYNC or CP_FASTBOOT checkpoint
without any flush when SBI_IS_DIRTY is clear.

That can happen even though the data was just written. A checkpoint
does not wait for F2FS_WB_DATA writes, so another checkpoint can commit
the new block addresses of the file while its data writes are still in
flight, flush the devices before they complete, and clear SBI_IS_DIRTY.
The checkpoint requested by fsync is then skipped, and fsync returns
while the data may still be in a volatile write cache. After a power
cut, the file points to blocks that were never persisted.

Flush the write caches of all devices when a sync checkpoint is skipped.

This was found by generic/455 with compression enabled for all files,
where every fsync goes through a checkpoint. On a 4KB page kernel, 3 of
100 runs lost fsynced blocks without this patch and none of 100 runs did
with it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/checkpoint.c | 18 ++++++++++++++----
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/segment.c    | 17 +++++++++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1ed38c668fc..158d97fc349 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1973,10 +1973,20 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	stat_cp_time(cpc, CP_TIME_LOCK);
 
-	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
-		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
-		((cpc->reason & CP_DISCARD) && !sbi->discard_blks)))
-		goto out;
+	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY)) {
+		if (cpc->reason & (CP_FASTBOOT | CP_SYNC)) {
+			/*
+			 * The data that fsync or syncfs waited for may have
+			 * completed after the last checkpoint flushed the
+			 * devices, and that checkpoint may already point to
+			 * it, so flush the devices.
+			 */
+			err = f2fs_flush_all_devices(sbi);
+			goto out;
+		}
+		if ((cpc->reason & CP_DISCARD) && !sbi->discard_blks)
+			goto out;
+	}
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
 		goto out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1f9bd8e3b52..a4a38818988 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4265,6 +4265,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg);
 int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
+int f2fs_flush_all_devices(struct f2fs_sb_info *sbi);
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
 void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
 						unsigned int len);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 06fb92fc847..5b015cf9071 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -822,6 +822,23 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 	return ret;
 }
 
+/*
+ * Flush the write caches of all devices, regardless of which ones received
+ * writes since the last checkpoint.
+ */
+int f2fs_flush_all_devices(struct f2fs_sb_info *sbi)
+{
+	int ret, i;
+
+	if (test_opt(sbi, NOBARRIER))
+		return 0;
+
+	ret = __submit_flush_wait(sbi, sbi->sb->s_bdev);
+	for (i = 1; !ret && i < sbi->s_ndevs; i++)
+		ret = __submit_flush_wait(sbi, FDEV(i).bdev);
+	return ret;
+}
+
 static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
-- 
2.56.0.218.g1ec904b173-goog

