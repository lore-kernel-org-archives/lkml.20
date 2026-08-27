Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5B39B944
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818578; cv=none; b=jn2xhfnJuqy6hxs/4Q5iDnbP9NY0FaLjCcGFg1BXq7l3p67gEIDd1SOPTUilM8jmBjPZZaMpxeTZKkILn/zBVQIQJ/WkHVqKrreQHRTqEIVYXnXhrklEHo5CO+s4u16+fCUHIeuk5aHel+qWUxlmwgn13jW4OUK/3Y1q/evQ90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818578; c=relaxed/simple;
	bh=LLhO6xO3L0lr/TcdxyMjv81N5Ls8qLgzDqnVOkE/Aeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xo+mo0c3MYqb4jPD/jiBzON1uuc4HMfA2LBMCBNXUNRmGraMdI6VS13rSSIRwpncZONGiO82tLjb/WrwOA50NVW58znSlCscPci6L+7Qq9WmF5uir6psHz1aIltnTZ2LXroC/czVk+C2run/2tX5aJ6gDieqOiMYGZ2gD9UUUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=x4Ofk3zD; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="x4Ofk3zD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787818571;
	bh=kT75deHrQNivcxQKvwKIQBFSoYBAdgBUeiDDlopA/Dc=;
	h=From:Subject:Date:Message-ID;
	b=x4Ofk3zDDYDp1WrheADnfAHJpeObjzGEJeLJ3tu4o1GgLnwIYjNs5jtetWV1ZzHh7
	 gJDhbztLaQ7r7UCY63FTbxc2Zfptn5XOgSL1ieY9W1kDexONS9acEJX2RF+7OIIP8J
	 04isgwMtegoLqrmWacsBsCaf+mD016D9EQc0Rw50=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A8FF23C00003284; Thu, 27 Aug 2026 16:15:58 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8625804456958
X-SMAIL-UIID: B3195A0363A04757A64C88D0CF48BB39-20260827-161558-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/ntfs3: Refine the ni cleanup
Date: Thu, 27 Aug 2026 16:15:56 +0800
Message-ID: <20260827081556.168390-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a8fcbe6.4d659fcc.734b4.000a.GAE@google.com>
References: <6a8fcbe6.4d659fcc.734b4.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@qq.com>

A failure to create a new inode triggered an issue [1] during inode
reclamation because ni->base had not been initialized.

Initialize ni->base earlier to ensure it can be reclaimed correctly.

[1]
KASAN: null-ptr-deref in range [0x0000000000000210-0x0000000000000217]
RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
Call Trace:
 ni_clear+0x5d/0x630 fs/ntfs3/frecord.c:110
 evict+0x624/0xb50 fs/inode.c:822
 ntfs_new_inode+0x8c/0x120 fs/ntfs3/fsntfs.c:1719
 ntfs_create_inode+0x6e7/0x3420 fs/ntfs3/inode.c:1520
 ntfs_mkdir+0x37/0x50 fs/ntfs3/namei.c:234

Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
Tested-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/fsntfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 97c04ab2763a..e439ba59d999 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1700,6 +1700,7 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
 		return ERR_PTR(-ENOMEM);
 
 	ni = ntfs_i(inode);
+	ni->base = ni;
 
 	err = mi_format_new(&ni->mi, sbi, rno, flag, false);
 	if (err)
@@ -1711,8 +1712,6 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
 		goto out;
 	}
 
-	ni->base = ni;
-
 out:
 	if (err) {
 		make_bad_inode(inode);
-- 
2.43.0

