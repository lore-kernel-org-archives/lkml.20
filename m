Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702739;
	b=roMuZYV9UTXxO16KciCcSGrf5pebJekIAbLwk4aIH/VWIJj/jC6Mjby+hokkiNAdjZFN
	 Y3R56WoUySVuuGRtSDlT2QjVnoCVlt65CMrFT6i0Froo1N4EFXxYKAEokabMG/9Y+Ylm+
	 e4CW/IoLp+6FMGrWVtp4YiDaQXNvt2f0kPoU1gR96inWmYCUtcKaTqwp6fZTpy9lEyWoc
	 Oo5WRKwznx1rg/kMWvOpjrDN2hGNVYdW1PC1WjaDxQQDS5oBpzaxVBMCmuI3Rrv191W8x
	 Z0W0vthTtf6M4GqtkN+27D7We3PXRn7uxSD01qvuK6xBPTzpi8Fc/7q3m05Ny9/f6LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702739;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=huomXK9SMndISLTL5gBVcSuerv7DR74V+Dr7Q6zCtnc=;
	b=bgvhVnOXvx8Ft415CtLKsPhJHlEHvhlvSAM98XMRKSPXiKgdLyb4KgFslioqU+oiMfVc
	 kN6KHbEXhl70dnPR0YkZn//FxqrQkN+RRRlEfasWVx/UlNm6RYPWt7W5mQYturrS++SaI
	 fGbi6AF/F0lsXK0K47np3c6BofC4lR+W+FZ395kkXrOcyai38LoGcxU/DELbBUCt1imAC
	 2lY9WFVJlyA/Ze0R+gkBXtA31NL5hXHiON7rgFvN4W8crfgKndJzjO85MEYyK9U5ao+fM
	 PhKBU2AJjY8Frz/sTg60I5XpiXjQJja0/CPtdeP1zBOwccqigmxibtwgN6W1eIENWmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7CE606C58D;
	Tue,  3 Nov 2026 10:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7CE606C58D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1E-0000000031r-0auF;
	Tue, 03 Nov 2026 10:45:32 +0000
Date: Tue, 3 Nov 2026 10:45:29 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] media: rockchip: rkcif: fix the MIPI stop path locking
Message-ID: <744eeec346f96d580a9215c657951f5a737e734e.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>

rkcif_mipi_stop_streaming() takes the subdev state mutex, and the
interrupt handler calls it at the frame end that completes a stop. A
mutex taken in hard interrupt context sleeps when it is contended, and
CONFIG_DEBUG_ATOMIC_SLEEP reports the call on every stream stop. The
state itself is not read on either path; the lock serialises the
read-modify-write of the interrupt enable and status registers, which
the streams of a MIPI block share.

Guard those registers with a spinlock per interface, taken with
interrupts disabled, so that the handler and the process context paths
exclude each other, and leave the subdev state alone.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 24 +++++++------------
 .../platform/rockchip/rkcif/rkcif-common.h    |  3 +++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 686b995525b9b..53cfd37bf02bd 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -721,17 +721,14 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	struct rkcif_interface *interface = stream->interface;
 	const struct rkcif_output_fmt *active_out_fmt;
 	const struct rkcif_mipi_match_data *match_data;
-	struct v4l2_subdev_state *state;
 	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
+	unsigned long flags;
 	u16 height, width;
-	int ret = -EINVAL;
-
-	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
 
 	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
 						      stream->pix.pixelformat);
 	if (!active_out_fmt)
-		goto out;
+		return -EINVAL;
 
 	height = stream->pix.height;
 	width = stream->pix.width;
@@ -746,6 +743,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
 
+	spin_lock_irqsave(&interface->irq_lock, flags);
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
 	int_temp |= int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
@@ -753,6 +751,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 	int_temp &= ~int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+	spin_unlock_irqrestore(&interface->irq_lock, flags);
 
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
@@ -769,26 +768,21 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	 */
 	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RK3588_MIPI_CTRL_CAP_EN);
 
-	ret = 0;
-
-out:
-	v4l2_subdev_unlock_state(state);
-	return ret;
+	return 0;
 }
 
 static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
 {
 	struct rkcif_interface *interface = stream->interface;
-	struct v4l2_subdev_state *state;
 	u32 int_temp = 0, int_mask = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+	unsigned long flags;
 
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
 
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
 
+	spin_lock_irqsave(&interface->irq_lock, flags);
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
 	int_temp &= ~int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
@@ -796,10 +790,9 @@ static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 	int_temp &= ~int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+	spin_unlock_irqrestore(&interface->irq_lock, flags);
 
 	stream->stopping = false;
-
-	v4l2_subdev_unlock_state(state);
 }
 
 static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
@@ -881,6 +874,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
 		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
 		interface->set_crop = rkcif_mipi_set_crop;
 		interface->streams_num = 0;
+		spin_lock_init(&interface->irq_lock);
 		ret = rkcif_interface_register(rkcif, interface);
 		if (ret)
 			continue;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda8..16a5ecb25c2fb 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -198,6 +198,9 @@ struct rkcif_interface {
 		struct rkcif_dvp dvp;
 	};
 
+	/* interrupt enable and status are shared by the streams of a block */
+	spinlock_t irq_lock;
+
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
-- 
2.56.0
