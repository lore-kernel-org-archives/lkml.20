Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C744137AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270397; cv=none; b=eBB0v2621/S4t6byzVGyY4L8b5sr6dg9YV6eOyXkNkBZ1abgMJ2WOUWzTkynxLoI9dZDQXBJe9T5qzM5LAkuQZ99RadotzMCI966eRmDi8cILITCleM6teD6gW5YTUVNwk/NTkOzxQVzVnq0YvUo3c8WJ9ifVIA7xla+ao44dlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270397; c=relaxed/simple;
	bh=kNsp9G05G8WGjn3P3znsOi9X3ME3wXj+8AnD9ltBjcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWGbXg6Tnb6Lh4USwoQZKi95gVCp9XjzLHKNHJHPI9YpSMUR6m6rc6axbBfUzqPfhSFp1D4QKJXZym2V09VDjn787D+Yq4COmGcM7x+II/Os0cQ4UsQnt3H8E5Ek39jpi2RpIWbPhl3dC4Fs4MYdLIE8YHbIWE/LyfimRDQmpEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXwOxTP2; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXwOxTP2"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so19027661fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270394; x=1790875194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNrPKdIDWghZHggUCTG80u3uh2+EvahbyhlOPaj6JDc=;
        b=VXwOxTP2x3Zk5wJvuUEvQ6WEwsE+vszoDlPxxKoQI9SGfPWoCJMdLeZf/Rg5dggrJ9
         lW+K/9OYjwyJzItmIa66+luDkEnbiqtfjgXg+5RbGTFvco4Dngbr33muZJA/Ro3WtdsE
         mgip82CtxguusQzUEsEjzpEJPtMpTi150DQYha6zJ4PR6UlEWvBKZ0C9eDpo5vo11tB+
         3PvI3Jj4226s/qa4DbFa2xw6hA1YeRSLNV9GTLfid7QImuvvIkbq8pU9ATdaxtU4bJIq
         c863l4y3hmiS+O0wpzfBLXiBtkLK7SjExJUu5u8kRkA5YCohB1I+VyQoZceecORizoCO
         HAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270394; x=1790875194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNrPKdIDWghZHggUCTG80u3uh2+EvahbyhlOPaj6JDc=;
        b=UF/ykbbvrM9oSTgu5yBxCwtyZ86/Ns4e0tjlexWdwayOGHatITbL7NIHLlmkeAN6MC
         nuKUO+9V8+S1vTZtPLPHnbv2PIbIz9ZPw8lbcFVKd8mvD0M1f245pl9/+jApxFkb4x0i
         Mq2fG1GNMrlXMraJLAC007GljSm4PRceLAuiJFVs88uNIRdUVO53bT396YSb033RHmZP
         WvRGZP1D2QwPk8XwXaLH5pL86NX+Iiax5zFpS+GORbism/4J19/mk4m248n68tEas5Q0
         4EBTfWsjDvPP2dHpm8+0OLI6WF/8dBPFqvocOE7yIbBiVG60HL1mZP7yD0kQVEJi2B+X
         23ew==
X-Forwarded-Encrypted: i=1; AKwUvBzx0p6LtewgxSS8qtA71iThZV5t0LU3IiBXxngyrAJLa/ErGigbVZWyIpITzMEu1YSRa3Aj7ruqbQ16tjY=@vger.kernel.org
X-Gm-Message-State: AFuF++nxZI1ya1rm8ZoV6Iu11xOr+c1Alka59sHKzbVLrCG/0gB4cAid
	x+PKnLWETRPEbsr20oMDw/FqACBWx99A+nsilXu1Bbzxc8+GieI85PDD
