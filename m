Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565382;
	b=nwnduxISYNc8Pr0fUEOfnnZDT+/FgCQNfwpa9ZsjwRerUJFyHWKEyQ+nypMCuHz92dLQ
	 ZObH/UzDtHcgBBzLPU+wmyer1UqbshaiyQgsk5v/7PGuTp+Rkj0qrFZaxjNIOup8RKVPM
	 I/XT6H0MIiFPEwmE30hH3Y8U6bcwAzrfhszv7ZO+HUN8EMvZtBmyQddpPuQMi9t7FN7AD
	 PVixz7Tt7SBfZBECAh7GJPQXUz7wOEuiyByUpJO7lz7PZ9v5IEiphiGjQSPLwo7Xt5l49
	 wBHBIv/se5gN5MZpk38Dc9WIEBKX8XDw5wvnyKbSOzHLzlPoOUdxz71sBxxOscpeg+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565382;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=sy1SXxSh8A2I8IELMo6BxSYib7WbescqXfqsguSzEWA=;
	b=Om/IThH3SVALSgsBsQcJEZKu7fVdseekUoMNXINxRZS5CsB4OhSXkKx4nEfGw/INBoQE
	 iC4YP6ButjBYR4rA5yRFR6isKpym8ADoIDnOqE8VoH/NKbyfkBE1CtAKy4smBpP9i3rNN
	 cUqCZSEX1A/pNbIoc2fOtnhXhYGvJlsEg+onilhZYPMN4VQok7bcjnEwsojZHrPKo0yI2
	 VX/JFeSDWC/wTRMbKE+GiB77AsNAw8BXB9TmUY6uYgvyKnroBU/MbdbTm6NYwIskKFs2r
	 MwvNFUsm1P399UYMHKp2fdmT9KBiHgRPU2hr4O2zKIXtfbL9Q3ezW/w+i/2KOXZGefw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594D606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D594D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-547ae874949so3774139b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565381; x=1794170181;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sy1SXxSh8A2I8IELMo6BxSYib7WbescqXfqsguSzEWA=;
        b=W0XQ0iyBBDbhvaumxzlTXGyOe4YyG41HyRZV4ldOzohyE8k9cl2bP6tPPm/wg8qFPI
         WmjPtSJhbL9MSmZ0zDLyxX+aSAREsRnymr5257+GmZfKCMGWj81xDHafBRmDkCj7ynBZ
         cxXuZkWxec2bFrl/yiYoM9mOYEBPclz+bqb+Ky0SkqdpSOMIrt5HGw11nFjCOXDxxY1w
         HstwOXoD2NLZu6gIuULg4gDyywGHqu9o43As4BD/G3Ex0hSAbKWGBbSURvtD6t7CyNgk
         qYiRxhD9sa+nNc6nfRWlkarUwcmaxhs3GHC3ntOMqZPWNSK0Cxi25ldt8Pf87IplAKz4
         h9uQ==
X-Gm-Message-State: AFq9FYKe91A3hqPU1Xo5Pbud+HfVoaeBcscNQFUXH1gp4C876hXB3qDR
	8n7FEn3JAoxXvGXp8y5T436pPL9WgcOTNu3zzPz7oUKN676+3sJunbYlHvG4WmIMjceZfXshpgB
	yp8NSETjjbXb+To6vZr2RLuuvD1U4H4+jEhCT5M105W4cX2M4AWR6S4MUFOc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ed:b0:4cb:818f:d571 with SMTP id
 5614622812f47-5640df3d5aemr5845814b6e.25.1793565380849; Sun, 01 Nov 2026
 12:36:20 -0800 (PST)
Date: Sun, 01 Nov 2026 12:36:20 -0800
In-Reply-To: <6ae5609d.264039fe.1edcaa.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7a2c4.7fe51036.1ecf7.002e.GAE@google.com>
Subject: Forwarded: [PATCH] media: em28xx: fix v4l2 use-after-free after
 failed init
From: syzbot <syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com>
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

