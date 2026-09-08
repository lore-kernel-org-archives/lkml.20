Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C893A9852;
	Tue,  8 Sep 2026 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849239; cv=none; b=dbyhby72SWNYkGj3aRWj0ypcWicggBBGfv4sxEFogfF8nmIGY9H2gqfMIZk2w7UTnRuD0XJ9Jts0VCOff0jW0hR5vXvxME7xRckMrGCGi8jNBGiqmGBIuvw0gWAIbXcTjmH66dxw0zRJQV8LIfgXjxq+7UtejVsGhh9D0ZpNIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849239; c=relaxed/simple;
	bh=eAs4xnjoQNGHJHIMUXqPhs8kQxhJyTYvbWqnrmt+u+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4S6PoyNUvB4Uz3YdLTEHJ2JrEtODDVi+IQL4Ulf+Eysp09Nc0J0Rd1FP1kQXwziNpv024GTA3HeH8fFZWXa6luRa3bTMyOG3upKYBj5aslu+XhwxUY263EIs7lrk/0cTlEB5u0ACRa6wEmUsNFPfdTqu6yPyBtThGXQHRPwpMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q5/RZfen; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q5/RZfen"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7868E1CBE;
	Tue,  8 Sep 2026 08:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849128;
	bh=eAs4xnjoQNGHJHIMUXqPhs8kQxhJyTYvbWqnrmt+u+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q5/RZfen3KLH8fUcCnDHgjLjar6gojrkkmdCN/3yN8D9OjAnOKllvzn9sYrcwpC0d
	 fZRJvhfuyXSq5atMWF9f7K02e3zqOgZuZk6J6unWI+e890BUrNcZF6wMLA4dAUhv91
	 66LCVv88pGIihmVBGNJsSa3BsWf3aSYbXKyo9ZuU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:14 +0300
Subject: [PATCH v7 10/11] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-10-c406a2c2930f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6249;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eAs4xnjoQNGHJHIMUXqPhs8kQxhJyTYvbWqnrmt+u+M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w9zrciG2LSuaygz/pxFFheZJhOtwFGvuxiP
 +FyofHjeVCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sPQAKCRD6PaqMvJYe
 9YF2D/9M98pyY+GT785rnhER0e9Dh2ejYLZc+zjLk2H79BkfpjOjeGGgb9/AHDUaG+TzT7Cw27L
 IGzQAwJOI/ei2SXjrkF8EO+8gRZ1Ci/QY/7JfphrUtSF3q3lIJ3EFwqQAW4lmG4WKdKbv4YhFo0
 uPzrs6mFgApA3nxasQUSalywH/KcJ5ZXtE5o8bOu8cZ8BOOoNB8HZ75XvjcVh6n4jBgFHuB8y0y
 89CxufArYdILtLMilePthNhhKqqJ0SOKf6uvbcNotL19hpc1MNeQdlULQKQz9KVnIvnUesYYjxl
 sCZK30VYW4unPZQdW+VzHbGkAzkoISlNK1vgrvD0v6Uo9GSY9ZfbYo1j4FnnVMLQ83SRWeuzXeA
 K1fKzyN3X+rMORbfbREmFfepo9EQIsnODOXgUPfJizKxDjnynqbggtdO3KNA532/ecbBbyEFYlm
 oolfD61gWpssYCAtcUhIzypkhLwo6hy9az9kbG/HmIWoWy0gSLnTUxM8kOh+5+nbyrMwuvToaPc
 DKpt+bsSx0qX54WvbzvEq0g+NpUOntg33Iwgx6Fz0XGctLGmGR8o+nJoVUZZ+6mzIW5ryXtf0JI
 lqRpxQJM3PUngo6poAydv8iyyF2VOOdXcqX440/hCxwww1azGhgnOKke3OBpzgyylRlkNJpbVnd
 AGUT4uC6yT+LU2Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask
