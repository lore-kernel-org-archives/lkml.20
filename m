Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354677;
	b=yxr6liC/mBHXLU974WBdkGZhwg0xiVijpre0Azw2uaPk1kCY2zvT058VnVHlBohO+Pi8
	 LHpu74VulNtOUZETw7HCaPPuuDvhm/ipZAd71QO8lE/pcDGSLZhHAqHArJFBdJdt1Gr6G
	 gUYNoCTZ+XKOWZyItlLw4Ft12FXC8NlGzlRfd/WG0w4oK+eLaNt6nJwJcg3hBdiX8Y3tf
	 y0GHAaIXnN/3/ExK4Z3rjMqQ+V6Z0q0PA+LLWM4PNi8WC0l9uZydK9L2orKn64fXkfh9N
	 ruBjhI+972VKk/+46va87y7Sq2TJLJC8e1/BylFcu2iH/yrsy0OJCzMlrjjxQpkCxYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354677;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aHS0E61Kph6Q/pBaWFFnfGbAScHIciE+DUMVzM9neGU=;
	b=H75ZA3TdEcmhB6WYtonVHn7hj4glbDj2SOd7oZtKeNkOVuz5Cy3tqnVeSEt062KQeyW7
	 ModCh4uUe4QQUsvyG+Uomw3BSqcx5P9gSFs0f6QqkENf4CdI8NPG09QVSBbh+f+6d+qLh
	 XY1BysKaeOPeSSnDEcGe8u27f5HDe/s8xjPrKUb6HXaYlJ5yg/27lWs567wgcWU78nloM
	 3hpF2FEvahpHgyi5qaG4XKgSOCTY3UUAwEwadF9BPUGrdaqsj2Xz4ktqzW+QmFI2VSOZA
	 aoLMAKc9FJZldxGiUuOY3KxeA9y1vlsHad7Jjwvr4gBNl7J88WsojneG2CiwGny8DuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMatZvXN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32804606A320;
	Fri, 30 Oct 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMatZvXN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38281F000C1;
	Fri, 30 Oct 2026 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354676;
	bh=aHS0E61Kph6Q/pBaWFFnfGbAScHIciE+DUMVzM9neGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZMatZvXNKfx3UtI5ikQYTnZ/i8O5oILYs7JTEIL9qApIPufs1/jrUNWv+zgKYA/R+
	 /Pt9CYU3OrwpuhE0nEgA2bKpa3gnp1bhsQX2xbNc3P9khYd5UZIf4acOe0Gpo8fEOI
	 zwUf4HV54StUh1dTP+A4MAr5d4xDCqbDXZn5D71+47Kt/Fce8DijhRjs8vO3yGy/BJ
	 QUVzYcNjy87p0EZyJ5Kuqk6gwhZM87LZnDqJG2c5Ih+pzl06G0myn4gJCX+XmnzAWe
	 Nwv+KrtJQNZttr2t5RrbPcjBPtbl9Qw06S9FNCqCB0gkFRJLxKIdtCOpgQ+adwfSsw
	 jzVrQ9ZZAw5xA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:03:57 +0100
Subject: [PATCH 1/8] drm/msm/a6xx: Polish up the IFPC counter enable
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
Message-Id: <20261030-topic-a6xx_ifpc-v1-1-6992841a9a32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793354666; l=2054;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zGQcK+J+SBHMgTyf0ctg/daR39bN/LxKk3PQqtasspk=;
 b=Kmux5S78PVK9IInJEBGACAy52ihHBk9ZBCDspTJwQBAurc+wVaaaFPf+0V3zCZsNmJqxy3g5a
 DhZMYtT2uZMBx16ngyx0A0rIP/0nLqJ0XpJnpylKGc9p1tHSG8lHMxm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Extend it to all targets with a real GMU and use a rmw instead of a
full write to preserve other things within that register.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 6 +++---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 92e8c8abb86d..48d3ee4d55d9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1332,10 +1332,10 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Turn on performance counters */
 	gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_CNTL, 0x1);
 
-	if (adreno_is_a7xx(adreno_gpu)) {
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Turn on the IFPC counter (countable 4 on XOCLK4) */
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1,
-			  FIELD_PREP(GENMASK(7, 0), 0x4));
+		gmu_rmw(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1,
+			GENMASK(7, 0), 0x4);
 	}
 
 	/* Select CP0 to always count cycles */
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index b3082738c99d..4f934c194f73 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -83,6 +83,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x1f84a" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L"/>
 	<reg32 offset="0x1f84b" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H"/>
 	<reg32 offset="0x1f84c" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L"/>
+	<reg32 offset="0x1fca8" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L" variants="A8XX-"/>
 	<reg32 offset="0x1f84d" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H"/>
 	<reg32 offset="0x1f84e" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L"/>
 	<reg32 offset="0x1f84f" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H"/>

-- 
2.56.0

