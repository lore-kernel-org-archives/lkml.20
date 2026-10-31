Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480967;
	b=3LK0Aj7zH559k5YmoimmaN0oXazomaSB3f8e568JKKf3F9ZG0d7whKbZH9sIVAh+zjHh
	 6ojF2E5/+556h+QsS5Ej/fKoy+74NdTAcpAxV77nDIiFoNq/0uxLbstyc06pqi5BytrO3
	 5WHLGFHQYIybFEnv24dkeq6FloKPcuiRI0Oid8dbn74p7Sek2B8plmr5DEh0ZvpD5YauC
	 fj3bYji05w3RE0cueUZ1486nwz3VrussnipB2VGRWz/T5ReCgprn7IHotmk3HD6QYtIT7
	 9lG2vyD6Ul1zEbjA5pJYzeC8xVjzmJLp1ifyq0WOYNEN101snqNvU61HhDHlXd/ePXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
	b=FkAjxyJOnpyQCa4AgpPuPldo1LiqQg27uNNkOkBEvwS2LwoSp49Z3Ln545qBAORtNuY6
	 fVyCp7tEIFd1YRNHWfzjkajeMU6YFFn9ldFUC6cSMXXYYPskeKnkoUJpdRBuS+6aMPxu0
	 Amk4u2QIImAiJE0b2Ill6FFtnbgI5TMpCVWeYPibz+5BeKqwvvkh42VSOMMBPM9LPauwc
	 l4k9HeGS4OJPUWddCRN+16x6wgfjA+NdkegmS2Hq0UbG6aFGEvr6p9GO9NAdkT7IYtFXO
	 GG7mzCgiWbbe8C/uXIq08XHxEgWrwzqCHswLW6trHUcqfzeHf3XEVL9G+Bezfv8K6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqYbYdvg;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09A606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C09A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqYbYdvg
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so981971f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480966; x=1794085766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
        b=uqYbYdvguytgoD7FHJG5tY6rU8OIQiX6tqmAZwTE61SMy0wE28EnrcSxS59sQ2fW2q
         0ZdszXd8P9zhRcp/q2O+3QYWesl+NJbOte+HC5NowJThc+/fBZooJUc7tBKiVXZ70LJx
         DMky81QW7YSd2TXrzRj3WaSGT7meRbPZaqv9IwKBGzelACshDnTZXIACQJjcyXhEa0i8
         7RzjcauZfQmGGELTG3wiw01jfXR+tvLsEr3UTDe4Gh3y7dl4L+B0gduv/5tevT/YiSLC
         aRJT3gPWCVB643970/gcfVh9bH/uiCSUGXyDRFF0BFK3WOk9HZEr7HnTPm28IU2DST19
         oTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480966; x=1794085766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
        b=SwPTy6c5RGLesCMgkFduBkqwDoX3YIuJQ//kFvbrs6QVZpSLYjPxr6FpOccZl/LrF8
         VIMxk+jwQRQlzg1lelfJ0dDiul0i6vdGgjqg2hB2MxxO80suJA7MIlDNUn0H63ooxiRh
         io6UWouDiLTZ3xXt5own2VtfFbIhaJ0kfkH6M2/pwoGajmCauaEVE2RFaCtJFl38QuCd
         lCb9+3oGOuLcBJdzWR7jWEcIW8fIHOoLO/26q8RfkCjM0rmWZLgFuyV/k+vi9aTKwZ8S
         Ef8jlFwHz0/sIn7zD8u0+DMz4F019DcqgBcJU7x6KHlkwaIUPRhOLJz2J04zWmCq1O6A
         23Kg==
X-Forwarded-Encrypted: i=1; AKwUvBww2NL6gXVp64yLjY+UibIvc0gkFccOZ9ZxkG0uHYCEqOAEI+DSDYJq/ZTq3+M3dvdkkg9m9Sg/WqQNo2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7DcSNIV0rjFpV/hWllA69/dBPILkHZwaZXDB0abCr8WYmJKbo
	fooMH3OR14mD3BzYEy46QwHJZdAh13zY6HNJTUy+CjzvZkUT/AIXEOI2
X-Gm-Gg: AYBFou3Vs6FsUNZeQnWx6FUSfJv4tqiHj8XsgYYfm84R8sitgkJdEMsLJ1WA1s0etQt
	15pKh8Mst/HYMSvFu8V7jwI48B3yPOpYxRK2xNEe98YQSez3zoSQ+h4Ub1hUw7WM44/EqBjFNbS
	EMGSVUzyQt9FTwnDurVrdjRfxmHPtxy7cooSaJodgyGXA0DiaD9ZHoxfIgtTtH96TrbWLwDD6NO
	23EGPeDp4pVUOvRq1G7t92mvdW0kmnRoguXJgge0cQ5FNC+/pwhvaw40vyKdADHWP6xHY+od0an
	y8csZqCYqpbehxxQHa69PDN4kHLUhKkVzcOGUtiizVyy9e0NpzGlxyPVrXnM82nhlCBFJuiZGO4
	p12jhSDTXXgalSChgtkohZhfNQ01UcNQzJTl3l9mHKoD7F9Gy4zgapn2TFzXr9wWmdHyPg/AbO9
	OhuSvRHdwo2THrTexaqiSpJ3i+3YHrzfvswu8znpFJhG8Aj0CwjZFQEeZRJDNls8gkeRmAoNIoc
	VF99Vz1d2mknBLjDjohOTMxlB+Xuhkjx8R3wnny3FV+PZpXqQ0N34dsUDG5R7OQg3dYFhl3C7Fn
	e90b2AmT4f7XLNgzgGNjXT1fcJVERU4KU3CGlkVSR97SiY4pRscPHuTMnQRDp/R9GTHhPiLkS1m
	DnNEM5RpvROifixgFa29rY/zb
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48e6e2db4a1mr16251497f8f.18.1793480965675;
        Sat, 31 Oct 2026 14:09:25 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.98.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm10793317f8f.51.2026.10.31.14.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:09:25 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed init
Date: Sat, 31 Oct 2026 22:09:21 +0100
Message-ID: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
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
v2: added unlock in early return in em28xx_v4l2_fini
v1:https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com/T/
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

