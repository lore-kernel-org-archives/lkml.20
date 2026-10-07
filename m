Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8F3546F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416643; cv=pass; b=m84tPm9LjWK7j3Xhi6cYpWmJ99qUV6Hpnpcr3tuitVCiZG3bKZuSEEginm3llayyhfnhmFM4NfK6I/FEODVM+dtn4NwDpHqzQsxgcD22o9/pPdqUpYvcrEvyrDEIiLuza3ZBdrY8sRs+v2k1u5eBdLOMgudGhFCdrUh7JO+aCq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416643; c=relaxed/simple;
	bh=VRla/9/j1ctQPKkQlCz/7b+MRbrWbY6Dgj2B2Pzm53s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDercs7P/mierlRgh0tsy8lwS+Wj2tDfD/A2t/Cd5MCYEzkxdpPsdb3iA946gyyWXIf5UKIzFLYYdnzW7XY6xBQhflaiIBk3DV7Yurikdr6BYUB/Uza0xcBKURCE/fl+RuRdQ+7iVUwiCXrRhwHzS32yFyBI4NkUOaz7yNRoknI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=OwepkVyH; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="OwepkVyH"
ARC-Seal: i=1; a=rsa-sha256; t=1791416622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nThsJHWALlN/j+EW5WH24aEFn923MVswhMPXN8ZB9g0yKzCU315gFD+b1Ng2GFgM6GwA7X8YA7+YEe1rQ96xHzptQlgu8uq1XvlCetZYqAS51nZrdRkdd7hXPUYy9YcacWc1ex1yOcLa9YCgaEBZY9IKKXogVOxGbsoLZXhOiCQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791416622; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ShEH6DLHKaOUBeOh6vzWeLYbnwZ5VEXVABDAJAv4pdw=; 
	b=hZKcj9SEIaYeWCUTOkJMcOGd3u6c6ArYH2gzMRtQGlUUCxwu2oFarea4f6I7HgKwu8ErWw2nLL1djdnaVzeRb0FD6FOzmNglwwvDefH2VdcSk01qbDZbgNMiAAf8Uun/JRLJvtQMYhwGjIrBq09PMdpJVssDbDNZb+VGEJyH/E4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791416622;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ShEH6DLHKaOUBeOh6vzWeLYbnwZ5VEXVABDAJAv4pdw=;
	b=OwepkVyHpNGssWxlyUnIT459439MdV8gwrBtwiX4MsuYbnbXsJOUTU/agJKM0gv7
	CwC3sW1vfvLql6ne9koKpc+CEkZJR2v64KcojGrHqk9/4npefv3KWN/rUNAfTU9snNJ
	EgupVbruliKSYpIJaz9pz+YQhs4efzLxtSVlyKSc=
Received: by smtp.zohomail.com with SMTPS id 1791416620903915.0876539319815;
	Wed, 7 Oct 2026 16:43:40 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 08 Oct 2026 00:42:50 +0100
Subject: [PATCH v13 07/15] drm/panfrost: Explicitly enable MMU interrupts
 at device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261008-claude-fixes-v13-7-d6a493185860@collabora.com>
References: <20261008-claude-fixes-v13-0-d6a493185860@collabora.com>
In-Reply-To: <20261008-claude-fixes-v13-0-d6a493185860@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=VRla/9/j1ctQPKkQlCz/7b+MRbrWbY6Dgj2B2Pzm53s=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqxtj7mGwLZxZUe3fVfFyA1BH2hFF7kS5oCj7kF
 j6FyxBQCz6JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasbY+wAKCRAOJn5M7lND
 PcbtDACdomlR6cCJ0QN565IHAyrG1nyIyAk1wnguRRd5kjgV9nxm7bMQ9OZ8aXhvg6NCuunrOLj
 3TgogJqCNq5EsB7p+LcMbOWc31sFSr7t/NL+sSNrmmNB4LV24mhtBGimGDyCebcBQtT9CeSJTim
 tieGVM8xsSQ8V69jR1sGmRnvjPDlygPDGpT8EOyil9Qm9sJewCUHrhnX4zgAhXh5UHbUdiYwxQc
 i7W/3SMMtUg7ohqaX5SA05du7ArJkFxDpd6Zi2CFxm5t82l/DP2LuxvNTQzqalFylrv+2tNRG/z
 e7dP9ayoUpQNhzWu7lI/WOBGsxJVEQ7RAxFxxBxxkRLOZOCVMndZCUSAQArv+/F9j4VqXrcH8Bi
 T8hPHSBP0rC31gnrwjUIS+6/+09QP4sPZ2sflkZ1UVGnAUvg8ktzxol1c0jAUFc5BPMMz/OCsoi
 oFKH+a4eL2UL4nW1knJbuAx3GI9u18Vas5QSbWKOt8m5wEkyp1RcUTYcpPQZQaoDTVYMU=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Because the device must be in a position to accept jobs between the time
drm_dev_register() is called and autosuspend first kicks in, there's a very
narrow window inbetween during which jobs targeting the tiler buffer
object would time out, since the device's PM status is 'Active', but no MMU
interrupts were enabled at device initialisation time.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Fixes: 73e467f60acd ("drm/panfrost: Consolidate reset handling")
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 5c393ed6e310..faa62643caf1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -336,6 +336,12 @@ void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_mmu *mmu
 	WARN_ON(atomic_read(&mmu->as_count) < 0);
 }
 
+static void panfrost_mmu_enable_interrupts(struct panfrost_device *pfdev)
+{
+	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
+	mmu_write(pfdev, MMU_INT_MASK, ~0);
+}
+
 void panfrost_mmu_reset(struct panfrost_device *pfdev)
 {
 	struct panfrost_mmu *mmu, *mmu_tmp;
@@ -355,8 +361,7 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
 
 	spin_unlock(&pfdev->as_lock);
 
-	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
-	mmu_write(pfdev, MMU_INT_MASK, ~0);
+	panfrost_mmu_enable_interrupts(pfdev);
 }
 
 static size_t get_pgsize(u64 addr, size_t size, size_t *count)
@@ -973,6 +978,8 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 		return err;
 	}
 
+	panfrost_mmu_enable_interrupts(pfdev);
+
 	return 0;
 }
 

-- 
2.55.0

