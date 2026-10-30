Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339910;
	b=Wh/ihEdJ1EMlKH6UtfYU/AY5co8WFekNQZFTTa6De8GAyzRIOy+0+z/TIDEDu/GzK10y
	 Natdla2x25nZepaWAoEmNGjr5fYuPmae+flQNyjk76RJxx7woY73617iwS75MibwPJ2je
	 +Zi5SOTSH1qXuwgGhC0iWuGdSctgL72dtzY3171k95ZeofJuEfK4++dVrDCU44kf1H6U4
	 4SWHvlhFEzocHTU3Tqf297rlreKYx+EXlwzYfvMffFhqSNRPPIbKgtBU/PFpHkbF+rcI+
	 th5nm+zJdN6P37h9hPwNbSrbADICe4s68TdWxNRp8yoY4BGNOBvqMKKXN6F+q/9RiZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339910;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=e6i9sRE0fazeUbY38QD6G/Q44DvIHcmnW2/n8kA/Mbg=;
	b=bOt+3h7/NV31XsoKCmaTOj0QIQzHitUAqjndhfmIXsu5VnJuTiorp4fLGYNabOobNEgw
	 nL4sWmjO17XeNt4Ku/3pKofg3nN9YVFYOGOFBeZe+TlZP4nonVWNyBT3xdbCy6EVKwaFX
	 li/KN+tG5MJWgiclSlER1/wsFamLRogMIs2dpH9+OMiKhVLBYYRcwUMsA9YWYAR3jQi6+
	 HgldqBEHeCiDmrjsV/clbQJZuioHPriZxYzPqMivo/SlwlfQ4UdWJLVjxjEU3wOEmJQ8o
	 /VRAyMembM37QLeO731TFs3YnWDvgxhNc6mUm32we6vH1y0FwMlXM+Y3U+DXQxEtGQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F88606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F88606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowACnfPDyMeRqxZMEDA--.17693S2;
	Fri, 30 Oct 2026 13:58:10 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ondrej Jirman <megi@xff.cz>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] drm/bridge: dw-mipi-dsi: fix cmd mode transition when disabling
Date: Fri, 30 Oct 2026 13:58:06 +0800
Message-ID: <20261030055806.4102994-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
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
X-CM-TRANSID:qwCowACnfPDyMeRqxZMEDA--.17693S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4fJw4UAry7Kw1rGw1rWFg_yoW5urWfpF
	Waqw15trZYqF4qvas7CF48Jr15Gas8t3yrtrWDGa4SvwnY93WUX3Wvkrs7XFyUXF4xAF13
	AFn7Jry8Cas7AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

With pre_enable_prev_first flag set, the atomic_post_disable hook of the
next bridge (which should be the DSI panel bridge and calls panel
unprepare hook) is called before the hook of the DSI controller bridge,
which leads to the switch to command mode happening after the panel
unprepare. In this case some panels' unprepare hooks sliently fails
because they expect the DSI controller to be in command mode.

As the DSI controller atomic_disable hook happens after panel bridge
atomic_disable but before panel bridge atomic_post_disable, it seems to
be a good position for the transition to the command mode.

Move the mode transition from the atomic_post_disable hook to a newly
created atomic_disable hook.

Fixes: 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI controller")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Tested on Lichee Console 4A with a pending glue driver for T-Head TH1520
DW MIPI DSI. This device has a always-powered panel (no switchable
supply and no reset pin), so correct execution of unprepare commands is
critical.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 5dd475fcaacf8..49b6228ca69e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -944,14 +944,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
 
-	/*
-	 * Switch to command mode before panel-bridge post_disable &
-	 * panel unprepare.
-	 * Note: panel-bridge disable & panel disable has been called
-	 * before by the drm framework.
-	 */
-	dw_mipi_dsi_set_mode(dsi, 0);
-
 	if (phy_ops->power_off)
 		phy_ops->power_off(dsi->plat_data->priv_data);
 
@@ -1058,6 +1050,20 @@ static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 		dw_mipi_dsi_set_mode(dsi->slave, MIPI_DSI_MODE_VIDEO);
 }
 
+static void dw_mipi_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_atomic_commit *state)
+{
+	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+
+	/*
+	 * Switch to command mode before panel-bridge post_disable &
+	 * panel unprepare.
+	 * Note: panel-bridge disable & panel disable has been called
+	 * before by the drm framework.
+	 */
+	dw_mipi_dsi_set_mode(dsi, 0);
+}
+
 static enum drm_mode_status
 dw_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 			      const struct drm_display_info *info,
@@ -1098,6 +1104,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.atomic_pre_enable	= dw_mipi_dsi_bridge_atomic_pre_enable,
 	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
+	.atomic_disable		= dw_mipi_dsi_bridge_atomic_disable,
 	.atomic_post_disable	= dw_mipi_dsi_bridge_post_atomic_disable,
 	.mode_set		= dw_mipi_dsi_bridge_mode_set,
 	.mode_valid		= dw_mipi_dsi_bridge_mode_valid,
-- 
2.56.0

