Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F333D6F8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904689; cv=none; b=mA0OL0M8CUmWAq3J8YKbMVufVvvYygVI8AwFfhg27Pj/d8CYupacz68HEDrNkj8S4j3GwQaGfrWjEdfx+G5qLnlcmWgUfMD7zRicxdjLlRUPI6kgnc78RsMGg4lnDyXv+WntIugN0KjNjCQw8mk/pe2vTKPmP0V/RGpqM54zomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904689; c=relaxed/simple;
	bh=7DlZB5ohOTDO++JHQmyJzQds496TZQWC7PQGSX9QedY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goj1C/tkyQIUs8sm+CT1Th1wfLsjWmHf15r8O6vOB6jHu/6x04Mb3aLbR/8AHxOUZy+E9hVXSxP1IQi2qLQ6Z9e1TfHrXAPO4KeN+FfVcM9LmtRmrGtzHvbsu/4eOVs8EFIFQXieM/9vIi6unqM2A3DixDHlPVu856Y41rngAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lqu4As53; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lqu4As53"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-88aea027391so1496538b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904688; x=1792509488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz/KT7FZQnrnf1XyyeQ/9bz8jLknhmPBerRCaK0Q4Go=;
        b=Lqu4As533xtTXG1S0StY3Xmfst4JOGSsHBnuGi1dBmsDogMp3e2wOy71DwopTnVb5A
         xPZZjfceBMx4CaB+73lGmUwWFQnlYM8vpGpesWQwXxkU+Ar06LrRqqP7ZnzRr0dOJZZ9
         aGxjqugupBARKpTzhx15noVfw6YR+/ZTBx6uru4vCi7ttMUVBxP7kndQjPcxbaUZJYd6
         RyqmkuDOre6DWiRHIFe3tkOAs0ZOusfVlX61JFrz7O2LOD/vFf70RNNOTSIy9Ym8+/fR
         RMYqbPe4ilWNHPYMyUpl6mFoV8o4Bjnl/YGAOz/JsGM8uCADAFEQXbsu6RsTAgR8SH+k
         x51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904688; x=1792509488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fz/KT7FZQnrnf1XyyeQ/9bz8jLknhmPBerRCaK0Q4Go=;
        b=cU9pbserc7/vY33AotVFHGdwwYBvC8DK+4xH3WVvyytHK5zWsNbj858Y0V1lxs2M9m
         Pl9T3XYpOimE+DFsRk3o6JifQq1xqM8kECB9Jrw77jETo9a8Hlcou5Oh3S3C5lzHM+kA
         g0CFDGuihK5m220jBYO9ygW+cs3SGXhz9g3BFN2FoN+K2SemhJojMouxnLVX+yMQXapn
         vGWabOK+gEYZOSyDtiSdaSNACutpkQDSGQOmucjaXvvxlQbmdIYgMjMcI4R9hrEgQQ7g
         VpW0MUSbGftkAjFZoVSlN0UN/fOxdXTKiQuNxqgEFS6p36EM2BurH+hN/W0qLntW3drI
         zCDw==
X-Forwarded-Encrypted: i=1; AKwUvBxyjratvKmAUG/A7Y+V/0JhTxU6K4ybF0H/OsPxiEdS8Ru17+Ak2ChVFrmX1NIIX3JJUVg9Kunx0t60b0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoACv26FQ9whpKlruzZWubflYfgaGIXmovhNY8pCGmKe49Of5f
	3oywKKJXNiv4VLVgpdf2ylNisVB6zhQOde3+Qsc6uYBcg9lIpmkIfij9
X-Gm-Gg: AYBFou0Aq3VA6RpdpKkVLUJRFwfNsOZVivilop0W9CZBTmaZc33e6jglwHkootxYb1p
	hLYNn+0Nlo+33MSxkC5V1X3BSFum8oz5yQ6upMcdvxhl79M/w6b2sQM+ShnirHsiZ0vgNBUKjYJ
	1ihZTQiXPhlfnYzGcvMEGXzTrkTwbNHVZejo6+qwldnS5H4QgSSmGkuG24hRiDlE/mnxyvp0q4w
	L7bEk6akzAigEx9puvoMV4oH5IvlbaEa05obXBaobYWejRy4Vdg7knLpE+YN8kNr6vlEwjsRGGQ
	1/rMFNbyVt0QKuSF960kYGo50c6U3SuazugZc/npJGuTd5Vd4gEJAhXCPszO0QkMDpIscY2/Sia
	WemC/l3YURD62Aq43p7pz72aDfjB4CmkEy+th5dnzEuF7Ru/esBlNGEXEOjg1D+u24Eh5J5jBnZ
	MifRKlPoKFiPpk9VtgY5LC+16KDxlkpQILOoT5cWtsjHVqD5j3pEitXysuOBc8yw83IorZ2mvaq
	vNPERjGo+njkJPMxh7V5+2/f9aL
X-Received: by 2002:a05:6a21:4eac:b0:3dd:a195:fa21 with SMTP id adf61e73a8af0-3e16bf54ae3mr10356368637.70.1791904687938;
        Tue, 13 Oct 2026 08:18:07 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:07 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 02/35] clk: mediatek: mt6795: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:01 +0900
Message-ID: <20261013151734.3177690-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
do not call platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..239a3f5e1760 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..914bb069aa85 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..27d0ef7d7b2f 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,8 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_composites:
-- 
2.56.0

