Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667898;
	b=ITbSVdwU2TOYn8Sy4ttOeRDyyqRtRBj6qBht1nIssbsaQ0WrHj+97WpoLZ9IMsc5fl0v
	 28mIu33hw/ZH4dryAy3NlE6/+r5bmcBKfUBNcS3E91zfacc7CmDgoXHmSF/ku3RRodrm+
	 irJ3Wz0FCG382HdUQUuPQy/VqFN+XyxDwPQWrq/9Cz2/DQcuYCLpaplzSv+29Co24UpJq
	 KS/B2ZQl+CV4GoGrOanLWETHkpzgEcTrn2YNewG9Ue3ZqHjJZ8g51SPg2EOLDZR/039fI
	 +9/iyBhFIKZ4RYcnQo/1wy1SXOIFs043mb9b2xj+xkCqBmKg5/7LMBbjYqDCCb8Uq4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667898;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nqXpEOe5WPii7d0HWh07KkQcEs6x+2hBhJsqdtr6I5U=;
	b=T2OYVb53tL33/zm/2X+bpsvCw+rGuCYOQvzj+gEcrD1G83HPh4f2rDiFIzCquN+uVag3
	 CCsdTzMP8b62anX/4aYH76uSY0RJnh86hgCpD29g4g0RlrKRNky3X9GgBlqyVEtgZFdz+
	 M6HppRWL9WZXaR3bKBaJsFp2QOeRcSMJ06lPit2T5mIiBYhChfhxokEsFenWmg0zgLwqr
	 tysjhTf7mmQd7JMxjaGEnqNxmZ4J62Nccv92K+H/q8R1loFKtyvgzTDbC1/e2lrM0h+p6
	 vjef3zMIl4ixHq4eKbxq98gwMQJFa4lX01PWV5ijurQUFpmXev5na65fU9ml0693Jkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=uSy6Z8xV;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78976606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78976606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=uSy6Z8xV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=uSy6Z8xV3IUlHFAGI6GkxR2M6HeKji3kylyWHsaQCQyDqzuLJl4PGiakf7fqQkCIrucdk14JdJUWg
	 JnavoYfrsqLRyxykHsl/jak/49LhEexws2KrfJvElYfnlgmHBdOPykYLxwZ1+0h0ngy9UPvsYnUger
	 UxlNPwFl4Ocl1uYU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af87572f20-f747d;
	Sat, 14 Nov 2026 22:51:30 +0800 (CST)
X-RM-TRANSID:2ee96af87572f20-f747d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af8756f972-477a1;
	Sat, 14 Nov 2026 22:51:30 +0800 (CST)
X-RM-TRANSID:2ee96af8756f972-477a1
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: akpm@linux-foundation.org,
	phillip@squashfs.org.uk
Cc: phillip.lougher@gmail.com,
	squashfs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+5d7ba5f6127ed887f459@syzkaller.appspotmail.com,
	syzbot+0b7a8fb8279a59e8a188@syzkaller.appspotmail.com,
	Aibing Chen <chenaibing@cmss.chinamobile.com>
Subject: [PATCH 1/2] squashfs: return -EINVAL on invalid directory inode size
Date: Sat, 14 Nov 2026 22:51:27 +0800
Message-ID: <20261114145128.625-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

Commit 5213b0a08263 ("Squashfs: fix variables in directory code and
add more sanity checks") added validation of directory inode sizes to
squashfs_read_inode(), but the two new "i_size < 3" checks jump to
failed_read without setting err.  At that point err holds the number
of bytes read by squashfs_read_metadata() (32 for a directory inode,
40 for a long directory inode), so squashfs_read_inode() returns a
positive value.

squashfs_iget() wraps that in ERR_PTR(), and IS_ERR() does not catch
positive values, so the VFS happily uses the bogus "inode" pointer
and crashes:

  general protection fault in __d_obtain_alias ...
  RIP: __d_obtain_alias+0x50/0x880 fs/dcache.c:2359
  ...
  squashfs_export_iget fs/squashfs/export.c:117 [inline]
  ...

Return -EINVAL on the two new error paths.

Reported-by: syzbot+5d7ba5f6127ed887f459@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d7ba5f6127ed887f459
Fixes: 5213b0a08263 ("Squashfs: fix variables in directory code and add more sanity checks")
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 fs/squashfs/inode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 5404d7ba6..4cf8a41b5 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -255,8 +255,10 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le16_to_cpu(sqsh_ino->file_size);
-		if (inode->i_size < 3)
+		if (inode->i_size < 3) {
+			err = -EINVAL;
 			goto failed_read;
+		}
 
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
 		inode->i_op = &squashfs_dir_inode_ops;
@@ -284,8 +286,10 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
-		if (inode->i_size < 3)
+		if (inode->i_size < 3) {
+			err = -EINVAL;
 			goto failed_read;
+		}
 
 		xattr_id = le32_to_cpu(sqsh_ino->xattr);
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
-- 
2.50.1.windows.1



