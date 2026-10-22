Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673580;
	b=TAo2AGJx1Vyy0nsHA3gSQzbpjiXliYsorf5+Shi4SRaO0JZD+l5ylCU82yNmZU1cmp9r
	 aG2m/3lrh6VQHsQ9tsZqNm19EJ7CgikB1xD2S+tJrrYyGHnpah3q1UdQji42vjP4i1mTa
	 2o1J/pdJQ59YV4PsWDjhgVka0XYwmnJKxMjj0zSuauX1tiYFGNOF//N3mmdjJng2gpWhS
	 1cR5TcN2DOPcEwXfig4tOn+bm0S2z9PCOQbRn90Ogz3ZNOKL3E2LTDBi+yYfK1XFc7UN9
	 8vFlUyosFmI7YA0fb6QX9HjeFawVRy4DVgsXb6NuMUq2aqeOQJUhhDw5wSojVGTynyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673580;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yltvb7S7CsW0Y3hHn9MIuF57ZhMRPNep49yh/7UlWzw=;
	b=rAs3iQDldt1w3xgIDd+1ueLLzbsB3ezxWbMy/zc/qAqGG6pHPxr+Lp+9befmoVeoXJTn
	 cJAesFqcJOFWwajtCVCa6LUKaNRErlGb0OZutrw7nx8Wjq/s1VtjUSuoF2C2AK0SXRLk5
	 y4um5ZdLOwulpVA7/KX09w9fHBUnlYeayKlU/foEdrtgIC/vcF8Fmj9Mf5k6w7w+dMQpR
	 ypadbqcHz+b68g4SvRmVexi9ckkkEyL2LPJUsuzmSPOlfMI10MArw2L3n6nXvRdb2cBRd
	 IruhQDuBPCVuy98fGN/6gmBeeykza6h0v69DHMR4I0Cm2aLNHHFKAh54AQHP8gflGwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BA9WjkND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1139606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BA9WjkND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418401F000C2;
	Thu, 22 Oct 2026 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673580;
	bh=yltvb7S7CsW0Y3hHn9MIuF57ZhMRPNep49yh/7UlWzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BA9WjkNDjc7dr1GBsCzr0Gyg0ty5odDY/l9jcL2DgkIZlsaGQYVNWF1dd/yTK2RIX
	 pvoC12SSVkgDpCZiTCRzaNRTb9MGxHgaiv0BzHeXZy+9muJBFZdlGfHx6j4Y3W35/E
	 DBWSAFfRzudpzklRbndJVSpvg5nV846Lm+38XZvnfAK0nHMOoD2sW64raNumgeU6Ul
	 z4pu1zrvuITUzHVUsVHWQ5d0jIHEYAf29H/d/AIGP1/rgQzulyM4HvMW5RZhQZCpeI
	 50coxM8gtNdv52SGuq2miVk9BXgGAWE1bwDgSPVZWtmnRf6rP9SqYbYF2KwIvKs6X6
	 GTY+3ufqpNdig==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 3/7] f2fs: fix to return -EIO from f2fs_write_checkpoint() once cp_error is set
Date: Thu, 22 Oct 2026 12:52:40 +0000
Message-ID: <20261022125244.2205275-3-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261022125244.2205275-1-chao@kernel.org>
References: <20261022125244.2205275-1-chao@kernel.org>
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

From: Chao Yu <chao@kernel.org>

f2fs_write_checkpoint() skips a CP_SYNC/CP_FASTBOOT/CP_DISCARD request
w/ err = 0 if the superblock is not dirty, and this check is done before
the f2fs_cp_error() check.

However, do_checkpoint() clears SBI_IS_DIRTY unconditionally, even when
the checkpoint fails due to cp_error (e.g. shutdown), and only returns
-EIO at the end. So a checkpoint request which was queued before cp_error
was set, and waits on cp_global_sem or in the checkpoint merge queue, will
see a clean superblock once the previous checkpoint failed, and returns 0
w/o doing checkpoint.

For a file which relies on checkpoint to persist its fsynced data, e.g. a
compressed file (CP_COMPRESSED), f2fs_do_sync_file() -> f2fs_sync_fs()
then returns 0, and fsync() reports false success, whereas its data was
neither covered by a checkpoint nor by fsync node blocks: after recovery,
the fsynced data is rolled back to an old version.

