Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013046;
	b=UcQiqpm7pWWDmKgZhSAETtPjnM2NdQRmaj/7YqpZqea1rEas6Wys3/FrSgHHajX+mTKK
	 hbqYJtCMf+lEwzOFBoUei2ntGzT4XrRJ92dS/OEcdpilQ5lkClCOcY71YHEGdLrhSEURW
	 mIn4IG6hAB34Xf5Dx1V6dbzSRIX8769hviq2+ocgExoFg7TqLmIqznYiXG7BdPCERsVCy
	 omb2KbVxOlHiE2airu1R/fEdFMJOl/d5QHbuz/tslP4PQxyOtu88utdvsbex5I7wlAWf8
	 zShK/VE5TYe19dPcYdik4+Q/tFaqxqjrdKJlhRxH+5GiSzzYjbMFmXo+qk7cQ/frjag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nHwPIC5V518+I2XjhxcGCGVOoAe1dG9UyV/ZbSTa7EE=;
	b=inGQ2wg5TtG5CywM46ntO44M2VE+nniMG+FhdKFmW/BUJxpHsNDVnlSq7qqWx/U12GyA
	 UCz/ntELTKc3/GPuB9vHqp4HEco4Ab1tf7Pw1MtaAfQTXWo62mTQV4RpvCRKYTaY7m8nS
	 UaisyC1DpfkHKsqTEYi477MBaY5/JueIDX3guwhB66pUspwVlptiea8HzCx3Jbce/LIlY
	 4rjepOUyq5IIrLCgSrP+aGVSbm6gWYiK0jdw1TtcKkZVn2A4bNjBDQ61EfCCeO1SdLVs5
	 yHHux9iOVi6zOwe82a2kKTBhaA+oFenrOlGKrUSepg2mQMIBP2GKdKtVd9NHKF7nm2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="S+70Eus/";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB38606A96A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB38606A96A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+70Eus/
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e74a32a07fso2664535ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013045; x=1793617845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHwPIC5V518+I2XjhxcGCGVOoAe1dG9UyV/ZbSTa7EE=;
        b=S+70Eus/h/4LcgubusQOsZXB2NnYIPMewD5k9iM537w47Q3qly3RjCOhPD0JINFDPq
         k6Tjrh8HK5VkxnJ4RSO0C/gVL4AySDoj5JKnXV0ma4pcBR6TcHxcdL2Ux7+3saVWOaME
         zaHVd2oBAalIvbDxWMKFRXmsJF6OOLaJ4rH8UrrxzxMDPBMV1K7mZnlTKdhAKNDvN7PW
         gSOJkXm/wKxQUTQ3hb7C84ek7AA5GBOJx6783OMPuCMjqDbodEUhhte2L6JnTdyZJEvC
         0Uk5JMKp5JyrFZrrdlr9iz88oqJo6TvtWulV15sjYqd3drB10uMApACHzXBCD6iXkOhg
         3r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013045; x=1793617845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHwPIC5V518+I2XjhxcGCGVOoAe1dG9UyV/ZbSTa7EE=;
        b=SCB42/Ibeosny0440l3FrPrc4CCKt5ca1aEEwZNUeUsBJV0VdKskdbZvpRZtmOsvTB
         /Kvsa8UPGe0LDDrNyaFltNz8xi6VuVZF4GXC4o4rf23XYYp9/9Pt55rGZd7i56Ez1wqg
         RUOiOPfEkRnerP9bxp5FJaiM3W3DBugLiOqnjkrhWta2MFRW4fzNQqlzqHldkJjZ+897
         5cEichwBqNlLMmrERXBtu4ATJ1vnLJycCdb7C0KeFXAc6SCXAPDJ0ZD9cjHTfMmQAOmY
         ofy2mBOpKyo8rKxQbrVn/CMhNSDJMyoLYtPk9rxyMEXawNu5UowAmk+rMYhwQekc6TU7
         GEAw==
X-Forwarded-Encrypted: i=1; AKwUvBwcKxeQIMKwUg+riT8Qu5c2Fey3H1UdU9OTlKBefjqz8zzHk2w4T1/6Sgwbhk5Svc73eO/XEq/9qWfbANI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ//Z2Ht/D1IQR2ha+12o3TOOJOkmDCS0CGbMg0ANHTjSnR+Vo
	oXbnKyvB3D9iTK6xh/WcPvgObdQnw1ejb+CgNVs7wkcxp7O59458g8cc
X-Gm-Gg: AYBFou2QHa8kt5B6trB1G0VK/Ijw1FN0K6tWfVqezMZ8MNOeb3vRUNnZEBNEpxvVwX7
	PTq9IvNTaxX3yFIwBcSD5pdU/cIa5OqoBWoU/2vJa+E31//XQe5xWM2odq41FL3PCMRoV4zQspy
	YSJsSkDwoEENxhacS/WevqczlzBdQZ+TbH7MHdfnORJRCLgS9zo5nsy92F1hSP79+XSKxNhtWbx
	4g2elwORE6GOpObHYaRGJsuLlTqXS+sGr1nJml/CQ+kF1SzvXCNGHZv8/q6hslC4SnHuYvj8LVT
	xCPOBglH1fMTsb9GJBjtVloG3tQIyZeqbduKdYp8rU18BqpEwwjWhxiiY8Aap7IGiO9zvlUrUTC
	3eAzHqbWl41faYxQx5WtqmtrfoD3wQXTzmpG3pFz/FZVQ2QnIwhRA8+u/W17iGI6CXi7dQH3oZB
	KK80fTuyeZZevIiAWFzvt+bGVVXB0u0z0usoRkX2VyHN+J+s7mijMmf8qWhJVcoy1mXOfmtYPHM
	XOiDbDWM8mzVWza6JvYRk/6LVmsuiNCLFx3VVsBLH5GTRtka5uFHojT/3ZOnlUTIylQQNdrX647
	WW7YskNislGc7Ax4iTQ/cS0xj4II0MN5bNGuaEgGqUOJJ81WB/aS3IlJagTAd2fV7D6J4dBjhXK
	Q0JEJQJIWBYfv+IXNeNEcb3iVwUMQ9NPdMKPMgidRvmCEOw==
X-Received: by 2002:a17:90b:28c4:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adeae5dd2emr8767861a91.4.1793013044804;
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 3/7] media: i2c: ov7251: Add control event support
Date: Mon, 26 Oct 2026 20:10:28 +0900
Message-ID: <20261026111032.88355-4-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

The driver exposes writable controls on its subdev node but does not
support control events, so VIDIOC_SUBSCRIBE_EVENT fails and
v4l2-compliance reports:

  fail: v4l2-test-controls.cpp(1128): subscribe event for control
  'User Controls' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Set V4L2_SUBDEV_FL_HAS_EVENTS and use the standard control event
helpers, as other sensor drivers do.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 8dad747f77..917285a62d 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1471,6 +1472,11 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	return ret;
 }
 
+static const struct v4l2_subdev_core_ops ov7251_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
 	.s_stream = ov7251_s_stream,
 };
@@ -1487,6 +1493,7 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov7251_subdev_ops = {
+	.core = &ov7251_core_ops,
 	.video = &ov7251_video_ops,
 	.pad = &ov7251_subdev_pad_ops,
 };
@@ -1717,7 +1724,8 @@ static int ov7251_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov7251->sd, client, &ov7251_subdev_ops);
 	ov7251->sd.internal_ops = &ov7251_internal_ops;
-	ov7251->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov7251->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov7251->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov7251->sd.dev = &client->dev;
 	ov7251->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.53.0

