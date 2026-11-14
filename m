Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674980;
	b=U5NU6Gi0ByIPuOzR1cSwd+/ijRsL0LsU4op2ViR9YbGzLgV5KwpOAX7iQ2u2euB9sgIs
	 fQZUQxSnMcGr1Aa6UgJ1e/JuPTPeFDEI9wfZwTAa+aOzjdoHEmiEBdms/OamAGC7BeLWB
	 TCWbHw1B+oKnDs7x8rUMi/1au2T8NzYV5O23xvCWxK2dqCPpzzpQGICke506/x3i4avpj
	 PfiXFaifZopytegaiXbolLEjoyuvM8LfX1XsocSJjf9lG8qDp52H4Z6FyXEvWhWYU8sLG
	 6s1estdegiUDQgR1rb3IJb4PEEPI02KhKiWZFpAPOUtVXUykz036CKKtDma+/Gf+adA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4MfgnZUAxYtPMdkCLogJEqW5pilJx/+POXbl7hayrsw=;
	b=O+SQIqb7BrcpaATmEM2+lZSSpVweW+PyYtoOOUnwliLehWak39cUQQHJnhWrosw9NfE6
	 NRxeoVIg8suLxOF1kotXH10AILYw8rtxs5vkE7Kt0L7ED1gBHOdiRXTa5zCUEqvOAatGa
	 6jpVK+NWgI37G0mNQY9xUSQ8rn0xwSihrUrkKe08VoDDgTcYLAKnWSaNcbTx385Mlf2or
	 myewJndSg9l8ZWwZSCvHfqghCasUVAPL7c6KTd0Y9WFB0+7T/qDPd/RZEOBNVnjuyIGFB
	 dbtu98ytEHk+7j7K0EzHyu/opbLeas9JFZc4DCcylk6QGcXNrpRq7iZvH/RTboYBfMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdxsQxDx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41A606A8A3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D41A606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TdxsQxDx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49a92144733so770587f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794674978; x=1795279778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MfgnZUAxYtPMdkCLogJEqW5pilJx/+POXbl7hayrsw=;
        b=TdxsQxDxZc0T9Cps6oqeJyMpBITPAEyoh+qpULe++WfWK+v6XZXF45CGxiluV9d3CE
         MVbEGey/x66s7G07TrCz9wReJwNoKcKgGqY7Sl3QUCKg1c8N3FAe66sBJ1rQzKBsNL3g
         Gxsye2duxBnaElcU9Py721YBQQrG1X8a7JH23KREZ1bOARkGNJ7ATX6K3f050R2/YIiC
         /E4L9/iHY7Z6o7RCNWg/RO2vq0t5LAxplcFAtvraVMUfchP8gK03JOxIc1fDBX1UvtoL
         jshd6CJm+X5WZiI9oEj3N8JpRm/VvnT7kvJdcHkIvi03KWLgkyzSbi70GVEqwiregruT
         MchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674978; x=1795279778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MfgnZUAxYtPMdkCLogJEqW5pilJx/+POXbl7hayrsw=;
        b=E29Trf9TIbWUPVld4u2sr5T2RUkFmEtKadY0KWZXMUy9/uoWhjTHLemhobMB7JnoFM
         zLUoRCmZt0tmCHvDA69Q764UAzFf54MZFYVztxc+XXjVWE8em3RYAZ0FaIh0MYzsnQet
         +mt8TL7qoCyEAWPkT3UcXJDCVv1fnig5mGJU+GxI1Mr/dEGe4w3dLikVhNc3OtJqATzm
         4+hQYL87KQck7Ni5pZ8jBULB0s/1phrqBB4u+t3//b/0tDinSJAQJrNLQmtmD24o+HjY
         9xrX7nSmCkh6ly0GGHPx7YMScnLqulLTyhwYU5iQwiiuaeGSYauyuRSUBVRVk8Cl/6cQ
         8qmQ==
X-Forwarded-Encrypted: i=1; AL+hErGkJ6ILrw9gQUGCksxVzyyZnHh63N7XrYYR96FZgXMjyj3gfSDzKZ32d9jr9MgZVNUJTfUsNekGvnLRqBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0+TY5omVv/FH/ri4btN3cAxtEHVHV0tejb80DHqsfRayItOD3
	zyh4s7S0gwHGoYgpyaZO2GaYNitT25YYx4Bc+kIazdcW48Ee+Do3MLN6
