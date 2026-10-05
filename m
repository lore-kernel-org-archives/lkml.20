Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB532F30
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791159084; cv=none; b=aimxREDe++JP3zmAioRe6il84Mq1pSsIxeNLLa46LMKceA5HOiReIixMsJkteKCDY8hFNhjAlvRTDK8IQlcO4EF+oqLKxJPtHEA4gSjJ71mkpayTSaAhtvNf7YZYEHgEa/cuD/wRNZl5siXkdXaH+E6guc9/jy5vkBTO2vRUGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791159084; c=relaxed/simple;
	bh=L7XOJZwLjudfLM2ulu+SHqQ8eTBn5mGIxFFPTtYoB8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEmF6p7e1iArVQlA9vIpraWuCBkpL5uuXAoPOFt/moGIWxWplmZ037rBlR0H3hKuEAEo6HhZNIXhRE5MYRPaAfXqgniw90k+xh9XjisG0dxni2wF4gvx9E4HjoNZEjMUYFqHpEWoUEg5DD8rLf/Sb4mrnCTdYhZ4oeP0dAGv5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpdCBUtG; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpdCBUtG"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b1743e9c7so1066479eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791159082; x=1791763882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dpTVtuLsZCKAP9AgVyjYlCoNh2JMBgdKfaKYvWUv55Y=;
        b=BpdCBUtGkty+h3hB+uehSfZhqrVJRmgts6jE/SHndicYAEg6kt2HGxcJXE/e/RN46o
         JTgHi9abNV/WSseMzmFTq5b+qXuzB/EtDhr2LjZWtS13p2V4CRBdF/rvuwL2BAnXopp7
         zwnQRUcv/LPmcVKiBhOcSnoBKD7xN6kTyFKC0Gnjh5ly93iHRCM1AeUqO+SRqy+Kjqzq
         WlfxJfROukWVRW1W/uFA5R9wMo0BX+KLWJ0Jt46OWXrhOV3WXBFAar1lroQ5jYPiSKoi
         FiYqGgvsaumDPXLtJsISCMeFLWuZcZGPGneHad8D9lsjAO9A1YXCLCv0CaaRRRfTSRK3
         0OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791159082; x=1791763882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpTVtuLsZCKAP9AgVyjYlCoNh2JMBgdKfaKYvWUv55Y=;
        b=uc7pLfsq+djeyIPCUiArnR72gfX5DXTi5Ua7a/jgxrlYFsIr5ca0+t0y1dxvvplDAB
         F0g0laG9+jDcbBj12PSQMSe0TFbFkGSwv2B5U+Ltzq7dlBZo0rIdVg5YsbWsS6H4Ugrn
         JzLns7iXQWtmfJh8fmL1kAajx4MK/aQf7nTWvA+bZIMSlyrC1Q+jx1zhUKgcLnOqZk4B
         ZYbO3SUXQL/toOQQN4a3EScvVoCnUX8MhLMo+3LsEaAd5/ilc0a+1S2V4iZl93obdoSY
         wo4eRhkO38jI1kX5u1vZlNr5FMOz31H36k3cMWipyZpiZit8rtjQpWGPFhtKS1jdt6I0
         aWXw==
X-Forwarded-Encrypted: i=1; AKwUvBzGBSFLUFqpKLZe/ps9bILfxfZokMsb6y5qQhT46se1BPXmMRNllCYRM/XOMrJQ6DEN+Mxb9RhLih/Qz30=@vger.kernel.org
X-Gm-Message-State: AFuF++ki7W07w/VqtU2BDXUjGoncexXrC84nGx5y7aR5uIEtuoA1B2/u
	2aysPaA1JApaKcraroaDmyaMFRwBzjJkRZuhdaMW/9IvWThbojvTys0B
X-Gm-Gg: AYBFou2ukvYnapAxXpWo+s7e8HJsVlD21Q/lR4J3tUsSV+Pm/9Dzz/SvqdoQQFoy1uV
	bM7B54kH6HXEcqAhMEhZ8t/vSv4Azce/W/96uRvOlqaX+f672GLy9YdvgfJzDwn1oDe4RwYlFYl
	7WYvJyUOa/IOZ0sBUloBeCa9INdPDdWSjxPHgDr9TH/Uj7P5R67eB7VApt0CC5Dy8MXVtqfVg+p
	ldm2kDZXfdwWie8FCjQ5ggSCs2lMZ1ADd1rqvSVqDtcmGqy2YfEnEAlCCFZncFFcls9//KHY+OR
	0nelME1j57x+M4YyIvIcFauJ4EOoeiPQfJ3YgT9jz0zFlo5BBCX2kLphlOb0oUBED7PlfkO7bLf
	AyIUIwVlJAm/Mpk6bmaLlRxTQijnoXU2PyVV90M1lyv6NOaXdiv3WqYf9P3DAZPNKGJdm87Nk9C
	Qh9388ubeNzqDOhMzoapmsfwwQu8SuGotpCyhiramoxUKhn4IrkQqAIs11/6kZGYQHFeZt0ZVL2
	AOCTRn7V2jlA0ngtrZuKhUCSsJpxJrrlxzKB42oiraW20TwCAUSkIXwQfDItnm7nGMN/6SS2afj
	t8UiV17d5ZqoHUaiNHE6q59zH0kP0jMMZVi3Y6g+hLn+cu8S7zv+pbuaod8=
X-Received: by 2002:a05:7023:a87:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1533c50abdamr6557346c88.12.1791159081504;
        Sun, 04 Oct 2026 17:11:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa751693sm38784720c88.2.2026.10.04.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:11:20 -0700 (PDT)
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
Subject: [PATCH] drm/exynos: fimc: allocate formats as a flexible array member
Date: Sun,  4 Oct 2026 17:11:18 -0700
Message-ID: <20261005001118.576198-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The formats array is allocated separately with devm_kcalloc() and only
referenced through the fimc_context. Make it a flexible array member at
the end of the context and allocate both in one go with struct_size().

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 09e33a26caaf..079d24d0671c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -99,7 +99,6 @@ struct fimc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -108,6 +107,7 @@ struct fimc_context {
 	struct fimc_scaler	sc;
 	int	id;
 	int	irq;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 static u32 fimc_read(struct fimc_context *ctx, u32 reg)
@@ -1273,20 +1273,16 @@ static int fimc_probe(struct platform_device *pdev)
 	if (exynos_drm_check_fimc_device(dev) != 0)
 		return -ENODEV;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
+	ctx = devm_kzalloc(dev, struct_size(ctx, formats, num_formats), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
 	ctx->dev = dev;
 	ctx->id = of_alias_get_id(dev->of_node, "fimc");
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
-	formats = devm_kcalloc(dev, num_formats, sizeof(*formats),
-			       GFP_KERNEL);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	if (ctx->id < 3) {
 		limits = fimc_4210_limits_v1;
@@ -1320,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
 		formats[j].num_limits = num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* resource memory */
 	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
-- 
2.56.0

