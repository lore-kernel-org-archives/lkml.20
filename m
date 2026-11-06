Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973547;
	b=lzS3I8eCErznfbAUsOQb8iYU9ATXZ9U3wwtB3UtYf3nxQR9OxyzKhZ1i3F4eb2IoOc8+
	 kV9qvBlNp5FutKjxnfO73ICn82nlYWEwUyaixGZKVx8RaKW6EZKY4CcG6ufAQGJyjK0Za
	 gkF3ozLGrdCLO266Uy/d0i0Co4EPVHZe8xzlpKrZU4P3bm2tOpJ47Tg+TBafCFMt8QIcr
	 nRTATN8mgjl1leEUJx9uHydYK11qZP0U5bWfUtXx3ijsKaQH/sxS2mDSKgQ3sp3KRHFkI
	 Wbx9Mkf63zuJiC7Vf1hcB8zrJ4UeUpQDtwGTI0Z36m0cIjkTGZYJfxJ4la9/jKq8fVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973547;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=SJy6knPJ3U1RO9ZQMH29hZIVj78BiirQCTF7CFHTH4U=;
	b=qtw4hqVWpm+uX9Hv8/Fh/v+Q6BhGzDAiAiTaROgv3zIKZrp0X/ouun+ZAl7prEXF6xbW
	 /U/bHO4pIltJ5bSlLqCfD2Z2wustL6B4k1Zado8h6bsfCpNCQUvWPRmnavlrPn8MzJy/x
	 sqjJUZv2tjupElAkV6LjW12U7ro35ND3m/D8UN0kW3po93vb15vr2OpSSznTTNQjCH8yH
	 6U62S7OLqayD9vK9eWQcApWdLNXRDjjZvXHdsWgw1zaWeNYPo1o8PL8Oc1rvQcC6aeQDT
	 kAQzw93u5tLOcX825Xb5BJpu6mdZ9KUtLEetA2bfCgW6pWdnutfinSfhr8dPhL+YyvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Fy66yNIb;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE06606D811;
	Fri,  6 Nov 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE06606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Fy66yNIb
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135904euoutp011927718c865fe051c98c87e7d012b17a~leW8rlyOI0202802028euoutp01M;
	Fri,  6 Nov 2026 13:59:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106135904euoutp011927718c865fe051c98c87e7d012b17a~leW8rlyOI0202802028euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973545;
	bh=SJy6knPJ3U1RO9ZQMH29hZIVj78BiirQCTF7CFHTH4U=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Fy66yNIbahx5v+Nxwsg6gSIw1NF65bG5tek76s/RTfpmRcKuhnVBuEvPd0vgwvf6v
	 dUzkE5MEYIA1G/SGn+wYI7a3FAtxNhpcChyZUVaqTrwjtKQ6DwzerGnEGvTu2ircVk
	 WxmsBtAfGxc5Bu/SZFpNlnUHwBGgNHjwteXZpCms=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135904eucas1p14897dcc411c444d202a38190fdffffe7~leW8aobOu2296222962eucas1p1G;
	Fri,  6 Nov 2026 13:59:04 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135902eusmtip1710e4471b7f77b1afc16bbdf73228e98~leW6qAtJp0565905659eusmtip1D;
	Fri,  6 Nov 2026 13:59:02 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:42 +0100
Subject: [PATCH v7 08/19] drm/bridge: inno-hdmi: Split probe out of bind
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-jh7110-clean-send-v7-8-68f7ea9913db@samsung.com>
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4776;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=862IzWw71BQoGb/BPHHj6uuaTnp3hDhV8BCXYH6fCIg=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSvexMOzI8UlOqAhoGbXwtN5r8LPqb2Xlfd8sHvv3
	LcGC8ITO0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBE4jgY/sesuTOJf9Pl+Uu1
	ubwil8d7eXcduSf1tEHm07GJ1z5JvXJk+Cvs5cbGGD+vw9z4caWz4MXTNu3Xwi5++df4gDPL9Nh
	aL04A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135904eucas1p14897dcc411c444d202a38190fdffffe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135904eucas1p14897dcc411c444d202a38190fdffffe7
