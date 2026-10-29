Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236179;
	b=lRed7ul6JV/LiqNMMxMd0yRqVpi87gMcsIt9XFR4EsRbOp483AUUOPQxVYMviJ6J6kKy
	 6jpR4fdbeXSwai366nOd1WLocawhVi1TBPn/QbiG+ZcHbGX6IclAnQUG13oSY8SWuGMsT
	 Rp4Z3vIgkBb0qL8OnKqnOAGUfkPTyospcObx3jI7GxwfcNwyMHLLxMzPp63AJHuX5mftz
	 awe5E3dOW18XS7NRUAorhPfY4H9djIk+Hxtcdw4QxvQ329yI4L+ja/dz3VvlQAzLQkeEt
	 HaLuaUgk1eG7Cxf/mkaK7cIp/sQe/GD5pJZq9tLxTAQVXyCaMCuBzRdkXIfWCcfOF5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Fjcz0UzeukaoCi+7LyTX+Eai/H0b9M0rRkLbcl6QX58=;
	b=27oTxbcZi34/WWBP/AJ9X1HnMkFsWFv3CaYESTdxjev7tnCJ/UB3aAPhBbacf9srBwI1
	 7o0Q/IML1EA7pAMeRA1nx219K/HhFCk3PJCQ3jrzXG1bi723f4Y38p8nQZ/6+OcjV1cCh
	 5MA2UIIHmdcC6bBGIIbsnKwhMoyoi32pOs4TTBcy7VWjQ2EXZWSjXR8mkQWssTOnvRvxH
	 oN1AGzvNDX/Bq0a2b4Xx2jiR9A9pe6MPbCInqlLIkg9dwx0685eE2QhyqAk9yo6v4DjjF
	 5tvbD42SMvkTlVHHKHbW7eMWESDURZwtmBMS4YQPX4I/rA/ik1yYaqtaSp1VTucPnOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=d67TpNm5;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6644A60A2630
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6644A60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=d67TpNm5
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533778ab0bdso20317761cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793236178; x=1793840978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjcz0UzeukaoCi+7LyTX+Eai/H0b9M0rRkLbcl6QX58=;
        b=d67TpNm5ykyItlMd+gtoqBBHx148l1Opv+8PmGV77CxyVdK8X8wkWYft5x8sZ5UVH4
         KQQx0Jk2I8HJbmjp/lLxVpgKI9MdaejcDYCDg75vA95N4QI4Bgzs25h4qJV19U19Hw3l
         aP3DoFIu0tpVlB+sGsMoBp+gU+Dt5UK+41x7dSAocPd7w+S701GjE3S+lLo3U+TiU1lP
         esD71wdCOqdKC6PbuIK0yP7IuFzAGH2mvJ23aDcj8YsOhXWA+w89oOvX68S/5ga6G7Om
         SUCbUUicQJau/6b9aR9MSkQWcbLlNBAPV8SPc6We6EDr4KaenRtHXPQemVCgl6y5gKi2
         72ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793236178; x=1793840978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjcz0UzeukaoCi+7LyTX+Eai/H0b9M0rRkLbcl6QX58=;
        b=VjFrQu1ukkNmmWoHEiAWEzOfuN/dbIB4gVqPG77AV+8sL6bRmj+rOGRUY/NSie+KJB
         FvnglSuIQbnLGTypH7XRhYKpBX7AaVXuwrwWRVX0IDzSsLRDBrW5QWBO2HT8o8LQKUtn
         8vyfKRDbCmo+7jVJ+CrKT9JJ5yNxYJqKFD/GQ7lW25Qti+9Av3oqWCHM2ujTe3AwsMfm
         xTmiyyQOilF76wLo8bxALxfZduHU/AtAa2lDXRoVfGtNoh6q8TfWT270bGVj/CnnFQKu
         FkssBKkv9ui59Esz2zr1i52YLpjsCF0Ut4DkVZ39OzBtnM17zshdtwzo3+C7Iph/zEu3
         4M8w==
