Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64037E5C9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755094; cv=none; b=ab0SkPvo+99WZcp1xyi8yW4fkQ/8rGsWDhrRgefJDPiOsPTCkQeLYGOKKslJDOfojzryO/w7cG8CCqahtwS5JzjDAIc4yPy3PIyMZfLK4KiZPg/U1XzZijNCtN40p62CVB5SWhFxXdD26HVSo/+6FXBuL8hXiri5KQv4GY0Hvh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755094; c=relaxed/simple;
	bh=nGW8HEyQNRFx5Jts5KN+whE3Only3xOK9HiWcXxqxFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ze70he3AyKqEC6Lwjv4tBRz6qsDt3nVpd4vHKEFxc+i6m36WdjyqXP+3rx1EIEzSWAl9LB0LH+ZtActuqgP857X9CIicQLIjzfBEBPOSAwj0g8Gr8gL5stIT1IBK+sH/HjFzSW9AHld33we7CZ3VK5MWLTazQ0fOwD1Y5tP4AnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dj/1kwSZ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dj/1kwSZ"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5339199d8c3so14437121cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791755092; x=1792359892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCERBiOuWhVjqN4P+s7CfX7jNoo06JkyXxoF6Ee2bns=;
        b=dj/1kwSZcuMyHm99ZJZb6Gik7txUFk5Yes7z1zrn00t940wqhSBG9S9tIowqhwv9OA
         My2Nbgi3o00AIvCx8p084FdXQ73zi+FBYEoN6iPdOG+TIXRhM8jovLaTvHKjtoQDV+E0
         fGP4Nkm80cdzfhgP9bAduO4wveq2arvQnvabuOn3qygSj+ontiQuC0KIyjnyXKt9PP5y
         EYPa/SK46OvlhlLNy8+cDleQwNc0vLVG8pLhQZRKqjIFmL8CLHy7s2IrJNj57UKZX2i2
         wYG/LkhUzC/8xeUIsUbO6jAHD+O5EbRyzxC707e74/7Y9N7z2k0kfiEZWp6yJ8pwC7tk
         HzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755092; x=1792359892;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCERBiOuWhVjqN4P+s7CfX7jNoo06JkyXxoF6Ee2bns=;
        b=VR19FZwpABbimUahphaHHkNZPA1uyT0+JyaWkMag4esTb2y+LOAaSanLYKMYE1JGKG
         K9QGmdyvr5mVoDJFWt9tTkHpUeS4DfjNlCWQL4gmbETDhSXds/bY2DhHpGRZlV4s43qs
         J5KbHRWxJ3CdlbL/MLz5WzWTXDde5JNfe/0A2wy1IU+cj6BCeV2f2eGdmSBM+awsddsX
         IbJRufrPUSWh+2mC7ieOq9npZ6fV7x2inYz5fTj8AJb5cpwf1ZOlvcYsHr1cQ8YZO/xA
         lovqGeyQtyAc/qboVOkwJcz8SXANoa83QfIVZcfPPhn+gb2o2maiPBlfwjmzJSWlC/KD
         X98g==
X-Forwarded-Encrypted: i=1; AKwUvBxs52pfBjswueJFu/gcPIJfBm74aaQGR7Ey9gopCQKuv6rDImTxy0UOaqPUOnrcknmPxCg3gFdUleaKGYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9PfK8VCYlniMpn/d3glXgoIOyECI//yCZtx86wRthwZcWUS6j
	ZWXiFKSzAsMLsU8e/LLR70uKXZ8dqMjHB1brNKSVZ6IH//m9eemon1M=
X-Gm-Gg: AYBFou2DxDt+6slAyKC+kNVsboGQd9I6F3fJLUHNM2ig1OnAglqZrpi+DyzVZ+1UgP/
	8BhS1YEEWEzJPXIAZClPJ6LbQR5PR+N9F0EaICul+qBPxWNCRlSVfTS9mfVtUHqqX8Fdr1/raYM
	BN3A1Yt1wFjBzK/HXlhZMEb5Ot/QQF7E9SHE+NSjNZuV6gjt/68x+BtLB6bcXOAMZf/d2ScOTF4
	7EER1gToA06IB0YY/SgkmdVu3OGGFqHH4FnTM5T/oyQwqb8Wteb4r59n2xmd4K8D4hq+dbAnFxE
	VVXcnzfZBZZwUegEvjSt2gJX811Zj8eCc5rtM/CLkz1pDBAF/scCn+IZJtANCXpddeznT6mpIqe
	P9hLiKuAo998kMArC6IXb+0VfMfR/OmZOw8SeP2coPvRfYaU9+9xa+giPGqlWDVz+zZj5nMu0IZ
	mqPElqLg68toQ5RbRreJM877wE3RZKG/rZZGPujn53gbSGstmJsXcZzOkh/X5TDsgovF1Rzwfkj
	VO8Xm7wm9lnjmspsAEa8fVYYAdDpaRF1faF1tpgoOvXMMmRKQ4BRbNiHr+AduPyoHVFLOVO5xE5
	DeKQZWni4fidLn0CyHOqg7PXtgjd
X-Received: by 2002:a05:622a:4d88:b0:535:a5fb:6447 with SMTP id d75a77b69052e-535a5fb692bmr127458581cf.65.1791755091758;
        Sun, 11 Oct 2026 14:44:51 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm65811501cf.30.2026.10.11.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:44:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: rcar-isp: release the core interrupt before destroying RPPX1
Date: Sun, 11 Oct 2026 17:44:48 -0400
Message-ID: <20261011214448.2043581-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

risp_core_irq() accesses the RPPX1 object before taking core->lock. The
interrupt is device managed, whereas risp_core_remove() explicitly
destroys RPPX1 before device-managed cleanup runs. Stopping the video
queues does not join an interrupt handler that has already started.

Release the core interrupt after stopping the I/O nodes and before
unregistering the V4L2 device or destroying RPPX1. Request it only after
RPPX1, the subdevice and the handler's locks have been initialized. This
also keeps the interrupt out of probe error paths that free RPPX1.

Only treat -ENODEV as an absent optional core when core->base is NULL.
Resource probe failures clear that pointer, whereas failures after resource
setup leave it set. An IRQ request returning -ENODEV must therefore fail
the parent probe after the core has unwound its resources, instead of
allowing removal to destroy RPPX1 and put the VSP-X device again.

This issue was found by static analysis.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c      | 13 +++++++++----
 drivers/media/platform/renesas/rcar-isp/csisp.c     |  2 ++
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa..6bf1dd650486 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -802,10 +802,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	if (ret < 0)
 		return -ENODEV;
 
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
+	core->irq = ret;
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
@@ -887,8 +884,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);
 
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_destroy_mutex;
+
 	return 0;
 
+err_destroy_mutex:
+	mutex_destroy(&core->io_lock);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
@@ -908,6 +912,7 @@ void risp_core_remove(struct rcar_isp_core *core)
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
+	devm_free_irq(core->dev, core->irq, core);
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 53ce47020d17..73bf7e42bad2 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -563,6 +563,8 @@ static int risp_probe(struct platform_device *pdev)
 		isp->subdev.internal_ops = &risp_cs_internal_ops;
 		break;
 	case -ENODEV:
+		if (isp->core.base)
+			goto error_subdev;
 		/* The device don't have an ISP core, that is OK. */
 		ret = 0;
 		break;
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b19..70432cf4a88c 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	Interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {
 
 	u32 rppaddr;
 	struct clk *clk;
+	int irq;
 
 	struct reset_control *rstc;
 	struct reset_control *csrstc;
