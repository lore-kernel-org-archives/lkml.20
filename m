Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC538A718
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886879; cv=none; b=VDxXB+NdWp0FUmyIN705GxZLa1pqL8VPAKX+O4TEoUq/Drz1QtSptifUXLThUe7Zd0rfWy6j2oWdv2b+qsbDWySsGW7iM8YXrKZOrDb8lMAlyPoHbbkTBhroBV4m8H5EYIYTVxV6WObgPdrmNzpcuLx7tyw0droWQhap/8zDDYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886879; c=relaxed/simple;
	bh=OBkSe83teLUEbgksa9UnX78gpVqP2lUS8kbyKuITI9A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Qg+K6yziksmz69zHU4f34Jgf4qnAUlPXt3xGqDdiRWoVqFN7I0NInizPYDhOoS2b1ZTBIh+KFIxePriteEr90AQdHJrdEGZnOBdwSrBtplUqqG7Z+w+Db7e76+IkP3zGeZGCxpG1euIp+t5vDxXTpsxP4heqqjQmlCSNklkt05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so13287552b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886877; x=1791491677;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aiwnh+A/HPIJPqD4wFC0v7RAEM4ZQs/nnCwgu096AmE=;
        b=H0/HtxOD7tftgIfoXeWJwOj54M0qByqxnwy7r7Zyin/+ZIg+1D8KCTp9YogbtjV7AL
         +lldoI6sGa569dCeB7709i4DkH2t/6U/m9Z0/NCQXmaDtypWSwoUm/BAKVxtrEZcj2Dz
         p/4orswUdR/2g022nk43y5ui5hsHzJPQFCPIt38prCUW1bM1wXR4uKbVvSjvKLdMY0yg
         NawBvJXEcTzjkNboSuOdpd6+zQN2aMbNKjxl6vG+iClSj9VrIXNFOaEFhwOv0z0EixJ1
         4pEgFKHvcGaxToEqlb/o550WMSDLQcEpMfORnM0gKHxcjRnjlQ0qBw8rFGJBLl2GSwpg
         w1Kw==
X-Gm-Message-State: AFuF++mnzwP3wMQFCTs0DYgdKOsre0zJVPpKbxFjFTFHaWSeb3bRt+pR
	Pr55UMTcBIrLPAUxCcYdZSWGDBtJKay+Gf9yk2ErMdzhSrzbYFHrFz1P74argtRdTAg1/uI1Dok
	9G4rQrg+I76g8BltQggyva2wSyxw2iA2P/ZI1fU5pnPZB96Z2TFDwj+Jwkx8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1993:b0:4c5:4eed:b447 with SMTP id
 5614622812f47-4f526644462mr279882b6e.1.1790886877218; Thu, 01 Oct 2026
 13:34:37 -0700 (PDT)
Date: Thu, 01 Oct 2026 13:34:37 -0700
In-Reply-To: <6abae226.69bd487b.a6f8c.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abec3dd.7503fbd6.2d3f6.000a.GAE@google.com>
Subject: Forwarded: [PATCH] ext4: don't trust on-disk rec_len in dx_move_dirents()
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] ext4: don't trust on-disk rec_len in dx_move_dirents()
Author: adrianox@gmail.com

#syz test: upstream master
---
 fs/ext4/namei.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a6386c1d237f..83e4564f9f44 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1840,30 +1840,46 @@ struct dentry *ext4_get_parent(struct dentry *child)
 
 /*
  * Move count entries from end of map between two memory locations.
- * Returns pointer to last entry moved.
+ * Returns pointer to last entry moved or an ERR_PTR on a corrupt entry.
  */
 static struct ext4_dir_entry_2 *
 dx_move_dirents(struct inode *dir, char *from, char *to,
 		struct dx_map_entry *map, int count,
 		unsigned blocksize)
 {
+	char *to_start = to;
 	unsigned rec_len = 0;
 
 	while (count--) {
-		struct ext4_dir_entry_2 *de = (struct ext4_dir_entry_2 *)
-						(from + (map->offs<<2));
+		unsigned int off = map->offs << 2;
+		struct ext4_dir_entry_2 *de;
+
+		/*
+		 * The map is built from on-disk dirents, but a corrupted or
+		 * concurrently reused leaf block can still make an entry point
+		 * outside the block.  Never dereference such an entry.
+		 */
+		if (off > blocksize - sizeof(struct ext4_dir_entry_2))
+			return ERR_PTR(-EFSCORRUPTED);
+		de = (struct ext4_dir_entry_2 *)(from + off);
 		rec_len = ext4_dir_rec_len(de->name_len, dir);
+		if (off + rec_len > blocksize ||
+		    to + rec_len > to_start + blocksize)
+			return ERR_PTR(-EFSCORRUPTED);
 
 		memcpy (to, de, rec_len);
 		((struct ext4_dir_entry_2 *) to)->rec_len =
 				ext4_rec_len_to_disk(rec_len, blocksize);
 
-		/* wipe dir_entry excluding the rec_len field */
+		/*
+		 * Wipe dir_entry excluding the rec_len field.  Use the entry's
+		 * own (minimal) length instead of the untrusted on-disk rec_len,
+		 * which on a corrupt block decodes to an arbitrary huge value
+		 * and turns this into an out-of-bounds memset().
+		 */
 		de->inode = 0;
-		memset(&de->name_len, 0, ext4_rec_len_from_disk(de->rec_len,
-								blocksize) -
-					 offsetof(struct ext4_dir_entry_2,
-								name_len));
+		memset(&de->name_len, 0, rec_len -
+		       offsetof(struct ext4_dir_entry_2, name_len));
 
 		map++;
 		to += rec_len;
@@ -1992,6 +2008,12 @@ static struct ext4_dir_entry_2 *do_split(handle_t *handle, struct inode *dir,
 	/* Fancy dance to stay within two buffers */
 	de2 = dx_move_dirents(dir, data1, data2, map + split, count - split,
 			      blocksize);
+	if (IS_ERR(de2)) {
+		ext4_error_inode_block(dir, (*bh)->b_blocknr, 0,
+				       "bad indexed directory entry");
+		err = PTR_ERR(de2);
+		goto out;
+	}
 	de = dx_pack_dirents(dir, data1, blocksize);
 	de->rec_len = ext4_rec_len_to_disk(data1 + (blocksize - csum_size) -
 					   (char *) de,
-- 
2.51.0

