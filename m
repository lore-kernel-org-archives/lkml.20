Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794778549;
	b=kxcs68Q4ZZugjDR+CpaDFqeYRUtoHeeaB0tWdI1/TlGl4SfBPwRcch2EYG50529ZenF9
	 6jzNkZewyUHvBHlX5snrdJNuVVot3//3iQ+MdL99n3VThzuaDbE8gzrjS3g8a5/Lb4OL3
	 yTRVx/1h8hdZpeu70OIm1uzeGQNTZrCrA3MoopSt6mGwPSy+toB7oUiLJf9ne7c8MTQo1
	 ZVm6W3eZ8mezp2OnyMvTfjIfnpN0VeV3amZytYMOOoShO4KM3fuA8FEKvLkxjbwHsLtGN
	 4tOwLj/FMu1iGnxpYhfqkcGYnEh9oUnQ9S0cH31/QyWEPXwqrk2B5djRlm2jFjfPXPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=v+bEaKhMDCZtV/jlBILoWtbmCL9qsyLUohE1CagS/qY=;
	b=Ux5RwpSuuwEVlo5olFwstdebKkKiEWNpDxq1b+/QYHX9JHkBX4HpLy/dhq6Y2aLUeKVY
	 Yqw7JwvIA+zX1jTTQVJebjG/XSFQFV58WAvu/lCpUvK1H4dLC7vsMQ3aPrL0qoEEcnmTx
	 XRbpPSbdXNT3Lmx45NIi/4BY1OMI8vPd0gJdfWAEy397aKTIqubTH1MaRIcmApBaHuPZb
	 TNZEJ7+ZKZghcPz1K/GUPeOoVfhJ4oAG+cj4+Bxmv3W9PaRZdSv7nytpUN7sYCZrAZ/ww
	 7ALu8hTs2V8e+euSrncHdN++J8Ax2tyXQLP2RS/MnnY0Hh6L17SM0sS1HIULjtp2Ulg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf3Q6OFD;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879D606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B879D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf3Q6OFD
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1519309a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794778547; x=1795383347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+bEaKhMDCZtV/jlBILoWtbmCL9qsyLUohE1CagS/qY=;
        b=Vf3Q6OFDzCu80dUMBSm6nrS5KkYQg5Tn04XGAPOUltWAHsYq11qX2pkdaBDdva22Za
         +WZvfsjthxomjl/Y2rvWXKnSdp08I/rHPnYwvJP1etkIKzvGksvL001yMAZzG0vtTVeD
         B2tynu8fvY1xmmN5+zTuTRQ50SvWbu9cXfC/HRyaGk96TYmSnelNqRrhGxO+OV0tf2Iq
         mPvrgBtoTgJgTO4AXGXrstFevsN2a//MVy1/u0b3eKcYFv7WqlyZCU2gp/ekT/Qcnibu
         RGu89/5R5djmP5Nh24GVohYeNnwXJU3YYn8z/LZ+WIFAk4muSRIFYFQxRyM6z/Vmgxrn
         HOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778547; x=1795383347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+bEaKhMDCZtV/jlBILoWtbmCL9qsyLUohE1CagS/qY=;
        b=BkzJ6/74RaNT3Kp7JsX/ULSuS7kz9yyELWA20xfyUzlQJgV+Fj3jhRQRYqICxVpaKc
         zJiEP6jzkTsRrAxxbaFnr8g+arFiSsfIxIXwQVG8ARO8WDljgsvOGUSWYrl/1caQPNuN
         xQrrWlQFO+ylbB/eUAeJ68tDvQmUjWIodfxHSZUhlBtc4wrTvOdFCpbo/BE6hPbmhjwa
         BcCjRJOJSKsWmU+Q/ysgQk6sp0qxNl4DfsQC7vr9S20kwJzujd0acxhwKbAzs6rkwbAP
         WHZt533CH9SdvjFDPqdqlNRaKw1G8VMurAoOqfD4BIG0zTV+wFOYWV0z8mAIC/2Zmecd
         zQKg==
X-Gm-Message-State: APuU4Z8o+p2NQ1fHCN49kMMMO/CbsEV8ffnraVIZXgGSWIlbxi5QBiyZ
	bmmtrQtneM6mXhtHkfuVamJs8rkyazInjZ9+okKY+yvMlK0siez5ZgnCUhxnrw==
