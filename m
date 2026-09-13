Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E2330B14
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789307094; cv=none; b=gESNN7dVpLbbkESPh6ZX1oYoFD9WEQWjjnZo2DphRWW1CG2XzgvB9aRHBgbbXMf8xpsizTjSQdIT1QvYRDNhefiUeJIaEjIzuhoSbpqyMXM286V1RgGXk2pgiI7bEmaS8e5ZQfnfAjhbDpwmurTN42uh5zImdC7l3ySsvqHI1KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789307094; c=relaxed/simple;
	bh=5u1iNb3hhaMKq5M3sBr8uvcPMeMiKlIXiJ9KCIHCSJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSNHBc603g3Fz6x5SrNb9bsDpF4vgYBdo+G378y1QOzOUq2GNH/OH36vjlpU3YFOm0ufwKO0Sq1qgHzBBhOj596leGmnwsLTDNx8iK41oVD8Q8y0AEXzWwPJdhAMakPdXDxZF8+AacbiWBRWW3DvIcSTgCsdCSiD8srbZtFoWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ0OE+UA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ0OE+UA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8692be1cda4so1934101b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789307093; x=1789911893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSYoRdUaLcILeZ/Zm0aWvKlTfSaQSuBQlZD7r76kq7s=;
        b=GJ0OE+UA9lRo0n3I6zTNdKSZ6FZhG4TNt1vgGSbwXFwATHxkVmASChN9OiccuuJko8
         8VbVdydD51D9xRpvjf6HxMWze01DjuUij/pXwSZMwa2fMtMwvfbh3aEqZnv8x0B3gGZS
         JgUpEcFpGpz5qOjIvh0QuKWHryFN7qO0NaV667oCMRtJ22V8S2hDI/FEV4E+/0lMkfOz
         shYzLc5px5fn/Dp8cxQG4owcFaw/SGAuQHKxqCYDJ9Jnf9vUFQ8b4hzUeuuwxeKqI2XA
         OTZcXwRVTJ8l4p9oeq9Fn551z1fOF+3FvpeRfZpi8ueBNSIVnKwyDynUufHDoVgA3qaX
         4ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789307093; x=1789911893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSYoRdUaLcILeZ/Zm0aWvKlTfSaQSuBQlZD7r76kq7s=;
        b=EYhqRIv9HrRsSGhuZTZ3gD7Z0eWQj5JRvkFHArFHJHkYwRje0qIxEicKfehjC+jBfP
         18DWih28LR/V+Pycm1yvX1wELRXnw1ZKI9p/Ij4w2dApOCUEhyJizByAFwqQ5cz7X4zf
         xqCyYkHeKpEFrIFWfrtUUiVFj8pcEuxY6YS+MO/5QZsXhG7dCrpaYOaCBk2OVwdMIEJk
         PYT7Tj6zPhL4Xux4cTrip1txeEJiqZJYV7pdNOuCzhpEj9FJxk5zmGm8VxcXvLomCzJa
         nwpG744CWm39b5CsSkCkYvwRAtA+Fr/oCI8L2Z/2awpj4pfgjAPaBSDCP5434pyPuFBa
         cXMA==
X-Forwarded-Encrypted: i=1; AKwUvBwnSwrqp9P+/I6jE4E1q0x0AHCUlIzSPwHGS9YuVZkBhi655zqa5phpcxzVUhpUurAC73bMBPs8OzSkcwI=@vger.kernel.org
X-Gm-Message-State: AFuF++nuF078Gyui3me40bWD1VU6KXseXqSKFhvK9Ny1RWzdC7vDU8oC
	5JsY0f02mDUL02WDWckCcCapqiRDRWqSH10cKwQ0ZVmaL3SIVokEqO2f