Note that commit e41de21d78ec ("f2fs: fix to return -EIO from
f2fs_sync_fs() if cp_error is set") only covers the case cp_error is set
before f2fs_sync_fs() is called, not the case it is set while the request
is pending.

This was reproduced by the f2fs consistency test (verify_consistency.sh
--init zoned -S 64 --mode consistency, w/ compress_algorithm=lz4 and
default checkpoint_merge, under fault injection): fsync_verify.py randomly
overwrites 4K blocks w/ a generation number and fsyncs them, the test
injects "f2fs_io shutdown 2" in the middle, then verifies the fsynced
generation after fsck and remount:

  FAIL: file 2 block 510: rolled back: gen 17 < durable gen 18
  FAIL: file 2 block 561: rolled back: gen 22 < durable gen 23
  FAIL: file 2 block 955: rolled back: gen 12 < durable gen 13
  FAIL: file 2 block 3986: rolled back: gen 23 < durable gen 24

w/ debug logs (trace_printk) added in f2fs, the ftrace log of the
failing compressed file (ino 438) shows:

  python3-346519  2267.558508: FSV SYNC-BEGIN f=2 fdatasync n=4
  python3-346519  2267.558519: ino=438 FSYNC enter datasync=1 dirty=4 cpver=14c8edcb
  f2fs_ckpt       2267.559876: CP end reason=4 err=0 cpver=14c8edcb
  python3-346519  2267.570549: ino=438 DOWRITE OPU idx=510 old=a21bc1 new=ae4af3 hdr[f=2 b=510 g=18]
  python3-346519  2267.571478: ino=438 WCACHE exit ret=0 nwritten=4 dirty_left=0
  bash            2267.571810: iteration 4: injecting shutdown 2
  f2fs_ckpt       2267.573403: CP start reason=4 cpver=14c8edcb dirty=1
  python3-346519  2267.579576: ino=438 FSYNC wait_range ret=0 dirty_left=0 append=1
  f2fs_ckpt       2267.589393: CP end reason=4 err=-5 cpver=14c8edcc cp_error=1
  f2fs_ckpt       2267.589413: CP start reason=4 cpver=14c8edcc dirty=0
  f2fs_ckpt       2267.589414: CP SKIPPED (sb not dirty) reason=4
  f2fs_ckpt       2267.589415: CP end reason=4 err=0 cpver=14c8edcc cp_error=1
  python3-346516  2267.589431: SYNC_FS sync=1 err=-5
  python3-346519  2267.589503: SYNC_FS sync=1 err=0          <--- false success
  python3-346519  2267.589507: ino=438 FSYNC cp_reason=2 sync_fs ret=0
  python3-346519  2267.589510: ino=438 FSYNC exit ret=0
  python3-346519  2267.589567: FSV SYNC-OK f=2 D=510:18,561:23,955:13,3986:24
  [shutdown -> umount -> fsck -> remount, recovery from cpver 14c8edcb]
  kworker         2370.028185: ino=438 READ-END idx=510 hdr[f=2 b=510 g=17]

- the checkpoint which should cover the data written at 2267.570549
failed w/ -EIO due to shutdown, and cleared SBI_IS_DIRTY.
- the next merged checkpoint request was skipped as the superblock looked
clean, and returned 0, so fdatasync() of ino 438 returned 0.
- after recovery from the last valid checkpoint (14c8edcb), block 510
has gen 17 instead of the fsynced gen 18.

Let's check cp_error before the "superblock is not dirty" check in
f2fs_write_checkpoint(), so that a pending checkpoint request returns
-EIO once cp_error is set.

Cc: stable@kernel.org
Fixes: c34f42e2cb2d ("f2fs: report error of do_checkpoint")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5c5b45d3c67b..819073671f3d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1945,14 +1945,19 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	stat_cp_time(cpc, CP_TIME_LOCK);
 
-	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
-		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
-		((cpc->reason & CP_DISCARD) && !sbi->discard_blks)))
-		goto out;
+	/*
+	 * Check cp_error first: a failed checkpoint has cleared SBI_IS_DIRTY
+	 * in do_checkpoint(), so a following request would be skipped below
+	 * and report false success.
+	 */
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
 		goto out;
 	}
+	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
+		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
+		((cpc->reason & CP_DISCARD) && !sbi->discard_blks)))
+		goto out;
 
 	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_START_BLOCK_OPS);
 
-- 
2.49.0

