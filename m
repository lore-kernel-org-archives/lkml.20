Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AA415F35
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143418; cv=none; b=pO1A+veReTG+n8CanRFtBfJq9BZyilqKU7h6CHIKNSl55nC910toxTiqizqlZTOVqCyKTNUj1B3UWaOUBzN0QN6xPGPhMwqAR0hkVlOmFNv9+zyrNELsASBCy+EXHNTSbF5L5+AaIc9uSQC6amj6yeqPQnmtd/7OS3dQ1E+5+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143418; c=relaxed/simple;
	bh=4Bxu09lDN3sGYhPbkWjN2XGPea3D6GgYqM6hQhRqWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kjtr7vyg5r49iS2twZeKRNIx+y4709hZoPJ+h/ohvRB59bMnYJXHOApzf/vr81WivMRbU/FJhIxHUR96E5yNX6RNhH0Q0bXU8b5Q86NtS4eQP0wW6IxikUSnXygOP7FAlUtHQam8XRYsrQ3KeIYDeEAwd8Sf708YAa7LEv1LQtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LsCz8QFC; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LsCz8QFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5H
	pexEt4aloWm+EqmZ+/bxGP1VV1dZYIoQw3Ij9JXjc=; b=LsCz8QFCI6SGBJdQve
	C/FWbmr9GxWUCY1TQwqErywH2rKJbluEplha0V36xpcl8GxymbKMFtrf8glPciw7
	tlrWgG7N0hA+7PHCl/hpkqdpNKzxDy/PbWC8BbdwG8d/KoPz3jiyVhzaQ2h0RMIC
	BuV+2q5gaimYKUqDe1vD11MVo=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S6;
	Wed, 23 Sep 2026 14:02:59 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 04/10] ntfs: preserve EA attribute lookup errors
Date: Wed, 23 Sep 2026 14:02:40 +0800
Message-ID: <20260923060246.2499192-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260923060246.2499192-1-liubaolin12138@163.com>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryxurWxtr4UXr13Aw4fXwb_yoW5KrW7pF
	yfGry3twsxX3ZxKFn7tr1DX3WYvas7GryUKr9rK3Z2kr1rt34Dtw15KF9Y9FyFyrWrA340
	gF4UKay7Cr47Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjBTOUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwROGUWqza5O9NgAA3v

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_attr_exist() treats lookup failures as absence. Using it while
updating EAs can select creation or removal paths after an allocation or
I/O failure.

Use an EA-local lookup helper that preserves errors from mapping the MFT
record, allocating the search context and looking up the attribute.
Check both EA attributes before modifying either and return EUCLEAN if
only one exists. Keep the known presence state for the final update.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/ea.c | 51 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 98ca9e4f8d25..6f7273f754ae 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -181,6 +181,29 @@ static inline int ea_packed_size(const struct ea_attr *p_ea)
 	return 5 + p_ea->ea_name_length + le16_to_cpu(p_ea->ea_value_length);
 }
 
+/* Unlike ntfs_attr_exist(), preserve lookup errors. */
+static int ntfs_ea_attr_lookup(struct ntfs_inode *ni, __le32 type)
+{
+	struct ntfs_attr_search_ctx *ctx;
+	struct mft_record *mrec;
+	int err;
+
+	mrec = map_mft_record(ni);
+	if (IS_ERR(mrec))
+		return PTR_ERR(mrec);
+	ctx = ntfs_attr_get_search_ctx(ni, mrec);
+	if (!ctx) {
+		err = -ENOMEM;
+		goto out;
+	}
+	err = ntfs_attr_lookup(type, AT_UNNAMED, 0, CASE_SENSITIVE,
+			       0, NULL, 0, ctx);
+	ntfs_attr_put_search_ctx(ctx);
+out:
+	unmap_mft_record(ni);
+	return err;
+}
+
 /*
  * Set a new EA, and set EA_INFORMATION accordingly
  *
@@ -198,7 +221,8 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 {
 	struct ntfs_inode *ni = NTFS_I(inode);
 	struct ea_information *p_ea_info = NULL;
-	int ea_packed, err = 0;
+	int ea_packed, err = 0, ea_err;
+	bool has_ea;
 	struct ea_attr *p_ea;
 	u32 ea_info_qsize = 0;
 	char *ea_buf = NULL;
@@ -211,7 +235,16 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	if (name_len > 255)
 		return -ENAMETOOLONG;
 
-	if (ntfs_attr_exist(ni, AT_EA_INFORMATION, AT_UNNAMED, 0)) {
+	err = ntfs_ea_attr_lookup(ni, AT_EA_INFORMATION);
+	if (err && err != -ENOENT)
+		return err;
+	ea_err = ntfs_ea_attr_lookup(ni, AT_EA);
+	if (ea_err && ea_err != -ENOENT)
+		return ea_err;
+	if (!err != !ea_err)
+		return -EUCLEAN;
+	has_ea = !err;
+	if (has_ea) {
 		p_ea_info = ntfs_attr_readall(ni, AT_EA_INFORMATION, NULL, 0,
 						&ea_info_size);
 		if (IS_ERR(p_ea_info)) {
@@ -230,15 +263,9 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 			ea_buf = NULL;
 			goto out;
 		}
-		if (!ea_buf) {
-			ea_info_qsize = 0;
-			kvfree(p_ea_info);
-			goto create_ea_info;
-		}
 
 		ea_info_qsize = le32_to_cpu(p_ea_info->ea_query_length);
 	} else {
-create_ea_info:
 		p_ea_info = kzalloc_obj(struct ea_information, GFP_NOFS);
 		if (!p_ea_info)
 			return -ENOMEM;
@@ -249,12 +276,6 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 		if (err)
 			goto out;
 
-		if (ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0)) {
-			err = ntfs_attr_remove(ni, AT_EA, AT_UNNAMED, 0);
-			if (err)
-				goto out;
-		}
-
 		goto alloc_new_ea;
 	}
 
@@ -404,7 +425,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 	/*
 	 * no EA or EA_INFORMATION : add them
 	 */
-	if (!ntfs_attr_exist(ni, AT_EA, AT_UNNAMED, 0)) {
+	if (!has_ea) {
 		err = ntfs_attr_add(ni, AT_EA, AT_UNNAMED, 0, ea_buf,
 				ea_info_qsize + new_ea_size);
 		if (err)
-- 
2.51.0

