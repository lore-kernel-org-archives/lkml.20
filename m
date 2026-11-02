Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605149;
	b=l5OmfWRk0OOAr0aI1b04o0PookXvhDLuh3h2NIh1EDf79K750WZkPZKv1Q8Sqv419pRF
	 WhD8SlfDPgzFJGWUt6ZMD07KCtbkLa9empnJb/wDF21N/zxbKevkreJHS8D/ZSzQREjng
	 vYV484yjy7zU1QWkXQ9W8xSm3C4iX60TiaAc0LuBrJBnAQg+2XWiHDeOAAYlz1vVwRt70
	 LxwHuZEDexzwOEdUQMONBhWjHaBJIrCROPLCbeVwUGq3naJnHgiyFc1+SrF/SpV1Lc9EN
	 TLukX4iLVN/BvdtTVt+2nUiSCqAGugIw3RfGqvz7e+lWUk+EhwdPKVlJGk3h/P1EsYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605149;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=bqg6K2lpbXQdiQniD/zWD0T6n9rq5SsMV1RNbuW4SEk=;
	b=5PHrbJPwo61jLt8C+cNUsJejJbT388WlSZruH9Fw4mL4CrukzR8kIdMG3+tjJbpqPFD+
	 tHPryp6AJhGpAyAHMPVQa7SeIK9ljvs7pQCgEhcm+wXqijisjq5mqJizRm+c3JmjhCYkx
	 PEcx9rmoFzliR7j4XuUDhlxNG7MgSc0kzTLzriwzMhGAw6OvEZMgYTydGC19eLPloA9BN
	 NEgbHRq2BLTTYvKkK0z5tZfFk9OFyMqC1Dvkwi3R2dc5EBtoBgp0o88P+AZg2fBob2ESj
	 sq7aHs+PfGS/owsJP/UyzI/B86E6psDLSd5ihsVecws55ad47NFYK4OWdn4hgPXerug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oLvp2bEG;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C02606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C02606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oLvp2bEG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bq
	g6K2lpbXQdiQniD/zWD0T6n9rq5SsMV1RNbuW4SEk=; b=oLvp2bEGXNRHJ+09OO
	XZ+woJBr+Sko4NZFs8cyouqCWIdl3ZASkYLVNZ/8TpeNNSz5MJVmmS8wBMC7Slsy
	jAm0O1DJaGZ5mJ+BL12s8jVs4F0vsrvDaWMpE3WkvOJWu1B4+3lqwR892zoK0IQI
	G79Yw7x8h5Q6K6sUY5pwrbhyk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3nygJPuhqucJHEg--.56690S2;
	Mon, 02 Nov 2026 15:38:49 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 24/31] ntfs: serialize and report export parent reconstruction errors
Date: Mon,  2 Nov 2026 15:35:25 +0800
Message-Id: <20261102073532.98873-25-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3nygJPuhqucJHEg--.56690S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4DCw15XF1DAF18Wr1UAwb_yoWrCF4xpF
	y3J3sxtrZ5JFW3urn3tF4UZ34Sk34fGFWUWrn3K3WSyw4qqrnF9F13tFyjvr1rtrWrJ3s0
	qw4jga43C3yUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UfPEhUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8ApmT2roPgrqWQAA3W

From: Xuewen Wang <wangxuewen@kylinos.cn>

Exportfs calls ntfs_get_parent() without the child inode lock. Hold the
child's mrec_lock across FILE_NAME lookup and parent loading to stabilize
corruption checks against rename and rmdir.

Report an unused parent as EFSCORRUPTED only for a linked, non-deleting
child. Report missing required or malformed FILE_NAME attributes, while
continuing past malformed candidates as before. Release the lock before
d_obtain_alias().

