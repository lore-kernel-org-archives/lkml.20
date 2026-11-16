Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794787225;
	b=DvAuioHclIs4gLrzqbfVWrO5Zs9adk8I9p3CJ2kHlXQ+OBoHZyQU0NJjLDbhxw3aq7Az
	 ON46EK0UXK9AGBQUkImNXTc5QPh0tejNC/HgaSp1ibFAjEJddjBTDyGrMyVzP+fH1/57Z
	 y7Fet9o96U+g0QuOxOojGHILCuYxquGO46fiCfuRbFT4X7ukwaoCtoYCMTyOPEWHxCKl1
	 ILJKHWH4sWBKT/0DbuHqK4n8O8QnHZ4v2Y4a0oXEotLHGAYqySbmJUyMA4c1CxkgM/W10
	 n3qhaL2T3YpfjNb1i2op35o7xBqt2TkpB0XkDQhJerQyRfwH4TXDtlny9erATV1i+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794787225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7mrq+jL5aACHNl3ltXcO3fURb6JLvjPGhfwWz9B6vIw=;
	b=yIALNVD1tfTKLBbtsk1H7hnXuPr0oTSP8i8TOcYJjkfUJWevw85+hBd4zCSmyRkbgifR
	 GFKAh1IPiEYw3bv3Q/qkX42t1M7y1JEtYYlqZCDcqD/C956eUCOidlg4Q6mkgxKB2s7sF
	 C0uRcEWHs+7WZuyya6pjpt3rY5sVRFtNUBTJe1TZ6x/BoXXd/B23TOI0BxTKzF3igYHA0
	 SLCO6NYbmmMJXIBJjrqtOLBVY/qF+7jwwxIq2F1uxCFq8N4Wsbk5GIiMsRRx2REgrToFd
	 K5Q3yUg07bKj01jvKNNUnhFMt3M9NDradO3fiT3TMB1NfcS7uC6GqYGaXR2Ovm/GmfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOxpDL5y;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0F606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C0F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOxpDL5y
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b18717a193so1537443a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787224; x=1795392024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mrq+jL5aACHNl3ltXcO3fURb6JLvjPGhfwWz9B6vIw=;
        b=JOxpDL5yC+IX5MOwPs/wTSOTxN89zjXJhuVNEmkPS30q+66oFAjGHytW+TWBKytTIB
         ZsE073w4Cc4vDEvRCkcxQYXvO8tu157YnjM3orpHlXPtqqMy2C26JlpDxkH9TwJGHFxO
         IzkU3woKqocMsKNBcHSugkPuYAqnx50Gf+aY+Is+6wGPHNTYI5Ca822Wy7loVl4rK3d2
         /4tLwypm4GS6t8iJNNAHQrEMWwBb2DZbcqfN81r1neJC9iThz91LnnK+64WnJQSSo0QA
         H0PSd3v9ZwLkY5doEslPgLdYS5jvdUxlrgPiVJz95n+p3JNp+SEsbCv/BZWloCMxEtSP
         LHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787224; x=1795392024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mrq+jL5aACHNl3ltXcO3fURb6JLvjPGhfwWz9B6vIw=;
        b=BzwhHlfY1LB6lTccrF5d9P3mMecHfJuOP/PoGFcODg5HVSJk055cQGx5WoqfnibdWH
         nYrr4pYfCVHtc1xPFI6ZLW7wDKivIaCwhD5IXRID4rChcbefsIl4vO1iyOPuwPcgkwrr
         vnfdPm5KQaem4jY2nDENCu7WGJF6cXblR4W2Z2pcXDwpUYRmeT8EkYLqEOVV97x1jN2t
         yW8+fBwjNzgbrm5eYuag3U+TQAWpG8Wlm2PJ4bl2y5urS3CXqGa+5PQmi0sjlNgRq59x
         vXniWCxMQUZ18mby2WjnK0KlaXTlatzcS6MRlxoyyLR8sqvv0Q7vbgDKUSOl6q2RGBho
         kpsQ==
X-Gm-Message-State: APuU4Z/AOSDgS4gfgSXjqAd0Ynw+61U854g3t7GkBeR6WiofK6aicKXL
	zVBPHKESnkMaBfKJdmw3+1OzsrlNF2XjaOrnnuW4EdQRyuBHGx28IPaqLTj2pg==
