Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45BB3B2D1D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139791; cv=none; b=fPjNZejqVZB2DmsZxFrcS/Z7B3IobiSE6XGdpjWM5TsZRXiroj/LcwEIiLs1QI3q5tcNORU6Ba9CBNzx7oFL1ieLx6YhvzzDabPMfvuKpC0J+roNRjwVmFdUFT7i3TxdKgUhLZe/qF3IVXD8HpR8ijDWm19MwLzCyQG8NnbILm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139791; c=relaxed/simple;
	bh=po65zdFYPwoHUlkxrVX+b3Vxf+wj0DyAJoJuTxSbsL8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EzzincdlogMxdgMN3V8tCGPUXsGUw1cf05rMv15dbHXb5ZFQQGAsGNjWQmZ0eE6PtEoyPNLPqLOvn9vwSnAiQjv7lciIT+6GuRQ9cW+Fuaipj5gt7ILxd8rw1Xhe9zHXlCYlQV8iMwAtQaLHxPX+LWpeaemZCnH0hUev8IWUiE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo1750946b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139788; x=1791744588;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rM9Jdr2NIj67QFlZvW5sEqCymL1dGYeztpEEl7ctUbM=;
        b=PPUazo0t+5A0YewGENdEvzZhu/7z8r7+K/OK4bebNg/uueztaDlt4DA72odumHEGdD
         j3feDylIvQHXGFszFFe0yY6BwhMMfoIdKkQIqZkHsfZgDUDKfadUsOUZLy4Mv8ewBgPg
         KXdMxx9wr0i0K9bs1VjdyW9XcfoA/JwaJSTpZiA2RlMbyYLgU6sjSSspIPIPOyBPOxZe
         YAtNsF66fWGN9vXKPg4pTqOo7tdqfItNA5G8D1M3iRQQYPsK4Xib7j/f1j0VBEdborW1
         5Qbscewb2sDBO1Ool715zpUaigxcBDqpOrg5wbFXhU/4Dq2+ATSosP8gUP7PaEItS9YA
         OFoQ==
X-Gm-Message-State: AFuF++mNijUQYMjO7UpsEU9ecQjLGAoD2uAlwZuWSuwS5MRxXBHDtQp2
	Eco58apNFSB82Syldy90rGZ7orUpBfjRc075VC9lzYSvsILvBzc8UmaEDhi1SpEVyKjyPAevhv3
	bAgVrM6FYyYpDt7HErgh8UPeD8Pf5G0tWB1SJJdLnvKbAnKKFqUbMLduVegg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a8:b0:4d6:9133:cfdd with SMTP id
 5614622812f47-4f30a84b09amr10970745b6e.34.1791139788651; Sun, 04 Oct 2026
 11:49:48 -0700 (PDT)
Date: Sun, 04 Oct 2026 11:49:48 -0700
In-Reply-To: <6abae226.69bd487b.a6f8c.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac29fcc.01314a6c.556a8.0008.GAE@google.com>
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

#syz test: upstream master
---
 fs/ext4/namei.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 3b9740c1c16d..7b356baf7bd4 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -83,6 +83,36 @@ static struct buffer_head *ext4_append(handle_t *handle,
 	bh = ext4_bread(handle, inode, *block, EXT4_GET_BLOCKS_CREATE);
 	if (IS_ERR(bh))
 		return bh;
+
+	/*
+	 * The logical block was a hole, but a corrupt block bitmap can make
+	 * the allocator hand out a physical block that is already in use,
+	 * possibly by another block of this very inode.  Callers such as
+	 * do_split()/make_indexed_dir() assume the newly appended block is
+	 * distinct from the blocks they are about to modify; if it aliases
+	 * one of them, moving directory entries between the two buffers
+	 * corrupts the directory.  Make sure the new block is not already
+	 * mapped by this inode.
+	 */
+	for (map.m_lblk = 0; map.m_lblk < *block; ) {
+		map.m_len = *block - map.m_lblk;
+		err = ext4_map_blocks(NULL, inode, &map, 0);
+		if (err < 0)
+			goto out;
+		if (err == 0) {
+			map.m_lblk++;
+			continue;
+		}
+		if (unlikely(map.m_pblk == bh->b_blocknr)) {
+			EXT4_ERROR_INODE(inode,
+					 "new block %llu already mapped",
+					 (unsigned long long)bh->b_blocknr);
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+		map.m_lblk += map.m_len;
+	}
+
 	inode->i_size += inode->i_sb->s_blocksize;
 	EXT4_I(inode)->i_disksize = inode->i_size;
 	err = ext4_mark_inode_dirty(handle, inode);
-- 
2.51.0

