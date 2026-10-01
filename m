Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B0F175A68
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813103; cv=none; b=N4ICfuKVoftNJfPWVblZg0Kp0KoS/+A5XsqDpbubI6Fl25xBm/Z6IuwE+48cvPqNKmeJrJziSrySA+PpQAEri8hYfw33llDmX13shxIcPsfApxYSFZV6Gle5JRkfI9nMBvCeYwXpxhuft7aHfEqy/IouQU0jjoUh9n+TRoJe+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813103; c=relaxed/simple;
	bh=JKsD2aoaoJcPiIQR5uXWleL+G0qhU8GYtqrWszlhbVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YgmR5K5gmnvEB3tTFPtITXdMzoH4y5hMfeLvpGbv0apLD0V50rt0Q66Eb4k+IDywHdLnoIrpNR0l4ClwOkbR3nzN5ZeWM24fCJP6Wv4erm4GwQTXVxA5zcT691kTynOm499gZTHvoEvNXz6agrmjMv0acjCx0dIiqZ2NaTro8BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyylUcMu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyylUcMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D9B1F000FF;
	Thu,  1 Oct 2026 00:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790813100;
	bh=AUCZXbZz+9GVnFuLz2w8O+q2b2dH2s881L1+FJnaSis=;
	h=From:To:Cc:Subject:Date;
	b=CyylUcMuB8QBKDLToso4FTP5kV5QwsavuiwU31FyztmHqryt4pswWrPTsgUe/cmLi
	 Ya8HzcxoURqKb59/vjKkby9Gk4VH6afhFEiuvQtUhk2dGsRYI2tSPJ/4kQ8eOX1E8z
	 M3yKCahavlsupVeSj8TzGYVvzCJK3DazEosSkLoWYyNYOi/zg+NApi/rcOcuFWtpqq
	 dkww9kXtQUc/9aMuQ6dJO/6maEHjPj6ZqVuUu7A9JZU3G/+wdCRA/ifa/8rm7kP/F4
	 +kDUtpvL+PXBCFFUKz6JzALjS6FsAaq0YV4JP35YbZQkg76ER/2GXBf6MRotAaeR4O
	 vZn1ZyEEZWl3w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: fix to set sbi->log_blocksize in advance
Date: Thu,  1 Oct 2026 00:04:50 +0000
Message-ID: <20261001000450.3822520-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

syzbot reported a shift-out-of-bounds in __f2fs_commit_super():

UBSAN: shift-out-of-bounds in fs/f2fs/super.c:3950:27
shift exponent 4294967287 is too large for 64-bit type 'sector_t'
(aka 'unsigned long long')
CPU: 1 UID: 0 PID: 5622 Comm: syz-executor329 Not tainted
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
 __f2fs_commit_super+0x43e/0x4d0 fs/f2fs/super.c:3950
 sanity_check_area_boundary+0x7c5/0xe20 fs/f2fs/super.c:4040
 sanity_check_raw_super fs/f2fs/super.c:4215 [inline]
 read_raw_super_block fs/f2fs/super.c:4625 [inline]
 f2fs_fill_super+0x1920/0x7fa0 fs/f2fs/super.c:5160

Commit b32d4bdbae61 ("f2fs: parameterize sector conversion macros")
parameterized SECTOR_FROM_BLOCK() with sbi->log_blocksize, where
F2FS_LOG_SECTORS_PER_BLOCK(sbi) evaluates to (sbi->log_blocksize - 9).

During mount, read_raw_super_block() calls sanity_check_raw_super()
before sbi->log_blocksize is initialized in init_sb_info(). If the
image requires alignment fixing (main_end_blkaddr < seg_end_blkaddr),
sanity_check_area_boundary() updates raw_super->segment_count and calls
__f2fs_commit_super() to write back the superblock.

At this point, sbi->log_blocksize is still zero, leading to an underflow
in (0 - 9) = 4294967287 and triggering UBSAN shift-out-of-bounds when
computing SECTOR_FROM_BLOCK(sbi, folio->index).

Fix this by initializing sbi->log_blocksize from raw_super->log_blocksize
prior to calling __f2fs_commit_super() in sanity_check_area_boundary().
Note that raw_super->log_blocksize has already been validated against
PAGE_SHIFT earlier in sanity_check_raw_super().

Fixes: b32d4bdbae61 ("f2fs: parameterize sector conversion macros")
Reported-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dfcbc1741488709db4b2
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc3be097285b..8d9aaf21655a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4038,6 +4038,12 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 			res = "internally";
 		} else {
+			/*
+			 * __f2fs_commit_super() will access log_blocksize
+			 * in SECTOR_FROM_BLOCK(), init it in advance.
+			 */
+			sbi->log_blocksize =
+				le32_to_cpu(raw_super->log_blocksize);
 			err = __f2fs_commit_super(sbi, folio, index, false);
 			res = err ? "failed" : "done";
 		}
-- 
2.49.0

