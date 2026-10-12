Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5C49503C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816550; cv=pass; b=NTaxSM1Zo1WnmqPiijfEla6yNuK2Q44CkPYviUMC8is1EB1a3aFoxv8k/EX+MTbWsHVEOvQf7O9P7Oq76XO2/rJ5+P8aodiyT1aKEDuK476PCrxTlTFqRUUZLXSp+46/oXcmKObxX5ZklVbxjuurjIXuByKYWkm3HNs/2s2UGac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816550; c=relaxed/simple;
	bh=VRla/9/j1ctQPKkQlCz/7b+MRbrWbY6Dgj2B2Pzm53s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7jLvDEe7tDz/oRLBJT9z9HxEXvYe0m7rGg+pX/ikAz6Ol9EA/6oUKIg/FmrfJgfLeIWVC506+eFeLAynDtTGiX/p8D4Wi1eJInS3lL+1erme4hPEa9PHMFn1KtqAWk/R5UvOBu19HjkWTeDtvkQT+fSZLN+zXLWFtZJGXj3dZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=XFyh/Y7Q; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="XFyh/Y7Q"
ARC-Seal: i=1; a=rsa-sha256; t=1791816520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E2i5GqBvMV0nAE7o5ughBk4Vjgk+POyiZmheKdK4blPHMx8rKKOWk4z/OaKP4wtpmu9RkMce5qURBCmBDBAOOVVrdZb7mvZHD2i5EsQQeRoxpIDhCeZhLuwGpLCdR41G90bNsed1QrTXb7M0sf2Pv3eUJDYMGzD/osV9jOr9ibY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ShEH6DLHKaOUBeOh6vzWeLYbnwZ5VEXVABDAJAv4pdw=; 
	b=NWqMXfCveqxxuEp77bxsC+3/rC/NdEh4vEo+H2uqD1JkGabcyDgz9/WFdYFoTqoxwufvVY7HtUqxUTUdk502nFXJ311BOfxPBVeZHcQSUGfFPjzCpLj4jXtxBvOmy2bz1EgEvgHWJVqDpvsVfsYfGbgaRh8ScEamBRZhNiVcsQc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816520;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ShEH6DLHKaOUBeOh6vzWeLYbnwZ5VEXVABDAJAv4pdw=;
	b=XFyh/Y7Qvvql9sSYroBQL0DHxhxcd2r56Xefstv/qxwOui8MhzeUinJtkflMm4Ji
	W2qpodA6WCmA1L4SOs4R2aRP25+61DRLJ++qCktuIzLcHdxNHZryhzVw2dfZTzuMz8A
	E/+tBwoODhLENcdWIVV7IKB6hmgts5zdx6Zxhahk=
Received: by smtp.zohomail.com with SMTPS id 1791816518810799.0691997814432;
	Mon, 12 Oct 2026 07:48:38 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:47:59 +0100
Subject: [PATCH v15 07/15] drm/panfrost: Explicitly enable MMU interrupts
 at device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-7-bc0a6c498553@collabora.com>
References: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
In-Reply-To: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
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
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMalO+3/H7GJymWE6mVixkzf/fWuf6pWSV48
 nEWmjHvffSJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGgAKCRAOJn5M7lND
 PdJ6C/9k0mi9vpbxr81l7Du3OWpv6BRgYIahYFH8cjlZIjqMawg1o/2yrv6tZOkr8ks7mhDcbwT
 3zpqqjPuD7ivIzo62oQa9bo5xI9i1J0AB9QO3hWbrEsbPTQemZEYI3qfOBVJQczyj796sIDmL5U
 9q4H2OYaSCGTKIq/qMdOIAiehE1/GrmD9Arjg4NR21O/ZUUHshRRMqzJGzxSrpPYaQYwPzJ9gKf
 As6f+ZY5mWPIamQSCL7Z1MjCflej3XmeabshLkx+9EZsSTR3ttdNRU7/t0DsQDg6mJmmTcyBU/W
 gbvGNmf/FIuW2W+saEzEcVCaxPQvfg8IHocC6pDuDESWdZUwv3RyKIQIrmHcEMmshrIo/4mejQn
 OwWRrZ1jroYLb6QFLI2srqJHQLBe4YN6leQbHb+83tSsTKasqwSuZPTlYRmTa74XRVZYOI9An+S
 T3M3VrC9UaSb9VyIExqB0EBf5mI0QUhXgBGEUUbDebRl3Re5BY+1UjZyuNk7CKF09138I=
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

