Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4184A2617
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289507; cv=none; b=HuyGu8kkH3QPoq5/lgOyacuUZTHKcvKLq9izPvWS8PUwvoZjSxAoHkvoxfNQurkl0cDkJsHoBHuPT9nb5K6TkKjq0otDoJTr4yGDG1aSVoW+UWxaf6IQytNl2sTX5S3RRQPVvHd03i1wUZF9pTAAgWbMdAkGlUrvfii5RlyZZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289507; c=relaxed/simple;
	bh=nDjXt+isRGGooTXCaWuWnqb5pe5EC5+ZCK79Vbzm3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk2uvk4pvBQLoHP0BGgv8swtX4Etm/vaF4dCH/RexqI0Qt8MriiPSfZNVVDCKTUp57w/qHOdu3WItAMfuPcNsMmuKHLNa4xvXmq3ZhLn5Nwah41hSvdqBl35PjZ7X+8eIJq5w6iIGHwEX2rv5RLsfCBl8yjo6/UGJCPhu/74t1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAPAKvoO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAPAKvoO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11339255e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289501; x=1788894301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=VAPAKvoO/35OJ6n8acq4ug0stbVi6OU9nMKmG7D6AhbTApYIVnn+BscTgcnRFXl+Bp
         lsOLHSe5ZGxYAyM1EQ+q5fHQOcA4v/jDkiwDosqiPysfuarteUUxlk8i2sHvPg+FlISe
         c2MrEydCC3zoKcQ7kGQVjA2CxgmVF4TmOekYi//rM9PTSNtdGAAUiPTVSieaoTO0BRlQ
         qj1wlJwAMgIZkyGI+wd198Q6MPEHoSdGcD16EtmdldbkbBgYWHvR3t1WJzSxH59NWDjQ
         svdGy1t3pPfO8S9ny1NcLV/SYGEgdeFrGbtiK1ukmuQ0N7QarwjsrepyFNIdqu6rtR0u
         TsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289501; x=1788894301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=Tuc4RXxC0TvHPym4gIKSSODEsGSqCynq6vSntF05t4wmQHo01raIvgX5UHHi3IGfPI
         5Qk9k26VxBuP4LjzmwG+io+g9o7KHOASSwoaP8n5jexPgxiUtg/WDU3caFnXC4LQUl/t
         361YTsBj8vPq5CiZj8KanVn4mpP8o/6SpH/KI8rv6Lur5DkerpqD808JhseCITY7x+C2
         YMzo37TvAUQxPbOsYXpLpDJtK+ENfLN0Y1NP3a5k65WceoHrWjzqPgYJHwOOkDSyNqJg
         PSBuTccMRG7ZeqAc8FwDZLgv71Ln4AAwChfJhiC0eaxFF3NI585UQMobkry1J1S2MWPV
         DqiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoujZhWTaRf6qfXvga4mYNxL/tbc3Z6FL/QuAjC0CIjZPVb480NVAqenVeWwPyFQiDNyMp4lXfLXUTQ43s=@vger.kernel.org
X-Gm-Message-State: AFuF++m1AdUblTyFqNOZieDE04R7uVSzUoApQKnyeMva/IiBtGPLjYG0
	dignZryv46agKJqG4sCe2PjPzQblyLLFYglYBRoCiV/fqbHZ8eq8wl7F
X-Gm-Gg: AR+sD11pg9F2sKaIRd9Vt9S69tanmprVFFxuZPi4HIGkmqXKt0/YHRLJj0ab8KOsZOf
	4dOfnWasPof+4LH6Vr/Ked0jwipQOwV1ibzTz71R8jX6L3M1mUfPAqhzFE4xKuX7mcDq0AcPdl1
	wGwg+PLcuMSAQhhDYNcD8X4sukuBs7r+FziHpzrFr87hQ+U0pdNzW6L8Yb6w/kFc80m1imo18YS
	uqw9ETl4SbcBSR8OFIjlJJQRHPN3kZ6uwZPltlU60zbVUq3jKyeXfv62Z+OJN83Nfn7bm+pSpcv
	qczFKuCNFF1Iepp4I6JgvfGbaOQ8NFlRHFVNc4Fk6At15pHN+mFqZk7/Qyimas7jQCdTv8RO1EM
	j9Pwv7UWzH8OmOeCfBjAqs+iIfFgfEZLc8+Kf8h/AubNmXR4QTe7Ypq+T2VJ1PiVjXl2WXrni62
	8IF16MPh4QX9XjM1+4kCSSP/1rKtlbXkSoQ6nMKpOghijgLx7ScYBqQz7YC8LBvvOkNHYYsTgPA
	kGIGRigv5J3XYUt/mbFIIPqS25wFEWvZCRmmTpHcd8WnQsEQzRc
X-Received: by 2002:a05:600c:468d:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cdd418c7cmr99313195e9.5.1788289500861;
        Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
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
Subject: [PATCH v6 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Tue,  1 Sep 2026 21:04:32 +0200
Message-ID: <11cf61a4fbbed4307800cf8a89632b2efff88ce8.1788286339.git.mauriziocasciano7@gmail.com>
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

