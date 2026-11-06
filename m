Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950204;
	b=nmP/dNmRBm90M2lZO9NXeAqdBWic0YJ19k+Sm74oU0cvoolhJcznse9b96fiAyUjH3as
	 O2zE2m1hPRNRk526E57ZevtLH1E1Md9Xhkfp3oIJUzFeWbwFqOA/XQhTIIazJaFZKuoc3
	 Xt7zmlQl7XVdfMEtVdjImmMFX39M2heQkUhvW5yFNcV5L6hhAxwZsAeU+ipI3VC2hSs04
	 y0GjOsoFN+faJS/j1/1GKaLnZcH9zgTRu1TbkqdtwSnxJyZkqiuw78X3oEeupgQnKaTqs
	 ls7sdNbRJbsddZHwvRTGndRGxLBtM1NArtihppnqO90LhFUJzUMbqgue/yD/Mqw81Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950204;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=waNo/gCY18u4onJc2VEN79eNR4Xdtc7DHg6nfR5Bve8=;
	b=mWHa4qNBS4SZp5Fdy1MkjCi+l6ME2mL8y5u/of1H3gTOLYGZ/i6ctrJ0QgE6Zph5mOZ7
	 wdPQ62VHYEslU+4RpS/mPFVfls/ZFRl0f5Vlp0OwavuH0iR9j3bFGj0EZb10gFNmc8fyi
	 MCpmSU9b+2NmIHtnHOtZ2T+HkOBHqjeTta3DHJVmue6c7xcy+hIp9K6jrFMfe01QQoVjl
	 L6zWYGuAx5edQhDkoCxu0bcPinpV8c0Krm0xVvMeBzkDUXSxkQ3fofQHIWpvdpG+TsLSS
	 S0/ssXAe0hWQSHwNlU9swn6YM9Zfdj8/KmEM7Kr+nvYv22MTPjm7xc3NmUfMDp6GTcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8BF606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8BF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABXX5Dpge1qAdxpAA--.3990S2;
	Fri, 06 Nov 2026 15:29:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boris Brezillon <bbrezillon@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] drm/bridge: cdns-dsi: Handle runtime PM resume failures in bridge callbacks
Date: Fri,  6 Nov 2026 07:29:54 +0000
Message-Id: <20261106072954.2116361-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916145427.GA40507@killaraus.ideasonboard.com>
References: <20260916145427.GA40507@killaraus.ideasonboard.com>
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
X-CM-TRANSID:rQCowABXX5Dpge1qAdxpAA--.3990S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWDJw1xJFykuFyxur43Awb_yoW5ur1xpF
	40ga4YkrWDZF4Yv393Cr1UXa45A3Z2yayrGrW7Kw1Ivrn5u3WUur9xCryavFyDCF92qF17
	Xw1kJ34xGF10yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JjU-B_UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIDA2rtTzW3zAAAsI

cdns_dsi_bridge_atomic_pre_enable() uses pm_runtime_get_sync() to resume
the DSI controller.  The helper increments the runtime PM usage count
even if the resume fails.

The corresponding post-disable callback unconditionally accesses the
controller registers, releases the PHY, and drops the runtime PM
reference.  However, the DRM bridge pre-enable callback returns void, so
a failed resume does not prevent the later post-disable callback from
running.

Use pm_runtime_resume_and_get() to avoid retaining a usage count on
failure.  Track successful runtime PM acquisition and skip post-disable
cleanup if pre-enable failed.

Also move the bridge state validation before runtime PM acquisition.

This change was prepared with assistance from DeepSeek-V4.1-Flash and
GPT-6.1-Sol.

Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

---
Changes in v2:
 - Sorry for the very late reply, and thanks for the review.
 - Use pm_runtime_resume_and_get() as suggested by Laurent.
 - Track successful runtime PM acquisition.
 - Skip post-disable cleanup after a failed pre-enable.
 - Validate the bridge state before acquiring the PM reference.
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 12 +++++++++---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 1e28ea579b06..da27f5611bb7 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -613,6 +613,9 @@ static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	 * disable their streams.
 	 */
 
+	if (!dsi->bridge_pm_active)
+		return;
+
 	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
 	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
 		 DISP_EOT_GEN);
@@ -630,6 +633,7 @@ static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	phy_exit(dsi->dphy);
 
 	pm_runtime_put(dsi->base.dev);
+	dsi->bridge_pm_active = false;
 }
 
 static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
@@ -734,13 +738,15 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	 * enable their streams.
 	 */
 
-	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
-		return;
-
 	new_bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
 	if (WARN_ON(!new_bridge_state))
 		return;
 
+	if (WARN_ON(pm_runtime_resume_and_get(dsi->base.dev) < 0))
+		return;
+
+	dsi->bridge_pm_active = true;
+
 	dsi_state = to_cdns_dsi_bridge_state(new_bridge_state);
 	dsi_cfg = dsi_state->dsi_cfg;
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index 5db5dbbbcaad..6ed6e1bb8573 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -76,6 +76,7 @@ struct cdns_dsi {
 	struct clk *dsi_sys_clk;
 	bool link_initialized;
 	bool phy_initialized;
+	bool bridge_pm_active;
 	struct phy *dphy;
 };
 