X-Forwarded-Encrypted: i=1; AKwUvBwEgJID4u0+PAvDe+uZI97J7er0R64QCvB4Nzo58U9IfuBzYQIIWtJEPQXAKCA5+9llxED1YJ2IskXCL7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWC6XppEhlJ1NDFZ0tLM0aADRuR3ZwcKjVJbatvjCIGXZMcBTZ
	mZT1Lpun1uTrid3i6H27DDNK8gGGyjdMFqvk5bQhFGx99QH0UwkNn5su1nkfj8OYLaQ=
X-Gm-Gg: AYBFou2t/gkuGmv67Ag5XLdSR5IVPipSaA/pn/TmIXLXHlsu67YPF+1h6hr9YROFJCx
	vJWxZwk6oo0wzVgdj59uPhCBOHV4Mw2ApN0rKT9iYM2ZX1dSo10IEWSalzHXKUTnnek/1sRuc46
	CHRqJDI0jRA87wUXMhW462fi0ArKHvzB1WN/9cEpgcznfAago/kClmrbMuDn4XmYlcr/FwofpY4
	LN8kpB4/F800CLY2juUcvJkrbWi7fYtV7laD9mV/Ia1z8Ja4iPbtpT0PFDnau+yGTvnwCkJA9rT
	uxXmrIcXndd0OQTGZau9NyKhMbWM5l2gViBQGhCrxL7K1uGONuxbxVhwoVWQ2VWdJJosOlfm9J9
	1AXY3DoFGRrs1CRtmoLoitsxv5OS1pmO5KDLWMYieIqTp/EFHOMuV6bSAjtb8bEzRqbIvdYYGZW
	wWQ9Ov401g92a/SYboHfRyA+yXJIOkzyHv3ZFZhOhMhPf5WhC5E/+4z+vZb0p8LULYcIU+r2IPY
	FDqVX/dPJVWfhhUn1yAJ3bn5BgxYpvOoOcMN/5rjDMv6nSBfJ4vXCbLcgcy+veLaZ5Fwph82eNU
	f6BEMvCTodYc7H59pkwOJo7cN/yDRhEKfrUWuuPUAOfQpQ==
X-Received: by 2002:a05:622a:648:b0:533:386a:edca with SMTP id d75a77b69052e-53fcaf19ed5mr66804081cf.16.1793236177910;
        Wed, 28 Oct 2026 18:09:37 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383974046bsm117079171cf.26.2026.10.28.18.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:09:37 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 29 Oct 2026 01:09:18 +0000
Subject: [PATCH v2 04/10] ovl: implement overlayfs' own ->write_inode
 operation
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-b4-ovl-containerized-sync-v2-4-4e9f08e4a052@toxicpanda.com>
References: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
In-Reply-To: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793236166; l=8212;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=K1AfrMvziZdad04T4XorEVM4p8fQ6NLQz4odH0Z+7S8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG3bvgnPhI2T3mZSzgcyLoCslmwsv6ZJ3h+7CcAqdZqnPBpNr35xGDnbDYYcaHpMpymxOjm0oxA
 PAcvPi3PcbA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Sync dirty data and meta of upper inode in overlayfs' ->write_inode()
and redirty overlayfs' inode.

The overlay inode is only redirtied while the upper inode is open for
writing, dirty or under writeback.  So a clean overlay inode means that
everything written through it has been written back.

The periodic pass of the flusher does not write the upper inode, the
flusher of the upper filesystem does that.  syncfs() waits for the data and
leaves the commit to ->sync_fs(), like sync_inodes_sb() does with for_sync.

