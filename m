Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801090;
	b=SAQo2nvQsgPKSYeX5qWf7IvpM6X7hD4L3nNLJGwThCVcyDftNq6G6yq1GE4neQwXFltW
	 6ijQX24L0vFMuqew3Os9Zy3SokoUYbAeZtY4A+2XwoNqQPyoNJTQcmaD5hzsP9xw6GKVc
	 T5GDtSBzKVk9uEdnbuD9f0zPIcTDY4Pu9iBLxSwCSN7Lqr4NSkdYznoDDgI2Yj2n9diQR
	 QegaLV/dXg4HO76a9y2Kb/IJKa/2K8gVxoNQ4+gR8Djz1dAePU7yOjlAhAHLv+AMB5k0X
	 BOJADGmud3D07fG6lecFjFxqVTKCZ1MdXmV0VTFDEwKD71DX6wJs+Xn8w/ssny8dJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801090;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5dOSQLDCE+JCBsQn1lnsjksJIZuBRRdDBAUNKcrYSgo=;
	b=NIoKVC22pYXSsUUGM2xCfUjUiHGhvtmFT7PMBI6UIppAunoE0R9WoLsOOTBgNetMWBXo
	 waATHzmt2yS6SX4gBKm1sqJK0vSpHu37JtLH9YXLiO0aqfKlb9ZfDIAXNqTnyIGbv6hVy
	 zFmJGg2Vy7iew7v6BQ3oSzFYvzVZGkV4zHLUMsADm8Mzv62JAM4nvNmVG6R4cuX6FN69O
	 dv+L+Ce1Dq76BC6TxP0MP0EOoeRpSi3dvvXYjYVi5Quq0AAK2fQfWo0zASolAHYnpvwjh
	 +RsQrss8PB2GZbV31fEQk1AZYMO7c3SD1/crRSBa8AYe/2eS78jgTtSOGLMNFz7PO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.219
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5D606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07466662|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0162382-0.00211011-0.981652;FP=15765475551722947752|1|1|4|0|-1|-1|-1;HT=maildocker-contentspam033032065030;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.k2nJYm4_1794801078;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k2nJYm4_1794801078 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 16 Nov 2026 11:51:19 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: phillip@squashfs.org.uk,
	akpm@linux-foundation.org
Cc: phillip.lougher@gmail.com,
	linux-kernel@vger.kernel.org,
	Xiaolei Wang <wangxiaolei01@kaihong.com>,
	syzbot+7b1d0ea11475e857d063@syzkaller.appspotmail.com
Subject: [PATCH] Squashfs: return -EINVAL when directory size check fails
Date: Mon, 16 Nov 2026 03:51:14 +0000
Message-Id: <20261116035114.3605145-1-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
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

The directory size checks added by commit 5213b0a08263 ("Squashfs:
fix variables in directory code and add more sanity checks") jump to
failed_read without setting err.  err still holds the positive byte
count returned by squashfs_read_metadata(), so squashfs_read_inode()
returns 32 for SQUASHFS_DIR_TYPE and 40 for SQUASHFS_LDIR_TYPE instead
of an errno.

Note this only affects linux-next: the commit above is not in
mainline yet.

squashfs_fill_super() then fails before sb->s_root is set.
vfs_get_tree() only treats negative returns as errors, so it
reaches the "didn't set fc->root" BUG() in fs/super.c.

Set err to -EINVAL at both check sites so a corrupt directory inode is
rejected with a proper errno.

  SQUASHFS error: Unable to read inode 0x11f
  Filesystem squashfs get_tree() didn't set fc->root, returned 40
  kernel BUG at fs/super.c:2174!

Reported-by: syzbot+7b1d0ea11475e857d063@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7b1d0ea11475e857d063
Fixes: 5213b0a08263 ("Squashfs: fix variables in directory code and add more sanity checks")
Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 fs/squashfs/inode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 5404d7ba6fc0..4cf8a41b5859 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -255,8 +255,10 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le16_to_cpu(sqsh_ino->file_size);
-		if (inode->i_size < 3)
+		if (inode->i_size < 3) {
+			err = -EINVAL;
 			goto failed_read;
+		}
 
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
 		inode->i_op = &squashfs_dir_inode_ops;
@@ -284,8 +286,10 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
-		if (inode->i_size < 3)
+		if (inode->i_size < 3) {
+			err = -EINVAL;
 			goto failed_read;
+		}
 
 		xattr_id = le32_to_cpu(sqsh_ino->xattr);
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
-- 
2.34.1

