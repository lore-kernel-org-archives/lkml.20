Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287785;
	b=XcAd0pzIc+jn12v7R4XeUEjL7AuoYS43FoT8Yd96p66qCLV8dEA1b9AztmwJojvsynDJ
	 7uXpDal9dR5uvS+kRlGj9naVVN/ISTaBqFa/oM6x2xmfDJf1BqQroRcCx+w1FFLXKRV3v
	 VtUNV4oyumF3IkmOzW6FmIpCIAT9Gjf2ZVsfC2AQsRcNux/cTpYfyfgrUb561vyjq0gUT
	 rBnrq6qFVS4YlafO69gdPGnujWyLn84I8z32R2XWi2qh0bBBBG9nqSaxgM1LRIQuDUheu
	 3DEV0fIhfzCdxMUKIDDRov0JEyTApYkopPfHzy/axhIqSFI0TbXSVF8mJn2Dr2nifwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BMKtjudVZEjfMcNSisc3laHJ/AC+VgTtmt6i7T2INik=;
	b=BJP+qqnGXSfIoo8j6o4+gCVTzbccJ2stqumONNKNSJWA0a43H7YZWIhRDJ6H7dqWK8NI
	 OrBtEmOaZZiVB4Sa35FZgTmDyuLzXAjZ6iNKHcOzcLQpL+ZfAYFGObcK2BXQvpzBO42BA
	 EougfEgsoIYLKoveuR8Z5Th4JLpGnGoDvNMtocrbR81CCuTa9hmkP3PDMoumcn6AIUPdn
	 KQRHXFziz829Cld4msbtXWY/JHnjVI2MZ40HKI6Hz+Ee0cmTSEXjZVLtqRz5aCjeJstV1
	 YP9tOxs82Y9lh/BMFXKzTZqBzOd5BmzZKlCS1LMm7D4lLesk/nKz/HOLsn5FBo0bTWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tYv3aGNs;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF73606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF73606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tYv3aGNs
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3388547a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287783; x=1793892583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMKtjudVZEjfMcNSisc3laHJ/AC+VgTtmt6i7T2INik=;
        b=tYv3aGNs2aMiCQmwxH9QbfyD+MlIHSNs4FIXY/6cTaTEjVGi0KOLFGdsjVHUrH6CBR
         ILAX8BOBqknzCEpb3JbfyX1O/jKZmzLfnMo9G1uZmzNJH9zfsXDO97NaWvdGGRxY+GBn
         qkjWDVOHpqhP5yUpCqxfqt0f5CjHdeLpjhoJFBacrLqB8zBOMmxJP5Z6sxGX9vHqPiMu
         0I56FcIAOR5klEHz682jcUReQ7+IlMZEhO9woiZdezFvBfZnp1Bvq4mvXsDbDkU8JGYi
         CFx07ph0nHFsOIbaZgdLuN5qLjlEw9iCY7UqwhXl/ldJQbaOisDaqylSlc9277MBH5Cf
         NXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287783; x=1793892583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BMKtjudVZEjfMcNSisc3laHJ/AC+VgTtmt6i7T2INik=;
        b=MvmO/NtGaSww1K4JPcD2g2VuqJfE9eSVdYS44BVE5aRLoRxRzvS+3oZh14G2xblkxU
         gOWjmcgvqYS4dpl4aRdKDt66s2ld6X2frD/Pgp06+ww6TFx+HfUonHrP0be54RmtFBZU
         UdQ9Qr/88UI01MtHXpzdubE/tI/dDKolHA4dYcsWEvgcGzGNqqIRcKd9GzQBRsWk18O0
         HesLz/7jIkb7BzpvlJ9WkKYP0m0LlN0fSsSyLNMvylHRSNzG+MWCa219pcD8ldqHuuFK
         id9POBAkTaiykhU3exaD04JLwdFa55cZa/a/LnQb4Mbp+AvQx+H655D+Wi3nY69MgNWq
         +Kww==
X-Forwarded-Encrypted: i=1; AKwUvBy7B9fFy6SBbB6bIIvBPFYpA9GFiPY/S3il8k+LDOuebsk7F23oVgJZIlrJA9upmQyNySoSFDgJZUJXzzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJeRkAzk3v+z4hg/zmoBhen48Kiqt2aXZ1YWIbqt3rtf+lELKn
	vmH+LKIJw/9+XmN9q6Cnzvf3KFmWv0Qkd7tk9KTJD3bCsvIXYR79zRID
