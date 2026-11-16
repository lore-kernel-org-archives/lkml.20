Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841843;
	b=cobJE0lgg7mGiM9fZsste/j4k9nrj6QxCWM2wqXFKaJd8mxTWkGtpfVFW2ZbjHsp0hNi
	 R6/FcZV6RfL9sU8lisuAASPP/IEuv6SlLLnqrylZTKkmjlICSTIeP+yLhG+X23vsRn9u0
	 8tVJ3qbxK//gF5pZwVk6X8qHfsroGQoKCbtW/HMdP8ZKbNFwLBVclkI7TNIU2ogLc7qaU
	 J9m1ZzsCrpfXG7c3QN3EYWTQJQ/J7pHth/CrTBqDMjm2XPemJlbvXPMy5tmBF7as3xRL9
	 uZXMb8ymx5RfkOZQdPmSV6Tnh495srFbsLwkf8Kk7XeHMUh9F9a+T7aH1f3emT/EuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
	b=OSpTwFo6ku2uQVjMJMoktN4ucTzZUsl0pWoUT3Az4BNivyn0hp4CtNTJgOyPJ4xwva/E
	 XuypMocKHmhxgO+yjCEw6Cz4xAp8KYeVxjFwORC4TuYjqTrbvYTRLqMiYT1XmzkhAfAG6
	 4CATCEf+c1qHPfuqqs2B0WNCVkNwiduCVq1UdmxL80NLI+tcTEgVSITzLONEwYCIK4Ane
	 Mq/P7qmC6Ml1F1yn6yDpNLUAgZfU6kyQS4KQsQK0a1kBjQpPkMZd9jhCdijkBbuz7ETyD
	 7per/tkKK6y3Wbs/oX+rMVGwtxg8F1a1useJphJOm6YktBYMSRB1LLFTayZAPQNOiaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISHujfWx;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2636606A896
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2636606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISHujfWx
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50604721c8so578629066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841841; x=1795446641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=ISHujfWxChiC7AbQ1qkRWzaVsdz0aoKzaTEL/eJjn5CNVAWxWoycBjni4G/oWBXeq+
         q0tPd36ecYI+tWR/sKoiLjhfRPSV5Awa3tzxtMsrofblVldGlOqDy5RUF4h38zm2//aF
         gdR1ASZWg7jHH5LDGoSVVVpAMdkucT98caGO2zWxNPOgtkckfupJ+KkAgATcpNjkfi0C
         goDZ7jKzf6tODPF8Kwfg7lCRKX7LF5rGY+DT+CzY2PXKwP93mjHweNQF70xr27WUPhAb
         0ZIUWX0w2vpLkZhRRb52ppmhqyYa57LXqaec7jZCEEXeK0hhzAIV8KgiEtZXNH4vNHP5
         ZJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841841; x=1795446641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=kHQA84vW8IOcMdNp+LkrbTNmV/ttQUyRbMCt4ZbmqiQilkFS4ac8hDmUC8lj0TZvLs
         VK1K/Sy4sx42Jy9HyQo6odFxWGCraPNaTRg7vLULYUv0InlL9R9SVoL91L0qJRNzZPqw
         K5fmp73eq/tTUY615swlMPn5XQ0HBuGEE34LubpLHXLdMx+aIXB2VHU02vijnRTKKaDn
         9QbDNQScQjOb/zdRHJ3KRDTf5HI4ZQtHbH4c75ieJvPYBFDmOSbD0kJjHoOw6KIlDt5t
         84/JgXHhdRoqAQoabICcWeWOLTo8TwhE3DYO08ftfQP7V+onD/7vB/9OKEwnT9mruhwH
         pM7A==
X-Forwarded-Encrypted: i=1; AL+hErFDxZ9Yz9Uuvrxa2+lX0TEbFzGTPulaw/3Sxsf5teWC6mqHMANonPOJPuZ6jZF/r5wcgiZ58RgAGN4LUMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U0e+DXO1Sm65toKnzuiHqfODPJiBKPp1rZigNiGrqpsIUeUPq
	SSIZjnQlqa43iQhIjG3p5XxbHn1NG94EzTnbKojcmsotIqTnz+MzD0JO
