Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7D47CC71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289500; cv=none; b=eFBt4vPOvv9xN2I8rjSlMfA237AN0EjhlnIz1zouL5KtharLXXEqpI3E9+sT1vGIi8XJ7enWX009gady4436q7ulzDkg6yS+LERXe7LbOEp6UEmfaN0kZ77zRHPhI85LFaek33a+j3wXKsTKMvDXUzP0Pr0LV260pWlKH2FrtHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289500; c=relaxed/simple;
	bh=4JjOP6xA1fWJTzg0nGLviFM/abTCFakLq0J+yMqID+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEGISkYyL/4UI0kTXjetv/XrnsaNhV7HjIE0dmaZZ7YAgdw0jPyRPfiDoZ/td+1DcImlsHxNxrpJvtVboia1uc8Epj+dnYBV12E3PtxZPGnkwkFkEN0pOFg3CBCcHYpA6+55rk2+HUD0cFCB8h/PKyhWgqz8BLzYCc/0Unqq6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHSI2Cpi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHSI2Cpi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso966285e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289496; x=1788894296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=RHSI2Cpi1XL4uLINq56yaIGDPYD+PVFNIMEbQLR0tdDF8mzJUG34kl9Lo+T1Yl7iur
         fyl6GbdUd/AuvYiD4IXbJnwcNTqHpzAUHU5qtH3Em+iG17wOezkKj1NNGNPE2AwJiH6o
         JsnsBjG5QEN1lpmiYg++5sZEMAsVpF9H+65MH4yVabChuKv3EAO6kPNHjKreCvY8Mz+/
         zs92NGFRTETY9AZ/UIKfBOceDR8FC3v8I5hUwnAtv8UT5yIJSXD4jXAozPgjmuUOHMgn
         yZLfh63wzlTZ8K5UlYPRSGgnURwOcWXeUr16c5Sk0S47dSXX5XUqnfTvokv4AGHFa52n
         hrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289496; x=1788894296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=NUF/x8DQ7V21d16E+giU3/FTyTn5h1OBQD/Qs4ky/BnRrTg+fh+8+N87ZK9ENKX+S+
         Zjk5PTgqbPfTa0NSK3K/N+jmqOLGYCUQPloKJyF1mA94yJd+uIzlBvVfb0f5rc4IU7e3
         xMpEVYn2eI8dAF1bokm6ZKo564hpKneCsj2rkZ9dlYcbyO5dP0oTccamklo5Rna7jr7s
         d8wwQAyjM1AyRIHMUJhlY8cBbkBsYXkTOQOck629nJ/uTyxPBIgm+m0isRC+ohtAoAQO
         VzoOw9I5duifk6leVfmJFTxTdzUjU4TFxS07nQ8ooxlZP4IHd7yHsZS5yA/na2vmFKsW
         2+CQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdVTDPUj3qqTL9YGV/6KXbFtQYePU7Ry+HYztVBDZioiWyClSA+vsQs+GDz8S8tkUiW8DxjKMq1f9s7Yk=@vger.kernel.org
X-Gm-Message-State: AFuF++lSsX34YMbuTWQFrbJJ8TZDbug6KmVO2hkJLZ8/CMuBcFR5lu5F
	Fqsk5EUFUGTDbnLokMgqNt0TPYy55/mfJ+p2x8iXiZhUKDUK4QbhgsxQ
X-Gm-Gg: AR+sD13zp0CSnaVxaFwsP0jFSSb0w2JrM3n60lsIR+v7ju+gVm5J4zptRXMrqBTdUmS
	TXBMGl4as4u7DDyLDTtL95GVrUIj8CBiAY1cYzqEyMAz3aX6pFw3rr5dTT6mxncxx1XClmPKdeo
	x3Zb68PDM6WHmMxUPXd0Mm7xM3KMe+jfURCJGequYsuUCdaynhCZZoyyygxZAPNPDE6J2CSMFW1
	kKTqV9XiUFkE9oaOAbTboDVi4tvq0EkOXmg9nN4qbh8MyM7aWQLITUS2aA8IxwOtxBlpBdign1D
	QFkLmw05+6G13BBPla+DhPdPhWegfvIfyKbq9M2p30APIWosVMYesGetLjxwRsCNGUswPbVkfCy
	XNral6ywAOc9MTJMlJhofLPB+o59ckcZ6lsnwfEor5blUTxS3GnatFtgpVyuoZ8Wt2Xr0jKCv++
	1C5ofm2R0RBSoUpjjiLcRlFq1WM/lbTToz5kkyNcLNST0HccJubI8RVBkWXe6+HvZPaYWWbqdNl
	IVX1p5+aMujvIKPUGnx3eSzH6pR419zFiKmy/Q0Bg==
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr481597865e9.0.1788289496316;
        Tue, 01 Sep 2026 12:04:56 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:55 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/16] media: ov2740: support 288 MHz link frequency
Date: Tue,  1 Sep 2026 21:04:30 +0200
Message-ID: <f274b7459e890f05015483804cab62ae0647ae12.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

