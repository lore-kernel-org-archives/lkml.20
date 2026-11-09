Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223591;
	b=YJSFQXcid0rCotV41iCi/PvpVo1bKBjoDUTyCAYPadiJE+YMSr2dowTumaj8NTlO7V8H
	 f9hsiEWp6YfdGL4c0v/fHrD3akBULuZHVwgedBozaVnN0MfjPayZek79D1ii2Yo4sihjj
	 2rqpc9WRUAvJEkfXz/9Y6HTlZD899yEq2KEurt0Y41VOtLbtd7dG1iEJpbURXN69jVdpz
	 786xXY/HZ5d7qlwSxZhE8csesEWk1F4rd++UgMjSmHIrMi/U7q1Q+NJsUmaTkkFX7tAfg
	 mI9F6/9/QJg1fjoRguEFMr+XXLkZSHHl67WwV7eCA7+sw39SiUyBMBB8mpilkiYjkAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
	b=XDhKoBxUA2+V6g/zVKwPi7Yvf1GZdmcjFd+L3R9RnVSdMQNo6kGC3VgxX5QPqBB+ZZm3
	 dtL99JFLHpF/xaETmVxPWXO51qdFZ7Lk9KonB3bHQi79oYN8Vxo5PzvNZ4zyFD5Y6b8j/
	 DOLV26AtS6QmuJDXPYc3KrQ7X6sbtuaa2UcZX3JlrZjZokwtbotx5nr4kEQ0f7qT9AxWA
	 wYaXlkoWja0Jk9FASGMYrZj2ALbETFq69KFprh3w+DRVrbRM35vGowmy4cs6XKGKuVuQW
	 xlWGkN+eAtAX1mDb+6KAZSOijrrFgMrhi0vnGvoZZdswIP/Asb2liLTpJ33F1tz7LOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L+FW6aib;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408E606D823
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B408E606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L+FW6aib
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0d126f631so6357047b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223590; x=1794828390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
        b=L+FW6aibCHTP+TRnSSxMUeKf4LzOHnogNwEmXqAYaYmIX6MWtcdz/OajbMNlosZUI9
         ZZsGPE3sym3Ru6n0AEIsmx59ZH+FsE+x7pG+5EG0U+M2z4wHBmX6g3RVbqmfWjKxEIIh
         FGrm8MpLIJ1OUqLf4UM6xWFpOPY0g/6xfAZ0Odx6uo6D/iDRzKjnsNVU9r6k3+k8YtRj
         yKgMqp3EDHqsK0Y0h2Abm8xQ22laYhHb6laCY/JBAole5v5VvIEc90mzzjgwPQpcmt9l
         I1jPXBj9wqpxX3Na3IM1JojEJ+ab18U4B/bsV9ov3ZqhqRbWtpkEV5GLAZimogZmjNrW
         qUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223590; x=1794828390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
        b=oHWhukFH0r3CDnNAHvluvuC746tzeZjAwXLkMDuw91tRNlUdtE1KMk6Pqnka85jtwH
         1sC0/CkvNHFzdKMmdnVwRTl08/Pib373HnLhA3nDulwQU6VVJptzB+HLIn0yXvVa3u+z
         OdOVEh63kJnY0fPYUJ7uOqpGBBm3lA3biqr78qooW5LbqQEEvkA5i0Owx9QzYmtUWyuB
         g5lV63NIwakrSNbecCCqi55tyPuZV2MWRy701Ul324pyjKdl3dNvGkX4WWMstcQnierQ
         L6PEciWCe4EWs3y8puFe/Yn4Bl9m6q/g20JSP28u24/Zz/HfXhBZOE3zM9QthE1GyMJK
         dHYg==
X-Forwarded-Encrypted: i=1; AL+hErEz9WFjkTjCuE9ReK4p9qwyYpl6upsfLY2IoeQfbZIOAewP3Gtexz/3F8AOMeERQoAPCmrKaMgjtEG8Dos=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hqz8TMNdhyKgnITZ8eTr9XQuJ49XOkXPu/v9CPqmXIL50voD8
	Syw2xUcbzio35oB9fgf67KeHcRU/zmHB9ujdib2+cI7CyPw+HB9yFhwcUzfT1kKNJNg=
X-Gm-Gg: AYBFou2QeEXnhF//qz2vWq4eaX52Ez2AzX9BI/QCdgibJl8m94AYv2Mm/aDMsOBSA6q
	hrBy7FzDK0CvBJSTY2U+G0BJa4CP1y/GcjtETeyf6BZ62kPzAUZ1JA55Iz57pgDM9s7XEKZB9GA
	X47MmFo/Q6i1jeKgm9hapVoVs3xlfL19vGoE/Hy8ECrO/SaCBsW0R85xE/iICbaD/DYnsKJ4bnc
	FUPLG+FH1srR2hzgqpMo4ggLn38ZB1rKTgJXn5PVCVbApqOuu+2u/6rujJbRkrSKaVCFCupVfQB
	yHN2phWsQPQjDbXMdurqg9yVv/2kjFSUWtF/8Ixka5rkemVFw/T/UTmYhQ6v5eYrk8vssGFgkwm
	33GfVOtibDulDI1WdNMNTP10tQJ+q7RPNO9CMVNMwIdzXJg0rqJt2iJyIa7p0aGZbU/YtvsqsfT
	GzvtvWv+yayCHQPlxtvDaIL5RnW7Ms9XHdQm+HRC19C2ZQcvor3rn47yNOH8YBqKKhIREgMrOr6
	CBkKOWUadB0SdmcPdaiZHvR4Fx7rYfroQ8XUMnfC+BWTofjZZiwvr6Yf+iKuOeyPsgUrrhPIRhA
	xnXeQoB3mJXgfbd1tbCQOeuEobsRIRQLqVt3P1RvIy+HqSV4EvWs0vjp/mPfJ4QphOI=
X-Received: by 2002:a05:690c:a211:10b0:8b1:ce5:be39 with SMTP id 00721157ae682-8b36cb386dfmr20292887b3.38.1794223589604;
        Mon, 09 Nov 2026 03:26:29 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:29 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Mon,  9 Nov 2026 08:26:10 -0300
Message-Id: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ec..8341666f9 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *q)
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

