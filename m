Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565593;
	b=kdG13YVfkXTtBWzqp6rC4jAcH3VXkN5zdaS6AwaNEEpAL6udXi9KLRqtBC0XLX+Ck3U1
	 JW4UNoLBkvF3cL6riZvAdNKFbBsoiDhTg53dZe5s9CkZBILk3SuBgjCOkRAxocLN4V65k
	 XBoBUKTFuqxrlF0cEZPW3gysVt62HFxW7tRtNfUePMyBPQSW2LZyIYshG/fA0kRzu3Whx
	 FDjGemRyeRmhTsH0KZDVW3fjUlQBuIh8I6cAxk3NXJvRy/0z2s+On4r9gvp+IjVIz+l84
	 5Ru+CloukWJ+sow0NNqsX0GTaELq2k0JQvnjvdvV9raAUVSFvjjjoP1uoi29lLVqyVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565593;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=sy1SXxSh8A2I8IELMo6BxSYib7WbescqXfqsguSzEWA=;
	b=vsaQe31bXOkSNeq7Ek8be0m7LovE0CU4OzrnDUfcOtzkFNzOtxXXNsGCw2Rp2p6PzlpW
	 s8yAeW5hPMEPUnuEej5P6ma8XCcmgl64jr3uKuU8bFSZFgLEOi+WFFeRbriobSVmi45Ft
	 VSjalcJjouChhISuV2nrMrGmxgeBlLoolyA4kVbp1InC96hXI6EBm+uIZYT50qmWfg06B
	 m5pydp1bCN1TptWGZNe8BjH7CKNWy3Jnmq2jwh5woOPys77hWMYVPEwomQhoatniTILr+
	 EXP/bIvrSgPxdNnlH1gXYRTMP34aRfXzpc5detE1DjKcspsldQ9uvN9Hq+9jfsSIlgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211BB606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211BB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so4108130b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565592; x=1794170392;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sy1SXxSh8A2I8IELMo6BxSYib7WbescqXfqsguSzEWA=;
        b=SjtjWc0sEhpMOwig2yh6bLpaxjD/NPOBHV+GTfR2wX4aAOe0JqnYjsv3AiAkpAi2uk
         1LdE9TeQbLysow3yLEC98zVZ1FzaNlte/dCpwIyJplkOcZ+luH+jgsDdtmEklCiuCj00
         MrUGVvc9M9PATpDesu4PIQGroU2UWatlEO3RaxcS4yDSZ8E26l7GwEKcQT3LX/6bUcjG
         PzleIfhtzHfGS3QyVgd7WWPeRVgFCTuCzX9lN9G4nkmBDpOchk4C+H8asdgtRHQXxfGi
         aeKMGyuNg+zKgxAZVLWtoQLBcydktTvEw51y35VUNfJDTt3qbL7FBpnunui0rBlL3Ymk
         AqMw==
X-Gm-Message-State: AFq9FYIFYjb6k67MTtEZw0XQwC6dk40XNaErxrcLZRQ7SEZCY0nPkvnZ
	VyCwHSZSjbraabEayp52ISd66kmVecgwsncOdBq+tBcM5oAeGpzmdOGQ4+kDdz93mqer/8oMOBB
	1nhi/B8onojW97FEla7KPkD5iBRWdpPszMLGSoYGEImkTvQg204tHLqG/zGE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:124d:b0:4d6:9153:295e with SMTP id
 5614622812f47-5640de4bb51mr5656858b6e.47.1793565592238; Sun, 01 Nov 2026
 12:39:52 -0800 (PST)
Date: Sun, 01 Nov 2026 12:39:52 -0800
In-Reply-To: <6ad958f5.16f08417.1cb7b7.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7a398.67782f90.13afb0.009a.GAE@google.com>
Subject: Forwarded: [PATCH] media: em28xx: fix v4l2 use-after-free after
 failed init
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
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

