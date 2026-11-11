Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434611;
	b=xfVrYkdxmbZbrMmpPu7aYSPlFuCfIJm1Ohl1r8h+QwtLr/z1Gbzqd0AxFqAvHDGzgokd
	 iSMIW1oC3U7DF6AGojdyYjeP3uZ7tWZpE12xIcz/O8MmLzvXzJVbvtg5rG9ZHqgi+kNEc
	 kLqIQoJUe8irXn2PW/eFP/JYBkB4rwC/QKVnH8tO3uWEnuMmuozb6gKAjAg3OtwR53B1v
	 CPiJU29GpE9Kh3Am5feVPWEPDNT4+jj7KbIObJS9BZKSrNZiG6EyVyfQloaM1vyzCdJ4J
	 /tBQchHEs4yNaOP2WVMUUyv36Bzg8XwZK1xNgm4KNBGk7zaxEZPpj0YTRL25WI2pGhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
	b=CpWdJ8mMmye3LDHqxWS0kPP6839c5dk/fiPHmvS+ekKVLWSheXT9bid0MKxWktWjKO+9
	 GP7WzKf5dVMsmsh4rlCIEck+eth56C6xJK3v8pAi4COqNTWgqSZ5XMmMvP+3p6zbBJFtl
	 WIHxdW/ztC8mEnTQendzfngwWMUqNGGplEDyLW/DAIZVOXU7eWW4tZ9PmHRNiaECy4P3f
	 pOnVz6+m2J7J33bO2x++ZJfvW36iedbxwzaMUa03MGE1PUvCUqLlcVpyybv9jJmB3cKD3
	 KJxx+YBAF0OBD1pyGBzqzxIqgMtyNj1XfUUshbQSFD2Dd1soyTfPG/Dmlo0GGNtrbLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LrLxu3Si;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B8606A8BF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4B8606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LrLxu3Si
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843cf077f10so4476964a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434610; x=1795039410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
        b=LrLxu3SiPHmBiakkULpg3sF003Trd0QWeo5KmM8nHDe6vsaaNA/VY0lQDUn7y55jj9
         F3W8q7FUrd4MgKIu+yf6/gvqWpOrZN6NWDbczzgFA5kuxWpMl7dfXogvp6kMWjS/PGbV
         g7mC0ng8nyF3usqlPhKM01PxDFmIubW+WXtaIKQEd19H3YawmMYX+6N2x0M00z91hdYp
         cGWk+4Qa1CYW3Ds39iHoIrUO4Zz4H/lbD/yT8MUnDLE9JzZzk2A0yCfWKEs+m+RnDBBT
         i1QOTdDgQs7g4gFH6k7UInOt1EHUd4awfwtg8vx68eSftwRkyEk78ay5MhjDiKEZmFfb
         i3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434610; x=1795039410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
        b=FxUg++t5zoCSRZOgFr8IF4kaJryJD/jg/dYiGXEe5PqLH6wp4L92PsQncNLf+gKfl9
         1zuUtAXp2atsDPzp9wzpTThk9mI7yRWZ+AmXrkRA1k9FeAtHp02tM6zodRJVMpA6clnG
         YnGd4s2iQllvz81TNMvUMzxJuudRf4y5GLabLDIEMOTHoz8OX7hfALRbTIR8kO/voDEe
         z/P+DfnzsKd5bIfTlJXtSlexhg9haTaq3oeBQUI/aGbu3yIjFiVqvAhjdeQlOks/yZRL
         OO402bb7I5h7ts6uAPzzSrtDLCmSvR4ptYQ7CW5tp+Wn9hK70RwjX9lL9py1g2nDagln
         H5JA==
X-Forwarded-Encrypted: i=1; AL+hErF+9rTiOTT+f50KlK9W/lvV39oydJfCIWeVXcQc7WGE5v1OxJCUyqLE4DKognUc0d+TzS47uB7ONh3sPgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TeP+9ngMqo5mDlW9hF9ncFyRCfxxbBwm5UuQ0qH+0R8tf5lvN
	JS27ZlIdl1xn8i8PX+jbFC5HiITybrw2Uit04v3Yleo449M7bbs5ePH9
X-Gm-Gg: AYBFou27qjWsDMjAhVV63K+QcEF4is8d8oWtAgw6bsNCaUah0cNGP6NHBoIgC+9o2n2
	Sm/OVOhj2hieMLfMobyZDfeY7S+NF/vnTyqlTCBsQ8pJnEkNTFoYq1LhA+oCl8l7eC8KjQFTBJP
	gLNrskKIW2BRIZ22F7TLxOug/4UlxhIO3tWHiEAOPXrlQ70NZlCdVRaMJ5aSvS8MXp8AjN47bRg
	zv0AnfKyyDzVWcX+5F6tZfkiZPIuM0BCqMxeKtpq9raBj5zi2w1xikFNq8PTalI7W9l4qzN51QA
	7c84LHgjj3+y+ibGNM7BPXtapHJ2Ymu7ktvlavq4+1AzHfOul2dyC6CYxqDb3NxGu8kChZEzElQ
	Wy7rxTgfnQg9JIoKSF0+wQx/60LkKpWnPyvSVVspRNmL+EOVsPKk71eR+n9u5Y1WSTjfERrQ5t7
	vEcAQFfzhwHQPqHxFAU5jv6e6BxqKy58HtvKHdxsh+L9JXaF9b4khNOLZCFrnc+qoMxqV5QISK8
	0BsKy1Ah5JkHvKb+GM50SpPlciSULggl9bDHHPa8AB2TO4pOsBW2tGOckuv1sQuZe67tuY1S081
	SjDhjrtqBaXxC1d6Khgjhg3GCvuZI3x0bPdBJP6zYGjgGVJ6jq1PLJj5p9sctH2tSUPkcTmHV+2
	XVSFxYRu5grl13JdCB8aHJOZ56Y6FzaLJUxs6dkUwlGgcF3YHj0rxcG0nqX7+kCs5l8EVwr9uAW
	LE
X-Received: by 2002:a05:6830:270b:b0:822:b35a:a2c3 with SMTP id 46e09a7af769-860f25eafa0mr3652101a34.3.1794434605465;
        Wed, 11 Nov 2026 14:03:25 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8615518d641sm236715a34.21.2026.11.11.14.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:03:24 -0800 (PST)
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
Subject: [PATCH v2] drm/exynos: gsc: allocate formats as a flexible array member
Date: Wed, 11 Nov 2026 14:03:08 -0800
Message-ID: <20261111220308.12684-1-rosenp@gmail.com>
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
referenced through the gsc_context. Make it a flexible array member at
the end of the context and allocate both in one go.

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex()
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 4a07deeb382b..303e94df632a 100644
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
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
+	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
+	ctx = devm_kzalloc_flex(dev, *ctx, formats, num_formats);
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
-	formats = devm_kzalloc_objs(dev, *formats, num_formats);
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
2.56.1