X-Gm-Gg: AYBFou2nlng71A8A/jqI7LEtdpoWYmgI9g7MuNc2yD3MDW+Fv+0p+UTfDlP5xhif8JI
	f9iHH+fPSErcOZOxoIsQS+lY7V/OAASMmnR2QWDD0huAiUD7JkYFIMlnct9LYVEehtXW27qWvGB
	nMfnooIrgUXkWWJTgw6UCYz6IyHS0bajvK59Gk0MoO7EIdGj8N23Ubo3aR7Y8S6uffU4NEugWXo
	mb7Nx8WPD+LpjRMzSGmd8hDMhI7Kfdq63+q5fqyGFlePMy3LGipZd7uSlWjso+krmBgkHGaNYg7
	Ene2AxdxBEwg9TbBXjQoWL5QQ/oRw5rP/NaAbPNQuXhacJhLGzSLQnv4RWGIVwojmWOFH4IZszk
	G4MW/+kH3DL7rYGjfK8bYLBTWH8wy8sW6loiFoTO9WCG2GDrgdrTdBC5Aa02tuFb4Kz9MXAGkIA
	HtDQODYigIjhSASJtu33Y+p4HKLps7qW7OtHynIwsI/d7giuiMzYrmRQwhHwY9zo/lbgYWrU6GA
	l6fb6259bZ4P8tdufzIzQQsN7HqgiUmb6PmkPBdO3xCssu90UFNUzTQM5zam5K0OD38POC3xS3N
	3so6h+aX+Czzc9wHVN5MQPrJm7qSJvTk+sRJkkj89JPEC1gOXcqRYVwBMJ+FLTOnGHlIa1UvkGx
	M2iOADF722wU=
X-Received: by 2002:a17:906:9c93:b0:c50:5186:a428 with SMTP id a640c23a62f3a-c50963b3380mr940379266b.27.1794841840334;
        Mon, 16 Nov 2026 07:10:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/12] drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
Date: Mon, 16 Nov 2026 17:10:09 +0200
Message-ID: <20261116151017.274764-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

Switch from a generic platform driver to a dedicated MIPI DBI Type B
driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 27 +++++++++++------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 557bcb6f2ca70..63efeb434be13 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data lg_lh400wv3_supplies[] = {
 
 struct lg_lh400wv3 {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
 ({ \
 	const u8 d[] = { seq }; \
 	struct drm_panel *panel = &(priv)->panel; \
+	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
 	struct device *dev = panel->dev; \
 	int ret; \
-	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
 	if (ret) \
 		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
 	ret; \
@@ -54,10 +56,6 @@ static int lg_lh400wv3_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
@@ -129,7 +127,7 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	usleep_range(10000, 11000);
 
 	return 0;
-};
+}
 
 static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
@@ -182,9 +180,9 @@ static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.get_modes = lg_lh400wv3_get_modes,
 };
 
-static int lg_lh400wv3_probe(struct platform_device *pdev)
+static int lg_lh400wv3_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct lg_lh400wv3 *priv;
 	int ret;
 
@@ -203,6 +201,9 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -211,9 +212,7 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id lg_lh400wv3_of_match[] = {
@@ -222,14 +221,14 @@ static const struct of_device_id lg_lh400wv3_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lg_lh400wv3_of_match);
 
-static struct platform_driver lg_lh400wv3_driver = {
+static struct mipi_dbi_driver lg_lh400wv3_driver = {
 	.driver = {
 		.name = "panel-lg-lh400wv3",
 		.of_match_table = lg_lh400wv3_of_match,
 	},
 	.probe = lg_lh400wv3_probe,
 };
-module_platform_driver(lg_lh400wv3_driver);
+module_mipi_dbi_driver(lg_lh400wv3_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("LG LH400WV3-SD04 MIPI DBI Type B panel driver");
-- 
2.53.0

