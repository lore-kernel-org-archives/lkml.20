Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667898;
	b=Weya230Pjr9u4FU3bUCeKN8QIr95SwEMEJccUJtTVTp7R69tiy/2/XyaiUQCd8DNsGb0
	 OwWUzFzbE4plvT3ovuwcZiTXRWtI6UHGX2tqJTQ0tBYm6ccE5/rG8yrwvsdyxiZe0AAJL
	 VZCNo7L4/osXMYEH8qkjXiPNla8uqRZypFs8ZAq8miT9TRwAZaUFyuZR88Ui8UBOOVw6a
	 SfPqcgk3cD4k6wTnE7NPryNYPzuEVlcc6uZqsmFb5I32OCOBAUdcc4/n1IHygLCuw3iqZ
	 LcEXiLRUQp/WXQZ45DCKRvqYY2CsomYyxJHXhr0xw/8eGwcMr4ikDznG8TPHrhosaxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667898;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/UR5Zo0wRKbcij33V62VKJthhxekG8JQTUMaRu26LN8=;
	b=xXeq+7Ue67EQOXVnZ3AZ80QHHrf9FHuqshU3zaVgAGqsUsU3wdcPUWDiK4dKacFtbZfx
	 IwCsgzMMcFpJojnJiy7lhTG8tZ4KsER49zGw0RjCDCen8x96isA8oUc+d2qPtSlEaldZv
	 uzdi2U0zShZHv2E0qomMkkuU4tGZw3jtKWYLqhhUgwMEH3EFqu1ab2jyzYVHYDvjxBqRE
	 aa49yqftWy/bKtXsA+HO5fZ4evSUfR23Zno+ViwE5YQ5qN+1K5HZjYWWFrfr2TL7hz8H8
	 JWOiD32Y/iEKWzaocuc18tg5SZQA4d5HKrjsg8Ds+jKlVDIx3/DdLqOD60WMlzJmISw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XlMsRIe+;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA188606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA188606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XlMsRIe+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=XlMsRIe+kAHy3iG7wBZRz9YecKMvctkjymHtfy14BkDqJ82w0lb8kdCTuwUpRWueB1fwbJClwqLQH
	 5iG+JcLTM22NRn7tfqz5eQVMqT7kZmFYycYZCVQExuflzetfmvZDMXeocgg2snC7LAU3zG+6hI/8T1
	 xoz3erllmb9/bEmo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af8756b4bf-bdf50;
	Sat, 14 Nov 2026 22:51:31 +0800 (CST)
X-RM-TRANSID:2ee36af8756b4bf-bdf50
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af8756f972-477a4;
	Sat, 14 Nov 2026 22:51:31 +0800 (CST)
X-RM-TRANSID:2ee96af8756f972-477a4
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: akpm@linux-foundation.org,
	phillip@squashfs.org.uk
Cc: phillip.lougher@gmail.com,
	squashfs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+5d7ba5f6127ed887f459@syzkaller.appspotmail.com,
	syzbot+0b7a8fb8279a59e8a188@syzkaller.appspotmail.com,
	Aibing Chen <chenaibing@cmss.chinamobile.com>
Subject: [PATCH 2/2] squashfs: return -EIO on out-of-bounds directory entry in lookup
Date: Sat, 14 Nov 2026 22:51:28 +0800
Message-ID: <20261114145128.625-2-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261114145128.625-1-chenaibing@cmss.chinamobile.com>
References: <20261114145128.625-1-chenaibing@cmss.chinamobile.com>
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

The three squashfs_dir_space() bounds checks added to
squashfs_lookup() by commit 5213b0a08263 ("Squashfs: fix variables in
directory code and add more sanity checks") jump to read_failure
without setting err.  err then holds the positive number of bytes
read by the last successful squashfs_read_metadata() (8 for a
directory entry), and squashfs_lookup() returns ERR_PTR(err) with a
positive value, which IS_ERR() does not catch.  The VFS dereferences
the bogus pointer and crashes:

  general protection fault in lookup_open ...
  RIP: lookup_open+0x890/0x16e0 fs/namei.c:4648
  ...
  squashfs_lookup fs/squashfs/namei.c:250 [inline]
  ...

The squashfs_dir_space() checks validate on-disk directory content,
so jump to data_error (which sets err = -EIO), matching the
neighbouring content validation checks.

Reported-by: syzbot+0b7a8fb8279a59e8a188@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0b7a8fb8279a59e8a188
Fixes: 5213b0a08263 ("Squashfs: fix variables in directory code and add more sanity checks")
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 fs/squashfs/namei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 5f8decee2..5dc21ddaf 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -203,7 +203,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 		 * Read directory header.
 		 */
 		if (!squashfs_dir_space(dir, length, sizeof(dirh)))
-			goto read_failure;
+			goto data_error;
 
 		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
 				&offset, sizeof(dirh));
@@ -222,7 +222,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 			 * Read directory entry.
 			 */
 			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
-				goto read_failure;
+				goto data_error;
 
 			err = squashfs_read_metadata(dir->i_sb, dire, &block,
 					&offset, sizeof(*dire));
@@ -237,7 +237,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 				goto data_error;
 
 			if (!squashfs_dir_space(dir, length, size))
-				goto read_failure;
+				goto data_error;
 
 			err = squashfs_read_metadata(dir->i_sb, dire->name,
 					&block, &offset, size);
-- 
2.50.1.windows.1



