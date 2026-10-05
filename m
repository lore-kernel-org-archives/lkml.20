Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1D221DB6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162109; cv=none; b=Vnm4opGQqYMARd4dzHis2OpNQbXQc6CGXM1gNAmTVEYenkuIe6EEgoi8nOg5kzs52fF/x48vUy7mcQjgrUShoVqXrrSed0OOso5QYJfEsCRzYbh5uBtnzDZ3iNsMjlzfdOyrsXDmz/b5z5WRtl0jl99iTKR5rOFUSNParOKJBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162109; c=relaxed/simple;
	bh=EMCSABJvfO2WUOXXBAz9XTLllBM6/fxpYvUc9pDVbLo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=quhJUV1nkDGVaz6cMCbgcUaYEo3BfkGLXrmvUCXlJIoGHwdOm6qvLx45lYtDfb3WA/l0O7cf/8NJwmCygiFRLWo7n3+CfrB37FH6az9EsH5VsljdKfbBCy0s05FOW8kbR5dT48J//eISa2fmpYsnM/pWsBySASzaWCT0JcehDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so1786924b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791162107; x=1791766907;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fdVEpuLc49gYIexZsT1JvUl4xyhYy+TwfAKUjkIbHIU=;
        b=MQdfZzr4iLaw71vKFhQhdstTRICUqhBNbo44M7w5Jyw5JAXvMLFE9aqNlNZ32eTY7l
         A1s7u/LUtWA34ILS/zsDMX/uhTWz7kqd9hBH1ZtQGQVIbyir0oJhw4wN7fAtNUdIMNtq
         HBBOL8JkBjUrn5szgj5OD0zhe+Y6Plm3ngQyRAddmPDYTVOZNkS+vob/fR07BEAX3uHV
         2HUnyBUPvLVLBmqLEkb5LemtIYeTng4wBI6K5l4RTKCq0Dv2sU1OybAbkZC272rbiQfD
         gPZQZNijUVd1gT9BXmzI/EWBRji2VtKwJUOaJ5H6vhpejhhHLSCGROn+YNfLw0zh1Fk6
         VqIQ==
X-Gm-Message-State: AFuF++nvffYrygwLvYGdct5LVa0CjgwFS2Y/hWy988Wwkd5ufrnpLzGB
	6sykcQVPoChfkvN4EE3qekfPHMzsrP7YP2Esr5kZcDKHjOIW7cFU/A4e/uyOjpTHbvsRukIW+aR
	OIO+S+fe6u0g6xUdLBWt9COvNM91i8gBD7nFLzKeb1zer5m2y6vboU6SMhiE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6b8e:b0:4e9:3412:14ac with SMTP id
 5614622812f47-4f67a81484dmr5893237b6e.33.1791162106916; Sun, 04 Oct 2026
 18:01:46 -0700 (PDT)
Date: Sun, 04 Oct 2026 18:01:46 -0700
In-Reply-To: <6abae226.69bd487b.a6f8c.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac2f6fa.01314a6c.556a8.000c.GAE@google.com>
Subject: Forwarded: [PATCH] ext4: don't append a directory block already
 mapped in the inode
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] ext4: don't append a directory block already mapped in the inode
Author: adrianox@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
ext4_append() grows a directory by one block.  It checks that the target
logical block is a hole, but a corrupt block bitmap can still make the
allocator hand back a physical block that is already in use by this
inode.  The in-memory copy of a block is keyed by its physical block
number, so the "new" block and that existing one are the same memory;
callers that split a directory (make_indexed_dir()/do_split()) then move
entries between two aliased buffers and corrupt the directory, until a
bogus rec_len read from the middle of a name runs the wipe out of bounds:

  BUG: KASAN: slab-use-after-free in dx_move_dirents [inline]
  Write of size 90458 ...

Reject the block and report the corrupt bitmap instead of corrupting
memory.

Closes: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
---
 fs/ext4/namei.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 3b9740c1c16d..7a0dadf6c5fe 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -83,6 +83,25 @@ static struct buffer_head *ext4_append(handle_t *handle,
 	bh = ext4_bread(handle, inode, *block, EXT4_GET_BLOCKS_CREATE);
 	if (IS_ERR(bh))
 		return bh;
+
+	for (map.m_lblk = 0; map.m_lblk < *block; map.m_lblk += map.m_len) {
+		map.m_len = *block - map.m_lblk;
+		err = ext4_map_blocks(NULL, inode, &map, 0);
+		if (err < 0) {
+			brelse(bh);
+			return ERR_PTR(err);
+		}
+		if (err > 0 && bh->b_blocknr - map.m_pblk < map.m_len) {
+			EXT4_ERROR_INODE(inode,
+					 "new block %llu already mapped",
+					 (unsigned long long)bh->b_blocknr);
+			brelse(bh);
+			return ERR_PTR(-EFSCORRUPTED);
+		}
+		if (map.m_len < 1)
+			map.m_len = 1;
+	}
+
 	inode->i_size += inode->i_sb->s_blocksize;
 	EXT4_I(inode)->i_disksize = inode->i_size;
 	err = ext4_mark_inode_dirty(handle, inode);
-- 
2.51.0