X-Gm-Gg: AYBFou0P60dDwdRMJmo5pcKnFOlyU05rDXIwgoaD6SGNtR4u+GibGfwoxgjGGOXKoB3
	Os0S1glgY1zg8lH+codRY72MYQ/8Vts7FdF46Jzi+cfPH9x1WxsiVBA4PSXBUbmCop12PscYU1N
	6i79t2zjGiVaVIaGCrULCRIV+SUd180Rcf3vrF2vS9KpVCWdSClfflN/OlRPxarvi3Ht3+KF1Y5
	rO2shtKPOhiFTtnFvvbNXNDfgd1LVBn5SNB2r+LVatSAHxDhX72BTH6ctS76M2zauXkMkjqPuUf
	lTT2wvouFzTSdJ+0fGHjSIxx2cRvab7PCmNIwxG+qBG1bn8TGdfZTBAUm2Cv/UBROrAGOpYeaye
	3uOtPct0Erpn2U8gHrKYP1QFwz/QZYaArhK86mZcY4Dd9flv6rCIdJ1WzZIrh82c29eFdmyZ394
	oxqMnPV0L6cEi2qceAdGZ2gZmaji+SnfQv0QoPqDEqRQTBQyPPKwq0lNFqYXEDrXPHrIjfUEYKw
	iGRCz3a4R4IQJ1Gfyry72bs73UnJ1UbmQ848tgIZ571frdJjfdr73L6YdYp/ydUDdDE9cQGMYJy
	gn6TMM/z1De1J5iYdPXOi8aSWWKzey+/87b0MMWp6K1gzKieV+FY5uHsNlf7fVNhtjV1xvk7FFI
	6Az1aiGQ+uUT07Q7Cj3o//3Ex8ennRa6bIteg4KzdMgyA0g==
X-Received: by 2002:a17:90b:5608:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b1b07ef0camr8541905a91.9.1794787224413;
        Sun, 15 Nov 2026 16:00:24 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm19125756a91.6.2026.11.15.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:00:23 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: block checkpoint before moving cursegs for device aliasing
Date: Sun, 15 Nov 2026 16:00:19 -0800
Message-ID: <20261116000019.2299222-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

f2fs_ioc_reserve_dev_alias() moves the cursegs out of the range of the
alias device with gc_lock only, before it takes f2fs_lock_op(). gc_lock
does not keep every checkpoint away: f2fs_ioc_reserve_dev_alias() and
f2fs_ioc_release_dev_alias() write the checkpoint at their end after they
released gc_lock. So the cursegs can be moved while a checkpoint of
another alias ioctl is in progress.

do_checkpoint() copies the positions of the cursegs into the checkpoint
first and writes their summaries later. If a curseg is moved in between,
the checkpoint does not match it. Commit b4b10061ef98 ("f2fs: refactor
resize_fs to avoid meta updates in progress") fixed the same problem in
f2fs_resize_fs() by taking f2fs_lock_op() before the cursegs are moved.

Do the same here. Take f2fs_lock_op() first, and then move the cursegs.

Test: two alias files, with a debug patch which makes do_checkpoint()
of the release ioctl sleep after it copied the curseg positions. A
reserve ioctl on the other alias file moved the warm data curseg during
that sleep, and the checkpoint recorded the segment the curseg had left.
With this patch, the curseg is moved after the checkpoint is done.

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..75c51b3a4118 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3905,13 +3905,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	/* Reset the victim information to prevent GC from targeting the range */
 	f2fs_reset_gc_victim_resource(sbi, start, end);
 
-	/* Move out cursegs from the target range */
-	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++) {
-		err = f2fs_allocate_segment_for_resize(sbi, type, start, end);
-		if (err)
-			goto out_gc_unlock;
-	}
-
+	/* stop CP before moving cursegs, as f2fs_resize_fs() does */
 	f2fs_lock_op(sbi, &lc);
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
@@ -3920,6 +3914,15 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 		goto out_gc_unlock;
 	}
 
+	/* Move out cursegs from the target range */
+	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++) {
+		err = f2fs_allocate_segment_for_resize(sbi, type, start, end);
+		if (err) {
+			f2fs_unlock_op(sbi, &lc);
+			goto out_gc_unlock;
+		}
+	}
+
 	/* do GC to move out valid blocks in the range all at once! */
 	err = f2fs_gc_range(sbi, start, end, false, 0, false);
 	if (err) {
-- 
2.56.0.611.g1030f0b940-goog

