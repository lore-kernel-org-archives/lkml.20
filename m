Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F9466AE5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779644; cv=none; b=bgKIS/YW7oSapLk/GJrsB9x2DqNcBPpsdr3VZnbjedfgP/BloXLr2pBBRY0ieLYFjSPF24c6yJ9LpuYGbHHbVRVdPgboOWKIGth27QfiqoUwqmZ3mouyCSn/3LMhjjnsQDz7ROznSYGGWYQk5IJbg4Fp7vuaEGhLCcWtND28+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779644; c=relaxed/simple;
	bh=IFJAb+6o8d9wr9rFB/PgvXR32kInGplprpdHuE75RfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpnKh3IM1sbJDSLda8JzK5O2mYgpf+/RwU3aens5lEsEn21c3XzKEChIITyb8rnCPSQ3G1Bq91Opg49KTP21IomT1rs3RRa96mZe9W8w2J/gIMF9eHH+6zQh9265YqTlnfvuLgaOsaJfKXE2K/d7wh24up4cH0C3jdDCuV7VHvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=REzH1swV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="REzH1swV"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9A14C45;
	Mon,  7 Sep 2026 13:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788779544;
	bh=IFJAb+6o8d9wr9rFB/PgvXR32kInGplprpdHuE75RfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=REzH1swVjVlrw3NRwwc+BD6kHaFwEVuMvATpl8RqzZJdqxP2+zp5bvL801tVek85D
	 bKNQOD17JqcTi15cJkxGJb8uO/+R6gXLa1p9rCKNfEbBndlUHxb2Xby6lMTzF5nl9v
	 cqZcDyA6OBfaQauNPXWPZtAmpA2IhPgD2EG2ymHI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:13:36 +0300
Subject: [PATCH v2 2/3] drm/bridge: cdns-dsi: Fix stop-state at enable time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-cdns-dsi-fixes-v2-2-96d9b116e9bc@ideasonboard.com>
References: <20260907-cdns-dsi-fixes-v2-0-96d9b116e9bc@ideasonboard.com>
In-Reply-To: <20260907-cdns-dsi-fixes-v2-0-96d9b116e9bc@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=IFJAb+6o8d9wr9rFB/PgvXR32kInGplprpdHuE75RfU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnpxz9jFr2T2K9an+T0VEl32v2PqYv0z13w6V4
 uVMgnp1Od+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6ccwAKCRD6PaqMvJYe
 9TzCEACG7BkHiy0rEPFmUTC+F3VjP/XAuawi1RFCCnwIz2fmBlbDxVHvmO0QgTyO7UDKpVWlBOq
 7mxLFNumxP5g993EopMdbQeeiPI6tMkXgPmSjTmeISQyXn6XJT4ljlgvido/L1mjdXH6FAwEvtd
 COYdjZWWd5cZtrpT9FdoW97FooWSMtgy2wUFbFHk8RfNJyyjv8CaUUz4WODjCzsfpi721GhDXEE
 3IphVswDuQq9bK+R6yA3IcKaI3TuA17CeqjVHnmuUOdzZnG2uO5kHK/kp1pFJuPzWPmZHhz4Dec
 drVGDvULDUy9ihDNJjZiH2oGrN5SSr5UfzIAle8P4XqLVd+mv+OK+TPHWqMzhcD9iRdNMReKxEC
 5owurWCMJVIfn2Nz69pse1TCd+TuZ33S3ZElILcGY0VcrJK6i6LEENc7WpdfVmA7MVft1BjmfkH
 SEEuNdxsD3yZiJPoHVpX19TgVM6GO4p6TdyHaNgOaDFyCX94pgMCVFnDjMJ+rziOxjd6D0ce5KO
 sBWi0yQrnVSlGxWy5dBzhaUkR6MV0z+9vWzYrG+mCOVeLY6Tk2/P069nf5BHrSx45smWFzDOK47
 828VgfMq91McmGxzyICbeXaWrg2LwdeAh8l8Jg2f8H08KgEMsPCk6GgHUe+0Nz4yy9lGnesY91E
 cw+9IYl8qTN31+w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When using continuous clock, the cdns dsi doesn't keep the clock lanes in
LP-11 long enough to signal a stop state, although the data lanes are
kept high long enough. The data lanes most likely stay in LP-11 until
there is data to send, so the LP-11 duration is not defined.

While some DSI peripherals seem to work fine without correct stop-state
on the clock lane, at least Xilinx D-PHY RX fails to initialize if it
does not observe correct stop-state.

Add explicit stop-state handling to the driver. This is not described in
the documentation, but observing the clk and data lanes with an
oscilloscope, the solution in this patch seems to work:

Set the FORCE_STOP flags for clock and data lanes before starting the
D-PHY power up and init sequence, and drop the FORCE_STOP flags after
the init has been done, and 100 us has passed.

Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 4b7a3bf58255..b9c87f13177a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -635,9 +635,16 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	u32 status;
+	u32 val;
 
 	if (dsi->phy_initialized)
 		return;
+
+	/* Set force stop state on all lanes */
+	val = readl(dsi->regs + MCTL_MAIN_EN);
+	val |= DATA_FORCE_STOP | CLK_FORCE_STOP;
+	writel(val, dsi->regs + MCTL_MAIN_EN);
+
 	/*
 	 * Power all internal DPHY blocks down and maintain their reset line
 	 * asserted before changing the DPHY config.
@@ -661,6 +668,13 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 	writel(DPHY_CMN_PSO | DPHY_ALL_D_PDN | DPHY_C_PDN | DPHY_CMN_PDN |
 	       DPHY_D_RSTB(output->dev->lanes) | DPHY_C_RSTB,
 	       dsi->regs + MCTL_DPHY_CFG0);
+
+	/* Keep stop state for at least 100 us */
+	usleep_range(100, 200);
+
+	val &= ~(DATA_FORCE_STOP | CLK_FORCE_STOP);
+	writel(val, dsi->regs + MCTL_MAIN_EN);
+
 	dsi->phy_initialized = true;
 }
 

-- 
2.43.0

