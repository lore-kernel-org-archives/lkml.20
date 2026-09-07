Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32286419304
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812309; cv=pass; b=hd03Wfzw3kGqlbuwnDrvRm1Gno+hpuIfPMem5ED5PxVzY5jZCfwau1Hey/rSPe9ciKASDfWVIuqOfynXvpC6beHaOMcfcNBYMPyLydmdX978k5YQypdcdz4lwbyjBUrUEKYtcT4hZI75V7Uux5sn3EqvFtskRsgzfssqJdum9WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812309; c=relaxed/simple;
	bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3dxRd2emgStviht8uO50LFvW4lo3PHDW8/lDX4d0ffNVDVavNPE5Uw78pG44WoZZ/PgXniaGp8QvcmEDyO13q48FfBIh6UVrTxKInqdpsqCvp7OhbTJgcOnx6+9OkQbIq9UXqDKhuN7IKxqb+aUUWe89fs8NpLXm0Vok/hnhmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=KouGYzhX; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KouGYzhX"
ARC-Seal: i=1; a=rsa-sha256; t=1788812273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iqGmUPd3NYHfDsNs0S5IEuqQgG/+WH35dgOPaORy557zPSgFVEcaFM6LgJqlHEyL2xc17YInbAk+2j8fl3NQUyrJxTyJOvANzoUGfafbtGYZPrhE/TlcXGupEB66o7ffIUs4njl/Oa+rKd2H1Ssul2icTLQHKYGovnhEwK+fiEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788812273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=; 
	b=S4kct4LmvDlFpiv10SKJvb0riJJUnQLia0ZP9uoCdOZ3w8IKEAU0LB0VKSnGRKP1wHy57l30GAPLOWN1az9YRI6VWouTuwmnO9+YGIvvn4/Gpk+pAGa3W11ev0VStSD3WcnW73+o9d2dhkraP3bfcTQdo4C1BrnuzYKAi5AS3Bg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788812273;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rne2vTyla1RUI4gVDThBMRFsSeWjoijKTX5hYO0ZMA0=;
	b=KouGYzhX/i7h35u6Fa77v+9fi5PIKxLNaNvwDQd+8T2IDwY/Tg73PZlwTU1ndD8d
	oitSbLssBO6rWy0SEgIaC4KROXEIfesK7y8WLX7DKb5Bz9O8BPb4uyAn8wQHmvPof/8
	r1+hHfydk/yQ3tt3zNkGQMtEEP5Szk8mt/9omO88=
Received: by mx.zohomail.com with SMTPS id 1788812270652238.69801899306844;
	Mon, 7 Sep 2026 13:17:50 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 07 Sep 2026 21:16:22 +0100
Subject: [PATCH v8 13/16] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-claude-fixes-v8-13-c2bcb5e82184@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ylClgdA4qjN8YjgAXTrojrPeuTeRxcjN/yXHiltT8+A=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqnxuM4rLA8yYhDgAmlST/vT34bi8mFHGBb7Jer
 Gk5hzn+ez6JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCap8bjAAKCRAOJn5M7lND
 PSUvC/kB7OfTro6nzEnw21+jkSnM3DhhAE5ibOK/OyGQd/8Ltq4QqyqkJTu1JPyMy5dEF3JCtwk
 LloWOb3Y/BdBAEh6t+VO9/pg3MW33Knvx80bU0wlZ8oXkbOb5sRWWeAhro0pV3VH9K4Cp2ua8l0
 Od2igDPO7vLlEABonI0u4ANlE/TBKFhF+zHlpl+tZO/28EJEe09X6+fTDKRn+64GYAOcrd11FcK
 VSMW+jqyxeq4jpci3W0uroibThhEX4FAbfQUF2RW91qx1poFV45pzZq/6jdmIgWLwtiBiGFpLcU
 BQXk8rLGpcDEIyq7KPQI0fbIeyGU5HS5fyyQHj+TnDbKZdgNZMlGu/VHynehD2QsRwZ7GcOaEi0
 10f1cX4vXne+NIu4tQiXqm31AXSzeIXsloTK7XDK9MT7CNsTxk8Za0jXOEQOMedbSbkKhotrq74
 KI5qW6Dy0K02dkXUT7KLxUrsBc98JD4zZgyJ+bBt0QR0swxCMs4pyJTtQGwrNn314rx8k=
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

