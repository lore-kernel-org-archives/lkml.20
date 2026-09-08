Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048203921FB;
	Tue,  8 Sep 2026 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849227; cv=none; b=hDo4V+lIwCO8ws2g2ZbkDmSinJ2HaqOsepsytPDVgpa8l2VPKSccrUwKAhzJBGIZl+t7ZiBSmGJaNKB449ehO4tTcOIDfMxrZ2d3UUW6V9x7OCZsjJBItnYI0X+D7Ze40q/QWWQm9qnfylhQKhCVUlsJyzwMRb6HZt/0b7QASOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849227; c=relaxed/simple;
	bh=MjnzrwZKyNWzzunkm36LWNQmaY4qmqELqShZvoRddVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rhu4Jbye3COo0o+F0mMUvLi/ZjwhvEJt2QeF91ZT/jj0TTwoCDoqjR6NvfAFLx2aV1fmifsRdiR3/QRjltedDLXe1s2yC8Dx5S9q13cKAt3VtEhK6pXXTQak3jCJlrizKIoXT88ZFPCFOOeXQs/VQHpHVKdNFcT7kPUNTxKmI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JGpmbJ1v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JGpmbJ1v"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C964312B2;
	Tue,  8 Sep 2026 08:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849123;
	bh=MjnzrwZKyNWzzunkm36LWNQmaY4qmqELqShZvoRddVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JGpmbJ1v7Na6c0wBnxQZpKPyRS83HmtQwEVNkk0Xfng21WlRuB62D4Pveo3CW1vu8
	 wV2q7Vsqubp142MxqVNfBJRzhWsXovyQ/F7/v0W2ovdrp5spYRqtNf3edpgntvpUBw
	 SpB4IoTr/jLgZy6pnQkqSgwcLoEBFM6FSD2SVWls=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:08 +0300
Subject: [PATCH v7 04/11] media: rcar-csi2: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-4-c406a2c2930f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4232;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=MjnzrwZKyNWzzunkm36LWNQmaY4qmqELqShZvoRddVw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w7AkxfJqlCfC1h2QrVPH/tROW09e6NWTsV5
 pGWstBdWJKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sOwAKCRD6PaqMvJYe
 9QbzEAChCkQCk7/HXs87xPcDO2NieFRonqUO7keZXTuudFyodvU8WTpS6FRywVA/kV8Vp6Jxy8X
 5PM0OL/YLHzpW5Nms2u1t9q7PoR686H37Kom2pu7ik8MNIuFQC3SvyPlpFHWfjhF9yUnAN8vmd7
 EdYrNXCWxS1yJ+zp8a4djWMj7n5qFmOR3eg/KhAEdzJ/Q09uJ0DXvGXMGAssyPSt8xqM3SnRNNJ
 Oy1NBzOyokV1Hn7c8lVUet7HluXRdxxwKfoWxOk57883la4yDCL48FXwKufPDLY4SiwzpHcrp+l
 IzXO+DuQI68AZosON/ZBURrmHpcFIlVWJCbdq9nMfQkOYpQS/kj0Sn2xHnOMiFu2/NDC0AyMUiR
 YGDdjiMOOaC3R2pKvmiT/0hSzF+EnWwj8MEmoLV6GieGzOIJNnN8eASzC+GHeyDqmfURnJBcory
 gyc9I1dFFXjG0I1UdWiaizU1ZLT4QMg6UXJx55E3h7LCJXgfuok2FiKLOn4QC1Kd65ItzQDsUE0
 Eqo5bfxym4rNs6cdfeIP/k1wI/d5WRCkzQUYdWP4NizjggGNtJ8sXvJi46OHBJSWbE7/8kJqSzv
 8cPmOWzu4SGrP6LOOUgg85Svgg0wTU2uTfZu+bq21qB2wc3vcZuYGNnKQWw/o+moQM2E8al3Lqg
 N4T9DX5kGCwI0wA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the CSI-2 hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
rcsi2_start() and rcsi2_stop().

As the error recovery in rcsi2_irq_thread() relies on rcsi2_start() and
rcsi2_stop(), we need to modify rcsi2_irq_thread() accordingly.

On Gen3, a side effect of this change is that if the sink side devices
call .enable_streams() on rcar-csi2 multiple times, the second call will
fail. This is because we always use stream ID 0, so the second call
would attempt to enable the same stream again, leading to an error. In
other words, a normal single-stream setup continues to work, but trying
to use the current driver's custom VC based routing will fail.

On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
described above, and thus rcar-csi2 will only get a single
.enable_streams() call.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 59 ++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 6635f5782175..1c8150af734f 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 		return ret;
 	}
 
-	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
-	if (ret) {
-		rcsi2_enter_standby(priv);
-		return ret;
-	}
-
 	return 0;
 }
 
 static void rcsi2_stop(struct rcar_csi2 *priv)
 {
 	rcsi2_enter_standby(priv);
-	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
 }
 
 static int rcsi2_enable_streams(struct v4l2_subdev *sd,
@@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		if (priv->stream_count == 0)
+			rcsi2_stop(priv);
+		return ret;
+	}
+
 	priv->stream_count += 1;
 
 	return ret;
@@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 				 u32 source_pad, u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	int ret = 0;
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
+	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
+					  BIT_ULL(0));
+	if (ret)
+		return ret;
+
 	priv->stream_count -= 1;
 
-	return ret;
+	return 0;
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
@@ -1971,14 +1976,44 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 {
 	struct v4l2_subdev_state *state;
 	struct rcar_csi2 *priv = data;
+	int ret;
 
 	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
 
+	if (priv->stream_count == 0)
+		goto out;
+
 	rcsi2_stop(priv);
+
+	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
+					  BIT_ULL(0));
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Error recovery: failed to disable streams: %d\n",
+			 ret);
+		goto out;
+	}
+
 	usleep_range(1000, 2000);
-	if (rcsi2_start(priv, state))
-		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
 
+	ret = rcsi2_start(priv, state);
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Error recovery: failed to start CSI-2 receiver: %d\n",
+			 ret);
+		goto out;
+	}
+
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		dev_warn(priv->dev,
+			 "Error recovery: failed to start streams: %d\n",
+			 ret);
+		goto out;
+	}
+
+out:
 	v4l2_subdev_unlock_state(state);
 
 	return IRQ_HANDLED;

-- 
2.43.0