The VFS ignores the return value of ->write_inode(), so record errors in
s_wb_err of the overlay for the next syncfs().

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: everything after the first paragraph]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/overlayfs.h | 13 ++++++++
 fs/overlayfs/super.c     | 80 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/overlayfs/util.c      | 52 +++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 101de0dd07d8..8f83325ec359 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -510,6 +510,19 @@ const struct ovl_layer *ovl_layer_lower(struct dentry *dentry);
 struct dentry *ovl_dentry_real(struct dentry *dentry);
 struct dentry *ovl_i_dentry_upper(struct inode *inode);
 struct inode *ovl_inode_upper(struct inode *inode);
+
+/* How ovl_write_upper_inode() writes an upper inode */
+enum ovl_write_mode {
+	/* Start the writeback and do not wait for it */
+	OVL_WRITE_START,
+	/* Wait for the data, ->sync_fs() is going to commit the metadata */
+	OVL_WRITE_WAIT,
+	/* A write_inode_now() that waits, for a caller that is not a sync */
+	OVL_WRITE_COMMIT,
+};
+
+int ovl_write_upper_inode(struct super_block *sb, struct inode *upper,
+			  enum ovl_write_mode mode);
 struct inode *ovl_inode_lower(struct inode *inode);
 struct inode *ovl_inode_lowerdata(struct inode *inode);
 struct inode *ovl_inode_real(struct inode *inode);
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index f0ca1539022d..4e06b3c772fe 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -15,6 +15,8 @@
 #include <linux/seq_file.h>
 #include <linux/posix_acl_xattr.h>
 #include <linux/exportfs.h>
+#include <linux/pagemap.h>
+#include <linux/writeback.h>
 #include <linux/file.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
@@ -313,12 +315,90 @@ static int ovl_statfs(struct dentry *dentry, struct kstatfs *buf)
 	return err;
 }
 
+/*
+ * Could there be anything left to write or to wait for on @upper?
+ *
+ * A task that has @upper open for writing may have it mapped, and overlayfs
+ * does not see stores through a mapping.  The mapping holds the file open.
+ *
+ * Writeback that has been started but not completed, by us or by the flusher of
+ * the upper filesystem, shows in the page cache tags.  It does not show in the
+ * dirty flags of the inode, which are cleared when writeback starts.
+ *
+ * So dirty flags that are clear say nothing.  Dirty flags that are set do say
+ * that there is something left to write.  @upper may not have been written at
+ * all, see ovl_write_inode().  And a write_inode_now() that does not wait does
+ * nothing if the flusher of the upper filesystem is writing @upper.  A
+ * modification that was made during that pass is only recorded in the flags.
+ *
+ * i_writecount has to be read first.  If it is seen at zero, the tag of a page
+ * that was dirtied through a mapping must be seen as well.  The tag is set when
+ * the mapping goes away at the latest.  i_writecount drops after that, when the
+ * file is released, with the full barrier of the last fput() in between.
+ */
+static bool ovl_upper_unfinished(struct inode *upper)
+{
+	struct address_space *mapping = upper->i_mapping;
+
+	return atomic_read_acquire(&upper->i_writecount) > 0 ||
+	       mapping_tagged(mapping, PAGECACHE_TAG_DIRTY) ||
+	       mapping_tagged(mapping, PAGECACHE_TAG_WRITEBACK) ||
+	       (inode_state_read_once(upper) & (I_DIRTY | I_SYNC));
+}
+
+static enum ovl_write_mode ovl_write_mode(struct inode *inode,
+					  struct inode *upper,
+					  struct writeback_control *wbc)
+{
+	if (wbc->sync_mode != WB_SYNC_ALL)
+		return OVL_WRITE_START;
+
+	/* sync_inodes_sb() does not wait for such a filesystem either */
+	if (upper->i_sb->s_iflags & SB_I_NO_DATA_INTEGRITY)
+		return OVL_WRITE_START;
+
+	/*
+	 * syncfs() and unmount call ovl_sync_fs() next.  While the overlay is
+	 * being mounted, iput() writes a dirty inode because it cannot keep it.
+	 * Nobody has asked for that inode to be durable yet.
+	 */
+	if (wbc->for_sync || !(inode->i_sb->s_flags & SB_ACTIVE))
+		return OVL_WRITE_WAIT;
+
+	return OVL_WRITE_COMMIT;
+}
+
+static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
+{
+	struct inode *upper = ovl_inode_upper(inode);
+	int ret = 0;
+
+	if (!upper)
+		return 0;
+
+	/*
+	 * Leave periodic and background writeback to the flusher of the upper
+	 * filesystem.  @upper is on its dirty list, and it knows when the data
+	 * is old enough to be written.  All there is to do here is to find out
+	 * whether the overlay inode can be clean again.
+	 */
+	if (!wbc->for_kupdate && !wbc->for_background)
+		ret = ovl_write_upper_inode(inode->i_sb, upper,
+					    ovl_write_mode(inode, upper, wbc));
+
+	if (ovl_upper_unfinished(upper))
+		ovl_mark_inode_dirty(inode);
+
+	return ret;
+}
+
 static const struct super_operations ovl_super_operations = {
 	.alloc_inode	= ovl_alloc_inode,
 	.free_inode	= ovl_free_inode,
 	.destroy_inode	= ovl_destroy_inode,
 	.drop_inode	= inode_just_drop,
 	.put_super	= ovl_put_super,
+	.write_inode	= ovl_write_inode,
 	.sync_fs	= ovl_sync_fs,
 	.statfs		= ovl_statfs,
 	.show_options	= ovl_show_options,
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index f32202500b3d..76e090b2a0c5 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -14,6 +14,7 @@
 #include <linux/fileattr.h>
 #include <linux/uuid.h>
 #include <linux/namei.h>
+#include <linux/pagemap.h>
 #include <linux/ratelimit.h>
 #include <linux/overflow.h>
 #include "overlayfs.h"
@@ -1528,3 +1529,54 @@ void ovl_copyattr(struct inode *inode)
 	__ovl_copyattr(inode);
 	ovl_mark_inode_dirty(inode);
 }