Preserve ordinary stale-handle behavior. NTFS returns EFSCORRUPTED for a
confirmed corrupt parent reference; generic open_by_handle_at() decoding
still converts that error to ESTALE.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/namei.c | 47 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 090eb33bf362..53edbd424b3a 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1730,14 +1730,17 @@ const struct inode_operations ntfs_dir_inode_ops = {
  * fs/exportfs/expfs.c::find_exported_dentry() which in turn is called from the
  * default ->decode_fh() which is export_decode_fh() in the same file.
  *
- * Note: ntfs_get_parent() is called with @d_inode(child_dent)->i_mutex down.
+ * Serialize the file name lookup and parent load against rename and rmdir
+ * with the child's mrec_lock; exportfs does not hold the child's inode lock.
  *
  * Return the dentry of the parent directory on success or the error code on
  * error (IS_ERR() is true).
  */
 static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 {
+	int report_err = 0;
 	struct inode *vi = d_inode(child_dent);
+	struct inode *parent;
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct mft_record *mrec;
 	struct ntfs_attr_search_ctx *ctx;
@@ -1747,15 +1750,20 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	int err;
 
 	ntfs_debug("Entering for inode 0x%llx.", ni->mft_no);
+	mutex_lock(&ni->mrec_lock);
 	/* Get the mft record of the inode belonging to the child dentry. */
 	mrec = map_mft_record(ni);
-	if (IS_ERR(mrec))
-		return ERR_CAST(mrec);
+	if (IS_ERR(mrec)) {
+		err = PTR_ERR(mrec);
+		goto unlock_err;
+	}
 	/* Find the first file name attribute in the mft record. */
 	ctx = ntfs_attr_get_search_ctx(ni, mrec);
 	if (IS_ERR(ctx)) {
 		unmap_mft_record(ni);
-		return ERR_PTR(PTR_ERR(ctx));
+		err = PTR_ERR(ctx);
+		ctx = NULL;
+		goto unlock_err;
 	}
 try_next:
 	err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, CASE_SENSITIVE, 0, NULL,
@@ -1763,27 +1771,48 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	if (unlikely(err)) {
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(ni);
-		if (err == -ENOENT)
+		if (err == -ENOENT && vi->i_nlink) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
 			ntfs_error(vi->i_sb,
 				   "Inode 0x%llx does not have a file name attribute.  Run chkdsk.",
 				   ni->mft_no);
-		return ERR_PTR(err);
+		}
+		goto unlock_err;
 	}
 	attr = ctx->attr;
-	if (unlikely(attr->non_resident))
+	if (unlikely(attr->non_resident)) {
+		report_err = -EFSCORRUPTED;
 		goto try_next;
+	}
 	fn = (struct file_name_attr *)((u8 *)attr +
 			le16_to_cpu(attr->data.resident.value_offset));
 	if (unlikely((u8 *)fn + le32_to_cpu(attr->data.resident.value_length) >
-	    (u8 *)attr + le32_to_cpu(attr->length)))
+	    (u8 *)attr + le32_to_cpu(attr->length))) {
+		report_err = -EFSCORRUPTED;
 		goto try_next;
+	}
 	/* Get the inode number of the parent directory. */
 	parent_ino = MREF_LE(fn->parent_directory);
 	/* Release the search context and the mft record of the child. */
 	ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(ni);
 
-	return d_obtain_alias(ntfs_iget(vi->i_sb, parent_ino));
+	parent = ntfs_iget(vi->i_sb, parent_ino);
+	if (IS_ERR(parent) && PTR_ERR(parent) == -ENOENT &&
+	    vi->i_nlink && !NInoBeingDeleted(ni)) {
+		report_err = -EFSCORRUPTED;
+		parent = ERR_PTR(-EFSCORRUPTED);
+	}
+	goto out;
+
+unlock_err:
+	parent = ERR_PTR(err);
+out:
+	if (report_err)
+		ntfs_report_file_metadata_error(vi, report_err);
+	mutex_unlock(&ni->mrec_lock);
+	return d_obtain_alias(parent);
 }
 
 static struct inode *ntfs_nfs_get_inode(struct super_block *sb,

