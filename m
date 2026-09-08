Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A36397935;
	Tue,  8 Sep 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849231; cv=none; b=Foz048DbGcghW0C0Ed1PGllchJoX8sFfuiicLuOD3DWuRFrSLHa9RxJo3hcQAD1HVrH2Fg57BePJXAqn5i2404z/iLdlU2JGnSyFffs1OkYGFDZprM0Xkxok8eiIgTiOpUs9KPW+mnYKIblNZX9TR9sdNIhWobS7ftyeZvn5Bxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849231; c=relaxed/simple;
	bh=oExGHzPQkKVLZkggt/7Y71gxxJvvo3vKzwtYOseLfik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbeAPXX7bwm1x9Vk/wHNIS2jVln/EnmnKzfp9VmBtHDAuefzl5nvXN/0YtVnnpF2n7r7y33zAjlgMKtT4bmXdJkX0BKOD8G9sUIvqgpYMRhoq2sv7thatMcTRyOrNpKw9L4EoyG+RBR/jGUHBKINkCMJBRr8nAndiMiQDUBVmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OHYwqqjX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OHYwqqjX"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CEDF1583;
	Tue,  8 Sep 2026 08:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849125;
	bh=oExGHzPQkKVLZkggt/7Y71gxxJvvo3vKzwtYOseLfik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OHYwqqjXdFp9bhmX4B0Em39xclXv1x1nyR0/KyOVQShRw5c+4SxqnbsINAXO+8nbm
	 M8PlsJ4W+ZFVorb/wXidByGPxvXg7yrGVyFT4usmjgrhjABPSRHm2A//Zg22lh7XiW
	 oQ7rNXt9SxvCFwBV0hdli4tY8gja7pBloszOy5zI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:10 +0300
Subject: [PATCH v7 06/11] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-6-c406a2c2930f@ideasonboard.com>
References: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
In-Reply-To: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4630;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=oExGHzPQkKVLZkggt/7Y71gxxJvvo3vKzwtYOseLfik=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w8SN3Lw1RONhVAybTXYHTScuM0N1Ac+efTt
 6bRq8cMVsmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sPAAKCRD6PaqMvJYe
 9TyUEACm2A20okFBNgCnHvYB8J9be0kzesoK+t+dVKVXyCIJtS7XczrZ3EUMlVkqK463e3XXmjX
 I7ck/kg4XVPx6kxTf7RsTAMZAir1QR8/GcXidThaedLSfZ7IJMMrxV2EqkTfG/A6W8Vf0sXw4+Q
 L5ePuKw8SUJaWkCVQ+cnUXRuXexBFE4zSBbSUblQCCx8cgmFwxLHeT+//TEiMzHpTwAxHeHDvzB
 GtO84z7xuVCydTYzpTTm45LiXi51KeIpPuobJmLfRQx+Di/HP0gQLgw+9ZkAEfGIXES6fv6YbNk
 BaORswR/7D8RIDtYAJbvmalg3zG3LumRSsBKZMxql1kGRtUcl+tE8YCGqkrHoeSIsgSJHWbLo2C
 CH2/vZRpfYOgPrhLnAbynr+UGjAiFpKuKy2ZtLRAwTFG9dTNjxzJM8JqgYCEPGR1hdF2cJNjy/h
 rAtSC7ujjBUbbLVV7RhJfIxJVCTG5I2172dR8h6k3Y8BvuN8Dnp5RMeZX4S2uoAaAhIsifZtBi9
 TbFQ1fYt3aeDwfy/oame05jOnJT1RqmD7yBpCHDO2S4RmimfSWWCNqfwFR+JrjdY693b5eizG/j
 0qhH+EOx88WaWlygFn4d1FFpo3f26JGi3KCjqE0BISzQrNU5sD16+qlgsw6w52iKCI/ek9eFtaV
 Z+UC0gLFs7JQIOw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 69 ++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 97ddae942fe3..97465467d047 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -123,6 +123,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
 	},
 };
 
+static const struct v4l2_mbus_framefmt risp_default_fmt = {
+	.width = 1920,
+	.height = 1080,
+	.code = MEDIA_BUS_FMT_RGB888_1X24,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.field = V4L2_FIELD_NONE,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+};
+
 static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
@@ -216,13 +227,20 @@ static void risp_power_off(struct rcar_isp *isp)
 
 static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 {
+	const struct v4l2_subdev_route *route;
 	const struct v4l2_mbus_framefmt *fmt;
 	const struct rcar_isp_format *format;
 	unsigned int vc;
 	u32 sel_csi = 0;
 	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
+	if (state->routing.num_routes != 1)
+		return -EINVAL;
+
+	route = &state->routing.routes[0];
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
 	if (!fmt)
 		return -EINVAL;
 
@@ -341,7 +359,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_ISP_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -349,10 +367,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	if (!risp_code_to_fmt(format->format.code))
 		format->format.code = rcar_isp_formats[0].code;
 
-	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
-		framefmt = v4l2_subdev_state_get_format(state, i);
-		*framefmt = format->format;
-	}
+	/* Set sink format. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -369,6 +397,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
 	.pad	= &risp_pad_ops,
 };
 
+static int risp_init_state(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	static struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_ISP_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_ISP_PORT0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	static const struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&risp_default_fmt);
+}
+
+static const struct v4l2_subdev_internal_ops risp_internal_ops = {
+	.init_state = risp_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Async handling and registration of subdevices and links
  */
@@ -541,11 +595,12 @@ static int risp_probe(struct platform_device *pdev)
 
 	isp->subdev.owner = THIS_MODULE;
 	isp->subdev.dev = &pdev->dev;
+	isp->subdev.internal_ops = &risp_internal_ops;
 	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
 	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
 	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 
 	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
 	isp->subdev.entity.ops = &risp_entity_ops;

-- 
2.43.0

