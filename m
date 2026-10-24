Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842261;
	b=mdiW/Lhc+ias4zGv5fFODZHzjDeEuMWa8AQB6S73y+FRApUqw1rfae9Fh9UC9DEZLGeM
	 xjjV5wUKbsXxmJ3GB8NnkKrdQwbbJFsROshQkKQ+3DLTDDZy3zqhFGHzyDAgJkY/oLlXk
	 74njKRwY6dJkoLpaXVDCmWeluNyksRgAgMDB+aFzGKd68KsdajCaDHmmKTV6dEUsUH2lV
	 YcXB6ODC14SdVAlpna4NB4n4z1T1NI0DloFupc3cJK8Pknk+NkxdSrWtA/S4f4t2x0mOQ
	 1bd4l8uTbis9BueB0ELQoTAGfbe2mcFXF1/F/9KmXp05rx3tsGa3j2Fl3GDAgpOcSKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842261;
	h=DMARC-Filter:DKIM-Signature:From:Mime-Version:X-Mailer:
	 X-Original-From:Content-Transfer-Encoding:To:Date:Cc:Subject:
	 Message-Id:Content-Type:X-Lms-Return-Path;
	bh=PDj4fWndRKPK2C3AFlrPKjKgtw4YZAPM7XpLbaxt01I=;
	b=JkyoQ2Atgz1NRUMneHeiX9JzT+D/gh8TAYfu4BHUn7HqaWWnoay3lNdchk5QNZwoUxq1
	 EldWUd8QCc7MdvKiApzxJVxvac73o5clKopLs6l1FBFhuzmr8WnlcYHquug5ntb57Qk3P
	 UIieD31L82+GiajUsUV43ybZlO/ZIC8P7jtjCUwy5cPcVvAdjwD1UHseuArwky7nYL7PG
	 aHbYOhTwYaxmzvps3BSaqQjYD+BCoK7M6vfFz4YVkqECkAKNlsaPWZdGiFi0kgtC8U3qG
	 KeCOTA1E34KsqfM5hF1O/jHae/PuTU6A8KqoX0Nf4mUApQSRGVJKmo+9uNctOsKZozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=GOAbD0Zh;
	arc=none smtp.remote-ip=209.127.231.115
Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1987606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1987606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=GOAbD0Zh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792842255; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=PDj4fWndRKPK2C3AFlrPKjKgtw4YZAPM7XpLbaxt01I=;
 b=GOAbD0ZhwniJK3hB/mReHVrDmaw31sFep5S3gmFsgNGLwprekd4WnGBBOMPtgVhRj7SjiF
 Fqq72ypKisaoX1gRBd/EcepuYYG+dYHmwNrRBqfcsKrZ3GBp1hAhFosipWr9+WTUaxrJc9
 yPcVESxrGfZTCTd0Xe6SkV8WpnmCEPqJ8g0VJiV+asIQH6c8zP5Rp+PbTJPmVT4I4ZOwnp
 yGw1XXHTLa8V3NVZh0+cvdRTjC/qzypa4WyAIi/IzeoT0NYKVm2ibaapydmbvIYQWaqaJg
 4EGNrXqwAWrDgqDrlW5h/DbKRPCB+v1w2N85p8nnY1StBzzCnjZ6j6Zzmpd+0Q==
From: "Jiahao Luo" <luojiahao.fs@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
X-Original-From: Jiahao Luo <luojiahao.fs@bytedance.com>
Content-Transfer-Encoding: 7bit
To: "Jaegeuk Kim" <jaegeuk@kernel.org>, "Chao Yu" <chao@kernel.org>
Date: Sat, 24 Oct 2026 19:43:16 +0800
Cc: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>, 
	"Jiahao Luo" <luojiahao.fs@bytedance.com>
Subject: [PATCH] f2fs: avoid false corruption report for stale file handles
Message-Id: <20261024114316.1604043-1-luojiahao.fs@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26adc9a0d+666726+vger.kernel.org+luojiahao.fs@bytedance.com>

File handles do not pin inodes. Once an unlinked inode loses its last
reference, F2FS may free its nid and later allocate that nid as a
non-inode node belonging to another file.

