Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854620;
	b=gk+OIQ4SuECdO82ipCSNl+gfNZnl02Q1Q3UyoDlXE7lTN0VYGuEOxKDIS2aZZPdXcVQ/
	 TPDYgoWAgOweOpuAs2qCztHkQcBg6QyL3Ah15aei/kNcW36+83rIa4qtYCSDosjb6rbDk
	 DbYvjjHHQnAphoK0nd7OlwJz0ahYU1IgnUh+nVTBhTJYrmXzJcgJ+jZYvVQp/zWGNTIyp
	 16RkI8yDuf0MOnDUkvAwbnrj6wajm3qr28GlktnrYkm8u+G31W2WMm5JdXoLKFtI/50Zt
	 BCB2RAG7peSmU1oBgMxJnjWkphdr/CW0oZm9+cyLbFDWuTEtEjd+XvCCHlAM094xv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854620;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zbk6QSm531ijEc3IehakyMwJ/iTYqjd5LnTaRqW/iPs=;
	b=IGjxE0jD2/yN4hTxgcDduBMd41bZjEIrOaQfVKbKOkzckwq8l5WibgMPIEwDB4koLPf0
	 uhK3o6AdKuKTy4SngHY99BhgqgH7gwt9ftCsX3QOXHS9qa2VzkmOj32AKR2c5QGZXSJr3
	 6n0ca2QZce3mdKf200LzjVjSm5osh4Jt1waFNYNdUVNwyturmNHQSwXdBGIS8EhIAYEd5
	 g8VVb+IrzCtRs7rjsFEs0ljZHXAWGCGmuprFV4yVswKVMBNq0hz0prgSkEOEKl1xR7y4v
	 IUpY3CJiuSb7RbUPRm+qTtOGm9b8StePbEZ79qUp/M3qkiYDEa+qerB0rwMsz+SDJAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mDaWHW0V;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36F606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D36F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mDaWHW0V
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792854615; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Zbk6QSm531ijEc3IehakyMwJ/iTYqjd5LnTaRqW/iPs=;
	b=mDaWHW0VrNBVCVgzlTvTce3zhp+50xbGKvnqZnNCptZ6JiNBcp88+kSzBjYvt4sC85i0vds3AqbY+hubh39Ezgta4Fgi3mIgtytRaNWlendlWS92ITZ5hCzMV7H75NwlWZ+i2IAjWCheqNd6Uw/TeggTW9DJLvgWtqpurxnr5/8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDORGh0_1792854615;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDORGh0_1792854615 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Oct 2026 23:10:15 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] ocfs2: find the xattr entry again after converting a block to a bucket
Date: Sat, 24 Oct 2026 23:10:09 +0800
Message-Id: <20261024151012.1059683-4-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
References: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
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

ocfs2_xattr_create_index_block() turns a non-indexed xattr block into a
tree by copying it into a bucket, and the copy sorts the entries: a
block holds them in insertion order, a bucket by name hash.
ocfs2_xattr_update_xattr_search() nevertheless relocates the caller's
search by the index the entry had in the block, so unless the two orders
agreed it points at an unrelated entry, and nothing between there and
the write compares that entry's name with the one being set.

Setting an xattr whose new value no longer fits the block arrives here
with xs->not_found clear.  The block gave up because
ocfs2_xa_block_can_reuse() wants an exact namevalue size match, while
ocfs2_xa_bucket_can_reuse() only wants an entry at least as large as the
new one, so the bucket accepts a pair the block rejected and the update
lands on whichever entry the sort left at that index.  Equal padded name
lengths get that other attribute's value replaced in place and its name
left alone, so setxattr returns success while the attribute asked for
keeps its old value.  A longer one trips ocfs2_xa_reuse_entry()'s
BUG_ON, and a shorter one is refused by the bucket as well, so
ocfs2_xa_prepare_entry() wipes the entry and writes the new name over
it, leaving xe_name_hash describing a name that is no longer there.

Find the entry again by the name being set, matching the type as well.
The copy carries every entry and every name over unchanged, and (type,
name) pairs are unique within a block, so the match is exact.  The type
matters because the handlers strip their prefix before calling
ocfs2_xattr_set(), so user.foo and trusted.foo share a stored name, a
stored length and a hash, and both can sit in the same block.

The name has to come from xi rather than from xs->here: a failed set can
remove the entry xs->here names, and only the "growing" caller sets
ctxt->set_abort, which is what stops the conversion.  Scan every entry
rather than narrowing on the hash the way ocfs2_find_xe_in_bucket()
does, since an existing entry keeps the hash it was stored under, which
a kernel that sign-extended the name bytes made different from the one
computed now.  An empty result means the entry did not survive the
failed set and this has become an insert; leaving xs->here alone would
keep it pointing into the block, which is rewritten as a tree root
before the caller reads it again.

