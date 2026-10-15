Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE4A5540A2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088581; cv=pass; b=FidEjf/RW0m7S1lY+ostrQKCSSNT5Lrn+Ceb1AfFO3vSCHYmBJQ5guCKXeCHQooZehlM7bLharMftDzzxZrgcH8ce3Dp2pfU4CbWAOL0IoTdWFmcy9lxrSt6dkR3tb3T6T8NgZp410zk1PeXR2IQEjtOFPKMghRrJwAXt0XXhrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088581; c=relaxed/simple;
	bh=bwtTOblSbVnMAAdrtBsany+vyX9EPd6Ci1VeaRlacdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=It676+jn9Gnbphsmw6U26XehWOMXp0ddGxZdpBzjNi7CQhvhlzZAAyb/h4GprbBmKA45Ss1LiMX+/ijHiY9TBTjTVGekabcavY8AcIUeXj+JI2zloC+s5zd2iLttBsoTk+EtCuRxiqjmMX2Yqp7/8wHtOn1XHvK28celEXpT/EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ZUCsRh4c; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZUCsRh4c"
ARC-Seal: i=1; a=rsa-sha256; t=1792088563; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=llMHVpI9KWmEkCkhxydhiDC7VGfETG2U/OfpbWnZVsNn9gMHZGYkH6UFrKSnA2iHpx38FhdRlFAH1W9nxI+B0xBa4jUlJvNGdXclZilhjJwsdLpZIAI5EHCT1jlof87M8MpToC9Y7USjF7an3bCseFR6juVwEGU+cWlmbz6easI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792088563; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yJdDUQPVa4y5ADqRyDKt6dn6YGuZIo0fYte+RwM2swU=; 
	b=lr1ufY3E/QwwEHQZJlweDUStjKn0W6hIS2nMsy0MOcsWCgrs1xlZMJ4LbBonwgHzBKMBUn2yalhmlC/Ttn42y7RWFU90Y/90ZGVopyC8wnZr6ur8BnBwevMoIR6rUTZBxXxPObR8BIVcivmJ8Bd0reooqFv7xr6VHSeO5piogLA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792088563;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=yJdDUQPVa4y5ADqRyDKt6dn6YGuZIo0fYte+RwM2swU=;
	b=ZUCsRh4c2Znl6FrUjAkch9U+MbE4DJacLQaMVyvPIDLW0WIhCaNbA7sEBCkPihw+
	h4HHSuLrBw6okYBMDg3Eddoawq8r7b6gzRI2HDVooFCUm+f3zN8XNtyTu9vg5Awyv8W
	IQCC+AuzK5q9VSgw3A2q/UiQeC6G98R3+hRYHaVk=
Received: by smtp.zohomail.com with SMTPS id 1792088561972670.2434922902952;
	Thu, 15 Oct 2026 11:22:41 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 15 Oct 2026 19:22:31 +0100
Subject: [PATCH 1/2] drm/panfrost: Enable cycle counting when perfcnt is
 enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-panfrost-reset-races-fixes-v1-1-bb74c1786a0b@collabora.com>
References: <20261015-panfrost-reset-races-fixes-v1-0-bb74c1786a0b@collabora.com>
In-Reply-To: <20261015-panfrost-reset-races-fixes-v1-0-bb74c1786a0b@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=34dmUZ5HQjdwJlYAAASH48+RySk5y82eB9ZXjWt8Jts=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBq0RnocH0TtRpwGuy50HvgVBoMWTL6mwnNJQL1R
 3xFp0Pr9KWJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCatEZ6AAKCRAOJn5M7lND
 PZJKC/4u3J5u5A72UYsx69YA0tiX3YJOc6RMEgssHCwBgf9BS3aOLUQeZpUhtOSIf4c9s4+OdSn
 jyArtX1vwUyVHs30zkBBlnawBqhFoc4hQr3w+pL/dGTTYUPOiRDCmoc14oERr3VyVzk/cNdGwTd
 xh+hUAahGEo+8T2e2OZo0QBvDd8iceRPdOTk1lW7g4+XNJI9DRIGwWuydffbBEzdfVG7f8ckSqE
 B8z2kKoDWu4hCkJ5xYA/KdxQ1wkbUEYHT4AT5GZCbI8yvCQGLc1Ts76uzkut+5baMeQKy6APYMm
 Y+K4YNWIJa7QM/FO2EhE8B9uwOTQ9M3MWqDKSYhwKZOk13Ws3Jm7WzuwilezICRlU2/BKKYUriy
 j/WyCkZs9tuo65Ehli/VUbfkgMF6UTUtc+ZwoQ58k8D+n2COmGOIzaW+BVAp2xBMwR1dPOSE7sN
 X6cDNvVZx+jFtrds4MlO6OVNLnM3d8OH4Wgir2Dqz5guFMWnM4lYOhkemEKn30mP8JS2I=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

From: Boris Brezillon <boris.brezillon@collabora.com>

If we don't do that, we end up with invalid timestamps in the block
headers.

Fixes: 7786fd108777 ("drm/panfrost: Expose performance counters through unstable ioctls")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index a9def452d5ef..b26da057a1a0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -17,6 +17,7 @@
 #include "panfrost_device.h"
 #include "panfrost_features.h"
 #include "panfrost_gem.h"
+#include "panfrost_gpu.h"
 #include "panfrost_issues.h"
 #include "panfrost_job.h"
 #include "panfrost_mmu.h"
@@ -52,6 +53,7 @@ static void panfrost_perfcnt_hw_disable(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
 
 	if (perfcnt->owns_as_ref) {
+		panfrost_cycle_counter_put(pfdev);
 		panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
 		perfcnt->owns_as_ref = false;
 	}
@@ -84,6 +86,7 @@ static int panfrost_perfcnt_hw_enable(struct panfrost_device *pfdev)
 		return ret;
 
 	perfcnt->owns_as_ref = true;
+	panfrost_cycle_counter_get(pfdev);
 
 	as = ret;
 	cfg = GPU_PERFCNT_CFG_AS(as) |

-- 
2.55.0

