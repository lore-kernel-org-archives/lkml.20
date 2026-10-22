Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673578;
	b=ts16tstgD//wfaQ3C9GdWTTfs5KKoB4ti2UEJ/IboZxopmnkFBfpOLEOKQajjOghgzPQ
	 9IxKXkcEIoCHKSEzxfSOL01p8hJa7ze1nkSpKzQUt/dyFdccDKF9IEiuqEDGzQZnrCKLF
	 nsezyA90t7Le5nExhqVMmQ9I8fSso0/JcYXxeS5xOf5rZK3jera1sVMRty+EKoj7Otlqg
	 ZGHAhscmXVL6ye5o2OTFb5IJl40v+kV1tMRcKrHVq3ElpBj371OEmbcSaIYQI161yPkCj
	 4EsK1HALAiKMH/6tGOhnOSdoeijRghFdIU9tb0Zj/sUaYfkUkSqv3P4TAoD1Xas12PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673578;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JgFKhpkT5XI8KFhoSBHdBkczKlFEWgcD2DZDQ/kGhUA=;
	b=gLX1efkBP3GS/sWv/Mw/YVd5Rl99jaIghqKJOD39+r2HFwIBdH/wvfzMYj3n7/+ukLeT
	 Vr5prm1nEH7j8w5hPn29As3wt8gthu0/4uWR8UA+kQONPT+3gnQ9PMvyma6GNlqdj56LJ
	 VuJQq5NY6JwXdTF61yFDiU1d3dpe5X4MfVwOzCqeqNE7weiywS7bIAKCX8J1fiMdn3TJr
	 4UGRkWg5kt3eWEcqzJPK+CXZl/o/l8zT7uQtFgWb5GZgb0AhKpV26omSANW81c8JSBr0T
	 YOgR+mFy40sGLUVEq9gXnTMUF9mNzpKfSwVMFfZ3ct04pJtoeOGCXzTykWHWJxN/9CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OnfBVEAg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC6606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OnfBVEAg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B991F000C1;
	Thu, 22 Oct 2026 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673577;
	bh=JgFKhpkT5XI8KFhoSBHdBkczKlFEWgcD2DZDQ/kGhUA=;
	h=From:To:Cc:Subject:Date;
	b=OnfBVEAgGVeufO9YCJhASbf7BuYWrHZMwDga/KArg1dlgh9NB+iNlHVGpLLobBHN/
	 EjyNZAnvJKOfRTZU8NqMaYmLZtdFQAWAkAq8+waKGsDeT7HGq5n3Mt4hBpelRv3667
	 59XCB5QTqntxBQeVEB5wtRX2DpLf13BtJcrQp1lZX+RXJ+PzzEjGj/c+aQilJQDPDa
	 lM3vxQ3M8vXkM/C78Bvla4ADbmg6abHAcViJ07h+f+uzaJ0XdjGdIZSMRxXETBy1ZN
	 CaSUXyp0d6N0OEyLp4yaAP3mwCvtl13WVZVIXtkIHSr0RepACIurEzzwGRDu6iHkIk
	 Ycy5k1mSpbvcg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 1/7] f2fs: fix to persist i_size extended inside last block for fsync
Date: Thu, 22 Oct 2026 12:52:38 +0000
Message-ID: <20261022125244.2205275-1-chao@kernel.org>
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

From: Chao Yu <chao@kernel.org>

generic/737 fails on 16k block size f2fs, after writing a 1M file w/
O_SYNC buffered or direct IO and shutdown, the file size is 0xff000
rather than 0x100000, i.e. the last fsynced 4k data is lost.

It can be reproduced as below w/ 16k block size:

xfs_io -fs -c "pwrite -S 0x5a 0 32k" /mnt/f2fs/file
xfs_io -x -c "shutdown" /mnt/f2fs
umount /mnt/f2fs; mount /dev/vdd /mnt/f2fs
stat -c %s /mnt/f2fs/file
28672

xfs_io writes 4k per pwrite() and fsyncs it, the 16k-sized 4k unaligned
direct IO falls back to buffered IO as well:

- pwrite [16k, 20k): allocates the block, last_disk_size = 32k (end of
  the page) after writeback, i_size (20k) is unaligned, so fsync writes
  the inode and its dnode w/ fsync mark
- pwrite [20k, 24k), [24k, 28k): in-place update of the block, i_size is
  unaligned, fsync writes the inode w/ i_size = 28k
- pwrite [28k, 32k): in-place update of the block, f2fs_i_size_write()
  sets FI_AUTO_RECOVER as the inode was clean; i_size (32k) is aligned
  and equals last_disk_size, so f2fs_skip_inode_update() returns true,
  and nothing is written for fsync since the in-place update doesn't
  dirty the dnode

After shutdown, roll-forward recovery restores i_size = 28k from the
last fsynced inode, and do_recover_data() only extends i_size to the end
of a recovered block when i_size doesn't exceed the block's start
(28k > 16k), so i_size stays at 28k, losing the fsynced 4k data.

FI_AUTO_RECOVER means that the dirtied inode can be recovered from data
blocks via roll-forward recovery, it's not true when i_size is extended
inside the old last block, let's clear FI_AUTO_RECOVER in that case, so
that fsync will write the inode. It happens w/ 4k block size as well,
e.g. w/ 1k O_SYNC appends.

Cc: stable@kernel.org
Fixes: 26de9b117130 ("f2fs: avoid unnecessary updating inode during fsync")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e9f8b31d5dab..d6b3955f9a6f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3615,8 +3615,9 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
 {
 	bool clean = !is_inode_flag_set(inode, FI_DIRTY_INODE);
 	bool recover = is_inode_flag_set(inode, FI_AUTO_RECOVER);
+	loff_t old_size = i_size_read(inode);
 
-	if (i_size_read(inode) == i_size)
+	if (old_size == i_size)
 		return;
 
 	i_size_write(inode, i_size);
@@ -3625,7 +3626,18 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
 		return;
 
 	f2fs_mark_inode_dirty_sync(inode, true);
-	if (clean || recover)
+
+	/*
+	 * Roll-forward recovery only extends i_size to the end of a recovered
+	 * block if i_size doesn't exceed that block's start, so it can't
+	 * recover an extension inside the old last block, e.g. an O_SYNC 4k
+	 * append filling up a 16k block, which is an in-place update of an
+	 * already allocated block. Let fsync write the inode for it.
+	 */
+	if (i_size > old_size &&
+	    old_size > round_down(i_size - 1, i_blocksize(inode)))
+		clear_inode_flag(inode, FI_AUTO_RECOVER);
+	else if (clean || recover)
 		set_inode_flag(inode, FI_AUTO_RECOVER);
 }
 
-- 
2.49.0

