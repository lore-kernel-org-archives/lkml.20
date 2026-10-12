Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E348F024
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810029; cv=none; b=haj/nWYUBLl4ZAZL5HCevO817g6Cx/YzoE6QYn7u5WKxZoXMAe/p3RzfDFivbXlG7CMrhXXsIecLPmFXjc61Qf0S2wKA27dNUHy4T46dNKHf3j8aEC5wlM/R/IMML7JeLLwl5ev5JjtjUc9LZ2zRtyZuEIC7ZvOzQzbQVw2cPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810029; c=relaxed/simple;
	bh=TXs7Rp3RnFFjUrvjeGGky3CJeuzYOb/I1HnuQcLYukQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeDwIZ544UHj2k8bQ9GAmUkCH29tPifHgmVBqBK52Jls7GZQgtYGC4IUGPtKx06UCHtoJGWvSgJeA2ngRYuxnf8L/biBLpesY+1FAMKDZ6ukg2Pl6xpSEVJ84Jk8zANC9AqGYnhnt3iNbRyV/4H1RSRnv+V2x0nf873pYChWXoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dfTDtSXL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dfTDtSXL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FA791A00;
	Mon, 12 Oct 2026 06:00:24 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39AC13F66F;
	Mon, 12 Oct 2026 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791810027; bh=TXs7Rp3RnFFjUrvjeGGky3CJeuzYOb/I1HnuQcLYukQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dfTDtSXLZCJfkHBk1W5yZ5RaDQ1aVFlj+OC6hRCX2eKZvlZqPLQPYKyR+J3erlZH4
	 qZ0wAja+HmkVuYSh78nJS6tZuPa1YMLJhILvsAdilxBr+nsy67uxJ/+fynrc5AG+4m
	 CXxKed77tv81SppD1dsmn6gPkEsaQmFwovDexPow=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v4 12/12] drm/panthor: Bump version to expose protm feature
Date: Mon, 12 Oct 2026 14:59:40 +0200
Message-ID: <20261012125940.3291951-13-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125940.3291951-1-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bumps version to expose previously added:
- DRM_IOCTL_PANTHOR_PROTM_INIT ioctl
- DRM_PANTHOR_DEV_QUERY_PROTM_INFO query
- drm_panthor_group_create::protected_suspend_bo_handle

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index cc1c050ea3806..2da7bdb9a6bef 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1801,6 +1801,9 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
  * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
  *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
+ * - 1.10 - adds DRM_IOCTL_PANTHOR_PROTM_INIT ioctl
+ *        - adds DRM_PANTHOR_DEV_QUERY_PROTM_INFO query
+ *        - adds drm_panthor_group_create::protected_suspend_bo_handle
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1814,7 +1817,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 9,
+	.minor = 10,
 
 	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
 	.gem_prime_import = panthor_gem_prime_import,
-- 
2.43.0