X-Gm-Gg: AYBFou2qzJZ8jRnmgQnUySYP8Xp2woyMfQNhFBF6iXBf9WUdXTVIILOE2ZJrPB/UowM
	B+6amcDRgGXE2FJTSNVBJbYU00H3OEQuBHlv1OhaUwJvxnwJN6kJr2jQwn8fLfxAJ1bOraLT0Az
	2igc0ejpAKAZn+AxBK6hsHvqf8zoBYPa2pQcVPU7E2P9jqGkFiGD8r9k4Ik4UwKQDlhXQCwAsFl
	ptSzc595Y/Qnf9GR7hFdcGmGkSPDSR/bNlw4FmvE9Vu7gYVKQPqJzfZg6plzrMQoKDRq2xei7Oc
	HdL8GWzLiJGYcFDs/Ml0TH4jMRmxOAwAU0qcZTviq3COeee6x/NiYuBuA2xDuuzHrt7bbOiMAsc
	pS2JvKdr77/QVRLkPn6V7ckhnjyXQg5wbOZ3R1QlbhnmsuGCse7mgdMZ6erSVY5jndDSDS1LV8l
	q87XZ1AT0RFd/+b/5ToY4lz3rHnhv085GZgHW0DnwSLGWIce3uHD5Sulp0qUCEMw0w16aIFIdek
	Kr2gtzJosymEAg=
X-Received: by 2002:a05:651c:31c6:b0:3a5:d0ad:7df5 with SMTP id 38308e7fff4ca-3a63c0f6fb0mr7777901fa.21.1790270393687;
        Thu, 24 Sep 2026 10:19:53 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:53 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Thu, 24 Sep 2026 20:18:20 +0300
Message-ID: <20260924171820.1179823-5-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI-2 receiver already accepts MEDIA_BUS_FMT_Y10_1X10 but the video
nodes offer no pixel format for it, and MEDIA_BUS_FMT_Y8_1X8 is not
accepted at all, so a monochrome sensor cannot stream through the IPU7:
the ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 only
produces Y8 and Y10 and no configuration can be negotiated for it.

Add the GREY, Y10 and Y10P pixel formats, mapped to the RAW8, RAW16
and RAW10 frame formats like their Bayer counterparts, and accept
MEDIA_BUS_FMT_Y8_1X8 on the CSI-2 receiver with the RAW8 data type.
ipu7_isys_is_bayer_format() treats every raw code as Bayer, so the mono
codes take the raw path in the CSI-2 cropping code; leave them alone in
ipu7_isys_convert_bayer_order(), which otherwise warns about them. The
two parts belong together: with the mono codes exposed but not excluded
there, any crop offset on a mono stream triggers the warning.

Tested with the VD55G1 on that laptop: libcamera negotiates Y8 and
streams 804x704 at 58 fps, and Y10 and Y10P stream with plain V4L2.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c | 5 +++++
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index f34eabfe8..3067ae942 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -27,6 +27,7 @@
 #include "ipu7-isys-csi-phy.h"
 
 static const u32 csi2_supported_codes[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
 	MEDIA_BUS_FMT_Y10_1X10,
 	MEDIA_BUS_FMT_RGB565_1X16,
 	MEDIA_BUS_FMT_RGB888_1X24,
diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
index 67a776033..10908383b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
@@ -42,6 +42,7 @@ unsigned int ipu7_isys_mbus_code_to_mipi(u32 code)
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_Y8_1X8:
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
@@ -88,6 +89,10 @@ u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y)
 	};
 	unsigned int i;
 
+	/* Monochrome raw formats have no Bayer order to convert */
+	if (code == MEDIA_BUS_FMT_Y8_1X8 || code == MEDIA_BUS_FMT_Y10_1X10)
+		return code;
+
 	for (i = 0; i < ARRAY_SIZE(code_map); i++)
 		if (code_map[i] == code)
 			break;
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c6730833..c9abd4560 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -54,6 +54,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
 	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
@@ -62,6 +64,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
 	 IPU_INSYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
+	 IPU_INSYS_FRAME_FORMAT_RAW8},
 	{V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
 	 IPU_INSYS_FRAME_FORMAT_RAW12},
 	{V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
@@ -78,6 +82,8 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
 	{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
 	 IPU_INSYS_FRAME_FORMAT_UYVY},
 	{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
-- 
2.55.0