+
+/*
+ * Write @upper the way sync_inodes_sb() writes an inode, with for_sync set in
+ * the writeback_control: wait for the data, hand the inode to the filesystem,
+ * and leave it to ->sync_fs() to commit it.  write_inode_now() cannot be told
+ * about for_sync.  If it waits, ext4 commits a transaction for every inode.
+ */
+static int ovl_sync_upper_inode(struct inode *upper)
+{
+	int err, err2;
+
+	err = filemap_write_and_wait(upper->i_mapping);
+
+	/* A sync also writes the timestamps that lazytime defers */
+	if (inode_state_read_once(upper) & I_DIRTY_TIME)
+		mark_inode_dirty_sync(upper);
+
+	err2 = sync_inode_metadata(upper, 0);
+	/*
+	 * That does nothing if the flusher of the upper filesystem is writing
+	 * @upper, and the flusher may have looked at the inode before it was
+	 * modified.  Wait for the flusher in that case.
+	 */
+	if (inode_state_read_once(upper) & (I_DIRTY_INODE | I_SYNC))
+		err2 = sync_inode_metadata(upper, 1);
+
+	return err ? err : err2;
+}
+
+/*
+ * Write @upper for the overlay @sb.
+ *
+ * Nobody may be there to take the error.  The VFS ignores what ->write_inode()
+ * returns when it walks the dirty list.  Record the error in the superblock of
+ * the overlay, like mapping_set_error() does for a page that could not be
+ * written, so that the next syncfs() on the overlay returns it.
+ */
+int ovl_write_upper_inode(struct super_block *sb, struct inode *upper,
+			  enum ovl_write_mode mode)
+{
+	int err;
+
+	if (mode == OVL_WRITE_WAIT)
+		err = ovl_sync_upper_inode(upper);
+	else
+		err = write_inode_now(upper, mode == OVL_WRITE_COMMIT);
+
+	if (err)
+		errseq_set(&sb->s_wb_err, err);
+	return err;
+}

-- 
2.55.0

