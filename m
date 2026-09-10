Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BF48EC87
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049494; cv=none; b=DFKZX9nCQu+39yvafMGHG5y4TScdXBQ7OmCJnTgofTC2rofWtmRhco91BtEV76zUmaaP1r1vzVuaYUSCt1zv19d7raRaKJMENShaZ1H87x5Aam+yY5AN1Q/76ls/fHKkMNVukxEpeXKdi7t1ea4urKjHCCctelO3lEjEK+ABCtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049494; c=relaxed/simple;
	bh=Jm6epicdz0HSV7XcEy9qi54XWYlDNHoU6JavwblrO2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMGcdFq/LTx6ubS+xxXg3tRFSUYRxQkuJAn6SsIN3MXsFLKGN4KL/Yg8p3i2Ayz+3ESYxEt2yfDHfVIscf9WuJy638Qiu5lIOgb+859fo07hYixzBdct1x+NSh65BxkxU0zx4NTUjqxgSFCH/AA5Bmsc9KHneOe7Jl+mMuICTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQsyExdw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQsyExdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932041F000FF;
	Thu, 10 Sep 2026 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049492;
	bh=lLAqtjys13v8tLrbWLlIUVt/Fd351A9zIJ5wib7pFzk=;
	h=From:To:Cc:Subject:Date;
	b=FQsyExdwj3+gfD/vJkurNxCcccf6ZwHpcfxTLN7KvYLmoL/SaFvLZAwDdIOMe2AQ7
	 9EN0Ahc9ZsjmvSf4ZTcqWRkA8laqj7mPz1fDMDKfi90+STB2T4dRrYwrU3BVwWarDC
	 5G/Bbmwmr7REdRhhQIEgASmhqv4LxW8p1Op3S+ypqhUBJmkN5NKjyFNhQUbwrv1RUn
	 J687HNkvyuOpuYyRbWYaHx8SGdvQZk50GShHer1np1FMrdKLlr+lNaRJTCxOqm6PHt
	 RdDFDYv/tZ4OA2lXUDwFPHxJym3Za1cBm0TUtFE2pYJJ4Aa5YCeeuIOwjVBEFStns8
	 /xivgPQA4U6Sg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org,
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: [PATCH v2] f2fs: compress: fix to handle race between truncate and writeback
Date: Thu, 10 Sep 2026 22:11:26 +0800
Message-ID: <20260910141126.1309794-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

fsstress reports a kernel BUG in f2fs_truncate_partial_cluster():

kernel BUG at fs/f2fs/compress.c:1238!
RIP: 0010:f2fs_truncate_partial_cluster+0x292/0x2a0
Call Trace:
 <TASK>
 f2fs_truncate+0xf6/0x210
 f2fs_setattr+0x6b7/0x770
 notify_change+0x33b/0x520
 do_truncate+0xc2/0xf0
 vfs_truncate+0x153/0x1d0
 ksys_truncate+0x78/0xd0
 __x64_sys_truncate+0x16/0x20
 do_syscall_64+0xbe/0x540

The root cause is that Thread A (truncate) and Thread B (background
writeback or fsync) can race as follows:

Thread A                             Thread B
- f2fs_setattr
 - f2fs_truncate
  - f2fs_truncate_blocks
   - f2fs_truncate_partial_cluster
    - f2fs_is_compressed_cluster
      return 1
                                     - f2fs_write_cache_pages
                                      - f2fs_write_multi_pages
                                       - f2fs_write_raw_pages
                                        - f2fs_write_single_data_page
                                          dn.data_blkaddr != COMPRESS_ADDR
                                          (cluster converted to normal)
    - f2fs_prepare_compress_overwrite
     - f2fs_is_compressed_cluster
       return 0
     - return 0
    - f2fs_bug_on(sbi, err == 0): BUG!

Writeback path does not acquire i_gc_rwsem or filemap_invalidate_lock.
When a compressed cluster fails compression during writeback, it is
overwritten with raw data blocks. If Thread A checked
f2fs_is_compressed_cluster() before the conversion, but calls
f2fs_prepare_compress_overwrite() after the conversion,
f2fs_prepare_compress_overwrite() returns 0 because the cluster is no
longer a compressed cluster.

To fix this, remove the f2fs_bug_on() and retry checking the cluster status
when f2fs_prepare_compress_overwrite() returns 0, so that it can fall back
to f2fs_do_truncate_blocks() to handle it as a normal cluster.

Cc: stable@kernel.org
Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ce88092d9ce2..b71107604012 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1222,6 +1222,7 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	int i;
 	int err;
 
+repeat:
 	err = f2fs_is_compressed_cluster(inode, start_idx);
 	if (err < 0)
 		return err;
@@ -1233,12 +1234,11 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	/* truncate compressed cluster */
 	err = f2fs_prepare_compress_overwrite(inode, &pagep,
 						start_idx, &fsdata);
-
-	/* should not be a normal cluster */
-	f2fs_bug_on(F2FS_I_SB(inode), err == 0);
-
-	if (err <= 0)
+	if (err < 0)
 		return err;
+	else if (err == 0)
+		/* the cluster became non-compressed one due to race case */
+		goto repeat;
 
 	rpages = fsdata;
 
-- 
2.49.0