X-Gm-Gg: AYBFou1lpUM+Q+qbIivZazcbtWqzCInYqvHYB9z6lXgN8i9/J6Ooes5lMTxmU7bh+Py
	RZmWnHPCcDaT81pRdT6r1x+7usCWBa7L7qbg5tsj1QtFNdX7gh6lS60oDVHqoZOMLLiTvxsJ8mO
	b6AlrNpVtwcfnn7D7Myt3DqvZgInjjuSwAwXbZSXYZUtAo+KM6i5b8Na6FQp1KDEbCKkaKBtKkK
	nNeKfASG2pLALc+aSTnoy15WRiSbIiV7Ep/4PhaDDT1iyMrIshqvNDnVriUSeAUnTrPoPm26HHY
	CKt3TzEsT348RCyk/gvdRnGUeM+Y4RH5CI1mHlvOt+aBrHVi26whzlo6ahrWRh/TqkHuNb15kss
	krgjQF9UcR9knXVLqTBmArGvrOAAJW1YtfQglCsnZllMMpPHrpCnwey1HO4/YDpAJslGW5L8pEU
	Nm700AqDWtLhCvncmbFWTAcTlUN/6NXKVjATpE8oZRnWlwkWn3tXTAvd8QdLUogRyaszpbV9gY+
	bu4YvipFa5SBwhyXfPunzIMrAe9Ib+ipzHx6osnhuFhhXSGlxoKRX4bDGzfH6euNzZlG3jHKQIR
	a9qWgENRQFWG/y1yLDu/C+n+Y0V44x4HUARuyrpm0rzo4GqT0dr7PjbBtSUz7n909gJoTrQ9YJk
	nnhjb/xBZmIq3DQ==
X-Received: by 2002:a05:6000:4918:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-49c72ab0a38mr12067465f8f.41.1794674977448;
        Sat, 14 Nov 2026 08:49:37 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm12107798f8f.52.2026.11.14.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:49:37 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden Kanchev <nayden.kanchev@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Serialise the ISP enable in the params and stats paths
Date: Sat, 14 Nov 2026 16:49:33 +0000
Message-ID: <20261114164933.2657337-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Only the capture devices hold isp->capture_lock around the
mali_c55_pipeline_ready() check and the ISP enable or disable. When the
last two queues to start are on different video devices, both can see
a ready pipeline and both enable the ISP. The second call fails with
-EALREADY and its queue's start_streaming_called flag is cleared, so
the ISP is never disabled again and every later start fails.

Take capture_lock in the params and stats paths too.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 4 ++++
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 16e895e3488e..6515c78c1bb2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -762,6 +762,8 @@ static int mali_c55_params_start_streaming(struct vb2_queue *q,
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
+	guard(mutex)(&mali_c55->isp.capture_lock);
+
 	ret = pm_runtime_resume_and_get(mali_c55->dev);
 	if (ret)
 		goto err_return_buffers;
@@ -796,6 +798,8 @@ static void mali_c55_params_stop_streaming(struct vb2_queue *q)
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	struct mali_c55_isp *isp = &mali_c55->isp;
 
+	guard(mutex)(&isp->capture_lock);
+
 	if (mali_c55_pipeline_ready(mali_c55)) {
 		if (v4l2_subdev_is_streaming(&isp->sd))
 			v4l2_subdev_disable_streams(&isp->sd,
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index a9c28b090b2a..cbd2a2f77da3 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -146,6 +146,8 @@ static int mali_c55_stats_start_streaming(struct vb2_queue *q,
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	int ret;
 
+	guard(mutex)(&mali_c55->isp.capture_lock);
+
 	ret = pm_runtime_resume_and_get(mali_c55->dev);
 	if (ret)
 		goto err_return_buffers;
@@ -180,6 +182,8 @@ static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	struct mali_c55_isp *isp = &mali_c55->isp;
 
+	guard(mutex)(&isp->capture_lock);
+
 	if (mali_c55_pipeline_ready(mali_c55)) {
 		if (v4l2_subdev_is_streaming(&isp->sd))
 			v4l2_subdev_disable_streams(&isp->sd,
-- 
2.55.0

