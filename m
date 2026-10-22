Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673579;
	b=yR00kmagTUc1xFf6VSia3ziSGuyQNWuhba2FH1wGhKZIdMUVThnZeEFBVlv2YEZKWptt
	 7bZC9mm54vfx3296xRWmSPjGCh32iU1TTRIV/hQhkX1CvkI9jW4Ng0nUrhhemNRcsrkjK
	 jC17mhtMw0RAUlx7BfgdyqnQak/WOEbQbIgOQajTYjErrd4aV6MLqQZC80UWczS2SJ4iX
	 O0N4W0LpCn922pCz7+6tWBtaNDT8qr6+no9J0je9/l2lJULyunXohW6zkuuHtoNUIULjC
	 Cg0o6icuZc2HUnvR9q77hpr4txAkfoPLztBqsZv39eJqTSAYmN7yN6LSKTn+WQQExog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673579;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rD/zYPBi22vsuAiR4tO4UQi89pBhgDe4H1fTUVyIAbI=;
	b=GfwrF6xhGL94ywLZQlPnYnUwtZiIrc2orxu3G614/MsfaoEdI3UApUFgLdYx3vhtcSdz
	 CEhH1x7/LrFSUQNUQH+Zx6iTMwWA8tKrf/WFm3IX4WdhBGx2qD3wAKW0YhzoI74IH8FbZ
	 ClCqG5vHPoUWm7hUVL1EUJpCW4YRHsZ/6LGUUsJSaQ3J2ErZ3/tGNdDO2fUHfW3NJ90rA
	 2tas15WhXEwM2UYXCMGp+wXa034oVFNlfzTFbQAeyomh/SjoJ83wRV50XghehgXP/TyzE
	 k1cj4koTTvdTPhU2wJRUbwSsLkfmPUt4RT+jBqVP0PF2DOntbQArE8Qu1t+nqXl3QgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBOUgA8P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36996606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBOUgA8P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EA51F000C3;
	Thu, 22 Oct 2026 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673578;
	bh=rD/zYPBi22vsuAiR4tO4UQi89pBhgDe4H1fTUVyIAbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IBOUgA8Pb8Wqvp+WCfY5ecnoUrksSDJ/VCHXIWx/OlGyCNK04Rh9mZAkGOjHCAN12
	 IWz9gGumN/zMrC+h31N0thY1PKy2dj1JHrk08uu8TMYDRMXVu65DbFw8XXbm2VX4nO
	 EO0C2jdhaLP2jUc+3b8x03VPDlmNb1F4abT11AKd/biaNjTWkBVFdHi9ziiSx+kyHM
	 1ULlrGkiWcq34WE+WWrk96r/8c+fcmoIL09BIqy23x5E+AyMOtlTObn7PWFqpaEGh4
	 r5hLxC6jnJlVdHaWpVSqY/KbgUCnXvATnNxOCoW/Wf1DIu3xIsZFaT15SCUELaKVMC
	 jcB8h0PAslBsg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 2/7] f2fs: fix to return -EIO from f2fs_sync_fs() if cp_error is set
Date: Thu, 22 Oct 2026 12:52:39 +0000
Message-ID: <20261022125244.2205275-2-chao@kernel.org>
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

f2fs_sync_fs() returns 0 w/o doing checkpoint once cp_error is set, so
its callers can not tell whether checkpoint was done or not.

For a file which needs a checkpoint to persist its fsynced data, e.g. a
compressed file (CP_COMPRESSED), f2fs_do_sync_file() calls
f2fs_sync_fs(). So if shutdown (e.g. F2FS_GOING_DOWN_NOSYNC) races w/
fsync, after f2fs_sync_file() passed its cp_error check, fsync() returns
0 while neither checkpoint nor fsync node blocks were written: after
recovery, the fsynced data of the compressed file is rolled back to an
old version or lost.

In addition, syncfs(2) and F2FS_IOC_WRITE_CHECKPOINT report false
success on a stopped filesystem as well, whereas other filesystems
return -EIO from ->sync_fs after shutdown.

Note that f2fs_write_checkpoint() already returns -EIO if cp_error is
set, so callers of f2fs_sync_fs() have to handle -EIO anyway.

So let's return -EIO from f2fs_sync_fs() if cp_error is set, and in
f2fs_do_sync_file(), bail out w/o clearing FI_APPEND_WRITE and
FI_UPDATE_WRITE if f2fs_sync_fs() fails, as the non-checkpoint path
already does after f2fs_fsync_node_caches().

For shutdown, F2FS_GOING_DOWN_METASYNC and F2FS_GOING_DOWN_NEED_FSCK
have already converted -EIO from f2fs_sync_fs() to 0, however,
F2FS_GOING_DOWN_FULLSYNC fails w/ -EIO once cp_error is set, e.g. when
the filesystem is shutdown again, because:

- f2fs_do_shutdown
 - bdev_freeze
  - fs_bdev_freeze
   - freeze_super
    - sync_filesystem
     - f2fs_sync_fs_super
      - f2fs_sync_fs
      : return -EIO due to cp_error
    - f2fs_freeze
    : return -EIO due to cp_error as well

whereas other filesystems return 0 in this case. So let's do the
conversion for all shutdown modes at the end of f2fs_do_shutdown(), and
only if cp_error is set, so that the error is still returned to the
caller if the filesystem was not stopped, e.g. bdev_freeze() fails due
to other reasons.

Cc: stable@kernel.org
Fixes: 1f227a3e215d ("f2fs: stop all the operations by cp_error flag")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c  | 16 ++++++++++------
 fs/f2fs/super.c |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b077e4eb790d..27e295bdce1c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -417,6 +417,8 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	if (cp_reason) {
 		/* all the dirty node pages should be flushed for POR */
 		ret = f2fs_sync_fs(inode->i_sb, 1);
+		if (ret)
+			goto out;
 
 		/*
 		 * We've secured consistency through sync_fs. Following pino
@@ -2564,11 +2566,8 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 	case F2FS_GOING_DOWN_METASYNC:
 		/* do checkpoint only */
 		ret = f2fs_sync_fs(sb, 1);
-		if (ret) {
-			if (ret == -EIO)
-				ret = 0;
+		if (ret)
 			goto out;
-		}
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
 		break;
 	case F2FS_GOING_DOWN_NOSYNC:
@@ -2584,8 +2583,6 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 		set_sbi_flag(sbi, SBI_IS_DIRTY);
 		/* do checkpoint only */
 		ret = f2fs_sync_fs(sb, 1);
-		if (ret == -EIO)
-			ret = 0;
 		goto out;
 	default:
 		ret = -EINVAL;
@@ -2613,6 +2610,13 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 
 	f2fs_update_time(sbi, REQ_TIME);
 out:
+	/*
+	 * If filesystem has already stopped, e.g. it was shutdown before,
+	 * bdev_freeze() or f2fs_sync_fs() will fail w/ -EIO, let's return
+	 * 0 for such case, as other filesystems did.
+	 */
+	if (ret == -EIO && f2fs_cp_error(sbi))
+		ret = 0;
 
 	trace_f2fs_shutdown(sbi, flag, ret);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 149ad6061097..ba2ec6123251 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2130,7 +2130,7 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 	int err = 0;
 
 	if (unlikely(f2fs_cp_error(sbi)))
-		return 0;
+		return -EIO;
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return 0;
 
-- 
2.49.0

