Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52D46AF3C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766560; cv=none; b=jz716E+9GB4qjHVQMmzJx+xcN10rHszV00kdqsXXRscUkfose62k4JHle3wkuKsme4SuhfzaArwqeudb/60CwcE3bL/BKIx94VzulFntxklWZDJP3F+ov/a7W9X5MgqFFl6Qv4xhjeVswAI/T65gclNVcMBh5KuE0EY59pMWov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766560; c=relaxed/simple;
	bh=F0V9lHgfoJh7e+vZQzbKDIFn8yOAolI4DkEX6HNIgEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adnr4Hi0AmD3HRuW57nD+kzFIPqGK9KVrndCrIqeknRFEZuzQVR0Gnh9+TUHil24aZQHXQmCo0Mw+P6cYnDYrFmf1+3qJPPHs5pqGzG7bcFZeks1GJfOF3jVoQ3nuHa5nSU0Z8Y7IXmQlWJ2gBYAlWVFPEjDSs9/sLRyGDecyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwsjM/ER; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwsjM/ER"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1712a04ddaso191933866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766542; x=1788371342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wefi0qFeMhOmINeqEFWhtcGoedNIJiFtYqNbodY4QM=;
        b=pwsjM/ERyRVBJHJpQr1rqR4unRSthMU6wC/lDtD+Po0PrpF1uZT4U0fE7x5SvCUQ42
         iqA7dKYFC9moPYNKJj9VZcRxABIPPHTmMMNbA5qxbhILjOLBP+n7aHn76VuJ80uFNlHf
         K3xUYF0Pj2uVUiKlSOAVvKAHkXTQTMRMKycSh0WPUi+QEuz1K7c2dpVQGSP2pHmXWYOg
         P++32UXfGqPwE+7GdNeCGd6ToYaB9FS5yjJjXOL2FuSqHvIzjL67vTkZbgZntgUufN2o
         wNkQevZoSbi0vDSnSo632G6XoU6Q8q50WGYyZVXAiCdW2CoH6+EciOOJCDYNxh7Mo+fz
         mtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766542; x=1788371342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wefi0qFeMhOmINeqEFWhtcGoedNIJiFtYqNbodY4QM=;
        b=oRK1+3CL0gkzobVhCsBBVRIPSnOZ1Okem/E9/YU0rL513aLMVdsDIPEl+5qO6dhLkJ
         q6JnmVAnHO4a+ohsW+09tqOlrop8nhtfxgssiRy+WfXDUZhPZpK5s3ky+qPlzMgaBKne
         LIGcfSKRC9bgBMz8JaXVuGfSgU40oyPGts87AcWSaUBj66CA6P39h0sMK9TF4SbhQ+uT
         e5HXzBIpAzX6o65LDKg8apRmJgl4jiWSkcsUE/D9dqtY/x6JmWMD/3TC1k9nTtvj8D+r
         +CXzx/oiWxiHO0usAqdh7b5aIjbsxDFk2eODwqS892crXdkgw/JY1l/rifQZB/la63Os
         ncsA==
X-Forwarded-Encrypted: i=1; AHgh+Rrl0SPpzcLvMi+0AH7unFKYZobkJsOTzsQlRQhdNi/uB7cbNjQMPly9iFU9oRNIBd/GyyJIhjt5uCtyzBU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfPiy7UwwEUle9xCV/jiYDpNhZ9gU/D1weX5co+SauwEaSIVNO
	9amE7mxOOB1nWkKI/y+0SHNi7lz6iXdPdJxleeiH/IKECoGEQNMWSqTB
X-Gm-Gg: AR+sD12YfyalUZcdvlCoU7rfU+XQdATbm2Osjkaxo1BDQ13wnDiUQdjAEI1hD5Nj7jo
	mHdZz6JfNYdrXq2Ge5Rv3wqnbK8IbeExmMfariDQdBXySA8fckwjeBO0wt/m8Iy8QESryxCJmD0
	af8i+NJX/wohaf4j7Lis+/ZBZzJwZjulKmq9RIFFnECO/HAZLKTY+d394GzIcDOi5UPDTLMldoG
	Bcld6HnD+NEPf7iphgwg/cjMuTYDeqtgLwpQpj/ByVZxGg8TS4wSjDxA6t4oYQlXwnbdFE3hvHW
	mAVS81tmiEdJnKp7ASrFGhXl+C+bbAWK6Rh/xugJA7rb/JdTpCp6tYUkAvQe4pQ3EEa9kv+1iUw
	TDIZ7YbFZI4R56rE7bCoseYv1tOxYHHt+hOvwZZItjGJsyPr0+aSr4FkXfdDAkZEhfibqGkOStx
	jydjqNeL8mZLk/ltvicgeXgIr11+AqxEDOdlPXJ2ix5+gF5e8F8IW1wbD7+BIUX4ZvQvJLHeZLD
	t37RPKHXf64BO1bw+kMpP7e
X-Received: by 2002:a17:907:1c86:b0:c20:edda:ef5b with SMTP id a640c23a62f3a-c250c595d62mr954414166b.14.1787766541633;
        Wed, 26 Aug 2026 10:49:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 04/13] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Wed, 26 Aug 2026 18:48:38 +0100
Message-ID: <20260826174854.199139-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The register for controlling power to the DSI region is in the SYSC
(System Controller) block. Add support for controlling the DSI PWRRDY
signal so the driver can efficiently manage power to the DSI region.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated powerseq API names.
v1->v2:
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index d67e1230b70c..7df5f4a4161b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/units.h>
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	unsigned long max_dclk;
 	u16 activation_dly;
 	u8 features;
+	bool pwrrdy;
 };
 
 struct rzv2h_dsi_mode_calc {
@@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
 	struct clk *vclk;
 	struct clk *lpclk;
 
+	struct pwrseq_desc *pwrseq;
+
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
@@ -1396,6 +1400,36 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
  * Probe & Remove
  */
 
+static void rzg2l_mipi_dsi_pwrrdy_off(void *data)
+{
+	pwrseq_disable(data);
+}
+
+static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
+{
+	int ret;
+
+	if (!dsi->info->pwrrdy)
+		return 0;
+
+	dsi->pwrseq = devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
+	if (IS_ERR(dsi->pwrseq)) {
+		/*
+		 * This platform requires a sequencer. If we can't get it, we
+		 * must return the error (including -EPROBE_DEFER to wait for
+		 * the provider to appear)
+		 */
+		return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
+				     "Failed to get required power sequencer\n");
+	}
+
+	ret = pwrseq_enable(dsi->pwrseq);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dsi->dev, rzg2l_mipi_dsi_pwrrdy_off, dsi->pwrseq);
+}
+
 static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 {
 	unsigned int num_data_lanes;
@@ -1454,6 +1488,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
+	if (ret)
+		return ret;
+
 	pm_runtime_enable(dsi->dev);
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
-- 
2.43.0

