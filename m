Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B74B1CEA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596179; cv=none; b=cqwobxLTQ19JYz7X97iV5Fo/RqjItIYunZd0+P/DY5UMM1Xq3ZDE/9h6H1pyloGf4dSuhOk41aSaCdzvl3g256Ip1C+szxrFW1SaaPWDwp8wzXLq4imM+Qsi/2C24AkuoMd42Fv4Z4/ALFi9XoOliaX3Mrv/GCDx2Jb5aOiSEeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596179; c=relaxed/simple;
	bh=DjLEchYsDOqH55Z0sk0KBbRyMovCDiMUnxrxxOXmDsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/iB0BOhIa6FN+lREIuctFe5ShVxr8IkQW1EicUGStxmiuIqoU1Lbq93uGrQiHl/HY17CRZEV0RRvNZDGMLRfgwMjvT3koT213HshPfnyobxwyMXHM30UkrJldNeq67ZPLlw4gydHvc+FLibcbwXn76U+KjeknTkv6KFqhSmOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ci0PtDAK; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ci0PtDAK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=AwD7nQjErP3LWr6uP3/yJCwtkwFmKfbcT+QWtyJFvS8=; b=ci0PtDAKbxMYq3PkJsksHE2ZIE
	CcQMGPiPTPBwhWdjVk/5nxd9dmHBljGq9ZFRWx5vJc/a2fgkaJaKKvkvNFHoBtTMTzQdSctW37+NF
	FL6vOQZHo428owp9CzEDv+5JfTEBLz4G7vQIMjON7oR+YC6b7hoA+nc/44wzyfg1i23IqDAkoMejT
	gE4as64C9+DUPTGBByYwgmDBqF6RWIcHKHrl5An1kmQDIv9RUt40vV+e3gjz6D2ug0FgrkO4T2dYP
	P+1FbAGNERmU7J5aOlGQEGDgGxFClUBG8Tv8BIL11/qEexNPI/Igj0kFi9mtpI6CjYRYnlKeiO6Le
	X315VRqw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9rQ-000Myi-1K;
	Mon, 28 Sep 2026 13:49:33 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9rO-000Kfq-2n;
	Mon, 28 Sep 2026 13:49:31 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/1] drm/bridge: fsl-ldb: Add dev_err_probe for some error paths
Date: Mon, 28 Sep 2026 13:49:18 +0200
Message-ID: <20260928114919.326797-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)

There are code paths which can return -EPROBE_DEFER during probe. Add
missing error message for deferred probes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 26cc72948f316..d763241b077aa 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -315,11 +315,13 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
-		return PTR_ERR(fsl_ldb->clk);
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->clk),
+				     "Could not get ldb clock\n");
 
 	fsl_ldb->regmap = syscon_node_to_regmap(dev->of_node->parent);
 	if (IS_ERR(fsl_ldb->regmap))
-		return PTR_ERR(fsl_ldb->regmap);
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->regmap),
+				     "Could not get syscon regmap\n");
 
 	/* Locate the remote ports and the panel node */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
@@ -342,7 +344,8 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	panel = of_drm_find_panel(panel_node);
 	of_node_put(panel_node);
 	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+		return dev_err_probe(dev, PTR_ERR(panel),
+				     "Could not get panel\n");
 
 	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
 		fsl_ldb->use_termination_resistor = true;
-- 
2.55.0

