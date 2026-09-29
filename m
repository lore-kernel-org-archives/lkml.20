Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA9B3E7166
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653595; cv=pass; b=RnVPwbbwfetHqs2/6tTSTgo0o5tW+5W8t13l5UTCCiG5MQpbZV7UckbEXRP5nexxd4Fuqot+Z5Mo072e4/ky9fg5m64a+qEY+uo0BQuIWsw4OUETVvB6rb3R2b/T15TTV17uZa8NIokOmMAXXhYS/hE1V1BomhXCb1IBWBjerE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653595; c=relaxed/simple;
	bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ha5zH+cHXzE5K6KSUQqy99Z6wd27R9xlgRCCmNHwElPA0o00TIXuGOgyX1OZi5nT9zynNnnnqMx4TAAroJKnXgVwQzMKe5Q6mCAxGD7GP0RrnZ8ck9y5Q2DYZFcEpajvgjfuN5p8pY9jOAwJ6di6WpH4tdnU099pVlzrs3QjpeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=VLzAVsO9; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VLzAVsO9"
ARC-Seal: i=1; a=rsa-sha256; t=1790653566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C++LjakGZci5UryYE/ErIQT4T13hbB4tAG0dp/8/TxFPm3ivoA1B/g0ZS0quHwt1w6gtypfkGFjskGxpDKkqmgY4kWLcTfCfyT1802AUe9p6KLic2JryfD2r3weVgCRfiqrHZdSQ9RPiD6W7dHL1EUtUSRvHM5QkRaa4YyhA4Gk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790653566; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=; 
	b=jS/Gx/dZDYtmCqAFKCjwM30PwoWd0rignQeVIH3nz9K3U65VmMuHJgqNGYecxpSVbsqKb5VAwIfy3aREtqs4VQg8mZpF8vRRj6ZE+qFx/EGWsRdgB9OCp40Qalee+WCB1lxSbQLbar0lDdLrv/hOJvBlHHz6DdA9KkS7BO35fQU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790653566;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=;
	b=VLzAVsO96c1J1r1b7PDYAsFaW0s1H1M+NmYbanQHL5UvZRHJC2HulhqDkoui46PV
	EtZZp2hmj9+G8pJzKPJKJCjIJkR9OMKbLoXuklow0LVdxvv7CA/aecJDh7IEqop9Y41
	K5k+6exuVTMWTfpISXrPdrqWmTDmqLPQeF0LmuDE=
Received: by smtp.zohomail.com with SMTPS id 1790653566301199.01411181308197;
	Mon, 28 Sep 2026 20:46:06 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 29 Sep 2026 04:44:47 +0100
Subject: [PATCH v12 13/15] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-claude-fixes-v12-13-62beb08de207@collabora.com>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
In-Reply-To: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBquzQuMqiQErlTa4+RGlxQpa7jx7vKs6ocGuC+G
 p5ba2rBB7KJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCars0LgAKCRAOJn5M7lND
 PXSQC/9cxw7oS2+AHfpMkNZUqxFaxzdsyE2Bvshdjq6yfBY/rpc/95pdMyDhNm/WSdBsbOm2mab
 JTJIr5kD6oNCG6W1mqUF4gTayrvF8gzBFno33qCtiJZmCYjbDqf1eb/KyAeuOcNsd2RZNgKuXAc
 hxYP/HFHuFVqXp3Hl7dZ3HMLK3CPigu/iSaWeT1P+BuoEkg/lC0fXq3+pOuZLoP+WPKvijKMAAN
 qSSSiTrxXxH0vYhtExTpQS6AzWkKSIj9kK5c+PIhchBa2hiJs9Kyrt/wqNbImye6saj87Nns/md
 OXUyIGC+EmDr7d8f8Mgq/kWkrY8FOHH1c9fiAxElOK5LFJOEleXmIwmUffrX+zaGjNFx4vLYSGv
 iDxmgh/kK1EDvgQG7yvbRr5zEpLoGI7D51a8IYOnRYPdP7WGgPNLSa2sxD4/6x8lwSmr5Sr0Lk6
 S0iY4M2gFibUBtpomoyLdhr9mhzmPJGKt6pHM1hHJcjU+6R9E8dW0hok+wQOIPdpr8bjU=
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

