Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC42399004
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020384; cv=none; b=OYbBYxuO40RsNNfncJFMjYEydtH3eNuKSoAaCFkULy1KKBDH0ox23ccWlVFYnRQTCfMlCYywjpeMpxODdVu2/VG6CyMtILTKj7BAhSv+bUFd/KNRVilbsKKf4qlMpm1JzlLEAHSK2Fdb6ISqk68Yf5NGCqU4TsCqWPLEYNRp7rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020384; c=relaxed/simple;
	bh=OKjVb6Qnd4TNBO62LPG+FD3Ol8efCNoK1xJpjgieTZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KjwAqyql26R/8iYaw0EEiL0O0ppzxYMvMmtjW/5KopUo2PuhWcYX/L8w26ddiabeQttOsGMHUL328yQScsjopGkNd7Z+jmj1BDNeGxhl+qiu7xuvNX743xUv7wf4iYW6xE/gwfgL+f4JOBs5I7wGYj0dZFnmBGKjYHRQ4V9AVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eHOvwfMH; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eHOvwfMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Qk
	3GrePbv9eu1xk5tupyIxeqhb2lAK9MbLxhiUca/KA=; b=eHOvwfMHvNGzeojbXg
	pZ2q3OeLtl52ICUnuVuobc+Zlea/ah83N8yyp69EuxLmM+MHsJfYHL9UGGlcKIQc
	LwK0Otq4fXpzCKAJBDt6SNx0WcV7XUMxO4HTOV0+XRzUYTqXJRfoBTdRq7lVwMBy
	JG88BRAvPOTO7HVuFt60BctrE=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHr60ezcBqgZmsCg--.23244S2;
	Sat, 03 Oct 2026 17:38:39 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Qiang Yu <yuq825@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eric Anholt <eric@anholt.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Andreas Baierl <ichgeh@imkreisrum.de>,
	Simon Shields <simon@lineageos.org>,
	Erico Nunes <nunes.erico@gmail.com>,
	dri-devel@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] drm/lima: Drain fence callbacks before destroying slab
Date: Sat,  3 Oct 2026 17:38:36 +0800
Message-Id: <20261003093837.545278-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDHr60ezcBqgZmsCg--.23244S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1kXr4UGF4DXr4Dury3Arb_yoWDArb_Kw
	43Wrn3Gw17GFnrK3ZrZrn3Wr9akasrZFZ5ZrnYvFWfKry7JF1UXw4jgr45Z34UJ3W2y3Zx
	tanFqFyrXr9F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMWrXtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR9Ff2rAzR+9BQAA3o

lima_fence_release() defers freeing fences from lima_fence_slab to an
RCU callback. The last lima_sched_slab_fini() can destroy the slab and
clear its pointer while a release callback is still queued. Module removal
can also free lima_fence_release_rcu() before that callback runs.

Drain outstanding callbacks before destroying the last fence slab.

Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 9a1e6b9ecbe5..9c5ff1929d3e 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -44,6 +44,7 @@ int lima_sched_slab_init(void)
 void lima_sched_slab_fini(void)
 {
 	if (!--lima_fence_slab_refcnt) {
+		rcu_barrier();
 		kmem_cache_destroy(lima_fence_slab);
 		lima_fence_slab = NULL;
 	}
-- 
2.34.1