f2fs_nfs_get_inode() currently uses f2fs_iget(), which requests an inode
node before it can compare i_generation. If a stale handle's nid now
identifies a non-inode node, footer validation reports an inconsistent
node, sets SBI_NEED_FSCK, and records a filesystem error even though the
filesystem is consistent.

Add a handle-specific iget path that reads the nid as NODE_TYPE_REGULAR.
This preserves the generic node footer checks, but allows a valid
non-inode node to be recognized and returned as -ESTALE without parsing
it as an inode. Keep the existing strict inode lookup for all internal
callers. A nid reused as another inode remains subject to the existing
generation check in f2fs_nfs_get_inode().

Fixes: e34438c903b6 ("f2fs: fix to do sanity check with node footer and iblocks")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Jiahao Luo <luojiahao.fs@bytedance.com>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/inode.c | 27 +++++++++++++++++++++++----
 fs/f2fs/super.c |  7 +++----
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index aedba8b79baa..019fb2383165 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3999,6 +3999,7 @@ void f2fs_set_inode_flags(struct inode *inode);
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry);
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
+struct inode *f2fs_iget_handle(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
 int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
 void f2fs_update_inode(struct inode *inode, struct f2fs_cached_block *entry);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9164a2b5d9f0..4260e8264555 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -422,7 +422,7 @@ static void init_idisk_time(struct inode *inode)
 	fi->i_disk_time[2] = inode_get_mtime(inode);
 }
 
-static int do_read_inode(struct inode *inode)
+static int do_read_inode(struct inode *inode, bool from_handle)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -434,9 +434,17 @@ static int do_read_inode(struct inode *inode)
 	if (f2fs_check_nid_range(sbi, inode->i_ino))
 		return -EINVAL;
 
-	node_entry = f2fs_get_inode_cache(sbi, inode->i_ino);
+	if (from_handle)
+		node_entry = f2fs_get_node_cache(sbi, inode->i_ino,
+						 NODE_TYPE_REGULAR);
+	else
+		node_entry = f2fs_get_inode_cache(sbi, inode->i_ino);
 	if (IS_ERR(node_entry))
 		return PTR_ERR(node_entry);
+	if (from_handle && !IS_INODE(sbi, node_entry)) {
+		f2fs_put_cache(node_entry, true);
+		return -ESTALE;
+	}
 
 	ri = F2FS_INODE(node_entry);
 
@@ -574,7 +582,8 @@ static int do_read_inode(struct inode *inode)
 	return 0;
 }
 
-struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
+static struct inode *__f2fs_iget(struct super_block *sb, unsigned long ino,
+				 bool from_handle)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct inode *inode;
@@ -589,7 +598,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		return inode;
 	}
 
-	ret = do_read_inode(inode);
+	ret = do_read_inode(inode, from_handle);
 	if (ret)
 		goto bad_inode;
 
@@ -637,6 +646,16 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	return ERR_PTR(ret);
 }
 
+struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
+{
+	return __f2fs_iget(sb, ino, false);
+}
+
+struct inode *f2fs_iget_handle(struct super_block *sb, unsigned long ino)
+{
+	return __f2fs_iget(sb, ino, true);
+}
+
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 {
 	struct inode *inode;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 857cc2b29946..4d68737da65e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3902,11 +3902,10 @@ static struct inode *f2fs_nfs_get_inode(struct super_block *sb,
 		return ERR_PTR(-ESTALE);
 
 	/*
-	 * f2fs_iget isn't quite right if the inode is currently unallocated!
-	 * However f2fs_iget currently does appropriate checks to handle stale
-	 * inodes so everything is OK.
+	 * A deleted inode's nid can be reused for a non-inode node.  Treat such
+	 * reuse as a stale file handle instead of filesystem corruption.
 	 */
-	inode = f2fs_iget(sb, ino);
+	inode = f2fs_iget_handle(sb, ino);
 	if (IS_ERR(inode))
 		return ERR_CAST(inode);
 	if (unlikely(generation && inode->i_generation != generation)) {

base-commit: fd106ada4dee4b8adefec791ee9b9681b7b77501
-- 
2.20.1
