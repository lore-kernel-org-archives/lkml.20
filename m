Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E4440EB90
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812262; cv=pass; b=G5mvQwPaf/sUmGlb9s4dh0LYWZVR7iocXw4ld1gUtJSQIcnS602smGAUf7h0yd+8AWd4M5gnm995L7gCI9pQ7RKMC8XTx2dzmuG1J1NMqpIddaS8DeKNipeAtt0GMJC7GBfsGZ5I8niZb6d/9OibwAf7j4YsQS6Aep/TG+rBdg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812262; c=relaxed/simple;
	bh=rGbyQBkNbY5a1OXBSal5Mure3AlHLFxQtfgc5Bhzvks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtN/knVChU9gh2lFPJhPXD/YoP2QFbxHNf2Sis1FEqXA0Yr+2wxmBsmCSLfliquXhdQJ8KapPHVCR6xi0k9mEzdXx79z6jM9IwwyXHUyEekujXhC8f/snLGvT08eU3TQwK/ev7vHOq9vpqSTNHvdo0408XGnMruRBvaM3KIrn+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=OkYAS+er; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="OkYAS+er"
ARC-Seal: i=1; a=rsa-sha256; t=1788812225; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dYNKUAJqmY3Eb8hWS5x4V/J+yB1mCNh9e1m9iCc50kHCxZewqkTohNail6EEH/twJ2JJ5frw9PR6NklXj0iVxSGC+9e2kebO4+01yH7fN7IIX6wEkPHtZtYnWGBFPeDza81x5EjhnpqCj2fkafUFhSajRl7BWCET3PXAFJDDmNA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788812225; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=; 
	b=FSQN4vx7dhFnsQB/X3sDtJJWKkz7Wpe/fZUubbzbeF7hTXBz4d1Rgo+Kmpm7rJ/+5ATv4lfU1YD1sb3dwcx3Xduq/gEPo5Tg4A5jI6HveZ9S8E1Eg9j0hlVoxJ2Wg0JReTXyoAD0vfaZx9kwyAPqYdTQUxJhB8Xov8jI6izKUJE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788812225;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=;
	b=OkYAS+ers/VMJXAFdqndkqLfDC5sJXp33Ni8tcHxTOMVf4VUmN+I6gfX5zxxvRJd
	pmDqxDexYIRgIxn9F71tpTAH9jmZS8h/sl/hoG9EJExRd1gfGqWbfM8G3U7pET6QZ1T
	J8Wf3yzX6abaCN5CyWoEnW5E2zPwVJR6TPCLJy1g=
Received: by mx.zohomail.com with SMTPS id 1788812222585108.3592958177884;
	Mon, 7 Sep 2026 13:17:02 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 07 Sep 2026 21:16:16 +0100
Subject: [PATCH v8 07/16] drm/panfrost: Explicitly enable MMU interrupts at
 device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-claude-fixes-v8-7-c2bcb5e82184@collabora.com>
References: <20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com>
In-Reply-To: <20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com>
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
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqnxuLF0nluNX19rU6e8V3pONf/VzWK+9S3VHqT
 z4TNSxPaYKJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCap8biwAKCRAOJn5M7lND
 PcwEDACVEUHO8dvfooVtX1F1DJILBe/KymO2ZRBAWtouaFAsmGzeae5Xltbx4kfuaOYscHtsOwH
 jCenrLKzRUk9SvEb2OtBn8cTb5Sr1nSYY7NFbAxnfGndC8dPgpCQchSJFH7MBsXgPdxKnKPT3/a
 O+DjoKG8+lr1/qxBbxoUNxzWcoBcE03g40YDK0p/JEwZEqbkx4CdHZzc31wm1g1cbMKGWYQWFAJ
 Oq8ZdoOKpXmdrEnnz5uOY/NMY+GgDOD3YWvmZfjqvRhp4BGSBur0A2IfUXHoejGv5PoiC4x2N6X
 gPdwtLxd0BU7357BOOELbcO/fgc3hqPisLbMNOgGmr5qUGo90MHQ5N5oDMdWk89Wl5ThiKjRXed
 QJF7W3MmS2zBD98eYFH35Hr5HsChD/qeL7F8hs/y74On5NdVaqAvn3neZ0K8Ff7+Y5SxL2/1w6q
 EoL8jUx6dE94SVcx9KALmgeREatPILyBUh/IH/LLh673+AETDnvbnlFbStJQfJvnRY0t8=
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

