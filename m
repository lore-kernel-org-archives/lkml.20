Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673584;
	b=EgpSLnHECgaGsvlGSW7z29VjVrT1ZmtMbaT6+u6QBJEBqTDySzw0CmvccpMs8uQqdW1z
	 qTTOGx+uhzDSBOgDQR+4nW9CLu4NJ0phVYPpYnjGIRX1EsCHq19XMT7VF0RxXhF0FvG7H
	 bet1/eBeYUC14XCq3ijWjXfegbJ0ao4dtVUTB48zaHaJj0fnQE/IzMvgevPq5Pcspi1ls
	 vdPF4a1zvze9P4BVcjrmjOe8x/AHs3uh7PaPs+m5dzc22YgyMimxwgqyiE70FBMRMt0nd
	 j5bW4mladbpaHzAH/rD2ltGKYwn2Fq/rmiVPGtRk1UMmFMR2NkHuCdUhsjkb2aPeKzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673584;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qTdxIjwF0CBphPx6QBICzBF4QJdGWk+rlqebDhD0eR4=;
	b=nu8HSd7UhXTZNZIxaEKIGLKVjlxVlmLjxdoj7Qdo4V0Gh6GpWJsFcSToMNTRaM3svMGL
	 SZT8DYgvEwtW9gVFq+aK+1Cc32OyptmmveVyGPJNTDd4kPqsToJlh5ynvLxAU2B9mdFTq
	 EkDxRp5SQxcL4UzQhPB8faIvaijznhNMPn6tL+oEYmpaI06bpY0kEh8VxvyTg/ArX1Ufk
	 xXC5qjLpP9L0riDTH2mlPVMseLtDIcazhjVknOJFvKqsQZiL79RNUz7/0F9QWjgfy8rZU
	 nVyPY/xGgAdSoKzZ9p1gifTFeWtZQ6x/jvtjQul/55VYwPEWTE+pZVXrO08ap6GMszQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPy3rvES;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96698606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPy3rvES
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4163D1F000C5;
	Thu, 22 Oct 2026 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673584;
	bh=qTdxIjwF0CBphPx6QBICzBF4QJdGWk+rlqebDhD0eR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JPy3rvESoWrcsCOyr6huaonU7SSQUACKLwnlV9CO8i0PIBbgQoX8GUv07efy94s2X
	 DvyV5B3AAvXXpTRfp997kRA2Sj6yMe1aEA7biPYJ2MguZdexCOutW0bx3zlpSekwOa
	 Q0BkfKtXWl9wScDxw0VE0R4+mYk4y7zTsZ6WZ8KCsGBnx4jdZ9rfsdEvPmC9eBfovN
	 8Vnt5v24z1VLKlgqVr9+9mhzpPoN/NOadhuR/8s30NcHXNtPvXvEh0NOPfm6KgSRse
	 aURBOMfXpWEPhMWVyJnYy9tT4hGIp1UsaoZp/exFGEe12FmmjOtkI1mbgoBbOcxTwK
	 V5SiyiBMJ+MfQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 6/7] f2fs: fix to serialize truncation of COW blocks w/ GC
Date: Thu, 22 Oct 2026 12:52:43 +0000
Message-ID: <20261022125244.2205275-6-chao@kernel.org>
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

GC migrates blocks of COW inode w/ the COW inode and its i_gc_rwsem,
however f2fs_ioc_start_atomic_write() truncates blocks of the reused
COW inode w/o holding COW inode's i_gc_rwsem, it only holds the
original inode's locks, so the truncation can race w/ GC.

Case #1: GC caches stale data of a freed block in meta cache

- GC (phase 3, cow inode C)		- ioctl(F2FS_IOC_START_ATOMIC_WRITE)
- f2fs_down_write_trylock(C's i_gc_rwsem[WRITE])
- ra_data_block(C, j)
 - f2fs_grab_cache_folio(orig mapping, j)
 - f2fs_get_dnode_of_data(C, j)
 : get P
 - f2fs_put_dnode()
 - f2fs_is_valid_blkaddr(P)
 - f2fs_folio_wait_writeback()
 - f2fs_wait_on_block_writeback()
					- f2fs_ioc_start_atomic_write()
					 - f2fs_down_write(orig's i_gc_rwsem)
					 - f2fs_do_truncate_blocks(C, 0, true)
					  - f2fs_truncate_data_blocks_range()
					   - f2fs_set_data_blkaddr(NULL_ADDR)
					   - f2fs_invalidate_blocks(P)
					    - f2fs_invalidate_internal_cache(P)
					    : nothing is cached
 - f2fs_grab_cache(META, P)
 : cache P in META[P]
 - f2fs_submit_cache_read(P)
 : SIT of P is still valid
					    - update_sit_entry(P, -1)
					    : P was freed
- end_io: f2fs_cache_set_uptodate(META[P])
: META[P] is stale for a freed block

On superblock w/o encrypt, verity and compression features, checkpoint
does not truncate meta cache, so META[P] survives after checkpoint, then:

- checkpoint, P can be reused
- writeback of victim's atomic write
 - do_write_block()
 : allocate P, write victim's data to P, META[P] is not invalidated
- GC phase 3: ra_data_block(victim's cow inode, k)
: META[P] is uptodate, skip reading
- GC phase 4: move_data_block(victim's cow inode, k)
: META[P] is uptodate, skip reading
 - memcpy(tentry, sentry)
 - f2fs_update_data_blkaddr(newaddr)
: victim's block was overwritten w/ stale data

Case #2: GC reports a false inconsistency error

- GC (phase 3, cow inode C)		- ioctl(F2FS_IOC_START_ATOMIC_WRITE)
- ra_data_block(C, j)
 - f2fs_get_dnode_of_data(C, j)
 : get P
 - f2fs_put_dnode()
					- f2fs_do_truncate_blocks(C, 0, true)
					 - f2fs_invalidate_blocks(P)
					  - update_sit_entry(P, -1)
 - f2fs_is_valid_blkaddr(P, DATA_GENERIC_ENHANCE)
 : or in f2fs_submit_cache_read()
  - __is_bitmap_valid()
   - f2fs_err("Inconsistent error blkaddr:...")
   - set_sbi_flag(SBI_NEED_FSCK)
   - dump_stack()
   - f2fs_handle_error(ERROR_INVALID_BLKADDR)

All other truncation paths hold i_gc_rwsem[WRITE] of the truncated
inode, let's hold COW inode's i_gc_rwsem[WRITE] during truncation of
COW blocks as well, then GC will skip COW blocks due to failure of
f2fs_down_write_trylock().

Cc: stable@kernel.org
Fixes: f18d00769336 ("f2fs: use meta inode for GC of COW file")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 363039da3ab2..3a7093a7c12e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2445,11 +2445,20 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		F2FS_I(fi->cow_inode)->atomic_inode = inode;
 	} else {
 		/* Reuse the already created COW inode */
+		struct f2fs_inode_info *cfi = F2FS_I(fi->cow_inode);
+
 		f2fs_bug_on(sbi, get_dirty_pages(fi->cow_inode));
 
 		invalidate_mapping_pages(fi->cow_inode->i_mapping, 0, -1);
 
+		/*
+		 * GC migrates COW blocks w/ cow inode and its i_gc_rwsem, so
+		 * hold it to serialize truncation of COW blocks w/ GC.
+		 */
+		f2fs_down_write_nested(&cfi->i_gc_rwsem[WRITE],
+						SINGLE_DEPTH_NESTING);
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
+		f2fs_up_write(&cfi->i_gc_rwsem[WRITE]);
 		if (ret)
 			goto out_unlock;
 	}
-- 
2.49.0

