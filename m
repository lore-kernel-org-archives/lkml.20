Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184B4A92F8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273435; cv=pass; b=QwOxpIHTLaawg9uKZ/4gEqeK5b8dH87QY6y/oA3E8J3dNJv+XyvwmqdM8M6GY7TH8M6+9NlfsqJ3CIQ8oIGYif1SXOghEdDfOX8WCZaMB30Q/Ix6ZrxcDdqjWxqEB3jH6bXk5wsPownshQnQCI3eNTRPbOGCKyarFSueXXDgaKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273435; c=relaxed/simple;
	bh=ZbKj/0+gldpyeLSSMbRlmpp9mm9nCUYXI4PymrPfLzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7xntV4AQoN/PHUxsOkKaZwa59Tfm/L0avvm5ClYPIiqZOJwS2dwspdSlSUclwQgwg5Iay/Bn/eSt25G1pg8M+t/vmfjwvI9fn49WOoL8vb1GyIkdZySDHGj+HBdm5b9G054UXUp6DGkGrrlsJ4btka2/5vf60Vgu70B+bY1FiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FXulUgFI; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FXulUgFI"
ARC-Seal: i=1; a=rsa-sha256; t=1790273401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QVRSoFDHNCskrtHBne6J4TTB+NL6moYfGTkKn2TZ3l7VXI65alfI/UVtKVwH1ujQjMIYjqPRCfTOUSvYXj4Tvnxzk9YdrhWbmz7mvilqaIFK5fSZR+B8ERDBjqhiScjBp6YBNiEYN4zz28I2HLZ6pWmKqVW7GD3awPDxoYTN7wk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273401; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5tcaP2IVkF4SV3ksstD6wFI9LNYjrG0cIcTQTiq6ocI=; 
	b=bLaXNAhfOoWW6PHMPWz4Eb8ziDgqJhVSnce43UqsGUOMNYgl3FG6SCMcYImkgLhcTb+f3AcmM4Ug4hdtCNzU595u3G11sPIVsMEOPLU13wosLCMthKbznHhx6lI4J6mgFyCSZEvjRvA5VNMM0Qc34kVvPgYDTbAdsj4bP6X+T98=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273401;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5tcaP2IVkF4SV3ksstD6wFI9LNYjrG0cIcTQTiq6ocI=;
	b=FXulUgFIpKm5tOBwYBt42+D5t3ceBMNYTriyyH6JzdCYAE0POTfA5jRppvAIzBrR
	kmfRxNvFL2OWSWWsbLwK7oIZ+1nqYONLqrbiu5BFEnjuT6gJTnDjC8Po06zCm1LE31C
	r45FTBs0wxTfWeWhR1EhZUiu+08IgTg5Z+VK3lCk=
Received: by smtp.zohomail.com with SMTPS id 1790273399588786.1947085940815;
	Thu, 24 Sep 2026 11:09:59 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:21 +0100
Subject: [PATCH v10 04/15] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-4-755929b3cc19@collabora.com>
References: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
In-Reply-To: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ZbKj/0+gldpyeLSSMbRlmpp9mm9nCUYXI4PymrPfLzQ=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdYDX7lYzsQDQ0uDE/EecNI1RZGrA8b7JeV0
 uD6c0lD0JCJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWAAKCRAOJn5M7lND
 PZmpC/9GQFQauXugJH4dm2CXAeSc8KCGvTug0EdfCGeBedc5aciWfVhGipJUp6xKClclWtbP3N0
 kPbg2+9gNqz02Uc8O5NiF1WC18N8kMVaI3p7WGIzjR4t40N7aqV+i88KyOyQCYIPPYBLlZBP52Z
 0pcDItzO3ZEYc3nnjiCZ2YURisqxgIgJNpJ9dliMgOFmC5Fr1E1vOq/kPoB5I8nSdh7IKU+NQwz
 aCmrpw20BmJy4bzbqaNkXvgaE18+2gGH5SlAZEzxBD2wT33yy6YnS/1TizbPUvEqDVGMSQXVVKT
 hZPHQguF9mQLvAeOBS0XzVoaAwnwUdB4C0VR+1Wdq/eyomjTahJIPduM7rpdXscOlc8Qmjhwwol
 X+/V0AJGmAaCEhbaJayxTa0oO+YwCtpKq990SKB75Z/xXRTXj0HZB3gp+3xtVINZFk80qPf6rXC
 P6DKjrRJyRbghxuB1XyO3n1hqIY9r82MfPaWyx490RpEVFGBOVxDY93vLHj8PyeA5oth0=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The clk_* API can deal with NULL clock objects, so we can do away with NULL
checks in client code.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 5bf528f41278..b3a53504bd01 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -510,11 +510,9 @@ static int panfrost_device_resume(struct device *dev)
 		if (ret)
 			goto err_clk;
 
-		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
-			if (ret)
-				goto err_bus_clk;
-		}
+		ret = clk_enable(pfdev->bus_clock);
+		if (ret)
+			goto err_bus_clk;
 	}
 
 	ret = pm_runtime_force_resume(dev);
@@ -524,7 +522,7 @@ static int panfrost_device_resume(struct device *dev)
 	return 0;
 
 err_resume:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
 		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
@@ -545,9 +543,7 @@ static int panfrost_device_suspend(struct device *dev)
 		return ret;
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
-		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
-
+		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 	}
 

-- 
2.55.0

