Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FB37E5E5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199289; cv=none; b=o+9BpxTfQfLrkVzrsGJ/SrVk+kyAEKaK5VvDNDwUsxjBl/1REnpc1HZ554GCIgrmwsCb2E28MoWrMC7Gi3VmyE1UZb4vkBYPBJHP54wkYmx1Xm+74BJ1zTSn0HTLjj9woOGAPU4CzQL3Z/V4IqWUtQ/sIv4IL1FNn/POeMfj11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199289; c=relaxed/simple;
	bh=h2djYmdDBd/cXc4zcDpBPE6FucNuXDVdHsk049Ec1gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5jqwUx0LNa0fDAZSAG0OdHcpmklOONrPHBuqYQrl2PdZOAFVyFPulhXyDfDVseWcYOnfF2ZtKk+PzqOipO4+mn1QyPMAcBokuBpFb4JEs6c4uSSZ59EVAnUXPpHpje26q/MhpH68QBrjNWLadvuDNINy8bM3WYbtSjhlKE8TAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVArQX7a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVArQX7a"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so140766f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199286; x=1788804086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knnQOguAzItYyCz3/I9QK04AlsKpIBVpLAZp0UuJLCg=;
        b=RVArQX7ailTpKk1SGTv5m4RxaeBf5S3SDA76x+ZvC4Z7OL8skR+390zrm41anJUl6A
         c1gTfiuoHXBDdg1K0vDCw9/EQGj1WJx7OJdHcScyeRpLMJMPFl5BwGs/1BBYHgFMDlQd
         KE5qXvpjM+2Mr2wY4rK4ntt0UGDvGRMGJk4SHSm9vZMV0t2oMTZQ+dYinn+GxEsj+fIn
         7oxpf+NT54ztgo7IcErCHba82ogrotESgFHt53OHRJSUjmC40pIZmMDhmWMYY+sOi1G9
         mbHNZHYeTiBYZyB7I8U0OnCv2zSvcqtv4StzRIKih2otLyco0rb9VF32RpGnTcYz5CTe
         LTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199286; x=1788804086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knnQOguAzItYyCz3/I9QK04AlsKpIBVpLAZp0UuJLCg=;
        b=NSUahZYUhmCrEKncAt0qdU3bP21dMpY1Ksm43eRYYJ1H8co2kKWXRDjjP4beaLWbuP
         iNffBYoKud4Q4Y1W8gChqO5jIeyYJhPMue563WrpUzYPHvlsMpB3wXem11XBQQym7lbp
         n/o5Xc5LcZhb/hxoj39cAlxGxUyeAe0UeFiYaZ0N5n3AO78kZ0ELzOB90x3WYG92ueSd
         a8Co9cqj/5UIXDOnBhmYWrLXG6KUnpMjhKkvIx20Zpy14/c1UAkk24G4ZYFQk4ya43El
         FacCSXhja1l7mBkH10NwRleUVLkcbUllTSJioBlnublZcfq24GaiBj4biG88fxakhAeI
         FcOA==
X-Forwarded-Encrypted: i=1; AKwUvBx10lGdZnhGSCO3jvxq4YDA93J588B4U2BfJwCODQpH6bX8EYDm7nIuB730DdnssmEAbS/nHZTDamie5P0=@vger.kernel.org
X-Gm-Message-State: AFuF++nX6EQOP1HIHkSJn4GX5xEMoyQtr4urjK+3eoCDE7dPdnxDJksA
	JfDa/fCzN6ZzhufLVQOKtHYhIAGlCjfD9xapfpZVzD03kX/c83AX7aOV
X-Gm-Gg: AYBFou09kbcd/y5jvKUoAqEysB+Ft1LuMfLDZWDamBkPadVSwf6vC0oqIM6kq/NLEW5
	WmwCiNMbvptqkU4ANXmKYBCPkJ5ryWDRQu9+ielwiabe6IfA+1X8RqrkigY6Y0scsKCp+qIHqDy
	2OaMhPxn0fI6fefxLnsfTA1zL9TEw0P17FSemq+HecdL6HNwS8C15oOcAGr3jHqAL+fkYRC3qfE
	fxzap9BHgfeJ/Zw3RoYdi1doOLgVCcpMZ6rxZ/oGZd3pnUf03kfkyOpoUpNd91LTS2sE+cPFFEl
	+x0Oo0nsYJg61RNWQ48wbVs9umjIxQkzKoCKXcSkgVl8wTvXCqOIaY+qVNVKPVq6sCI3gU5LGGK
	/RSM6njSIZ0PM4zx35jLyiroDT2H1gUFSAtmtTwcccpVt1s8ke4RUxncOWkb5o3NXLXSE+Ig29X
	znEE4k7X2gCOKrwFtShpFjf3rjojbmh+qNmHODk9nSeVdGS1b+hN6+A2XH/qjaR+viTfSPdIBn/
	XYuwM3ySC1pLgbbgRpVwLzbSCWau0OHgb0FBBSxzsQ=
X-Received: by 2002:a05:6000:4812:b0:484:3600:35a9 with SMTP id ffacd0b85a97d-48441fc0e81mr141904f8f.3.1788199285576;
        Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
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
Subject: [PATCH v5 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Mon, 31 Aug 2026 20:00:55 +0200
Message-ID: <20260831180101.3109854-11-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

