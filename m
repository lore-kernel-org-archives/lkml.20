Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841839;
	b=tl7yWndflMypfG0csqug59MG0FdoDgnr+nsjmcub/Z9gXqnHw7HU5gEthpvgpyHwfg2g
	 cJoDBDbeJyaYqLsM2ZYhPi1/eLJPFEUPWyFpVmiWEzIRAIGrgLeHudZ3a4c1Fk73Pd4Cm
	 Vy6e1ApuLtcXExFaVxEadxxNoyxe9/5MhgLPn7onb7clEU7Av1t69XUAbyxPrionjvqTF
	 OoRwryzcK108DMlvFNIyBC+1PfXSzSLKPgzmBaD9Bj+RYSgWO18DyW0nR7S1tT2PjlqnD
	 IMRlUEdPaNR0huM35+271RK+46c0iBlAvPt3V2fO+jFPPDtWCReeCwiiZFT4ZAoc7NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
	b=GCbKkStAWQJAY/517Zpm83AqvfY9WmHe+3WyLRwCCmUR3n/+YHi2Lwh6kLDGslvv2L7j
	 TlbKA5lCDMriG99/3/HUjruQ7dppWFWcqy2JIY0f7H0Le+280lMxQVniCcZrb+dNGyHd1
	 8RhawaqKSEUjMbwKzYIQFmZk8TWGnh2UJ3lxRdjtKhNbSk0cQU+J3K7+uf0ushratyhwf
	 eUaA+18RvTBxIEibq1YrE/nid7CZ63YePV0ErA9T1/da6Qx3og2znGFk8dFd60zO7uux0
	 /AEYgput8jGJ4GPjhuwOBiFIgdJ3jzXqVmXDiJPX3z9vUei/jIJwAUvEEtCSecFQTxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzRjc8lG;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270BB606A895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270BB606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzRjc8lG
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50e26763a4so131521066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841836; x=1795446636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=ZzRjc8lG6K5pMISUfZL68KqhlUc+won/zAj6eOU6Ml7714jBz6QH2YG6WO7mLKfXwJ
         j6y7yt3u2mn+lJukdvkQoObQMloTwDjKmIGf18haUQrJRvcVGK3MHoMkAT4z0rYZ6eTe
         MidgrZsFEOGLcuVfPOnm5dNEulzwEg08lcKL71aBLjFiPxjmxI/ySk2lgicMvsazSKZ5
         gNvdQb6ReZYa2Zuglg/HPjh3MZSAtVHjIxnbAx0dzwG4JQCx45sL5uOIm/WnszS16DrJ
         Bcguo0xrJcwV7PKOOATYHRfbZ8jsQPi3hpt/ED5Tb1LK+J08/d2mXDiTKTWa+NTBSSUR
         txcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841836; x=1795446636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCblpvWCEGWSGmqyLTXb89MP/KfXdJ6wTD0eb//JjLg=;
        b=e2PxoIKp09Yz7wO2hXYcVE8iQBSwY8wJcnifJUO5YCM3G96cEYDHv6zq4rAuYKlF33
         tkh3Soa0DUaKC3P5sPWwtecsVn+RJ0GN51NwCuaKyKOyDfAZZpPprdSkZegUPWWUZ5Ds
         xwdMco4TSLftAn8eTn6uvdFA6HJpzB+Jyy9OwmtPkgnVTGkh/n5xdLBtJ6sx1XG0rM9N
         O4G72rzkGRxZOV1H3busWwbauSQWE8de0zwFflEX+Qi+gSI9yrIkyfTKBoNF8I9D1erQ
         lKJGxCNkQfNga3xU2bMr8e40+4CO/L7oW3e7iic7ixjDsdS/d3I8p3Fag3J6PHyKM/HG
         9vfg==
X-Forwarded-Encrypted: i=1; AL+hErE3r9pq7Wo9pJIIvAZPLAj6R6Zs5n8Lr8pRERmH2IvgnYog3loz5WI2KB48ygP3GwzT4BixAcAHnyIes5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4+Iy+T3v4JI+Gz7z1aExjwblZuTms02yxpnyLjTJ6tZr56VPI
	zglDPut4wSP0lWGsvSSR7rPd0q5ZP/IfSUtc+do0akgIiVAlNLcxpOrR
X-Gm-Gg: AYBFou1PUd1OqYUxX5LlkX/JD6wL14enKV014cCWoBgzJohRxNI1NjUwsmk9RVCQFe3
	mA/eePCa2+eP6QN0E3mQpLt0RYk8X7/OcolM4wtpn+SLeircFPnHCkg1Txh3qGBcc70MbcEhqtS
	PfchpqET83ElBwHfkemVaTw1GW2getmAkO32MmiJ++ygsBfX+5KiFmGYz/ARo/OXUDqD7p5RSGp
	apTW96LURgr+0vvzVl7XRlk9HDFQoHQ9Q3sJKc9sCJeMAflRUoG3fU5A8wZ90cqLT+L71V/dLFe
	S5vK8707ULP25hhtjdxYAIvRtTlsxZcOmKG/ryLDjPAX7U1TC+w0qnVPhmFcogebxK12ZMDFKfd
	dB1bjrXLZiumR9Uu+xwTgjPUBRIx7n5nmqqevTOHGm2jTep/ZTohVeiVMWr4b4mZ94J+WQ8qxYs
	AQPdZlKd2hVLB7FWhj051yxC2DwGdzSqs4YyPLcSuax3J98iNBSbPNYvSAiH/eGJoELhtPuJR+3
	vYPO9cxwQnUpzOQBfJDEPrOA+5K6k07LK3fzjsckgbWgFS35COyNj4fwS5MUWXNlKBwEbOIfEHx
	6wWrNBpHoQurT+g5Nz4kaO6xpYvcm+uL7QYKVQswW9aTf2iN1efO9efu05xEzFl4HMQrUrs=
X-Received: by 2002:a17:907:6d15:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c5096387b7dmr889055666b.39.1794841836225;
        Mon, 16 Nov 2026 07:10:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:35 -0800 (PST)
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
Subject: [PATCH v7 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
Date: Mon, 16 Nov 2026 17:10:07 +0200
Message-ID: <20261116151017.274764-3-clamor95@gmail.com>
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
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 83c2af1be9755..318ece68b7806 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d07vm0baa_supplies[] = {
 
 struct hitachi_tx10d07vm0baa {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_
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
@@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
@@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
 
-static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct hitachi_tx10d07vm0baa *priv;
 	int ret;
 
@@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
@@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
 
-static struct platform_driver hitachi_tx10d07vm0baa_driver = {
+static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver = {
 	.driver = {
 		.name = "panel-hitachi-tx10d07vm0baa",
 		.of_match_table = hitachi_tx10d07vm0baa_of_match,
 	},
 	.probe = hitachi_tx10d07vm0baa_probe,
 };
-module_platform_driver(hitachi_tx10d07vm0baa_driver);
+module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver");
-- 
2.53.0

