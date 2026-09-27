Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D54296BB8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518918; cv=none; b=JeVRIQCbSyFsHw4VHUeNssz95Y/bxFqMrCGMBV1Rj1Vm8HbLfls73CiuWu89CMhCKfciUC/nMZCcReO8zrZ0z9NqeLILQLDNh4lo7mRE7B8e2zFkGZfU1PS/9bYV5FpZ+P8xN96cZN9QbtkDXYARRDwJjs/71aQZOLwRSnl6gQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518918; c=relaxed/simple;
	bh=vauxrNzLOMIwiO1Re8IpcmC+EwRk4l4mAhXEDHqwD7A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s8m9l4UMsd+8Udf8EknGSuk2xK7J9oBTZxgM7wMKldpZc1DJtzgOYsWEUjea5z+GJ31H+tZmlU8s/Id4prM6ILgd8gj5WFZSpGA6TBhthVJRhDq1phFNuaS9axvaSjtgeBBMILrNtyDF3ftdcTP4cM8OphejyeyH6XZFkUXZDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so3968542b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518916; x=1791123716;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4BdoBHm3KTHNIpzLOAflXes9mBs9wwl1foWRCp3lxc=;
        b=CgF0jOnuqRgGs3smRvWxVmYG4mjh9UI/G5Cv6zOdje2hGm6wvLFCooN99+yUoRGEWj
         Ph8FYQX+e78rydROZCyZVvE167kD0jY5n44bEghN2U6KigR1BSoZwpW/aG9Joc0DGwYW
         dzxd4L6beNugnXvOCTn6vw7cizrG0RlfpSaD2G2bRfTx1M0ySF9QuoMJCrlIKfNz5txA
         R6k/WDf5Mm597zyV1/mSGV0YUszY2qlDo/iMoQePjZPO7vdrOKcV4Wr51MBx/BPZ9MTM
         cmHOdka6A9wcXEPF/Dg0d7UN6/Eu5DrDzqVA7x5t3uLQIjzv20RK2GhGgpsbyzjuCykD
         3+Mg==
X-Gm-Message-State: AFuF++nC1accsbqalTsjZ31RSM4m+l+EA3IPOBgU84PjUzxSwcpeV7qm
	dx48p0AkbAn0lcZJTcyEt9o5gQofEGK8ZobFXVK6KTiRvhm/m1UCM7Cqtzqz8KfyzC1AueajL6v
	fnMcr6dVeJioqsvbr724M4f3MV5FV9aiG51jS919X7JxQkqtmH5DT8COm0DY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1493:b0:4b9:e5fa:8905 with SMTP id
 5614622812f47-4d72cd363f4mr10356207b6e.24.1790518916288; Sun, 27 Sep 2026
 07:21:56 -0700 (PDT)
Date: Sun, 27 Sep 2026 07:21:56 -0700
In-Reply-To: <6ab90c6b.dc2998a4.2261f5.0067.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab92684.80e1c6cc.1e8e5f.005c.GAE@google.com>
Subject: Forwarded: [PATCH] Removing double device_put that causes UAF.
From: syzbot <syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Removing double device_put that causes UAF.
Author: nsvatoslav515@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fe2ec83746e5

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
 drivers/media/usb/usbtv/usbtv-video.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index 4f10f6613bc4..8a68bc0aa884 100644
--- a/drivers/media/usb/usbtv/usbtv-core.c
+++ b/drivers/media/usb/usbtv/usbtv-core.c
@@ -112,9 +112,6 @@ static int usbtv_probe(struct usb_interface *intf,
 	return 0;
 
 usbtv_audio_fail:
-	/* we must not free at this point */
-	v4l2_device_get(&usbtv->v4l2_dev);
-	/* this will undo the v4l2_device_get() */
 	usbtv_video_free(usbtv);
 
 usbtv_video_fail:
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 92bc7a2509c3..e2d015483081 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -965,6 +965,4 @@ void usbtv_video_free(struct usbtv *usbtv)
 {
 	vb2_video_unregister_device(&usbtv->vdev);
 	v4l2_device_disconnect(&usbtv->v4l2_dev);
-
-	v4l2_device_put(&usbtv->v4l2_dev);
 }
-- 
2.47.3

