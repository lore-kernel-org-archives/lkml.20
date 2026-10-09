Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D8B49B5CB;
	Fri,  9 Oct 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541708; cv=none; b=J1TEXVj7dzoHXCcDHxvxtkepbk9+t74Y0McRlfRg4nEeyvty8mgVCi3ZpEId3jN0af3lZZp4ytE3UJCaY4LAjNN65H6byil0lZ5xFuVY3sOme9Ivis1ObPFmKZwDOFUUEU7ZaB7dmCL/duR/vIVAOpEj3YCMr7UolJC8j5TxgnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541708; c=relaxed/simple;
	bh=wE6JeTeKOKbNWu+94yi1tS0CuN1YDyZmhnclih/ZS7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opRrzgYVzHtxYZetqKW11Bl0DEOzYNgxnlkLXNa62uF3vtu9yDMycv0pPxlh0bvBjJhnaS2SQwM5HUyUMVk6V2MN3rG3EMdKm4Gk8fh2Gq+0Ond2b41KdGYLtrqVx2YLgg+99YDbkEMfT4Nq2piGkm1Ix604FRlWrBBuIv/QC4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=lfUTDzkg; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="lfUTDzkg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AWYJJwbdUHFwbjz22541O6xm6nrNr1m5P/Kmg3KV8NI=; b=lfUTDzkgx6L7vPXsPEsmL90+Ze
	A13vBy35TMWHKGPP9GInUWoIywo+1lJqkyBNgQWpFknMGxS1tBNPK6lbJvbpCcGdnXkv5oNirE2OL
	2llo+Az/6uE+PPDc5IgOKEGNBYhVo3FePebt4fjAdNsUe+pBulo6bqNgPN7mQGnd7LPUIwSIW5Zn0
	FeqNLoHVkfmTg0TPg+NcFGMj0czK6ZY+ZAjOx1thIiIQxQz2+FXuGX56e3wEJuG//7bykJc5yvZYM
	hCAFZcvmI6pY/CmKYSgJWDAAKml5rk4aPdAOIuB6lfA/kTndmERykwAGwAuv4kVYF1oeA/khJiw6h
	JH/uidmw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:58316 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xF7pu-0000000BsVC-1hFG;
	Fri, 09 Oct 2026 12:28:18 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/3] media: mt9v032: Support color format selection
Date: Fri,  9 Oct 2026 12:28:15 +0200
Message-Id: <20261009102817.2421388-2-primoz.fiser@norik.com>
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

From: Christian Hemp <c.hemp@phytec.de>

The driver only ever exposed one fixed mbus code per sensor variant
(MEDIA_BUS_FMT_SGRBG10_1X10 for color, MEDIA_BUS_FMT_Y10_1X10 for
monochrome): enum_mbus_code() rejected any index > 0, and set_format()
ignored the requested code entirely.

Add per-variant format tables (8-bit and 10-bit Bayer/greyscale) and a
mt9v032_find_datafmt() helper, so userspace can actually select the
pixel format via the standard subdev pad ops instead of being limited
to the single hardcoded 10-bit default.

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/media/i2c/mt9v032.c | 47 +++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 29823378f0c7..5da10fe42552 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -187,6 +187,16 @@ struct mt9v032_platform_data {
 	s64 link_def_freq;
 };
 
+static const u32 mt9v032_color_fmts[] = {
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+};
+
+static const u32 mt9v032_monochrome_fmts[] = {
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+};
+
 struct mt9v032 {
 	struct device *dev;
 
@@ -215,6 +225,8 @@ struct mt9v032 {
 	struct mt9v032_platform_data pdata;
 	const struct mt9v032_model_info *model;
 	const struct mt9v032_model_version *version;
+	const u32 *fmts;
+	int num_fmts;
 
 	u32 sysclk;
 	u16 aec_agc;
@@ -434,16 +446,28 @@ static int mt9v032_s_stream(struct v4l2_subdev *subdev, int enable)
 	return regmap_update_bits(map, MT9V032_CHIP_CONTROL, mode, mode);
 }
 
+static u32 mt9v032_find_datafmt(struct mt9v032 *mt9v032, u32 code)
+{
+	const u32 *fmt = mt9v032->fmts;
+	int i;
+
+	for (i = 0; i < mt9v032->num_fmts; i++)
+		if (fmt[i] == code)
+			return fmt[i];
+
+	return fmt[mt9v032->num_fmts - 1];
+}
+
 static int mt9v032_enum_mbus_code(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
 
-	if (code->index > 0)
+	if (code->index >= mt9v032->num_fmts)
 		return -EINVAL;
 
-	code->code = mt9v032->format.code;
+	code->code = mt9v032->fmts[code->index];
 	return 0;
 }
 
@@ -535,6 +559,8 @@ static int mt9v032_set_format(struct v4l2_subdev *subdev,
 	__format->width = __crop->width / hratio;
 	__format->height = __crop->height / vratio;
 
+	__format->code = mt9v032_find_datafmt(mt9v032, format->format.code);
+
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		mt9v032->hratio = hratio;
 		mt9v032->vratio = vratio;
@@ -946,10 +972,7 @@ static int mt9v032_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 
 	format = v4l2_subdev_state_get_format(fh->state, 0);
 
-	if (mt9v032->model->color)
-		format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	else
-		format->code = MEDIA_BUS_FMT_Y10_1X10;
+	format->code = mt9v032_find_datafmt(mt9v032, 0);
 
 	format->width = MT9V032_WINDOW_WIDTH_DEF;
 	format->height = MT9V032_WINDOW_HEIGHT_DEF;
@@ -1157,10 +1180,14 @@ static int mt9v032_probe(struct i2c_client *client)
 	mt9v032->crop.width = MT9V032_WINDOW_WIDTH_DEF;
 	mt9v032->crop.height = MT9V032_WINDOW_HEIGHT_DEF;
 
-	if (mt9v032->model->color)
-		mt9v032->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	else
-		mt9v032->format.code = MEDIA_BUS_FMT_Y10_1X10;
+	if (mt9v032->model->color) {
+		mt9v032->fmts = mt9v032_color_fmts;
+		mt9v032->num_fmts = ARRAY_SIZE(mt9v032_color_fmts);
+	} else {
+		mt9v032->fmts = mt9v032_monochrome_fmts;
+		mt9v032->num_fmts = ARRAY_SIZE(mt9v032_monochrome_fmts);
+	}
+	mt9v032->format.code = mt9v032_find_datafmt(mt9v032, 0);
 
 	mt9v032->format.width = MT9V032_WINDOW_WIDTH_DEF;
 	mt9v032->format.height = MT9V032_WINDOW_HEIGHT_DEF;
-- 
2.34.1

