Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6C6379C56
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223459; cv=none; b=C0XxI2q820GT453xEA2SGt96/zZrhJ8bzi2d7zcX/O4Q4jV9Vr5dhHyuRhO8Kvy3VfnNIoUcxITVuvgbyoZlKFc3ywSG5NbuRr0nQLkH9WSVD/n6F+8OuOnRsOIZy6XsChlq4vot0jH712hX2efT4ayxsEo24ApT74b1fEr/hJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223459; c=relaxed/simple;
	bh=nMPnE+cQpNJeJ+D+zqkXY1Fai7+zycPMt1Imwgwn4OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9Nviu4XCexq1yLumeEILZArfyCD5z7tcdSHDgtCb4HDHwLn+5lyniWIHC/OguXy//xIGqoQcqkV4nOCE0u9SzAiOAKxs957nF9hMu3PPQjhtIw1vD1sqS5iBM7jHAFcULkflIRM6plBOvXa6831RE6rbgv5W6eSyQwyqfCjBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=woolweaver.bid; spf=pass smtp.mailfrom=woolweaver.bid; dkim=pass (2048-bit key) header.d=woolweaver.bid header.i=@woolweaver.bid header.b=Qw46Djzy; arc=none smtp.client-ip=91.218.175.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=woolweaver.bid
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=woolweaver.bid
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=woolweaver.bid header.i=@woolweaver.bid header.b="Qw46Djzy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nMPnE+cQpNJeJ+D+zqkXY1Fai7+zycPMt1Imwgwn4OU=;
 c=simple/simple; d=woolweaver.bid;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790223454; v=1; x=1790828254;
 b=Qw46DjzyA2bEr7nVLmKv65iUUevYgFW5oIxqDKrFh+0isqbuew/Ju/ENrlulzwbB7uSqCGr7
 uPL/4KLOCILLzhT09Xxdry5YK6F9U96SRRHg+2lo2xYpk0ZXcBxqHJInPtraGnPRjjODMViGc/T
 MtSZIa3fbxm3KrUsThrysggEsFhAPki16kCtWEqqKRI+xafb39Qmi5Ptojm337ewdtxIN9boNNQ
 FiXG25rmym8qN6zugaY5RsCxSCU/KzXUBlFfdzqIGk3eqE8i6jttGCs/axoFJSjBJDQwlFCaDkb
 RQbpEIYtUxmfHlMOehLD6G3KdCeMaW8kjJMirTTV2qheQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9894b03afe6d6956;
	Thu, 24 Sep 2026 04:17:24 +0000
X-Mizu-Trace-ID: 9894b03afe6d6956
X-Migadu-Flow: FLOW_OUT
From: Michael Woolweaver <michael@woolweaver.bid>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Woolweaver <michael@woolweaver.bid>
Subject: [PATCH] ntfs: exclude DOS aliases from VFS link count
Date: Wed, 23 Sep 2026 23:17:20 -0500
Message-ID: <20260924041720.16477-1-michael@woolweaver.bid>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NTFS counts each $FILE_NAME attribute in the MFT record link_count.
A file with separate Win32 and DOS 8.3 names therefore has a link_count
of two even though the DOS name is an alias and does not represent a
separate VFS hard link.

ntfs_read_locked_inode() copies the MFT link_count directly to i_nlink,
causing stat() to report an extra hard link for files with a separate
DOS alias.

The same distinction is needed when unlinking. ntfs_delete() removes
both the DOS and Win32 $FILE_NAME attributes, decrementing the on-disk
link_count for each, but it must decrement the VFS link count only for
the Win32 name. Otherwise a real hard link can reach i_nlink zero while
another VFS-visible name still exists.

Count non-DOS $FILE_NAME attributes when initializing i_nlink, while
still verifying that the MFT link_count matches the total number of
name attributes. Do not drop i_nlink when ntfs_delete() removes a DOS
alias.

This was reproduced with a file containing separate Win32 and DOS
names. Its MFT link_count was 2 while stat() incorrectly reported 2
links. With the fix, stat() reports 1.

After adding a real POSIX hard link, the MFT contained three
$FILE_NAME attributes while the VFS correctly reported two links.
Removing the Win32/DOS pair left the POSIX hard link with both the MFT
link_count and VFS i_nlink equal to 1.

The fix was runtime-tested with fs/ntfs on a disposable NTFS image and
compile-tested on ntfs-next with W=1. checkpatch.pl reports no issues.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Assisted-by: LLM
Signed-off-by: Michael Woolweaver <michael@woolweaver.bid>
---
 fs/ntfs/inode.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/namei.c |  5 +++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a2..74a0d9d1e82b 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -621,6 +621,67 @@ static int ntfs_is_extended_system_file(struct ntfs_attr_search_ctx *ctx)
 	return 0;	/* NO, it is not an extended system file. */
 }
 
