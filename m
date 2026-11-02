Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604958;
	b=fo8uOS2CT56LwFkNUZfoSEg/G3ihwxBfFdSsaLNIRExss2M+DJBL8DZdBnoScEG4fLO3
	 p5NBvdCmhL8JVAu2Q7uYfp3Szaztk4FK9s6iH0AeKGuicTI3db3ZPNdc0IKefrojsfDWu
	 2K/eWolw456xh5UwXsjltSV8teMyhWMjJYBoxVZg9FGgRuEFhUgof4SYPJ/l/NvAENrsu
	 QTM4l+gbn+3dxVTL37/kfPAvq1E3a4HUVZkfaKmUqEKcfkxWaBBanMAUllDY/cBa0k1Sf
	 kQju9dfW5+NDz4yIXYdt0+KPX5WjGRdWlLZ16k2zC7Wpb6N0jHpPuKUzmNmIZn9gOOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604958;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=zuzlNh+NVQD/jHPynvrmHkyLO/1cV7o+JJjIbIuUljI=;
	b=e2h8oXacj45lke+XBYs/yHQXN/RU2INOVV33F9pzGkrxrL2hbc9vG91FC6BcuOQo0OqL
	 xPLBqnzIkZYpFCmMvgNaHPBTPAWJXnRt/qBSjjIiTN8z0QvPgFnh55+VPFuNhMTTLXls8
	 ba+BmxXMc+00b4T80ZmVDE3SKK5UXLw0H31we/Y6hXTSdNuzR+uVJqTOeK1XeOoLuj4WS
	 09E14KgJEZ/RiWj+M1Unbih+Y++KI7vyqNjMKKtHtQfAfz5qPdY8ciEBLZhG83ZeJ+Bfl
	 Sif+yv3HbgnLIuaHZWJNX9yU8jGvPoEBweEuUpuk9TxHxAjXGwF8spVWEYy+feb1wOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jCmFAYUq;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22DB60A260C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22DB60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jCmFAYUq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zu
	zlNh+NVQD/jHPynvrmHkyLO/1cV7o+JJjIbIuUljI=; b=jCmFAYUqyK6xUrfrWu
	aBEfFCBoZ5bYklrYwVHEeNwfvfWVOn2i2VEcO7zLnv9T2UrCBA96TJx4A5XAyIqT
	cwmXkhS5MPJf75D9T9pkvsQhwKkmy+AZuhrRL4m3QjWWOCqcCGM0ap85aUa1bB2j
	H28KyaWKEv04jLCcf3G9m/9Gg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S5;
	Mon, 02 Nov 2026 15:35:37 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v5 03/31] ntfs: add filesystem metadata error reporting helpers
Date: Mon,  2 Nov 2026 15:35:04 +0800
Message-Id: <20261102073532.98873-4-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1fXw4Utw4xXF1UtrW7CFg_yoWrWFW7pF
	97Arn3Kw4DJFy2grs2kr42vw1SkF92gw4Utr1UXw1xZ3Wktw18tF4vyF1F9F1fKFWrX3yj
	qr1j93y7ur4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2xRhUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQk2H2roPUn5ywAA3p

From: Baolin Liu <liubaolin@kylinos.cn>

Add file and volume helpers to report metadata errors through the generic
deferred fsnotify infrastructure while retaining the volume error bit.
Pass the caller's errno unchanged.

Move ntfs_inode_base() to inode.h and use it to identify the base file for
attribute and extent inodes. Fall back to a volume report for I_FREEING
or I_WILL_FREE, when retaining the inode for deferred reporting is unsafe.
When SB_ACTIVE is clear, record only the volume error state.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/inode.c  |  7 -------
 fs/ntfs/inode.h  |  8 ++++++++
 fs/ntfs/super.c  | 29 +++++++++++++++++++++++++++++
 fs/ntfs/volume.h |  3 +++
 4 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 52e22022b4e7..c8560dd47d44 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3532,13 +3532,6 @@ void ntfs_destroy_ext_inode(struct ntfs_inode *ni)
 	kmem_cache_free(ntfs_inode_cache, ni);
 }
 
-static struct ntfs_inode *ntfs_inode_base(struct ntfs_inode *ni)
-{
-	if (ni->nr_extents == -1)
-		return ni->ext.base_ntfs_ino;
-	return ni;
-}
-
 static int ntfs_attr_position(__le32 type, struct ntfs_attr_search_ctx *ctx)
 {
 	int err;
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index a18cbcf1c631..8d176249aae1 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -298,6 +298,14 @@ static inline bool ntfs_inode_is_named_stream(struct ntfs_inode *ni)
 	return NInoAttr(ni) && ni->type == AT_DATA && ni->name_len;
 }
 
+/* Extent and attached attribute inodes refer to their base MFT inode. */
+static inline struct ntfs_inode *ntfs_inode_base(struct ntfs_inode *ni)
+{
+	if (ni->nr_extents == -1)
+		return ni->ext.base_ntfs_ino;
+	return ni;
+}
+
 /* Return the base MFT inode for an attribute inode, or @ni itself. */
 static inline struct ntfs_inode *ntfs_base_inode(struct ntfs_inode *ni)
 {
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 71f0aea46bf8..df09c277ee54 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -14,6 +14,7 @@
 #include <linux/sched/mm.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fserror.h>
 
 #include "sysctl.h"
 #include "logfile.h"
@@ -426,6 +427,34 @@ const struct option_t on_errors_arr[] = {
 	{ 0,			NULL }
 };
 
+/*
+ * Report confirmed metadata corruption as -EFSCORRUPTED, matching the errno
+ * returned to the caller. Preserve the errno of I/O and recovery failures
+ * so listeners can distinguish their causes.
+ */
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error)
+{
+	NVolSetErrors(vol);
+	if (vol->sb->s_flags & SB_ACTIVE)
+		fserror_report_metadata(vol->sb, error, GFP_ATOMIC);
+}
+
+void ntfs_report_file_metadata_error(struct inode *inode, int error)
+{
+	struct ntfs_inode *ni = NTFS_I(inode);
+
+	/* Attribute inodes share the file handle of their base inode. */
+	inode = VFS_I(ntfs_inode_base(ni));
+	/* Eviction cannot retain an inode reference for the deferred report. */
+	if (inode_state_read_once(inode) & (I_FREEING | I_WILL_FREE)) {
+		ntfs_report_metadata_error(NTFS_SB(inode->i_sb), error);
+		return;
+	}
+	NVolSetErrors(NTFS_SB(inode->i_sb));
+	if (inode->i_sb->s_flags & SB_ACTIVE)
+		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index ed5c0ccb9cd9..27f58beb4b2d 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -262,6 +262,9 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
 DEFINE_NVOL_BIT_OPS(MftBootstrap)
 DEFINE_NVOL_BIT_OPS(StreamsWindows)
 
+void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
+void ntfs_report_file_metadata_error(struct inode *inode, int error);
+
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
 	if (!NVolFreeClusterKnown(vol))

