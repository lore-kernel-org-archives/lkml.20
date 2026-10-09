Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9F49C4CF;
	Fri,  9 Oct 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541708; cv=none; b=o/17+Tg1DkKrp/OvBtFyK0zyBtNdvx14QBEGrufFYnj0WikRWpgEEhXERHJ7M+KacEfeCH0M2QTRR2VupkotFkI6Lq+vMI6tvfiHWM9I9ED/aoOnS458J+O0XlVlBjD83hzVFnf5EChgWKVTLhQ3rvESZf/JzBTChPaF0v7cinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541708; c=relaxed/simple;
	bh=gCmo322zPZhuZrFVIHE5omiAr9tTS6EMZFdCxsL2IUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KbH4InbqAJorhofyClcaR9eUqcLOQfFJQtDdFtU3Jsp0D1NhWIb4TNFpqeCNDGAqdn71v075mnCQBIr4wO5EKTp7stjCRJwBrquzAEQxKvtdQdWZdZn/GSycV6q+Y6awbU8mdoU+YNR9sbt31EChWc5j4nG5Zbk2bXqV0A1/n1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=b4n64V+7; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="b4n64V+7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b+nkozeMc8Anems3UTAjU2E/aolXRQlogxYreGJDYhc=; b=b4n64V+7PtGcy2uAZ1n6hEA0II
	6xeQXHF4evgdz22VHUPR0wH55YHFiAGWOJ41eM6V+tT5HK9JKCmG8UJ2Znd9LFwE7E7iGAVpC5yX3
	k1u+lGMZaa3IV9Z8HQXSUNnkmnnSY9C3ebYpAi6QqvSAv27P+WRFzw5RhJZnuYxMoMOQeHok2apxJ
	pAQsRw3SitlNCKeJ1+WMC0xkW+buPqu1qlAOrEIc4FeMzQgOhqobvtEEmua5SVZ1L5bLJirUkgACo
	YVhEoOnpbWxKRnvNJm+F1FPSPm7gugHiYMu65YVxdvBVoroghRtS/roqaA/b3STp4Hhsnn3ALY80k
	tBV2KJSg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:58316 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xF7pu-0000000BsVC-1xhD;
	Fri, 09 Oct 2026 12:28:18 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/3] media: mt9v032: Add control for row noise correction
Date: Fri,  9 Oct 2026 12:28:16 +0200
Message-Id: <20261009102817.2421388-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009102817.2421388-1-primoz.fiser@norik.com>
References: <20261009102817.2421388-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Jan Luebbe <jlu@pengutronix.de>

The sensor's row noise correction algorithm was previously always
disabled by unconditionally writing 0 to MT9V032_ROW_NOISE_CORR_CONTROL,
with no way for userspace to enable it.

Add a V4L2_CID_ROW_NOISE_CORRECTION boolean control so userspace can
toggle the model-specific enable value (MT9V032_ROW_NOISE_CORR_ENABLE /
MT9V034_ROW_NOISE_CORR_ENABLE) at runtime. Default to disabled to
preserve existing behaviour.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/media/i2c/mt9v032.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 5da10fe42552..d8e34e128d77 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -167,6 +167,7 @@ struct mt9v032_model_data {
 	unsigned int pclk_reg;
 	unsigned int aec_max_shutter_reg;
 	const struct v4l2_ctrl_config * const aec_max_shutter_v4l2_ctrl;
+	unsigned int row_noise_enable;
 };
 
 struct mt9v032_model_info {
@@ -231,6 +232,7 @@ struct mt9v032 {
 	u32 sysclk;
 	u16 aec_agc;
 	u16 hblank;
+	bool row_noise_corr;
 	struct {
 		struct v4l2_ctrl *test_pattern;
 		struct v4l2_ctrl *test_pattern_color;
@@ -356,11 +358,6 @@ static int __mt9v032_set_power(struct mt9v032 *mt9v032, bool on)
 			return ret;
 	}
 
-	/* Disable the noise correction algorithm and restore the controls. */
-	ret = regmap_write(map, MT9V032_ROW_NOISE_CORR_CONTROL, 0);
-	if (ret < 0)
-		return ret;
-
 	return v4l2_ctrl_handler_setup(&mt9v032->ctrls);
 }
 
@@ -679,6 +676,10 @@ static int mt9v032_set_selection(struct v4l2_subdev *subdev,
  * Maximum shutter width used for AEC.
  */
 #define V4L2_CID_AEC_MAX_SHUTTER_WIDTH	(V4L2_CID_USER_BASE | 0x1007)
+/*
+ * Row Noise Correction enable.
+ */
+#define V4L2_CID_ROW_NOISE_CORRECTION	(V4L2_CID_USER_BASE | 0x1008)
 
 static int mt9v032_s_ctrl(struct v4l2_ctrl *ctrl)
 {
@@ -770,6 +771,11 @@ static int mt9v032_s_ctrl(struct v4l2_ctrl *ctrl)
 		return regmap_write(map,
 				    mt9v032->model->data->aec_max_shutter_reg,
 				    ctrl->val);
+	case V4L2_CID_ROW_NOISE_CORRECTION:
+		mt9v032->row_noise_corr = ctrl->val;
+		return regmap_write(map, MT9V032_ROW_NOISE_CORR_CONTROL,
+				    mt9v032->row_noise_corr ?
+				    mt9v032->model->data->row_noise_enable : 0);
 	}
 
 	return 0;
@@ -850,6 +856,16 @@ static const struct v4l2_ctrl_config mt9v032_aegc_controls[] = {
 		.step		= 1,
 		.def		= 2,
 		.flags		= 0,
+	}, {
+		.ops		= &mt9v032_ctrl_ops,
+		.id		= V4L2_CID_ROW_NOISE_CORRECTION,
+		.type		= V4L2_CTRL_TYPE_BOOLEAN,
+		.name		= "Row Noise Correction",
+		.min		= 0,
+		.max		= 1,
+		.step		= 1,
+		.def		= 0,
+		.flags		= 0,
 	}
 };
 
@@ -1246,6 +1262,7 @@ static const struct mt9v032_model_data mt9v032_model_data[] = {
 		.pclk_reg = MT9V032_PIXEL_CLOCK,
 		.aec_max_shutter_reg = MT9V032_AEC_MAX_SHUTTER_WIDTH,
 		.aec_max_shutter_v4l2_ctrl = &mt9v032_aec_max_shutter_width,
+		.row_noise_enable = MT9V032_ROW_NOISE_CORR_ENABLE,
 	}, {
 		/* MT9V024, MT9V034 */
 		.min_row_time = 690,
@@ -1257,6 +1274,7 @@ static const struct mt9v032_model_data mt9v032_model_data[] = {
 		.pclk_reg = MT9V034_PIXEL_CLOCK,
 		.aec_max_shutter_reg = MT9V034_AEC_MAX_SHUTTER_WIDTH,
 		.aec_max_shutter_v4l2_ctrl = &mt9v034_aec_max_shutter_width,
+		.row_noise_enable = MT9V034_ROW_NOISE_CORR_ENABLE,
 	},
 };
 
-- 
2.34.1

