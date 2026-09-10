Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3236680E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006989; cv=none; b=kRtrmnyoWmHCxv0MIYGwVeRHBeG77bl8sfRM4cQF+Tf658S1G/2vgSqT7mBnUqe5Wd5kPNOiShNA7/qMcimW3q7kBxkEgZ+pXSM6tSH+09OpC6zSMZlFQxe8qZ2YQuknCp1mI9PLdpzXq9zZCSFouQcGpi62Uqb6V56e0W2O/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006989; c=relaxed/simple;
	bh=K9lMrgMDoMUhxCM0zt+EL90g/jx5aZNxhtDHXfzS8p8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jlKakRxmFqq9NEqtpay/STf//bqE+JHo03JpQJDmz+eFW+toITDcgQm9komQSpGxPz+AMlfXN4fiZmyWXygUEGVTF6MNkxLnFIvRcJp/888akiRXKXCzSzIDALYOY1QDF5HCoaZ1mVPYiyUkOULbg3yBxpgrSmARlVfjRq9Nvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeZ+JwCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeZ+JwCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1E71F000FF;
	Thu, 10 Sep 2026 02:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789006988;
	bh=o0oj7nh9eRthVBf+tZ/MxSqTlPk5TjQhyQrW6C85nI0=;
	h=From:To:Cc:Subject:Date;
	b=KeZ+JwCu7dEybred9UTUBTLysnUWeM0YI1VCqTdEnFTiM3Y/xw89jQJ8BvgyMGCzH
	 TS8fCpQ8NJ2nrNFdsbEGizMWXKVLwkbLSwnGPbWDodezxrF6Ydc4GHdtaQENZ34sRM
	 aZkcgmR1NDWgm3vUseVeB1ArJ1VEaKDTcOqUNxojgwVwQ/A6Xaztaa/GwtV0+039Qj
	 ScWP7y6OhcrRp8YDWyQ0AqaHRRRsIzf94Ma2XHjzOfn9Hw61ebDJnVObAruErT8jPZ
	 wWnMHCA2NgaLrRxHMgZqvZWqWRyDQmMP7y6XIswUunhsGwb6WsaXnqe+WM6I4lY8NG
	 yHMxPREU0ZNsA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: compress: fix to handle race between truncate and writeback
Date: Thu, 10 Sep 2026 02:22:58 +0000
Message-ID: <20260910022258.3308187-1-chao@kernel.org>
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
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ce88092d9ce2..e1cc7185428e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1222,6 +1222,7 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	int i;
 	int err;
 
+repeat:
 	err = f2fs_is_compressed_cluster(inode, start_idx);
 	if (err < 0)
 		return err;
@@ -1233,11 +1234,10 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	/* truncate compressed cluster */
 	err = f2fs_prepare_compress_overwrite(inode, &pagep,
 						start_idx, &fsdata);
+	if (err == 0)
+		goto repeat;
 
-	/* should not be a normal cluster */
-	f2fs_bug_on(F2FS_I_SB(inode), err == 0);
-
-	if (err <= 0)
+	if (err < 0)
 		return err;
 
 	rpages = fsdata;
-- 
2.49.0

