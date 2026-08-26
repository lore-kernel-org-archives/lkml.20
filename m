Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCD3F8709
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779166; cv=pass; b=oClYHCCeHRknWez5igPj2fOgCJHYtxSzp9VA1Jb4vcH2o+mjXESdrT4OkiZ/NLdNB7/BrgHBjmEs6QweLIUQbzo8iGEMhXKpI+V3nnYtoGtWdCIbmKr+EDFrCOtsPEGAqGUDxAgql9wgXHs5jLnWoLXcvne7dHTaVgm5+1N5x0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779166; c=relaxed/simple;
	bh=iTZh9Yw1GGOTJ/Y7s8S/RGUEO1DR9HzCctLcW2MIF1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3y9kQagp9i2qXLyF/b0hwBswhUHNUK7JbtwP39t3TsSpLik9AJzllBlCEvTkABa3vI1x6gDlrtcSjeMNe2m7jpwYjdiM0UEqhuwRRTw2BadtBgAd0SVL0Tt7IxUsKtxtFn+nP8dSDe3X/8Qf/qsDt+oy75ClG9O5h9O9c7bp98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=lZU96u2x; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lZU96u2x"
ARC-Seal: i=1; a=rsa-sha256; t=1787779128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LbtpV0wnHzrGtHYDytUiksD7E65lThbzG5weMtAj80Tx86YjfP5xurRL4eTJmewlFYHDVUqHWsBKyhVQ6fzaKCrT9UyeGXSrb1dg6qluIHO0GL04Tfeg5Ebg791cjbODsJqYExq3Eh9NU1VmqS4GnE4cKgZWnAvTA9n9RLjx6Mc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779128; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FCsXL46tmA9akTAVtmeCRKI1MFQuc5YL5rmGqRaBV4Y=; 
	b=l3k+LuKLLfcFuI+H6h5QQtiFHsXikizNx/DTPjLr8q8OELacTGClIt1+IH0o9GfomditL9GRLP2cEc0zhgN7OwOimbSnIT3RTfZ6OcDDDn1Xzy/OFHbuFwjHL7csA9Z5n1Z8uR2xu4ptOg6SjvwHTU0vbYyVTK5rojkbfA9iFOU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779128;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FCsXL46tmA9akTAVtmeCRKI1MFQuc5YL5rmGqRaBV4Y=;
	b=lZU96u2xHbosIBNMn3XCCIgxTdHP/7kXjN5XBNx3DNAuDvu7hbDDghAAPcpSSgsD
	3pAFdLKxmpOM/xPAR/GPx4OFrGgRWVn2HR7WRGG25SbA9eWzyESwK57asqfX0ayuYU9
	vn8iGHWMYHoyVULIxlAoeZhRjAzpJFMdPiCcDDSo=
Received: by mx.zohomail.com with SMTPS id 1787779125555740.4320145288697;
	Wed, 26 Aug 2026 14:18:45 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:07 +0100
Subject: [PATCH v6 05/16] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-5-78119af409e7@collabora.com>
References: <20260826-claude-fixes-v6-0-78119af409e7@collabora.com>
In-Reply-To: <20260826-claude-fixes-v6-0-78119af409e7@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=iTZh9Yw1GGOTJ/Y7s8S/RGUEO1DR9HzCctLcW2MIF1E=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gLXIQROxVLcu9XnryLINVJ+bEeJ0fnichPw
 zZelwl/W7GJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YCwAKCRAOJn5M7lND
 PXxrC/4/4DPUp1WJrWpnaEqiwdJjRentKKfKRlbAhDdQV0vqe+QARC33D6N4oFNhcvb9gd/1u9Z
 9UMgZCkND7m0PukiCNwXzIVkYvs6jIvs/rEFseFCIlmbAp55T6chcGfSrWO4rW3dE/531j4VP72
 +lIOx/kcUWI73DllXZS6fS9MLra+U0REbvqqpA1aAhOQcCMejM+Q3cf2Njxq3LYmu6n9MzzPKWy
 nOnky2Ey+oZxuBmTwt1SJSEjUJYyGg4VBlZ7D9T/DpO4vPp5Dkzs/8WjwSa315ql8Rn8ekvqwr5
 WhtLDZ1564mimuteLZ1VQo+kGsFNvZG3Evk6DzBfwA137Ek9LXUu0zmht+g1HUQweKGtimp/tYz
 3Nw/65zZQge3IESGMBiPiiAhv2YppwdCwg0sSO39z53etNVGu90bYJWDDvYrg0OeFyNdy0OA6Mi
 HexyobvtqJNVcJ3QYq066IurTMLaFUibGrzK6JMbgqNt4KwHv+RBE2YBBcuLaYb8yAoLI=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The clk_* API can deal with NULL clock objects, so we can do away with NULL
checks in client code.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 6e3fcd53b690..a9d9669912e0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -540,11 +540,9 @@ static int panfrost_device_resume(struct device *dev)
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
@@ -554,7 +552,7 @@ static int panfrost_device_resume(struct device *dev)
 	return 0;
 
 err_resume:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
 		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
@@ -575,9 +573,7 @@ static int panfrost_device_suspend(struct device *dev)
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

