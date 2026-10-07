Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A0280309
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349335; cv=none; b=sCI2VorH9P2AJp7vp915T0V/S75HqpKKfcbctEtyKbDb6Qz9bWhIAzwn840CFKYUuDbb/N4NjpiiikXNOTiC7pPBix85ypV0EGfG9sblGd7cbpWOOMhhKUhmhCrdZGOYBPur4SJTv8V2mAe7cfbhnlJJTpffCryQhip1iWEeFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349335; c=relaxed/simple;
	bh=lK9JsSmLJGfvHsRjOBNmbHWgk0eDJ7E1rsJHkSKFK4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/PQ8M3g3C8nAYNhN7tMQlrVP5bxhQ/waEYYaum8TSXk59TVhmqgCACcOvmqSvMrAt5/Ejyq+bAG4MC5aXqBI0wuryynw1DoYfmj9Uk23oV6zdpym9BW//LBnitepxUEEauPBTsKxO2R/b254EnCY32dvH2tFiZmtsHhci9ipl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atQ62tFB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atQ62tFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791349333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibH67xvdQ3UeSp4AHfXzs4BVMX/Swj+0v+zp+XsSlMA=;
	b=atQ62tFBoPmym33N/Jsn4yvpmOYXNRHCo7ZMGQGj7W/8uJHjP+qJqCLsFd9SrIixzHKCSe
	JrzORwZPGQpO8hcyRQMVq0ukEj3ofkIgrLwQrCxMptWxVmo7wTTrOJ9q3StqJBE4XHZslJ
	kkK5AqVHKVUe3H71MPxMAlgNc3mB5ew=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-9X0th3EZNAWkxVG_IsJO6w-1; Wed,
 07 Oct 2026 01:02:09 -0400
X-MC-Unique: 9X0th3EZNAWkxVG_IsJO6w-1
X-Mimecast-MFC-AGG-ID: 9X0th3EZNAWkxVG_IsJO6w_1791349328
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34ACA180257D;
	Wed,  7 Oct 2026 05:02:08 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7895330002D6;
	Wed,  7 Oct 2026 05:02:05 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 1/3] media: i2c: imx471: Configure line length PCK via hblank control
Date: Wed,  7 Oct 2026 13:01:38 +0800
Message-ID: <20261007050140.26604-2-hpa@redhat.com>
In-Reply-To: <20261007050140.26604-1-hpa@redhat.com>
References: <20261007050140.26604-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Implement V4L2_CID_HBLANK control to configure the line Length PCK
register setting. This controls the horizontal line duration
required for precise frame rate and exposure time calculation.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..bc6bf11ecf31 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -29,6 +29,10 @@
 #define IMX471_REG_FLL				CCI_REG16(0x0340)
 #define IMX471_FLL_MAX				0xffff
 
+/* H-timing internal */
+#define IMX471_REG_LINE_LENGTH_PCK		CCI_REG16(0x0342)
+#define IMX471_LLP_MAX				0xffff
+
 /* Exposure control */
 #define IMX471_REG_EXPOSURE			CCI_REG16(0x0202)
 #define IMX471_EXPOSURE_MIN			1
@@ -282,7 +286,7 @@ static const struct imx471_mode imx471_modes[] = {
 		.height = 1088,
 		.fll_def = 1308,
 		.fll_min = 1308,
-		.llp = 2328,
+		.llp = 2560,
 		.default_mode_regs = mode_1928x1088_regs,
 		.default_mode_regs_length = ARRAY_SIZE(mode_1928x1088_regs),
 	},
@@ -336,6 +340,10 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HBLANK:
+		ret = cci_write(sensor->regmap, IMX471_REG_LINE_LENGTH_PCK,
+				ctrl->val + format->width, NULL);
+		break;
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
 		ret = cci_write(sensor->regmap, IMX471_REG_FLL,
@@ -446,12 +454,10 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
 		return ret;
 
 	h_blank = mode->llp - mode->width;
-	/*
-	 * Currently hblank is not changeable.
-	 * So FPS control is done only by vblank.
-	 */
 	return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
-					h_blank, 1, h_blank);
+					IMX471_LLP_MAX - mode->width,
+					1,
+					h_blank);
 }
 
 static int imx471_get_selection(struct v4l2_subdev *sd,
@@ -708,7 +714,8 @@ static int imx471_init_controls(struct imx471 *sensor)
 
 	hblank = mode->llp - mode->width;
 	sensor->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
+					   V4L2_CID_HBLANK, hblank,
+					   IMX471_LLP_MAX - mode->width,
 					   1, hblank);
 
 	/* fll >= exposure time + adjust parameter (default value is 18) */
@@ -745,7 +752,6 @@ static int imx471_init_controls(struct imx471 *sensor)
 	}
 
 	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
-- 
2.55.0

