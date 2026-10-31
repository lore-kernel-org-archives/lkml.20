Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479648;
	b=kHvBIK1FSdvsXIP38hHgg/1fZazu0vyk2qD55GLKuN4z1DqDQuEkTAbLgGI4L3gsgfh0
	 hyuKqEYZkqR7nmOGmh3koj00vPcWGoHW1n9NWMlYIKWl5HuPcDa6MS1TrC+jzCrMSG6mM
	 CsVxZyOdB9iU7eWbM1REMHCEzaPaOgzMsjzhQfAXQSlXFvs+b+kQn0aPLpCqey8GdKsX4
	 ti50v/o+p9ZWx1SkrzAZeE80xKlbWhKBF5hQYfjftW1nLwsfMIFz3R67vlSMxeermYUIL
	 GE2to7Wi19rUBorBRKPFTLWrRomVMhW4GlpUY9VkEH1AXL0t/46HsDbisleCDBLhelg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
	b=Jx0xur5cCt9iAPjX6U+9sAcqQUewr0EB8Xel/I078jz6CQbdlFK2DIGYSxg8n4n1n3SO
	 ez84rXz870d85dC3ATOmLYaAO2wnH5IsnKEbbXNq0dBH78R3E6ldWsr4HpHpB/dhj/q+l
	 /tqniM9keh96OLxfzFbAP8XUv2mcXcDICgGh8ZFET55dDLPfaZO0KyWYIdlVDgfYJIACa
	 mo6a05CX46V72TI/f2ILoHk5HPMyd8dUk+HRQ1Sd4QmjoLQbncgHJsGDq+ZS79hTzplPT
	 zGd75qpm2Gbf34FkV+MFjwSLFH7Uln+Re6EaSAZKRFBCtv5yJeyu6GSKxdR+5AMagog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC+LJti3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4FB606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A4FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC+LJti3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21474295e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793479646; x=1794084446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
        b=UC+LJti3Yv47rlpsQtHWSUfnCSQ7T09uTWdO9TVT1rB2t2tdyw0SWFQ3j2d+ZVrwve
         4r0z4s9Fx0oXKO6rVnZgEcoywRiNHsuirCmGjU+qyd/vGbHa5WR+WbjGLiOm2+cLJ9/l
         gZUhrUw1iE+VasqZ8qabyUDE3xLwiEyw4CNY38lU/K2KhtgI/l+ZS98pDDWarhGLSCPz
         Y1p+u+oQuA2T5Uwv3+1rXrvhvV5ZDVAO1j+VB1NgIYFSIaSa2fOTqh+Up5yNdCTb6vGr
         fu1dIeM9gZ2PQ2cZiLI/FAg2xDaJ78VNKPK/a5kTx7smUBYQgZLGeMDPCXzSktEaq9Lc
         hANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479646; x=1794084446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
        b=wEINV00+8fC5ajNFZVDKzYYiorvfJDgqXgXo0ysvOY1vS3Y2RqoaOaU3ed68smMrM/
         icHyYBj56aeyZVrQZD7u8jKq4V/SbcpGrySkECKgIVan/+rCvYKD1lP5ZODIxWXsgSjq
         r3z8zCQ0cZjoqS7c5XwNQloDuD14zB8akwyBecKOaAVzRXXGaBvlGoybn1UOBaiCCzzD
         3f3/FyRL1M3NIweEoh1UjdF5Qm1a7/OsoVPQFWfxDvbMFFzfWB7A27WVO5cpAVLyVyTj
         L/MGsQ+J6/Ymi64RE1810e8nC+cN7+uQy10CI1mvDN4FNxTQWiOpQv6QX5LvVmT70zsX
         ewCg==
X-Forwarded-Encrypted: i=1; AKwUvBz6U6vlzRsfA6WS2NH11PZrsFXBJWC0auy1S1QD4mcSWy93l+ZoTYi7dSS2rGMUusvg7n69Lb9YNeRB0Dk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiEgNgP9VbSMEw5t/IHyk+yScoBmNLThH/JmTKS5pFVvdgnKCm
	tJGH7zXofLMo9q+b3NYESi58ng/uu6ALGrvi2IaVle7g6ubG58wa2GHF
X-Gm-Gg: AYBFou2f427cl1hC8FVNsasDXcHBBpfRscqW5rgjcxzgeg0CXXOmyCHiXskTEuhYbfk
	EMFgz5wgnFR3frWpCGZAmyn2YQKfp2jRtKfedDlC7hbLkvd5JYUUkvA0eum59OizSqRgYIokpax
	ngaY8pSqKgU0wzJJ8JPIVdLzrFHWjyooB5n8r84LaW6iIM509GOCIlkZGn0lMmV9MTzzFM/+fA0
	vD4A25PCgZ0wMfxDbqMapUguRnk+txf3I3uJ24yF8Gr11k4vpigeF0MO/drYvAiJgjVmH0ikGob
	EvzNAhvWZtHJpuShrUZ/g8MiNEqGpMN2R1MxUnVuwjGewhrfABGxnhEtmwvs2t9LhIhuR3DNKfH
	TEWi4Op7EgUK6EjyO8eFQVGnV4+Ad6K9txXjIAPSR/g5TiMSYTwnTGPPYFPaXtzEb13jM1qoVHt
	f4DY2YevgwuiLMvU3gsWZwuXJ/JxHpYXLUPMpVMbehwVVbewVdDeFJXsETXaIrdnw/rWco4XAas
	ZFe2qH9qpEyZOZ/Rl12LzGp0KGg+kGu9PM8rRarwXW3kJAhOIzLGkVBSs7n+hOR7pmVYs1/z+wg
	oP3BGHLlljO9YG6IfEEkuM1/I888sIz/O9FHIP/OLqSgJM3bQVp8KDPrU/Vi5DYi8GOEB+y0q+1
	5rV8=
X-Received: by 2002:a05:600c:628d:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4ac17d16a1bmr137026755e9.5.1793479646321;
        Sat, 31 Oct 2026 13:47:26 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.98.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e77409821sm6564471f8f.0.2026.10.31.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:47:25 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix v4l2 use-after-free after failed init
Date: Sat, 31 Oct 2026 21:47:23 +0100
Message-ID: <20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
video device is registered. If a later initialization step fails -past
v4l2_device_register-,  the error path unregisters the device nodes and
drops the initial v4l2_device reference, but previously left dev->v4l2
pointing at the freed object.

syzbot reported:

BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
		drivers/media/v4l2-core/v4l2-device.c:78

em28xx_v4l2_fini() is called later from USB disconnect. It reads
dev->v4l2 before taking dev->lock, and on the failed-init path it owns
no reference. The last close of the video node can therefore drop the
final v4l2_device reference and free the object between that read and
its use in v4l2_device_disconnect(), causing a use-after-free.

Fixing this by clearing dev->v4l2 under dev->lock in the init error path
before dropping the initial reference, and read it under dev->lock in fini.
This makes fini see NULL after a failed init, while the successful path
continues to hold the initial reference until fini is done.

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e71765881a6fc43185f
Cc: stable@vger.kernel.org
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..572e6835b851 100644
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
@@ -2426,13 +2426,15 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
-		return 0;
-
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
 
+	/* matches em28xx_v4l2_init error paths */
+	v4l2 = dev->v4l2;
+	if (!v4l2)
+		return 0;
+
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -3129,6 +3131,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/* matches check in em28xx_v4l2_fini (under the same lock) */
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.43.0