- Track enabled sink streams so that in rcsi2_irq_thread() we can
  disable and enable all currently enabled streams

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 95 ++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 65e3c9decfa4..41e3c6b2ebb7 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -702,6 +702,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 	},
 };
 
+static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
+	.width		= 1920,
+	.height		= 1080,
+	.code		= MEDIA_BUS_FMT_RGB888_1X24,
+	.colorspace	= V4L2_COLORSPACE_SRGB,
+	.field		= V4L2_FIELD_NONE,
+	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+	.quantization	= V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+};
+
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
@@ -773,7 +784,7 @@ struct rcar_csi2 {
 
 	int channel_vc[4];
 
-	int stream_count;
+	u64 enabled_sink_streams_mask;
 
 	bool cphy;
 	unsigned short lanes;
@@ -1883,29 +1894,32 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	int ret = 0;
-
-	if (source_streams_mask != 1)
-		return -EINVAL;
+	u64 sink_streams;
+	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
 
-	if (priv->stream_count == 0) {
+	if (!priv->enabled_sink_streams_mask) {
 		ret = rcsi2_start(priv, state);
 		if (ret)
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
-		if (priv->stream_count == 0)
+		if (!priv->enabled_sink_streams_mask)
 			rcsi2_stop(priv);
 		return ret;
 	}
 
-	priv->stream_count += 1;
+	priv->enabled_sink_streams_mask |= sink_streams;
 
 	return ret;
 }
@@ -1915,23 +1929,26 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 				 u32 source_pad, u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	u64 sink_streams;
 	int ret;
 
-	if (source_streams_mask != 1)
-		return -EINVAL;
-
 	if (!priv->remote)
 		return -ENODEV;
 
-	if (priv->stream_count == 1)
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
+	if (priv->enabled_sink_streams_mask == sink_streams)
 		rcsi2_stop(priv);
 
 	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
-					  BIT_ULL(0));
+					  sink_streams);
 	if (ret)
 		return ret;
 
-	priv->stream_count -= 1;
+	priv->enabled_sink_streams_mask &= ~sink_streams;
 
 	return 0;
 }
@@ -1966,6 +1983,34 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	if (priv->info->use_isp) {
+		ret = v4l2_subdev_routing_validate(sd, routing,
+						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	} else {
+		ret = v4l2_subdev_routing_validate(sd, routing,
+						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+						   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	}
+
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &rcar_csi2_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
 					 unsigned int pad,
 					 struct v4l2_mbus_frame_desc *fd)
@@ -2048,6 +2093,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 
+	.set_routing = rcsi2_set_routing,
 	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
@@ -2068,17 +2114,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
-		.width		= 1920,
-		.height		= 1080,
-		.code		= MEDIA_BUS_FMT_RGB888_1X24,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
-		.field		= V4L2_FIELD_NONE,
-		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
-		.quantization	= V4L2_QUANTIZATION_DEFAULT,
-		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
-	};
-
 	static const struct v4l2_subdev_krouting routing = {
 		.num_routes = ARRAY_SIZE(routes),
 		.routes = routes,
@@ -2123,13 +2158,13 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
 
-	if (priv->stream_count == 0)
+	if (!priv->enabled_sink_streams_mask)
 		goto out;
 
 	rcsi2_stop(priv);
 
 	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
-					  BIT_ULL(0));
+					  priv->enabled_sink_streams_mask);
 	if (ret) {
 		dev_warn(priv->dev,
 			 "Error recovery: failed to disable streams: %d\n",
@@ -2148,7 +2183,7 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 	}
 
 	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
+					 priv->enabled_sink_streams_mask);
 	if (ret) {
 		dev_warn(priv->dev,
 			 "Error recovery: failed to start streams: %d\n",
@@ -2747,8 +2782,6 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 
-	priv->stream_count = 0;
-
 	ret = rcsi2_probe_resources(priv, pdev);
 	if (ret) {
 		dev_err(priv->dev, "Failed to get resources\n");

-- 
2.43.0