X-Gm-Gg: AYBFou0MERArrb0U3ZavmDTEQuFVO06IrBKAT8x5tm2t3Zl2Sf2X13Reite4ypobOXd
	xcn0zDQQmUmqpSefYdTE7suRsH+AuKJ6fqcnhi8l63/E1Vi+Ivh21seRaotFwpWD+pog40zPAp2
	dQzERjpNKJOUwAVxgAc3ajPu2ig3PNcNWICYLpwrfE0Cl8mhmrGZbHfv9ZGlSo87lnRlKVSobl0
	Nv2FkAXT4BNRHALmIthnnkbWzZ3p1f2QXzzFZv3fogG07AfFqxXMKl0uQFctQodYe3fjAceIF7u
	a5/m27gN3nUT/hs5+LRck8Usic9tX8T8RoK+NmKPnIHFCx6taobroOUmX3sPfNuL3bcSqwBjJQ8
	qFe8/MfYCKUy0qPKGgRL/fDFEvc9DbbMrhpja9OwaPQTPsa9GUBP0UR6JrFgWx7BpRak0MQm59m
	v4PWcvG95UnW3r+BSgxFcAwoKP56shH1tM2fdRWIiHgo6rlkpb5igmI7dB2PdpVaGSRuSFQ5OY/
	RC/H7yV976jxLaXriQqR/DYJQvCNOER/Jh3Gn2coj4HbUwsN3yINZdA+6HY1cd0AVLS8AoIySbT
	MnmAXTFpmrTqxWMDqsOxO9c/NtSezogijpzV79Cakr+gtKIGAA==
X-Received: by 2002:a17:907:940f:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c49bda76b47mr526656866b.0.1793287783214;
        Thu, 29 Oct 2026 08:29:43 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 07/11] drm/tegra: Make panel parsing by tegra_output_probe() optional
Date: Thu, 29 Oct 2026 17:29:05 +0200
Message-ID: <20261029152909.234584-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

The tegra_output_probe() performs panel parsing unconditionally, even for
devices that do not require it (such as HDMI) or that handle panel parsing
on their own (like DSI). Make panel parsing configurable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 +-
 drivers/gpu/drm/tegra/dsi.c    |  2 +-
 drivers/gpu/drm/tegra/hdmi.c   |  2 +-
 drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++----------------
 drivers/gpu/drm/tegra/rgb.c    |  2 +-
 drivers/gpu/drm/tegra/sor.c    |  2 +-
 6 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index bc720ae8d95e1..e53fe68161cb8 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -156,7 +156,7 @@ static inline struct tegra_output *connector_to_output(struct drm_connector *c)
 }
 
 /* from output.c */
-int tegra_output_probe(struct tegra_output *output);
+int tegra_output_probe(struct tegra_output *output, bool get_panel);
 void tegra_output_remove(struct tegra_output *output);
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output);
 void tegra_output_exit(struct tegra_output *output);
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 7b595310e7379..a4c0c63bbe567 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
+	err = tegra_output_probe(&dsi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e9..c0845bb45bb15 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index d0ba3bd0aab8f..ff2e28a1e00b7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -94,7 +94,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int tegra_output_probe(struct tegra_output *output)
+int tegra_output_probe(struct tegra_output *output, bool get_panel)
 {
 	struct device_node *ddc, *panel;
 	const void *edid;
@@ -104,31 +104,33 @@ int tegra_output_probe(struct tegra_output *output)
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
-	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
-					  &output->panel, &output->bridge);
-	if (err && err != -ENODEV)
-		return err;
-
-	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
-	if (panel) {
-		/*
-		 * Don't mix nvidia,panel phandle with the graph in a
-		 * device-tree.
-		 */
-		WARN_ON(output->panel || output->bridge);
-
-		if (output->panel) {
-			drm_panel_put(output->panel);
-			output->panel = NULL;
-		}
-
-		output->panel = of_drm_find_panel(panel);
-		of_node_put(panel);
-
-		if (IS_ERR(output->panel)) {
-			err = PTR_ERR(output->panel);
-			output->panel = NULL;
+	if (get_panel) {
+		err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
+						  &output->panel, &output->bridge);
+		if (err && err != -ENODEV)
 			return err;
+
+		panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
+		if (panel) {
+			/*
+			 * Don't mix nvidia,panel phandle with the graph in a
+			 * device-tree.
+			 */
+			WARN_ON(output->panel || output->bridge);
+
+			if (output->panel) {
+				drm_panel_put(output->panel);
+				output->panel = NULL;
+			}
+
+			output->panel = of_drm_find_panel(panel);
+			of_node_put(panel);
+
+			if (IS_ERR(output->panel)) {
+				err = PTR_ERR(output->panel);
+				output->panel = NULL;
+				return err;
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index addcecf8592b1..01475995d9cc8 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -236,7 +236,7 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	rgb->output.of_node = np;
 	rgb->dc = dc;
 
-	err = tegra_output_probe(&rgb->output);
+	err = tegra_output_probe(&rgb->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e384cbd0cbf72..ab81e412e05f1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3806,7 +3806,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto put_aux;
 
-	err = tegra_output_probe(&sor->output);
+	err = tegra_output_probe(&sor->output, true);
 	if (err < 0) {
 		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
 		goto put_aux;
-- 
2.53.0

