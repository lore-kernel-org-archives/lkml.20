Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961234AB19;
	Wed, 16 Sep 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571703; cv=none; b=s5eGhlnXFpXwuK0sCPVVOgMEJ9SAkt1UaBhIOpPc4ijGyl1r2T0KgQVlXaDIvmvwv6INTcvvGYzd2S4QU8vMTaqNXYkaiM7ExIaDsCTUFVvW8xXs/QoZzZo0o1ldEGOLqc9DMCOpXUIPVtYfIJUhq0V0cH1zIc/js/0t9JSJyz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571703; c=relaxed/simple;
	bh=dTdnVEWbXF1Sf9XkqT0fJtspANjSBkIuXBW0zyWR7E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jexFQ7jxM+SIvZEExExI6nStHkcFL3gWleD1T0NGxsccaHfMhqMpcA05vxnmfbjd4A6q11NKjlkMfdxCmI4VnQXhCmLUMInFAzV7lujmLGfTw2evwCEreZtIE6hjS6YewwMxo847pgHhCIbwhFyYxlS4G7msY91POt0C6YIlTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BCA07205A04;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGn-001Fsx-0N;
	Wed, 16 Sep 2026 17:09:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:56 +0200
Subject: [PATCH v2 15/17] media: rockchip: rga: bind all cores to the
 master
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-15-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2

Bind all core components to the master component. Previously only the
first core has been added to the master device to avoid creating
multiple video devices. As the video device creation has been moved to
the master component, it allows us to bind all cores without creating
additional video devices.

We expect that all cores to report the same version number, as we only
add cores with the same compatible value. This is important, as  we
setup the command buffer before actually scheduling the work to a
specific core. Therefore adjusting command buffers depending on the
version register only works when all cores have the same value.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2:
- Fail (instead of warn) on a multi-core version mismatch
- Also decrease the num_cores when unbinding a core
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=13)
- move rga->cores at the end of core_bind here
  (previously done while moving code to rga_core_probe)
---
 drivers/media/platform/rockchip/rga/rga.c | 36 +++++++++++++++++++++----------
 drivers/media/platform/rockchip/rga/rga.h |  1 +
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 39fcb5623095b..5348fcc03c525 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -746,23 +746,33 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
+	struct rockchip_rga_version version;
 	int ret = 0;
 
 	core->rga = rga;
 
-	rga->cores[0] = core;
-
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
 		return ret;
 
-	rga->version = rga->hw->get_version(core);
+	version = rga->hw->get_version(core);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
 
+	if (rga->num_cores) {
+		/* we are not the first core, expect that we have the same version */
+		if (rga->version.major != version.major || rga->version.minor != version.minor) {
+			v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");
+			return -ENODEV;
+		}
+	} else
+		rga->version = version;
+
 	pm_runtime_put(core->dev);
 
+	rga->cores[rga->num_cores++] = core;
+
 	return 0;
 }
 
@@ -770,6 +780,18 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rga_core *core = dev_get_drvdata(dev);
+	struct rockchip_rga *rga = core->rga;
+	u8 i;
+
+	/* Remove our core from the list */
+	for (i = 0; i < rga->num_cores; i++) {
+		if (rga->cores[i] != core)
+			continue;
+
+		rga->cores[i] = rga->cores[rga->num_cores - 1];
+		rga->num_cores--;
+		break;
+	}
 
 	core->rga = NULL;
 }
@@ -992,14 +1014,6 @@ static int rga_probe(struct platform_device *pdev)
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
 		num_cores++;
-
-		/*
-		 * As multi core is not implemented yet,
-		 * break out of the loop to only have one core per rockchip_rga struct.
-		 * Also put the node, which otherwise would've been done by the loop iteration.
-		 */
-		of_node_put(core_node);
-		break;
 	}
 
 	rga = devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cores), GFP_KERNEL);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 94e14c2a2ba6e..522021c3e0249 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -89,6 +89,7 @@ struct rockchip_rga {
 
 	const struct rga_hw *hw;
 
+	u8 num_cores;
 	struct rga_core *cores[];
 };
 

-- 
2.55.0

