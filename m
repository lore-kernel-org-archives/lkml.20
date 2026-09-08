Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CEE397339;
	Tue,  8 Sep 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849230; cv=none; b=tUHqu4rmq89raa4Kbh8cKSS4p6sR4GjcQ1L7+oZ0jQGZMdfCQSXnRwX5UFMXVaEzA7VW0Dx91GXFdLKyd8aCuDRdJd6FK1D0gHwSigjMaqNQnZtXZMWrAw6FwAY0t/g1jUkXeUlHz5vySQAzPj5WaEIsuTit3aSynp6tjpMtlvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849230; c=relaxed/simple;
	bh=+thg2XDSoZNWVkecGneALC7noetVEgXK5tnttNWV4Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7VDpr7jtO2jsqgcy3Hficpn1NpNvOt90MgeTFDHlxNNOhs2Ty+CAIC9Uv9hbkaDVwIwfaA96r2aY3bWjdIZPhG+pLcbdnCGpGiJE6NH2mR0ihlQSmF37Y2aNIdwke9TmbJPSEfc6hTqjdv7YRNRg9lgF7HHguoDGmrpCXGDuyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AP5QJqcI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AP5QJqcI"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F22A16F9;
	Tue,  8 Sep 2026 08:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849125;
	bh=+thg2XDSoZNWVkecGneALC7noetVEgXK5tnttNWV4Co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AP5QJqcIUV7conkY/6yhT85vbgz9aHkGaogE2WRz0HLtlAZafbMTN7DFevtEnWbi4
	 kUeWz/fdzxlWNWdsqbNizQ0prfcgrromCQnZyDNTOMROXu1NrW9omTjlGxCroHnkfu
	 OXMgiSH+bdRJw3ZlWxNmSkQ6euis8zjKHLjx0Gdg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:11 +0300
Subject: [PATCH v7 07/11] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-7-c406a2c2930f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=+thg2XDSoZNWVkecGneALC7noetVEgXK5tnttNWV4Co=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w8r+Y47TbLr4AhBtAaMy4JlqCHg1oAVv9l4
 2c048psziKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sPAAKCRD6PaqMvJYe
 9eSPD/41An3RnqjA6Ymu6bdPc3pi7ygLb/NV+gF26PlFOM9339hUXODCCU62+LeQCb+NcJZS39H
 FaeozWDJ0IdVjjWpb+n+4CSpodkryJAdAlUtY3nxukmScPj3DukWyKPcmhLeiM1wLzNYBt2DkXR
 DZ6u9kV0KqgEZuFREOTSBuSAFhYLDF8kbp83Un1bdvL0qwS3w9bY7R+x/p9+LmeEy6QfP2YFP3W
 39GnBFZIdAZp/a2lWAfzNXU1jWwzcSlzlu6JK59vLal8Sy6A4a5bO+f5spGM2irGjrEYz1esz7/
 O/8oq+jtJgl5McNe5CG9kvE1QsJm4V/RZnqxv2xBHTaFw9n5IQrsoFhR7jlQPMt0S926aD5RLhh
 23Tehg5vERlvocsIgPcnwXVYG7Sv2FYN1Vxkii61wGzG4MTIErDMF4lPcJ0eT8xex3/Nl1ye//4
 TgWX+0Uj2eETR197RPY0V6N8yp0HU6n2w/lmHx6sfhIE9o6aetInOkgObP8dEW2twprB4Ul/zpd
 1RYXDWmpLRoinvIUs1vdyBHVdzuKUEd9IvVeytt4SoBYr1QdwvfKe9qzshFwZkLlGge8W7GzTlm
 zi1teed5CgDT3t7CZNYsju7DRufioQoUbo1WEQLg+/sZEU6dTLFIuzi9tKVoX0tBToH7TWr1j7H
 aWRFM+G/GmFiv9Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add v4l2_subdev_pad_ops.get_frame_desc() implementation.

We also implement a fallback for the case where the upstream subdevice
does not implement .get_frame_desc. It assumes a single stream with VC =
0 and DT based on the configured stream mbus format.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 77 ++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index c064979003ed..7bff2fe8daad 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1935,12 +1935,89 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
+					 unsigned int pad,
+					 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_route *route;
+	const struct rcar_csi2_format *format;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (state->routing.num_routes != 1) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	route = &state->routing.routes[0];
+
+	if (route->source_pad != pad) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fd->num_entries = 1;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->entry[0].stream = route->source_stream;
+	fd->entry[0].pixelcode = fmt->code;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = format->datatype;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	/*
+	 * Providing a frame descriptor on the source pad only makes sense on
+	 * Gen4. On Gen3 the CSI-2 IP is used to demux the CSI streams to each
+	 * VIN instance, while on Gen4 this job is done by the Channel Selector
+	 * of the ISP, and that needs the frame descriptors. So WARN if someone
+	 * calls this on Gen3, as it indicates a driver bug.
+	 */
+	if (WARN_ON(!priv->info->use_isp))
+		return -ENOTTY;
+
+	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
+		return -EINVAL;
+
+	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
+	if (ret == -ENOIOCTLCMD)
+		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.enable_streams = rcsi2_enable_streams,
 	.disable_streams = rcsi2_disable_streams,
 
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+
+	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {

-- 
2.43.0

