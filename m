Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092363CAA3F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062871; cv=none; b=Wr9xTDgQAQPMm2ZfCUh4NgmaiaK8Rx1bbFF6chT2k7fSaBaM31B8bOaMsCsINywGK6u+ZRlOi/TxrXW9Z7DShpi+/WyQRcXldIb7Daomuc6F9L5dYtCDx0DUB16/Bol+jW7FwwewNXUrkQkb4Ieto2V7sVuXn6R1l29IZsfiZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062871; c=relaxed/simple;
	bh=XrPvrrHNaH3h6usxw4SO6pwHyk8MJ9Pg2h4F9/FUClY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SuKkVLAnyF24MnL7GeV1QdOdrC/U+nWVpW1yNEnoAqG6WjD8JnTbbAUOhROsWiuzlhfToqrzWd4qUHJuiBXJSKZ3uDCkHmvxLh51jx6LKcdWcmX9pWcKpv8vclEjX1UwO6oPKuOYht7gxfpuolrew/1sQhNT5Qhk8o+3kksbbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b0e7370be1so922595eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062869; x=1790667669;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2PPXGuUK7BCbuHnmTDRYrOzvGigpnWWgKcYQ6j2BYsA=;
        b=zGPOzx5zGoOzwjinL3N7/lkos5iD18KNoWLoj58vo9HWHUcPG2rp7vd8BzVajZLEdN
         bytrTaMDoVYwOKzqVLII6vVmsghkc5vtbulAtO/hZNlahNwoD533sYhp++v53Uf57X0/
         yrRjsynA1IAKvu596kDc6OqEeOpP9n4r8eAe3M/zgy9wbp5tMGFFD6MUu2aZ54P8RFYW
         1mzfDATIE3mfS8xzHn/EjpxdxG1K8HjYvWumKbVq3s0T318SUb9hkLazcAoGgOr24WfD
         evxRrlKmam1y7Mj5eta6TOGI1fSiVGo4ZNtKRCr3TFcShDCODVV/5TRVq546hGefX9iP
         1ijg==
X-Gm-Message-State: AFuF++l+LY23eafzes1UheUT0UgcUxoWCq9V6BKKDm9z+MmZLbDUnhhx
	qOF1qMbqgymTeLlFq3gpjl3ap5lMQxvoaeLZH5bCLUvif2L7aUkrbWtV9hz5PrIQsvGy3x8NYhI
	2ix29TuDSTciPUv1tIC9cr0i/WupQYHWAxdvqZ0A/EOxZhc3+EIcI2HO9pI0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:220d:b0:6b1:7e2b:dc01 with SMTP id
 006d021491bc7-6d1586690ccmr1683959eaf.11.1790062868884; Tue, 22 Sep 2026
 00:41:08 -0700 (PDT)
Date: Tue, 22 Sep 2026 00:41:08 -0700
In-Reply-To: <677f567c.050a0220.25a300.01ad.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab23114.514bccd6.255447.001b.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [nilfs?] INFO: task hung in find_inode (2)
From: syzbot <syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [nilfs?] INFO: task hung in find_inode (2)
Author: konishi.ryusuke@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 89a312991dc6

Avoid a three-way deadlock involving find_inode(),
nilfs_evict_inode(), and the log writer by checking the inode bitmap
during normal inode loading.

diff --git a/fs/nilfs2/alloc.c b/fs/nilfs2/alloc.c
index 7b1cd2baefcf..32f54382f95d 100644
--- a/fs/nilfs2/alloc.c
+++ b/fs/nilfs2/alloc.c
@@ -404,6 +404,13 @@ static size_t nilfs_palloc_bitmap_offset(const struct buffer_head *bh)
 	return offset_in_folio(bh->b_folio, bh->b_data);
 }
 
