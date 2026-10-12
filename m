Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3249B458
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816586; cv=pass; b=ibmEQgHypLKYUgfOauKl6gT2WtaixCquXqnKNXj1+02hRhax/tJF/TDuoFLltxzpaXlsp3rrpgztWKkFb6hK5aVd4ZdQRe41MpXgz1m8FhSn0+xrf74/3s4WvKFdx6Gif8+iKDZq1WpV/b5G/0qrhNE9ptNSuiYOt/zzNGR05QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816586; c=relaxed/simple;
	bh=n0Xb7x+5EOLF5WqM4LToZmyqgsrYoh+WYeTYPUQjIWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mmbTFQKyk8GjC9emMtGRRuRvwTJZTZqx4z5rvnrWdaYfMLhoEaPif+KoFrLfQNbJROsvB7Lk/bk+OmiwkXc2P+qVcUolWxF8qk4DZUdynh2mNk++ht/7MMbiWaUdoBb0q0HkfSwCLsSZvTEqL5/MIvpN777/r9aclVdQgABzv8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=enpiB3wR; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="enpiB3wR"
ARC-Seal: i=1; a=rsa-sha256; t=1791816560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HrvjCOEC621Lj66IBQr8AvZvmZB7FZThnZvOpVGlzDyQvsGkmI5Sv4Z6okenYLbWErys+OmyeUjkh1ijvB1eHzKyYWtwLj4dwTz/ydsZ9fqpeP90nJ7NaSqaPf7IObt/CJCRihLnG6qHzIzN1hN1bZT91sWwurYAMNM5iVkQtx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816560; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n7LLmX7fwJoNAhkMWdIEr6M9fWaQ3kE6c5cMXkSE36Y=; 
	b=EL2mL4unNDfgP9Vtt0mVlYiG4bqpI7kvwWmgiIu2Tr+Gbgtc4Nhl7Ag+yXciJsRdi0ZpPKNC8TdtcrQS6mhgcwXhx1Ke15ABP77PRK6o3mLS/jMVa0EXfg7GIzg/1yhJ0XpLCoHi7QR6mJJqM+dI0nhqdA/NGfNdx5+e6J5Jmx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816560;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=n7LLmX7fwJoNAhkMWdIEr6M9fWaQ3kE6c5cMXkSE36Y=;
	b=enpiB3wR3HOHBRtJlba62Ko+EKXJiifTikn9xBZRk9tFd9koaUX0En1+Bk6lwLZ5
	Z7DVXpsMjD/ZVzaUqIeNlA8+5+WlZObTO2u0k13PTJW2oeT1r1crpBN/9M9snT3iyBm
	C7jDf9HU6q3hILsM53sEcKGI2LaVUr7BmaztZKA8=
Received: by smtp.zohomail.com with SMTPS id 1791816558150144.61417515044297;
	Mon, 12 Oct 2026 07:49:18 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:48:05 +0100
Subject: [PATCH v15 13/15] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-13-bc0a6c498553@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=n0Xb7x+5EOLF5WqM4LToZmyqgsrYoh+WYeTYPUQjIWU=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMbHK5uwkP8qvP30ESa14sXjz3IZCm5Ftq+H
 K7oIL+O1hmJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGwAKCRAOJn5M7lND
 PQH3C/46ju6dkcHR11d7k0pMwAf9quw7b20MDioBRT6bEF1nlvdqfJdq402cjcmDXAiUuUT3v08
 5ul+r16lzgdJx3ncARtUzvjk3osf4nJCnPmIBZgbg7hDHY4OlAMSu8vc05ihz6ZJUEJdyjx9I6Y
 Esm3VpVLD5KkvWPRl6cBM4BI3UHFhWEaPq7EsV6jbkVvyZZhT0Di1HfsUV3eKtdgqexBH3EpvaO
 j1GORPK6Ch3bG5yO8FSuZ/uI+FlEFt7Ov0mUa6IykXI27dB165+HFBarn/e6gBQAyduU7XRL1q/
 7N5VUfCsBZ+qNvKkjX4QyiKdQ9NPl7PsmKh8jj6x7f1fpopD+3kr0TB+WR1OU6J3ofAp/vCp4AE
 UBIMb0LuZ0c+Uq0p8EXXSaDeFtu2yVcx8tI+sfGHh+0tj6WqBRma38h4h8XjdqfyAS1Y7ryasFU
 y1aHQiCh9oe1PonOStjW7ORmp7o3ZIWDV2EUZj3lGmawPFuoSRZ+IHnvRzxKsJvCiDu6I=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

If the GPU and CPU are fully coherent, then there's no need to flush the
GPU caches after a perfcnt sample is made available.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index ffc77121070e..b3f71d7fd82a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -52,7 +52,10 @@ void panfrost_perfcnt_clean_cache_done(struct panfrost_device *pfdev)
 
 void panfrost_perfcnt_sample_done(struct panfrost_device *pfdev)
 {
-	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
+	if (pfdev->features.selected_coherency != COHERENCY_ACE)
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
+	else
+		complete(&pfdev->perfcnt->dump_comp);
 }
 
 static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)

-- 
2.55.0

