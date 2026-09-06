Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C75B27281E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788683291; cv=none; b=d01zMSbpLlz3kb3ivQ1XTwW91IU0unvGkaVzaPUedGUNcHnHnuaqgk8EaGQMAd7Ap1vnO0zUZT6r8cGu7q/JSNeQ2w3dsGSQPGiTCgDh73OG1NHtqXl1IF2gLGn/IcnXWdWUUzI73DCxRbz9DaffvT1Di9tU3l0l/pTQCwmW6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788683291; c=relaxed/simple;
	bh=5Sxvof6nlYdhNXhbZyf4F1nu5WBYNv6ynlacffsq2G8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KqnpdrSvtK2Obp1a7LF991orSFrO6ie+BFYhSH1F3VnwxCa+fuFWuWLdtHkF3QOunO86Z6/whjim47Yt8VpayGRATJrjoWsGNGtBzQv767UqEjqMiWYcUtiSqa42GuDP7GMV/EWLBzDbjYFvgtGhE5ngFsouAmZ8TzrUluDEDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b61f13c147so2401132eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 01:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788683289; x=1789288089;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bm1WN/NnQbBnDyRKbdfNFryRgTakkXEts7/9U4FzqN0=;
        b=jSAxG5ruGcoK2G9q59nL5bE5ZO6nlAqSNOGLwCgYrQCHZVk6rL+wafcivhtCUjyIba
         /PpzX9Bhp7e4klMJemvkBGVcVfw5/LEH182NHkRtVmmHoWZ6oZDU5xGXMZWCmIaltELT
         HMUw1qpieE6tiA5ymQARMMl83M/SIYgaolk9+97qD+x+iJsAsyTMqJJyn7POMY31cINS
         gmY1xgl7YBIT45AuSH4z6vtD7H5TgJCmBg4Va+IhAJBYWxfzes9JuIW9+u1YMDgNygbe
         je/lZW9j4rQi7heeZvZutcysDTmXI6h0bUdArIlUAI29mz+WDlRLOWljO9V2O53tBJf9
         eKRg==
X-Gm-Message-State: AFuF++lEpN0ZfqK0glMvZ7A6tiCLTPRd9/iz0guoAPTmbsUsP9cGtIaK
	TZ7mQT2YAGvYWb7DAT2/3uOZ661TyfKmfdndVy2sx+83YHoBxfFBKJDnCFkCafgmDCq2/qv0siK
	bdxH6YHcYEpitahugjVD9Lq+rOVmcq87Z0LNG3mlCcWI5Tz6ek+3a1IPPr2g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f05:b0:6b1:62fd:3b4d with SMTP id
 006d021491bc7-6b6fcfdba21mr16913584eaf.21.1788683289007; Sun, 06 Sep 2026
 01:28:09 -0700 (PDT)
Date: Sun, 06 Sep 2026 01:28:08 -0700
In-Reply-To: <6a9acfb3.d07ac993.c20e9.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9d2418.0a3344eb.391530.001f.GAE@google.com>
Subject: Forwarded: [PATCH] xfs: take hm->lock around __xfs_healthmon_insert() callers
From: syzbot <syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] xfs: take hm->lock around __xfs_healthmon_insert() callers
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master


__xfs_healthmon_insert() asserts that hm->lock is held, but both of
its callers invoked it without the lock held:

 - xfs_ioc_health_monitor() inserted the initial RUNNING event right
   after allocating hm, before ever taking the lock.
 - xfs_healthmon_unmount() inserted the UNMOUNT event on an already
   published, shared hm without locking it, racing against
   concurrent event producers on the same monitor.

Take hm->lock around both calls.

Reported-by: syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ccdf3469f5f653bff7ac
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/xfs/xfs_healthmon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/xfs/xfs_healthmon.c b/fs/xfs/xfs_healthmon.c
index 4521ffdab9f1..762f4ce820c8 100644
--- a/fs/xfs/xfs_healthmon.c
+++ b/fs/xfs/xfs_healthmon.c
@@ -415,8 +415,10 @@ xfs_healthmon_unmount(
 	 * There's nothing actionable for userspace after an unmount.  Once
 	 * we've inserted the unmount event, hm no longer owns that event.
 	 */
+	mutex_lock(&hm->lock);
 	__xfs_healthmon_insert(hm, hm->unmount_event);
 	hm->unmount_event = NULL;
+	mutex_unlock(&hm->lock);
 
 	xfs_healthmon_detach(hm);
 	xfs_healthmon_put(hm);
@@ -1213,7 +1215,9 @@ xfs_ioc_health_monitor(
 	}
 	running_event->type = XFS_HEALTHMON_RUNNING;
 	running_event->domain = XFS_HEALTHMON_MOUNT;
+	mutex_lock(&hm->lock);
 	__xfs_healthmon_insert(hm, running_event);
+	mutex_unlock(&hm->lock);
 
 	/*
 	 * Preallocate the unmount event so that we can't fail to notify the
-- 
2.43.0

