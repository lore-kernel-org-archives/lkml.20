Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874C42FCAF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390459; cv=none; b=NsvIXEBAiO4XwIMOFuH76cwq/+f+/FXZhX503xNO7852bnDSFzVmLOdl+4Que9vWiFnLrWreky9fnT9+h4WrybLf5Mj+r8I1/uSf37OditB0IzZMBRgQP4r66jeAWU6bmpe2OnrLSuHOu8A18bIqiL2cryjO+bZuJv6HkOBduig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390459; c=relaxed/simple;
	bh=Mxm+fmwQmn5+VYxSCgGqyXOLEpyzVHy2KHTj4O7eGLw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UHpXY/NVvoW0OXR1SQSfcZ6aoqNdT75hHL3AKPsw6Sy4ifU/pabQqmPEIPY9mycoAMnWdMsRn9wD8TN1lAGsMZAb698WMKbqluIzMhMlCl2zKVQ8HvP4dOS5PakpsCoqx+CDEFjA9/gZ+je/9e85poQCty0GNvlpP2BNU1rvnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b3516c87fcso991701eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390456; x=1788995256;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0RhcklWqlEWJf9sRKmQLvJ5S8/v4Eyro3m6Q/mJoRdk=;
        b=eG5vWCgwiND2Cos5AiUBIMgjE0B8+QVFPlydmKqpK18R0Ojn+gOsSB1yuKapiCumRk
         8YTXcJqdKMZclJ7XyPcRTKyo0Qtvxx6U/DQk7lqyvJc7F7koevlMNW1h6drXmeEqC/Y7
         EwNHcDOtWPSVnFrZ+AnaFy9bXYjxoHSS1MGzc4HSxiSlaFPZYUUA8GmfcYNVIk9ymkWZ
         Np9mql8jZQJfwFGkd0Ll8fK0WYh+qtjnczq/Bq4TX8s+JWTngbfF7achx0USNlyxUgFw
         ciXLY2+6HqDNfj3zx3aH87g4qoYDi3jOiIICIxCWWGw0kgTlxAZEWxjfnzANk+wAy7m5
         CItQ==
X-Gm-Message-State: AFuF++mUxCA8tJ243vgc+YqXeUMzLg5hDkHGNQ0bRFEtCQlJ6cIJCRWE
	Rftl2ks8flsIpsFUDxRJ5nD8g3MTpVSggmQSRMAG0JulHdBkGw3dQm3+NlPlyl8+86p/LEhf33d
	MGuEv/cvnr2GNMffR3ly+rEEC1dq2s+FBISXQzk6QH++un/R7QbKrSl1fzAo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3087:b0:6b1:9f02:e2da with SMTP id
 006d021491bc7-6b48103a985mr6744890eaf.20.1788390456440; Wed, 02 Sep 2026
 16:07:36 -0700 (PDT)
Date: Wed, 02 Sep 2026 16:07:36 -0700
In-Reply-To: <6a987197.9266084e.bf0d7.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98ac38.2e567484.299ffc.0002.GAE@google.com>
Subject: Forwarded: [PATCH] HID: roccat: fix use-after-free in roccat_disconnect()
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] HID: roccat: fix use-after-free in roccat_disconnect()
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



roccat_disconnect() dropped devices_lock between reading device->exist
and later checking device->open to decide whether to free the device.
This let a concurrent roccat_release() see exist == 0 and free the
device first, so roccat_disconnect()'s later device->open check ran on
freed memory.

Fix this by performing the whole lookup, exist/devices[] update, and
free-or-keep decision inside a single devices_lock critical section,
matching what roccat_release() already does.

Reported-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/hid/hid-roccat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 4f15eb951039..984f7c334f14 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -369,15 +369,12 @@ void roccat_disconnect(int minor)
 
 	mutex_lock(&devices_lock);
 	device = devices[minor];
-	mutex_unlock(&devices_lock);
 
 	device->exist = 0; /* TODO exist maybe not needed */
 
 	device_destroy(device->dev->class, MKDEV(roccat_major, minor));
 
-	mutex_lock(&devices_lock);
 	devices[minor] = NULL;
-	mutex_unlock(&devices_lock);
 
 	if (device->open) {
 		hid_hw_close(device->hid);
@@ -385,6 +382,8 @@ void roccat_disconnect(int minor)
 	} else {
 		roccat_free_device(device);
 	}
+
+	mutex_unlock(&devices_lock);
 }
 EXPORT_SYMBOL_GPL(roccat_disconnect);
 
-- 
2.43.0

