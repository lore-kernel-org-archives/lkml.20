Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC47488201
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400443; cv=none; b=Q9k2kBZ2gsb8tcDTmcf51St+AOW6ddlbA0K2D9XRcdoAdGYcv8OX3ZdMlYFRhZMK/3wv/HqyMPvPtmizfNkK3imX/Raj2/EDL7NQ4NNwtE4QoBS995kLmRa80gXCnMonR/FZL4hdVEXA1dS140vBDAqsTOv2Gp8VHqmqmovrak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400443; c=relaxed/simple;
	bh=nJwavie+2NumadszN3aES2YGtRRlL/vf9ityggBJpyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=riRO/1hagxirAnowAD754vBCCxCW+wGZfO+9TFSOY80MRDp72UrzT7/ZuE0TJ8B6pMArn2Co/I8vmknuxLNWAjX3THIn4R9a/lyR96Dh8arp3vzl7VX8RHLQpUbBuZC45PsXIfvp3lbeI2YGssll9a95iroK92J8KAqwDMfnz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSAE5DHr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSAE5DHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CF81F000C4;
	Mon, 19 Oct 2026 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792400442;
	bh=1YlIEAgP2+fxmetkRzFsykbdiTOnFRgm7xmecjSZ33g=;
	h=From:To:Cc:Subject:Date;
	b=QSAE5DHrAsDSWfHNRyHs6d2Opjn6DDB3aMaS5U3eymAUQIaUIK2rgORqyQk1vCYbv
	 R9XTNmsKggZ7dvRu8yjPkE6VGJ9X1W9cqa20LGlMOuE2zYfvzvdEeoboHL2syVWZSj
	 x0Vdrx3mTNLOq8RY5FT54odmt2IvWrDEqKHo92xXEBL8RnPFGakJ+ybTSIh58tKlQp
	 jj8WjL93NX4AYh0rFhnJ3WQ/3q+hf4kyPG6iJIkuTmgwjwgJtKklaMtR9gHNEWcRyM
	 UFNjPthKjYxWOPsVd5d0ZSb6QZBZ44nM6aa7uv6tsiU/eiWJZO8wp7SRiur5SOChlx
	 CYu/fBOu6ofrQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: zone: fix to don't fail to grab GC target block on zoned device
Date: Mon, 19 Oct 2026 09:00:32 +0000
Message-ID: <20261019090032.1170825-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

With out-of-memory fault injection (inject_type=0x0080800f) on a zoned
device, f2fs stopped checkpoint during GC:

 F2FS-fs (dm-0): inject kmalloc in f2fs_kmalloc of move_data_block+0xc0b/0x12b0
 Workqueue: dm-1_zwplugs blk_zone_wplug_bio_work
 Call Trace:
  <TASK>
  dump_stack_lvl+0x4d/0x70
  f2fs_stop_checkpoint+0x1df/0x5d0
  f2fs_write_end_bio+0xdbb/0x1320
  blk_zone_wplug_bio_work+0x2aa/0x7d0
  process_one_work+0x5c6/0xde0
  worker_thread+0x403/0xb70
  kthread+0x235/0x2e0
  ret_from_fork+0x2f/0x70
  ret_from_fork_asm+0x1a/0x30
  </TASK>
 F2FS-fs (dm-0): Stopped filesystem due to reason: 3

In move_data_block(), the target block is grabbed from the meta cache
after f2fs_allocate_data_block() has allocated newaddr. If grabbing it
fails w/ -ENOMEM, recover_block calls f2fs_do_replace_block() to restore
the old block address and curseg's next_blkoff, which already points
past newaddr, so newaddr is never written. That leaves a hole in a
sequential zone: the next write to the zone is not at the write pointer,
the zone write plug fails it, and f2fs_write_end_bio() stops checkpoint
w/ STOP_CP_REASON_WRITE_FAIL.

move_data_block() allocates newaddr before grabbing its meta page and
goes to recover_block if the grab fails since commit 4356e48e6437
("f2fs crypto: fix incorrect positioning for GCing encrypted data page"),
the meta cache only replaced the meta page w/ a meta cache entry. That
is harmless on a regular device, but it leaves the hole since f2fs
supports host-managed SMR (now zoned block) devices, which only accept
writes at the write pointer of a sequential zone.

If newaddr is in a sequential zone, grab the target block w/
F2FS_CACHE_NOFAIL, so nothing can fail between allocating newaddr and
writing it. In a conventional zone or on a regular device, skipping
newaddr is harmless, so keep the error handling for them.

Cc: stable@kernel.org
Fixes: 52763a4b7a21 ("f2fs: detect host-managed SMR by feature flag")
Fixes: d1b959c87702 ("f2fs: Check zoned block feature for host-managed zoned block devices")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 926e6976bc22..b6d7ed299f14 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1453,8 +1453,16 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto up_out;
 	}
 
+	/*
+	 * If newaddr is in a sequential zone, it must be written once it is
+	 * allocated, otherwise it leaves a hole in the zone, and the following
+	 * write to the zone will fail as an unaligned write, so don't fail
+	 * here.
+	 */
 	tentry = f2fs_grab_cache(META_CACHE(fio.sbi), newaddr,
-					F2FS_CACHE_LOCK_CREATE);
+			F2FS_CACHE_LOCK_CREATE |
+			(f2fs_is_sequential_zone_area(fio.sbi, newaddr) ?
+			 F2FS_CACHE_NOFAIL : 0));
 	if (IS_ERR(tentry)) {
 		err = PTR_ERR(tentry);
 		f2fs_put_cache(sentry, true);
-- 
2.49.0

