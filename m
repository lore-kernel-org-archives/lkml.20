Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143E4CDDF2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847653; cv=none; b=ex2VFI08zV1RIEwPTCaxgVAyPMxfUm2wbwMzY5lo0nrlbGMLkgTnQnR3cN0qWzTmVwsep37GnX73V6d00OwN3j8W23uK3JFX298apa69syJrjo8h6hGQc+Iaxz5VuFVZA7Big5UOPnRlc/3Re0ksQzRFVzC7SSqKp5rKcqIvcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847653; c=relaxed/simple;
	bh=05CUp7KZASv7VAw7dKfffS4b0cRggUpo4aAtE3WB0w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SI6Gp3jimjUs9AablpVtu3CU5gRYBpRF8f+5X57SKL/Jogn5DGfDVjbKi54avzluI5fMgSEUBO6OBjyQLQ0ry2nzCnBTcsi9yACSejnYz08hSm36kxyn1B2dMEVrMEmxYJ4LHhs1tkBw68xyUYsRFuM2o5b6Qk7iqU0zoGU1EX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8cvfGOK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8cvfGOK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so3496925e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847648; x=1791452448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHkWO7aBhfER+SNZ+kSaAkHEYBGMw8cJJ5ZRGj4410k=;
        b=Z8cvfGOKd2HFM73na7rT7oeEBfIsVoIEpL4D7YbWNUH9RZiLvi0YDNCbBgPtZ1/UK2
         REH/zaXNNBfiza4oV+9oO0M6Sev5nzH3cqxWD62F2bEGgfbbCF8tKIlp0vn8311Zy5OO
         4qfjy8RhAI6mtGjDfWQpuK6fKKh08b9eJG20s7dKWdbY5rTSFHmUT+vWsxWS5zqPz7t0
         m1PTDwmvI1Z5LsZ5UMVmXPyjnLcY6zDi/vHcfwxNHONLzSesrMmXcQIkNW5BnNuYiON0
         qZvcGcpFqBd8HaBECw8+6P1MeZqafNG3fSHxg1lBoi65evX2Hdz7zHlB4QiWB+aqNIeJ
         7zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847648; x=1791452448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHkWO7aBhfER+SNZ+kSaAkHEYBGMw8cJJ5ZRGj4410k=;
        b=Di7A9mbFA3dGb/HOyiwa3pes/mz8F/1rgTLvycj1NSFZMeFCFOXV2qmUL+vaZvih1x
         bLRU7jGZoRMzmrapXGHwt/1QlWXjSnCgelYbIrkqAW7wNEiPZBdm7gvWl4fm0QgjqCfh
         K1GVUDsMFcK++cOZB/lCE9DuhcBLcA5epuck938fyxeJD3WfrYYJDqmuWOySr+w75MjN
         e24tiuCiB7JIWw30ndVS92Mg7AcJpcmYad8Fzz2szvoBvAqt08b28SWbhs9eYED/D9q6
         ydJYDa2W4X/h0ZkBk0PR+XuC7YQPFUbi5JN7KiehvaEHCDPpp4EEb/kkXwhU/+Drt/lj
         ZM4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx59C5FubVsemqtG3ggIZk2iV0xYzFZ++digk/ZpMsKS5YxuOqPMZMDFIMlhlKHRpyA3ZJU+hzOu/XqFlI=@vger.kernel.org
X-Gm-Message-State: AFuF++lNNzy/izJHJCccpIG7YhfDoQekMN14lxDLW0IiHYl/fpgnwd7h
	iA8l4L9xvVtiqBlri1bVuTBbrlOLLfOr4u8rDkC2dTfwQolMys6UI65/
X-Gm-Gg: AYBFou0G1DRiaWgeS6LBuwIOjxib09CmpBmOe1fmIQHw9lvefOwlfJC4N/BTSxkS92B
	6JvYm2546vsL39Sm1WdNZIYskeV8Q8aJ8YxV/rqNXi0H2ZarBkmp1TWAluW65/2cSUM800NiurU
	m8MC4yB25AogWAs3ndigy9w1LSV3USVIN6aI6StE1mjUS3wpXKD97JR4M9UWev3jPQCM5sCJilt
	e/99KZQtgyl+d19SqveUcON26UbEKoOnGUJ7r0zROXKXaajInwfJ3m+FTy86iCl9ZLjLAuLrYX9
	IKPs6oteNcYGjkUoTQhAZzFeSdAgssiCJR3F24CwFsiXZP1FcnZ8Bo7GJrzTgA6VCCMrE/M63rB
	mdhV+T0z2j2J5f8jd2HGRAsU8OQrkte6wzgf0P6ir4QBE4zC8qRxeyJHgCmTv0psnLmikv/eNY4
	Y2yLxjYLrGG8bkM9YHuvdjbyl5nybJoki1W6mW/AbRTXiGrmq1OMl+5SaroZ/uapEDQwJYqQ82D
	ZIE
X-Received: by 2002:a05:600c:1c28:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a01afec062mr78985955e9.12.1790847648194;
        Thu, 01 Oct 2026 02:40:48 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
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
Subject: [PATCH v5 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Thu,  1 Oct 2026 10:40:19 +0100
Message-ID: <20261001094041.135697-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
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

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Collected tag.
v3->v4:
 * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and instead
   using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
 * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
   devm_pwrseq_get(). 
v2->v3:
 * Updated powerseq API names.
v1->v2:
 * Switched to power sequence for handling pwrrdy signal.
 * Dropped header file regmap.h and mfd/syscon.h
 * Added header file pwrseq/consumer.h
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index d67e1230b70c..5263b2b8f1ca 100644
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
@@ -38,6 +39,7 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_PWRRDY	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
 	struct clk *vclk;
 	struct clk *lpclk;
 
+	struct pwrseq_desc *pwrseq;
+
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
@@ -1396,6 +1400,25 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
  * Probe & Remove
  */
 
+static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
+{
+	if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_PWRRDY))
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
+	return pwrseq_enable(dsi->pwrseq);
+}
+
 static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 {
 	unsigned int num_data_lanes;
@@ -1454,6 +1477,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
+	if (ret)
+		return ret;
+
 	pm_runtime_enable(dsi->dev);
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
-- 
2.43.0

