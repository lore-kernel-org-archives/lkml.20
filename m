Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673583;
	b=zUET9IxFPUrOxvMubU0ylwhET9xni3N7gFG68zF1YoKTRLnqTHhikMIEfPbYPcPOHebF
	 kixqYxIdsBNMwYzq4tGpJKggGcvwEh2/funrUdg3vmC/Ph5VcCz6nb1v177YJPyNTH/qo
	 o29NBhloS1KfAEOwEKQWy48Wi7mO+ioAA2m9FVBdJziu0XoG7OR7EWAhClHEutX57ktLN
	 JOoalQA5oGNVd3lHbK1SietPKOqMd7gNzSbZKLPtJNGLjp6qQ5U7rKi3OC6RwieQ2s3NE
	 1boFwuY1G1nQ3LrGf88yGNaZInmDqVtr2bJgn8pwYcyTowmKg68FTSCDAZ4OLfVA1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673583;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Zv9V/TKUN6qAvAS+r24903BwcwIFwrBucgFy7IrQaD0=;
	b=zedeFzQHRM1fvMJw5JoszbNhMEfym3bnhsJrcGFdYfFEdqhdBoD2CVaiGUXhlhfbzvYm
	 aVATIql9XXeCWmM6jkwgD+0TxaowTyiVZvoxvf+UM2Cxe6jEPKM3ORzy2gehVzePJ4Yuv
	 sQS6AVEGJtWNBi1xmZak5HV5sk79CvJMMBhidzoHuj/kSEYV4HWYl5kgWT8DFZqAA4+gz
	 CirqLSU5RcQUh+8n9FrTTicUgaLQ75ejCLqM4NO+s3vG4xWvn5NSiMpXFEd/ALWjsGzK9
	 lZZp4Rwn+lSthz/5MUI4ijhTDaIGkPu1Pf3i6BA6b2+dVXQsJF6cwATX8kXCZccbzEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GgRR/vBF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D9606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgRR/vBF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E412C1F000C2;
	Thu, 22 Oct 2026 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673582;
	bh=Zv9V/TKUN6qAvAS+r24903BwcwIFwrBucgFy7IrQaD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GgRR/vBF1oFc/ehV5Z53H/GFDc+8DFGdKvAPE8DsyQdGiUKHQHGiCSbu0JEE2O6ZC
	 0s3n2Fr9LlIZTIWiqGyvu+GQ62NA4Vl+73nqRXub5C7JFC2hBgl82gaMJ74M2hoGf4
	 PqQWK2Z17OnZxsaWoB56BT5yBHmS0SrrTBM87JL70Gc3ySBvvoqQa/RpatxdMHROpo
	 JqyU1wnBlUPNZFQtSZeqaLx/q2GC5Dv+h9r8SZk0CcaO6AXp2WaGyeGLTqSxddIJwl
	 NPP/sQOeXpGwZZ86xO8SKYFdtwxiHER6BCKxbbNRB2ut6ASRZACTcblLVii9nsmt/P
	 dQNW/iGNOflQw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 5/7] f2fs: fix to truncate meta cache entry in F2FS_IOC_SEC_TRIM_FILE
Date: Thu, 22 Oct 2026 12:52:42 +0000
Message-ID: <20261022125244.2205275-5-chao@kernel.org>
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

F2FS_IOC_SEC_TRIM_FILE discards and/or zeroes out data blocks of the
file in place via f2fs_secure_erase(), but it never truncates the meta
cache entry of the blocks, which may be cached by GC if the inode
requires meta inode GC, e.g. encrypted inode.

GC trusts an uptodate meta cache entry w/o reading the block from disk
again, so it can migrate data which was erased to a new block address,
then the erased data will be resurrected in the file.

- App (file F)				- GC
					- gc_data_segment() phase 3
					 - ra_data_block(F, j)
					 : cache F[j] in META[P]
- ioctl(F2FS_IOC_SEC_TRIM_FILE)
 - f2fs_down_write(i_gc_rwsem[WRITE])
					- gc_data_segment() phase 4
					 - f2fs_down_write_trylock(i_gc_rwsem[WRITE])
					 : fail, skip F[j]
 - f2fs_secure_erase(P)
 : P was erased, META[P] becomes stale
 - f2fs_up_write(i_gc_rwsem[WRITE])
					- gc_data_segment() phase 3
					 - ra_data_block(F, j)
					 : META[P] is uptodate, skip reading
					- gc_data_segment() phase 4
					 - move_data_block(F, j)
					 : META[P] is uptodate, skip reading
					  - memcpy(tentry, sentry)
					  - f2fs_update_data_blkaddr(newaddr)
					 : F[j] was resurrected w/ erased data

In addition, GC may be writing back the block w/ meta cache, we need to
wait for the writeback before erasing the block.

Let's call f2fs_wait_on_block_writeback_range() for each block before
erasing it, which waits for writeback of the cache entry, and truncates
the cache entry.

Cc: stable@kernel.org
Fixes: 9af846486d78 ("f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 27e295bdce1c..363039da3ab2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4661,6 +4661,13 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 				goto out;
 			}
 
+			/*
+			 * wait for GC's writeback and truncate the meta cache
+			 * entry of the block, otherwise GC may migrate stale
+			 * data in meta cache after the block was erased.
+			 */
+			f2fs_wait_on_block_writeback_range(inode, blkaddr, 1);
+
 			cur_bdev = f2fs_target_device(sbi, blkaddr, NULL);
 			if (f2fs_is_multi_device(sbi)) {
 				int di = f2fs_target_device_index(sbi, blkaddr);
-- 
2.49.0

