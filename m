Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841850;
	b=o233L2X4w7+YIAuq2jrJFkbfx3lCZCyWGiLD44qGfegU3yan+b7hobasdpOou+tBXHrC
	 KEsVdtjeIuWttIgLzn2uW7XxV8lgj3WtU5eCeao6dJN3xd4ZokKn6FIIHcobwwbTLzcs8
	 66jpq1CxsWWrYNX5T92d0ADGklHwj1R++aNLJuLBdb6iRxG7uJPt0f/56jx1u5yaKT9eN
	 n5iXuJsoGvXPJ9iN9Or9uiZ0bCQfWWfSttP64d9R4Nn1EKZiyhR3bOMl8Jh0ov4hQopTM
	 vvX83k12w/eGREHHKi8xH3s10PZQtkYNp89zruAj/DAj25je0y1SRw6mKBgCjqaT+ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
	b=wwLEyMBwxlP9ncgyj5739ZYdfGH8y/0exDdFQC9dfQqsUzwtvPYaA7zg1lMv4EVNbCTY
	 Zd4kmFjye8W5ujT7SWjO3ttl7ucT+kiuNMTSXj2oDNpGDssa+OtRrveoKMAf7R13IClPp
	 IhXbOBzxwXgPIzxCLL39tVeXp9IKT0rrbp3eLQDgxKLmv3T8cs9xVn17pZybEVHUNqya0
	 oFsXBg8gCPKZICCJwx6CE+JxuNj6IJ/jLUthzC09AYfteZUNezXvo68lwayngpPNTZZlD
	 PVspw0/Mq928r4EyOrz90oA9kAJ1nod4Kxov/BMUJzlT4zgkIfm5ONlIohq/wugAj5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVM31Gx7;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA880606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA880606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVM31Gx7
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d581da0aaso429279166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841848; x=1795446648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
        b=EVM31Gx7XdA4stDLyEnTdBr9rl9V0DCrxLDR4Mah0UPB+6uyJGLVJ+QtpZspaQEaht
         ivNcnaHMqGxhmTWZ4yMyDDzO8y2RyK4YTWG5p2PeJgz+udUAQ+fySvLPPsza2VkYWgyA
         Ee8YWpR2ilnscqLaU/gDZKfUoYCLlvi5fVnjQIMdP5ywzu6CUefIZxVQNqafZUQmEDZx
         3TUvBKn4PJ1+ywdjjGsSkj4btwBOEEpS3cYbGhJ1Q/CnAys6DXJF6XtxaU0rIIabJwgm
         KN92XSvnzMYLkHZctAKhBHpSw6o1nrykbms8u+k8CmSi6ZlzUsZXRrYwvwrRqvyNG3bl
         nl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841848; x=1795446648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
        b=QC9TfgM20zqy0vtSVvpy7+DyWXY8Bo+tZAwL/27AZ6iBR+zJ4WtKJ9LNJI2/+Q5TRW
         9EQWWXYXvcTwzVzf/2Ebs7uUN2qv4rLDOFKHIv2JiHdbdaQQ6ImYuI+slN2/ewZnjCQU
         HB8iu2pf8BqgiudK49cRIIadW14nZ7cL0Y+4TZo15qsGs7cqcNNrmpPKMXA6rvLkss4r
         O/StH5Tpc17D2rlikc3DwhGTptjYEU/cwII+TdT28XYot0M6rbbV7gsV5DCNTc14HV4n
         zKJZiJA6DK93S3meSvz5CGPvCbQvmvQBVDAKI9rK0kvAoGgBzBAj+TNqbnmm9D2z3Bsz
         pOhA==
X-Forwarded-Encrypted: i=1; AL+hErFPZUP1I98WDo+wvz942IEprIvx/B+cTkGuhgvlS/VkEBX7PVW1SsHnVOqy7TW1Vov0GXhi0yNhDfs6N5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t+n7Nns0D6NLb8AddgYuWk2c+AdR/iiIYZVS0qIayNNlT4ITR
	fiTkPgBiBWV3X5HcBsNgq+GmV5fRqYG8KATtcH43XCD4Fc9itZvqHxQb
X-Gm-Gg: AYBFou0VxvmNIl/Bvs3BahKdPzsFpdU1v1TtPYYQrXBh1Tas+3TYz5Y0Ii9mcgiB70h
	WypEYaBccd+ZztDnWMjfPjLrZxKQfSzuy6VRFPXk836MJRia/YDGSKBK/PcyB9I9+MLnx2FJc7X
	ZMY1HihzDCkX1y5AZ/j7D5/yHfs1TkbJZKQJ+DgXIEyS/hcoI/flu13KUI0/4ZrDyucHkZHhUiI
	Ix3kwpwTJ96eCGYNPCak1zKgO2TEvFxecL9vngSMQ+VLMpuVpYz1UD7VnnFfyZiIW7hofdR29AM
	Zbbfaf6KKSF2YOkdOzcEzklYOJ3k3wZZG8ETKmRnfPsMo6Y6vGbdCu0I/NxLq4hu33+hECDlo1x
	wPpsYvw17Ak5pCytRj6BiqvDimLLkJn2ZHFMcOI6BgTpGfsO8Uym7PbloVRt8U3evSR4NI4puU1
	/TnAM65NnQGD920MQf3jMJFP3CxhPFLfbiWcoHXOgp1fzZcCIXd6jSKmlGNgv3I5TQNXz1cFWzs
	I5QFVyL8gpa/ypWmtbKqI+cl1GyRxF1j2WxD7waRQF+7XMWnYbuBjnXrwNLFNeeCw2Tqzwini4O
	0TBi2pJbfSnCK4q+vwaIIGUg5Eta+mpKx0eHJgtGT6jp+rr2XzW04cazB/BNApiwAFDbLuBy1nr
	we3PgyfS75g==
X-Received: by 2002:a17:907:7b8e:b0:c40:91fb:b76 with SMTP id a640c23a62f3a-c50963b63bbmr921786166b.33.1794841848303;
        Mon, 16 Nov 2026 07:10:48 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:47 -0800 (PST)
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
Subject: [PATCH v7 08/12] drm/tegra: output: Make panel parsing configurable
Date: Mon, 16 Nov 2026 17:10:13 +0200
Message-ID: <20261116151017.274764-9-clamor95@gmail.com>
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

The tegra_output_probe() function performs panel parsing unconditionally,
even for devices that do not require it or that handle panel parsing on
their own (like DSI).

This causes devices with dual DSI panels to fail, because they rely on the
OF graph to find the secondary DSI controller, whereas
tegra_output_probe() treats this port as a direct connection to the panel.
An example of such a device is the Xiaomi Mi Pad. Make panel parsing
configurable.

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
index b5806a53e75ac..6d6adc485e51e 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1617,7 +1617,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
+	err = tegra_output_probe(&dsi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 3a94968bd983a..e8c4347f09e69 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index eebf0ec0eea0a..d7d7f6ce0a8c3 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -93,7 +93,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int tegra_output_probe(struct tegra_output *output)
+int tegra_output_probe(struct tegra_output *output, bool get_panel)
 {
 	struct device_node *ddc, *panel;
 	const void *edid;
@@ -103,31 +103,33 @@ int tegra_output_probe(struct tegra_output *output)
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
index 40a02cf5939aa..227a178f761bd 100644
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
index 061c5dbb738be..ebac9068b670f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3803,7 +3803,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto put_aux;
 
-	err = tegra_output_probe(&sor->output);
+	err = tegra_output_probe(&sor->output, true);
 	if (err < 0) {
 		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
 		goto put_aux;
-- 
2.53.0

