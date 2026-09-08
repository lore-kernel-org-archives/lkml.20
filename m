Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04790389455;
	Tue,  8 Sep 2026 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849227; cv=none; b=cE6qzFou441rZZp+nbBfzceD3R+SuffvrzYW4zIq7mEYVkBYQwhr7t5U0N9v1DLSEKaSQXNQf7xFpSoSuU3ThPlwvHBIE7YTlPe8kR0LKhfFgtSytbmVERijGjNXHJdh3BC3HJZNM1yXHZwVK9vzl/SHrECTY0pXjatrjp5JSBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849227; c=relaxed/simple;
	bh=lCcpNN23SQc2nkY2REOpt9Da3TrhiHkLugZUEy71N54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1IrJZ7nBt8of7Y+DAqL2CrHSEuHfs4Jzhly+RjieGmqeiFg8GE4ZvhJLSyROzg5nQG9T3GAe3No7ykyqU4loVV4iMU/sFeOW3iNS8QGAnuzz6OvlR2gVC/oB3JH4sSuhUN47BJ/hMiAjuIADKpe/4YHO6x0HRWaMilc6tfTe9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cIim/W8K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cIim/W8K"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 927F2130E;
	Tue,  8 Sep 2026 08:32:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849124;
	bh=lCcpNN23SQc2nkY2REOpt9Da3TrhiHkLugZUEy71N54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cIim/W8KO6H1aasc6211v24zZLdIkn97/HpLe6IqswcJ9mrKi524igTJc99GxqyCY
	 VeLqXOLvNxbY26up4DBq7h2Im57mbIjSSbce48RYSsg0Far52BQBFVoblieiBwhDLg
	 hNlWZcsEbJfaH7ZkDDGighgkWyfJFRQUS1mEM6g4=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:09 +0300
Subject: [PATCH v7 05/11] media: rcar-csi2: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-5-c406a2c2930f@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5330;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=lCcpNN23SQc2nkY2REOpt9Da3TrhiHkLugZUEy71N54=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w7kQGFMNS3oPS9ioxU6eBN8KW4TvulF5bnA
 Ylnk9iJFC2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sOwAKCRD6PaqMvJYe
 9fSQEACc9+gSIhd8nmUXnnnrF0hgEFFx+2w2IcdlB+Z61RMZ/8cJWh4J198zw7DCnqLgtdu+sD/
 cFCPgsznLQc53y0lvSrXzlDl+Yeev3t2qf3Rrxb9SjA6hXFM6tY4ejpLSPKeI5jeRHVGtafaoNE
 XM05EKP+lu3sx/2aGdfoDcq0fEw3+qgn5pcMb1ripO6vGt56EULGyR7hba6LAL+VfG9qqSoECVW
 vUtq0X8tRAQk+Fe2+eZr2OM8lrF/gtlPUkBXJUGnMh5nytfNEJEBoOltYZaRsZjbwHN+BelNqBl
 QXdLnOdZHPNozW1wAf2SlYErCpzeg65TkQDwJO2sKJF2Srj4DeLvh/y5XMC6dfDvzn9DpF0KHyC
 G2S93JtN4x5kpkVM46tpZljS7s43p06UGgL4w3rjdjWib4TKwvLuAWNKY6VODliNJf6Q09sqpmN
 V6D7Y9Fmb5q3P2DO4SANtCHvMbW3ZmtX38o9EN2dyCbvGV2A2BeaSzogb3wnLIym3bRRpuT7p4K
 H0vbaPMMyX3Anf//JUV8y9aMu4aVRt4cbgMy3Ec3hcNUVuwh8m83vGy/HR9W8C0D65Bh2p7YzAQ
 VJdgm4Sh+Q3fmS+C1QVIELsFVNgtazuD6QqX6XVpGpbnjjwJJlr1wdwGELS35AkNmG18heXfyGC
 g+utK30C4hiLvFg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 1c8150af734f..c064979003ed 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 	 */
 	freq = v4l2_get_link_freq(remote_pad, 0, 0);
 	if (freq < 0) {
+		const struct v4l2_subdev_route *route;
 		const struct rcar_csi2_format *format;
 		const struct v4l2_mbus_framefmt *fmt;
 		unsigned int lanes;
 		unsigned int bpp;
 		int ret;
 
+		if (state->routing.num_routes != 1)
+			return -EINVAL;
+
 		ret = rcsi2_get_active_lanes(priv, &lanes);
 		if (ret)
 			return ret;
 
-		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		route = &state->routing.routes[0];
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
 		if (!fmt)
 			return -EINVAL;
 
@@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {
+	const struct v4l2_subdev_route *route;
 	const struct rcar_csi2_format *format;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
 	const struct v4l2_mbus_framefmt *fmt;
@@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	int mbps, ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+
+	if (state->routing.num_routes != 1)
+		return -EINVAL;
+
+	route = &state->routing.routes[0];
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
+	if (!fmt)
+		return -EINVAL;
 
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
 		fmt->width, fmt->height,
@@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_CSI2_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
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
 
-	/* Propagate the format to the source pads. */
-	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = format->format;
+	*fmt = format->format;
 
 	return 0;
 }
@@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
 static int rcsi2_init_state(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	static struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_CSI2_SOURCE_VC0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
 
 	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
 		.width		= 1920,
@@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
 	};
 
-	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
+	static const struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
 
-	return 0;
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&rcar_csi2_default_fmt);
 }
 
 static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
@@ -2625,7 +2660,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_STREAMS;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;

-- 
2.43.0

