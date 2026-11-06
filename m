Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946726;
	b=2UVpnh/2IHqZ0eRjv/dmr/B0+xA/yT6nQ4WeCLtnYUlm3Uejam9EoKrRQ9E1JSidCazO
	 rEJPWo+H1rw5QK2lewckRG/pl0itGPTSmiM7jTkU44ssvWBhbk/ytrQTQlRa7SW69swRe
	 Fnw4mXEIUN38pqJHKqMsfF0AmyCtgwM+tNl/xOQvU5UXZ+5fr/KfVnzhHWDX7NzPB/8dO
	 kmR5eLGjDDPKccsX3tdDyfsOFHUPDIrA4aQTmF1Cbdv0OhG5sY7jMk2ctwdIBgyROwofd
	 kTFkDxVlVby4rifXi0Fg45LByeixduKAgJjOkDBt3yu+bPg2OAXggWZ8ilI9oklhOHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946726;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=Fb+q51bOA1/agFgSpH19AS5xfMfZU+6VgliKRFUf71g=;
	b=b9S4gq2zz7+3gntijV/q0RElK997ST+hJKBOsMN81/We/uMFJw8dCtE0Fnl7goky2SdO
	 rupxviXqXyA4pmk7D/b3ZSqSv/s3PQ3S81cfoPBwloAc82X0jowyrxoEg8PlYVRh4XwNc
	 +t9WO4Xl4z7UPKB154Vf0o58fKShznb6/aaDAu7C97gu1GM6qvW7v2ge3VFRON+MGhlXG
	 ZmTd9uMPKL/b1oAzGokwd7QAURUSOlCK5vYHFK3ALlPUitATIflI7exd4/oPvg3RYZHXk
	 ayA0QHC+XqRBHB2YOpVwWVuxCjuyupVeaIng4dPnpWzi+Z0BZE745vKh1zsn28uovVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="AH/rq1d1";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F0C606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F0C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AH/rq1d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fb
	+q51bOA1/agFgSpH19AS5xfMfZU+6VgliKRFUf71g=; b=AH/rq1d1ZDZSZmVN+C
	DtFmirkfbEbq9UB4F9WlK7TYI/ky5e1xfZ4AzJ+vSL8pG6klP99olfw1PnnA8+3T
	adn6Klg6liWsXr7YTmyN15M+KZe5CT5zLexv63kHb7nIktV8sZtzlR2HWRXqphZN
	cC4NfAeRZLq66+vWUL3w9f1GU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3lzdFdO1qwIxJFg--.3403S3;
	Fri, 06 Nov 2026 14:31:36 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 1/5] ntfs: initialize inherited ACLs after allocating the MFT record
Date: Fri,  6 Nov 2026 14:30:55 +0800
Message-ID: <20261106063059.2904988-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106063059.2904988-1-liubaolin12138@163.com>
References: <20261106063059.2904988-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3lzdFdO1qwIxJFg--.3403S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr1xZFyruFyfJw1UKr4kJFb_yoW7Xr4rpF
	Z3WrW7JrsxXr1Sg3Z3tw45uw13t3ykurWUWr47J3WfA3WFgw1Sga4xKryjkF93trZ5G3sr
	XF4UK3y7JrZ8u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j718kUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6ghFEGrtdEj2TwAA31

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_init_acl() can write EAs, but __ntfs_create() calls it before
allocating the new inode's MFT record. An inherited access ACL can appear
correct in the inode cache and disappear after eviction.

Initialize the ACL after allocating the MFT record and adding the standard
attributes. Release the parent and child record locks around the ACL
helpers to avoid recursive locking, then refresh the local mode from the
inode. On creation failure, remove any EA and EA_INFORMATION attributes
before freeing the MFT record.

