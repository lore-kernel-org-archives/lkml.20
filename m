Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED36D47255B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368279; cv=none; b=YIwgYPLdpeBdTTEWNQYFm6c9SWUgFI2sLlCNo273yI0iFh9enMgfDawe1RpsJNYAMsxmy7wWLy5oTSGXZpXd20/aj4LQ6HIfWmA86fZ3MzuVdWxvRdZFeOFjiN+F8H6rlQb70WUwOPjus2OP7qa2X6sYTwMYahp5K04+paklcNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368279; c=relaxed/simple;
	bh=BiffcBJxqP7D44tYQORWyl2kBF0E+Q8PVy+W29QX91c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTzScsYGXZ1pT6ipOAyb3IhJjXzxyMO36pl8d7JC7HB4JeLgmBO6Pv2wWhUzRhP4bv5jy9RRRk9h1MiRUMNr0j9vI6lHI0+rVA5ILGu6Qq0QhdqrXSPCXZHDHQKnz7jvSJ4xv2jeCI0J/uuxQ3nSmVqlxC2SZJ6hUwx8I7mLiqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXJr9iWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXJr9iWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5E71F0089C;
	Wed,  7 Oct 2026 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368270;
	bh=Y0GnRc4T4ZE9nqw5bVtX9AvOSXcgvcWFrOaRGb2SBZA=;
	h=From:To:Cc:Subject:Date;
	b=WXJr9iWzUetPxK+2oME2HcLBQfpvbTLx+pVOqI1/8VNqJvZL2n6MPZKNfVCB7Wo1o
	 1rA+gxL9GtPv2ST/DmmkjKfNmfjELQjFqi6oalbxc+5+kxAdxIFOnvSZM8NGaXZlBh
	 9pOeEuICelhpcu7TE8Q7vL0sppc/+XNZm/dWneTDnNDSztYYmb8Pt8tSav4NS+oN0j
	 31HvrBEcLiZ8Bi61o+MhUTSKKjpUUIYvo3/TOAXUwfLqzGfGPzD8bQZaWbsD9zGGFu
	 b8ZWPK7DR5GmM+65lQDoNPfSYiFTRQaKxN4NJE/VASoVvhf1KIeQ8DqtJZ9OtgicWJ
	 LZwbl4pTmEXvA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] Revert "f2fs: skip node_change lock for inline data writes"
Date: Wed,  7 Oct 2026 10:17:38 +0000
Message-ID: <20261007101738.2348038-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This reverts commit 66eec36c2421383e5b32e9c1740f656474c80df8.

Fault injection + shutdown stress test reports inconsistent inline
data after "f2fs_io shutdown 2" (mode=lfs, nonzone, segs=1):

[__chk_dentries:2067] [  6]-[0x26] name[0MVNBi,Cv33...] len[0x20] ino[0x4190] type[0x7]
[ASSERT] (fsck_chk_inode_blk:1142)  --> [0x4190] junk inline data
[fsck_chk_inode_blk:1150] ino[0x4190] has inline data!
...
[FSCK] other corrupted bugs                           [Fail]

ino 0x4190 is an encrypted symlink, the inode block pointed by the
last checkpoint's NAT entry contains valid inline data, however
F2FS_DATA_EXIST is not set in i_inline (i_size is stale as well).

The node_change rwsem was taken in prepare_write_begin() for inline
inodes in order to serialize write_begin with block_operations():
checkpoint holds node_change for write from the last check of
F2FS_DIRTY_IMETA until all dirty node blocks are flushed, so either
1) FI_DATA_EXIST is set before the check, the inode is in DIRTY_META
   list, and f2fs_sync_inode_meta() -> f2fs_update_inode() syncs
   F2FS_DATA_EXIST and i_size into the inode block before it is
   written by checkpoint, or
2) FI_DATA_EXIST is set after block_operations(), then the inode
   block written by this checkpoint does not contain the new inline
   data.

Commit 66eec36c2421 ("f2fs: skip node_change lock for inline data
writes") skips the lock for writes which fit in inline area, assuming
setting FI_DATA_EXIST only dirties inode metadata.
However, dirtying inode metadata after F2FS_DIRTY_IMETA was checked,
while f2fs_write_inline_data() (which never holds any checkpoint
lock) copies inline data into the inode block, breaks the above
ordering, then checkpoint persists an inode block which has inline
data but stale i_inline/i_size:

- f2fs_symlink                       - f2fs_write_checkpoint
 - f2fs_add_link                      - block_operations
  - f2fs_init_inode_metadata
  : i_inline = F2FS_INLINE_DATA
  - f2fs_update_parent_metadata
  : clear FI_NEW_INODE
                                       - f2fs_flush_inline_data
                                       - f2fs_lock_all
                                       - f2fs_down_write(node_change)
                                       : F2FS_DIRTY_IMETA is zero, skip
                                         f2fs_sync_inode_meta()
 - page_symlink
  - f2fs_write_begin
   - prepare_write_begin
   : missed f2fs_map_lock(), i.e.
     f2fs_down_read(node_change), so
     it isn't blocked by checkpoint
    - set_inode_flag(FI_DATA_EXIST)
    : inode becomes dirty, too late
  - f2fs_write_end
   - f2fs_i_size_write
 - filemap_write_and_wait_range
  - f2fs_write_single_data_page
   - f2fs_write_inline_data
    - memcpy_from_folio
    - f2fs_mark_cache_dirty
    : ientry has inline data, but
      no F2FS_DATA_EXIST in i_inline
                                       - f2fs_down_write(node_write)
                                       - f2fs_writeback_node_caches
                                        - __write_node_cache
                                        : write ientry w/ stale i_inline
                                       : F2FS_DIRTY_IMETA isn't rechecked
                                      - f2fs_flush_nat_entries
                                      - do_checkpoint
- f2fs_io shutdown 2
: dirty inode is lost, fsck finds "junk inline data"

Besides the fsck error, for regular inline file, stale i_size may
cause data loss after sudden power-off even if checkpoint is
committed.

Let's revert the commit to restore node_change serialization for
inline data writes, and add a comment above f2fs_map_lock().

Fixes: 66eec36c2421 ("f2fs: skip node_change lock for inline data writes")
Cc: Seongjae Jeong <jsjlee1020@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
Drop original one or apply this revert patch is both fine to me.
 fs/f2fs/data.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d4ba5e77906..4bfa301a5df6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3915,11 +3915,15 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len > MAX_INLINE_DATA(inode)) {
+		if (pos + len > MAX_INLINE_DATA(inode))
 			flag = F2FS_GET_BLOCK_DEFAULT;
-			f2fs_map_lock(sbi, &lc, flag);
-			locked = true;
-		}
+		/*
+		 * it needs to cover FI_DATA_EXIST and inline data update w/
+		 * node_change, otherwise concurrent checkpoint may persist
+		 * inline data only w/o F2FS_DATA_EXIST.
+		 */
+		f2fs_map_lock(sbi, &lc, flag);
+		locked = true;
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
 		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
-- 
2.49.0

