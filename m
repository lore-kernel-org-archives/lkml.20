Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434502;
	b=DP+sU4kT2TG8Ai3JjBp6wc0j2yR4s8EtM6ShtMCaLF8hr8yKNsbZ0uOwTtivAUawIbm+
	 4UKXzLVrQcbbk5SXiqexAviv+TKH0/BCKRAI9zFAfw5z8GVbayk7mvB9R8XT+JyuIhjGe
	 O6P13hGT4fOEorYgPgq10Z7OFfTzr3mQydCIlTrNrQeaWWazyNhPyq3Lni5eKLIeGAyHU
	 JNyGFY9iekzwP+Jj9mmIRtpOgtPXmtZsWOlzP5Oif1BZMzQ/i6T0kmr9W7XCX7oyCU5Q4
	 wLN6UuBVh6iD12BKFq3u+KCH66PBBjsjsEDkwUvUMDWWKgADwO4YCuSm+kC0ybdiy2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
	b=LahAB/F7SO5LTNDhMy0s9YmqvNoFzBpaODT4AhaimwM0dAr4B7SR0dSMw1Znc02T3RBi
	 aWtS1wVcBzOZi97VTl9sXzePU0mrrENPmI8WbbGUFqC5Q2fOHFHIVVNpeVAbL7MKSEYbj
	 6s1bK3+GqDkegNPHKS76MKr++0fwE4hq7OZGxYA7zMhtfOtbHEfxUQINzDKsfncO2A7ss
	 VDjsnlVD8/nF0fRalGNc5dswFicZyTl/QQhUktr0XgX7VtkX47mpwCNhupSTvoczsLWKc
	 a0nm+LQZV771QUZU2ctOL5l2tDE3LgJRU0X46JI2gGQelXV03/sIzmkT9urRGqOEb4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yP81/8gz";
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D360A5BDC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2D360A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yP81/8gz
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85ac281604dso2090847a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434501; x=1795039301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
        b=yP81/8gzn1Ll3IwuLCMoEbwPV0nMk1P0BANs+bgr5w90XkSeiq9vbfukn2+cw0IvPw
         BELqNQ/UghmV3vPpfIY8uKZTgtrVbFpFkqvuwLbl4B39z1o4mvXXvXHXaX3xYTjqfuUG
         mnFO6bx6foH0Is6jPiOc8vt0FWnJfcsvqwWjoaycm002osiIlKozAjH5bDuNMVpk2i36
         ZKOquwGqNrRDElTVfKSsv5qNhdEKrOxkDeN0B4q6wTQo1JzJCCbtVdLyqjZXiFINhoY3
         lZMcZnlzozw93HATT0hdeTPHF6qmMfm9P9J0qG0s87Dai2dmov4rGZOMxhx6gRoRlWDA
         ekMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434501; x=1795039301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
        b=i5y+nXTrIQzG0ZsgkJG4dLi9y4ByK/cYy1QPppRsU8K9jXHAtHetOBHig/7kd1Eb1h
         8SfvHbwjmZYPW5urAXlfcZAzvWJw8en9wGBjcNx4lzA3Zvpo5Pe2CmEutsjoG1l2Lh0v
         Zl//Vjz/q1kLoGbU5tiiGFLCBGPcx9oh/TA3hgBNIL7H0WsPrMnb2Gwn6cwjNhNATw75
         8+u6hMzMCPfX1gCK0udB/Rp2Kk+Mr5hPCVVl8H9ZWYa9bm3BtnPZDyesWMDr4mKg/mAJ
         3CvYrvw6j5kdwNUv7TnHAaB5hkHoqpKkJDfsYEtnQKylx1wdMdy+7ELCpieiwEKrZO13
         39/w==
X-Forwarded-Encrypted: i=1; AL+hErEnKsBN4kAs5prWW+/CdCXhOBNd7wGJbaCQV9JlmK1ekyQBdxd130V5Q1MPC5EB7IJ5WFNasMFvbieP4GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6DJBH23kY/OmJoyenugdyXdEyCc7qB4T5bA2BK+Udaner9IB
	azOoZY/Y6vR6ClhkYpP+CG9/ZNAjBkA6pzkjnn0E93EPxpyMkaXmZQ6E
X-Gm-Gg: AYBFou2a/ADUIYfFOtGE+9R18UuO12PkTDYE3apcGTVpIny9TJG5ydfynPONicw3Vw5
	m6zxCVgY1py/DPydN1645Onfne7nbrq0VQm7sl8tDtBp5xrmwGpDtj0zo15uvzydZR1chZpnCwO
	GwU4TDJ7qC7umotD2mJZXyTVnZYOLyTSXj3Pg3qoBE4B7PaBmzyiAgfLThcSmYPbndDmLzpdSe2
	VY8W1zTaNpQk78Oh7OLmutWM+clqhgkpKSI6emBuXqqLhbQ+6YXLlyWFnQjkWZumObhbeIbXg5p
	oZ+tzP2jRLQikS6DMNOfep+oeQ0CAchP3Yfn0X7EYqqWI0JNLGxYuE72wvvctdjPtQsN1KUqwWa
	LsudXcdvov8vFgVtp9e68hdCEGl3JZPE+zUpbOTw524UXNdDzPPj68EcflZfF/Z38PIGWBrdF+6
	WizLtFW12TNgfMGSfwLQiAEQQUxu/aJuX/3pLB3cAtnp7WFeNwfw+Sb5PGkimighl7vIFncVm3F
	Kbaaeo8NB+limEG2Q1BJ3JTCds4Mivn3Oho6DPpVShumxpR9i4QCO0uAfUKNnr0ILUpu4rcpFBv
	WpkwQnBP8183HhWkdZV1wryCRzSiPK/K9duSiQBBoR+u4QAWnlbAdCq3W2upu7z0G57JLALot/m
	4r5c1llzHtOciBwxAcWX/+tM818o6TSibowS1V6ThySQXrCMyEorygDqISdNwpGficwmsyHRI2o
	8MCA==
X-Received: by 2002:a05:6820:1ca8:b0:717:866:abef with SMTP id 006d021491bc7-7191789058bmr2582841eaf.34.1794434501099;
        Wed, 11 Nov 2026 14:01:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm4206140fac.16.2026.11.11.14.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Kees Cook <kees@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] drm/exynos: fimc: allocate formats as a flexible array member
Date: Wed, 11 Nov 2026 14:01:29 -0800
Message-ID: <20261111220129.12128-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The formats array is allocated separately with devm_kcalloc() and only
referenced through the fimc_context. Make it a flexible array member at
the end of the context and allocate both in one go.

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex().
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 9c2ad95799ee..9233cd3b2f04 100644
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
@@ -1273,19 +1273,16 @@ static int fimc_probe(struct platform_device *pdev)
 	if (exynos_drm_check_fimc_device(dev) != 0)
 		return -ENODEV;
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
+	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
+	ctx = devm_kzalloc_flex(dev,*ctx, formats, num_formats);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
 	ctx->dev = dev;
 	ctx->id = of_alias_get_id(dev->of_node, "fimc");
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
-	formats = devm_kzalloc_objs(dev, *formats, num_formats);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	if (ctx->id < 3) {
 		limits = fimc_4210_limits_v1;
@@ -1319,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
 		formats[j].num_limits = num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* resource memory */
 	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
-- 
2.56.1

