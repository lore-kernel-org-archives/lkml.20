Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673582;
	b=ny0phbQMwoRGHyie9hKpBt/yWGq6iIgn7dwLzH+Ax6U6nMdPO1ZYk31m0ADVw1E8NRIA
	 TZF0xNVdRNO5KgY1BGRpzQebR37lKUU7/7EZyZI0zz4t9zDC4gVI0ePo0lJTHPpDhotmS
	 AuZRmis/asW1z7mLqhSCOumNOufGb7GAqhnKVDP1T5MXzl8Wia0tWLy/5o+Zlj4CxJVWQ
	 2LSIpMiqOlO2k+su3+/Y/jd8s4jYNhCU9ILWS0rhfMBdgrxSWX3MHw2JCzZOGdcvj6/3p
	 hCR5AfYvHvtgIaZtPbJaRFofD7pNoRSscm3AbsGJyiuI7XK6uBamTp2y3ZedXu++nEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673582;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mC7auiCaQGZIxut1v/QBYeg0DgUHWCkVzu3OemQGO7k=;
	b=gOrdfn0eiJsiaRj9x95I6vyATDMXs74x7eKFjeZEVyEKAoVa7dRmWupd2DoqiK03kusN
	 RXaBMC2hS3hNWywsOzDkrAo8a6L8Y5q1KmRSbTHuDY6b+t28lTjEQm8ZMglPc5vCL3CtS
	 tFCPMaamhHVSdwXA4DeGBKwv3Gt2V52F5j2jJmr/+ff5sl9LY813sjZpw3yCXYOBdN9Ne
	 jDatRBzxKwwMSThEmk4MARRz5D3brUq7h8KuNt8PZ/bTsYCge4Rc4JZ0llZEauOL9bKjM
	 kPxmEUFEFTyzTrGZG+NzYtraKKBTbKsaQ0NK8hu8UDgysu17m7Uw2o3T+4fGBEqaL7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJqeeYB4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC58606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJqeeYB4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928FD1F000C5;
	Thu, 22 Oct 2026 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673581;
	bh=mC7auiCaQGZIxut1v/QBYeg0DgUHWCkVzu3OemQGO7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fJqeeYB46NR7x7eozWMgPsBjibI0+5qLaTN7u4ooecCnqokBue5VEihM7pxhvpMGw
	 Hc93tOzLzLIny8t/dLpFQQK2VVl1aw8pPAH8p73/xJRwpfyaILATzrWqRh+9ZGLtX3
	 OLSjNVNGNbyw+2v2vNcTykYmTzRfmVj28f1+yrAMrbu3BDsTAfOt+PhtlMDhYM7UBw
	 GUDlsAUWNPfE5z9rOrspqnNycj+A6Y9tV2r0fS0EWuw8a0OG5s4ddBVXrOJfUOMDt4
	 yRA0OSR/aZflgCWKO1R5BfVg1o/0IkWQalVnB3GOGfSC/PxY2lhC6opgSL11DXQ9aA
	 YzhCN5tK8LOSA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 4/7] f2fs: fix to truncate stale meta cache entry on in-place update
Date: Thu, 22 Oct 2026 12:52:41 +0000
Message-ID: <20261022125244.2205275-4-chao@kernel.org>
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

GC migrates data blocks of the inode which requires meta inode GC via
meta cache, and it trusts an uptodate entry w/o reading the block from
disk again, in both ra_data_block() and move_data_block().

However, in-place update paths only truncate the entry if the inode
requires meta inode GC at the time of writing:
- f2fs_inplace_write_data() checks fio->meta_gc
- f2fs_wait_on_block_writeback_range() for DIO checks
f2fs_meta_inode_gc_required()

f2fs_meta_inode_gc_required() returns true for atomic and COW files,
which is a temporary state, so an entry cached during atomic write, or
cached before the block was donated by F2FS_IOC_MOVE_RANGE, can survive
in-place update once the owner does not require meta inode GC, then GC
will migrate stale data from the entry once the owner requires meta
inode GC again, resulting in overwriting valid data.

Case #1: atomic write

- App (file F)				- GC
- ioctl(F2FS_IOC_START_ATOMIC_WRITE)
 : f2fs_meta_inode_gc_required(F) is true
- write F[k], k != j
					- gc_data_segment() phase 3
					 - ra_data_block(F, j)
					  : cache F[j] in META[P]
