Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A924A9D62
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273451; cv=pass; b=EMmDGJ+uhEHDhhM7SJDJ8Jr6K9gzuxGiDqwyUF8qcq2Re5oR1MnL3ZXdTo7sFvTmTCCya6MlAdJ5HnoXJPwkmqmIDKBx0HI8+phCTZLq70LEQg3w0lmfLHEDd6WQ6QNFTq7sGxOw53yNE6gtzknGL0y2kRHxXjAvngxCwbnniMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273451; c=relaxed/simple;
	bh=rGbyQBkNbY5a1OXBSal5Mure3AlHLFxQtfgc5Bhzvks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUwDZlVdWn1R/jp1bX6pIp0OqFupjzp1sNir8ATzh01bKxzOYN53iP40Nx1C/TFzQfg1wdTdpnO3XnsiiEEJWvO+zrXrxrOgD88bwJd8t0Xy4cZ4CDMclmfkkvmsZrIptuNxKic7ueru8QVu4rYUO8j0DInnMFk+NACKxEjrbyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Eb+Bogmd; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Eb+Bogmd"
ARC-Seal: i=1; a=rsa-sha256; t=1790273419; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QSEb7Y0izsvKaD8UVI6nSClfcVT2WsrPW1+TblKU+JV7OgMR6orydKJtOg6Pi33y7lkH6LLmIEcGijOcTUIKqZxVjCYV/5IJMq9sS+q4UOzta8RE1NhJ9CIE/aiXuWfxsy60/EKzqT3IliEtxiP5QISFztGM005NZrDn9HYbAX8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273419; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=; 
	b=KPV4zdGHC/kinmfwbGDamm4ba5NRXpQ8OLJrSFd8RWBZfjRxpBSr6VLFb/3MTTB7z18QvEk8NuOZzFStg1G3QpFuvNXuRXS26U55O4V552yxuREFi3Z4V8zeHXopBiiDL+dprNn7QY39d4uyt1nzLF/Wi053KPxthDUHkjpa/wM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273419;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=;
	b=Eb+Bogmdyo6aTVydEyjwhcelVkDjxEtk+Z1chcl7SH/cofdi9nm3kygcLOgGFx3F
	nsTnoI9x7GFUMQf4++RKwy24iyt+7p5+613oJY4p+pqaoGYgB9m7qO9mk8O05zewDKj
	f07j8VNxlFY+htxus3nAJH4kXiz9Thq8U9oaXAhg=
Received: by smtp.zohomail.com with SMTPS id 1790273418665543.5553975028979;
	Thu, 24 Sep 2026 11:10:18 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:24 +0100
Subject: [PATCH v10 07/15] drm/panfrost: Explicitly enable MMU interrupts
 at device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-7-755929b3cc19@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=rGbyQBkNbY5a1OXBSal5Mure3AlHLFxQtfgc5Bhzvks=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdZaJO1zNk4ZgtNB7zNOy6xgoSwpw8rlJ583
 YHF4+k/PH+JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWQAKCRAOJn5M7lND
 PV8tC/9cLSGtU7HpjiRjzTOTUpEImyzmb3cEBBV3UCqQLLVjWiWRXb5oSIFl1z8KxeYNSmB+HDt
 f22qbAfB+mmQOXeFB7QF9rGUMtPQqTZBrpVtaRotY1+EmMu+iju/vdxEH8h30xu7HmMIHmHMbPu
 +bKFtkVJyKOSVxq9ktIZqeebLZSv4+54BrYpf2tH442klDwzUPybBOzziG6DMmvauRtuGBOgBWY
 2fOs6vM7moYBLdAzmxGKFtfDU5D+5KyB9+l0H+OIyOazOBhTlrREmzZODUM05j0uV/Sg0A4Ht+/
 3vaVakLsLPWPD8jUoHeVdMAjB3NEf13gnADCwMB+PFFQ2O3vMElgtTP8/gNp+G9c8m6tVchYc75
 aRBHWacpkPMBlm3+IOfXgZc4LKvuw94rqJ4Zrjou7vwj1btqZy6edbWpaoh+iGTDkynudg6f84d
 Oi8C8wssPhlfWFI/U51mpCtePjvBielbK4A7axMICyhdiyG6OX/phXQ2zoghbQKfaIsF0=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Because the device must be in a position to accept jobs between the time
drm_dev_register() is called and autosuspend first kicks in, there's a very
narrow window inbetween during which jobs targeting the tiler buffer
object would time out, since the device's PM status is 'Active', but no MMU
interrupts were enabled at device initialisation time.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 73e467f60acd ("drm/panfrost: Consolidate reset handling")
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

