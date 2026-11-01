Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565427;
	b=ky+acDG1V3EUBkeT8fo4jidy4GkkqmDsiT2In+ZyYjSMB1CuL4yezFJQwwULbF1rh0AU
	 RsxdOacd7V5LrzW3YZ5y9ookQogXTcp539yA5z3AqAbpBln1V96+ivVbKYHw6NnNZG3Sq
	 EhC4qfd4itWlu551IKuszqOJ/AYWUdzuwVWFuxHtAtMklPIo0oxCfhH5r48auELIdgPn0
	 sPltZaI4661863kDvGUL9mVKb+OiToC46W+xGAENwOoxaQzktd1FIUDccCI41MzHpnipO
	 hCCyIAKvniZVZpjA5qDAf3fapT1wiFLoPPEXApD5SprbW/5tfR/WrorJRBEYLXyofvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565427;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=sy1SXxSh8A2I8IELMo6BxSYib7WbescqXfqsguSzEWA=;
	b=FdsK4ZGqV9//4z15UF70xitY+QgmrFPzkVhwyLPyyo2cKLIazvteIxgP9Mxy7sBopjiI
	 kYz9EUi1iJTt5jteHZy0SP/ocKvX7EnLccbE3CX6SKO5wDooviOwfbopMQMrERjJPipB+
	 XoH+HPCDJ0qeFTc1yeAv5khDf1jDHdJsKgM2PY7osy2mAiyKBpxD+JU9gj7Y4qjJi/3+5
	 cbkmqsMcDzvXiT4Q2zojtRFOOaxfkQRORZcw5D4giqyqRBtYIdiZnbjApsk3gclmd6DOf
	 dcplAm1ZatE8P51K/68tsxaAdXli+AQiwC8wXQ00/7tzjePPiNEtkoAK6dzXQ1Wmnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100BB606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47cfa971c9eso4319353fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565426; x=1794170226;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sy1SXxSh8A2I8IELMo6BxSYib7WbescqXfqsguSzEWA=;
        b=g1nGx/H/fBITx0D9Pm45fIqxAiKNgEC0GRYB0cc1kj6LpJu9MBTJzJny86y9n8WwXN
         yAQjs/bPNuEYOYh7PIqReoWZoU/izyNgDL39VwiPmzawhmFqp1py+y7PkJeVGtb8BPlp
         dtPqNV5PnPIJOgXFX0fqIP/Xk0VfjbLLmgWbl6FPvcNm3/bbIprMrPRm22pSEHfzHRLz
         MexA4LyJdgu/mEumGgCBb7S/L894T59hLocFjyv3zavep1+PMDKAM4Wxo9z4YwQxT6Rf
         jahARDrJD/2hcdXluXbkEFoOPFrtrR9utKt4NdlTJBK6TL5Y5/XXffOpbUWXkg/QBh4S
         gn7g==
X-Gm-Message-State: AFq9FYLyH2n+XdwF88aEfpKqXI3jhLXOSOVdZl6QKK8LnXKLELmHd+VN
	UGHzP2pq1MqkMEFAk/pwHoqjamSDe1ZjVgY1dTCFa0Y64X2BNmnrY9kOTyQW08267RC7ZFFKBqC
	FtEDb77kEBlPQEcQsLx1y9Pdii2yjd6mjMRIoPYNq4CmXdj/tedUnlnVZfG4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1521:b0:4fb:b543:dc3c with SMTP id
 5614622812f47-563ef615b85mr5983718b6e.5.1793565426032; Sun, 01 Nov 2026
 12:37:06 -0800 (PST)
Date: Sun, 01 Nov 2026 12:37:06 -0800
In-Reply-To: <6ae78458.64e51036.15cf6a.0015.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7a2f2.64e51036.15cf6a.001c.GAE@google.com>
Subject: Forwarded: [PATCH] media: em28xx: fix v4l2 use-after-free after
 failed init
From: syzbot <syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] media: em28xx: fix v4l2 use-after-free after failed init
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test
---
 drivers/media/usb/em28xx/em28xx-video.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..924a3f7977c9 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
  */
 static int em28xx_v4l2_fini(struct em28xx *dev)
 {
-	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_v4l2 *v4l2;
 
 	if (dev->is_audio_only) {
 		/* Shouldn't initialize IR for this interface */
@@ -2426,13 +2426,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
-		return 0;
-
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
 
+	/* matches em28xx_v4l2_init error paths */
+	v4l2 = dev->v4l2;
+	if (!v4l2){
+		mutex_unlock(&dev->lock);
+		return 0;
+	}
+
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -3129,6 +3133,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/* matches check in em28xx_v4l2_fini (under the same lock) */
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.43.0