X-Gm-Gg: AYBFou1h+1KxBPpzUccdFJDJVvmKnVTVUa3GpjfoyqgRMazrapwd5Zdjgxb3Ej6cjKT
	+zBVvJvdUXfqYvpPRhj1oRVxNaagjpTbj03xdCa1oz2fxzSFUGb/9b3KqdTFdHfLcRuRmjrlR6w
	dMpoybuP9/yBrvW9hESAKCAYNM/ovPi1UtUHXw9HHXJ19wFn8qedQgoz8UW+aY5gz3E34pqfo/8
	1GyaNZ145dfcIgbyZEpDgKlyGi+KqM4AFh8acAGAeU9amLg4uYQBcUkcUCMEmN35UzEhLjTTUoP
	eGJL59zRKJpkPodsTBeX+WyzpZagGs6nAQ7AJL1XVc6QJT2EuyMw3hEqkQZ35eDXBsYqVWFo6TC
	yh/5GOx6h5AgAyfIMK6Trx5DJ5q5QHNZMcbzWViZKv25YshYhsu+XLkwC/LQVdLoAcLpINZoLvX
	VREOkQbfR4w1YLMVqTGlYa08wt/s2VuhSvHjq3Tw/+CXQNHCczTwVyzKXOdopExAqsMeDwDjCx4
	WiswFcg7L+zLnfC1Q==
X-Received: by 2002:a05:6a00:1c95:b0:85a:bc69:bfc4 with SMTP id d2e1a72fcca58-86b2c0e9a55mr22954656b3a.0.1789307092765;
        Sun, 13 Sep 2026 06:44:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:f608:4e94:6df6:c8b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c019dsm3340944b3a.7.2026.09.13.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:44:52 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+19da64013c46df87f971@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: pcm: set timer->private_data before registering the PCM timer
Date: Sun, 13 Sep 2026 20:44:46 +0700
Message-ID: <20260913134446.114724-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_timer_init() calls snd_device_register() to link the new
struct snd_timer into the global timer list while it still carries
hw.c_resolution = snd_pcm_timer_resolution (and hw.start/hw.stop),
and only afterwards sets timer->private_data = substream.

Once the timer is on the list under register_mutex, a concurrent
reader can already reach it through the same mutex and invoke these
callbacks. /proc/asound/timers does this via c_resolution(), and
snd_timer_open()+snd_timer_start() reach start()/stop() the same way.
All three dereference timer->private_data, which for this brief
window is NULL, giving a NULL-pointer dereference:

  substream = timer->private_data;
  return substream->runtime ? ...   // substream is NULL

Move the private_data/private_free assignment before
snd_device_register() so the timer is never visible on the list
without its private_data set. On the snd_device_register() failure
path, private_free() (snd_pcm_timer_free()) can now run, but it only
does substream->timer = NULL, which is already NULL at that point
since substream->timer is set to the new timer just once, after a
successful registration -- so the failure path stays safe.

Reported-by: syzbot+19da64013c46df87f971@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=19da64013c46df87f971
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 sound/core/pcm_timer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_timer.c b/sound/core/pcm_timer.c
index ab0e5bd70f8f..18bedd66435d 100644
--- a/sound/core/pcm_timer.c
+++ b/sound/core/pcm_timer.c
@@ -111,12 +111,15 @@ void snd_pcm_timer_init(struct snd_pcm_substream *substream)
 			snd_pcm_direction_name(substream->stream),
 			tid.card, tid.device, tid.subdevice);
 	timer->hw = snd_pcm_timer;
+	/* Set before registering: a concurrent reader can invoke our hw
+	 * callbacks as soon as the timer is on the global list.
+	 */
+	timer->private_data = substream;
+	timer->private_free = snd_pcm_timer_free;
 	if (snd_device_register(timer->card, timer) < 0) {
 		snd_device_free(timer->card, timer);
 		return;
 	}
-	timer->private_data = substream;
-	timer->private_free = snd_pcm_timer_free;
 	substream->timer = timer;
 }
 
-- 
2.43.0

