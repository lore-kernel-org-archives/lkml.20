Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB223C2798
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252549; cv=none; b=QnIEejJLtyjNFssUY5lacNC8B+Kr0MhXDHSgFcJgl1RP/NLl8dGWaJRVop40j59DhKf1QBSm6XID/JS1Xnid449OGfBnWEgvCiluuPolXirpFMvZ3+dzJY861UVnUEWAMxsN1CHGWGHL6Pa2wCam7l6gCXpjDFUUd102vaOe+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252549; c=relaxed/simple;
	bh=kxz0ZVx4OtBgC3/cy3BtUJwCl9b4EQQRg2sBtuYmqoE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y9OJbdunnlqAUWaMhFQof6jnINvojyQ98l/nx4dcog46RW/BnTHhPqeDzAYE1BC6H1xBvh1xQsMoG+/aHFImMIpokGY3d+jSqxDJzq5GewLiTyH8yX9yRG+YeXvCjx9xX3WGASI382MBR8gH8ivJaDhWoFoSp9PfKBqa7IpPWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cbff1bc700so1330737b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252546; x=1790857346;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IxAv5/XkwGEKm21pZjBwi4E29x7hd+ioW2vpkfLncmI=;
        b=Qsi0Vti9VNTIj83XHJDe21DWetDwDxeCuvpkqmuv1Tdp9xYGGxtnfmgAz4IiBcL0BX
         A5Y+is7A6G/pzIz1VDN6pOzP7a/Fm2yW6FzZwjO79fUD+Bjnyo71GdVnLTxd7UOIwnti
         b/FdiagWzahdaxQJSNUjNc/E1FBqQI3idl8XZYMBljc/CDwFt/UgEhElYopKzNawkShC
         Oft5evi7YEXLLSzrdYOSxrSVHzqV+20MUmPTTG2cVnBjUefOKoBzlCeAWd8tRrPm6zme
         XuoVwc12e2OPtuUzrVcp/lnEWP4nYEaeqIZiYtoUR351+DzgGv9ZFA/oSn9k7+YoghvX
         i0Hg==
X-Gm-Message-State: AFuF++k4RKzcpMd8HtT7hYWwVRKV7HFtTDzBI4ylctGIN+O5pKRE5wHZ
	xa9/pyXxyFu4TsHqCd5CptIYJd3cmWzGBun5y94hRlCLWdO2fn+lXMyQI9pZpJqALLgxfy0Tt1S
	7R9tmGj6b1/vNWZ2TaESZ2WSAXx00ktPZNh9nHs5dDV1CjC8Sj3wYVrZ2yq0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a9:b0:4d6:92b3:5c85 with SMTP id
 5614622812f47-4d72bc4db85mr2844656b6e.66.1790252546327; Thu, 24 Sep 2026
 05:22:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 05:22:26 -0700
In-Reply-To: <6ab4ae74.80e1c6cc.1e8e5f.000c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab51602.80e1c6cc.1e8e5f.0011.GAE@google.com>
Subject: Forwarded: [PATCH] Testing the patch...
From: syzbot <syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Testing the patch...
Author: nsvatoslav515@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/f2fs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6a2f09c61dcd..b6b32bcbc126 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3934,6 +3934,9 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	blk_opf_t opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH | REQ_FUA;
 	int ret;
 
+	if (unlikely(sbi->log_blocksize < 9))
+		return -EFSCORRUPTED;
+
 	folio_lock(folio);
 	folio_wait_writeback(folio);
 	if (update)
-- 
2.47.3