X-Gm-Gg: AYBFou1488OPGh6NxEDROiU43jpGr+HaEJb4lc30DnePgUAgFlec8qvnA/CXXu+QCUy
	JSeFlV4A+BHDqykWaOWjEK9/lEvHEe8YfuGmbWZseViPxSJdNMdvAYHlTO6KzlqjcGvZ57rHx5S
	GSIfIQDVTyEim94D3/ykbtLPaf1yHVfrC1M0kRnTMHK4mcvWo1MH5UE2O4k9y4s2wXo2xIdkhn3
	QrGFkGwCCnCY3ppjPnItcwVPu23cMTBsdX5csiPn1jZcUw3O+z4cgzhBDSKQVzxWlhA6p2fAWxT
	FL0aHaqx4WdEPp9EdEq28ZxoiKPR5+bvmh4D9mw9clKf0V/yAqXhywL+jP7n+YHbvOOX0RSNvQ4
	NkM93v9rxGArrLecYHjk1djgthHF0ix/9enCrHU+vqLd7zDn9ZEOPI+oytXsaWduZ46dV6tu13t
	l7Tv8lZ5fM3jPaYKgsQNZ8X0VzdUa1UaCQ6L3rJLTIrlJBYXHmI0QHlX1MAHb6JCCWTBOPozDqp
	dA9eUx8UXHXj1otzhpBAxMigr8SqJ8VN7kIJa92zKr4hFwE53wimDbSbGm0xvI2J7jmSgIlhchb
	Kb9MXvkwP+ErrebPcDzl7rNfwGjjrbUueHvY3nkf5d3wY280SCB5MkBA7xhZ+7GYQvwXvXYnw6O
	S1vezBm91BsmqKayhj7C+BtsYOrhr+tVHtbS+G3cXo5kT04s=
X-Received: by 2002:a17:90b:554e:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b1b07ef11bmr8709233a91.3.1794778546907;
        Sun, 15 Nov 2026 13:35:46 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm18831394a91.6.2026.11.15.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:35:45 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: write a checkpoint in fsync after the warm node log is moved
Date: Sun, 15 Nov 2026 13:35:40 -0800
Message-ID: <20261115213540.2100311-1-daeho43@gmail.com>
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

Roll-forward recovery finds fsynced node blocks by following the chain in
the warm node log. It starts from the next free block of the log recorded
in the last checkpoint, and each node block has the address of the next
one in its footer. f2fs_allocate_data_block() fills the footer after it
moves the log to a new segment, so the chain is kept when a segment is
full.

f2fs_allocate_segment_for_resize() moves the log out of the range to be
removed in the middle of a segment. No node block is allocated there, so
the last node block in the old segment still points to the next block of
the old segment, and nothing points to the new one. The node blocks
written after that cannot be found by recovery until the next checkpoint.

For example, with F2FS_IOC_RESIZE_FS:

  - fsync(A) writes a node block to segment X, which is in the range.
  - resize moves the warm node log from segment X to segment Y.
  - fsync(B) writes a node block to segment Y and returns 0.
  - after a sudden power-off, recovery follows the chain in segment X,
    recovers A and stops there. B is lost.

Checkpoint is blocked during the first GC pass of resize, so this lasts
until the pass is done. f2fs_ioc_reserve_dev_alias() moves the logs in
the same way.

Set SBI_NEED_CP when the warm node log is moved, so that fsync writes a
checkpoint instead of relying on the chain. The next checkpoint clears
the flag and starts a new chain from the new segment. Such an fsync waits
for the first GC pass of resize, since checkpoint is blocked until then.

An fsync which has already passed need_do_checkpoint() can still write
its node blocks after the log is moved. So check the flag again after
the node blocks are written, and write a checkpoint in that case, too.

Test: four tasks create and fsync files while F2FS_IOC_RESIZE_FS shrinks
the filesystem, and the machine is rebooted by sysrq-b 1.5 seconds after
the log is moved. Without this patch, all the files whose fsync returned
after the move were lost (454 and 437 files in two runs). With this
patch, no fsync returned in that window and no file with a returned
fsync was lost. The second check was tested with a debug patch which
delays an fsync between need_do_checkpoint() and its node writes.

Fixes: b4b10061ef98 ("f2fs: refactor resize_fs to avoid meta updates in progress")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c    |  8 ++++++++
 fs/f2fs/segment.c | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..61ed0ad5d29d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -466,6 +466,14 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 		goto sync_nodes;
 	}
 
+	/*
+	 * The warm node log can be moved after need_do_checkpoint() above.
+	 * Then the node blocks written here are out of the chain, so write
+	 * a checkpoint.
+	 */
+	if (unlikely(is_sbi_flag_set(sbi, SBI_NEED_CP)))
+		goto go_write;
+
 	/*
 	 * If it's atomic_write, it's just fine to keep write ordering. So
 	 * here we don't need to wait for node write completion, since we use
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 31ac93a93021..e77a01376288 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3488,9 +3488,17 @@ int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 unlock:
 	up_write(&SIT_I(sbi)->sentry_lock);
 
-	if (segno != curseg->segno)
+	if (segno != curseg->segno) {
 		f2fs_notice(sbi, "For resize: curseg of type %d: %u ==> %u",
 			    type, segno, curseg->segno);
+		/*
+		 * The chain of fsynced node blocks is cut here, so roll-forward
+		 * recovery cannot find what is fsynced from now on. Let fsync
+		 * write a checkpoint until the next checkpoint is done.
+		 */
+		if (type == CURSEG_WARM_NODE)
+			set_sbi_flag(sbi, SBI_NEED_CP);
+	}
 
 	mutex_unlock(&curseg->curseg_mutex);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
-- 
2.56.0.611.g1030f0b940-goog

