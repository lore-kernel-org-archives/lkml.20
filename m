Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1049DBB6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301017; cv=none; b=V1buHg9cV0dSL+F3Ruai2Z8bNaNmA9AAIN2Lft82lvAdkS2KeM7uqNr1p5WZTs03nhX5X37LlClYuD8RL2IfK1v+9f2OtkHpz3njKmm5xmQTDyCOsC6gC4EdOZ1QLxiGdEKyeiIOG3qB5hGDI3hHDRGBBUE13QxD4deqLjizyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301017; c=relaxed/simple;
	bh=JqfWwcqggs2hZHir1Gvx2n79QYV5ZN+UOGcf1rN7hds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efOBUjLLLWRv/hbiyW8diVkJtp0iXO4Fkn5YK8z9fITAMh+/KKEAmN4p8p6kdRnU5DAgPlNbTWc4V/McTKDhxTSDqNCm1whLgi3+kAaNQ1v986CGsrapwYuCXAvaKABOQmLuZkwRahHuyxbzod+e6xzF+3rW5FS0V23mkq9ila0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw28VImy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw28VImy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a17baef589so5625905e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301014; x=1791905814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuE2Its1FhnNiPHJLZYKGDDo0k6cFi9+0Le54uzJorI=;
        b=gw28VImyUnTdDz1WJNbseXiiBabDZQIcfWuELXOZztfmgvBcB+yYV8R86aeZqSENIF
         +xzxzE+tbbmMUACzngsC20wNEIV89siwntQNlUyeWtcS2h+CJGOS+jCxuVwzNZqLn0Cu
         kViR8W8qob/J5dr5jZc82WlPw4nnLigWWk/g1MVeBFHqw9yy8CEdlGrkYjuw8sI3ZQ4u
         DqG/3E9w1OFm6lKy7LvqhTKn8VZfcDH9byUOv7fz4vjMLlTierIpWt7QLxmZ787EH5Zu
         RD+EHBU21HTfGC2B82uXL9SQ9ArpyepKJGQMT+wmjwqFTm+fcN0WokeV+qHOCwBHPVJL
         xdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301014; x=1791905814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuE2Its1FhnNiPHJLZYKGDDo0k6cFi9+0Le54uzJorI=;
        b=mDcn2r6QWDV65u4WN0JSAqtvTQ1HGs0pRCuhCvifJD3RJOzS6gbJLPASmUQ4mQCo6m
         de2e1quXs7vkRnqPPP/h4swP87oLMH7D6v5IeHAeTCNvkbw9pNlnDmFY67bX63KN8LbU
         Rc6acXxwoZAcI1SNqpJJLNhlnYSafGW8jaPFto+Zc3nTwUqmIPD/9DKEdp9U+A7mnWCU
         X6IIK0E5fAGsPh6ZiFmfXlKs6uTbPwje/qFmFaDdbOkJGBXNDdiHa1avIFkFHCLmYsMA
         S6x7lILsbk2fS7kYR6GB0LbY5U2LmawSjBb0u6XOS5lROmxVV6AjA7xOaGL0Y0w84jhX
         uvYg==
X-Forwarded-Encrypted: i=1; AKwUvBxCJpUcM+Cm0lbNwnuApJp3pgpPaDvffofpqYOZiDkdrEHm3DvADgVb9jHZL1xAYEqSg3c1dng+73oTH8w=@vger.kernel.org
X-Gm-Message-State: AFuF++moczxgTEzbHhuTFBjGwrq4M3k7NMSlJaYYIIstDuyP6rUzFf8i
	4E38Q8BeHUau0kamWMEQBOKRYD2FDNJJBWseGYh0fIseQ1a7gUnogmZc
X-Gm-Gg: AYBFou1eNeC2acbYIVGFhvKrO2J10QAjpFuZjK5gaLzYtbyBOvdUYWsjdNS3P43Kc3S
	7+dgTACPp5YGvKnKwhuMZrlxg6TsVJp53fnnLZIR9M9KsJOYiiny8rxxJocIrPPr7PHoz8ajCCP
	4X4mLPTVtxyQlsRMXG+lvTtYGntEohORMcOwvlGVUCO7GAuQJzuGMiKxX4EzwjXg3bobSDw4AyK
	hWpyq/oKmvylfotK19ed85Jua/+dtyMa+GjtB0n2ATWdzertoKdo929yI+lGXaD9HLNHtPKVCuq
	2mfsBZ+qXjxCbS2yPmGuh59Sq7QGvK9gaG05ztczEoR7D76xqc1+q04TKCeuFs1PJ4Sua6SoZUF
	UiwAGW1hHOTMgu4pxdWU8gD2qzggKNV4QqcPtSsGWSwXWI/cfo4aI1ZYsYztxsfv2iB1C+nH9ep
	xx8OGy4ADn5IVUIiwiqfizyVHGVnr2/7BxpyBCLuy3altv3+2s2BuhooSIp5DlhAUWPQs9Uxeb/
	cN5zXGHaVVemg2syU+u
X-Received: by 2002:a05:600c:5883:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a168101d97mr131496335e9.30.1791301013558;
        Tue, 06 Oct 2026 08:36:53 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm243489f8f.52.2026.10.06.08.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:36:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Tue,  6 Oct 2026 18:36:19 +0300
Message-ID: <20261006153619.304520-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006153619.304520-1-clamor95@gmail.com>
References: <20261006153619.304520-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c6c950d5c8f3d..583cf47aa652e 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -9,6 +9,7 @@
  * itself based on work from Andrew Chew <achew@nvidia.com>.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -1019,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
 	return ret;
 }
 
-/* -----------------------------------------------------------------------------
- * Common Subdev Operations
- */
-
-static const struct media_entity_operations mt9m114_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
-};
-
 /* -----------------------------------------------------------------------------
  * Pixel Array Control Operations
  */
@@ -1383,6 +1376,10 @@ static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
 	.init_state = mt9m114_pa_init_state,
 };
 
+static const struct media_entity_operations mt9m114_pa_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int mt9m114_pa_init(struct mt9m114 *sensor)
 {
 	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
@@ -1405,7 +1402,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 	/* Initialize the media entity. */
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	sd->entity.ops = &mt9m114_entity_ops;
+	sd->entity.ops = &mt9m114_pa_entity_ops;
 	pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, 1, pads);
 	if (ret < 0)
@@ -2097,6 +2094,23 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
 	return 0;
 }
 
+/*
+ * The IFP has only one fwnode endpoint, which corresponds to the pad
+ * linked to the PA (PA SINK), while it should be the SOURCE for the
+ * next media device in the pipe.
+ */
+static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
+				      struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
+	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
+	struct fwnode_handle *ifp_ep __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(fwnode, NULL);
+
+	return endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
+}
+
 static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
 	.s_stream = mt9m114_ifp_s_stream,
 };
@@ -2124,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
 	.unregistered = mt9m114_ifp_unregistered,
 };
 
+static const struct media_entity_operations mt9m114_ifp_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = mt9m114_ifp_get_fwnode_pad,
+};
+
 static int mt9m114_ifp_init(struct mt9m114 *sensor)
 {
 	struct v4l2_subdev *sd = &sensor->ifp.sd;
@@ -2141,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
 
 	/* Initialize the media entity. */
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
-	sd->entity.ops = &mt9m114_entity_ops;
+	sd->entity.ops = &mt9m114_ifp_entity_ops;
 	pads[0].flags = MEDIA_PAD_FL_SINK;
 	pads[1].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, 2, pads);
-- 
2.53.0

