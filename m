Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0D3D3D09
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079882; cv=none; b=MAPb6HiYdawppxIa5sNpe6gwlxMi4XtCO0L+3PZpCwMfcS8io1uIZYXhZkAmKfVBljoC1v6nr3E6B5/w5YoS7hbPj3Vtw23Vj1H2Yzn3e7jECLJy62tDEXIAhuK6VGqSG85QBmeWKX2iihecDOOpsTM8AsqhEkWUn4k9a7ktLrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079882; c=relaxed/simple;
	bh=eoAGtS5XufptMdU0CaNJ2RLnJ3OeUveINEeLfNUGNhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSJ2wWfdMt/g8o2o2I0ikbA2o37F5RTHW1Z+DenOGJzn7VQDL5GQGi3xFR4KNTVMyGZlj/jmEFCUm9Y9coslBtm4F4Wr/4qqeW93GiI5JwivEfQjDmfzaIln+LrT1T4UdxS2w2IQjkBZdpFVzAGKx8NgOLkaaxvST0TfGvIgtiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oHLneqUv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oHLneqUv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso96353f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079861; x=1792684661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS5ZrpkB0RsyL8XlpuODb/jKxfXfcHSKNBqSqEyqBwU=;
        b=oHLneqUvgFcAAVJYnGOPYU+8LqW5kh4Ims4gj5H8w4dKvuPc8Attsleqg6tRsellfp
         2RGqERUemPMW9Zr4FfCRcrQfe2/iztE+EiFTPeG3wkf49iR6SXTfv7UfFJ5+BRWsLuJH
         XA+iRFMjzXLIyANj8bmr9h5stGLMdW7Y+gAMhNOJLxqu43xGVFtJtFtAZAQhGpJvB78E
         pTPaiTSN8BR3M1JRpJoKZ3b0CeCZtt7WF08TkstWpv0vqpuVUyiny6pABYprQ4KlR1vp
         9JdyMaypvTzdz5QpBD4h5b/IlQv9wH/qphmeLCBuLMZ3nPTTmFm34sGimPK9vR8VYRxx
         7h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079861; x=1792684661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GS5ZrpkB0RsyL8XlpuODb/jKxfXfcHSKNBqSqEyqBwU=;
        b=Ry2FhQnVGNa9dNofSaHL5YqynDcwEmuOa1ii1lJ3bZDmEE0Cr8jkbwJafq6AipbYlY
         hrnKqUxpyl3iNR5h/6DFH4y8U2gdBF5w05gfN7V/a1YAicaAeix7XCAICu/dyWiv2qW8
         UJZZjFNoSOQDZyADVxrfO05e0NVWEs2usgMcaSmAV03omYPmQ4hmlSO+0YlboV+f8qtH
         T2A0LU98/bn8xuWoRxSp7zB+U+9VqgHX6gatoVMhjcADLBXgnn6BVhiQpduxsCbuMO/D
         O/mQi+xcnYhMyACdMo7qGk2Xg92Gq/7w/ArfgumOSwieJEydL0xmq/xbyAYJ+XyDsxKd
         7Yhw==
X-Forwarded-Encrypted: i=1; AKwUvBxtLsWe39hCAsfxA5LQVcjhHURbgtAxEe3QUXIfezaL6zTZ9tO4DEIrC8a9+AqOXLUM9yig0FRM4sG8sGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSCQ+xi2fXYuYArFCY4nh4Ndc4pSLPZ5Q41UX1pBFFa9jPvTnV
	qXMdr0yy+2Fut+uBUWpwRxiX2JZyGAi/JfF/n/qtOKIiws4OMja2xzA/5Cp3dYbkQIA=
X-Gm-Gg: AYBFou2+q1wTGuQ9wL21XBeZtFHKSH+tFdLbpY14MqJI5Boa9cD1yz9VG3lIbFZJ5T+
	VMAxwHeOkGrSjHPRpWUcsenvpt3L7bno9P5A994j++LMpTiXsi90PMDJcZHd4o32D2+u/DWwD2B
	ZVFDX0kwOxfbH7R2MqeoJg5DbI6Nu4qweGSzB4s4PZW903jAT/Hf1x5ChgZk0ymW80IIs47zv5S
	VO/VVZzGkQZDUqtQBxaJ69ImZjUhvg8U5aOYlZKiYE/0M9mkfpM7xbZfQQiu8YBuDZEn14bd/hE
	QetOodpVFolj4IgEJuRs8LAe8N0JR7Y0fjvWbr1G7raVt4RVfezHZTHSpy8GwlS4goRF87ppqEB
	9NiP5conYMenCJuX2qND5UGae6HmdOGtgWJvrDfSYTX1aOCKpEg1LLWtWDQL/8NmOy6+MrP13ew
	SdasXFliPhbjBlacncJqWLqlWINSGZ1I26YIrs4GeEHVGt/3SijAhiKmnts6vtEiJ9zsfoiUDPj
	zK2t7W1RNOL9iJdK6RNCyjxxnS1eka//OkqJCA5OrLnma/fRg==
X-Received: by 2002:a05:6000:26cc:b0:48d:fbd8:d598 with SMTP id ffacd0b85a97d-48dfbd8d5afmr390659f8f.17.1792079860981;
        Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:31 +0100
Subject: [PATCH v4 05/16] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-5-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 189caac78066..0edb0b4dd25f 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -631,7 +631,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1203,11 +1205,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1224,7 +1223,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

