Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C43CCFC3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514468; cv=none; b=djdu0ScXmkFMv9JnNIqoQI7PBnBjtm8YZ1vi5YShpdgg/tE/zhWD9D5MBVP4V7egT03bv7sl3X1Z/J6P0zR4GS6QfXteH2L5MXrdi1hrud3DpsI64v++Wkoce7/UOiKW/M2Hplvpzq9+KeMzE/ND3JbjJvfeDhJp9hw68jlD3dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514468; c=relaxed/simple;
	bh=1uiG0hCYE+z7l383p+gzPYX4rP0Xm59TyzGU+LUo/go=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QUVVj6LQR/xj+hhN9xY2nXscyIRzRc4JhAZBnJD31/OctbfqLrQFzm1s01w76K8/EMMFKZAX66GDZn8D5BdzE1Fe4Xc74C21Km2p7lHk6CuX9Vpgt6x6WdxKno/FHboCADaSMv6VAIY4ywxAxvsmR4teSP4a6kQQVssue8HkKVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so4253979b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790514466; x=1791119266;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k/J+DlpS5Ec8nlKW9XpExUuS4z2T3hRM8foEp6+Ax6s=;
        b=sr0FOKtrEMKhIEv5DkKAU6S1FaOVRGzZ+frcS0dfOklakC6clozRiS9sH+1o+4REey
         iBx+pT9VlDbWfeAVaNnNIzD3kSb3Wl2fEIA8lHe0Mv4dlFl74wsM8jknRYKOB1LV9s+9
         dPcPFkSHPILTkkqfZ/3G9DNv1yJJykdEbqzWHPpYXY/glBZY6QQxcShap/UaOlNvKg7B
         PgsAFis41Pyf8Oxjhrsvg7Ge1lJJNqIoXiorx8/7HPPeURtHzfaOo/1D3wN1CZmsUWm+
         6p/ayNbqaeqmcvZzsB96cDv1YCXF4U5uCivW4AFRCU2oRQVBe163+RdffCLmzPZOKN86
         7ZRQ==
X-Gm-Message-State: AFuF++lmVqku3buWYDH4FVChvYpWQ7UCoAPmTL+5BaDW/X614q8TOBiI
	0Da+LPPl+xuCZUSh8W3LeHowwz+qfcjuTndbV6VGdpN9rRjZL2Ac1+HEBZgWxO34bIa0swW9utW
	WPduVa7ABnUFa5PMpeRCBu5ARoy47JBCWY8qvGXzJP6vKttmff9H0T6+7E9Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c48:b0:4d6:90f4:48ab with SMTP id
 5614622812f47-4d72e66505dmr10526667b6e.45.1790514465937; Sun, 27 Sep 2026
 06:07:45 -0700 (PDT)
Date: Sun, 27 Sep 2026 06:07:45 -0700
In-Reply-To: <6ab10ffa.a6af0033.177e91.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab91521.80e1c6cc.1e8e5f.0059.GAE@google.com>
Subject: Forwarded: [PATCH] Test for a forgotten shrink_stripes in the grow_stripes.
From: syzbot <syzbot+6a132745caefcf42cb0d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Test for a forgotten shrink_stripes in the grow_stripes.
Author: nsvatoslav515@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6812ce4e4379

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/md/raid5.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index b91545ce090d..326409ca0cfb 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * raid5.c : Multiple Devices driver for Linux
  *	   Copyright (C) 1996, 1997 Ingo Molnar, Miguel de Icaza, Gadi Oxman
@@ -2441,9 +2441,12 @@ static int grow_stripes(struct r5conf *conf, int num)
 	conf->pool_size = devs;
 	while (num--)
 		if (!grow_one_stripe(conf, GFP_KERNEL))
-			return 1;
+			goto err;
 
 	return 0;
+err:
+	shrink_stripes(conf);
+	return 1;
 }
 
 /**
-- 
2.47.3

