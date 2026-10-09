Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9F3E7635
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549308; cv=pass; b=dbKkZzryr+Er9FqhNFidYjCfdTJOOSLHb+/s0dBOJ2xQUuAb7ZsQeiVBWIYwGC4p68ItZlIY0FJuKgYtL/Xh6rceLB8VD5+/+YAzyuevmyAUtOMZVCi8y9HC2bBVpgvr8eynzQse07SxQo569E5doXmCBJfQsrsQr86graRYWzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549308; c=relaxed/simple;
	bh=VRla/9/j1ctQPKkQlCz/7b+MRbrWbY6Dgj2B2Pzm53s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olMEt8ompPhYIJSjf8xAIiDhU2ihmc/jGG1eDalI3cBbvbu/4qhxueQUk+R7bIchZVXfiagWYfhzfdjeIwGGh++IYDl3qrzs+ysWHDliJ/e8jqsBYd2yxm4KxdoCeEtmbGRiGkXQ6sdZRdipEpjlNL2UOFOEYq1ZB2Q8KwTTdvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=IDhGGhDK; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IDhGGhDK"
ARC-Seal: i=1; a=rsa-sha256; t=1791549279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TTgrlelX44J1g8iXpleatG0bLMAwO2G5PYnNxg3zLjoMtMottQMqCFZAVOZgUKGw6NhveYeW+WQHxvQiCor0tRszVTiOm2x7GSeNZ4AF1BcS93y6Guv3d6WON06tA4EzCIgeVys2NwMvIOVZwnyh4vCnnqcc31ZESIbAz5GLrLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549279; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ShEH6DLHKaOUBeOh6vzWeLYbnwZ5VEXVABDAJAv4pdw=; 
	b=LQKmrtFFqHDxMu80Hqa0wQd8y0LUyFB6WdKjYNLuhaGTW206x0Par+jM2HdkV+YEeMkbXBvFEpzaZvSy2bwsdrIQ3el2ZZ/LqHkShwBlAeffsuW0z3ynZAKmCSi4/qqjmbDZ30MO4N71HcaccSF0IlLVkFONfVXTtbyBzlQBcqg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549279;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ShEH6DLHKaOUBeOh6vzWeLYbnwZ5VEXVABDAJAv4pdw=;
	b=IDhGGhDKE8c4BfqYGrHiayEFkchfyKQGQYs5pkoTo9D2LbmdAkBT+CJ1s3Z+lNzj
	Q/47F+71dQUEWAdNN3SP11/r7FVVHIi3j8tmxgeah6XzlqOKLvmEqIjQCMSjrqixU0G
	3WkAYt6iRC9uqniniTMlrk1fC1xritxfzCufcqfc=
Received: by smtp.zohomail.com with SMTPS id 17915492782031001.7035613707259;
	Fri, 9 Oct 2026 05:34:38 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 09 Oct 2026 13:33:54 +0100
Subject: [PATCH v14 07/15] drm/panfrost: Explicitly enable MMU interrupts
 at device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-claude-fixes-v14-7-cb743b3b973b@collabora.com>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
In-Reply-To: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
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
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8u5bz0Mk8PoTUg1huv1XHwtf8FrUFjfotW7
 useNwSLB2KJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLgAKCRAOJn5M7lND
 PTAZC/9emK1CTRJABz0KJg+ZdZwDPGTcdcKieQ1XgLIaWIajcRHR3WBAlHSkwnVk7nS/s17t+ck
 BwnA9b4uNKTvQmdJx1ZGOTM/WRSAzH7s8V5OVgeu5FhzotvfiUZVolnb7LzxXAILICpDLn6958d
 81AlRVKGi/ZLsCgAXtLq5jPd/+h4+Ca3s9KdBcNtNniF1Mx3RoLOw4b4fcRQtYWeO2o4tFmoh1W
 tP0ifZJNQlJRQUB/7lr847AANeQS7fEIl4p8j5KdJGpL4xEzn6eMwdSjgTTr44gSbBkYWejlnzB
 DAXGxJcfCYAbX+9GpS3CJ2vCzdnuCZcJsEMTQr7vVOMhCjMrw6WbyImC9IkwpZFnkR0fxLDxrGJ
 icWEMyfVzEPCV9w2KHr9uePaaXPjf5ey5YpGeW3wbYKNttw2qkPY5sU2Dlcu261aRdMshr0/Bha
 on/vKsYk1SiUaGjfmY7VVj5UmB9hPm/ILD4ZlcEzmTs1vfjZebQ+zRlAYYzSMOajcTQVk=
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

