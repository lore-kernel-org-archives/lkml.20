Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26737C906
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199285; cv=none; b=g6b6EOv2qxVC6thRz8SzURrLzQ5kYsc56K/ogcLyPT+f0k86qrcv11sHKYeCe0JVf+LLlD9xzfvhW0oWrw1P0XPrnB1W2ZOfZKING/cU9Ycr2vUyzNCx4tKt2YuDioP/T/15NI5EM7remupQ6iF6b0BW9oUYEGovYq4hF+pyBYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199285; c=relaxed/simple;
	bh=PlRc0R7D/QoQEzgbshE4c6VTfHtfTo0G/OsAztZl+rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ck5dGsbP22JgR/4aro7MXQsOxiCIJRhQppHazqDjMZDR5+QlDDOzqacjy2cTAkodn8+nxvDTWdprqH/lUZE+dXUS58tu90WEpiqNepAOGqQjfmBKxE1pYqMQH4uR4uNk84eTHWWrU+aWt/exk8F7SjGb79eqFUREXQzLNhvRZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+oshu81; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+oshu81"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f633e6058so3032176f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199281; x=1788804081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wbAJx9PRPgYl34+g7KARtAzX1UG0zVvV4TvlX4f22Y=;
        b=c+oshu81lHDnr2NNlYh0B6rnNUdZBhR+y5dqiFFdUVLndoQoVN5mTVc0lkGzObMMLr
         JaCvHw3CxZrbi6Q6NUV/pR+8sHPorGehWxp27qPBZ4DREMAszrQn/yekwCoW1IDXiB8K
         eTA1dTsV/8JHnSTc+ITkzzgmZKePN4EbZ3fqv0Oxa1LzdIY0k8cjwJCkT7o1MxitrhDD
         oKzJ1DciQiB5p675mamWhQ6ay10Jm26hMbOA3X8hLMTcCM0+VRAtTAaCpK4nFiKAICcj
         89o3t9dVYxpr2flEIk6i/UII65+r46eXpbCKoR75aaYXVfP2Gbt3bF79WHj76cvwCoLq
         mDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199281; x=1788804081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wbAJx9PRPgYl34+g7KARtAzX1UG0zVvV4TvlX4f22Y=;
        b=s+LcUfrgMSaY/NZx+WA5srcC7Puk/X/nQkV9ahXaQGJRZFUWZ8Bp0CGrEZsYa4HJ8h
         2Rs72vOyehG5J0jxKjkynhKo082fpIkjWbcYPAfsrlYubU16AvKRhYrijZt71o95AZa4
         cR9Z7U8/MkxkD9FWcdB9Js2jae0So4IwZT6tLuhj3jzQWLxKubtm0fd0BNlbdKYr/Pa9
         MeSyk6/K/7fAv2BRFJRvmarEe3j5GFY2hOWuUPPLYDEf6S7X2/0T0FlQmO73kM/7DVtD
         fXQ1iok9rebezahZ0K9zw5i8wMyKERaG3aGz23EKpHbmDURBbuLDPM9tdDlMsn+MrbXz
         JxYg==
X-Forwarded-Encrypted: i=1; AKwUvBy4TsQ2ZC+w8ctWipO/hQTqDP9QJ4nJ3TzFjxDUHl1BxMKDUCTD2MGqDs9g9830ndweBdp+Lq7Xg5e2GzY=@vger.kernel.org
X-Gm-Message-State: AFuF++n1dZnxZeiNfY4U4AbBqxZLweJNSVs5/KMeOrcUuslf3dLOGTaE
	fVGC3C4HyuT1xA2BGiOdoTV5NgOmbg2gZSK8ktwnO43j+oZ1J80xsDdU
X-Gm-Gg: AYBFou1gaB+V/ARNVikVUuh0lqiLT+/nVa2jR0OrSfhG13ctkj5zKMBMe5mJ2wBpSEs
	tAJHEmgOWI1noESWt+aZNYdYZZjMxQdh3tkMO6bwicK+/5ZNHG5sVeyoZIgFAdaHkX8pSROda7X
	mldimRlvN9MGRfMayi9VAWQ9ueuh8+pyR34SSYL2QPnL2l/jeJoIn5aGmHn7m0vWWA2dM2b4SlP
	I1aHQtjBUG1WYGBSinBNyBl5ZXQzyzbQR6v4VDrXdiI87PSd+lKFORwBOOnZCQTPXGwN/8F6+ew
	wbvUPgN0/f163rgoKhJSnwum4+MBX2wQGQpFPm15ZgjF+KPRobINd7FUi8ayG2RXelHxsppSBU+
	skpNSYmItt6Zi+mR1ASyLSEIgq44HfgydjlUIRTQKYhEkh9BnE9vG4oehT+/X0h+N3IvUQ/o2ms
	UoeacmOwhxlwNHTJYgnK/FXxaiwCvNQ4aViiZuAcrlSPX67wpUHG4gLQOncTJMrOodWjCddXewr
	Bks2LclHHITPlhO9GXcAWpkr9Kz4OsUjb3qz/Jhmts=
X-Received: by 2002:a05:6000:648:b0:484:41dd:ff3c with SMTP id ffacd0b85a97d-48441de004cmr539586f8f.18.1788199281368;
        Mon, 31 Aug 2026 11:01:21 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:20 -0700 (PDT)
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
Subject: [PATCH v5 08/16] media: ov2740: support 288 MHz link frequency
Date: Mon, 31 Aug 2026 20:00:53 +0200
Message-ID: <20260831180101.3109854-9-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

