Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E872B44E055
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945912; cv=none; b=Lt2ddBUn5tUK2KUoJYgHQCdx1vhp3orfkBmYkkoeDoH/hIbQ4ga9dvaiTrJeeeqXaJDBF3t9WDRTqOolGX2yIZI44JXfe7obplQfyTfuLBPwKrWJFH4J2Vg8ggg3usuTMIrwIm1hBLFBb7EyKe/XqXETahrLxdDk8sxsY2QzJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945912; c=relaxed/simple;
	bh=1s9LkYW9vQaNEwdrxmpU6I56xK42aV+d3NuKHFDK8jI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=awQbcH+0EdsttRt9y2Kvwr2J7lvxQcH2UL+ZrwrBOPnmAvNNwVa8hGX5/HUhZlaxTesncLgj8sE3Wk5Il+o55DGuPV3/hw+bdojZxiTpyj3P9WDcZGFVmwjvwT1ZSSp23w4H6aiSh6BTHxlUtpbIe23pLe/gRcHv4wu23zszKIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45952ce9ee0so2773818fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945910; x=1791550710;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hb8dNc9KXU0CqSWqEu6wVs+/kdzSrCWaupYjrQ0/MKY=;
        b=fnGL1a+ypN33uAR/9ztM4lDDMGfoB4OC0Y2tb6ZB7tA5bSN3LpOUIBB5mm9SfuFZBF
         RCvPJT4ZiPGo65Rco04hlbGWQzTWRh+/7ONaGbuvtVTuTr/HYYiujUVV0ck2ynA8ZHAA
         ZKH4zYr3Gr2LZvw3AVxoFvtGvTwnVcEgFx5ylS4m41ZcshXA7ttpHIY2/lyfkxB+DDF0
         FXD2ERnymJiTNMaeu4l77icxMNyg6q5TbiSEHA1XfuoknX/1R3cAUgdfRDqL/hAj1gIQ
         UzTTySp4mT7uIpA0pcdziGdoGeLvhhxHY68/LeuZm/+Kj6ZvIrkK6b4cUG1gSPbhUqH1
         K+LA==
X-Gm-Message-State: AFuF++nOWN7AmKWWXS50gEhKCzvMg3xiJAA8+8mBGaXqRg9ucLdBcEAD
	RCFbEjPw8lkZIrAFT00HSDtOgnIzU96UUhfcxB3uR6xCMSmEgrDAHGZ52DCreUo/tj8muOcgAHL
	tKXJ0CLCcc83gEFVlmKuydKJXo//iuK/9zVwZtPCPQYgz44RvvH0BKx4fSoI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f14:b0:4c1:f40e:b697 with SMTP id
 5614622812f47-4f52a264fa9mr1941588b6e.38.1790945909836; Fri, 02 Oct 2026
 05:58:29 -0700 (PDT)
Date: Fri, 02 Oct 2026 05:58:29 -0700
In-Reply-To: <6abf0753.eb639fcc.2b981.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfaa75.f32479dd.202a09.0009.GAE@google.com>
Subject: Forwarded: [PATCH] nvme: hold a controller reference while scan_work
 is queued or running
From: syzbot <syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] nvme: hold a controller reference while scan_work is queued or running
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

syzbot reported a slab-use-after-free in nvme_query_zone_info(), called
from the async namespace scan:

  BUG: KASAN: slab-use-after-free in nvme_query_zone_info+0x4fd/0x6f0
  Read of size 4 by task kworker/u8:13
  nvme_query_zone_info
  nvme_update_ns_info_block
  nvme_alloc_ns
  nvme_scan_ns
  async_run_entry_fn

The freed object is the effects log (ctrl->cels) allocated by
nvme_get_effects_log(). It was freed by a write to the sysfs
delete_controller attribute, which dropped the last reference on the
controller via nvme_sysfs_delete() -> put_device() -> nvme_free_ctrl()
-> nvme_free_cels() while the scan was still running.

nvme_scan_work() waits for all of its async scan jobs before it
returns, so the jobs cannot outlive the work. However, nothing keeps the
controller alive while scan_work is pending or running, so the final
controller reference can be dropped underneath it and the effects log is
freed while the scan is still dereferencing it.

Take a controller reference in nvme_queue_scan() when scan_work is
queued, and drop it when nvme_scan_work() finishes. If queue_work()
reports that the work was already pending, drop the extra reference
because the pending instance already owns one. Convert the early returns
in nvme_scan_work() to a common exit so the reference is dropped on
every path.

Reported-by: syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=76c0f0ce8f1e846b4f84
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/nvme/host/core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index beea23d04a70..11599b0061b1 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -165,8 +165,11 @@ void nvme_queue_scan(struct nvme_ctrl *ctrl)
 	/*
 	 * Only new queue scan work when admin and IO queues are both alive
 	 */
-	if (nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE && ctrl->tagset)
-		queue_work(nvme_wq, &ctrl->scan_work);
+	if (nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE && ctrl->tagset) {
+		nvme_get_ctrl(ctrl);
+		if (!queue_work(nvme_wq, &ctrl->scan_work))
+			nvme_put_ctrl(ctrl);
+	}
 }
 
 /*
@@ -4635,7 +4638,7 @@ static void nvme_scan_work(struct work_struct *work)
 
 	/* No tagset on a live ctrl means IO queues could not created */
 	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE || !ctrl->tagset)
-		return;
+		goto out;
 
 	/*
 	 * Identify controller limits can change at controller reset due to
@@ -4648,7 +4651,7 @@ static void nvme_scan_work(struct work_struct *work)
 	if (ret < 0) {
 		dev_warn(ctrl->device,
 			"reading non-mdts-limits failed: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events)) {
@@ -4679,6 +4682,8 @@ static void nvme_scan_work(struct work_struct *work)
 		/* Re-read the ANA log page to not miss updates */
 		queue_work(nvme_wq, &ctrl->ana_work);
 #endif
+out:
+	nvme_put_ctrl(ctrl);
 }
 
 /*
-- 
2.43.0

