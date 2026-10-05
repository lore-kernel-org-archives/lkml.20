Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054E54707A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791159108; cv=none; b=nMWcBYU6LGYsv8zxRAeQer0+Fc1nSAyjgyz8umnbriWBbnAfHqIz+PGT3/NE73Bke6YOGZzm/hky/+pc7zxAgXtwxUb11fvOIxGHBsyjlK0rqREx3y9zC/70tzVuX3HqAISeJByeh8TptieDwkAq51enEdxRs5DoLOkd07d2cDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791159108; c=relaxed/simple;
	bh=296SdEqVR+pPMlsK/a0UhLFwbJBWB82EbfeBWYgP+e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxJ5HPO+7sEOOJwz1qD3nterfE33bMvb4dQR4nCf4y6efpo86LXHrnRtkCbHnAN4Hsx3rncgZAqh7Tf6/83zGH0cZyiz0vF1w5t7NzAc9sC546ZALs7d/ZFWWjvRos+dNC5deuPIpQV3Lf6XY2Hr+xACThXSaHzOMq1yQ13j9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB4fhWe3; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB4fhWe3"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510b42f4e3so1186257eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791159106; x=1791763906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFk7ga35z3NrHS6umKXq0xUG3dzK46r7JSMoXY1ndGw=;
        b=kB4fhWe3L92jaSWIfsZjF5T1rpLcyzIHHJ0ZAJC3lBVd+pHqhxdAHf1ogAxNZEdAPc
         VaWWQj064PwGUvNMH2QB9zSimpi0FRl5XYsUOwJV0qRoWSivVTsxUTaJlirq+eNWmAxk
         pw02/aXmfEtNRBVzUsKaoZMgsMnjWWncXDaaZF8x/RlESdEf9FPd348hoJQyf0VvK0r0
         skf+QB4UFtv+LzDOhhw4Jms5+ouYlqYlwXltz+ICuR8u0suBkq9j/9o90k0rPOjs0BT9
         aT0h+hLt3+xyFD8J2Dtd0CkGG59ZM+K3dBCcudAunuOPEfKWWlC/2N7pLKFAYS3LQi3z
         AiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791159106; x=1791763906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFk7ga35z3NrHS6umKXq0xUG3dzK46r7JSMoXY1ndGw=;
        b=Prxj8tryck5PWu3lpYBklkfrDBfQW3euyq8f/cVbBTXoZHr0/ge+Pu6gygDjq3UEh/
         xLrR+pNwGB9ezjd17Zyf8td3sGxDuPo02ZIrRZzKSSz9USFeSywe50iKuuwArPXcNcjs
         yaXZapdwQchssfMagMGuAV6D9j+ViKjBH/e7r5vtvNOt1Xa4eOIeXqdeKEyHnXqca+Q3
         X58HuVDEaSbD+iM7NVVmhxFmr0q7hWVYM8EozlfjRu3kcdBitSdPkvbmQjy6BE13HNPb
         Q3qxmISfXbe6/gm44EUGVZhXmxkkjSFfDBQam6xlJ32EpcKOwb1+mX6snNuRGRWsQc3j
         aqlg==
X-Forwarded-Encrypted: i=1; AKwUvBy8MZWSKGpfX+yJvmXY0ISx2zfEGWinvSx7gGlHkTakukdPFlvXg+sWhSav0pXRY87e0ZVPtpZhlO9K2bE=@vger.kernel.org
X-Gm-Message-State: AFuF++lgpDHiwpsnkCeLCxH1jqOSUJxehkFVpOHFCP7BdQ3nI+qA3dEv
	OeBgF2iJYL0LMc+ENqmLkL51hmZfeHifbV2sD/aJpgMJfpcSv9u+KJl2
X-Gm-Gg: AYBFou3JB35P7Bxzu2peCxXM52PcYGh2r0+y/DPWfFjKmiZ/nB3m060ALaIg7GQJ1xA
	nzzabfqxfIl09MwqvCvmfGqRCsHT62bVF2bt+8XqQ5qBcQW3JUDy6yljAtHmvKUk1ONpWvx7mcs
	Omg7esDto/Qu4sqGHp/t58/j+KQVk0NFxBuhFVcvbKSh923KdKbaRbHSPqYogTk3kXsa+2uIHR/
	6914ANEkfXWEQtSJ1JuS1aHDyFT9nLH+jucSY6JXYvXm/tKYokH4Bm1raE34hXhq38eOyh4GIKW
	XiQBdIr9M4xIoDjeNUW6dCs/E4M4zafBrIViBqu/zZ6Zth+hdFlHXHeE6HRCLlAMMpwPtxWNM87
	aGMNQ+U6vCv9DvPsRoY3hZlStCMLzrfIDUEUXVopSL8H8k/X7lkEGOXHE1QLyVKrl1fQFryzklF
	poxsilPtQvi1W1oIkI3yIyweY2oLqcNmtss0bTl2MXSZ5HFnFY/RKpyWomEsr42JZ3oxy0xMYZS
	Q1L16MaftYQz8LOm4dXlUWF4PcNkbwqMlDIwEXCZPZYP1gVrrwNtNhm0lLfgXeYzNwXDRcscc6h
	B3P9rJGMCq+qoEEFGnzusSAaPhhXVbO3iEJ0jNQf51xrrXUE
X-Received: by 2002:a05:7022:eb47:20b0:143:7001:7643 with SMTP id a92af1059eb24-14f5cdc92f3mr12086833c88.46.1791159105797;
        Sun, 04 Oct 2026 17:11:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm16540732c88.5.2026.10.04.17.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:11:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
Date: Sun,  4 Oct 2026 17:11:43 -0700
Message-ID: <20261005001143.576737-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The formats array is allocated separately with devm_kcalloc() and only
referenced through the gsc_context. Make it a flexible array member at
the end of the context and allocate both in one go with struct_size().

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index d9637ddfcfc4..f1807ef664e1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -99,7 +99,6 @@ struct gsc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -110,6 +109,7 @@ struct gsc_context {
 	int	id;
 	int	irq;
 	bool	rotation;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 /**
@@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev)
 	struct gsc_context *ctx;
 	int num_formats, ret, i, j;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
+	ctx = devm_kzalloc(dev, struct_size(ctx, formats, num_formats), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
+
 	driver_data = device_get_match_data(dev);
 	ctx->dev = dev;
 	ctx->num_clocks = driver_data->num_clocks;
 	ctx->clk_names = driver_data->clk_names;
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
-	formats = devm_kcalloc(dev, num_formats, sizeof(*formats), GFP_KERNEL);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	for (i = 0; i < ARRAY_SIZE(gsc_formats); i++) {
 		formats[i].fourcc = gsc_formats[i];
@@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
 		formats[j].num_limits = driver_data->num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* clock control */
 	for (i = 0; i < ctx->num_clocks; i++) {
 		ctx->clocks[i] = devm_clk_get(dev, ctx->clk_names[i]);
-- 
2.56.0

