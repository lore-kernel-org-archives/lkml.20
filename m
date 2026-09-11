Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFED41687D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169403; cv=pass; b=Qy936flZSoBUXL6n5SOs4jT+sUvjg9UAyy6StdQsfNLvjN8FiDMLab6upVSH5zEobdvopza7VbvFrVBg3C6uEL0dVhILOb6Bo2Fim7uLeI7UBgsCRx62FIfLBb9ujGQE79K1ysPh02GdpiHKD6aOwAgI9Hhue7fKClSVmAddKwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169403; c=relaxed/simple;
	bh=fcINJblJRb432SfE3VmHwqT0pqshFhBkvIiNxSLnr6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUsKipppniIBBmeOyBfCXVXtHerlAVGZdeM+/RdI8xm3XQBNGG5l1FX/bOZ4xv9ZOrZfqvzOn7k8oiVwBnwcsSAKWDBbBVtznZ3j8ypsLyv4iGHOrxnWMYFE5e1FqJLpfnlLHPOF1n2c0R7zynzctY6T+gCa5WqzHxSUm4wyim0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Qil0NfRB; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Qil0NfRB"
ARC-Seal: i=1; a=rsa-sha256; t=1789169369; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c1HJpCMxqj76FjX/BwQBnPxEuGAQVcRucYer2SXcpdkASPShtkWy2p3RgzFSpQA6BdUvpeLhz11XqadrrNeQnAgzgAg0r/SJ8oKVzfmbM2epojsmuNTYwBMrtwjUYH+F/ZopL1eargNVQgzkvHrvzQ2pYO53zXc+Gj2ugpkJjY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169369; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GiNAk1ddULmDOvtto/fkJvNwC9OGSrBfiGgPyvguuH0=; 
	b=NicFJskWlTminpbvN8maTefPtRCwalVqTi8temJfGs7KrI0yWoNyWmMIhj17fz8+GScaFLn5ByU4ybT9xnHaj3HsExyxSXkCjCWj9fNAvrz0vBjLBLPIYh1vjO6Q13W2oQcetEPO/ZMt7lT9mQfDEsqV0/SceQZvc/O37kAr8tg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169369;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GiNAk1ddULmDOvtto/fkJvNwC9OGSrBfiGgPyvguuH0=;
	b=Qil0NfRBPXCyLo01j3onMmh5QSOccHjd/AU802IBGaSU8t3YrUS4mgNEXLJDT438
	fhXxP/7RMjlBkfU/hTHwGAoByPLFbctZOIDWvohXswmT9Ly+S90+p6J4Y36El9WaSY6
	kuY9w7EkRgNzdcAvyfhzplVZ7zIatqS6K1YEHDJY=
Received: by mx.zohomail.com with SMTPS id 1789169369754575.6360293970592;
	Fri, 11 Sep 2026 16:29:29 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:17 +0100
Subject: [PATCH v9 16/16] drm/panfrost: Bump driver minor to reflect new
 DUMP IOCTL req field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-16-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
In-Reply-To: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=fcINJblJRb432SfE3VmHwqT0pqshFhBkvIiNxSLnr6s=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6ElqEcTErrviVL8e8PnP3zQaY4v+Vhjy/fq
 MZnkwI4UiuJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOhAAKCRAOJn5M7lND
 PfbkC/9SVd6tEbdV4G9I/cPb3krQRlNh8o20q9/JntDuPloCVFJIRgVp7x6VYvproQtw21quSSa
 xVJbC4kz3m0vR5RqS+BZ85VknRRlnLprdDIjrGmjci5PrE/XJL2rfpGQLwzQ3QqbOCwVc2h0dux
 OInL5HcE3hCASsOdpgVllj1XzyFjS+1dfoVesT3po7kJ/5ZDEdMVnSgQX3mzO0wfv4Ces4doGSR
 dJV10Bs+u/LuyzzoleGc8YtmD2hQTv1Hrs9r4kM+njeUbAB8LmPR7yCAF3GHZD3kkDmtZ088T6h
 ycsh7svg0D7tSKs4hojgj0PwuSI9DCRnEiGxlLvfaJ4HZoD+1X9W4bTyuS0V+S1VppKGLruZKNw
 pkPvBcIW2Gxv9na3z2Enl79Rr3rhcM/lbVEWV+/rh6eIloBsA0zHsyYl6HBZV+MmZj5q7LXkmBK
 mb7wuQsikU92KZbjR0FMcyZHQMmr8YDmR1hICy+x76YD9AYT4UmeIFfgRu7oZgq4nwngc=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Expose expanded PERFCNT_DUMP IOCTL interface to user mode.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 571a26b84126..de9b1c115181 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -808,6 +808,7 @@ static const struct file_operations panfrost_drm_driver_fops = {
  * - 1.6 - adds PANFROST_BO_MAP_WB, PANFROST_IOCTL_SYNC_BO,
  *	   PANFROST_IOCTL_QUERY_BO_INFO and
  *	   DRM_PANFROST_PARAM_SELECTED_COHERENCY
+ * - 1.7 - adds PERFCNT_DUMP req state field
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -820,7 +821,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
 	.major			= 1,
-	.minor			= 6,
+	.minor			= 7,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import	= panfrost_gem_prime_import,

-- 
2.55.0

