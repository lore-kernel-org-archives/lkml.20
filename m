Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA4D3ACA43
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933722; cv=none; b=gK2PcXX/v/1Ze0M9ZKiPuDlsVSH24ywLu3T+SqKBM9Yr/+C35J4F9hvZumdIytFNKeTS9uAjMbYHQR9Gl1snK+4ODAvBYAliV6kQEMQ94pG/9KIpefbEZbBiwd2sT3cVXjLWyHlaC3/G/o4L0g9xWUtBnxu1GNdkf1JKQyqjAh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933722; c=relaxed/simple;
	bh=iCYX+cUaCtQ4bN3ALteiERNIDMz9F+FipYW2g2utSpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPeBw8rzX7zTr1OP20cGuDTeEkpwbpIj/xaAhIlKIUDCVKy8cIP+5OB8pOlRTWDJ0lOipEphTP9UCcGg2dmm9gnQEZB20jj+6jwj9R8R/yRonb4ItW84MnMqXPxSNNkVK77+TliF2yO05BPhVfujiR5nO6SHMg8ZQPJJtQ2qgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPr2uaLi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPr2uaLi"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fd4531020so659851f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933719; x=1788538519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQLeqh8HcDgzW1atthmYStR7xCvFnxlRC6GnRW5zm60=;
        b=WPr2uaLi3pn4JgxjWSiMEbSe8RYEQG0v28uw7QFwWS+G88dUsD6sZI0iN8sqjKEWFP
         sU7zKKNjWY7jxI3ZpkuD/h/I/YUnd+zxJTDPobPh9EcgOinYyKaDGpeKWs57WY+/49fJ
         dUUoGUkUZdBReeJwVPQRW+L4IESYOJpEflxUC28Pux1SJ7y0Ag2jHyXEfbGEShzWgqj8
         ZRfxSFCubigdxAcUv8XAD6H4SvN3qmZRs6avEwb3rXHmcH8t4qeWrNc3+Vy3d2HXE/kh
         oVFPm+uSN5siihg3WzOldQOzaOQ5VZq+rg5Oh7ONZXwlRsEHJ764o/+CMaF6VD/9W/By
         g2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933719; x=1788538519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQLeqh8HcDgzW1atthmYStR7xCvFnxlRC6GnRW5zm60=;
        b=GTqHMYaaCTKvmzPO2VCzHYthzYokqWkXU1qdW+eaXTHxiCamWUkdaqWb8nEuUDbCjb
         Yd6MG3uGRrf/6lK70QXSFaEJJAbxQ3u2Y93bB6i/HHgDHR7jS8DFLS+HGB8TlRk5H4N3
         D3Z/8T7b92xRFcFdoo0KA4fvkrG4ogzumvi6hc1oFCdQiJIcLwoCU8jEwuGMVkLfVLeL
         Dv0wKORf6lSiHEzxMM52i4zGXwUDzr3jAcIRarKAx/XTFqqvfylMSByawZuubBwYBglN
         CPmjpiX1gcLLOyYLHqkeBPmPv338Flfh0Z+C+887/cnI2dGy1cTehsP77wMz7wMZeNM1
         Xz+A==
X-Forwarded-Encrypted: i=1; AHgh+RpYVgd4dhQstle2hzyoCH1aOLfOnHv1DXm7dcV9PuVr2oUq/Z2uTq5l6BJhsNq9/9zb4gRATYHzS6rk9dc=@vger.kernel.org
X-Gm-Message-State: AFuF++mpLJdHfakxrr6MEEk43oq2cUkjTDKQJGKNyYxgyS1E2m8A31Th
	VO+sJbgY0/gEDBLk8AQ2OEboASIgTXooTuOEOTIwXBjrB0R1QZcjPbElres0wqHu
X-Gm-Gg: AR+sD12ntPF7TzXLmaZBiKCypjp94tFbRVkwITzJdeD/3h4PIn+JaVRKZg9b9i4G1jk
	mpzX1teptn4vUQIft2fQLRxG8TxoOE9EKihtcAQIacBnwd3vMPTyC823DQyzusm1cLjK5tSzOYM
	T05dczH/dtXSKifLPhmpDvNfWLcNki8Av3Av6EYBjx0cFt2Si83uQ4G58/DHo6HygmG7QyLzocW
	aeoFGo1jmU5jJUXUMy8LAQFUFzyQvCA33v4uW/8jWc5THlgfxZr5VMT8dMStgUpCGH3rwJ9gQZe
	wfK2Du0DHl0V9EF/6ltbCGocxLIYKPSlZTHheh0WOOSVLd4hVLK/w72pRVRhyQS+oV8nCklaEaV
	nDqRB4IJIPvDG6Wik+Mw6GSd7ZR5f6Wd2sccw5I0CkxDIAs18s37qDMNrsIyr9iBFlHmTMq1NL5
	zfXCz1CoqQKQtxM8yDyKYPOukdEqHGGLv7Zaiu1HKUqDh6ezkFovewQPCghlPSWP+qgG9+n9Ta2
	3XOpKetXxEW0+0uQaO8amSjSzQ11EN0RFmRYG6IXQ==
X-Received: by 2002:a05:6000:481a:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-482f7977a45mr13716275f8f.4.1787933719359;
        Fri, 28 Aug 2026 09:15:19 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:19 -0700 (PDT)
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
Subject: [PATCH v4 08/15] media: ov2740: support 288 MHz link frequency
Date: Fri, 28 Aug 2026 18:14:50 +0200
Message-ID: <8ad0d4958d140486e69c05e55865df49e55cd5b9.1787933456.git.mauriziocasciano7@gmail.com>
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

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Link: https://lore.kernel.org/linux-media/apF0Cds9fnqQ7XRg@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 45 +++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 18bb3ac9701f..c67fcbad5bdb 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,14 +12,16 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
-#define OV2740_LINK_FREQ_360MHZ		360000000ULL
-#define OV2740_LINK_FREQ_180MHZ		180000000ULL
+#define OV2740_LINK_FREQ_360MHZ		(360 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_288MHZ		(288 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_180MHZ		(180 * HZ_PER_MHZ)
 #define OV2740_SCLK			72000000LL
-#define OV2740_MCLK			19200000
+#define OV2740_MCLK			(192 * HZ_PER_MHZ / 10)
 #define OV2740_DATA_LANES		2
 #define OV2740_RGB_DEPTH		10
 
@@ -91,6 +93,7 @@ struct nvm_data {
 
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };
 
@@ -142,6 +145,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };
 
+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -468,6 +479,7 @@ static const char * const ov2740_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };
 
@@ -478,6 +490,12 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -502,6 +520,22 @@ static const struct ov2740_mode supported_modes_360mhz[] = {
 	},
 };
 
+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+	},
+};
+
 static const struct ov2740_mode supported_modes_180mhz[] = {
 	{
 		.width = 1932,
@@ -1178,6 +1212,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
-- 
2.53.0

