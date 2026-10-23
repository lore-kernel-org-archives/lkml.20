Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722696;
	b=zPStoDV1sEEis2HAHxj7A8nehi8o7ljFN4FQVvNMmcHm0i2xsKZyHhSqqPFXPNEedE6e
	 gHEq7ymENCYEG8dDHOjWyjlHINv0IfZIsn3OjYLsABj4WT7M3oTRMhYRNY9x0sV5uQRKv
	 sPKlaO+Y11l7xfoOhSkmx4Px+RT8qJgx4HCuHBN1dcOPW1b/kqGYoiNsPyxLIQsMFiEIa
	 E7ofXvmAPbIVCsQUtrhxTS2bUl27uf/Nsk1SXhIeM86of2UGOgma/BSksMEkcO4chwKle
	 JyxOhGh1kn823pPzQuMz79CN2+f0KdaBIgSw1Ogb6PVHIRpqP5k9a0cKH0jdI/CgXhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ksAqQEt7wgRnrEwMkGEYt7VjPYd0SKMXbelAnKdTXYE=;
	b=YMCDzWYZGESX12i/sG9H28TIk+tFPuYvoCb/h1WqxmQOI7fF198qy0tuQe3opi+EFax7
	 nyCOWjuVwkOY5N2LYneL36DfFSwKXARNcLWtkuTDBkPLBT64f/M/d1NmRUyBi6tBWlEVR
	 KSg1syGsbnashIXnR8pEmUTopwOYwNgBeQHG0IUaJHpr7E9Udn0wf1dSEF445dVCaNL1v
	 uDN168uyGFIRmusd41i5ki5TB7LUBV4DpJCWPm3jn+D1MCBln9egUPjZmI6P5zaClkgr0
	 p5J2KomdtwTnubhGdTURFkxowQfBobtsBRLCMpI86R16DHRq8NR4ARMdNTZKtUypSWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Oe1CMZ7t;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B033606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B033606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Oe1CMZ7t
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06c60065fso352308b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722695; x=1793327495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksAqQEt7wgRnrEwMkGEYt7VjPYd0SKMXbelAnKdTXYE=;
        b=Oe1CMZ7tYNcoLHe0eavLG7OIHLIneB0XD2SCB089Kpg8J8yPNL3XT3E0rxHLjsaih0
         49vXA5u7G0vI1b97RDBMuX8l3jMA9y6ZqBZUd1VZdBA46EEtzgjWJR45ni6gVVCob6ZN
         ii7LDdjkY30+qxFY3t/YWUXCvtmzea3WZRKsfC+PgRA0j0fL46ybpEI2jYZchTEA9EIR
         FrcXCpLbf+OuCrDZTR56oBoXHy4sOyhRbLvVue8g0wgb06LLwxJK+gf7KKxX28oU8yK/
         FYrH9k8kqw3CTV/RAIFvBWhIkVhpV0jxzUOjAIsqkkmgGuvFTha9+qrOFmeW1b33jFOA
         rP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722695; x=1793327495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksAqQEt7wgRnrEwMkGEYt7VjPYd0SKMXbelAnKdTXYE=;
        b=GLQqgMMirMxRY421eRmyLYYoMLMe35ntRBOvxCZ72xVtigZjIit+TPF5n9hdIt6X8q
         u3XJ/AT8SCTGy/dFpgFsy5zkLpl36z9KkeUMyAUWgMT35sI9oaD2kmjEqIWmy2KCjPCX
         MgozLFvcFVFnSy3JwgtiD5/VnLhU+yeiNxp1FiRFMbd7MUw530OlrQHi4JMQ6IxjTrkw
         CzsSKjXhFqKung8TShcTWf9WjEiLAAb0iYlnxdRUZtQbqYf+7J95Q49fpgX34OLRLjP2
         kuK0WiU/UmN1ENqry6hfo0BueZ39nGZTiwPnNdggFTXx129gk1VRgfsabQoLUltKAgpK
         yuyA==
X-Gm-Message-State: AFq9FYIrbi2rTe1WF88x+247RzzmN6lO5HY/UPooRwNJqjHuk9lPbzZG
	AkvpLn+zrcG8hk9jTL6j7cl/6ZafDgtLJMUbqKDdyWROnckG+SFGaXDyhJZRKg==
X-Gm-Gg: AYBFou31MTyFg+Dbn+ozmoiCQ87+Z83DBeSJkDnmbGt1IEcBUW+8WFuxPaH0gB80V8p
	b41MKfllxpucv9d9kaTq0VU03j+DW5gK3AFTaBPTx9lX5JoBxr+GUxeJnPdhM3GVAFWsuMS4tPp
	HkQSHVe028uq8HguHVPDkzEiwKEXmuMnfJjAlI4WQQxiqHR//8uMyQBsM8D1ALpaQVpR2kKnk3D
	4SEcJt/c/RJWGiXaRf+Siy5VcymEg45xiTIWfMHRVUf4SwhE9yDGIWMsv6zUP1goh19LW9rpuMf
	wm8uROHpG4QTOOl5hfPpx+pXq83OEJ77O9R7Ff5c8ph4iLzZED25LC+o0G4OuuHTF+5b+U4mANR
	qREh2PvlaqNUYPrkuFHxKGXgpE8HIzmyVtAEMy2P/PhXsWDXElzut26uPAIIphbyM+7jXxSExon
	ywOkoq1xLEKp627dLeFkF5JnAvqXKA+LGobPt+5JmQ5RlIozlb1E9a9WlYUZB7NXAYu+ovqE+KF
	exVccdhx2yJysI4Bm+XdKJOIMnSGdtvDZ2NHoYKScX7rSlSWtd7Wav2LD9kUAUa9QRhU8BjC4K2
	7BhN90K//RydpKTCuc/shIKwBmn+OyQgwxL2E6ecVFDV6z24hiItZGTp9b8w/8JviRVT2O4WLw=
	=
X-Received: by 2002:a05:6a20:a10b:b0:3e0:e400:3fd with SMTP id adf61e73a8af0-3e37665ccbamr644534637.43.1792722695158;
        Thu, 22 Oct 2026 19:31:35 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c90f9397sm193403b3a.42.2026.10.22.19.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:31:33 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: flush devices when a sync checkpoint is skipped
Date: Fri, 23 Oct 2026 02:31:18 +0000
Message-ID: <20261023023118.3460118-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
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

