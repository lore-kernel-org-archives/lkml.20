Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793687373;
	b=BIVyk70PqZGFNiqJxmmedKTIsmzHQ/qrKdaLLMIJ8+YHyVH+5BqdrUjQcPHwX6KOllWE
	 OvR4Ji6qVV2y9dmnaDVUGdszcd2wb3RldrRXl6K68xnot95PeEVZF8Gs0mOJ42IMzx0tm
	 Kxd+UaFNMdGQzVcTM8dw1TMKIE9TQCr2dLPm0KTHWK3nWzOv4IirPMCUVJIaoscCa+bJq
	 VStpuuw+R8UBIH+m8mSe9EMUCWuKmJLdH68+t7NXwxQFWeBH2NA3AHJ6lTCNLW2eaJjFB
	 qOTLr+xCauHtAKvktFU9PwOhUWm1BGPgbpbjiJ2zqlTgWE1C6uCFWP113S0QYGZCARA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687373;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7UPmuk4TFC5ZpEEeEBchAtDv38dC4JEqbtSylYNe2BE=;
	b=FIeW3I7wwNdBEYR7GjiijtH7rwN0V2MwfG0dBPGhI3fYrBB3+MulJixHEyHKr5jm6slv
	 uZxq4Ktfl/sraxiH5J9TUvoq9EgzKZc/O/b+ikSfljBDTR75qFuOb6Vst/xTCq5dSOrYT
	 y9ACDL7nzE8GoT5GFeGbM6thtZUkxDZ6qJHIGDZcdELTOWd+JtvfVzzsstpeZcn12SEx6
	 m2LWc6iz7FxrfKDhrfnDubnhTsL8B5sNnmYdcpbYxlIoh9TA5rF0nOOPpB8xdYtyQz41N
	 DiGMCPcP30XnKLk0XoALR59KOiGmgMR4MMm83uKLBRsKL0LqqPjpeG6VyL76nwsrjhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6aCophM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48C606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6aCophM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793687372;
	b=ApRbXla/LMwvJrpLG6ExGmVcncQiY+gAw4x882xiVEyaVcv09a2dxOVP1G3zQRvZ/BkI
	 9GAZpmlu/FVx+7uj7rt8T9KDtlqLmW4Ry8/Wj5zoXYovXdaVZ2eadOIpbNWrBPj3j8/RX
	 7cVODPUNicsMR775E6+KmmZvVtZYWgja5YmwNOJXPvMDJGmLRi7A8tW20hy6JSNrcGJiO
	 rZmZduZQ2g/xm063yE/nJx9sW7Jihj6mNe8JXz64oQRtoDqqhD6JsmJn24uqdPisbe3r8
	 8BRLxWIN+hxjHdSalon5YbDtRX76s0GuEqPEckfIXgm+UyOYKxjLltL5DW5rMOzPNCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793687372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7UPmuk4TFC5ZpEEeEBchAtDv38dC4JEqbtSylYNe2BE=;
	b=mrLG+7nREFFDEvWNbOxbpxiJdQb7lNAD/7pYL5UMzxYJvDqCESqfgFSCJtDuD7iCn2nf
	 502sp+ZJnmIKeOm39jZqJPTOPL+pEw6gYSjQngEdROq2RNkv1rzmLjdoo59FmM07GJDap
	 ksxuanLqDPBogtFV/dTXqwHT9ITzdd+eMveVX5cdv8I8P6jXreW6rJq2jMWcSbwNVGp4m
	 c/doAEz+jQp3RKxd151vIYD6F8EUNX+BzWr/jR/Ww0LN1mIR7V9lyI4q9DkHpTBrAzxPW
	 oT1P/NqfFeRO6zB5wZBexF9/bvoLmPBo6oXOgDIvcIwhqF7FtZDMAsWj5C6zwoUFi1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB4ED1F00A18;
	Tue,  3 Nov 2026 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687372;
	bh=7UPmuk4TFC5ZpEEeEBchAtDv38dC4JEqbtSylYNe2BE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=X6aCophMR1lsAYRXpxIlT6YvzgeyFEYvVR8t/b+S32DH+2qf9kW6AtldiTFJB7PUe
	 07KYjM+WxUzRcY16aaRYcsI4HugwIx4245ktCr66E1HukjaGFFnjd4IAyTaQqNzkiJ
	 9Tbe1a6iiGWESFEiS7Bdl23L92ortgPqEkdYVB+xbt9N67wHUqZBnCvvcCNoILLRJ5
	 ZXRt0wO+lloDVJ+t2O5x5+IglVHmg5rj6nOTOFhkvj6llNNoLLC/somyZInl6NsnVc
	 z8ExXcYG3v/YooJtjP0J/o5dBlWALdQmJsIyyZlJEmHuA99flJeRVKZKxe9799e1kx
	 AVtqvTMsoKrMg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3C8CA467E2;
	Tue,  3 Nov 2026 06:29:31 +0000 (UTC)
