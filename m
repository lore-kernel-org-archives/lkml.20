Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205979;
	b=AfzQY79FhNOESYAVp/4Iwl4iTHZMQGYgQcTh6W34nJ+8pM4AbGY8n/o6s0WqleJJGIXG
	 +SmJPJltqKe4gz4qfOfoSrVP5sB3vfuDt7oEiFHAgx4WAmBQ4CS1pL8i6GppZz/GVgZSl
	 3GK1ZhfduujHy7teAW3MXgnQI49W1FYujr/GEPzlwYCwutsjtb1K4ngQFZuKBUwr0MySr
	 4pwrUYtIVdyNPsfHarBKDV/nTI3o39Q1FLwW2FtjWqSO+DQtj48/MC+5BF0UtOcziLwVH
	 w0TcdBGq7nyROqLFPbWG6UZUgfsZxWjZEkBJThrP3XBRWcUirU1kck+hFD0fE6Bp3+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeF2vXpdMa1pfvksP6uKJgr0A5M1DsAwpOtlsJ3oJeA=;
	b=Odf4uwiylm1sw+a9FR8Dft93paZvGxJux8srrw4x+jhJSUpTP3kcpCNdh+N6ELAo82Lw
	 +wh1MzX4mXCG5hRqe/rvVZjUb7bkb1f7T1dnPT8niJT12Tnx+u2aOkXemT1WV/Xjo+6nN
	 787Tw7idClt59Ang8RiiM2JXjXh4ourQoab8JwAgapusQmWmhQxBm0jLnspkJLZB9jn9G
	 h0ABN6U1Nrk6A8B/OTll41IhvIyiFuYnaFKJjflwVWaCoC9iNP1O9r9YzDx42U2vp4YF3
	 +K61yo9UpnhxYoUo9XpaqBAsXPFowvZDIF6cVD/4xEUbdskg/gjGEXwCKQb9+QRIKKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03Me3K8w;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F360A2625
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643F360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03Me3K8w
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35829219da8so2851969eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205978; x=1793810778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeF2vXpdMa1pfvksP6uKJgr0A5M1DsAwpOtlsJ3oJeA=;
        b=03Me3K8wr/kpt4LOEoo//8KBR9w7dT6BuCpg76d8Mg0x18csV4FaPNZkZ0qGYUKU9m
         EMZ/Focce5EWNWEzaiaIaJXhvWY5RNf6JOKr7iX/rwRM6CKoomZPuUFte1lG+UsBBEjH
         MRzcswAlnGkBeNb3McJKecdw9SwMSv6D4uFSDUwpesAvPXpsWPaIgmi5nGTlpVGW9PbV
         B/qUIMw6aMUYwbQA5nVa7WRe697jV1j3rdxs1ICTOo7VzmdJ1gY4ROqikiJO/FdkVVfC
         Fud5z9vX9uXaRjmfqm4YamA73eihmjwoqv+dk8eOK6I7aUZdPMWyLxCtcAbuH+kAi9iq
         fBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205978; x=1793810778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeF2vXpdMa1pfvksP6uKJgr0A5M1DsAwpOtlsJ3oJeA=;
        b=oIzLdEiXSlEEBWWf7HOlM9j4wr8hP6YASDxaycTX2bo8FEgt/qccZ3hgSeVJQT4LT0
         /yZSbB5RF0OTIrrZPPNzlnJpG2ZJvIBT/0jKs6Pi2udn7MtwmRGf5Uk95NQQIxNnX9KI
         djN9+vVeSgop83IbN2L1dZ2pz1u4hZS2Om15NHULkyDWTZ5EmWhkncnPhFqr3ohu56TU
         xkUzz4/TU/hbVP8m7yEgTTgKyNRA1a27ozGhI3icS+BAUd+EAF2lbmIAviIm1YcKnPYU
         Lg6dxetAvlSyL/syjLzvaWeDCE3Y5hfG/S/GE8T3frtCLFqN4VAFqPKfCw5AiHY3UsWF
         Y3AA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ1pZ7xXJnesKefuo04wyIPx0xicBd81Ty5X+uXx3X5UECJupDjFLGxcrRpN+m6kBUwcSiivWkBhsoLA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdvxIAAYmYLTdXzl8maYwExkYPVXB2gHWCksh2RknxGwLGHUTb
	5JeWonAgCLfFqXhyPcVTuSMQfFhGztyYoD2iGBsbFLyq7kdgFq2rbOLe
