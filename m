Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943964DDB47
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888960; cv=none; b=AtKi5upzN1C7IjTDBqn+O+x+Dtd3ux/INVU0y+rA2XVsvBXcfn63jTJF/PlH/iUZ3ybfF7MagYFmckvwElKue8aFIlW5blRSI0MS9x6/DFwt9VlWpGeFD+D1Ib1sn+v+ZI6972/I10wRJOM5EBTKV0J/wP1Eqyf0s1x5rG35QJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888960; c=relaxed/simple;
	bh=eRUrgmAuPRIuXoJe2LmSXe3PpNsWBeLSdekbDDNQlrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bo42dHtAN2DA52BuXMLEFhUWoLbdPtBn8Xd5siJ1a1vbfkc2mUNFEUZPiBeAK9J55i84nyUQkcWG6cUWLpUBG7n78yaybrSzK50dRKMd9rqG4Mt7MyCKc632zYmzEkf9IrGShq3SjsDAYqVwSLZ3rGWIDxYhr8XRmqYF+I/2r3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LATEmsWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LATEmsWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8AE1F00893;
	Tue, 13 Oct 2026 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888950;
	bh=NJvSD+gIR0TJD53Ex3slDvieQEd2xTrsZ1lZ54elzsc=;
	h=From:To:Cc:Subject:Date;
	b=LATEmsWuJm+s3uPnKytlrQq0s3XJ1v3+TM0Fo5H4NlnwnLCkq5xqPisGJBdP5gptJ
	 W1evG1sDhhxZgm/Mj5DzSsDIm8kBI1pIaIAuXcN8KUN+dEfheit2F4eQthh49sJ4kD
	 b4v44P9KVFibyA+HiyLx3uNIKeqwW+nAB2+LFqQlVaYiRWjoApKUBBU+PIZX+TYo3U
	 50Z1hpD2hXrRk0jsP6FC6tqU1zvJPehviLtwKbWD6SQvhND0yDXHJS8z69fbV83hnq
	 kuSiv2UWqnUtBOawHBKMUPhZ6VCbf7UjTpP4d146GUx7W7X6uKCdhiR3HuzljUEK2p
	 2OIyi66b20a0A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: fix to invalidate curseg if change_curseg() fails
Date: Tue, 13 Oct 2026 10:55:38 +0000
Message-ID: <20261013105538.3636822-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

Our consistency stress test (fsstress + fio + atomic write workers +
"f2fs_io shutdown 1") triggers below kernel BUG:

 F2FS-fs (vdd): Stopped filesystem due to reason: 0
 ------------[ cut here ]------------
 kernel BUG at fs/f2fs/segment.c:3989!
 Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
 Workqueue: writeback wb_workfn (flush-253:48)
 RIP: 0010:f2fs_allocate_data_block+0x257a/0x38e0
 Call Trace:
  <TASK>
  do_write_block+0x155/0xc10
  f2fs_outplace_write_data+0x192/0x340
  f2fs_do_write_data_page+0xc57/0x1880
  f2fs_write_single_data_page+0xda9/0x15a0
  f2fs_write_cache_pages+0x973/0x1f20
  __f2fs_write_data_pages+0x6c4/0x1890
  do_writepages+0x21e/0x560
  __writeback_single_inode+0x119/0x11b0
  writeback_sb_inodes+0x67d/0x17a0
  wb_writeback+0x207/0x820
  wb_workfn+0x128/0xc30
  process_one_work+0x925/0x1600
  worker_thread+0x60a/0xff0
  kthread+0x35f/0x460
  ret_from_fork+0x474/0x7e0
  ret_from_fork_asm+0x1a/0x30
  </TASK>

The BUG is f2fs_bug_on(sbi, curseg->next_blkoff >= BLKS_PER_SEG(sbi))
in f2fs_allocate_data_block(), next_blkoff was 512.

The root cause is a race in between atomic write commit and shutdown
as below:

Thread A (commit atomic write)  Thread B (shutdown)        Thread C (writeback)
- f2fs_ioc_commit_atomic_write
 - f2fs_commit_atomic_write
  - __f2fs_commit_atomic_write
   - __replace_atomic_write_block
    - f2fs_replace_block
     - __f2fs_replace_block
                                - f2fs_ioc_shutdown
                                 - f2fs_do_shutdown
                                 : F2FS_GOING_DOWN_METASYNC
                                  - f2fs_sync_fs
                                                           - f2fs_write_single_data_page
                                                           : pass f2fs_cp_error() check
                                  - f2fs_stop_checkpoint
                                  : set CP_ERROR_FLAG
      - change_curseg
       - reset_curseg
       : curseg->segno = new_segno
       : curseg->alloc_type = SSR
       : curseg->next_blkoff = __next_free_blkoff()
         which is BLKS_PER_SEG if there is no free
         slot in new_segno
       - f2fs_get_sum_cache
       : return -EIO due to f2fs_cp_error()
      : return error w/o restoring curseg
     : goto out_unlock, skip restoring
       old segno, blkoff and alloc_type
                                                            - f2fs_do_write_data_page
                                                             - f2fs_outplace_write_data
                                                              - do_write_block
                                                               - f2fs_allocate_data_block
                                                               : curseg->segno is valid
                                                               : f2fs_bug_on(next_blkoff >=
                                                                 BLKS_PER_SEG)

Since commit 86f33603f8c5 ("f2fs: handle errors of
f2fs_get_meta_page_nofail"), change_curseg() can fail after the curseg
has already been switched to the new segment, then the curseg is left
in an inconsistent state: it points to a segment which may have no
free slot, its summary block is zeroed, and the caller can not restore
it. Subsequent block allocation on the curseg will trigger the BUG.
Moreover, the writeback thread dies with curseg_lock, curseg_mutex and
sentry_lock held, so the commit, shutdown and other I/O threads hang
in D state.

Since change_curseg() only fails once CP_ERROR_FLAG is set, no
checkpoint will be committed afterward, let's invalidate the curseg via
reset_curseg_fields() on failure, as new_curseg() does for -ENOSPC,
then f2fs_allocate_data_block() will fail with -ENOSPC on the curseg
instead of triggering BUG, and do_write_block() can handle the error
since CP_ERROR_FLAG has been set.

Cc: stable@kernel.org
Fixes: 86f33603f8c5 ("f2fs: handle errors of f2fs_get_meta_page_nofail")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dab66ab3311d..453f9284ec86 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3243,6 +3243,7 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 	if (IS_ERR(entry)) {
 		/* GC won't be able to use stale summary blocks by cp_error */
 		memset(curseg->sum_blk, 0, sbi->sum_entry_size);
+		reset_curseg_fields(curseg);
 		return PTR_ERR(entry);
 	}
 	sum_node = SUM_BLK_ENTRY_ADDR(sbi, entry, new_segno);
-- 
2.49.0

