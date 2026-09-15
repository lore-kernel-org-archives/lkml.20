Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E6DDA9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444208; cv=none; b=NLIYw5qzEjmrJwTwKpEBf+i+K7bRxx6ihd8RuEdw5a9uPmPPdkX2acIMZeAG5fWm+pLZ7Rp0dC5e/4tLQvJlM/7Upqa/gkRhD7b4GdFO3mJq+NjPMdaTm/DSNIWc8LajNi49aKGUu7Nl/NziDI0tXKWXG6S8AcVKwxlN5htdY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444208; c=relaxed/simple;
	bh=DkoNg+HaOndkUqIQPn3lPOv3doq9WypDqs2RfWCFGuI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bkyXc1mxGp3eHa4CSiZSuBFHNprSS2IowHTAvRj/1WbMvpxF9addjvJnEx7swt8ETbBqw8LQm9sM89sHuRFR9PlLl31hoj3hAWaLggk/DrHc8MYB3JQ+Htj2cK/+rJ20T4fZ094LgTwnO5HQs1sWhVa15BZ1RiELmDv4jexaqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-809f1af7992so332191a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444205; x=1790049005;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aFkC2X45feQmNksHSi4o4XPM5edOXFp23RgngOHP3iY=;
        b=BWqAGl5L3R5v1jWh2tHPmzbsNMfeKVFYtRK5MJyEnP6qzijk5Bu7+lJ0Wnw5PpbfJL
         F1ax1Y5tX0VARuiV3VD5/NOGvtXw5dI75XPyfbi//oufGFmdTEnQ0Vn35DmSla+8yp7I
         DvU8YU1U0b4XoLADQHAJupvZZdK6ZAcSVpSG0Npko0LirEPUC3AfzCDq/OUHLan/68B+
         EZVvv2VItZqPIp2qWXzjzAkT7mENyezytifN8F4bGNwAcM8311iWIr+pX2Ymlymqbtyc
         rvwGSsvOKSRHiwfY5ky2H6yN636DWyLWMuwDXZNqxew+IAgpIR/ne7pncJh8Px4h2EDB
         bLTw==
X-Gm-Message-State: AFuF++mB7G5Kws4uk1DduW7JM4qyvbhbrTlESgn3OtLpcXg4rsmu8Qr3
	a8Ojqn1aPk2lV2IwazXfEWuCvH+N34R35PZDqWBmvbJHtLs5AqkNwHQ6yZ/tAJw3y+4HlOQdN43
	ql11wvLf2uqNXHK1YjIe0leAn0QHc01uQWLmrOzQDxzQTgn8Y/zThD3Glyro=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id
 006d021491bc7-6c53fe8437emr3268854eaf.24.1789444205440; Mon, 14 Sep 2026
 20:50:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 20:50:05 -0700
In-Reply-To: <6aa82301.a211d2ce.1a5198.0297.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8c06d.4c28b7d0.c1bba.0030.GAE@google.com>
Subject: Forwarded: [PATCH] ext4: add bounds check for e_value_offs in ext4_read_inline_data
From: syzbot <syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] ext4: add bounds check for e_value_offs in ext4_read_inline_data
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


ext4_read_inline_data() reads the location of an inline data xattr
value directly from entry->e_value_offs without validating it against
the actual bounds of the inode's xattr area. A corrupted filesystem
image can set e_value_offs to an out-of-range value, causing the
subsequent memcpy() to read from an address far outside the inode
buffer, including memory that has already been freed and reused for
something else. This mirrors the check already performed in
ext4_xattr_ibody_get(), which is missing here.

Add a bounds check on the computed source pointer against the end of
the inode's xattr area before the memcpy, and reject the read with
-EFSCORRUPTED if it would go out of bounds.

Reported-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=085a394c92518a04fd09
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ext4/inline.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index ceee69a66482..2e60ab3e0db5 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -187,6 +187,8 @@ static int ext4_read_inline_data(struct inode *inode, void *buffer,
 	struct ext4_xattr_ibody_header *header;
 	int cp_len = 0;
 	struct ext4_inode *raw_inode;
+	void *end, *p;
+	u16 offset;
 
 	if (!len)
 		return 0;
@@ -205,13 +207,21 @@ static int ext4_read_inline_data(struct inode *inode, void *buffer,
 		goto out;
 
 	header = IHDR(inode, raw_inode);
+	end = ITAIL(inode, raw_inode);
 	entry = (struct ext4_xattr_entry *)((void *)raw_inode +
 					    EXT4_I(inode)->i_inline_off);
 	len = min_t(unsigned int, len,
 		    (unsigned int)le32_to_cpu(entry->e_value_size));
 
-	memcpy(buffer,
-	       (void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs), len);
+	offset = le16_to_cpu(entry->e_value_offs);
+	p = (void *)IFIRST(header) + offset;
+
+	if (unlikely(p + len > end)) {
+		EXT4_ERROR_INODE(inode, "corrupt inline xattr entry");
+		return -EFSCORRUPTED;
+	}
+
+	memcpy(buffer, p, len);
 	cp_len += len;
 
 out:
-- 
2.43.0

