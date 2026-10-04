Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D60423799
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791154906; cv=none; b=QF8gi+x8W5XH4CjuiGSMhwpHZ364UsGWZ+vY7vyza44A6jUti/xH3rl+tVoU8NDEqR2u2l2tkHb4Xf+SW0vwmDpmt8KmKDdWrxMGW0IXeYalbWWa/DtNXKSDwdnPc26zCplglo7Wl+kwATEE7ffRhlwcbcHSOC45chQETNx5FZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791154906; c=relaxed/simple;
	bh=EyO3oeRBUmoI/pfrS1ZG5oNh/3KKLQ88xiDoDHBRq7o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r5FGh6PBiOCJ12cwPJDZdtaB+yuUpxpButhNutPEyS4VD5cvQUeVNs7g+dHMVTYugwvw63bQfRtuZeUWk+TJgtjZErJgHHl3LyQaWuzOENU6RaWXWQ58zjkA5BH7g02Jl1KeDNz/LEtA3bSswUFxL1rCz9kCtq/iCRcxM/6cd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45952ce9ee0so1890544fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791154903; x=1791759703;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRZiSsGCPBHY5iNlwkWqI6CHWkz6o0mQDkTyv9tVARQ=;
        b=VTHCl8dM9giNhr/rWUHkdKuF19GN590BNsidJtDXlcoEKeQiesyP2wsLleq8xrA4Uf
         5mz6kZB92LWRUYdYeZHYEdHeGXqerelRhqzOFkTjYMbu7Q9HLMWYRYIvbDOTD9PNpuvd
         DEJnXSikOVDnJijM3PJtnmrUKPCa7973Vx3x04YO4z57rFIIcUH4znov8qu+jZeS4EFh
         dXemFJ+ywjcYQlmBhrXbrIYWE+o/ZKdHmG8mCxWcGEhezQNh4z/xmNx5ysQPBDfM1Xgn
         RSSG7OUuvsSZdv4rqFbdJq7e7mRnK1lB08W6dZltRC0DkpV7jfkCvzEBbueDkVeeNfir
         26hQ==
X-Gm-Message-State: AFuF++lAyxYvnDF6FO9uO3HG28TDZmJ7FBTLDZVvOpya0SaFIt5Bi2w9
	f70zLYbcHdMGvjM5P0oVqWBUiv0EK8OQiDR5uixeZq6EH1AozgEz/O1MMVsVgDvN6MqvHJg2wXs
	YZfGnKhiID8nsVCXqI3EkPp9afCsoL5BcMUZLOJwl2AFGbeQB0myUqtGO68Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1811:b0:4d6:92b3:5c88 with SMTP id
 5614622812f47-4f52b1aa8e6mr9255980b6e.64.1791154903492; Sun, 04 Oct 2026
 16:01:43 -0700 (PDT)
Date: Sun, 04 Oct 2026 16:01:43 -0700
In-Reply-To: <6abae226.69bd487b.a6f8c.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac2dad7.9ad129c8.3858c0.0038.GAE@google.com>
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

#syz test: upstream 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
---
 fs/ext4/namei.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 3b9740c1c16d..ff6013306b74 100644
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
+		if (err < 0)
+			goto out;
+		if (err == 0) {
+			map.m_len = 1;
+			continue;
+		}
+		if (unlikely(map.m_pblk == bh->b_blocknr)) {
+			EXT4_ERROR_INODE(inode,
+					 "new block %llu already mapped",
+					 (unsigned long long)bh->b_blocknr);
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+	}
+
 	inode->i_size += inode->i_sb->s_blocksize;
 	EXT4_I(inode)->i_disksize = inode->i_size;
 	err = ext4_mark_inode_dirty(handle, inode);
-- 
2.51.0

