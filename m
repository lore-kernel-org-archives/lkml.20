Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F960343896
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077794; cv=none; b=JEVp4T6R0LkARNFWsXSZYdMSLl7M6bsuVa0SKpCjnnlAAn6UUosqvzo6OLd4OdVppQv09FG+Aolp+t4Ph6VHDS6KuVS89RpHnFy2u0TNuKve50yZH7Z/8W/yeXts3KY5/FKUlhdSkZ8mK71iMSkOUG+cETFMeOvhUySg6Wudpvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077794; c=relaxed/simple;
	bh=UpbNU8emgfBSZZJbeYC2DucLSvOABXsYMSei6BCuLM4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FYK3Z+iXQLSm6yk1APFQIzDZslRAh/fBojRVnMmlq3ato7NVaFaJBHQtaSsS6JkgFjxvVIH0h8a03/UBDGSyEJtUV0mzUWW9RsIZiVze9EWF64llmrwRNYetUYEajBCh2Aq1kxNeX48NMIvLIE/VxvMyVA2tSTntpuks+DZprWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2f2b8d88fso4768286b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788077792; x=1788682592;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qIKw63fFvbajGME/KIgaoTokvwo54jJuY9jmWOnYpck=;
        b=Q5OlEI4SMhQGthCYPpTEA5kpuIAp5OpCrKVUXzkujRhdJdq5vJc3zy961llQ6D3AFm
         TNK36RRQ0lfKubJf9xTieWkYt+XZOjAEXrQz83mj+x92cQ9BFCBvDs25tTIGLCd4afde
         EQPZJG/BDkfsjg3NLv3NYsw/GujpcR4s0d31SFFD7XcuOdSpbXfGErtDCVsZFWR/rN2B
         8JTkqJhn69Zp5naBFnfw1yBDq/MFkI4RkEemCGYrF5Wmqh643eRMGL/BL57EzVpUFceK
         ZH93vtOsg0/K57kDDc4nMsbfmfMqiJyfWmDpCzh2mdwttqpEzMHWNb5a1SuqdXKAtNcJ
         Uj+A==
X-Gm-Message-State: AFuF++nl6f/QEYx4p8fFaD+BnysUxpkgTX4DOKaiUckkVIq7t0ox0CmG
	cQO9OJ1vU6ymF119iPtf5nzyCZELtsGMt3z8b+zUKaT7gJlrorx0j1WiLkcLon1pJpt4yietGwK
	/tMtGxKTmEzurjcjl/+/BSfq23rN/WCKPCtgHHsaeuKvNfTtMTeSvXhQud1w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c85:b0:495:eb86:6e8f with SMTP id
 5614622812f47-4b398248186mr22658849b6e.14.1788077792082; Sun, 30 Aug 2026
 01:16:32 -0700 (PDT)
Date: Sun, 30 Aug 2026 01:16:32 -0700
In-Reply-To: <6a9087a4.4d659fcc.734b4.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a93e6e0.1d9ded08.62e62.0119.GAE@google.com>
Subject: Forwarded: [PATCH] media: gspca: don't call stopN/stop0 after device disconnect
From: syzbot <syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: gspca: don't call stopN/stop0 after device disconnect
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

gspca_stream_off() calls the sub-driver's stopN() and stop0()
callbacks unconditionally. These issue USB requests using
gspca_dev->dev, which becomes a dangling pointer once the USB device
has been disconnected and freed, causing a use-after-free when the
video device fd is closed after disconnect.

Add a gspca_dev->present check before calling stopN() and stop0(),
matching the existing check already used for gspca_input_create_urb()
in the same function.

Reported-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=537b5eb78cebbff5ea70
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/gspca/gspca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 594d73e50b9f..5c33cf397f3d 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -733,14 +733,14 @@ static void gspca_stream_off(struct gspca_dev *gspca_dev)
 {
 	gspca_dev->streaming = false;
 	gspca_dev->usb_err = 0;
-	if (gspca_dev->sd_desc->stopN)
+	if (gspca_dev->present && gspca_dev->sd_desc->stopN)
 		gspca_dev->sd_desc->stopN(gspca_dev);
 	destroy_urbs(gspca_dev);
 	gspca_input_destroy_urb(gspca_dev);
 	gspca_set_alt0(gspca_dev);
 	if (gspca_dev->present)
 		gspca_input_create_urb(gspca_dev);
-	if (gspca_dev->sd_desc->stop0)
+	if (gspca_dev->present && gspca_dev->sd_desc->stop0)
 		gspca_dev->sd_desc->stop0(gspca_dev);
 	gspca_dbg(gspca_dev, D_STREAM, "stream off OK\n");
 }
-- 
2.43.0