- ioctl(F2FS_IOC_COMMIT_ATOMIC_WRITE)
 - f2fs_commit_atomic_write()
  - f2fs_down_write(i_gc_rwsem[WRITE])
					- gc_data_segment() phase 4
					 - f2fs_down_write_trylock(i_gc_rwsem[WRITE])
					 : fail, skip F[j]
  - __f2fs_commit_atomic_write()
  : only F[k] is replaced, F[j] is still mapped to P
  - f2fs_up_write(i_gc_rwsem[WRITE])
 - f2fs_abort_atomic_write()
  - clear_inode_flag(FI_ATOMIC_FILE)
- write F[j] w/ new data, fdatasync()
 - f2fs_inplace_write_data()
 : fio->meta_gc is false, META[P] becomes stale
- ioctl(F2FS_IOC_START_ATOMIC_WRITE)
					- gc_data_segment() phase 3
					 - ra_data_block(F, j)
					 : META[P] is uptodate, skip reading
					- gc_data_segment() phase 4
					 - move_data_block(F, j)
					 : META[P] is uptodate, skip reading
					  - memcpy(tentry, sentry)
					  - f2fs_update_data_blkaddr(newaddr)
					 : F[j] was rolled back to old data

Case #2: F2FS_IOC_MOVE_RANGE

- Thread A (src)			- GC			- Thread B (dst)
- write src[i], P is not checkpointed
- ioctl(F2FS_IOC_START_ATOMIC_WRITE)
					- gc_data_segment() phase 3
					 - ra_data_block(src, i)
					 : cache src[i] in META[P]
					- gc_data_segment() phase 4
					 : fail to lock i_gc_rwsem, skip src[i]
- ioctl(F2FS_IOC_ABORT_ATOMIC_WRITE)
 - f2fs_abort_atomic_write()
  - clear_inode_flag(FI_ATOMIC_FILE)
- ioctl(F2FS_IOC_MOVE_RANGE, src[i] -> dst[j])
 - f2fs_move_file_range()
  - __exchange_data_block()
   - __read_out_blkaddrs()
   : P is not checkpointed, do not invalidate it
   - __clone_blkaddrs()
    - f2fs_replace_block(dst[j], P)
									- write dst[j] w/ new data, fdatasync()
									 - f2fs_inplace_write_data()
									 : fio->meta_gc is false, META[P] becomes stale
									- ioctl(F2FS_IOC_START_ATOMIC_WRITE)
					- gc_data_segment()
					 - ra_data_block(dst, j)
					 - move_data_block(dst, j)
					 : migrate stale data in META[P]
					 : dst[j] was overwritten w/ src[i]'s old data

DIO overwrite has the same issue, since f2fs_map_blocks() w/
F2FS_GET_BLOCK_DIO calls f2fs_wait_on_block_writeback_range() for the
block which will be overwritten in place.

Before commit 570e2ccc7cb3 ("f2fs: avoid reading already updated pages
during GC"), ra_data_block() always read the block from disk, then the
stale entry would be updated before move_data_block() used it.

Let's always truncate the meta cache entry in f2fs_inplace_write_data()
and f2fs_wait_on_block_writeback_range() regardless of current state of
the inode, and only wait for writeback of the cache entry when the inode
requires meta inode GC.

Cc: stable@kernel.org
Fixes: b40a2b003709 ("f2fs: use meta inode for GC of atomic file")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index daf6d9617d5b..c24910839583 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4282,8 +4282,13 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	if (fio->meta_gc)
-		f2fs_truncate_meta_caches(sbi, fio->new_blkaddr, 1);
+	/*
+	 * GC may have cached this block in meta cache while its owner was in
+	 * atomic write or before it was donated by F2FS_IOC_MOVE_RANGE, so
+	 * truncate it regardless of fio->meta_gc to avoid that GC migrates
+	 * stale data from meta cache later.
+	 */
+	f2fs_truncate_meta_caches(sbi, fio->new_blkaddr, 1);
 
 	stat_inc_inplace_blocks(fio->sbi);
 
@@ -4471,12 +4476,16 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	block_t i;
 
-	if (!f2fs_meta_inode_gc_required(inode))
-		return;
-
-	for (i = 0; i < len; i++)
-		f2fs_wait_on_block_writeback(inode, blkaddr + i);
+	if (f2fs_meta_inode_gc_required(inode)) {
+		for (i = 0; i < len; i++)
+			f2fs_wait_on_block_writeback(inode, blkaddr + i);
+	}
 
+	/*
+	 * GC may have cached these blocks in meta cache while their owner
+	 * required meta inode GC, truncate them regardless of current state
+	 * of the inode, since DIO may overwrite them in place.
+	 */
 	f2fs_truncate_meta_caches(sbi, blkaddr, len);
 }
 
-- 
2.49.0