+/*
+ * ntfs_count_vfs_links - count VFS-visible hard links
+ * @ctx: initialized attribute search context
+ *
+ * The MFT link count counts all $FILE_NAME attributes.  A separate DOS 8.3
+ * name therefore contributes to the on-disk count even though it is an alias
+ * for its Win32 name and does not represent another VFS hard link.
+ *
+ * Return the number of VFS-visible links or -errno on error.
+ */
+static int ntfs_count_vfs_links(struct ntfs_attr_search_ctx *ctx)
+{
+	unsigned int expected, names = 0, links = 0;
+	int err;
+
+	expected = le16_to_cpu(ctx->mrec->link_count);
+	ntfs_attr_reinit_search_ctx(ctx);
+
+	while (!(err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, 0, 0, NULL, 0,
+					ctx))) {
+		struct attr_record *attr = ctx->attr;
+		struct file_name_attr *fn;
+		u32 attr_len, value_len;
+		u16 value_off;
+
+		if (unlikely(attr->non_resident))
+			goto corrupt;
+
+		attr_len = le32_to_cpu(attr->length);
+		value_len = le32_to_cpu(attr->data.resident.value_length);
+		value_off = le16_to_cpu(attr->data.resident.value_offset);
+
+		if (unlikely(value_off > attr_len ||
+			     value_len > attr_len - value_off ||
+			     value_len < offsetof(struct file_name_attr, file_name)))
+			goto corrupt;
+
+		fn = (struct file_name_attr *)((u8 *)attr + value_off);
+		names++;
+		if (fn->file_name_type != FILE_NAME_DOS)
+			links++;
+	}
+
+	if (unlikely(err != -ENOENT))
+		return err;
+
+	if (unlikely(names != expected || !links)) {
+		ntfs_error(ctx->ntfs_ino->vol->sb,
+			   "Inode link count doesn't match file name attributes. You should run chkdsk.");
+		return -EIO;
+	}
+
+	ntfs_attr_reinit_search_ctx(ctx);
+	return links;
+
+corrupt:
+	ntfs_error(ctx->ntfs_ino->vol->sb,
+		   "Corrupt file name attribute. You should run chkdsk.");
+	return -EIO;
+}
+
 static struct lock_class_key ntfs_dir_inval_lock_key;
 
 void ntfs_set_vfs_operations(struct inode *inode, mode_t mode, dev_t dev)
@@ -872,6 +933,22 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		}
 	}
 skip_attr_list_load:
+	/*
+	 * The MFT link count includes separate DOS 8.3 aliases.  Once the
+	 * attribute list is available, derive the VFS link count from the
+	 * $FILE_NAME namespaces instead.
+	 */
+	if (!(m->flags & MFT_RECORD_IS_DIRECTORY) && vi->i_ino != FILE_MFT) {
+		int nr_links;
+
+		nr_links = ntfs_count_vfs_links(ctx);
+		if (unlikely(nr_links < 0)) {
+			err = nr_links;
+			goto unm_err_out;
+		}
+		set_nlink(vi, nr_links);
+	}
+
 	err = ntfs_attr_lookup(AT_EA_INFORMATION, NULL, 0, 0, 0, NULL, 0, ctx);
 	if (!err) {
 		NInoSetHasEA(ni);
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 75e201096525..891ee697c0d2 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -829,6 +829,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	struct file_name_attr *fn = NULL;
 	bool looking_for_dos_name = false, looking_for_win32_name = false;
 	bool case_sensitive_match = true;
+	bool is_dos_name;
 	int err = 0;
 	struct mft_record *ni_mrec;
 	struct super_block *sb;
@@ -932,6 +933,8 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	if (err)
 		goto err_out;
 
+	is_dos_name = fn->file_name_type == FILE_NAME_DOS;
+
 	err = ntfs_index_remove(dir_ni, fn, le32_to_cpu(actx->attr->data.resident.value_length));
 	if (err)
 		goto err_out;
@@ -942,7 +945,7 @@ static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 
 	ni_mrec = actx->base_mrec ? actx->base_mrec : actx->mrec;
 	ni_mrec->link_count = cpu_to_le16(le16_to_cpu(ni_mrec->link_count) - 1);
-	if (!S_ISDIR(VFS_I(ni)->i_mode))
+	if (!S_ISDIR(VFS_I(ni)->i_mode) && !is_dos_name)
 		drop_nlink(VFS_I(ni));
 
 	mark_mft_record_dirty(ni);

base-commit: 401898d748fcc8e19ceea1a37ed0de9075fe9ff2
-- 
2.55.0

