Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B32FE074
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791762679; cv=none; b=oUQvNe9mGhzp0Vbb3mZa+H1YMtXtSwPzpW4wRVjHPC2Q1WRXRaImNnODRFblaaK4kEehG8jwiqtxjzyF167k6lJE6xz+GXkIZRyOc7/k7RXExCfa6NfiUBXmNvf8pu5Y5UCjN5GiKLGwSM/bSh0AS3hI5llNUls1R+RH4q1lY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791762679; c=relaxed/simple;
	bh=gbRfKY04QzrUYnbEZ78hA/w3fNloRz7cA9iUjtj0j3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ej8T14SY0US5sIU30OfMKswKsHt0mCz7iNGSElIhWKKC/5H8UMTQpzMG8+eJis5gmhlr2iIWNDFEuy45wbcNjTl8oO9Z3K+SoqjqVmJ4e3NtH2HzvOk6L6CH3En6agon+AjaK1T8GvI30UHm+xWgoTm2V22sP3bMLrHY0a7NdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMLp9YXD; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMLp9YXD"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917b78dfe30so26624136d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791762677; x=1792367477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFWQQ8D+mzyXqdU1nMUjp91o5yLegbmx1fWvybGP2hM=;
        b=mMLp9YXDP2Qh59A4WZUGT+wLAWwTiDeNCsNVg8ueZTnSH0/eesUmHkZ69YwFL+5/OG
         1IjLqCmz5k+6CwP6On/2st6KPUatbyskzM2M0piEWGzG50pL+HuazAfZso+NBLHTvivD
         hdQt6MJCn+pTbIlwYNRs1Ghb2pjTHNnJdS+aTisSyHgyqYnn2uLe1H5IVr6NJOq+4oym
         kThZG4FohQG3CTRfoKNPIdGFQxGfRDX3D8FwRsr6882nt67f/RJvk9Ok4gHCapvcZQxd
         gye25EyVgLdjiqYXHovF+6CpoQSQc0GK7YiEctSDksPlTVBktBlMSY6IjesDW8p1poyV
         J+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791762677; x=1792367477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFWQQ8D+mzyXqdU1nMUjp91o5yLegbmx1fWvybGP2hM=;
        b=oY7il8HsNkJwsDVtBdJVzShbyi3tzDiiJkx+AqjSEBPYW3aK/OKZcksGQ+ZF5Huy2J
         5oN8vvraqCHk8K4q0YDh0pKYP+CRJuHDTRbm94rFUA/oZuwCHf64+EHTkIeNewmWMAWu
         Oapvw4IBj0cMoel9lwLe72A9WlZbbQ8nmVEYa0opZPKYACSH+AikPL4BVpYDIDBb+gvM
         2AQu+ecScp/rt9h7L74ER1x8ms+gjDEM4K/LmZfS2H+Lj3DbsPJm9kzLBMK0oEs2S1HX
         rVD9SJwpPzXMf2t1G6/5uVxUcAa9zWRsGLDFYXdvO+0KcHYVA4z2UqmvhhGR5T4uP4hM
         NmsQ==
X-Gm-Message-State: AFq9FYJn6H5KeZeFi/rgLfy58kwPyql9FGW7gxxNWhIKeiRHdSwsoS+1
	dHN87P6m/32/jFjn26inDgoP3jQK1DcuQ9SfnihTq0ChAns3laZ1gVc=
X-Gm-Gg: AYBFou2EChfqPwYgOz6YV/1jAnZSiZKEqYtSsQ5xVtp13C+kQnVD7Alhq1x11I3SHlN
	xNj903FOUjMh8HGSXfZYaoIGa1Kt/KuiLMCm5JpFye3iZC5OvwA5bjlzPnLxbdB2iIPHaaBWy7r
	XHuuw85bqB2C+v4cLOFbJ2rfu+HifdA54wXroShqqN/OpGwfqqFGWqIXc1pzeDZddSd5q6EmLET
	Gwk3sv+9QdH82jGm2yG6GMWgu4LrzkbKAUbqYdrKlUeVbuyc+KumSng4lCFynIOqnzdCc2lGjfE
	eBCxdam1u/LDnh6bCL3VYZHsyjCA5xujCPAplw3orK7VonjkLxVE/u1GBRaH5N49O2xheruDvre
	ufvtEutmUXgeX+jFcK5zCm/V+zUyl5IozjEXYvvdLo50laprhtKCiw2vwzKbyHl5Ov4WFTZXOgs
	r9E6NTktlB+UKUlzzdnoyCfjxY6LTK4grbCJZTkrxV5XCxX2b5tGKkqCG1fuhywzv1qknh0GQvZ
	s1QyUU+PhUtcLC6550f/wHg9IAw872CZ1pf3wN5Zyto/ggcfN8p75v1r0Hr/SWad25a3shYd6uy
	Sps0sxXgPtUrTHZtQshH2RY6XLVD
