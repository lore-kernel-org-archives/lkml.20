Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042220;
	b=1L7jRZNZuYPtBQjfesnCZEQH3JdDp4HK1tt2EBwqF20jg66OJ7wETccILmNfNovkZAjr
	 odDvdWCO4Ko3o+SkqBiCD3zYyxtZ9h0KLDjpdnTotqpnd5mvfBiU7r3j6Qr7+jjhWgURK
	 qk+/70/3FvkcR8oNCiEjWALdTl4oOs3gEU7JsC67jolaoyHr67ji940WiQVHjc0k62riT
	 RWWIIVRBlQUa+PvfUCIyFK28Bj7lqtXhWdEabSHXQdCQTRs+x37jU/oEbrmHmLDIiTzI2
	 48gNk8dYm3+RN1o3PYfa30FN0F7YNwDNRGB9E1RyZgyf47FH5+xORU3zpTwvqiU1tiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+bGNbnue3tJ58zjsjRmvD5wgIcpWQRHib1cVlgVdWU=;
	b=otert+W89rcrJA0m3KyOUZtxZtmPrnFEOZZdSrXfDqi/XjlJG+ZKc2ruRnlSfPBfPZ2u
	 XpZOJ07jJoEXUpE8Ix5agy8PImUvyG6U7Vp3Xs2tMnIfJSMnVohx3w/tF6bA2s/m8DIL1
	 FZfK3uLJSoPuD5xaT9VtQvwV1PcSCWPcpFEiBEW3XZ3Okct5QWa6YL5fEaMsedvoCxmOX
	 9VArRZODqrvKFws5MWCXykfkOwTR38YHtiP7TSXEqM6R02guL5wdZyJ9wq7v/5+9i5/WI
	 CQ6be77uxF8YDYTEhvKGFTiWUmLoKmfW96skPJ8b5XtZSfgnZ9Bxug6A5xkquidpayw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R7E5dHCs;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97E606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D97E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R7E5dHCs
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35943f55c06so370195eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042220; x=1793647020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+bGNbnue3tJ58zjsjRmvD5wgIcpWQRHib1cVlgVdWU=;
        b=R7E5dHCsBdTQKpnnuJfeXgiX9CyxuNaDkJSD8IoD1yuaXN/DwSN297BuAZH94BwkBj
         xhbu2K0yh1pkrJ6nLJaKiLFRZYCMH9sdbYEp5owSc2vfQ2ooQG7XQui/nO6x/DEVAD7U
         RYQoVGJyNm2kwwlgUEuyJsoDYEkV+kL7GhaAs+nTN69KRQgZvWBXudivzuVWSF25H96S
         REXU2eTppAenT5kz4fp0M9+fPAKiYe2XJXWXil5vyir25OkaV9/nrwTNUCLKpcsUiPX2
         QDhvuslGbHrtxtQ+AS4NvuL9BJ8DxUo6ieRp0QtfQArBJDyafHqxdkSma2ZuKXgjoZ1u
         +sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042220; x=1793647020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+bGNbnue3tJ58zjsjRmvD5wgIcpWQRHib1cVlgVdWU=;
        b=fTtkXWM3pAnkcawI5miMNK0m//fUqlWIiKBO1Znc0sCtZ9Ed4szhuEkiQvloe6LKoF
         ITNeOMaEg9MPyq3Npo90rooOBL+lv7M4+TkI3HgN6A6yILUZJHjLJCCTppxDZ+AczxTD
         8J608LZLy3TR/Wf7S7573a/Jbigtxnzttnctf3acv8AqRM+3fMLbyzER/a3HNFBcfwra
         y6ipcBYd51x5R8OnwzQt9vuUJ8Txjae/vOmBQmUqa6huZs3ZrJyNeUtbfxAS0tkEa3S7
         Jzk5WeQIPS/qU7VnHDeXo5184FmRxprgtWZ4LUe/qkXo1oNqdb41x75IuJqCtVJzK70Z
         as5A==
X-Forwarded-Encrypted: i=1; AKwUvByBSZBDFBnj+SJduVbzGtokYeTFxT/eMo4a7VzA3RPZrZKXVIJpPJV0bVwPCPhzuPPzoY0gkaEMDqqT6OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFRxYclyKxnXPzHHw8JQ6ThrTztPcWYrxVhvL5n1ZEBB0EXlCG
	JKRRcOWoQmoT/Ys20RRZUjDRBRw3oFh/nQqTbev+/C7gPwS0Yq3qYYFK
X-Gm-Gg: AYBFou2C2KVXe18886tfS4VL3TwURbcTWLRMzW11Qu9zbPaigulykzeKSAY7Gpc2KA5
	VgRNvJPq+BDmQec1P9ZY82Vk0TMESeoFOvBNG0BeYgK6SkMAMyZEyMDZQqLwYMXNYSp9q7wdUvO
	zcv4q9giO45TMxqXzC0pTHfVg1/b5RFmXHtbpktPK0lVLvu/dvXsyDEbNXkZhV6534Ap9vl+HOU
	54UZylCwqhrSwa53KRKajsIydjcUfwttxRkZprPFlZvGgfOS4HFFGeb1OBQpXiNaTgG14fMa+Si
	1rrQYCm7Z2k5Gd5WO8Fd7byiYNixJRKm7quwOCdQog6861SjuFRAIgJBb5POqsRuNa8fC/IX97p
	mnAl7IcIFmFzlu3X5RSWaNJfN0jGavQbKayMs4BERw6n8w9lQulqgaMJRMIOEOu9PAP3RT2BMED
	XSg/39GeDR7sNYyltSBy6CTaEU12l06dp3NG2GKHcoN3gVSSgJFiSRBSTIklx1NAR/NMcQ4u7vO
	8FlR8HG8mtnhl7frLk5bl2oN/syCRJT1TVA6+VPl07Gq3SYUEKcZeBiCQ7iOUKYR0yBPTy0fVNo
	dR+ED6rlpjQG3+cYvl8/CA==
X-Received: by 2002:a05:7301:2123:b0:361:cd8f:7422 with SMTP id 5a478bee46e88-36a0f7617bemr638620eec.9.1793042219444;
        Mon, 26 Oct 2026 12:16:59 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25348449eec.21.2026.10.26.12.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:16:59 -0700 (PDT)
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
Subject: [PATCH v3 3/4] drm/vc4: dsi: Serialize host transfers
Date: Mon, 26 Oct 2026 12:14:57 -0700
Message-ID: <20261026191618.9430-4-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026191618.9430-1-henryzhang62@gmail.com>
References: <20261026191618.9430-1-henryzhang62@gmail.com>
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
index face44a23..ea3a6d06b 100644
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

