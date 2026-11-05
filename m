Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919922;
	b=ak1jGR0uRuvCYG3xbqIo9cIYFhfOWtxQFJvBI8LC+HQBJ6PG1I/13OruKkHtE/gIVi2G
	 nMLCl/yqwfZ1ueprIcjhY5o91pCvSTpVf5bdSr/3jlFwbMHkp9BiVUwU/9gqp/vmbNln1
	 vjOnvRIy9F8sSwnhjq/nCXckhp4wvuoOyMRtXkzedyTeLAkNTy4hZEV3vhKLGz5P7LEl3
	 oVvOO8eRu5tfQXLXEoFeWe9KdCe5PuuY1S6rEN8w7/6aFvbsjxhIVrRMZxtMd+hkEn/dI
	 z8180DgBhMuHDgxZimtYAr5GfFKCF7Fil4YcV05MBsPEGde/gn9Ey/6PoUxZVY+hW8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lyv+baRV8EbIAxpFEiLHk8SX2iVCBH1VZctlTVfik6k=;
	b=uNR/hTHGrnq2gtCR1BL5CUE5l1sD9XgKievxDtGPVsXn5d87OS1PD8lqhLwAz5X+WFZU
	 ly/fn8sVB9SIEKT6vuSJen1oOzcWs2IM4/WnqRakIlA6E1RoydIHg/O6d9rBmJ6/ido9B
	 5hSkTTdhPWmECOCHWY/+j8W+expsNQ5nQzWeksP829drP4eU5i2qWQ6o0b5YK4/l/+pe0
	 AOYDUPrmqMhxgwI3NU1ZgDLGxp5p6Clfp5kQvRyUojdBx2PZ+yeCsT5IJHNCeFUgyURiL
	 ntwTZiAnPl5IQqEilZ3GFGkY6klnkc8dT40WSnZMZ1xaVQQgc+ez1pQBmjU166kTebA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="riD8/TAM";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED53606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED53606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riD8/TAM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so842365e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919920; x=1794524720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lyv+baRV8EbIAxpFEiLHk8SX2iVCBH1VZctlTVfik6k=;
        b=riD8/TAM+/ZDub0PLi56rElzjuU+/Zyk9qQWcmw9XV7qPLAmiX75v8tQPj8Ea9ivQ/
         IOlcqUwH86aGv4f120SfYc3erLkAXGt9wAyc3pb+KPPfK3Ticn/q+rWDAQ7e+URtiywD
         NdkEiEZm3REafkJo+NUrlYnAxrmD8djdTnkneSUR5wjjt8Gh/3cxmZxDVi1cS+/3Lq24
         JwzxYEfrbyonA0c8kFflh/GUI3QWQy95fi9H65E+/D6j5m2gponXYc/14qZ9Il1bkJJJ
         0MepIIjsJt6cyatW7GFNzfljP5lSp33mJV0xPYjrXtder+sb6Mr1YHbHeIB40+yLOU6R
         29+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919920; x=1794524720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lyv+baRV8EbIAxpFEiLHk8SX2iVCBH1VZctlTVfik6k=;
        b=NiXUUlr3tyAJ1UsX/LWAhrhpCZWRoDNIZetd7rSO6DGgeeccZZ7Aa8rD9pllS8OY2q
         +QhOauFTu05ioNjpvizsF/2A07+hBo1eCxW8FVCRYkiWL+GH0uQRSTXRc9jP2t7dJH9a
         iB156ttz6kCzyYFrg5QrS8jcnS4FVBhgjS8bpMfSdMEIx80JIDxpvrO5KISQy1Rhddro
         dCTOFe6BlDxdw7WY5n7cmvRX8unNyqFVu/NVmmd4LRUldAvlLVm+RhH+BoPIkCNpZPdJ
         bhuEXoG9cJ3rB0W22izluHJyab7cYimgbctsW+LNq1MLwiE/UFedNjHLWz2e2bA9oWhF
         UToQ==
