Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F714F3EAF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892675; cv=none; b=YnK4DhpCgmfePyUnKro/h6Lg5HGSUv9CuGCr2R21Ex6F9q5u8FI1yOfF+AeGqnXYyBb7UUO4R6JaVfLNWWFdW7gs0Mzv6KT5ji4CBAL4VR2BqEIpCgHr0RklzfWpZmBTqKkKp1+3MCZtEejrb535xstQC80jX2Gq6iyzdANvCic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892675; c=relaxed/simple;
	bh=dZdvV8RXE1EKrJBwnQz6CAu5FHvHV/lNN8HjFFpI/kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyhTun9pcHl7RRfKQjwqsxbnQmqIgtOHsJFuzO8jTpI/NdPzVuQFgcsPQssq3ryb1jHPbwSJUndMviIqYEkFsqA5lProuQ6X4fkF6sOcuHRuuH1S4IZrHQSdaIVphuDeMxC/yQqxQUVgU+qZCFL/QH2sy89AUUA+njfaXsiSGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcKzws8x; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcKzws8x"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so1170042a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892673; x=1792497473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBYDeDJPiU7Woi24r+XJ0DdmQKbYBi2/3x/Ae90790s=;
        b=gcKzws8xeDoz7xl2e5bMK6LdUOvaZHJmr87V3ERLB2+nqNm0S2rBORakLXXDHCDNHO
         xL5VocGoxFCeHKxL4S5KjiSBgPCiiLnPxuJRKSFp+cEQf6SMgVqZ72L4ZHaRg1Imk6+9
         vhE9+yUrqmGzVt5oH7C163n3QDJZUJk6WoYi7xWhMnryLO/mskTk/bFvK5A/J7QQAHKU
         yccFusQvMVPsGotA2vZgnIS5hzEBiXrHTSxkHhVx119L19YK6MFsGhDiK/45414ZifVF
         o4aWRNr+wLmbTpYGipR6nP6czq5OAKaHzZdvrrzWY8Yknuu9nGw3aQxKSRvgGoRNUHyX
         N1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892673; x=1792497473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBYDeDJPiU7Woi24r+XJ0DdmQKbYBi2/3x/Ae90790s=;
        b=gDcxy8GyOWh6J8Wf3xux49RHNj5x9MOTdfFTaZV6cruyh+la84DVyDbZQRUjaKCiYE
         HIZXDVWKkl+cGnyOPcxJpfSMzors9bFJNP4JThNf+jayq0k/KE6QgzClHmVvvk02xwCz
         aXyZmP1bo2kI6QgOaa4RXop0XkEU99sR79+ORjha6NI5UhxL++BAWmq09oBjWRetkZBb
         +f0cOws/crZruccm9aTtMwVNtquda7KaThe17IHal1JubCCFL4yydp8ZMMTn4XghToeM
         K7ti5rMk1j+W+hC6rDOIHyzHSX6uW8+G2/xS7r8XpJiMCUR1NvF98X7au4sSwIGjyp/R
         IOMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYpTTWn/foADPmhOzlFQ932iOJNs+Yp97TGYaTOU3bXzHjadjRXQQXYBy8lEs9vQMYrkkmvPYAoh2srxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgR3RU6wnao+T2cQMT8FI167yk8dreOcfj8cUiNRiiExYQdEKJ
	qKH3myCkdDkEMEmLVHOMISrOxIXsjelEwNLzmteL8aeHXSDi+e8ixP8H
X-Gm-Gg: AYBFou37BF6C8PRavg1+9LV2KglRUAgs5jIuiY811dZzzGEEzEDI3QtArNllxGFxBDn
	JMJwZ+3zkltkoncSBjugsJVhMlXuHCe3vOx1mK86PigThUs3DkSvYJxvTrDlf2Qd2TPkFRgToL9
	a0FMOJCsLnQhbW88xDmS1HNlkKQ24+Qjo07NnjtNK8CE7vMfInftKrOpbfvdpuX1To5+xeHttKY
	c3iDMfDV6UuaJ0TWJDQvRLABQmug5GiyOQQh1T/vkFIP5CY7yWp3eXjPLdMxh6+2yv/sslU/RGL
	FVI+hA/4r0JjlHFlBlZiEl8jlb9Y7uvVwuE0Ku097imu5HcEZl8lSJ8ChCZzguseKJxZtWIb0TQ
	2Xw3GFMtdszaDAxg1WEeqco5x887mGWnKtIYcfNIAW/B0HX680ArJwcXhUKOvEIQsuM0Gu84D1U
	irNoavwjVFbPUtrltMv0V3/FkuSp12NA8OsYW55FkdouJobV2HbTc7Ias71JgIoL9Gk0WMbm4Ez
	JW4IB3xLSLBLGO4y2VRolVoOMiml4PncPqgDg==
