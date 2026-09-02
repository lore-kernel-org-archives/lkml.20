Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F94A64DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360852; cv=none; b=cM4KLox9zQhxAFBTdkr/EAG71L2vePEFszZiip0ZptyuIa6Q3Uv/EMo3Sp2z1hqvW9l/8XKALdv9wcEDt4xm3bYUiwRc++E1xoI1ekXZC0kin5+aW3sabEnJ3tijJKtjKPvh6hcGKe0JrO3++ejN/W+YWjurN9V+D/7VtoE9WZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360852; c=relaxed/simple;
	bh=nDjXt+isRGGooTXCaWuWnqb5pe5EC5+ZCK79Vbzm3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGHXJAtyFm4thUoKEHmb3dmh2rpXleo3947Hh6u7lBmqP+WdyWHbKJVMnzSW0BJQeg158WYtIwS0dW28SQEIcZAm2nYLuY/nEsbGBIkWz0hzvzBgTshQXvSHmGCiIOJaedAa55z+8GoUtQxzBrppcm4WvZaGeI9IOoP62j6OI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwvPWDmp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwvPWDmp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe89fb333so752009f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360848; x=1788965648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=VwvPWDmp54OzPSKtXMA/1iOeAea4K15FkwikpDy3WrF8kn0Lw2Q3e8yRJIcSlYn2Tj
         ZRnKPU1neUBo0KLV4T1ZgjO2OycQ3PwrSnyZeHr1JoZWvZ5ZrTb1qtX0DZUgttwLyhBH
         Wj7ZHGzTPQgZbU5CC5mAR3SfOVG3m4VlUEEAx4daUoDooQwxkJtWYCRSl04I3e3BNf22
         fWozuGis7uHJ5iJ9wYMjw/9DXu9zpEXYePMR1/afYByLGHhG79ARDPlc5QCSiQDATD2O
         eyrEYWx7BLM7T1/a1DIsyB8iz30vSUOvprd2G2Hgd4iFZDFka10+tTKP3/d3Ln/i94AH
         52Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360848; x=1788965648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=D4fZa03lNF9f+m5n4oxGtjx8oDlWt5lha53WufWrZU/mXIgWGsOXojPLUYxmaJDXaV
         E7y01yTeBo7xYOUPJevwqJAbY/SQ3yFG4hI5mIaPNEyFbuwXZFwykchAkaPL9nGbXi7a
         hkX19fKbuGAzl+Fg76tw1P1983V/tQnCsdla2ZLnCAJDUg0CXIPLpvFmflhhnNWC+UdK
         OOLYxlJLe8dLv78xfzCxfgciFiQCCzkyQJKz2emboFZf+6OBvY04SI/JlVf00kifs6mM
         9iEOq1W6k8EHP0z4ZcsHqMBng2zpaY6/g4O9KTBFxt+t3w2yIGfzeDPjM5KFxY3oE8qM
         ReiA==
X-Forwarded-Encrypted: i=1; AKwUvBwF9lcNEyyv3RRovEa46CliTNT3YAbOJrlMh54sOYX4hBG/TgJejZqkouXM8ate/vindFgzZF1lfjLRMLw=@vger.kernel.org
X-Gm-Message-State: AFuF++mZApMs6QUt2DTZjxo+5osW21LgnrTeu38QHoYJKK9fnFRC2+Dt
	2VcXpTA6zMUm8t6hppjTWZaadTM183XmX/vZDy9umWIZdTUGEyAufdGR
X-Gm-Gg: AYBFou1dRdNYvant8Ymt6mZ4JucxbWR7u0Az/DLqbxcs7/c+RgHGFAqMkT2Cw3MKvjI
	2o7Xyq+wRBTGXznZVVSrAQGAuVex8uqcpKYvw3xdkwCoCD/eA4X/dtghdIoY+41+ZrytIVquYNu
	DxN7m/PiUIK/Y5lhDXcT4Tcpd73QJ5T8CqiEZcCfydh8gnQf1l7yCWbD7RpGgkxDVLvCLgNtp2A
	/nE7hRYyDCoI9p9mTpj7vpZyewybxNCebOH32w6bcXyv+emGnTcWD6HKf/IZ8S+LS51SLpzqCCX
	t/Q6w+Tp02beDHwWY+rLY/Yfw2yvBGe5Pu3VZ53u63BhWEkQ813uJPZoYSVZjhU9jpYp8Vf9sl4
	cAWEawhet+1Midi4B1XVwWF1vjVoAkACvBhM8+aDIH7qmlxqtEyG+DCZEEG1nrhDF3Kn/yPQZH6
	l72P7yiSYDk3eZkSMKD1K4KjOi8szAyceWnc6RWHWYXHli/T5fr6lTYVrT6G7yXaMzy66Yp/+wa
	haSuC0Khmjf2ZjsTUUMxJXz9yJ8pg8pTPf05Nm37uuD
X-Received: by 2002:a05:6000:4b19:b0:482:e4bc:51a8 with SMTP id ffacd0b85a97d-48488f07a87mr9665454f8f.7.1788360847525;
        Wed, 02 Sep 2026 07:54:07 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:07 -0700 (PDT)
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
Subject: [PATCH v7 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Wed,  2 Sep 2026 16:53:39 +0200
Message-ID: <2fab63a3719391b1a37a8937d5a37d9150c64819.1788360629.git.mauriziocasciano7@gmail.com>
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

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 throughout the calculation so valid link
frequencies do not require an arbitrary S32_MAX limit. Fall back to the
existing default timings when the frequency query fails.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..5cd285fab742 100644
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
 	enum atomisp_camera_port port;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
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

