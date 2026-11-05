Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866054;
	b=gjFMeR2QPEl2ZJLEaoqrRXtskDLuN6NW80Kqj4uk3lQrvd6lafXXm/1EAyjas4j3CRPF
	 UzSYxchYarl1DE1NyXV1OdRKhs8Xbk7mLPqblg3RuOIgpcS4R4VXTe+i8bqhdek2moOe4
	 5HwRDJ5qF494yOVmgB0mjTyi9KsVYBgEBC08uFy4+kktlf4mxTozKSAS2Znq8wlEekCQt
	 Dppx1/f9jJwdVHHjo5Tw61Fn9rjyMbIdzyRsPAvNlXbW/C+CM4Q9rsWd3Fm1Ed4P8pE9/
	 Jh4u+DzoICQXxOkgDSOUsGgBhpBLAKpMg+ZM6lBTHmoYwvtNz3OpUWtl+BJpcQUpgaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
	b=fAu/H1VSOXh2pqyOxqGz+ZSklm1mJFrglx1fDWLc4V2huShumhWyBndKlRrzZdlXGbPO
	 7y2aZsO5t1LjF3cQ4sNU7lHHW6eI5WAZ06c/8EFG8ZOhgRX9l4Boe8WOClvDJq6UIaFwo
	 vTjh9MWczEIGnXXJGNASjCL+/pKFHo3zJ+h/jxcfY+Wc4lz0qsoCZmNaVLfyVLSbjlLvF
	 FGIfLO2147HJd1+4N16JAi2oLIRxlKMGB/5jlbAsFchNvRavj7llrDLUiNQPkA9cnvHtd
	 u7EFLwhOFQZE2ZaaF7HomF92bwvmIno3NefL5SAG6Il1rnkW3mZqPG9CfeTs1loe7SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="obgHo/27";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD9606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DD9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obgHo/27
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso649551a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793866053; x=1794470853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
        b=obgHo/27Mf33/82GloUytydDpOzpgOlb0c1XcPjktw3+jGctX+yuvBF9A9TkH5QMeC
         g25Mg9T3Xr5ASXhh0bYYjex04DAL3MOjzSwIod4Sw3ueB+rRgXAX1T2twIWGH7AQ6bFC
         CF2syxyVDo08BVyst8qbbIg6huRX6856Yzx1suzJSLCGoZHnYxXVmhkusZ8koM/i5fFl
         9GF/25kPeihmRyFBj6Z44mXq5wwaUaY92M8lOTa3EBZY8hGTtdQzE3FU4YPz4GfYUeBI
         Z42fsQB3pJLC/T/D71kt1v2fn9Oq1BArt93UhgluzvPgwzKUEq4IIaZtAgapy+ZRBRB1
         vjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866053; x=1794470853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
        b=lRlYHHdq6NhLs+8efohLti5Vor/pGE9fGInXiKbovQ7ZILwndyLY2xPISeHrg0S2Au
         /uWz2LIUBrAvXwNsCRDcT0sC5ZqVxs1tnPz4q9UI3bA5upMu8A6Aux3Z+LPJzGsGZj+E
         N1IskUtWmnvC+/fPK2elKh8mYVNSsy7K0b5PV+0h+k0e+wMrtrBb+0TVvA8pysj1WJTV
         IJyIK7HFXX7RCE+G+VlTVEOrj4d/3E9jOuaU+KAi7+0DwpRPtCgqnw2Kr5sQ+b3S6t1r
         f4+NlPV3UfKXsEzHQiUoNnBsN8dZEgqDulNlzm5zN1W0OkT3JvgOdvajVcUYong/GaYU
         c5pg==
X-Forwarded-Encrypted: i=1; AKwUvBwNi9xNGhF903wRXpkvCMTHWZcJltJ0Ys8q/cFeEFerAas/sPFLGVY4mjUV2sdt/BcO31Wk4zrwM9jBl3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hgSEAkw7jPDY6MNOA+TGQvoaqI0Nt9A3gcD4BGN4yADz6lKdO
	g8J+ncUHRNlDS26qvF6J7GcoE7fYrWUguv7736IYYRozKfuinHBqJlA=
X-Gm-Gg: AYBFou3OFK2KAYPq/XbcwfksVoPbTrT5hGNmY56v1xkcKj3cJPNzAy12qe2YHJe8am0
	u6CY35/6P5mslnMVRzQs4rH8RLFwMEocfhoLwOqSLMBtAQaEi31MrM9YOnyX4XMNCDx5ei+FqiS
	Qw0y6JcncgAOCJ8hq3qtx//KBS0/TTy1t57siA1b00Q6laAh4/dzFk5uCSReJxqwg0TBTA+TDyl
	HF4d/scGv7VlJWJbISJqRBlbnstUzOt1vfg2NmQFi10M4Q9jtbV+Yix+dCYotQMIoybX7riMU1I
	KfWe/rO59IkbDC5a5dR2lK9JIY2m1BFxzutSlsPNRJ5eF767hEc483EffqHqYHsZjzVEUEpfnEn
	ydS0/LnQcduigb9FjjuHxHySWULBJfmu8F7J8p5HQfeN9K6kNqCTYfxXlHz3Tpi9A33bTzaD158
	T9k5zw+sI8on5PSqnLETil3XE2AGUDjIaNvng4cJLB7VLrSfyEJjRbTpeBzAhCGuqOQEvZ6bwEH
	ddeLXoZ6+yV+ApFeOO/yqdl8dBtlwwDDSrusFeKXuk1Dj3DBFCkogu29N7bug2fHf6qOh9W8IXs
	KHfvqDPX5jBIpVzcL7sgm0X/UxnovN/J3PIFyPbznFERNaX2W5qCQJOwCA==
X-Received: by 2002:a17:90b:3bd0:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b0ad59732fmr2113248a91.32.1793866053007;
        Thu, 05 Nov 2026 00:07:33 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3163383sm2689684a91.7.2026.11.05.00.07.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 00:07:32 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/exynos: dpi: release the node after looking up the panel
Date: Thu,  5 Nov 2026 16:07:24 +0800
Message-ID: <rc-review-20261105-14-00955ac4adbd@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916072012.1967169-1-vulab@iscas.ac.cn>
References: <20260916072012.1967169-1-vulab@iscas.ac.cn>
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

exynos_dpi_parse_dt() acquires the remote panel node. The posted
display-timings fix releases it on that branch, but the panel lookup
path still retains it on success and failure, including deferred
probe. of_drm_find_panel() does not consume the node reference.

Put the node immediately after the lookup and clear the unused
pointer. This covers both lookup outcomes while leaving the
separate panel reference and its existing remove-time put unchanged.

Fixes: 14b6873a0198 ("drm/exynos: restore parallel output interface support")
Link: https://patchwork.kernel.org/series/1166158/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

This is an incremental patch based on the following posted fixes:
  [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt()
  <20260916072012.1967169-1-vulab@iscas.ac.cn>

 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 92e8bbe9d35b..e98a9be0a705 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -243,6 +243,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		of_node_put(ctx->panel_node);
+		ctx->panel_node = NULL;
 		if (IS_ERR(ctx->panel))
 			return ERR_CAST(ctx->panel);
 	}

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
prerequisite-patch-id: 8f90819fd9f71f55560dc3af57c5a0bad07bc568
