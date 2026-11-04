Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823809;
	b=clYriBNLVP4pYHT8X5CJ+L0vp5+tTiqNmbDZyN7qhJHQhpagnfkdfnz/EA4BJoCmLMAW
	 PKq6WG9FtbB2aJXvp+OF6ic4hzDRFMXBvflHaamLmbeUByR86UXCr/n4U9S6H0NFxRClm
	 3J459hjKB9QbcLte35HZ1wjLXzSB9wIQ61pZ69H17fdjK+UkmRrTOPb+cCw6MK3dRoAgD
	 OK31aV7ZvFAuQh1KJPXKLdHlvWdshOx2fZw6JZ+9VucfU5S4c6Mh4nqXywYAWTIfkG7W2
	 7q0mQ0kHvQ8Ovn/NKx+EGm5Q+RaNndk0MaFVEVBs0a8occMhBlFgJylGRw9KDVyK2tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
	b=cjFKw8RXfg+xBs9UmYYK2YLJg6YBBEBJQHyvDpmtbIR/SPLnx8yEk4Ft6HtRtbQiDRp5
	 XBuWkQMkseMxhE6rVzvBEzLaRWH0wDGKJwVC0jtDsXNedQaHIWtr1wtgwRt3u1gfF4/FZ
	 EW6p+qW75t+Kzutx+z66f/IkQ6Ptu+0a4Z+0NFyz350p69nyfAKCwDCDkuWjcyfAWfNje
	 2oJpwTBuJAnFx1HzY4TyMBoDsAxGWS5qOsiEkPVmXbOawdKMFo9m7CizQUw1jUtVoM9w5
	 91CfjKGdMZ7kYWCaoB3iZ2xqBJDaJF27Tyu6kzD1hDDNPwUmnH4TkSnzhFTN3TN2rrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHarwSmG;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CBC6072F97
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57CBC6072F97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHarwSmG
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b305e10ac7so12192947b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823808; x=1794428608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
        b=YHarwSmGlmrLNnexUV8TCu9qAmUPUm7BS2v7N2S8h/bK6nAmrGBOAd4CtsmQkbRDTc
         aIvemPAxoul3uySgUhX++Ey7szslUFPOwEyBOyvvzYN9zZnXd8PJmU/Mrng4JWKWTQkf
         hEL3rMp9ZmG4tz1LOLG2F1ObftrE6xY3YNN0Xni7MagFAgkKxJp8G+uoLhiFAdpSvyU9
         x8AsSUKQhTKi1v5b5GrPqK7OGbRZhuxmehhk6B9aJG46N6Ag9IJ+4kjbry8xLV9y42fJ
         APsk/qq0rNZrcNO2kxX53Y3c/c2rT7digdE5OzKCWqHNXlvw71IOoNtcZpuAjd6mGUUZ
         VTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823808; x=1794428608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
        b=xH6vHpKwP5SpDyek8GKp3XMUVfdQ4HjS9RaAOH67Co9I10wh8H7mX38UIxsGEQWNmi
         UK5VD96amghOyFeMfxFBewjYqfk+vVYUVZiTD1lBXDSvMhXTCeyFroJw+WxXi0T9pgzG
         1W+bf1WEWXkOxjTxHY+rBl5NtAByNEzJLu7v6962x9X8jOmOuZqwHjQoYond26W8Bkfp
         SaUUskZgyItnH8Pw11ywbOI8WzfUqh732O9n3XlPBISo0Aojxs+Ig4nfUqL10gOT83t/
         36Pjqw3pX067/NdSmwPi9X+vbkFebrg7ZZYP0wU/iw8fGNDzHCNbmNWQEuaAV1sMf082
         DpfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI8zlnd3cunzuWTEgxCl83c3G1DEAcldJE4GBkHWT+tS06YGtkhFE/BGdoiV8ds+D1OJJ43onwl4T1iIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6cf9a6Vg5YsqZTo//7Q91qVi11z/OrIVDJQcCKpc75Un5ll/+
	4WUazsuI8ZQa10AHs5vQv0YmGtB3P3w3E75q0EIvFQFp+dZV8c2QZUQKeSinJWXFuks=
X-Gm-Gg: AYBFou1LfphrCZ4rHN+3uNNRoC/Bn5B0GcBst4sZiHVDbdXKb2noHhd7XnNuCFfHe8q
	8j72dZnkxgLIW96ZiLuSm1Ch4ZkHPSKZpo/60n181qs1HOqdCWIWo5iDKHyCNyhcP5CbTYuddcB
	U+i8dAGbZSIIi8oMI32xLn5ahu7SBWOA0tUTrmWa06eOZTZvMd4a0WNMbHs+5I0XfPRdVzTNY+K
	5vgifnITf9Y8HAQYSj+h1QnhYScx23iAAEPFdrP9EWBVpAWuNPTJWLs8AfdK9PAEsj58VpaZBlZ
	EUmXeNeGiWPZXsTpWM5GbsAHw+7gJrTytkDHjPGUizuA8XEcEl3w6DiKAEEDpr7Uabu22lPvP6m
	vqSTnSRxjVMnxU1iNp7E/Cq1Tq+N7NcmZ08cPlBjhxRvV+9nQaZ2MzrWlCyVVGvuwrvZgo1JTvJ
	80fLZ0QlzyRtXwS9p6rK632PArSNdtyZexuJOpCKfwcDp34KBsOuknf5fQP8VdfaSeLWYKfkTyP
	/qBdWUmNcWdeB2AvaYeZOzW1YrZ5EsK10cf2KnMRFOjXJtQlFdFUtpjiLAMT7ppKsJDga/SPYjm
	Aa5eIXe5hG926LP8EObYnmz7NKz+OufExH4Ym/EPRL2o3q4rLXcH5Dja6LW2dWyPmH6nVoqq+O/
	bIiI=
X-Received: by 2002:a05:690c:3489:b0:89c:41f9:b886 with SMTP id 00721157ae682-8b2b67f3125mr116898717b3.55.1793823808412;
        Wed, 04 Nov 2026 12:23:28 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:27 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Wed,  4 Nov 2026 17:23:12 -0300
Message-Id: <20261104202313.72494-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

video_stop_streaming() walks the pipeline upstream and calls
.s_stream(0) on every subdev. It gives up on the first non-zero return,
without stopping the media pipeline and without returning the queued
buffers to vb2.

A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
already ignores that, but video_stop_streaming() does not, so with such a
subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
driver, every stream off:

- triggers the vb2 WARN about buffers still owned by the driver,
- leaves the pipeline started, so the next VIDIOC_STREAMON and
  "media-ctl -r" fail with -EBUSY.

Treat -ENOIOCTLCMD as success, as at stream on, and only log real
errors, then always stop the pipeline and flush the buffers: a
.stop_streaming() callback cannot fail and must give back all buffers.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 2c15546c8..9091eaa18 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -361,12 +361,16 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		/*
+		 * Subdevs without .s_stream(), such as a sensor pixel array
+		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
+		 * keep going: the pipeline must be stopped and the buffers
+		 * returned to vb2 in any case.
+		 */
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(video->camss->dev,
+				"Failed to stop %s: %d\n", entity->name, ret);
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.43.0

