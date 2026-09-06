Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9533168EE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695341; cv=none; b=iQaGo+rwXsDQ96agQo9lxqf6FkznVYNVbeJpYkuf3P632rJYvxAN4AzZ2SV2vIoQlb1m+dSP9vSsf3l660PjAja1OA106/pQ6BBR45jYDWsYO+vQRPnjOgAtDPlSAdCAe1EGhD/ba9J2vKzE60Sv+EQRVOAUn8HwCiQ5JDi8E+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695341; c=relaxed/simple;
	bh=K2il0CuebfjhnryGF+aHB56eES5sLu1xkmiT9gIEIN4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EYILSb3gSVz5ckrRbMbfFeSumu6FvUkQssUSb/ePQZ/Qx5ODMZcovDMjDxC9XWZqkGXjQ64cInJK48b4VWYJTcTSWk0wJkUgjvcwxIOI6OYPiJUahuD8l+TQNbNQkonzi+6SX4rDSJso4lQRZqFvMGR1zaIHzr1rTQ4VB2tuVvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-49d4cb3ca23so3249161b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788695338; x=1789300138;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9zOiWFhTrDYVPNRGJXGgFV73G2VQZWvIz+SdJAnVCLc=;
        b=VgxjkhHI/9CzTO7YmIAry+bCcPHxEXFIqc50nm4f7OAhmrriQyNU/C2q14jq+9FClt
         GwsNiRwi53oWsPYYnrjg0JfYneO7VMg8V+yiw8oDktZ2jtYi79xfzXXxXgfBMwL12GRy
         v8FQA2Qy4X3x78wdC+3Vm4uJoHuKNg8ckGZSVFkwR2pch270oeB5JFN7ve3hYyJAP8eD
         5VYyIlgG9heBvcISTC6WFG2yD0dirOUI4jwH4zbbBw5MMZnO5zNLGL0MQFeIDAvz1N4G
         0i2CvkKzX5ux83FKWkYVlcIXtDW6FsxHFXGK8C+vQWSmYxHy5zFz/Mqbpnr0EBdiv5sW
         ByfA==
X-Gm-Message-State: AFuF++kkuf17GtNazKTzy21VHJ5naVL8ENLbmR1qXpBca+he6/1kjy0V
	DQ2NEmyqpDFRhvFBA23sLvys6iEXiMBgXKfoTrlKLKRUqmkhBPT33ltOb1pPHUiTgXCqhATjhUP
	V9G2ZRC84wmtQyoFaAAQNKUeXoEmVa8nI5NqylYMWkp7609sZ5Njse1sNMdU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:821:b0:6b1:ab9c:3ef4 with SMTP id
 006d021491bc7-6b6fd9c7a7bmr14787004eaf.27.1788695338727; Sun, 06 Sep 2026
 04:48:58 -0700 (PDT)
Date: Sun, 06 Sep 2026 04:48:58 -0700
In-Reply-To: <6a9acfb3.d07ac993.c20e9.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9d532a.4a487d73.3c8564.0019.GAE@google.com>
Subject: Forwarded: [PATCH] xfs: take hm->lock in xfs_ioc_health_monitor()
 before insert
From: syzbot <syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] xfs: take hm->lock in xfs_ioc_health_monitor() before insert
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

__xfs_healthmon_insert() asserts that hm->lock is held
(lockdep_assert_held), but xfs_ioc_health_monitor() called it right
after allocating hm, before ever taking the lock, triggering a
lockdep warning.

Take hm->lock around the call.

Reported-by: syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ccdf3469f5f653bff7ac
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/xfs/xfs_healthmon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_healthmon.c b/fs/xfs/xfs_healthmon.c
index 3ae5f4496ad1..2f762f90d329 100644
--- a/fs/xfs/xfs_healthmon.c
+++ b/fs/xfs/xfs_healthmon.c
@@ -1219,7 +1219,9 @@ xfs_ioc_health_monitor(
 	}
 	running_event->type = XFS_HEALTHMON_RUNNING;
 	running_event->domain = XFS_HEALTHMON_MOUNT;
+	mutex_lock(&hm->lock);
 	__xfs_healthmon_insert(hm, running_event);
+	mutex_unlock(&hm->lock);
 
 	/*
 	 * Preallocate the unmount event so that we can't fail to notify the
-- 
2.34.1

