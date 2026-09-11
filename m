Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD341DE02
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169379; cv=pass; b=LrWDXUm+7iZZpZZgG0qhwVQ5xzbC6QxajHhR2uUWNt6rIF6M7u1Pn9w14LrHF1TNPn9g5LWp+xo+PytenkIdCXUCpyeoncLqbx37vC6Uokc9r7HcDWbPXRa9QyZUkl1QIEJAlpLW5cBNPsQ/+bVNLD6lEfUFq5q9r1Kvz3g8EHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169379; c=relaxed/simple;
	bh=1NC6JbP9YeSjejJ7XZFftPMwKC3c1jXoMn6zNAHeTm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpYHFs4ujKrzDD8VIuTr5hdki3Ts/09crgOZJrokTl5PePLMySzUpIcFWIiL/Lui9P0GADYPUYkKQxhiLuLfB6IOoysaMXgJWv+YB1AJhaCWYizYGP/mAG//QcLMF027BhhzIdoc5eHeXZkivl7xje5NMksgZuglvtL6jkVi4Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=kn7CxOkd; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kn7CxOkd"
ARC-Seal: i=1; a=rsa-sha256; t=1789169345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZL06sobkSxuSsOc2lsON98jpgOSoyac3RcX4zCwGO5NCvuPqqF8yxEofdSKRRmMYG4K1sWLcApGjUD4/JKBubFhVj+8x6POZ/L9O1RYflLP5+DzLIpqwetqt01w4D5qd8sPyPw33oPIhcMVz3ucl8A9ivJkQUG4rIRUc4hctsZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169345; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3zLgjT3JfLXHkpzJh4PbWNTcLr4FUqsFF57+vQ+BFbA=; 
	b=jshisZ1SnLRhDNL6xuYgz1joh6nJduQf7WjLxO7MNQPfLbWzzFVgkzmQMqGrPwJIMR+EGMWrMs3PsEJxbgEhqvSlq8uyuvXL1V4B7y5tsV7u0kDy94e2JwybtacyRC5+4d3OGDVjjeFnhi4YNqsnXXyyD1vgrjx2xX4ODRdmfj8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169345;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3zLgjT3JfLXHkpzJh4PbWNTcLr4FUqsFF57+vQ+BFbA=;
	b=kn7CxOkdYTjsvPgR+30lo2E+pXx/kmSaPX4Khs7YtXMZ5r9HuEGiN/0etIP5RLC4
	kMjYe6wukc4y4MtGmqvoHi1BpuPG/tjvvFseN7D4R1aD3MjWtuZmT03MWd40YsTwzbx
	8SI36mW2kZKyK4aGT0J6xtbca3z3xAsTED0kyexk=
Received: by mx.zohomail.com with SMTPS id 1789169344769128.9051513916445;
	Fri, 11 Sep 2026 16:29:04 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:12 +0100
Subject: [PATCH v9 11/16] drm/panfrost: Move perfcnt GPU disable sequence
 into a helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-11-e588feaa61ef@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2775;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=1NC6JbP9YeSjejJ7XZFftPMwKC3c1jXoMn6zNAHeTm0=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6EQ3dh7a2BFhNYtoesDCqXIH+okRFVS4gKC
 ADEkVJJLjeJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOhAAKCRAOJn5M7lND
 PT/sC/0UHyz/yFa5RT6Q5eumSqO3dgr1t1XrT7griOrvImEv3SIB0Ujtiekz58OFTRajoPXwiTD
 N1Yw7/tw42/aSMuMv3DcIPy8i8KhKhcqEWt+TOod+gOvnnHXsiEGJmnk1p20+q8UATLljPQS6QF
 pSdViaReMBttjo1Iid6gw9te/B1VP0IJABWKGlPAU6FLAHFOSqeXgoltnJhpZ0ULS7Wid4/qBHz
 tQh+2YQ5C526gReTDV6ciBsAzhf+1Rq7zXs6eAEh5MXqyac1ZyUp8I7pfxujikzes91DmDQkwTj
 Kw2YQXYB6jIZtzZD7Epu1le04ip2KPzWLkdHf/4YoqhJUpxGWztPt8iYBXDPqIuACYsk5PrYcRt
 CRmLhz0lcZ7Oibw/vgqhK2rhcvEuyRI8DS9pKd89tC6c2ThgJEb8nl2d7wlXKs6HQN9x+cxxn6u
 3jmHUyUXVlb1oK38sO4TV65LBGctoPyTVa8niNwRgQrCgdNLOHCBywSrU1jQilgui/64s=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Just for the sake of avoiding repetition.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 31 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 7020c0192e18..f71534e741b6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -35,6 +35,16 @@ struct panfrost_perfcnt {
 	struct completion dump_comp;
 };
 
+static void panfrost_perfcnt_hw_disable(struct panfrost_device *pfdev)
+{
+	gpu_write(pfdev, GPU_PERFCNT_CFG,
+		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
+	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0x0);
+	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0x0);
+	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0x0);
+	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
+}
+
 void panfrost_perfcnt_clean_cache_done(struct panfrost_device *pfdev)
 {
 	complete(&pfdev->perfcnt->dump_comp);
@@ -193,12 +203,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 	if (user != perfcnt->user)
 		return -EINVAL;
 
-	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0x0);
-	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0x0);
-	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0x0);
-	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
-	gpu_write(pfdev, GPU_PERFCNT_CFG,
-		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
+	panfrost_perfcnt_hw_disable(pfdev);
 
 	perfcnt->user = NULL;
 	drm_gem_vunmap(&perfcnt->mapping->obj->base.base, &map);
@@ -327,12 +332,7 @@ int panfrost_perfcnt_init(struct panfrost_device *pfdev)
 	perfcnt->bosize = size;
 
 	/* Start with everything disabled. */
-	gpu_write(pfdev, GPU_PERFCNT_CFG,
-		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
-	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
+	panfrost_perfcnt_hw_disable(pfdev);
 
 	init_completion(&perfcnt->dump_comp);
 	mutex_init(&perfcnt->lock);
@@ -344,10 +344,5 @@ int panfrost_perfcnt_init(struct panfrost_device *pfdev)
 void panfrost_perfcnt_fini(struct panfrost_device *pfdev)
 {
 	/* Disable everything before leaving. */
-	gpu_write(pfdev, GPU_PERFCNT_CFG,
-		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
-	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
+	panfrost_perfcnt_hw_disable(pfdev);
 }

-- 
2.55.0

