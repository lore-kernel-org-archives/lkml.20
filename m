Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD63CA49C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950708; cv=pass; b=IWp1adoSj15Z+FzqHavHnta3WY++U+e3oYaceO1Q9+PapCJnaXhIi2NmNLfHIWdROy3FUbMxB/0Vs2CwIKImvISVTZFCYMSZnBBiaB/ykLptp9k3dw1SD1Mi5iepg3CkErcV8WVlSYSTCLoDa+kOZC00dRJw+NJIfZo9VhupJj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950708; c=relaxed/simple;
	bh=iTZh9Yw1GGOTJ/Y7s8S/RGUEO1DR9HzCctLcW2MIF1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhbliLRhBj8axezNMX5+tuoUiOStzgIoc8npYO5qQHY9kI/fW1Bkzmi5AAHweV/iS3BOL0HP12aoXc5MevOv8PXreCOhL7zsz354krNDR7TftlT8j7LBf02ZEgwN9Ol4JdvA9Vtg3o+4P54IP4VsQ7EwktjcGXEToBUTOLuf0TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ABk2k7u+; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ABk2k7u+"
ARC-Seal: i=1; a=rsa-sha256; t=1787950672; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MtxEfV3u9OjLL4DIxRLdpSxBdCyxHxZsv/K9yZnXXze/EQ53rTX/qdJzzRZcTd/JRb1ede1LVEUQhaE0jCrWDEhgEjL80gqXMCtYROr5+Ck9uw68q+N31fkBWkcGLYUyeIZO9juevLjoYLBOe2k3z4E4LqCt/JnoB+D/D+3hLgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787950672; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FCsXL46tmA9akTAVtmeCRKI1MFQuc5YL5rmGqRaBV4Y=; 
	b=BnkwzH3FwFaZwLcHTyWX0/+tk69iLW9rX98hDETz5J42XFyWpp1leAMMeS+WoJ6qzEJuj+fDBLHb0afqIOfBna3U6a524ygNZRvndwzYYutxMp7B4D18WOn3zMbBeJKQ9a7ZkBxYTJFHI1/M8xcFcOHQKGPTCUwXnjwAUwjR5nU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787950672;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FCsXL46tmA9akTAVtmeCRKI1MFQuc5YL5rmGqRaBV4Y=;
	b=ABk2k7u+BZiu9ZpOzwxbGk+zJtSwSrbWzA8j9F1AbTYykecDadYae561drHQLp7J
	ZHZlADMAOVIaz66RKr6s75u62EIvfa1tf1iC1b8vxFT26J02JWzVBsPt3VKydIXOXGc
	TWXGdb/IzH06889a1Y16f06gZV1M2Cm8FhWqxNm0=
Received: by mx.zohomail.com with SMTPS id 1787950669940970.4975499769293;
	Fri, 28 Aug 2026 13:57:49 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 28 Aug 2026 21:56:45 +0100
Subject: [PATCH v7 05/17] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-claude-fixes-v7-5-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
In-Reply-To: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
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
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqkfYtwm00Ey0kiu6Ad6MA8Fa2vIP+z/AzzmqQW
 YXDGE29s2SJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCapH2LQAKCRAOJn5M7lND
 PTJTC/sGXYMJahITgex6AtjI01Ke4/zoqKqd/7qrlCWD0InubM/f5CptIOw1i/KfIT3cmHzhFVF
 NqC/E/uHT36RvOCy8Wd7NDozKwCnK7e6Te82mdTaVDH859noV6RIlN2Jg1H45cfKf4DKE5kUVUV
 iUgy4jr39W8Hr9SfQKYPEZJgJA1UXwSdlShWMY/8Bp69tlYJBJxUfOAfSCXy/+rd2j6+2Oarl1R
 ZsgpTpS9Uz6FNl72oz+wxekphDhl61bNfLcmuzVIWlpMfw8QQ8bEX/6tZvCaw43kgUF38z1T11m
 lZGnq6eEocqkQrMYyVTT2FFwdOod1fNS94tN6h97PqfZhM78fVDaSQYKIjVPRpgyr8OhglGPJmX
 E+MdsCvA16+kfliovGAUHtE56K4PTX/fd1SbFXGH1f2ZFsghVvPesmO8DSBE6No6lyGQS1wxDrg
 +x6gI2AEfjJXVmiZ4H1qbQ3Ql3lBcRoiVW4PV8ZRbuYZI8zr93NdtShw2wBaa5+pnuQrg=
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

