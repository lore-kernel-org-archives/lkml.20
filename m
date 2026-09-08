Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8587739E9CF;
	Tue,  8 Sep 2026 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849234; cv=none; b=Qp7BpuvrSiaDAivilUaaq6+ZZ8ih3REQmLeNVu+dtE3V+EeFdde1RWGlBA7ylVd64igVTAS2wZvce4Dy1hA+zOQUdU74hCZgG4PT/CSFpUzhLn/Ltdfh9y2GPLsik8wzNJD5tIMByvqaiyrQLTn0siaCQLvPvrsZO3B9Kex6QEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849234; c=relaxed/simple;
	bh=aK/p6GIryzKqvxFx9+qgKNwbn+I5Mz5M38VNWYm5ouk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K13i2P2h61Tc7dygAKBmWsobmkCEaeZKMLCM2jH08pfaXenbkjFz+y6FpkFfztUCK0iKHsSeUml8CLmPfEOoA6JAE7z9IlMGfpEeI3BjGsf0BnKP7ql7CThZAvo3lLkVdlWkbq+PeWkpYGO/RJOgJi3V3ushUFXd9dBvMFEtIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=egCNGbx2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="egCNGbx2"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0E72C25;
	Tue,  8 Sep 2026 08:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849126;
	bh=aK/p6GIryzKqvxFx9+qgKNwbn+I5Mz5M38VNWYm5ouk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=egCNGbx2uTNMUwM1pw2RatRvt4iXUvP84VYpinS/z4lYSdPKsff3Uq61ZsvOllM3Z
	 469Z5kQvkmDSABdYov4QPvw5FQoxdWJ+ZYJ7fH2JN9mpbyh9sF4yC72xz7G7HdJpqz
	 oHapQ2a29fxhd1xmPGpYPtP7qj0Kv3TmYZafLThU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:12 +0300
Subject: [PATCH v7 08/11] media: rcar-isp: Call get_frame_desc to find out
 VC & DT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-8-c406a2c2930f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5108;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=aK/p6GIryzKqvxFx9+qgKNwbn+I5Mz5M38VNWYm5ouk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w9BIvBKl9jgh6fgcbRvvg/tnbvt6r+G4Fd/
 4vUH0StDECJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sPQAKCRD6PaqMvJYe
 9aErEACGwz5ZMnwNDIO85Tmus121uiLqR9WninH+7XIfLtx171nF4ED72ckNw9AfyWYEU2powsb
 m0cDG4fqJXWXUNHio+30tg6om4Yl253F/cY4vBoRMRT/TyMlZ9wYmUFbvlubREeXgsMp576Q5/E
 rmnqFYI2VjoXviCHKdb7lPZDJ/LTo2iiJNt7VOqKVs1urkh+uiHvaSNwC8GVX252g3xA3AXjROW
 uMU+j49HSPYlx1ZaAT8vEMZ2KtRAPkrZHnZ8hripPyVWTCO5Zc4tBN6g5+9JhkkUc2uwNWI6Uoa
 1I5mThLKW4YF5gSWth0UfP9Of/B3Z+59E+AfNmYJ/GOoAASC3Hgt/FeVkec0wWLeE4+pzYUBZ6M
 +Ui+LIGUbCCBo0QMc5VQ8s2jQ129zkzVB+84hWVTMsEAO2AmRR9qXskdOhHDZicTwEaDdApW9db
 wEie235PaTjTBNSOxX3RLJFO2MF0eVk5tPtkg65MgWJcZOiUSEK068SSgmhITU+Toh2rNlOUMOD
 2aygpo7RXkI5bSuVQyT4nOM55NILpspMnoYpLYd4MRL+QyvQV3fdaLZdQgB6o9QPzIcC0NFX9nL
 ApxUnsjsZQQXM6tSgQslvl88Si9uWnIPdcTm7ujBUDgODiw57G6/Fpc/BAT7vx3EP9Q4ZWbyas6
 GPmm4TNq1HTGQxA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
routing and deducing the DT based on the mbus format.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 110 ++++++++++++++++--------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 97465467d047..6480f6a2a435 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -41,6 +41,9 @@
 #define ISPCS_DT_CODE03_EN0				BIT(7)
 #define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
 
+/* ISP has 12 channels, of which channels 4 to 11 are connected to VINs */
+#define ISPCS_NUM_CHANNELS	12
+
 struct rcar_isp_format {
 	u32 code;
 	unsigned int datatype;
@@ -225,31 +228,82 @@ static void risp_power_off(struct rcar_isp *isp)
 	pm_runtime_put(isp->dev);
 }
 
-static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+static int risp_configure_routing(struct rcar_isp *isp,
+				  struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_route *route;
-	const struct v4l2_mbus_framefmt *fmt;
-	const struct rcar_isp_format *format;
-	unsigned int vc;
-	u32 sel_csi = 0;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	int ret;
 
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
+	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
+			       isp->remote_pad, &source_fd);
+	if (ret)
+		return ret;
 
-	route = &state->routing.routes[0];
+	/* Clear the channel registers */
+	for (unsigned int ch = 0; ch < ISPCS_NUM_CHANNELS; ++ch) {
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
+	}
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct rcar_isp_format *format;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
+		u8 vc, dt, ch;
+		u32 v;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(isp->dev,
+				"Failed to find source frame desc entry for stream\n");
+			return -EPIPE;
+		}
+
+		vc = source_entry->bus.csi2.vc;
+		dt = source_entry->bus.csi2.dt;
+		/* Channels 4 - 11 go to VIN */
+		ch = route->source_pad - 1 + 4;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		format = risp_code_to_fmt(fmt->code);
+		if (!format) {
+			dev_err(isp->dev, "Unsupported bus format\n");
+			return -EINVAL;
+		}
+
+		/* VC Filtering */
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
 
-	format = risp_code_to_fmt(fmt->code);
-	if (!format) {
-		dev_err(isp->dev, "Unsupported bus format\n");
-		return -EINVAL;
+		/* DT Filtering */
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
+
+		/* Proc mode */
+		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
+		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
+		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);
 	}
 
+	return 0;
+}
+
+static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+{
+	u32 sel_csi = 0;
+	int ret;
+
 	ret = risp_power_on(isp);
 	if (ret) {
 		dev_err(isp->dev, "Failed to power on ISP\n");
@@ -263,25 +317,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	risp_write_cs(isp, ISPINPUTSEL0_REG,
 		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
 
-	/* Configure Channel Selector. */
-	for (vc = 0; vc < 4; vc++) {
-		u8 ch = vc + 4;
-		u8 dt = format->datatype;
-
-		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
-		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
-			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
-			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
-			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
-			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
-	}
-
-	/* Setup processing method. */
-	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
-		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
+	ret = risp_configure_routing(isp, state);
+	if (ret)
+		return ret;
 
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0

