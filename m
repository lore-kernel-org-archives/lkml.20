Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5B379EE4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933727; cv=none; b=RxMkY45RkRTLnZOAL3WvR25yEgcQLPAknl8+6LSGbfKBBvOs4AdV/lXV2jEbQBv7NlNsnFMVudod7AeU0jsa5kywYhYC8J4CfBULlEyx3C3SfmC8KJcw1Mk49wrcEZKGLFHZZ1/a67cCK+PhZ0Gc1HeUS8oDLMzkdGGQk+UHJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933727; c=relaxed/simple;
	bh=C+ZAgqnl2tYmvrqVSgafzVk+7+RkB37GOiNqep4MzBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crcdY22I9e4Lxj/fEoHyH5m4itoYyLcppSfIMG/iQP3qzPTkjlAyRNf1skIHiB1BHpg7nlxR8Hhj/HqvZxgTYsauA3iatkOYDAHwmpol4jEGICbzD4XoefX6fqxUTnRBCXzUqlqMHo/3R+K/gT65fVxSEcV+YKslY6++2PSQ3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XE4Yfjkq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE4Yfjkq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso552636f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933724; x=1788538524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9MrXzKpC71U/GHMh7M3eLoSDCO6PB2t5OzTKrblmzs=;
        b=XE4YfjkqWRjiyC2lvjFB5H57si8qwzq/ToOFy9wshYvnYkRPoE87o0npiUcVyFa0vg
         GzUdufQ2JvplCCE/7ijVzhaMHFystQrLRrmInGVSwBbaa94NhUHI06gNfAqh2lxKcJ8R
         c2f3HGNZRFsIIMTdqM++LKmjlR8vvoTD1+ziC7EMs8VqfQdsly7Z83ymySVX6kA0eB1T
         kQ4NE9djOKSgDewc8SZ/v1rMxPPTT4nAjRjE+Kjn/a0dRaZ3WzVlRlWqZMfKoe/U4dMU
         giquhQ5exfGZ2iRVRPXKmO8NGZ6E4ReFYbhbs6rMnUS1P0LPU+Ln1Co/suBWrNgTpHFR
         Sm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933724; x=1788538524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9MrXzKpC71U/GHMh7M3eLoSDCO6PB2t5OzTKrblmzs=;
        b=gViuGi9K8qekqPZq89ET7Fopg+1heorcFVcfc849IeSXWPB73CiZOV+BaMA+NH/4JL
         9CjjUMMZ9Ve2APxGpIvCBcTUN2DVjG9lBW6HbTw7j4RL7BgmewNR9ex4lQIBsEJUGuVA
         7wpnmr1qQjnFghEuyUJ1ttbNIwG7d9moTLKeHNia6E8rzLtkm4r2jpQemnmJC4waFnYm
         Rca6oRuoPkeovtAG7zHvJYUoQCf67IhLGl8HRY/+zfNzNlgk2/nr+Tn3Mqstv6IrYXv9
         O6yc96hV3WOnM2QXCEN7KV8ME+W0McQBV74ga84Wm/rLR90YhGlY3USl8oVO1arzLhp/
         x10w==
X-Forwarded-Encrypted: i=1; AHgh+RriZoYamK5kHV2h/xcRYXR0zAc/KpDIpwYCz15jLcoD4SSPLZ5WE+BSeEtPlYHleNPAU/3AHCYZfQfjAHE=@vger.kernel.org
X-Gm-Message-State: AFuF++ld1Ug0sI3GCVUTtnLS0LpT9efLJZrUmt4K4UvRPz5HblpYXCPS
	hZkYye4ybEjO6ZcZZp0BmtGoNzjVM3TLAePuz02IURZnoP7RUv7DyXBQ
X-Gm-Gg: AR+sD10qSypKWH5n03oQfOvviVHs+c9wQIbk+W8DwS3+IDd0pGB3tqEdQp2wCn2F6LO
	cRn5MIR6SYVta5fw6CcEzaHXPM9D7m9W0AY4GpdyC8nlC8nFOrf9MgKj+1uaZVsNhCE/rMFepon
	QSyOP4DGHTWI6DuaRgAsIdh+DPrRaOOpyX70zaDciDim/CNk//dxoE82ZcNFIVUIXlwb/1qqrED
	dM9bT9wkjb50IZs3rBbB5oLN1dZYxmnxwn+u7SPBndRkxtqWRH6I6x7QfdwYpb43yu5iTXnn/OJ
	qFdwiVeTssUpKcC2C7NnXaePP0097sWkbGJgcEWNbpqRXZQoU9RM1ANxA4WXc+4OwGGX7GscQq3
	n5eqUq0KW3Sue/ps1ceDgKwaYXygV7YSIScbLI+nSWObgQAnlD/vid7WdO89OCqiScU3ZFyyZUi
	mM0nqpDBuRawMIxWAEU1bpPvfvjv7BYmzoN3DHjSPbeXWEm3a/74H/J68ChcdGPFPGH7a/lQCtK
	yq8ybdlqhOHM3tXk1vAziAHej5U/wNfNYTc6lBnVQ==
X-Received: by 2002:a05:6000:18af:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-482f798ba02mr14832982f8f.1.1787933724077;
        Fri, 28 Aug 2026 09:15:24 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 10/15] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Fri, 28 Aug 2026 18:14:52 +0200
Message-ID: <bc2f1613db42a53f7c53c97dd98ae86482c9c1f2.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 throughout the calculation so valid link
frequencies do not require an arbitrary S32_MAX limit. Fall back to the
existing default timings when the frequency query fails.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..6c17b37350f6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -209,7 +210,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -288,18 +289,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;
 
-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	int mipi_freq = 0;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
 	enum atomisp_camera_port port;
 	int n;
 
 	port = isp->inputs[asd->input_curr].port;
 
-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	mipi_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (mipi_freq < 0)
+		mipi_freq = 0;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -310,6 +311,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);
 
+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %lld Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
-- 
2.53.0

