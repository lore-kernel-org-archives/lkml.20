Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53CC3F9F28
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169389; cv=pass; b=fq/1HBKqdhdIpo+C6Y/MYYaPvE7V8fNPR6J3oMT6UVXj7ofl8kolqN2nMtLq90dibyv0Af2WVLK5SvFM1bKwRIy+PvadayQLT9VDDkPg02zNLrs4AR0lhEXQJdMQQvdfWVTI/lz2Kb8mJzl7PktYD3WWp6Mgup6z0biL3+RO26E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169389; c=relaxed/simple;
	bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iqvc4mlmIo5HBhsqoKZoo0q8ZoKMnDu/N0mYKMMx9ql0iA/6ToCJ2YQXkelj/5oDPUI9xPRt2jwz1PIiKXWqVmEd+Tk5GfZaf8tUoyYypnaOWWEtl8XHNPHdB+I/rp/Gw98hpzWWaRcO1/XAcUOCmPwNHJ7Iw98QsmHvF4qdTnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FZVhEzzj; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FZVhEzzj"
ARC-Seal: i=1; a=rsa-sha256; t=1789169355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V0CFF1SATaZIhwV0XrvzAT3ctb3WJJLHUdm1dIJJ8+3ZI7riDuiAZnfs3jvACo7AXQHmT/KcQTI9YLgijt/Mav0mrJk1DG1sZ97IjIKfoWAenaXBcvjWDqxeRpgP44KZdbEtNTmoHgNf8IFheYGlG+VwCAQXe0EszF32IxHT5c4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169355; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=; 
	b=dqWiqpbiKzhc5W7SHhyyo1iAtIPBK9pQAY1y3HFLgdJoU7AEVVWDDBUYitoR/7D1sn8qTRR3X4etDpRVaB1hfqX9pLJIzWQXI0lDzYs/2SaJzcUhv2960O/BnBuDASrsl3pIJ1Z9fgIak5mmIMy5q3dTZYNz0XUHD5vuBPQRy0E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169355;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=;
	b=FZVhEzzjbTB4XDidKATgA2jw5xQa5buDLbrlYzUSvPl+SP71uBC6pWtlcOtH3W/x
	dumKi3oQkbjcHMXsmu8rCTm7TBooth1iSliKtrz/Evj5omfRsB1VBOyXwPl6XhfNEQN
	lrkmEItwVunIeUZnKWnN8hdgq4HwTnok6G9/FHCc=
Received: by mx.zohomail.com with SMTPS id 1789169354718810.8588496957029;
	Fri, 11 Sep 2026 16:29:14 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:14 +0100
Subject: [PATCH v9 13/16] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-13-e588feaa61ef@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6EHonsRbdMDzv+1uILpnvJFCF39Xnb8Przf
 n9GYVvC7WGJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOhAAKCRAOJn5M7lND
 PSexC/99KlQV3vqqYYKz9ZcwTtEnajUtKtzEyl4lHWgrEzQ0qvKcIhKW6Gt7OiAGim8ELGHNW0o
 I+ejxk5H8976RaoRs1MZbkTjxkk4TGOgWMKhvHlBRkkUf3SSLcgCr3krTmHiX4jJx41QgsD4wn9
 DaXmElSoCQHceK4m1OrgFsKbbdRLMOrtgUgrGw9IxLmwTXQO3AI/ww1jZgZtvDRaP7aIYJXkDck
 i49uULUZKYb4TULIHkNJPAzKDqp4iTT3TyuL4n3MGbuBZElhx7EOEZMIiWArIdRPUOf35mxLyle
 8Qs2hTsXnJZYXyLiBOP5aDQRkB7tDyCpxNX1j+Umc05+oLmIbhyhUW0Nw6X6scQmazWONud5WQJ
 a1tdU3Xisap5FN7oUX4EX41PPG/bO9fkvDauWl672Gy/FRhBZW/MSZCGt0csFtSFxzWQRr2pwW8
 II5QM7kJajay3E55dNS0oM4K3wmdJ0unsqTdWbYFfmX4k6tJU5b/rCeE7MoTjTgrtIuOA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

If the GPU and CPU are fully coherent, then there's no need to flush the
GPU caches after a perfcnt sample is made available.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
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