+static size_t nilfs_palloc_entry_offset_in_block(
+	const struct inode *inode, unsigned long entry_index_in_group)
+{
+	return (entry_index_in_group % NILFS_MDT(inode)->mi_entries_per_block)
+		* NILFS_MDT(inode)->mi_entry_size;
+}
+
 /**
  * nilfs_palloc_entry_offset - calculate the byte offset of an entry in the
  *                             folio containing it
@@ -416,14 +423,61 @@ static size_t nilfs_palloc_bitmap_offset(const struct buffer_head *bh)
 size_t nilfs_palloc_entry_offset(const struct inode *inode, __u64 nr,
 				 const struct buffer_head *bh)
 {
-	unsigned long entry_index_in_group, entry_index_in_block;
+	unsigned long entry_index_in_group;
 
 	nilfs_palloc_group(inode, nr, &entry_index_in_group);
-	entry_index_in_block = entry_index_in_group %
-		NILFS_MDT(inode)->mi_entries_per_block;
 
 	return offset_in_folio(bh->b_folio, bh->b_data) +
-		entry_index_in_block * NILFS_MDT(inode)->mi_entry_size;
+		nilfs_palloc_entry_offset_in_block(inode, entry_index_in_group);
+}
+
+/**
+ * nilfs_palloc_kmap_entry - map the page containing the entry and calculate
+ *                           the entry's memory address on it
+ * @inode:        inode of metadata file using this allocator
+ * @nr:           serial number of the entry (e.g. inode number)
+ * @entry_bh:     buffer head of the entry block
+ * @bitmap_check: whether to perform bitmap testing
+ *
+ * Return: Pointer to the mapped entry on success, or an ERR_PTR() encoded
+ * error code on failure.  Specifically, returns %-ENOENT if @bitmap_check
+ * is true and the bitmap block managing the entry does not exist, or if the
+ * corresponding bit for the entry is not set in the bitmap.  Note that this
+ * function never fails when @bitmap_check is false.
+ */
+void *nilfs_palloc_kmap_entry(struct inode *inode, __u64 nr,
+			const struct buffer_head *entry_bh, bool bitmap_check)
+{
+	unsigned long group, entry_index_in_group;
+	size_t entry_offset;
+
+	group = nilfs_palloc_group(inode, nr, &entry_index_in_group);
+	if (bitmap_check) {
+		struct buffer_head *bitmap_bh;
+		unsigned char *bitmap;
+		size_t bitmap_offset;
+		int ret;
+
+		ret = nilfs_palloc_get_bitmap_block(inode, group, 0,
+						&bitmap_bh);
+		if (unlikely(ret))
+			return ERR_PTR(ret);
+
+		bitmap_offset = nilfs_palloc_bitmap_offset(bitmap_bh);
+		bitmap = kmap_local_folio(bitmap_bh->b_folio, bitmap_offset);
+		if (!test_bit_le(entry_index_in_group, bitmap))
+			ret = -ENOENT;
+		kunmap_local(bitmap);
+		brelse(bitmap_bh);
+
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	entry_offset = offset_in_folio(entry_bh->b_folio, entry_bh->b_data) +
+		nilfs_palloc_entry_offset_in_block(inode, entry_index_in_group);
+
+	return kmap_local_folio(entry_bh->b_folio, entry_offset);
 }
 
 /**
diff --git a/fs/nilfs2/alloc.h b/fs/nilfs2/alloc.h
index 046d876ea3e0..2c184d0ff097 100644
--- a/fs/nilfs2/alloc.h
+++ b/fs/nilfs2/alloc.h
@@ -35,6 +35,8 @@ int nilfs_palloc_get_entry_block(struct inode *, __u64, int,
 				 struct buffer_head **);
 size_t nilfs_palloc_entry_offset(const struct inode *inode, __u64 nr,
 				 const struct buffer_head *bh);
+void *nilfs_palloc_kmap_entry(struct inode *inode, __u64 nr,
+			const struct buffer_head *entry_bh, bool bitmap_check);
 
 int nilfs_palloc_count_max_entries(struct inode *, u64, u64 *);
 
diff --git a/fs/nilfs2/ifile.h b/fs/nilfs2/ifile.h
index d38a46f5ae41..bc47bb139e1c 100644
--- a/fs/nilfs2/ifile.h
+++ b/fs/nilfs2/ifile.h
@@ -19,11 +19,10 @@
 
 
 static inline struct nilfs_inode *
-nilfs_ifile_map_inode(struct inode *ifile, u64 ino, struct buffer_head *ibh)
+nilfs_ifile_map_inode(struct inode *ifile, u64 ino,
+		const struct buffer_head *ibh, bool bitmap_check)
 {
-	size_t __offset_in_folio = nilfs_palloc_entry_offset(ifile, ino, ibh);
-
-	return kmap_local_folio(ibh->b_folio, __offset_in_folio);
+	return nilfs_palloc_kmap_entry(ifile, ino, ibh, bitmap_check);
 }
 
 static inline void nilfs_ifile_unmap_inode(struct nilfs_inode *raw_inode)
diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 34e6096069ad..09de917b4b82 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -455,7 +455,14 @@ static int __nilfs_read_inode(struct super_block *sb,
 	if (unlikely(err))
 		goto bad_inode;
 
-	raw_inode = nilfs_ifile_map_inode(root->ifile, ino, bh);
+	raw_inode = nilfs_ifile_map_inode(root->ifile, ino, bh, true);
+	if (IS_ERR(raw_inode)) {
+		err = PTR_ERR(raw_inode);
+		if (err == -ENOENT)
+			err = -ESTALE;
+		brelse(bh);
+		goto bad_inode;
+	}
 
 	err = nilfs_read_inode_common(inode, raw_inode);
 	if (err)
@@ -743,7 +750,7 @@ void nilfs_update_inode(struct inode *inode, struct buffer_head *ibh, int flags)
 	struct inode *ifile = ii->i_root->ifile;
 	struct nilfs_inode *raw_inode;
 
-	raw_inode = nilfs_ifile_map_inode(ifile, ino, ibh);
+	raw_inode = nilfs_ifile_map_inode(ifile, ino, ibh, false);
 
 	if (test_and_clear_bit(NILFS_I_NEW, &ii->i_state))
 		memset(raw_inode, 0, NILFS_MDT(ifile)->mi_entry_size);
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 829573cb6131..23b24373befc 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -895,7 +895,7 @@ static void nilfs_fill_in_file_bmap(struct inode *ifile,
 		ibh = ii->i_bh;
 		BUG_ON(!ibh);
 		raw_inode = nilfs_ifile_map_inode(ifile, ii->vfs_inode.i_ino,
-						  ibh);
+						  ibh, false);
 		nilfs_bmap_write(ii->i_bmap, raw_inode);
 		nilfs_ifile_unmap_inode(raw_inode);
 	}
-- 
2.53.0

