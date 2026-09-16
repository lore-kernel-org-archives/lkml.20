Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A66382F35;
	Wed, 16 Sep 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571703; cv=none; b=mIW78LlaoQhZOi+dvi2+/KMauEQevTvGq1vtHPmTsISRCOhv0jNY7NGySj/hGwPcyzsEFQfDn1+Qxq0CoGkT/JSVciEjTdlMSiAISe5vFPdUv31HZwB4o6XKVq2SwB6Utcewe9ZwJfoWxTbFgBARTTm13hQDbqSzjTVsd00KumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571703; c=relaxed/simple;
	bh=yxFG0aC/dfArZCiuejwoEokZSKztmcMpVr7xcbfJCd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfQ2umrY/p6IWn/Vg4qgD0uDLilLxmqBIvGoPe4VC0Cnbvj50kFzeZiPEihETjNcO75SS5YJy4odBeY/GOXqv4qI1fkzFHxkpqhPboIAJKK59UoRKunYtKVGeRgzONaUDvAjHGriXOu18qR38TOEGXZeI1/A7WjhvSMt3FTT3LY=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A5AD3205A03;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGn-001Fsx-2l;
	Wed, 16 Sep 2026 17:09:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:57 +0200
Subject: [PATCH v2 16/17] media: rockchip: rga: put all cores into first
 core iommu domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
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

Put all cores into the iommu domain of the first core to allow them to
be used by any core. All buffers accessed by the hardware are allocated
on the first core, as the scheduling to a specific core is done after
the allocation. Therefore put all cores into the same domain to have the
same iommu mapping on all cores.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- Fixed domain not being an err ptr
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=14)
- Detach domain on unbind callback
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=14)
---
 drivers/media/platform/rockchip/rga/rga.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 5348fcc03c525..b2eeae0a61771 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -761,6 +762,19 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 		  rga->version.major, rga->version.minor);
 
 	if (rga->num_cores) {
+		/* Attach to the first cores iommu */
+		struct iommu_domain *domain = iommu_get_domain_for_dev(rga->cores[0]->dev);
+
+		if (!domain) {
+			dev_err(core->dev, "Couldn't get domain of the first core\n");
+			return -ENODEV;
+		}
+		ret = iommu_attach_device(domain, core->dev);
+		if (ret) {
+			dev_err(core->dev, "Couldn't attach to the domain of the first core\n");
+			return ret;
+		}
+
 		/* we are not the first core, expect that we have the same version */
 		if (rga->version.major != version.major || rga->version.minor != version.minor) {
 			v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");
@@ -788,6 +802,14 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 		if (rga->cores[i] != core)
 			continue;
 
+		if (i) {
+			/* Detach from the first core iommu */
+			struct iommu_domain *domain = iommu_get_domain_for_dev(rga->cores[0]->dev);
+
+			if (domain)
+				iommu_detach_device(domain, core->dev);
+		}
+
 		rga->cores[i] = rga->cores[rga->num_cores - 1];
 		rga->num_cores--;
 		break;

-- 
2.55.0