X-Received: by 2002:a17:90b:5807:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ab3a9dfda0mr9413758a91.40.1791892672923;
        Tue, 13 Oct 2026 04:57:52 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:52 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v4 17/18] f2fs: allow large folio support to writeable files
Date: Tue, 13 Oct 2026 19:56:20 +0800
Message-ID: <20261013115621.968742-18-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Now we make all write path support large folios,
so we open permission to let writeable file set
large folio mapping.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   | 17 +++++++++++++++++
 fs/f2fs/file.c   | 16 ----------------
 fs/f2fs/inline.c |  6 ++++++
 fs/f2fs/inode.c  |  4 +---
 fs/f2fs/namei.c  |  1 +
 6 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 48376cbcc..0e139b4ca 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3243,7 +3243,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode)) {
 		if (folio)
 			folio_unlock(folio);
 		return -EOPNOTSUPP;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a925d1a59..3a9b247cf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5326,6 +5326,23 @@ static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
 	return false;
 }
 
+static inline void f2fs_mapping_set_large_folio(struct inode *inode)
+{
+	if (!S_ISREG(inode->i_mode) ||
+	    f2fs_compressed_file(inode) ||
+	    f2fs_quota_file(F2FS_I_SB(inode), inode->i_ino))
+		return;
+
+	/*
+	 * Keep the folio order range at 0 as a transitional step; large
+	 * folios will be enabled once the whole write path is audited.
+	 */
+	if (IS_IMMUTABLE(inode))
+		mapping_set_folio_min_order(inode->i_mapping, 0);
+	else
+		mapping_set_folio_order_range(inode->i_mapping, 0, 0);
+}
+
 static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 {
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3c90cd365..9cee36258 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -164,17 +164,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	int err = 0;
 	vm_fault_t ret;
 
-	/*
-	 * We only support large folio on the read case.
-	 * Don't make any dirty pages.
-	 */
-	if (unlikely(IS_IMMUTABLE(inode)) ||
-	    mapping_large_folio_support(inode->i_mapping)) {
-		f2fs_err(sbi, "Not expected: immutable: %d large_folio: %d",
-				IS_IMMUTABLE(inode),
-				mapping_large_folio_support(inode->i_mapping));
-		return VM_FAULT_SIGBUS;
-	}
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		err = -EIO;
@@ -729,9 +718,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (mapping_large_folio_support(inode->i_mapping) &&
-	    filp->f_mode & FMODE_WRITE)
-		return -EOPNOTSUPP;
 
 	err = fsverity_file_open(inode, filp);
 	if (err)
@@ -1204,8 +1190,6 @@ int f2fs_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
-		if (mapping_large_folio_support(inode->i_mapping))
-			return -EOPNOTSUPP;
 		if (IS_DEVICE_ALIASING(inode))
 			return -EPERM;
 		if (!f2fs_is_compress_backend_ready(inode))
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 49905aa08..0dca6c3d5 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -239,6 +239,12 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
+	/*
+	 * Inline data is only supported in an order-0 index #0 folio; the
+	 * inline write and mmap fault paths never request a larger order.
+	 */
+	f2fs_bug_on(sbi, folio_test_large(folio));
+
 	f2fs_lock_op(sbi, &lc);
 
 	ientry = f2fs_get_inode_cache(sbi, inode->i_ino);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9164a2b5d..f5a4dac98 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -599,9 +599,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_op = &f2fs_file_inode_operations;
 		inode->i_fop = &f2fs_file_operations;
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
-		if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &&
-		    !f2fs_quota_file(sbi, inode->i_ino))
-			mapping_set_folio_min_order(inode->i_mapping, 0);
+		f2fs_mapping_set_large_folio(inode);
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = &f2fs_dir_inode_operations;
 		inode->i_fop = &f2fs_dir_operations;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index ce5d536d8..c0f2e6777 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -341,6 +341,7 @@ static struct inode *f2fs_new_inode(const struct mnt_idmap *idmap,
 	f2fs_set_inode_flags(inode);
 
 	f2fs_init_extent_tree(inode);
+	f2fs_mapping_set_large_folio(inode);
 
 	trace_f2fs_new_inode(inode, 0);
 	return inode;
-- 
2.43.0

