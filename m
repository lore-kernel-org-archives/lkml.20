Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD393D3D19
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529482; cv=none; b=mArp2CbW+C+AsQOksPnaV3nHQ4QS/FxbQaJfiDlBd/uHkOXdo5tMQuC1aVr9m6alRiCkwgBUFTFRomOe2M4vqI3rQxnxsFTz8mF3pvYnmylWc9hAARVTyla0SaiNDS1MaT4DC2xBtRAzZxRpp34NdvOH6TC0P3bdV7/t9zBXCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529482; c=relaxed/simple;
	bh=z8yqyyZgY8fkyRX65S/LpaI2d9p7yRmeupNb4mFISNM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k6xDEB80dilt/9rpLGfshP6eV4mSlXTvl1Ak8LEa9MX0pq+4E+pYfQKPvCRd6GgSEuIFThCrgt8lPGMwBef52AtDRLQbuzMuNXkokvRm81Ijvg1dxoDwmxtKqLCPfuJbeyi/HqEQTugKqLh9xGZhlIacmJvga/dk7fR/t9dhZfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e2db9914so2423431a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529479; x=1789134279;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NOFwNnSpLt9n1vhB2CCVqsZ1zfEjeSdXRDAyEzBZtpo=;
        b=aWGygJO5aTRZir7cVCBVfuZyath2atdO/bIw62E2RcOt9q/lB4UYQTnOE8mfnflz+T
         AyoFAkFV0T15mH8q5YpW9+Ad8O4P2Mp8j5GmLQhzL4OjI9xFogxS0q48f8JXR5SJSaqF
         dh1SgkyxyknJfkZARBQIFT7L+H2CPm1ZDICGFQBmWZcEc8KRVN0sv8qnL34Vzcj+2ahN
         8cRsWW5SGGpMUfePSTYw1G7hLFxwo4lI2EN2XSqVV3ob1wp0FBo7KT83VPNEsqTUdCg3
         t4qsMioUwnWn56aVCtUMEAqdEPtPyXX+aUyQpQ3qIgPdjqcq5wcoW99c8jeIeAn1hRuA
         HKKg==
X-Gm-Message-State: AFuF++llfIwrcLRmR+rYoo92+9U2y+SlM6uH6ZLQRz9jyJAVochmr6uW
	OiguIz7yvdy7TsvS2KIOL4K9mYWsb60xEcTm2BV2xpaUnqlxsgSXVu4SVo9pG2CkTEx7h7uiUUO
	6GDxXjYBwSlex0M7yNbJQoDBASGtU48pVtD1y/t87bzG1P4bbhUcJj5ewDn0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:61d:b0:6b1:9b72:213c with SMTP id
 006d021491bc7-6b582a61f27mr5600340eaf.3.1788529479727; Fri, 04 Sep 2026
 06:44:39 -0700 (PDT)
Date: Fri, 04 Sep 2026 06:44:39 -0700
In-Reply-To: <6a8ce445.dbb3a75c.7844.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9acb47.c31bd8f4.21fd18.0002.GAE@google.com>
Subject: Forwarded: [PATCH] usb: gadget: inode: keep ep_data alive via the ep
 inode reference
From: syzbot <syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] usb: gadget: inode: keep ep_data alive via the ep inode reference
Author: adrianox@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
---
 drivers/usb/gadget/legacy/inode.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index db961aaa3740..dc0cba86cf30 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1626,6 +1626,16 @@ static int activate_ep_files (struct dev_data *dev)
 		if (!data->req)
 			goto enomem1;
 
+		/*
+		 * The inode created below references this ep_data through
+		 * ->i_private and gadgetfs_evict_inode() releases it again.
+		 * Without this the inode could outlive the ep_data and a
+		 * concurrent openat() -> ep_open() would dereference freed
+		 * memory (reported as a slab-use-after-free in the mutex fast
+		 * path).  Keep the object alive for as long as any inode points
+		 * to it.
+		 */
+		get_ep(data);
 		err = gadgetfs_create_file (dev->sb, data->name,
 				data, &ep_io_operations);
 		if (err)
@@ -2015,9 +2025,25 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	return 0;
 }
 
+static void gadgetfs_evict_inode(struct inode *inode)
+{
+	/*
+	 * EP file inodes keep their struct ep_data alive through ->i_private;
+	 * drop that reference when the inode finally goes away.  This closes
+	 * the ep_open() vs. gadgetfs_unbind()/destroy_ep_files() race where
+	 * the ep_data was freed while an inode still pointed to it.
+	 */
+	if (inode->i_fop == &ep_io_operations)
+		put_ep(inode->i_private);
+
+	truncate_inode_pages_final(&inode->i_data);
+	clear_inode(inode);
+}
+
 static const struct super_operations gadget_fs_operations = {
 	.statfs =	simple_statfs,
 	.drop_inode =	inode_just_drop,
+	.evict_inode =	gadgetfs_evict_inode,
 };
 
 static int
-- 
2.51.0