Initialize the new FILE_NAME ctime from the inode after ACL setup, since
writing the inherited ACL may advance the inode ctime. This also keeps
the directory index copy consistent with STANDARD_INFORMATION.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Tested in QEMU with four CPUs, NTFS debug and lockdep enabled. Ordinary
files inherited access ACLs; published temporary-file ACLs survived
cache eviction, remount and reboot. Tests used cached default ACLs;
the pre-existing cold-cache ACL defect is left to the follow-up series.

 fs/ntfs/namei.c | 49 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index b46fe44b63b5..14eaf7204ead 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -422,6 +422,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	struct ntfs_volume *vol = dir_ni->vol;
 	struct ntfs_inode *ni;
 	bool rollback_data = false, rollback_sd = false, rollback_reparse = false;
+	bool rollback_ea = false;
 	struct file_name_attr *fn = NULL;
 	struct standard_information *si = NULL;
 	int err = 0, fn_len, si_len;
@@ -429,6 +430,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	struct mft_record *ni_mrec, *dni_mrec;
 	struct super_block *sb = dir_ni->vol->sb;
 	struct inode *rollback_data_vi = NULL, *rollback_sd_vi = NULL;
+	struct inode *rollback_ea_vi = NULL, *rollback_eai_vi = NULL;
 	__le64 parent_mft_ref;
 	u64 child_mft_ref;
 	__le16 ea_size;
@@ -469,19 +471,6 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 
 	mode = vi->i_mode;
 
-#ifdef CONFIG_NTFS_FS_POSIX_ACL
-	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
-		err = ntfs_init_acl(idmap, vi, dir);
-		if (err) {
-			iput(vi);
-			return ERR_PTR(err);
-		}
-	} else
-#endif
-	{
-		vi->i_flags |= S_NOSEC;
-	}
-
 	if (uid_valid(vol->uid))
 		vi->i_uid = vol->uid;
 
@@ -646,6 +635,24 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 			goto err_out;
 	}
 
+	/* ACL EAs need the allocated MFT record and initialized attributes. */
+	rollback_ea = true;
+#ifdef CONFIG_NTFS_FS_POSIX_ACL
+	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
+		/* The ACL helpers acquire both the parent's and child's locks. */
+		mutex_unlock(&dir_ni->mrec_lock);
+		mutex_unlock(&ni->mrec_lock);
+		err = ntfs_init_acl(idmap, vi, dir);
+		mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
+		mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
+		if (err)
+			goto err_out;
+		mode = vi->i_mode;
+	}
+#endif
+	if (S_ISLNK(mode) || !(sb->s_flags & SB_POSIXACL))
+		vi->i_flags |= S_NOSEC;
+
 	err = ntfs_ea_set_wsl_inode(vi, dev, &ea_size,
 			NTFS_EA_UID | NTFS_EA_GID | NTFS_EA_MODE);
 	if (err)
@@ -679,7 +686,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	if (NVolHideDotFiles(vol) && name_len > 0 && name[0] == cpu_to_le16('.'))
 		fn->file_attributes |= FILE_ATTR_HIDDEN;
 	fn->creation_time = fn->last_data_change_time = utc2ntfs(ni->i_crtime);
-	fn->last_mft_change_time = fn->last_access_time = fn->creation_time;
+	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
+	fn->last_access_time = fn->creation_time;
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
 	/* Add FILE_NAME attribute to inode. */
@@ -720,6 +728,15 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	return ni;
 
 err_out:
+	if (rollback_ea) {
+		if (ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0) &&
+		    ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0, &rollback_ea_vi))
+			ntfs_error(sb, "Failed to roll back EA attribute.");
+		if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0) &&
+		    ntfs_attr_remove(ni, AT_EA_INFORMATION, AT_UNNAMED, 0,
+				     &rollback_eai_vi))
+			ntfs_error(sb, "Failed to roll back EA_INFORMATION attribute.");
+	}
 	if (rollback_sd) {
 		int rollback_err;
 
@@ -766,6 +783,10 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	if (rollback_ea_vi)
+		iput(rollback_ea_vi);
+	if (rollback_eai_vi)
+		iput(rollback_eai_vi);
 	if (rollback_data_vi)
 		iput(rollback_data_vi);
 	if (rollback_sd_vi)