X-Received: by 2002:a05:6214:5685:b0:91b:8145:fd9d with SMTP id 6a1803df08f44-91b81460072mr31480826d6.16.1791762677380;
        Sun, 11 Oct 2026 16:51:17 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b6bcaa6c2sm51323196d6.22.2026.10.11.16.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:51:16 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] HSI: omap_ssi: Quiesce GDD before removing controller children
Date: Sun, 11 Oct 2026 19:51:14 -0400
Message-ID: <20261011235114.2205694-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GDD interrupt can schedule its tasklet after the remove path has
killed it. The tasklet also follows message client and port pointers,
so draining it only when the controller is removed is too late: the
outer remove path has already unregistered those children.

Disable the GDD IRQ before killing its tasklet and remove the child
ports only after that drain. Do this in the shared controller teardown
helper so failed child population follows the same order. Unregister
the clock notifier before removing the ports, and remove the controller
debugfs directory after the ports have removed their own directories.

The IRQ handler and tasklet balance a separate disable/enable pair; the
remove path's disable reference keeps the IRQ disabled even if the
last tasklet enables it.

This issue was found by static analysis.

Fixes: b209e047bc74 ("HSI: Introduce OMAP SSI driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/hsi/controllers/omap_ssi_core.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/hsi/controllers/omap_ssi_core.c b/drivers/hsi/controllers/omap_ssi_core.c
index 0f5a6f7522ad..4a9b1057a32f 100644
--- a/drivers/hsi/controllers/omap_ssi_core.c
+++ b/drivers/hsi/controllers/omap_ssi_core.c
@@ -432,13 +432,21 @@ static int ssi_hw_init(struct hsi_controller *ssi)
 	return 0;
 }
 
+static int ssi_remove_ports(struct device *dev, void *c);
+
 static void ssi_remove_controller(struct hsi_controller *ssi)
 {
 	struct omap_ssi_controller *omap_ssi = hsi_controller_drvdata(ssi);
 	int id = ssi->id;
+
+	disable_irq(omap_ssi->gdd_irq);
 	tasklet_kill(&omap_ssi->gdd_tasklet);
-	hsi_unregister_controller(ssi);
 	clk_notifier_unregister(omap_ssi->fck, &omap_ssi->fck_nb);
+	device_for_each_child(ssi->device.parent, NULL, ssi_remove_ports);
+#ifdef CONFIG_DEBUG_FS
+	ssi_debug_remove_ctrl(ssi);
+#endif
+	hsi_unregister_controller(ssi);
 	ida_free(&platform_omap_ssi_ida, id);
 }
 
@@ -531,10 +539,6 @@ static int ssi_probe(struct platform_device *pd)
 		ssi->id, num_ports);
 	return err;
 out3:
-	device_for_each_child(&pd->dev, NULL, ssi_remove_ports);
-#ifdef CONFIG_DEBUG_FS
-	ssi_debug_remove_ctrl(ssi);
-#endif
 out2:
 	ssi_remove_controller(ssi);
 	pm_runtime_disable(&pd->dev);
@@ -548,12 +552,6 @@ static void ssi_remove(struct platform_device *pd)
 {
 	struct hsi_controller *ssi = platform_get_drvdata(pd);
 
-	/* cleanup of of_platform_populate() call */
-	device_for_each_child(&pd->dev, NULL, ssi_remove_ports);
-
-#ifdef CONFIG_DEBUG_FS
-	ssi_debug_remove_ctrl(ssi);
-#endif
 	ssi_remove_controller(ssi);
 	platform_set_drvdata(pd, NULL);
 