X-EPHeader: CA
X-CMS-RootMailID: 20261106135904eucas1p14897dcc411c444d202a38190fdffffe7
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135904eucas1p14897dcc411c444d202a38190fdffffe7@eucas1p1.samsung.com>

inno_hdmi_bind() both sets up the bridge and attaches it to a DRM
encoder. A platform whose HDMI controller is a child of a larger device
needs the first half without the second, since it registers as its own
platform driver and lets the DRM core bind the bridge later.

Move the setup into a new exported inno_hdmi_probe(), and reduce
inno_hdmi_bind() to a wrapper around it. Like inno_hdmi_probe() and
dw_hdmi_bind(), it now takes the platform_device, so the Rockchip glue
does the to_platform_device() conversion instead.

No functional change intended.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c            | 39 +++++++++++++++++++++++----
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  2 +-
 include/drm/bridge/inno_hdmi.h                |  6 ++++-
 3 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 5bfe59f18823a8628b0b65a768d2ba9989a0f30a..aa64ffdbd30721603aebbcd5d5747851be789911 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -1063,11 +1063,24 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	return adap;
 }
 
-struct inno_hdmi *inno_hdmi_bind(struct device *dev,
-				 struct drm_encoder *encoder,
-				 const struct inno_hdmi_plat_data *plat_data)
+/**
+ * inno_hdmi_probe - Internal helper to perform common setup
+ * @pdev: platform device
+ * @plat_data: SoC-specific platform data
+ *
+ * This function handles all the common hardware setup: allocating the main
+ * struct, mapping registers, getting clocks, initializing the hardware,
+ * setting up the IRQ, and initializing the DDC adapter and bridge struct.
+ *
+ * It registers the bridge but does not attach it, for glue drivers that probe
+ * as their own platform device rather than through a component bind.
+ *
+ * Return: the inno_hdmi instance on success, or an ERR_PTR() on failure.
+ */
+struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
+				  const struct inno_hdmi_plat_data *plat_data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct device *dev = &pdev->dev;
 	struct inno_hdmi *hdmi;
 	int irq;
 	int ret;
@@ -1131,7 +1144,23 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	return hdmi;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_probe);
+
+struct inno_hdmi *inno_hdmi_bind(struct platform_device *pdev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data)
+{
+	struct inno_hdmi *hdmi;
+	int ret;
+
+	hdmi = inno_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi))
+		return hdmi;
+
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
index 33ff195bd2e65367792710ed2bcfb2f7c217d8e6..1f04489477e07f61e8793e08e03e73566366c725 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
@@ -127,7 +127,7 @@ static int inno_hdmi_rockchip_bind(struct device *dev, struct device *master, vo
 
 	dev_set_drvdata(dev, hdmi);
 
-	hdmi->base = inno_hdmi_bind(dev, encoder, plat_data);
+	hdmi->base = inno_hdmi_bind(to_platform_device(dev), encoder, plat_data);
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector)) {
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 5bbcaeea94e2a20fd0dc0ae0c6946eb5604bbaf6..507d5e999183ca02e7dcbe4ce7568acc21426a89 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -12,6 +12,7 @@ struct device;
 struct drm_encoder;
 struct drm_display_mode;
 struct inno_hdmi;
+struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
@@ -29,7 +30,10 @@ struct inno_hdmi_plat_data {
 	struct inno_hdmi_phy_config *default_phy_config;
 };
 
-struct inno_hdmi *inno_hdmi_bind(struct device *pdev,
+struct inno_hdmi *inno_hdmi_bind(struct platform_device *pdev,
 				 struct drm_encoder *encoder,
 				 const struct inno_hdmi_plat_data *plat_data);
+
+struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
+				  const struct inno_hdmi_plat_data *plat_data);
 #endif /* __INNO_HDMI__ */

-- 
2.34.1

