Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424575;
	b=X65iWKgeo5KbxLYsTvcbxcnHfR4mn3XFE0z1FxmQGodVSh0UGt2K3wdsArRrtiXmv5Ix
	 wXBBCe85wh6A7QjduYss2irsTzjH4tx1CAiEno/H/rq7u06Ok6FnI6htW756eaMOy9AwR
	 aObsc4x4aYZ1wd6Me8zvoouSh03poSToFlhGRMdQULGFETEOYuYUIKbbFoabzip+/nQom
	 6r+mXi5zyOXHNRwZ0WqCoVk+V1L67nf7DPalxU/UvK8pUq/9KvU0CHWv0+owEkmt6r1p2
	 /1UwBQ8ZPTeTtLEcNcqxii5ryjvp1JUq9HAdwN0XnTau8bKrMFnP6CeuD7uS74pP/Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424575;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=PoEJOz6BO3EABg6aGcSf6huZBWcr0145a9Y7my193cA=;
	b=VVdaaRNuuPRsZ/bQlw9K08ir1ZndXhkpVZuB2Z+8qw7irMkaxgUOpzNBl6bFxkUTPC+K
	 jnbP17UdiYw+qozPBE4hEtwVJyQmpolBDsLb7tReytQg8Bg/ZZnkDGXCBo63+fXIaeJz7
	 OKXH11hcQy4yU2IfUiL4XaTdzwIPjFw1VdTR/ogJvq3CGovkFYX50dNGTniI2lPg0GYd2
	 07MUMgWkMsZe23hJyi3ClR1S/EKEAVp4CSY37Hmw1kn9nmP/PGg5YS1Tg4x1C1pXoBLQx
	 v1ZEv98aVsFS9bc97Lcn9QrxD/iJtKtacFu7pfnwK4NKdbJbO/jKtLVHHr08rANSGeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="o/hSwahP";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46E606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A46E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=o/hSwahP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Po
	EJOz6BO3EABg6aGcSf6huZBWcr0145a9Y7my193cA=; b=o/hSwahPWdzxf1Tc4Y
	JNq+LrWv9DwXJJtZHNiQLivtJAb88/8QgZLcFboo7SB3C8nTWhLYJ40MjrEuw5yv
	MXLehcmA6lVwfC/1EIXri++r4n4EnDd3lmlSnSnJDFjEWoY9IUwTyUFTXjB9RRY0
	E7vwp23hHoCMfBt0QQqQGyWx0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S4;
	Sat, 31 Oct 2026 13:29:05 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v2 2/5] ntfs: preserve timestamps when creating hard links
Date: Sat, 31 Oct 2026 13:28:54 +0800
Message-ID: <20261031052857.1542936-3-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr48uF43Xr17XFW7Ar48Crg_yoWrCFW3pF
	W3Kw1DKr4xXrW7Wrn2yF4DZFySga4I9FW7JFWUKw13Aan0qw18tF1Iqry7ZF1rtrZ5Wr1j
	qa1Fgr1UWw1UG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyxRhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gFbJmrlfKFp4QAA3M

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_link() resets atime, mtime and ctime on both the source file and
the destination directory after creating a hard link. This overwrites
the source file's atime and mtime and the directory's atime.

Update only the source ctime and the destination directory mtime/ctime.
Use the same timestamp for the new FILE_NAME attribute, its directory
index entry and the source inode, so the new name does not retain the
old ctime. Set the inode's ctime only after the link succeeds and mark
both inodes dirty to queue their timestamps for writeback.

Keep the rename caller's existing timestamp behavior unchanged.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested the standalone five-patch series in QEMU. The requested unchanged
xfstests generic/004 and generic/389 passed. Hard-link tests checked that
prepared atime/mtime remained unchanged and source ctime advanced.
Offline checks compared STANDARD_INFORMATION, the new FILE_NAME and
the directory index ctime.

Changes in v2:
- Use the same new ctime for the inode, FILE_NAME and directory index,
  as requested in review.
- Update inode ctime only after the link succeeds.

 fs/ntfs/namei.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 14eaf7204ead..a83a648c8ff8 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1244,6 +1244,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentry *dentry)
  * @dir_ni:	ntfs inode for directory in which new link should be placed
  * @name:	unicode name of the new link
  * @name_len:	length of the name in unicode characters
+ * @ctime:	metadata change time for the new FILE_NAME
  *
  * Create a new hard link. This involves adding an entry to the directory
  * index and adding a new FILE_NAME attribute to the target inode.
@@ -1251,7 +1252,7 @@ static int ntfs_rmdir(struct inode *dir, struct dentry *dentry)
  * Return 0 on success and -errno on error.
  */
 static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
-		__le16 *name, u8 name_len)
+		__le16 *name, u8 name_len, struct timespec64 ctime)
 {
 	struct super_block *sb;
 	struct inode *vi = VFS_I(ni);
@@ -1313,7 +1314,7 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	fn->creation_time = utc2ntfs(ni->i_crtime);
 	fn->last_data_change_time = utc2ntfs(inode_get_mtime(vi));
-	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
+	fn->last_mft_change_time = utc2ntfs(ctime);
 	fn->last_access_time = utc2ntfs(inode_get_atime(vi));
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
@@ -1464,7 +1465,8 @@ static int ntfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 			goto err_out;
 	}
 
-	err = __ntfs_link(old_ni, new_dir_ni, uname_new, new_name_len);
+	err = __ntfs_link(old_ni, new_dir_ni, uname_new, new_name_len,
+			  inode_get_ctime(old_inode));
 	if (err)
 		goto err_out;
 
@@ -1630,6 +1632,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	int uname_len;
 	int err;
 	struct ntfs_inode *ni = NTFS_I(vi), *dir_ni = NTFS_I(dir);
+	struct timespec64 ctime;
 
 	if (NVolShutdown(vol))
 		return -EIO;
@@ -1654,7 +1657,8 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	ihold(vi);
 	mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
 	mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
-	err = __ntfs_link(NTFS_I(vi), NTFS_I(dir), uname, uname_len);
+	ctime = current_time(vi);
+	err = __ntfs_link(ni, dir_ni, uname, uname_len, ctime);
 	if (err) {
 		mutex_unlock(&dir_ni->mrec_lock);
 		mutex_unlock(&ni->mrec_lock);
@@ -1664,12 +1668,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	}
 
 	inode_inc_iversion(dir);
-	simple_inode_init_ts(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
+	mark_inode_dirty(dir);
 
 	inode_inc_iversion(vi);
-	simple_inode_init_ts(vi);
+	inode_set_ctime_to_ts(vi, ctime);
+	mark_inode_dirty(vi);
 
-	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 	d_instantiate(dentry, vi);
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);