X-Forwarded-Encrypted: i=1; AKwUvBynhixbTZQyTJpM5QCfV88AOk8mNGPGeEl7iBJZCS5gO1vAJ0nuu56mJeB4qaIbBwfOR6c2klsS/aMnT0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EwTLxjRInCxhzblkwC7rA7sf2wiGvhB0Jurj/VjvDVToFer7U
	eAvT7oMvoPJTFxtDpQ6JaHTABiE5L58PHgJJRtA6iXbXVDV1LRJ2vfXZ
X-Gm-Gg: AYBFou0LQyC7iasvQROWx3bWlVLCcN4XE4wXafD/Eq+qp8JX8lPKqMb/sIV6ROHZRGM
	0xZEQZRcSwITON+I9uB5Yb5+Yh7MyVLmrTNGu1NP5Xd3ZhINSQhlA158mnV5XFqr2lCK/c/FsPj
	En3ZFQPqLh1mGIrEEob7VFz2grW88cruRbRxtg2cziK9vYc/+JSeJitQQiKOR74M77a3GAbdMtt
	oth4hNo2uQ5vi+q+fGql8EZ+AzjjmR5YUcY4cB/iyph2nucWNA7I9O4X0E9lYL0l5lLoKRTI8ij
	aEtsrYVgvUVrIlIni/u9pIKSdh+3kb0+49ivpxe2DUj72MK68T/KmnyICj1/DBLYAdoqANCSScS
	Qs3RtqhdaHCLxzWHoc1VtsyWQMVl8B+tS1bGOtrZVn2x/Q4/KbnS9BF5GKTZp7H5ux+c2dNiV6J
	G5Cs1uMVrAtY6S0UwU29ThfFSKJ7PxjZwB95+GttaDY6Pu4ZceqwkkbMCVX6KDDdU312O8oU2Qu
	QmXFLy8mFF41ijkZrkPM/un7m13YAdvtKe9oREYWJTjz4/p8ScN2uQSlVPgyk/oVIZQMmBbjkk3
	qHNUICNGGm7OEKbaxg0mCjMIgQHgiscrz3fL0tLwgYnADAsPrIiWuwiEpXStq7db6V8APw==
X-Received: by 2002:a05:600c:3e85:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4b6e035ef86mr7748765e9.32.1793919920021;
        Thu, 05 Nov 2026 15:05:20 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eab6esm14181195e9.1.2026.11.05.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:05:19 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: i2c: ov9734: Support control events
Date: Thu,  5 Nov 2026 23:05:17 +0000
Message-ID: <20261105230517.12782-1-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

The driver exposes V4L2 controls on its subdev node but does not
implement event subscription, so v4l2-compliance reports a failure for
VIDIOC_SUBSCRIBE_EVENT.

Set V4L2_SUBDEV_FL_HAS_EVENTS and use the control event helpers for
subscribe_event and unsubscribe_event.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/i2c/ov9734.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index bf19ea56f..095dae964 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -13,6 +13,7 @@
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
 #define OV9734_LINK_FREQ_180MHZ		180000000ULL
@@ -803,7 +804,13 @@ static const struct v4l2_subdev_pad_ops ov9734_pad_ops = {
 	.enum_frame_size = ov9734_enum_frame_size,
 };
 
+static const struct v4l2_subdev_core_ops ov9734_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops ov9734_subdev_ops = {
+	.core = &ov9734_core_ops,
 	.video = &ov9734_video_ops,
 	.pad = &ov9734_pad_ops,
 };
@@ -1013,7 +1020,8 @@ static int ov9734_probe(struct i2c_client *client)
 	}
 
 	ov9734->sd.internal_ops = &ov9734_internal_ops;
-	ov9734->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov9734->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov9734->sd.entity.ops = &ov9734_subdev_entity_ops;
 	ov9734->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ov9734->pad.flags = MEDIA_PAD_FL_SOURCE;
-- 
2.53.0

