Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354681;
	b=n5v0Z1aMMjj7lR9eVsG+im6KPt3zxldIq/J8ehFCkHavryhHL9+qGE4VucgcuQGa0OTL
	 zHAbobC3XPSWnKV63ZizCFB7nbMOeitGjXEjcCQdO2ewsl6Oup4uEPJkae6uFL03M4TjP
	 zGKQdg0d3qR4JvOpELu7uBvUGZ7Kv8QRgwLxS0ZHiFA5N09hj0b5byhxVyWYYm31wsx/I
	 TVeH8RUGErKjWhSHHYtHjrXjnh6TkrlY52SXf9a6TiTE7K1vwPFpNsVioaZ0ZSTRC22LF
	 ZJ2ckA3ERvBdEOErADw4pK7oPrjIxVdup44s3I9s3IVbI9hYJsslXD5swro0pXfprqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354681;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fO0AO1ezML1ZvparvLGZsxHnWBCOQ1gQ8CStf/I59JA=;
	b=mXCVXsN6zvHLJtVxzUc1dbjaWm8ynFZgC9z+xsc1qb/Bd9OiM6CybkGy7yuai0RzDVHN
	 Qmg0H6r0n/2fNTC67Xiksm1tjRqyxKoODxiwScxg3VmrgOeFdamnOl27hldeZRrvXkJm3
	 CxH4fzvtMLcAOWZ1wN2wpGLu2snyHM1nlF5F/QLGzq+2TE3Qk+Uxoo8U/X2cSmO/GLKg3
	 zEOEgSA7/xIs+7RazRej68AedAD6qapB3E39uXEeUEszTDcmXFF7Vj9+o3CGbzg5zkbb1
	 aLQOnf6p0BSVYDom53zxBnkl/YNONF4zbMPM58Aqy2Z4APK5fvkn1XNNYMXeg13iVLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7yvG2V6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D9606A31C;
	Fri, 30 Oct 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7yvG2V6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC181F00A15;
	Fri, 30 Oct 2026 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354680;
	bh=fO0AO1ezML1ZvparvLGZsxHnWBCOQ1gQ8CStf/I59JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m7yvG2V6a9LDM3vmUc2xqLggBPZCYSe5YZ9Sf6vOqZT4FnUEHaH/rT2r6FGVw1YS1
	 RDlNZtbaTAX8z8/DP9XcMZd85nMS9pkqEi8KuOGKUV8jCx5gqV4fI29N7gRTkVAf6a
	 Sw0xBjhFB8lRq8RRNA0U/H/X62nvWN+sI+WGQN7mhYm/WPoKVJzTYlR351Lfo+uptg
	 g+NQT9Ov/X1cRINLZEKybBo/Lo7BLHK003VktMyRm0+DQKEO3bM13qPyIOM4Bev/ph
	 FOoBQtmRiKOAuQDt/Zy80TUv8lPcwcf+U9AbwMvSulqMfk+5aolZ7k+VgRPVghyeDb
	 xCSQVJIfB8yTw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:03:58 +0100
Subject: [PATCH 2/8] drm/msm/adreno: Register GPU debugfs only on the
 primary minor
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-topic-a6xx_ifpc-v1-2-6992841a9a32@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793354666; l=1617;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=f0rysbieKC2sAalawNQh6GSoQOPxzKQ6TMGwbEHZnbM=;
 b=rfHuaJLwKeVD9NfY3XbZbksMHnwfylga4ZO9Gim/sq9YaPlay8NioaPSXpd8xWM5ZSBvN5BlI
 i7UxuBG2ayRBz3sWtmoNy1Jx+fqf7DTBwkn5WScAigZiN2AsH93gSpG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

adreno_load_gpu() calls the GPU's debugfs_init hook for both the
primary and the render minor. Since the DRM debugfs rework both minors
share one debugfs root, so every file the hook creates is created
twice, and the second attempt fails with "already exists".

Since the DRM debugfs rework:(commit 0b30d57acafc ("drm/debugfs: rework
debugfs directory creation v5")) both minors share one root, and
commit e76e7ec8f162 ("drm/debugfs: drop debugfs_init() for the render
and accel node v2") made the core call a driver's debugfs_init only for
the primary minor. Adreno's second call predates that: commit
331dc0bc195b ("drm/msm: add a5xx specific debugfs") added it in 2017,
when each minor had its own debugfs root and the render node needed its
own copy of the files.

Remove the odd call to fix 'already exists' warnings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..8154371e04eb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -123,10 +123,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 #ifdef CONFIG_DEBUG_FS
-	if (gpu->funcs->debugfs_init) {
+	if (gpu->funcs->debugfs_init)
 		gpu->funcs->debugfs_init(gpu, dev->primary);
-		gpu->funcs->debugfs_init(gpu, dev->render);
-	}
 #endif
 
 	return gpu;

-- 
2.56.0

