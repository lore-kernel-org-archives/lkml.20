Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A174A5C55
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360849; cv=none; b=kXEg75EHLEWvkYY3j1UtCciCcE2ClU9m91vWfh2zSOY51Tc3ModMztDnRWnJEEKfwdB2eQIqPZtTfiaZjMOToa0lFLa32eQhOYnrtoJUpP6qoC187PzdoY7idnq5ksAtbvHRtQjUPKYheJiFXCUxdV8uqeiIc2XjQOaXrrsBfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360849; c=relaxed/simple;
	bh=4JjOP6xA1fWJTzg0nGLviFM/abTCFakLq0J+yMqID+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnEQ9smefd0eMMK6NlC/SlhFS7uuuiUdVngLgrIq0BrE6axehAdaKrbpQV7HE08gDaUN8aW++7hRpCoCxodDzESxNWkuiJVcLFzlCdAqAuXjD2pa8ZjK1ydYupscWgOHBL2WN7mt+JVUwFabu0PP2x0W0OboJ0HUWU0DOtvCfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkmlr74p; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkmlr74p"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1164054f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360844; x=1788965644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=Bkmlr74pF9BV96kDstPUPzeMqUcJzUMl4FDP740XVLZHDQYIWJiRRRXmeGDhLc5k1I
         hg/bVgD7Y/034NFFH+98nYXsPlOs5qkOb2UQi2wRAeAsx1RvRRkRRFXi3P/A/T39UGmC
         pJpe5mOwic7isM0lEOBDEu5OmFVl5sQtWveWTbSxPllZbIw0Wyo4eqseDa9lIseig6wK
         xKHPgjP12E5Xodm+SQpQtX7B/rQdKiYdlYwNaIOR2OMfyCRhJxvDOlk4gJiilKHGTX4l
         ZwOOBvjdWiFZmrrYpxT7ZongYZxrU9PjFYMqxQ2DjVPSBfKXRmN111Srw92IUU1v2/au
         v4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360844; x=1788965644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=UcNyLxusJmWbZzjDu75EaqHkwWh5+onZk/DWLxDrEItrhUiB/8+kr8oUsK1PxtA+f1
         m06VCIZHTapB6GsVYgl7jEePmnVmC7z4SKzmIq5vOiQrHthZ58XWcZSKA7hTRYMtc9PK
         46gUooB9Wl2bx+n7YCmcUfn96GLHHv/fCjZ9ES+Izmz3cSNx9BvJtvvAQdkMyrnfWgxy
         Ec/Mcjouu+2pPbxd0Nhu/rxriPSr8+vrpelMAaRgl/h2TLW+pKIgUvcwLgqs4CPtUKjC
         vpCPxVLw9bJbd9aG7lQHpxpCOTiT6L81GDoy6RkGdBnnAmQtKEzjk5BQHuZi8nlrYzK2
         STWg==
X-Forwarded-Encrypted: i=1; AKwUvBxObr+13jp0IpcUf/p/COjbBW+avyudl/0XUiBw7CDfWV4ArkHAYLe2CRUM6exItfPHmKoDBupVELy6pDc=@vger.kernel.org
X-Gm-Message-State: AFuF++mwr0L/qCdQs96IDq1J9MIkYevnq6rRzo9c9ptoNHahLrM20g3E
	cNU8SXhq0adInM5Iz6i4AVAXaO7GcuPKK+tcQcDJ3ZFvrCVUMDxV4oJx
X-Gm-Gg: AYBFou3WABK/y3i3fvVYwXiyBotlWL4Ix4lkaPUOTKcukfSOFdBu4exTO3SbkoQ5nGt
	KNcgWNiJK8MV6xj0k7cBmd65fJgTgy3fVXP/l7RTzrzCT1/X4DYfYFREvq5l1BvXlYZvQAp3psf
	Qsl3XOvgYaitde+YqbFEWghlO3IvvpV6p6IpcxYY5Cnooc7+AsvWQG7mcMcUZCISpHsSoKUVLWu
	1bReRkYMKWNy9Gg+yvNEm+2QgJkBFOCTnCRdlpRRvsMoMYFgeKzY9zwoBDhU9Y+vATSOvwBxP3t
	rliQjCkBqOPpvnOA+Wm/tOw1c7kcVKmWUwTiUVbvVxu26QNvWsW5ViDhuOaA/to/lfjY6V+rW5o
	xVMIxyszb44HtO2pl1SLV2DG1AYHTNnljinJu0yWIoufkypqhSR6pUR0CHaPZ8vSV/J2ukNrzNz
	2D/Op9wKBwj/eD6+K1FI2/VAzK0H7Iy7+aZ8zdVdIoy65QedXu7l7dShZw09qm9mZMGq0mQkv+r
	H5+fAO2QGXUqmyX/U69sAEdK5I7esQW4zN2oIWM2WGWEBbayrBZfOY=
X-Received: by 2002:a05:6000:1847:b0:484:3931:c698 with SMTP id ffacd0b85a97d-48488dee004mr9537119f8f.5.1788360843914;
        Wed, 02 Sep 2026 07:54:03 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/16] media: ov2740: support 288 MHz link frequency
Date: Wed,  2 Sep 2026 16:53:37 +0200
Message-ID: <f86a0f5b228f99bc045cd019d89182021678a0f0.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 18bb3ac9701f..f3d91c87b3d5 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,12 +12,14 @@
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
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
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