Fixes: 012255961c9e ("ocfs2: Enable xattr set in index btree")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/xattr.c | 54 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index d6d07116ce97..2c069029cef7 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -275,6 +275,7 @@ static int ocfs2_xattr_tree_list_index_block(struct inode *inode,
 					size_t buffer_size);
 
 static int ocfs2_xattr_create_index_block(struct inode *inode,
+					  struct ocfs2_xattr_info *xi,
 					  struct ocfs2_xattr_search *xs,
 					  struct ocfs2_xattr_set_ctxt *ctxt);
 
@@ -3375,7 +3376,7 @@ static int ocfs2_xattr_block_set(struct inode *inode,
 		else if ((ret != -ENOSPC) || ctxt->set_abort)
 			goto end;
 		else {
-			ret = ocfs2_xattr_create_index_block(inode, xs, ctxt);
+			ret = ocfs2_xattr_create_index_block(inode, xi, xs, ctxt);
 			if (ret)
 				goto end;
 		}
@@ -4749,13 +4750,10 @@ static void ocfs2_cp_xattr_block_to_bucket(struct inode *inode,
  * real place of the xattr.
  */
 static void ocfs2_xattr_update_xattr_search(struct inode *inode,
-					    struct ocfs2_xattr_search *xs,
-					    struct buffer_head *old_bh)
+					    struct ocfs2_xattr_info *xi,
+					    struct ocfs2_xattr_search *xs)
 {
-	char *buf = old_bh->b_data;
-	struct ocfs2_xattr_block *old_xb = (struct ocfs2_xattr_block *)buf;
-	struct ocfs2_xattr_header *old_xh = &old_xb->xb_attrs.xb_header;
-	int i;
+	int i, count;
 
 	xs->header = bucket_xh(xs->bucket);
 	xs->base = bucket_block(xs->bucket, 0);
@@ -4764,8 +4762,43 @@ static void ocfs2_xattr_update_xattr_search(struct inode *inode,
 	if (xs->not_found)
 		return;
 
-	i = xs->here - old_xh->xh_entries;
-	xs->here = &xs->header->xh_entries[i];
+	/*
+	 * A block holds its entries in insertion order while a bucket holds
+	 * them by name hash, so ocfs2_cp_xattr_block_to_bucket() sorted the
+	 * copies and the index this entry had in the block no longer says
+	 * where it is.  It copied every entry and every name unchanged, and
+	 * (type, name) pairs are unique within a block, so find it again by
+	 * name.
+	 *
+	 * Search for the name being set, not for the name xs->here carries.
+	 * A failed set may have removed that entry, and ocfs2_xa_remove_entry()
+	 * then memmoves its successor into the slot.  Comparing every entry
+	 * rather than narrowing on the hash also finds an entry stored under
+	 * the legacy signed hash, which ocfs2_find_xe_in_bucket() would skip.
+	 */
+	count = le16_to_cpu(xs->header->xh_count);
+	for (i = 0; i < count; i++) {
+		struct ocfs2_xattr_entry *xe = &xs->header->xh_entries[i];
+
+		if (ocfs2_xattr_get_type(xe) != xi->xi_name_index)
+			continue;
+		if (xe->xe_name_len != xi->xi_name_len)
+			continue;
+		if (!memcmp(xs->base + le16_to_cpu(xe->xe_name_offset),
+			    xi->xi_name, xi->xi_name_len)) {
+			xs->here = xe;
+			return;
+		}
+	}
+
+	/*
+	 * The entry did not survive the failed set, so this has become an
+	 * insert.  Point xs->here back inside the bucket: it still refers to
+	 * the block being converted, which is about to be rewritten as a tree
+	 * root.
+	 */
+	xs->not_found = -ENODATA;
+	xs->here = xs->header->xh_entries;
 }
 
 /*
@@ -4773,6 +4806,7 @@ static void ocfs2_xattr_update_xattr_search(struct inode *inode,
  * is allocated and the xattr block header is rewritten.
  */
 static int ocfs2_xattr_create_index_block(struct inode *inode,
+					  struct ocfs2_xattr_info *xi,
 					  struct ocfs2_xattr_search *xs,
 					  struct ocfs2_xattr_set_ctxt *ctxt)
 {
@@ -4834,7 +4868,7 @@ static int ocfs2_xattr_create_index_block(struct inode *inode,
 	ocfs2_cp_xattr_block_to_bucket(inode, xb_bh, xs->bucket);
 	ocfs2_xattr_bucket_journal_dirty(handle, xs->bucket);
 
-	ocfs2_xattr_update_xattr_search(inode, xs, xb_bh);
+	ocfs2_xattr_update_xattr_search(inode, xi, xs);
 
 	/* Change from ocfs2_xattr_header to ocfs2_xattr_tree_root */
 	memset(&xb->xb_attrs, 0, inode->i_sb->s_blocksize -
-- 
2.39.3