From: Daejun Park via B4 Relay <devnull+daejun7.park.samsung.com@kernel.org>
Date: Tue, 03 Nov 2026 15:29:32 +0900
Subject: [PATCH v2 2/3] erofs: treat files shared by inode_share as stacked
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-erofs-fileio-bioset-v2-2-5b91af423f72@samsung.com>
References: <20261103-erofs-fileio-bioset-v2-0-5b91af423f72@samsung.com>
In-Reply-To: <20261103-erofs-fileio-bioset-v2-0-5b91af423f72@samsung.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
 Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Daejun Park <daejun7.park@samsung.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793687370; l=2096;
 i=daejun7.park@samsung.com; s=20261006; h=from:subject:message-id;
 bh=KxcTgYYaPu5ba+F2AtFEMVGnO9mL8oKwwj4AMcUNn08=;
 b=S2n4lwsiv48b8UmHOXyIuZvRI8taOqLM2WUyGaIMQkzTKbeosLWqY2VLTTxtt3lXybxjk8GeO
 tfdGCvnzh0AAsqQdRw3rYVFSDUmFZHEXvR9Rr4zYg0qWgt80rOcwHju
X-Developer-Key: i=daejun7.park@samsung.com; a=ed25519;
 pk=4yUfDqGRZTIj0Ik43z1GoMZRWCNm/rgX6uJuM9dtNIg=
X-Endpoint-Received: by B4 Relay for daejun7.park@samsung.com/20261006 with
 auth_id=1122
X-Original-From: Daejun Park <daejun7.park@samsung.com>
Reply-To: daejun7.park@samsung.com
Content-Transfer-Encoding: 7bit

From: Daejun Park <daejun7.park@samsung.com>

A file-backed mount whose image or extra device is on a block-backed
EROFS passes erofs_is_stacked_file(). If inode_share shares that file,
erofs_real_inode() may pick an inode of a file-backed EROFS in the same
domain to read it. File-backed reads then nest in the same task.

Treat files that use erofs_ishare_fops as stacked.

Fixes: 34096ba919fd ("erofs: support unencoded inodes for page cache share")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20261030-erofs-fileio-bioset-v1-1-caf47adbb3a3@samsung.com
Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/erofs/super.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ee01a5ef85..e92a7fa90a 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -125,9 +125,12 @@ void *erofs_read_metadata(struct super_block *sb, struct erofs_buf *buf,
 /* see the comment in erofs_fc_fill_super() */
 static bool erofs_is_stacked_file(struct file *file)
 {
-	struct super_block *sb = file_inode(file)->i_sb;
+	struct inode *inode = file_inode(file);
+	struct super_block *sb = inode->i_sb;
 
-	return (sb->s_op == &erofs_sops && !sb->s_bdev) || sb->s_stack_depth;
+	return (sb->s_op == &erofs_sops && !sb->s_bdev) || sb->s_stack_depth ||
+	       (IS_ENABLED(CONFIG_EROFS_FS_PAGE_CACHE_SHARE) &&
+		inode->i_fop == &erofs_ishare_fops);
 }
 
 static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
@@ -713,6 +716,9 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 		 * EROFS is the only fs supporting file-backed mounts for now.
 		 * It MUST change if another fs plans to support them, which
 		 * may also require adjusting FILESYSTEM_MAX_STACK_DEPTH.
+		 * Files shared by inode_share may be read through a
+		 * file-backed EROFS in the same domain, so treat them as
+		 * stacked too.
 		 */
 		if (erofs_is_stacked_file(sbi->dif0.file)) {
 			erofs_err(sb, "file-backed mounts cannot be applied to stacked fses");

-- 
2.43.0