X-Gm-Gg: AYBFou2THySX8HXlTstf4T9VMgr+aEhIBeYoXHaLoI7t5+xlqSKDIyVyalcnO1QNPb9
	TUXQGHghRthsvLX+aFsmS0VImmmRsbdXdCiSxOA3Ro2QoOxsyZwVsd8YJE1Y9gw3vNEc7pam3pc
	+PnnHszdirACaDVBi9seXVcjwiIwETsUkMN9rjwMLuZoas4CMjZlnpUhoplTWS8VEy4NgR06hmL
	XO0Sfc6reqnBCgVlDzqi6ZolqfJDfch8smmkUsL/050NVFCNBJ4xvK2pmvQ1byaaLiYjVCK6tz0
	SWxyr+7jdqx7QqzuXDBEpJUn5dKPsUo3PfELGpdJMXPekGTYP9RPrn7ep0wQIUU2+IelXIN3MB3
	7YdXq5DLMtKb+98HQwnRG0TkNEXZ8e7qOrxQMGTdMUX1y3iKR841OG8NIjLj4T+0+/1upZrnO3z
	teoy4jAB88bNK7eNnTtxobJPyYqKtLWS/eUyf/0cAacW8kVE/L0qCUyawu/DRg397J7O/ydZjPh
	BuRhYQWiSe/n2fl2wkiEs6KmL7aVSVtVU4F6PvWCzsp1w5TqdlKkBnvJ23VHOo/MCfUDa11QXD8
	5qruQnXvF6q5PguC7f/Jz/or7MnuLav8y5ydRwpmorhXyDBHxOZ1tpFRROPK6SmIaTubONg=
X-Received: by 2002:a05:7300:3b05:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a3002ef31mr138128eec.14.1793205978318;
        Wed, 28 Oct 2026 09:46:18 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm7821964eec.11.2026.10.28.09.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:46:17 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] drm/vc4: dsi: Serialize host transfers
Date: Wed, 28 Oct 2026 09:45:29 -0700
Message-ID: <20261028164539.3471833-5-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028164539.3471833-1-henryzhang62@gmail.com>
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vc4_dsi_host_transfer() fills the command FIFOs and the TXPKT registers
and waits on a single completion without any locking. Two callers
sending at the same time, for example a panel driver and a backlight
update, can overwrite each other's packets. Nothing keeps a transfer
from running while the bridge callbacks reprogram the block either,
for example while pre_enable sets up the PHY timings.

Add a mutex and hold it for the whole host transfer and in the bridge
pre_enable, enable, disable and post_disable callbacks. None of these
callbacks calls into the DSI device, so the lock is never taken
recursively.

Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index be9caaf50..3ee6e8e86 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -25,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -595,6 +596,11 @@ struct vc4_dsi {
 	 */
 	struct clk *pixel_clock;
 
+	/*
+	 * Serializes host transfers against each other and against the
+	 * bridge enable/disable paths, which reprogram the block.
+	 */
+	struct mutex transfer_lock;
 	struct completion xfer_completion;
 	int xfer_result;
 
@@ -805,6 +811,8 @@ static void vc4_dsi_bridge_disable(struct drm_bridge *bridge,
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	u32 disp0_ctrl;
 
+	guard(mutex)(&dsi->transfer_lock);
+
 	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
 	disp0_ctrl &= ~DSI_DISP0_ENABLE;
 	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
@@ -816,6 +824,8 @@ static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct device *dev = &dsi->pdev->dev;
 
+	guard(mutex)(&dsi->transfer_lock);
+
 	clk_disable_unprepare(dsi->pll_phy_clock);
 	clk_disable_unprepare(dsi->escape_clock);
 	clk_disable_unprepare(dsi->pixel_clock);
@@ -891,6 +901,8 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
 	unsigned long phy_clock;
 	int ret;
 
+	guard(mutex)(&dsi->transfer_lock);
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		drm_err(bridge->dev, "Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
@@ -1148,6 +1160,8 @@ static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
 	bool debug_dump_regs = false;
 	u32 disp0_ctrl;
 
+	guard(mutex)(&dsi->transfer_lock);
+
 	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
 	disp0_ctrl |= DSI_DISP0_ENABLE;
 	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
@@ -1181,6 +1195,8 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	bool is_long = mipi_dsi_packet_format_is_long(msg->type);
 	u32 cmd_fifo_len = 0, pix_fifo_len = 0;
 
+	guard(mutex)(&dsi->transfer_lock);
+
 	mipi_dsi_create_packet(&packet, msg);
 
 	pkth |= VC4_SET_FIELD(packet.header[0], DSI_TXPKT1H_BC_DT);
@@ -1807,6 +1823,7 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
+	int ret;
 
 	dsi = devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge, &vc4_dsi_bridge_funcs);
 	if (IS_ERR(dsi))
@@ -1814,6 +1831,9 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dsi);
 
 	dsi->pdev = pdev;
+	ret = devm_mutex_init(dev, &dsi->transfer_lock);
+	if (ret)
+		return ret;
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = dev->of_node;
 #endif
-- 
2.47.3

