Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD03B05AF;
	Wed, 16 Sep 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571708; cv=none; b=eWzZV1E/yr4glZMr+idIBukOTnX5XKlHUTM6gzIgTUHGO0eLy0eGSrSAJrD5agVEd+le8sWOH2D+WKX+7lvZvmaRxBHc/l8EOu4vOm2eYMEn/V0epXOY1acn9Cz6vecGZJ6EfBZDwOeVa8Knwc3Awg2SU3RnlmP71Lx/ZidMvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571708; c=relaxed/simple;
	bh=f27ZCoxWeT7HAcE81yjH/TAOEILBfk/HNVRKV2A+xCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7jn28owNQJkDk/TKpWWxGp3b2+9IAcrPZUbh10xgi+x9s7XXyC209qRZKpCAd8z4EG1rUvQRvzPJHkB+TI4RLHSBCozVJwp1ClJ73UUIgZwp2IQo6xrZDNRhpIFct+3iZOWB48aaPqb9HuPnMDdIWSFQWF1DiZbViUIUiXX4Xk=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EA247205A08;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGm-001Fsx-1G;
	Wed, 16 Sep 2026 17:09:56 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:55 +0200
Subject: [PATCH v2 14/17] media: rockchip: rga: move video device to the
 master
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
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

Move the video device allocation and registration to the master
component bind function in preparation for binding multiple cores
to the master. Moving it to the master bind function allows to
only register the v4l2 device when all cores have been successfully
bound to the master device. This also causes the video device to be
bound against the master platform device instead of a specific core.

As v4l2_device_register sets the drvdata (if it hasn't been set) to it's
v4l2_device struct pointer, v4l2_device_unregister also zeroes it if the
drvdata matches this pointer. This creates a problem, as the driver
allocates it's main rockchip_rga struct during probe and sets it as it's
drvdata. As the v4l2_device struct is the first element of the
rockchip_rga struct, it has the same pointer than the rockchip_rga
struct. Therefore v4l2_device_unregister incorrectly assumes that it has
set the drvdata and clears it. This causes problems, as unbinding a
core will unbind the master component, but not remove it. Therefore when
adding the core again, the master component will be bound again and
tries to access an NULL pointer.

As the rga core binding expects the rockchip_rga struct to be fully
initialized, bind the cores as the last step of the rga master bind.
This also avoids a potential isr to hit just between the core bind and
the actual initialization of the m2m device.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- unbind components in the error handling of rga bind
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=11)
- Bind cores at the end, as they expect a fully initialized rga struct
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=11)
- Fix v4l2_device_unregister clearing the drvdata set on probe
---
 drivers/media/platform/rockchip/rga/rga.c | 109 ++++++++++++++++--------------
 1 file changed, 58 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index fa34b93b1b7a5..39fcb5623095b 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -746,39 +746,15 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
-	struct video_device *vfd;
 	int ret = 0;
 
 	core->rga = rga;
 
 	rga->cores[0] = core;
 
-	ret = v4l2_device_register(dev, &rga->v4l2_dev);
-	if (ret)
-		return ret;
-	vfd = video_device_alloc();
-	if (!vfd) {
-		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
-		ret = -ENOMEM;
-		goto unreg_v4l2_dev;
-	}
-	*vfd = rga_videodev;
-	vfd->lock = &rga->mutex;
-	vfd->v4l2_dev = &rga->v4l2_dev;
-
-	video_set_drvdata(vfd, rga);
-	rga->vfd = vfd;
-
-	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
-	if (IS_ERR(rga->m2m_dev)) {
-		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
-		ret = PTR_ERR(rga->m2m_dev);
-		goto rel_vdev;
-	}
-
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto rel_m2m;
+		return ret;
 
 	rga->version = rga->hw->get_version(core);
 
@@ -787,38 +763,13 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_put(core->dev);
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
-	if (ret) {
-		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
-		goto rel_m2m;
-	}
-
-	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
-		  vfd->name, video_device_node_name(vfd));
-
 	return 0;
-
-rel_m2m:
-	v4l2_m2m_release(rga->m2m_dev);
-rel_vdev:
-	video_device_release(vfd);
-unreg_v4l2_dev:
-	v4l2_device_unregister(&rga->v4l2_dev);
-
-	return ret;
 }
 
 static void rga_core_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rga_core *core = dev_get_drvdata(dev);
-	struct rockchip_rga *rga = core->rga;
-
-	v4l2_info(&rga->v4l2_dev, "Removing\n");
-
-	v4l2_m2m_release(rga->m2m_dev);
-	video_unregister_device(rga->vfd);
-	v4l2_device_unregister(&rga->v4l2_dev);
 
 	core->rga = NULL;
 }
@@ -944,20 +895,76 @@ static struct platform_driver rga_core_pdrv = {
 static int rga_bind(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
+	struct video_device *vfd;
 	int ret;
 
+	ret = v4l2_device_register(dev, &rga->v4l2_dev);
+	if (ret)
+		return ret;
+	vfd = video_device_alloc();
+	if (!vfd) {
+		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
+		ret = -ENOMEM;
+		goto unreg_v4l2_dev;
+	}
+	*vfd = rga_videodev;
+	vfd->lock = &rga->mutex;
+	vfd->v4l2_dev = &rga->v4l2_dev;
+
+	video_set_drvdata(vfd, rga);
+	rga->vfd = vfd;
+
+	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
+	if (IS_ERR(rga->m2m_dev)) {
+		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(rga->m2m_dev);
+		goto rel_vdev;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
+		goto rel_m2m;
+	}
+
 	ret = component_bind_all(dev, rga);
 	if (ret) {
 		dev_err(dev, "component bind failed\n");
-		return ret;
+		goto rel_m2m;
 	}
 
+	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
+		  vfd->name, video_device_node_name(vfd));
+
 	return 0;
+
+rel_m2m:
+	v4l2_m2m_release(rga->m2m_dev);
+rel_vdev:
+	video_device_release(vfd);
+unreg_v4l2_dev:
+	v4l2_device_unregister(&rga->v4l2_dev);
+	dev_set_drvdata(dev, rga);
+	return ret;
 }
 
 static void rga_unbind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
+
+	v4l2_info(&rga->v4l2_dev, "Removing\n");
+
 	component_unbind_all(dev, NULL);
+
+	v4l2_m2m_release(rga->m2m_dev);
+	video_unregister_device(rga->vfd);
+	v4l2_device_unregister(&rga->v4l2_dev);
+	/*
+	 * As &rga->v4l2_dev == rga, v4l2_device_unregister (incorrectly)
+	 * clears the drvdata. Therefore just set it again
+	 * (ensuring it's correct regardless of the struct member position)
+	 */
+	dev_set_drvdata(dev, rga);
 }
 
 struct component_master_ops rga_master_ops = {

-- 
2.55.0

