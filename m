Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E43A169F;
	Tue,  8 Sep 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849236; cv=none; b=kOXGymWtW8W/gase+fv7g0b8MQJABR4ILdPzU74LVbUo0Lp66v8aDm7riRkPSbyTRRsTtJAnT3pVK8ZcQoT9C56C4YBdJNm9TE8Hp+eVdDc8gJ7SgpmFKoo8jz4a5r9jhrpI9AOMKlis+p2uxMyVXf7HumuJwBejRC3Mp3E8oFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849236; c=relaxed/simple;
	bh=2L7ItjWdpW5Ezw4auR2IOLNnDB8iRJaAAVEN9Yzn8L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5AypFqb2/CuphRWiImI/D7q/QH0ylp5qDEvHKheW7+IO7+mT8zLFj7uNej7u99hsALFCJ1uJhY73eKD9eTm1vAvPnJ/dqwYIUweDVGp5UfoE8BxyvcnBlRhFG0ptYfMBW7pcj+0LKTl57x9jbuUVAjDiVTjuJqxn00s2tk5JuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Veo6/mS9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Veo6/mS9"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5094C31;
	Tue,  8 Sep 2026 08:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849127;
	bh=2L7ItjWdpW5Ezw4auR2IOLNnDB8iRJaAAVEN9Yzn8L4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Veo6/mS97d1nFAdRzWvUZXh53r/85dOAEP8+nYhb/7MQ3tR6tQQxDgaPx4RG5gA2Z
	 tTXkh5Xt6TbB/V4onF4juVusXyrQmdbGIZPwIUhI/HfdCZUTuzIvQq7bwn5sqv5NRY
	 QAPWRiiAVhsipcBUTQ93CvC2A4sSqHHj7Y/hrP70=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:13 +0300
Subject: [PATCH v7 09/11] media: rcar-csi2: Call get_frame_desc to find out
 VC & DT (Gen3)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-9-c406a2c2930f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5045;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=2L7ItjWdpW5Ezw4auR2IOLNnDB8iRJaAAVEN9Yzn8L4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w91Xkbt/T7mPMEqHqooqZ1lNcdkFIBbJtii
 sZ/OHWwtZaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sPQAKCRD6PaqMvJYe
 9fi4D/4wDwY5wwJpMFRuLVbpjgqOHeHBu9JjIIK6CvNXnhDRg5m0/Yw+cONFOHoqwjjdQfEsDd7
 1vldFzRjYT5p/IP+UrfyZGl18UQnTx2Gd4V+P5Xean8K9oxam/G6/S3QgNs+J4K0eSgJB+0pJJo
 tEDcIgoTDAGxsl1QPPferqp8b+5pHhYxYGEEJOFm7j5o138sor2AusYoldhYn4OzXb6hnQJUnLv
 5v11/4AFqbEtQv9zmcXS7LQicJNKU+j7AbJ6QK5zuTasiLT5g+Q2fVxgHXB9OaJH4tO5YgKmVjA
 DCNHf1LVCM76coRn5ys2U2EJMRRY/N5VygFE/dx77814JLqwMTU4wUmtfNQYmtbI2DuKP43eZIM
 3E+O8DZ+gZ2kH4aX6s0jWctaIsXr2UvGGx3bO7ZrE0Eu4hhFY3aPiOx6vkrV6hizwdX7FcGjhan
 +R6GlQKfiAMJbA/XROK4NDY+Saa0TE5tmbqfkDWzkkwF006nsXwn4OjojDB58PtVAqDE62Ui4yK
 SgRy23WmoXXzteGws0TuNtwZgECaHv37Tl0I2LjTc5AOlI+VgwtYEtvy+fRN4V7x2mYm72CtBBM
 yZJ/iCQwRWEfSOZXwTFq1U1dDUXNRObtwO4NJIWM84Mbk5O+uxcb4jZL+sb9GoRzmGcTw6gngEf
 fmtElDZhMEfrtbw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
hardcoding the VC routing and deducing the DT based on the mbus format.

If the source subdevice doesn't implement .get_frame_desc, we use a
fallback case where we assume there's a single stream with VC = 0 and DT
based on the mbus format.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 111 ++++++++++++++++++-----------
 1 file changed, 71 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7bff2fe8daad..65e3c9decfa4 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1069,62 +1069,93 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_route *route;
-	const struct rcar_csi2_format *format;
-	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
-	const struct v4l2_mbus_framefmt *fmt;
+	u32 phycnt, vcdt = 0, vcdt2 = 0;
+	u32 fld = FLD_DET_SEL(1);
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	unsigned int lanes;
-	unsigned int i;
 	int mbps, ret;
+	u8 ch = 0;
 
-	/* Use the format on the sink pad to compute the receiver config. */
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       priv->remote_pad, &source_fd);
+	if (ret && ret != -ENOIOCTLCMD)
+		return ret;
 
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
+	if (ret == -ENOIOCTLCMD) {
+		/* Create a fallback source_fd */
+		struct v4l2_mbus_frame_desc *fd = &source_fd;
+		const struct v4l2_subdev_route *route;
+		const struct rcar_csi2_format *format;
+		struct v4l2_mbus_framefmt *fmt;
 
-	route = &state->routing.routes[0];
+		if (state->routing.num_routes != 1)
+			return -EINVAL;
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+		route = &state->routing.routes[0];
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		fmt->width, fmt->height,
-		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
 
-	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
 
-	/*
-	 * Enable all supported CSI-2 channels with virtual channel and
-	 * data type matching.
-	 *
-	 * NOTE: It's not possible to get individual datatype for each
-	 *       source virtual channel. Once this is possible in V4L2
-	 *       it should be used here.
-	 */
-	for (i = 0; i < priv->info->num_channels; i++) {
+		memset(fd, 0, sizeof(*fd));
+
+		fd->num_entries = 1;
+		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd->entry[0].stream = 0;
+		fd->entry[0].pixelcode = fmt->code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = format->datatype;
+	}
+
+	for_each_active_route(&state->routing, route) {
+		const struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
 		u32 vcdt_part;
 
-		if (priv->channel_vc[i] < 0)
-			continue;
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
 
-		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
-			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
+		if (!source_entry) {
+			dev_err(priv->dev,
+				"Failed to find stream from source frame desc\n");
+			return -EPIPE;
+		}
+
+		vcdt_part = VCDT_SEL_VC(source_entry->bus.csi2.vc) |
+			    VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
+			    VCDT_SEL_DT(source_entry->bus.csi2.dt);
 
 		/* Store in correct reg and offset. */
-		if (i < 2)
-			vcdt |= vcdt_part << ((i % 2) * 16);
+		if (ch < 2)
+			vcdt |= vcdt_part << ((ch % 2) * 16);
 		else
-			vcdt2 |= vcdt_part << ((i % 2) * 16);
-	}
+			vcdt2 |= vcdt_part << ((ch % 2) * 16);
+
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
+			fmt->width, fmt->height,
+			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
 
-	if (fmt->field == V4L2_FIELD_ALTERNATE)
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
-		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
+		if (fmt->field == V4L2_FIELD_ALTERNATE)
+			fld |= FLD_FLD_EN(ch);
+
+		ch++;
+	}
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus

-- 
2.43.0

