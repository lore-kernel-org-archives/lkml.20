Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405238;
	b=qFg+hQXWDKR0mVvXyNW8iSvFpoKD/Yg+b2BQtHg0QJZIoXv3Ipgfdn/3MXp14GOMybc0
	 LPc+2QTUuiGGTKAgdG9ldpwrwcBwpp6v/6zGWtkMjTkPHfVlx5kPXS3SWJLAIQ0XdmDLa
	 ehpG5/m4wkxtUhmVakFco9lnXqWRmKKRTT8+WP75fz62PKElRd/O2XHERge0DHrMeMVVj
	 oKapdO8xHHM/QhiPHlzDQD0RqFnWjEUMmEojlFMYzqG/Q/MHLaB/29lHlBYuJqxLdrZiZ
	 APFCjYiHMUV3ujLfoUCDcOLnpXs2j/IgX51Cunl9JUUPi26TrSjT1/C56EUSdTCCvMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
	b=nNOREmqx6/NPaJzsTlnYLcRmpDIry+dfkfApeBUHOK3LVK17aWfp2e1RCKyftBTSGx4o
	 XXa5WQUZkbVG4iifci1b7Cz2ecCEyTKJm5H9noJU4zMYl2j2b+Najs/fwOv6QSFlhbKnB
	 Da7zAZvSbdGqa/wObT72jS9N61v4Z953w5zImequXoV4l1LhvWm1sQW0mtWiWqEKARkSJ
	 mDLR3VF0rFv9POh8/lmv7Q5RWjxDlxWTrrfssmTYtMuPRUidjCzQY9KYVs2VBtALR5vkU
	 ou3T13Xww2WpI3+4ZH5OQB3CyPt3vsSnfz30R24ZodvjdPJzZIc5M7/NP+IGGG2KpSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAX2UuD5;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96E606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F96E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAX2UuD5
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-745497ac8fcso1137008137.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405237; x=1795010037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
        b=KAX2UuD5HdxGgKaKE8mN+DK92AKsfSeUbVO/EvEFmbuq5+sligftgbylhvdihktyVk
         AEqUtsVtpty0dckuyBrcrTcjQKXMOMieMfXAVDQi9yZPh4ceykZ4luBWaSMlarQ7dqA0
         zuHwXJjf9VY6T0GqpAvJZGpMi9sBcK9h4dsAsCMUaE4mt+QsDi4tIYuGKvF7aB/IjLC9
         YygBMOzuKws9BiZSxBrwsd5cnPBplHCsUht+/YDZNvRa7PP5ubCulh+h68vBgJ68jS2D
         XQttiO0sSySVUGRiXx8EDbG135uIY4x3SZ/d5JkG5ZOkGIeaTXzKkojRBE+YW20lTNtk
         1jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405237; x=1795010037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
        b=HLiFMFmCE5GHYemWi6vzRXXBRdLMSDSVDHDCEToZchjUTfX7bZZtBC1H+2GbadHTnr
         BEt+LsVziZLJUQUHsKTgPkQActR2qVD81pl88TBxw0N+bVlWogAr7rPSIkJDzddplJ7+
         A1pqVZ73UvyIsZhQdtjbanyMpyhBZM0T9kIgo/7Ms/3cC9bxHy81pY3QD/LJsMkb0A97
         ToSFwc3pjNn1h5yCL7yIA9qqXPwn4ZqkA6EAAkDrkZuIsdbr8fAPHZLeJ/XJvyzpfGNW
         q9Od9eGy1rT8jWnEhcWAr9fNRR1k+uWCPws9Kk5kVh28xk5K65XLIIfFn6BnDhIUUYVV
         0NVQ==
X-Forwarded-Encrypted: i=1; AL+hErFy5vCLhUKPf1aNF3/kTwGYWygPluh68KQTJqeuqiIeeHsYFQpe2HVIXLfSXqL3N3Mdit/rljIkP25dne4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/inhTUPVQoJqPBHy5Y+qJbdTQkrNU5ySklYzkVxwwBD8awpk74
	Qgq8o3fO2hjdGPU0bx+3gvWz/2MPNS3Zfm6ejxMc+kYzZ0vo3EkQlWj9B/exVBxGsmk=
X-Gm-Gg: AYBFou0QhdNKSn30B7AyVSXpC5wDlVPKbKD5YaCZCS/6ouOqy5nQDAbjyWGdT48SKKa
	HtlrP8K2cp2TDo5ledki3EwKtvSSSEzqc17w4bFdH4J3kz91h+GlHUCDJbfIgruU7QFH2/88VYV
	XbFW5JXqv2xRte3ETnNASB2AvcWCgrfGsFqR/ABAXS2GoFyUAr30C9uIC2owOceziA9PUZVYVgu
	yjAfVhHNEUW2e3yfNrjhJ2uJSb9opNelEIU8EoUhgnxydBaNmgdNYoHEDzXt/zwo29b7I7EiOjM
	pn+COqr347oo7FsqSJKls98inIykzeJ7e5ixieYwR+w+ITG9NT4AJ0g0SaWNBdASQDNO5urZKhg
	GPUjUCVJjGKBSk9F+CjBHnSjXRVKMBGOoN82XiUcKIsRBNkTDDadVWoLYXqkr0P8DRs2BpkQMsz
	Ez14uOsNIkb3pfUEeD964sJtuSebcPCAqrDLIhoKEcRTOWgqOhrGMC5QNqw+M4BoMa5+F2p3yQf
	IdH1vtteo5w26jLPS+9Jrt23l1fPCj0v6vIRS8izEQS3bJpJxkcqloJFCoXcsssqEBwPYFJXoo/
	rcQGRjBO6c49uRsGdJvcxyj9tkImeltn9oLiTf/riNQL/yHcpU/Yp374fV+VGQlvMOihIVYbd62
	dmiU=
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr480165137.13.1794405237106;
        Wed, 11 Nov 2026 05:53:57 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:56 -0800 (PST)
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
Subject: [PATCH v3 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Wed, 11 Nov 2026 10:53:37 -0300
Message-Id: <20261111135338.27008-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ec..4388f2708 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -314,11 +314,9 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
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

