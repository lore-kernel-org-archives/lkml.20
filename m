Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62743426436
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653546; cv=pass; b=a7K+PQXH/mNZMm3Bh8Ee/nUgA0ZpD5Ugzkac1UAsg2l2VC9XaAzjYbI7mEpovq9yuvaKuEO08nvWrrTUgF9zcXZCK2gL8dPe3Ywsg8EDSv5LdRBX4QFkrYAX2YIA+PiDMMNNG8j87yYV2FLBZQIQd6+QyS6a8iPo8EthdL6KM5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653546; c=relaxed/simple;
	bh=ZbKj/0+gldpyeLSSMbRlmpp9mm9nCUYXI4PymrPfLzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyNVOIyiYHxTd8D0HufC+RqOpTilHEpFUIL51w2uzVFRcDutZ26LlYE/2JijWbQDBXL0XZ52JaOif6ri4J9UIkMuNvN6v41rXQ4DtEKKK2TDNwGBM4OE75tTeBOR6tkA8e/jOdy1KJui6zPHCEcHaMileYraVupkdvGRnCgdG/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=LFrZXxg1; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="LFrZXxg1"
ARC-Seal: i=1; a=rsa-sha256; t=1790653516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=McN0KEJKc1mHILO0s18WuqpjMYnlNcZjXdjeXRZnC3seXhuPJX3hsep91nC86kQYAQuB3/UUaWMaQy6AD7S3JZl3Uhw+Cp4rzV7sgDnvTJWI9AGv2zMGwMtU5rWzximEMg+6CVz5ZkxM3729JyxAocgXNoj8mhGPmGWrzlZsz7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790653516; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5tcaP2IVkF4SV3ksstD6wFI9LNYjrG0cIcTQTiq6ocI=; 
	b=QZ2NSd811D5SITVrAYnMP4XE6VVzB+46EceOC/Xz7cphkqFYkX2aw4v9NNYjBAvqGmWNdMvBqfSRv950szNCcYg0OrXKwy7lyTNYS9PpFWcp8UwgdvxnGL6ZzOZ7upNs2iigoG+oNPyRcwPvezvYKC+FfeK7Jez7gEhLB3guTWk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790653516;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5tcaP2IVkF4SV3ksstD6wFI9LNYjrG0cIcTQTiq6ocI=;
	b=LFrZXxg1vOzteoNfZNflnnpMur6TzbFc+RXSyK4vJyua8zogRLvErWsPBUvyP0GS
	g8xkCeBEj8Z/tw2975NeflkNd+ClIPiW8mooNBDyTib0MFYASqOAd6d1m/+GNVvrxg6
	kAeuo8p2nphfbbJB3srCEzygCxq7tDo9NFqoTbs4=
Received: by smtp.zohomail.com with SMTPS id 1790653514977790.2997644814461;
	Mon, 28 Sep 2026 20:45:14 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 29 Sep 2026 04:44:38 +0100
Subject: [PATCH v12 04/15] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-claude-fixes-v12-4-62beb08de207@collabora.com>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
In-Reply-To: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ZbKj/0+gldpyeLSSMbRlmpp9mm9nCUYXI4PymrPfLzQ=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBquzQtNO+6PaQHqOSMADaQhp8RqicqwjSfET07T
 4B5vp4EiSeJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCars0LQAKCRAOJn5M7lND
 PSWJDAC4vDIxkSNAQwmwTYRCwXmUKHDoAeMh0Vp/CTWD0EQjB3jA6034FD+hfvBONEHjnT6T6A5
 8vrS/I/LdTSgHvMskWB62CMwQdUaXop0npzktB7Lomqcemg175R0UkABzlckKJIUI01UVVBaf04
 1LR+SmylnwY/66mb4dMOsmeNXaxY3rEek5t5fDXlPLpzTKAJPXR+s0yo424caKqIYYeQ3XZMEW+
 TW0bsqO9CAP2PTuo2Qdw+8mCp647s/SIv6gHf9A8Yx+zgClHOqVgjvfPyZ4q/RK8gjiA1SqhSd4
 akeAI9SOCKk7dNG9Fmee/9dSG072UxnZB1B3Fl/QxAWJL4TNy+T0fMtr5KgbPU1ly5Gzcm7FvZz
 GprVtqY6ezvtGxAFaC6rQP3ButZGvASChQRQETocmTFrYnqmDPNKTHISGDyDczweYoSBFjXa47Z
 TUeOsJibT/tF0PriYqtLKFS2WGzfdsOWb48SyXYLN27x8faWVaLtrIimpEo+OGBTtHJB4=
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

