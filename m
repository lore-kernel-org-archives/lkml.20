Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901CD335067
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522426; cv=none; b=rMnqmfQ0iZJ2xRl57nVOLtQ6bX6MVBDsEjHD9O4TH+REd7q/LjtMgTleDriZoFcVCrdLjHOYGU9tN8sEK1V+Akpl4VAHy33tv0CJXv0jtCBHG+firyUkWc/U2blZ9YGWrERdBp6FmJkzbTz7CHp5TFDFymkhGFcn/9gOS2rstbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522426; c=relaxed/simple;
	bh=bbcYtrsZdgAJBd7s23kX2yvcRrKr+oIlf6xIFrThP+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DdCC950vD1AIpFKLm9aUC2C2skcmTqrqJGl9C4jGBTuM4ec1/m+CNX7mHVA6niH1EuY/niKCTzsgQRBdsUPPbF0sPtHHUsESfgxB/uXj6zgIAYpmfr3XAACyCccOggsRMK13Ia85oOVekTeVSjMjESH7aNtBf7L+n0VRylt0D0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80621874eb7so3513070a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790522423; x=1791127223;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOe7dzjhv5AxrhP8S7fKSgBVobFx9NWFYPd+qsm7hHA=;
        b=lxnnSBH7XPJmVMLAUva5KJgYbHfJp5pc0eCgX9YmEJsi51WMf+QPEUDh1jpnTXKK7T
         zJStK3Uo4BQMpo7dDrI3UlrzJgziCONIr0fvCUKIvsZbi850BcCUXKNGHMN5q+RUJDWL
         s6UcTqDB8emNCvqPBH31sMTO2G9apoh8dVCR2L/g0vKqMoNu26k860mhhSmmoGlabCgF
         iX12UITVEogaWHCc1Zzyn920X62pj6i6vnQBSIXedmnwA4zSHudYcbfWgimVYYnTQwR8
         0MrZM06ut4/eg1KM6d1mNNCMZ6HRF/UgUhjI9GBuL9zobXz3HLZ0jFgDlPiLGCubbzoD
         te2g==
X-Gm-Message-State: AFuF++k3yT7vWwOoiFYfKsk1+hnmlDf2Y6uTmUZiSoNSAAHdzxYmfIEi
	ZMLyB5Y/C7eoZMbToPzc0v6LO1KYVf0iSvMyHYh+wD66wXbaqgnW6wY+8JVB3/LSjMRdLHFUPq5
	l56BTqLuapMaxXcDE0GPsEPFlcnAxyJqG0+KD0RE05Iqm+0A8aXTBQu4ojUw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23ce:b0:4bd:c8be:1e00 with SMTP id
 5614622812f47-4d72e16b0a6mr11612158b6e.13.1790522423505; Sun, 27 Sep 2026
 08:20:23 -0700 (PDT)
Date: Sun, 27 Sep 2026 08:20:23 -0700
In-Reply-To: <6ab90c6b.dc2998a4.2261f5.0067.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab93437.80e1c6cc.1e8e5f.005f.GAE@google.com>
Subject: Forwarded: [PATCH] Removing double device_put that causes UAF...
From: syzbot <syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Removing double device_put that causes UAF...
Author: nsvatoslav515@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fe2ec83746e5

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
 drivers/media/usb/usbtv/usbtv-video.c | 3 ---
 2 files changed, 6 deletions(-)

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
index 92bc7a2509c3..9e02038c3ff7 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -964,7 +964,4 @@ int usbtv_video_init(struct usbtv *usbtv)
 void usbtv_video_free(struct usbtv *usbtv)
 {
 	vb2_video_unregister_device(&usbtv->vdev);
-	v4l2_device_disconnect(&usbtv->v4l2_dev);
-
-	v4l2_device_put(&usbtv->v4l2_dev);
 }
-- 
2.47.3

